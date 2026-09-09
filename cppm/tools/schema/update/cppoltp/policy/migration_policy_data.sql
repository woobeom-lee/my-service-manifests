-- 업데이트 수행시에만 처리 필요

-- (CWPP-4408) tb_server/tb_pg_server/tb_product_server 테이블 내 ip/public_ip 컬럼 타입 변경으로 인한 ip 정보 업데이트 처리
-- is_valid_ip 함수는 update_99999_cppoltp_function.sql에 존재
------------------------------------------------------------------------
select '## update server ip/public_ip START';
------------------------------------------------------------------------
UPDATE tb_server
SET ip = CASE WHEN is_valid_ip(ip) THEN host(ip::INET)::TEXT ELSE ip END
	, public_ip = CASE WHEN is_valid_ip(public_ip) THEN host(public_ip::INET)::TEXT ELSE public_ip END
;

UPDATE tb_pg_server
SET ip = CASE WHEN is_valid_ip(ip) THEN host(ip::INET)::TEXT ELSE ip END
;

UPDATE tb_product_server
SET ip = CASE WHEN is_valid_ip(ip) THEN host(ip::INET)::TEXT ELSE ip END
;
------------------------------------------------------------------------
select '## update server ip/public_ip END';
------------------------------------------------------------------------

------------------------------------------------------------------------
-- CWPP-5262 : 정책 > FW > 차단 IP 규칙 - 적용 규칙 옵션 관련 초기 데이터 추가
-- CWPP-6196 에서 위치 변경함
INSERT INTO
	tb_policy_hips_fw_block_ip_rule_apply_option (policy_id, all_rule_apply) 
VALUES 
	((SELECT policy_id FROM tb_policy WHERE product_feature_id ='HIPS_FW'::en_product_feature_id_type AND policy_type = 'DEFAULT'::en_policy_type), true::boolean)
ON CONFLICT (policy_id) 
DO NOTHING
;
------------------------------------------------------------------------

------------------------------------------------------------------------
select '## tb_common_policy';
------------------------------------------------------------------------
BEGIN;
DO $$
DECLARE
  v_site_auth_key             text := NULL;
BEGIN

  IF EXISTS ( SELECT 1 FROM tb_common_policy WHERE online_policy_data IS NOT NULL ) THEN

    SELECT sp_base64_decode(online_policy_data)::jsonb #>> '{main_service,main_server_info,site_auth_key}' INTO v_site_auth_key
    FROM tb_common_policy
    WHERE product_feature_id = 'AGENT_MGMT';

    PERFORM sp_set_mergeable_common_policy(v_site_auth_key);

  END IF;

END
$$ LANGUAGE 'plpgsql';
COMMIT;

------------------------->>> JSON 정책 migration <<<-------------------------
------------------------------------------------------------------------
select '## tb_policy(JSON 정책 마이그레이션 필요 프로시저 생성)';
------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.msp_jsonb_merge(source_data jsonb, target_data jsonb)
RETURNS jsonb
LANGUAGE SQL
AS $jsonb_merge_func$
 SELECT
 	CASE jsonb_typeof(source_data)
 		WHEN 'object' THEN
 			CASE jsonb_typeof(target_data)
	 			WHEN 'object' then
	 				(
	 				SELECT
	 					jsonb_object_agg(k,
	 						CASE
	 							WHEN e2.v IS NULL THEN e1.v
		 						WHEN e1.v IS NULL THEN e2.v
		 						WHEN e1.v = e2.v THEN e1.v
		 						ELSE msp_jsonb_merge(e1.v, e2.v)
							END)
					FROM
						jsonb_each(source_data) e1(k, v)
						FULL JOIN jsonb_each(target_data) e2(k, v) USING (k)
					)
				ELSE target_data
			END
		WHEN 'array' then
			array_to_json(array(select distinct jsonb_array_elements(source_data || target_data)))::jsonb
		ELSE target_data
	END
$jsonb_merge_func$;

------------------------------------------------------------------------
select '## tb_policy(JSON 정책 마이그레이션)';
------------------------------------------------------------------------
BEGIN;
DO $$
DECLARE
  v_policy_data RECORD;
  v_factory_online_policy_body text;
  v_factory_offline_policy_body text;

  v_merged_online_policy_body text;
  v_merged_offline_policy_body text;
BEGIN

  FOR v_policy_data IN
    SELECT
      "policy".policy_id AS policy_id
      , "policy".product_feature_id AS product_feature_id
      , "policy".online_policy_body AS online_policy_body
      , "policy".offline_policy_body AS offline_policy_body
    FROM
      tb_policy "policy"
    WHERE
      "policy".policy_type <> 'FACTORY'
      AND NOT EXISTS  -- V3 제품 관련 정책은 xml 이므로 여기서는 제외
			(
        SELECT
          1
        FROM
          tb_product p
          INNER JOIN tb_product_feature_map m ON m.product_id = p.product_id
        WHERE
          p.product_group = 'V3'
          AND p.product_id in ('V3NET_LU', 'V3NET_9.0')
          AND m.product_feature_id = "policy".product_feature_id
			)
  LOOP
    RAISE NOTICE 'Factory online policy [%].', v_policy_data.product_feature_id;

    BEGIN

      -- get online/offline policy body in factory
      SELECT
        online_policy_body, offline_policy_body INTO v_factory_online_policy_body, v_factory_offline_policy_body
      FROM
        tb_policy
      WHERE
        policy_type = 'FACTORY'
        AND product_feature_id = v_policy_data.product_feature_id;
      
      -- megerd policy data
      -- online
      v_merged_online_policy_body = msp_jsonb_merge(sp_base64_decode(v_factory_online_policy_body)::jsonb, sp_base64_decode(v_policy_data.online_policy_body)::jsonb);

      -- offline
      v_merged_offline_policy_body = msp_jsonb_merge(sp_base64_decode(v_factory_offline_policy_body)::jsonb, sp_base64_decode(v_policy_data.offline_policy_body)::jsonb);

      -- migration policy_body
      UPDATE
        tb_policy
      SET
        online_policy_body = sp_base64_encode(v_merged_online_policy_body::text)
        , offline_policy_body = sp_base64_encode(v_merged_offline_policy_body::text)
        , hash = MD5(CONCAT(v_merged_online_policy_body, v_merged_offline_policy_body)) || v_policy_data.policy_id
      WHERE
        policy_id = v_policy_data.policy_id;
    END;
  END LOOP;
EXCEPTION
  WHEN others THEN
    NULL;
END
$$ LANGUAGE 'plpgsql';
COMMIT;


------------------------->>> XML 정책 migration <<<-------------------------
------------------------------------------------------------------------
select '## XML 정책 마이그레이션 시 필요 프로시저';
------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION msp_xml_policy_data(i_policy_data xml)
    RETURNS TABLE(parent_name text, name text, level integer, attr_name text, attr_value text, xml_parents text, xml_path text, xml_attr_path text, xml_text text, xml_data text)
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN

RETURN QUERY
    WITH RECURSIVE wt_xml_info AS (
      SELECT ''::xml AS parent_name
          , n.name
          , 1 AS level
          , '/' AS xml_parents
          , '/' || n.name || '/' AS xml_path
          , i_policy_data AS xml_data
      FROM UNNEST(xpath('name(/*)', i_policy_data)) WITH ORDINALITY AS n(name, i)
      UNION ALL
      SELECT wt.name AS parent_name
          , n.name
          , wt.level + 1 AS level
          , wt.xml_path AS xml_parents
          , wt.xml_path || n.name || '/' AS xml_path
          , x.xml_data
      FROM wt_xml_info AS wt
          , UNNEST(xpath('/' || wt.name || '/*', wt.xml_data)) WITH ORDINALITY AS x(xml_data, i)
          , UNNEST(xpath('name(/*)', x.xml_data)) WITH ORDINALITY AS n(name, i)
    )
    SELECT wt.parent_name::text
        , wt.name::text
        , wt.level
        , an.attr_name::text
        , av.attr_value::text
        , wt.xml_parents
         , wt.xml_path
         , wt.xml_path || an.attr_name || '/' AS xml_attr_path
         , t.xml_text::text
        , wt.xml_data::text
    FROM wt_xml_info AS wt
    LEFT JOIN UNNEST(xpath('/' || wt.name || '/text()', wt.xml_data)) WITH ORDINALITY AS t(xml_text, i) ON regexp_replace(t.xml_text::text, '\s+', '', 'g') <> ''
    LEFT JOIN UNNEST(xpath('/' || wt.name || '/@*', wt.xml_data)) WITH ORDINALITY AS av(attr_value, i) ON TRUE
    LEFT JOIN UNNEST(xpath('name(/' || wt.name || '/@*[' || av.i || '])', wt.xml_data)) WITH ORDINALITY AS an(attr_name, i) ON TRUE;

END;
$$;



CREATE OR REPLACE FUNCTION msp_xml_policy_diff_data(i_new_policy text, i_old_policy text)
    RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_new_policy                xml := null;
  v_old_policy                xml := null;
BEGIN

  BEGIN
    v_new_policy := sp_base64_decode(i_new_policy)::xml;
    v_old_policy := sp_base64_decode(i_old_policy)::xml;
  EXCEPTION
    WHEN OTHERS THEN
      v_new_policy := null;
      v_old_policy := null;
  END;

  DROP TABLE IF EXISTS tb_policy_new;
  DROP TABLE IF EXISTS tb_policy_old;
  DROP TABLE IF EXISTS tb_policy_diff;

  IF v_new_policy IS NULL OR v_old_policy IS NULL THEN

    RETURN false;

  ELSE

    -- 신규 정책
    CREATE TEMP TABLE tb_policy_new AS
      SELECT p.parent_name, p.name, p.level, p.attr_name, p.attr_value, p.xml_parents, p.xml_path, p.xml_attr_path, p.xml_text, p.xml_data
      FROM msp_xml_policy_data(v_new_policy) AS p;

    -- 과거 정책
    CREATE TEMP TABLE tb_policy_old AS
      SELECT p.parent_name, p.name, p.level, p.attr_name, p.attr_value, p.xml_parents, p.xml_path, p.xml_attr_path, p.xml_text, p.xml_data
      FROM msp_xml_policy_data(v_old_policy) AS p;

    CREATE TEMP TABLE tb_policy_diff AS
      SELECT pn.parent_name
        , pn.name
        , pn.level
        , pn.attr_name
        , pn.attr_value
        , pn.xml_parents
        , pn.xml_path
        , pn.xml_attr_path
        , pn.xml_text
        , pn.xml_data
      FROM tb_policy_new AS pn
      WHERE NOT EXISTS (
        SELECT 1
        FROM tb_policy_old AS po
        WHERE po.xml_path = pn.xml_path
          AND COALESCE(po.xml_attr_path, '') = COALESCE(pn.xml_attr_path, '')
    );

    RETURN ((SELECT COUNT(1) FROM tb_policy_diff) > 0);

  END IF;

END;
$$;



CREATE OR REPLACE FUNCTION msp_xml_policy_merge_data(i_policy_body text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_policy_body               xml := null;
  v_policy_mrege_data         text := '';
  v_level                     integer;
  v_child_xml_list            text;
  v_xml_element               RECORD;
  v_abnormal_array_name       text[] := ARRAY['NETRULE','APPRULE']; --중복 되었다고 간주 한다.
  v_repeat_ele_count          integer;
BEGIN

  BEGIN
    v_policy_body := sp_base64_decode(i_policy_body)::xml;
  EXCEPTION
    WHEN OTHERS THEN
      v_policy_body := null;
  END;

  IF v_policy_body IS NULL THEN

    v_policy_mrege_data := '';

  ELSE
    DROP TABLE IF EXISTS tb_policy_merged;

    CREATE TEMP TABLE tb_policy_merged AS
      SELECT p.parent_name
         , p.name
         , p.level
         , p.attr_name
         , p.attr_value
         , p.xml_parents
         , p.xml_path
         , p.xml_attr_path
         , p.xml_text
         , p.xml_data
         , '' AS xml_child_data
         , false AS is_repeatable
         , ROW_NUMBER() OVER() AS row_num
      FROM msp_xml_policy_data(v_policy_body) AS p
      UNION ALL
      SELECT pd.parent_name
         , pd.name
         , pd.level
         , pd.attr_name
         , pd.attr_value
         , pd.xml_parents
         , pd.xml_path
         , pd.xml_attr_path
         , pd.xml_text
         , pd.xml_data
         , '' AS xml_child_data
         , false AS is_repeatable
         , (ROW_NUMBER() OVER()) + 1000 AS row_num
      FROM tb_policy_diff AS pd;
     
     -- 특정 엘리먼트 중복은 무조건 제거 처리(CWPP-2176, CWPP-2873, CWPP-2056)
     DELETE FROM tb_policy_merged
     WHERE EXISTS (
        SELECT 1
        FROM (
          SELECT
            ROW_NUMBER() OVER (PARTITION BY temp.xml_parents, temp.xml_path, temp.xml_attr_path ORDER BY temp.row_num ASC) AS rn
    		  	, *
	    	  FROM tb_policy_merged AS temp
	    	  WHERE
		      	temp."name" IN ('CPU','MEM','LIMIT','EXTRA','SELFPROTECT')
		    ) AS target
		    WHERE
			    target.row_num = tb_policy_merged.row_num
			  AND target.rn > 1
      );
    
    RAISE NOTICE 'delete specific xml element(CPU,MEM,LIMIT,EXTRA,SELFPROTECT)';

    -- xml element 가 중복인지 아닌지 판단을 한다.
    WITH wt_xml_duplicate_key_list AS (
      SELECT DISTINCT p.xml_parents, p.xml_path, p.xml_attr_path
      FROM (
        SELECT t.xml_parents, t.xml_path, t.xml_attr_path
           , ROW_NUMBER() OVER (PARTITION BY t.xml_parents, t.xml_path, t.xml_attr_path ORDER BY t.xml_data) AS row_num
        FROM tb_policy_merged AS t
      ) AS p
      WHERE p.row_num > 1
      UNION
      SELECT DISTINCT t.xml_parents, t.xml_path, t.xml_attr_path
        FROM tb_policy_merged AS t
        JOIN (SELECT abnormal_name FROM UNNEST(v_abnormal_array_name) AS t(abnormal_name)) ab
          ON t.name LIKE ab.abnormal_name || '%'
    )
    UPDATE tb_policy_merged p
      SET is_repeatable = TRUE
    FROM wt_xml_duplicate_key_list AS wt
    WHERE wt.xml_parents = p.xml_parents
      AND wt.xml_path = p.xml_path
      AND (wt.xml_attr_path = p.xml_attr_path OR p.xml_attr_path IS NULL);

    -- xml Element 를  생성
    WITH wt_update_xml_data AS (
      SELECT p.parent_name
          , p.name
          , p.xml_path
          , p.level
          , '<' || p.name || COALESCE(' ' || STRING_AGG(p.attr_name || '="' || p.attr_value || '"', ' '), '') || '>' AS xml_data
      FROM tb_policy_merged AS p
      WHERE p.is_repeatable = FALSE
      GROUP BY p.parent_name, p.name, p.xml_path, p.level
    )
    UPDATE tb_policy_merged p
      SET xml_data = wt.xml_data
    FROM wt_update_xml_data AS wt
    WHERE wt.parent_name = p.parent_name
      AND wt.name = p.name
      AND wt.xml_path = p.xml_path
      AND wt.level = p.level;

   RAISE NOTICE 'create unrepeatable xml elements';
  
    WITH wt_update_xml_data AS (
      SELECT p.parent_name
         , p.name
         , p.xml_path
         , p.level
         , '<' || p.name || COALESCE(' ' || STRING_AGG(p.attr_name || '="' || p.attr_value || '"', ' '), '') || '>' AS xml_data
      FROM tb_policy_merged AS p
      WHERE p.is_repeatable = TRUE
      GROUP BY p.parent_name, p.name, p.xml_path, p.level
    )
    UPDATE tb_policy_merged p
       SET xml_data = CASE WHEN STRPOS(p.xml_data,'/>') = 0 THEN SUBSTR(p.xml_data, 1, STRPOS(p.xml_data,'>')-1) ELSE SUBSTR(p.xml_data, 1, STRPOS(p.xml_data,'/>')-1 ) END || '>'
      FROM wt_update_xml_data AS wt
    WHERE wt.parent_name = p.parent_name
      AND wt.name = p.name
      AND wt.xml_path = p.xml_path
      AND wt.level = p.level;
   
    RAISE NOTICE 'create repeatable xml elements';
  

    WITH wt_index_list AS (
      SELECT t.xml_parents, t.xml_path, t.xml_data, t.row_num
             , ROW_NUMBER() OVER (PARTITION BY t.xml_parents, t.xml_path, t.xml_data, t.xml_text ORDER BY t.row_num) AS rn
      FROM tb_policy_merged AS t
    )
    UPDATE tb_policy_merged p
      SET row_num = wt.rn
    FROM wt_index_list AS wt
    WHERE wt.row_num = p.row_num;

    DELETE FROM tb_policy_merged WHERE row_num > 1;

    SELECT MAX(level) INTO v_level FROM tb_policy_merged;
    
    RAISE NOTICE 'merge elements in loop. level [%].', v_level;
  
    WHILE v_level > 1 LOOP
	 RAISE NOTICE 'merging elements level [%].', v_level;  
      
	 WITH wt_xml_data_list AS (
        SELECT xi.xml_parents
            , COALESCE(STRING_AGG(DISTINCT xi.xml_data, ''), '') AS xml_data
        FROM (
          SELECT xi.xml_parents
              , xi.xml_data || COALESCE(xi.xml_text, '') || '</' || xi.name || '>' AS xml_data
          FROM tb_policy_merged AS xi
          WHERE xi.level = v_level
        ) AS xi
        GROUP BY xi.xml_parents
      )
      UPDATE tb_policy_merged mp
        SET xml_child_data = wt.xml_data
      FROM wt_xml_data_list AS wt
      WHERE wt.xml_parents = mp.xml_path;
      
     
      BEGIN
	    WITH wt_xml_data_list AS (
        SELECT xi.xml_parents, xi.parent_name , xi.name
        FROM (
                 SELECT xi.xml_parents, xi.parent_name, xi.name
                 FROM tb_policy_merged AS xi
                 WHERE xi.level = v_level
                   AND  xi.is_repeatable = TRUE
             ) AS xi
        GROUP BY xi.xml_parents, xi.parent_name, xi.name
        )
        UPDATE tb_policy_merged mp
           SET xml_child_data = SUBSTRING(v_policy_body::text
             , STRPOS(v_policy_body::text, wt.name) -1
             , STRPOS(v_policy_body::text, wt.parent_name || '>') - STRPOS(v_policy_body::text, wt.name) -1)
          FROM wt_xml_data_list AS wt
        WHERE wt.xml_parents = mp.xml_path;
      EXCEPTION
      WHEN others THEN
        NULL;
      END;
    	 
      v_level := v_level - 1;

      UPDATE tb_policy_merged
        SET xml_data = xml_data || xml_child_data
      WHERE level = v_level
        AND COALESCE(xml_child_data, '') <> ''
       ;
    END LOOP;


    SELECT '<?xml version="1.0" encoding="UTF-8"?>' || p.xml_data || '</' || p.name || '>' INTO v_policy_mrege_data
    FROM tb_policy_merged AS p
    WHERE p.level = 1;

  END IF;
  RAISE NOTICE 'return a policy_mrege_data.';
  RETURN v_policy_mrege_data;

END;
$$;

------------------------------------------------------------------------
select '## tb_policy(XML 정책 마이그레이션)';
------------------------------------------------------------------------
BEGIN;
DO $$
DECLARE
  v_factory                   RECORD;
  v_policy                    RECORD;

  v_is_diff                   boolean;
  v_policy_body               text;
BEGIN

  -- 온라인 정책 마이그레이션
  FOR v_factory IN
    SELECT p.product_feature_id
        , p.online_policy_body AS new_policy_body
        , (SELECT pb.online_policy_body
            FROM tb_policy_backup AS pb
            WHERE pb.product_feature_id = p.product_feature_id
              AND pb.policy_type = 'FACTORY'
            ORDER BY pb.backup_id DESC LIMIT 1) AS old_policy_body
        , (p.offline_policy_body IS NOT NULL) AS exist_offline
    FROM tb_policy AS p
    JOIN tb_product_feature_map AS pfm ON p.policy_type = 'FACTORY'
        AND pfm.product_feature_id = p.product_feature_id
    JOIN tb_product AS pr ON pfm.product_id = pr.product_id AND pr.product_group = 'V3'
    WHERE EXISTS (
        SELECT 1
        FROM tb_policy_backup AS pb
        WHERE pb.product_feature_id = p.product_feature_id
          AND pb.policy_type = 'FACTORY'
      )
  LOOP
    RAISE NOTICE 'Factory online policy [%].', v_factory.product_feature_id;

    BEGIN
      v_is_diff := msp_xml_policy_diff_data( v_factory.new_policy_body, v_factory.old_policy_body );
      IF v_is_diff = true THEN
        -- 온라인 정책 적용 시작
        FOR v_policy IN
          SELECT p.policy_id, p.online_policy_body, p.offline_policy_body
          FROM tb_policy AS p
          WHERE p.product_feature_id = v_factory.product_feature_id
            AND p.policy_type <> 'FACTORY'
          ORDER BY p.policy_id
        LOOP
          RAISE NOTICE 'Online policy [%_%].', v_factory.product_feature_id, v_policy.policy_id;

          v_policy_body := msp_xml_policy_merge_data( v_policy.online_policy_body );
          IF LENGTH(v_policy_body) > 0 THEN 
            UPDATE tb_policy
              SET online_policy_body = sp_base64_encode(v_policy_body)
                , hash = MD5(CONCAT(v_policy_body, sp_base64_decode(offline_policy_body))) || policy_id
                , modified_time = now()
            WHERE policy_id = v_policy.policy_id;
          END IF;

          IF v_factory.exist_offline = false THEN
            RAISE NOTICE 'Offline policy [%_%].', v_factory.product_feature_id, v_policy.policy_id;

            v_policy_body := msp_xml_policy_merge_data( v_policy.offline_policy_body );
            IF LENGTH(v_policy_body) > 0 THEN
              UPDATE tb_policy
                SET offline_policy_body = sp_base64_encode(v_policy_body)
                  , hash = MD5(CONCAT(sp_base64_decode(online_policy_body), v_policy_body)) || policy_id
                  , modified_time = now()
              WHERE policy_id = v_policy.policy_id;
            END IF;
          END IF;
        END LOOP;
      END IF;
    EXCEPTION
      WHEN others THEN
        NULL;
    END;
  END LOOP;


  -- 오프라인 정책 적용 시작
  FOR v_factory IN
    SELECT p.product_feature_id
        , p.offline_policy_body AS new_policy_body
        , (SELECT pb.offline_policy_body
            FROM tb_policy_backup AS pb
            WHERE pb.product_feature_id = p.product_feature_id
              AND pb.policy_type = 'FACTORY'
            ORDER BY pb.backup_id DESC LIMIT 1) AS old_policy_body
    FROM tb_policy AS p
    JOIN tb_product_feature_map AS pfm ON p.policy_type = 'FACTORY' AND p.offline_policy_body IS NOT NULL
        AND pfm.product_feature_id = p.product_feature_id
    JOIN tb_product AS pr ON pfm.product_id = pr.product_id AND pr.product_group = 'V3'
    WHERE EXISTS (
        SELECT 1
        FROM tb_policy_backup AS pb
        WHERE pb.product_feature_id = p.product_feature_id
          AND pb.policy_type = 'FACTORY'
      )
  LOOP
    RAISE NOTICE 'Factory offline policy [%].', v_factory.product_feature_id;

    IF v_factory.old_policy_body IS NOT NULL THEN

      BEGIN
        v_is_diff := msp_xml_policy_diff_data( v_factory.new_policy_body, v_factory.old_policy_body );
        IF v_is_diff = true THEN
          -- 오프라인 정책 적용 시작
          FOR v_policy IN
            SELECT p.policy_id, p.offline_policy_body
            FROM tb_policy AS p
            WHERE p.product_feature_id = v_factory.product_feature_id
              AND p.policy_type <> 'FACTORY'
            ORDER BY p.policy_id
          LOOP
            RAISE NOTICE 'Offline policy [%_%].', v_factory.product_feature_id, v_policy.policy_id;

            BEGIN
              v_policy_body := msp_json_policy_mrege_data( v_policy.offline_policy_body );
              IF LENGTH(v_policy_body) > 0 THEN
                UPDATE tb_policy
                  SET offline_policy_body = sp_base64_encode(v_policy_body)
                    , hash = MD5(CONCAT(sp_base64_decode(online_policy_body), v_policy_body)) || policy_id
                    , modified_time = now()
                WHERE policy_id = v_policy.policy_id;
              END IF;
            EXCEPTION
              WHEN others THEN
                NULL;
            END;
          END LOOP;
        END IF;
      EXCEPTION
        WHEN others THEN
          NULL;
      END;

    ELSE

      -- 오프라인 정책 적용 시작
      FOR v_policy IN
        SELECT p.policy_id, p.offline_policy_body
        FROM tb_policy AS p
        WHERE p.product_feature_id = v_factory.product_feature_id
          AND p.policy_type <> 'FACTORY'
        ORDER BY p.policy_id
      LOOP
        RAISE NOTICE 'Offline policy [%_%].', v_factory.product_feature_id, v_policy.policy_id;

        BEGIN
          v_is_diff := msp_xml_policy_diff_data( v_factory.new_policy_body, v_policy.offline_policy_body );
          IF v_is_diff = true THEN
            v_policy_body := msp_xml_policy_merge_data( v_policy.offline_policy_body );
            IF LENGTH(v_policy_body) > 0 THEN
              UPDATE tb_policy
                SET offline_policy_body = sp_base64_encode(v_policy_body)
                  , hash = MD5(CONCAT(sp_base64_decode(online_policy_body), v_policy_body)) || policy_id
                  , modified_time = now()
              WHERE policy_id = v_policy.policy_id;
            END IF;
          END IF;
        EXCEPTION
          WHEN others THEN
            NULL;
        END;
      END LOOP;
    END IF;
  END LOOP;

END
$$ LANGUAGE 'plpgsql';
COMMIT;

------------------------------------------------------------------------
select '## remove function(마이그레이션시 사용한 함수 제거)';
------------------------------------------------------------------------
DROP FUNCTION IF EXISTS msp_jsonb_merge(source_data jsonb, target_data jsonb);
DROP FUNCTION IF EXISTS msp_xml_policy_data(i_policy_data xml);
DROP FUNCTION IF EXISTS msp_xml_policy_diff_data(i_new_policy text, i_old_policy text);
DROP FUNCTION IF EXISTS msp_xml_policy_merge_data(i_policy_body text);
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
