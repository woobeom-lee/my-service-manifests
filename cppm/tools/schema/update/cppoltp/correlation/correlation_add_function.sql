--------------------------------------------------------------------------------------------------------
-- correlation - table, function, view
--------------------------------------------------------------------------------------------------------
	
------------------------------------------------------------------------------------------
-- table
------------------------------------------------------------------------------------------
select '## tb_correlation_result';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_correlation_result ();
    COMMENT ON TABLE tb_correlation_result IS '연계규칙 결과';

    ALTER TABLE IF EXISTS tb_correlation_result ADD COLUMN IF NOT EXISTS correlation_rule_id bigint;
    ALTER TABLE IF EXISTS tb_correlation_result ADD COLUMN IF NOT EXISTS target_id bigint;
    ALTER TABLE IF EXISTS tb_correlation_result ADD COLUMN IF NOT EXISTS phase bigint DEFAULT 0;
    ALTER TABLE IF EXISTS tb_correlation_result ADD COLUMN IF NOT EXISTS macro_type en_correlation_condition_id_type;
    ALTER TABLE IF EXISTS tb_correlation_result ADD COLUMN IF NOT EXISTS macro_data text;
    ALTER TABLE IF EXISTS tb_correlation_result ADD COLUMN IF NOT EXISTS modified_time timestamp;

    COMMENT ON COLUMN tb_correlation_result.correlation_rule_id IS '연계규칙 ID';
    COMMENT ON COLUMN tb_correlation_result.target_id IS '대상 ID';
    COMMENT ON COLUMN tb_correlation_result.phase IS '단계';
    COMMENT ON COLUMN tb_correlation_result.macro_type IS '매크로 타입';
    COMMENT ON COLUMN tb_correlation_result.macro_data IS '매크로 데이터';
    COMMENT ON COLUMN tb_correlation_result.modified_time IS '변경 시각';
END $$ LANGUAGE 'plpgsql';


------------------------------------------------------------------------------------------
-- function
------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION sp_get_dashboard_summary_alert ()
  RETURNS TABLE (correlation_rule_cnt BIGINT, correlation_rule_id BIGINT, macro_type en_correlation_condition_id_type, macro_data TEXT, comparison_operator en_comparison_operator)
AS
$$
BEGIN

RETURN QUERY
 SELECT count(cr.correlation_rule_id) over() as alert_cnt
               , cr.correlation_rule_id AS correlation_rule_id
               , cr.macro_type AS macro_type
               , cr.macro_data AS macro_data
               , cri.comparison_operator AS comparison_operator
  FROM (
                SELECT cr.correlation_rule_id
                              , cr.macro_type
                              , cr.macro_data
                              , cr.modified_time
                    FROM (
                                  SELECT cr.correlation_rule_id
                                                , cr.macro_type
                                                , cr.macro_data
                                                , modified_time
                                                , rank() over(partition by cr.correlation_rule_id, cr.macro_type order by cr.correlation_rule_id, cr.modified_time desc) as rank
                                      FROM tb_correlation_result cr
                                   WHERE cr.macro_type in('CERTIFICATE_EXPIRE','LICENSE_EXPIRE','FILE_SERVER_DISK_SIZE'
                                                                                              ,'DB_FILE_SIZE','DISK_USAGE','MEMORY_USAGE','CPU_USAGE')
                                          AND (modified_time >= date_trunc('day',now()::TIMESTAMP)
                                                    AND modified_time < date_trunc('day',now()::TIMESTAMP + INTERVAL '1 day'))
                                          ) as cr
                 WHERE cr.rank = 1 ) as cr
                JOIN tb_correlation_rule_item cri USING (correlation_rule_id);

END;
$$
LANGUAGE PLPGSQL;

------------------------------------------------------------------------------------------
CREATE FUNCTION sp_get_correlation_rule_item(i_correlation_rule_id bigint) RETURNS TABLE(correlation_rule_id bigint, correlation_condition_id en_correlation_condition_id_type, "values" text, comparison_operator en_comparison_operator, intersect_set integer)
    LANGUAGE plpgsql
    AS $$

BEGIN

RETURN QUERY

SELECT cri.correlation_rule_id     AS correlation_rule_id
      ,cri.correlation_condition_id  AS correlation_condition_id
      ,cri.values                  AS values
      ,cri.comparison_operator     AS comparison_operator
      ,cri.intersect_set             AS intersect_set
FROM tb_correlation_rule_item AS cri
WHERE cri.correlation_rule_id = i_correlation_rule_id
;


END;
$$;


COMMENT ON FUNCTION sp_get_correlation_rule_item(i_correlation_rule_id bigint) IS '
@brief [SWC-SCI1019] 연계 규칙 설정 조회
@in -
@out -
@return - TABLE';

------------------------------------------------------------------------------------------
CREATE FUNCTION sp_get_correlation_condition_list(i_correlation_type en_correlation_type) RETURNS TABLE(correlation_condition_id en_correlation_condition_id_type, correlation_type en_correlation_type, collection text, comparison_candidate text, macro_candidate text, procedure text, product_group en_product_group_type, db_type en_db_type)
    LANGUAGE plpgsql
    AS $$

BEGIN

RETURN QUERY

SELECT cc.correlation_condition_id  AS correlation_condition_id
      ,cc.correlation_type  AS correlation_type
      ,cc.collection  AS collection
      ,cc.comparison_candidate   AS comparison_candidate
      ,cc.macro_candidate   AS macro_candidate
      ,cc.procedure    AS procedure
      ,cc.product_group    AS product_group
      ,cc.db_type  AS db_type
FROM tb_correlation_condition AS cc /*연계 규칙 매핑  */
WHERE cc.correlation_type = coalesce(i_correlation_type, cc.correlation_type) --1.'GENERAL',2.모두
;


END;
$$;


COMMENT ON FUNCTION sp_get_correlation_condition_list(i_correlation_type en_correlation_type) IS '
@brief [SWC-SCI1013] 라이선스별 상세 규칙 항목
@in -
@out -
@return - TABLE';

------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION sp_get_system_alert_correlation_rule_item(i_correlation_condition_id en_correlation_condition_id_type)
    RETURNS TABLE(correlation_rule_id bigint, intersect_set integer, correlation_condition_id en_correlation_condition_id_type, comparison_operator en_comparison_operator, "values" text, is_enabled text)
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN QUERY
    SELECT
      cri.correlation_rule_id
      , cri.intersect_set
      , cri.correlation_condition_id
      , cri.comparison_operator
      , cri.values
      , cr.is_enabled::text
    FROM tb_correlation_rule_item AS cri
    JOIN tb_correlation_rule AS cr ON cr.correlation_rule_id = cri.correlation_rule_id AND cr.correlation_type = 'SYSTEM_ALERT'
    WHERE cri.correlation_condition_id = i_correlation_condition_id;

END;
$$;


COMMENT ON FUNCTION sp_get_system_alert_correlation_rule_item(i_correlation_condition_id en_correlation_condition_id_type) IS '
@brief [SWC-SCI1021] 시스템 알림 규칙 조회
@in -
@out -
@return - TABLE';

------------------------------------------------------------------------------------------
CREATE FUNCTION sp_add_correlation_result(i_correlation_rule_id bigint, i_target_id bigint[], i_macro_type en_correlation_condition_id_type[], i_macro_data text[]) RETURNS TABLE(error_code text, error_msg text)
    LANGUAGE plpgsql
    AS $$
BEGIN

INSERT INTO tb_correlation_result (
  correlation_rule_id
  , target_id
  , macro_type
  , macro_data
  , modified_time
) 
SELECT
  i_correlation_rule_id
  , t.target_id
  , t.macro_type
  , t.macro_data
  , now()
FROM
  UNNEST(
    i_target_id
    , i_macro_type
    , i_macro_data
  ) AS t(target_id, macro_type, macro_data)
  JOIN tb_node n ON t.target_id = n.node_id AND n.is_removed IS FALSE
;

perform sp_update_correlation_phase(i_correlation_rule_id);

RETURN QUERY select '0'::text, 'SUCCESS'::text;

END;
$$;

------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION sp_set_correlation_rule(i_ud_cr integer, i_ud_cri integer, i_ud_ce integer, i_ud_ct integer, i_schedule_flag integer, i_correlation_rule_id bigint, i_name text, i_is_enabled boolean, i_schedule text, i_alarm_threshold integer, i_condition_text text, i_exclude_text text, i_base_report_id en_base_report_id_type, i_alert_template_id bigint, i_send_mail boolean, i_send_mail_to_target boolean, i_custom_email text, i_correlation_condition_id en_correlation_condition_id_type[], i_values text[], i_comparison_operator en_comparison_operator[], i_intersect_set integer[], i_target_id bigint[], i_task_type en_task_type[], i_task_order bigint[], i_payload_params text[], i_send_mail_to_target_agent boolean, i_admin_id text) RETURNS void
    LANGUAGE plpgsql
    AS $$

DECLARE
  v_is_validation_pass boolean;
  v_validation_target_index integer;
  v_validation_values text[];
BEGIN

  --tb_correlation_rule 1:UPDATE
  IF i_ud_cr = 1 THEN

  -- correlation name dup check
  IF ((SELECT count(1) FROM tb_correlation_rule AS c WHERE c.correlation_rule_id != i_correlation_rule_id AND c.name = i_name) > 0) THEN
    RAISE EXCEPTION 'The correlation name already exists.' USING HINT = 'DB-00043';
  END IF;
  

  UPDATE tb_correlation_rule
  SET name                = i_name
     ,is_enabled          = i_is_enabled
     ,schedule            = i_schedule
     ,alarm_threshold     = i_alarm_threshold
     ,condition_text      = i_condition_text
     ,exclude_text        = i_exclude_text
     ,base_report_id      = i_base_report_id
     ,alert_template_id   = i_alert_template_id
     ,send_mail           = i_send_mail
     ,send_mail_to_target = i_send_mail_to_target
     ,custom_email        = i_custom_email
     ,admin_id            = i_admin_id
     ,modified_time       = now()
	 ,send_mail_to_target_agent = i_send_mail_to_target_agent
  WHERE correlation_rule_id = i_correlation_rule_id;
  ELSE
  UPDATE tb_correlation_rule
  SET modified_time       = now()
     ,admin_id            = i_admin_id
  WHERE correlation_rule_id = i_correlation_rule_id;
  END IF;

  --tb_correlation_rule_item 1:UPDATE, 2:DELETE
  IF i_ud_cri > 0 THEN
  DELETE
  FROM tb_correlation_rule_item AS cri
  WHERE cri.correlation_rule_id = i_correlation_rule_id;

    IF i_ud_cri = 1 THEN
      UPDATE tb_correlation_rule
    SET condition_text      = i_condition_text
       ,admin_id            = i_admin_id
       ,modified_time       = now()
    WHERE correlation_rule_id = i_correlation_rule_id;

    INSERT INTO tb_correlation_rule_item(
                correlation_rule_id
               ,correlation_condition_id
               ,values
               ,comparison_operator
               ,intersect_set)
    SELECT i_correlation_rule_id
          ,t.correlation_condition_id
          ,t.values
          ,t.comparison_operator
          ,t.intersect_set
    FROM unnest(i_correlation_condition_id
               ,i_values
               ,i_comparison_operator
               ,i_intersect_set)
    AS t(correlation_condition_id
        ,values
        ,comparison_operator
        ,intersect_set);
  END IF;
  END IF;

  --tb_correlation_exclude 1:UPDATE, 2:DELETE
  IF i_ud_ce > 0 THEN
  DELETE
  FROM tb_correlation_exclude AS ce
  WHERE ce.correlation_rule_id = i_correlation_rule_id
    AND ce.exclude_type = 'NODE';

  UPDATE tb_correlation_rule
  SET exclude_text        = i_exclude_text
     ,admin_id            = i_admin_id
     ,modified_time       = now()
  WHERE correlation_rule_id = i_correlation_rule_id;

    IF i_ud_ce = 1 THEN
    INSERT INTO tb_correlation_exclude(correlation_rule_id, target_id, exclude_type)
    SELECT i_correlation_rule_id, t.target_id, 'NODE' FROM unnest(i_target_id) as t(target_id);
  END IF;
  END IF;
  --tb_correlation_task 1:UPDATE, 2:DELETE
  IF i_ud_ct > 0 THEN
  DELETE
  FROM tb_correlation_task AS ct
  WHERE ct.correlation_rule_id = i_correlation_rule_id;

    IF i_ud_ct = 1 THEN
    INSERT INTO tb_correlation_task(correlation_rule_id, task_type, task_order, payload_params)
    SELECT i_correlation_rule_id, t.task_type, t.task_order, t.payload_params FROM unnest(i_task_type, i_task_order, i_payload_params) as t(task_type, task_order, payload_params);
  END IF;
  END IF;

  -- 연계 규칙 동기화 업데이트, shkang : 2018. 06. 28
  UPDATE tb_server SET need_correlation_refresh = true;

END;
$$;

COMMENT ON FUNCTION sp_set_correlation_rule(i_ud_cr integer, i_ud_cri integer, i_ud_ce integer, i_ud_ct integer, i_schedule_flag integer, i_correlation_rule_id bigint, i_name text, i_is_enabled boolean, i_schedule text, i_alarm_threshold integer, i_condition_text text, i_exclude_text text, i_base_report_id en_base_report_id_type, i_alert_template_id bigint, i_send_mail boolean, i_send_mail_to_target boolean, i_custom_email text, i_correlation_condition_id en_correlation_condition_id_type[], i_values text[], i_comparison_operator en_comparison_operator[], i_intersect_set integer[], i_target_id bigint[], i_task_type en_task_type[], i_task_order bigint[], i_payload_params text[], i_send_mail_to_target_agent boolean, i_admin_id text) IS '
@brief [SWC-SCI1002] 연계 규칙 변경
@in -
@out -
@return - TABLE';


------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION sp_add_system_correlation_send_mail(i_job_id bigint, i_correlation_rule_id bigint, i_macro_type_list en_correlation_condition_id_type[], i_macro_value_list text[], i_mail_body text, i_correlation_name text, i_mail_image text, i_custom_email text, i_custom bigint) RETURNS void
    LANGUAGE plpgsql
    AS $_$
DECLARE
v_mail_body TEXT;
v_payload_format TEXT;
v_task_id BIGINT;
BEGIN

SELECT REPLACE(i_mail_body,'${TITLE}',i_correlation_name) INTO v_mail_body;

SELECT tt.payload_format INTO v_payload_format
FROM tb_task_type tt
WHERE tt.task_type = 'SEND_MAIL';

INSERT INTO tb_task (job_id, task_type, logical_payload, task_order, create_time, modified_time)
VALUES(i_job_id, 'SEND_MAIL', '', 1, now(), now())
RETURNING tb_task.task_id INTO v_task_id;


INSERT INTO tb_task_target (task_id, payload, target_id, modified_time)
SELECT v_task_id, concat('[', string_agg(format(v_payload_format, t.email, i_correlation_name, sp_base64_encode(t.mail_body), i_mail_image), ','), ']'), 0, now()
FROM (
  -- custom email  EMS5-1421 적용

  SELECT
    a.email
    , replace_recursive(v_mail_body, array_agg(array[org.cr_macro, org.cr_value])) AS mail_body
  FROM(
  SELECT
    CONCAT('${', cr_macro, '}') as cr_macro
    , cr_value
  FROM 
    UNNEST( 
      i_macro_type_list
      , i_macro_value_list
    ) t(cr_macro, cr_value)
  WHERE cr_value IS NOT NULL
  
  UNION ALL
  SELECT 
    CONCAT('${', t.macro, '}') as cr_macro
    , '' AS cr_value
  FROM 
    UNNEST(ENUM_RANGE(NULL::en_correlation_condition_id_type)) t(macro)
  WHERE
    NOT EXISTS(
      SELECT cr.macro FROM UNNEST( i_macro_type_list ) cr(macro) WHERE t.macro = cr.macro
  )
  ) org
  CROSS JOIN(
  SELECT DISTINCT a.email
      FROM tb_admin a
      WHERE EXISTS(
      SELECT 1 FROM unnest(concat('{', i_custom_email, '}')::TEXT[]) t(admin_id)
      WHERE t.admin_id = a.admin_id
      )
  ) a
  GROUP BY a.email
 
) t;

END;
$_$;

------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION sp_make_email_contents(
  i_login_admin_id text
  , i_target_list bigint[]
  , i_macro_type_list en_correlation_condition_id_type[]
  , i_macro_value_list text[]
  , i_mail_body text
  , i_correlation_name text
  , i_correlation_condition text
  , i_send_mail_list text[]
  , i_is_admin boolean
)
RETURNS TABLE(
  mail_contents text
  
) LANGUAGE plpgsql AS $$

DECLARE
v_language en_language;
v_correlation_desc text;
v_user_name text;
v_department text;
v_mail_body text;
v_email_table_templete TEXT := '<table border=1 style="width:100%; margin:0; separate;border-spacing:0; outline:0;"><tr style="background-color:#E6E6E6">${macro_field}<th align="center">IP</th><th align="center">Computer Name</th><th align="center">${1}</th><th align="center">${2}</th></tr>${contents}</table>';

BEGIN
  
  SELECT a.language INTO v_language FROM tb_admin a WHERE a.admin_id = i_login_admin_id;
  
  
  -- TODO : 다국어 대응 나중에 디비 자원으로 변경 필요
  IF v_language = 'ko'::en_language THEN
    v_user_name := '사용자 이름';
    v_department := '부서';
    
  ELSEIF v_language = 'zh-Hans'::en_language THEN
    v_user_name := '用户 名';
    v_department := '部门';  
    
  ELSEIF v_language = 'ja'::en_language THEN
    v_user_name := 'ユーザー名';
    v_department := '部門';

  ELSE
    v_user_name := 'USER NAME';
    v_department := 'DEPARTMENT';
    
  END IF;
  
  v_correlation_desc := (i_correlation_condition::json)->>(v_language::text);
  
  SELECT replace_recursive(i_mail_body,array[['${TITLE}',i_correlation_name], ['${CORRELATION_CONDITION}',v_correlation_desc]]) INTO v_mail_body;
  
  v_email_table_templete := replace(v_email_table_templete, '${1}', v_user_name);
  v_email_table_templete := replace(v_email_table_templete, '${2}', v_department);  


  RETURN QUERY
  
  
  SELECT
    replace_recursive(v_mail_body, array_agg(array[macro_key, macro_value]))
  FROM
  (
  
  
    /* 메일 발송 유저 리스트 */
    SELECT 
      '${USER_NAME}' AS macro_key
      , string_agg(email, ';') AS macro_value
    FROM 
      UNNEST(i_send_mail_list) AS t(email)
  
    /* 유저 리스트 : 어드민일 경우 */
    UNION ALL
    SELECT DISTINCT
      org.macro_key
      , org.macro_value
    FROM(
      SELECT
        '${USER_LIST}' AS macro_key
        , replace(
            replace(v_email_table_templete, '${contents}', string_agg(
              concat('<tr>'
                , '<td align="center">', n.ip, '</td>'
                , '<td align="center">', n.computer_name, '</td>'
                , '<td align="center">', u.name, '</td>'
                , '<td align="center">', u.department, '</td>'
              , '</tr>'
              ), '')
            )
          , '${macro_field}'
          , '') AS macro_value
      FROM tb_node n
      LEFT JOIN tb_user u ON u.node_id = n.node_id
      WHERE EXISTS (
        SELECT 1 FROM UNNEST(i_target_list) AS t(node_id) WHERE t.node_id = n.node_id
      )
  ) org
    WHERE 
      i_is_admin IS TRUE
    
    /* 유저 리스트 : 어드민이 아닐 경우 노출 제한 */      
    UNION ALL
    SELECT
      '${USER_LIST}' AS macro_key
      , 'Limited information' AS macro_value
    WHERE 
      i_is_admin IS FALSE
    
    
    /* 연계규칙 매크로 정보 */
    UNION ALL
    SELECT 
      concat('${', t.cr_macro, '}') AS macro_keyword
      , replace(
          replace(v_email_table_templete, '${contents}', string_agg(
            concat('<tr>'
              , '<td align="center">', t.cr_value, '</td>'
              , '<td align="center">', t.ip, '</td>'
              , '<td align="center">', t.computer_name, '</td>'
              , '<td align="center">', u.name, '</td>'
              , '<td align="center">', u.department, '</td>'
            , '</tr>'
          ), '')
        )
        , '${macro_field}'
        , concat('<th align="center">', t.cr_macro, '</th>')
    ) AS macro_value
    FROM (
      SELECT 
        cr_target
        , cr_macro
        , REPLACE(cr_value,';','<br>') AS cr_value
        , n.ip
        , n.computer_name
      FROM unnest( i_target_list, i_macro_type_list, i_macro_value_list ) t(cr_target, cr_macro, cr_value)
      JOIN tb_node n ON t.cr_target = n.node_id
    ) t
    LEFT JOIN tb_user u ON t.cr_target = u.node_id
    GROUP BY t.cr_macro
    
    
    /* 남은 매크로 공백 처리 */
    UNION ALL
    SELECT 
      concat('${', t.macro, '}') AS macro_key
      , '' AS macro_value
    FROM 
      UNNEST(ENUM_RANGE(NULL::en_correlation_condition_id_type)) t(macro)
    WHERE
      NOT EXISTS(
        SELECT cr.macro FROM UNNEST( i_macro_type_list ) cr(macro) WHERE t.macro = cr.macro
      )

  ) t
 
  ;

  
END;
$$; 

------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION sp_add_general_correlation_send_mail(
  i_login_admin_id text
  , i_job_id bigint
  , i_correlation_rule_id bigint
  , i_target_list bigint[]
  , i_macro_type_list en_correlation_condition_id_type[]
  , i_macro_value_list text[]
  , i_mail_body text
  , i_correlation_name text
  , i_correlation_condition text
  , i_mail_image text
  , i_custom_email text
  , i_custom bigint
  , i_send_mail_to_target boolean
)
RETURNS void
  LANGUAGE plpgsql AS $_$
    
DECLARE
  
  v_payload_format TEXT;
  v_task_id BIGINT;

BEGIN
  
  SELECT 
    tt.payload_format INTO v_payload_format
  FROM 
    tb_task_type tt
  WHERE 
    tt.task_type = 'SEND_MAIL'
  ; 
  
  INSERT INTO tb_task (job_id, task_type, logical_payload, task_order, create_time, modified_time)
  VALUES(i_job_id, 'SEND_MAIL', '', 1, now(), now())
  RETURNING tb_task.task_id INTO v_task_id;
  
  
INSERT INTO tb_task_target (
  task_id
  , payload
  , target_id
  , modified_time
)  

  SELECT 
    v_task_id AS task_id
    , concat('[', string_agg(format(v_payload_format, t.email, i_correlation_name, sp_base64_encode(t.mail_body), i_mail_image), ','), ']') AS payload
    , 0::bigint AS target_id
    , now()::timestamp AS modified_time
  FROM (
  
    /* custom email */
    SELECT 
      e.email AS email
      , c.mail_contents AS mail_body 
    FROM 
      UNNEST(CONCAT('{', i_custom_email, '}')::TEXT[]) e(email)
      CROSS JOIN
        sp_make_email_contents(
          i_login_admin_id
          , i_target_list
          , i_macro_type_list
          , i_macro_value_list
          , i_mail_body
          , i_correlation_name
          , i_correlation_condition
          , CONCAT('{', i_custom_email, '}')::TEXT[] -- i_send_mail_list text[]
          , TRUE -- i_is_admin boolean
      ) AS c
    WHERE
      i_custom > 0

      
    /* 담당 관리자/발생 에이전트 체크시 */
      
    /* root admin email */
    UNION ALL
    SELECT
      org.email
      , org.mail_body
    FROM(
      WITH root_admin_email AS(
        SELECT
         a.email AS email
        FROM 
          tb_admin a
          JOIN tb_privilege_profile pp ON a.privilege_profile_id = pp.privilege_profile_id
        WHERE
          pp.profile_type = 'ROOT_ADMIN'::en_privilege_profile_type       
      )
      SELECT
        e.email AS email
        , c.mail_contents AS mail_body 
      FROM
        root_admin_email e
        CROSS JOIN
          sp_make_email_contents(
            i_login_admin_id
            , i_target_list
            , i_macro_type_list
            , i_macro_value_list
            , i_mail_body
            , i_correlation_name
            , i_correlation_condition
            , (SELECT ARRAY_AGG(email) FROM root_admin_email) -- i_send_mail_list text[]
            , TRUE -- i_is_admin boolean
        ) AS c  
    ) org
    WHERE
      i_send_mail_to_target IS TRUE

      
    /* 부서별, 제품별, 특수관리자 이메일 전송 */
    UNION ALL
    SELECT 
      org.email
      , c.mail_contents 
    FROM(
      WITH target_list AS(
        SELECT 
          t.node_id::bigint AS target_id
          , t.correlation_condition_id::en_correlation_condition_id_type as macro
          , t.value::text AS value
          , con.product_group
          , n.group_id
        FROM 
          UNNEST(
            i_target_list
            , i_macro_type_list
            , i_macro_value_list
          ) t(node_id, correlation_condition_id, value)
        JOIN tb_correlation_condition con on t.correlation_condition_id::en_correlation_condition_id_type = con.correlation_condition_id
        JOIN tb_node n on t.node_id::bigint = n.node_id
        WHERE
          i_send_mail_to_target IS TRUE
      )
      
      , dept_admin_list AS(
        SELECT
          org.admin_id
          , org.email
          , ARRAY_AGG(org.target_id) AS target_id
          , ARRAY_AGG(org.macro) AS macro
          , ARRAY_AGG(org.value) AS value
        FROM(
          WITH recursive dept AS(
            SELECT 
              a.admin_id
              , unnest(string_to_array(a.admin_group, ','))::bigint as group_id
            FROM 
              tb_admin a
              JOIN tb_privilege_profile pp ON a.privilege_profile_id = pp.privilege_profile_id
            WHERE
              pp.profile_type = 'DEPT_ADMIN'::en_privilege_profile_type
            
            UNION ALL
            SELECT 
              d.admin_id
              , g.group_id
            FROM 
              tb_group g
              JOIN dept d ON g.pgroup_id = d.group_id
          )
          SELECT DISTINCT
            d.admin_id
            , a.email
            , t.target_id
            , t.macro
            , t.value
          FROM 
            dept d
            JOIN tb_admin a ON d.admin_id = a.admin_id
            JOIN target_list t ON d.group_id = t.group_id
        ) org
        GROUP BY
          org.admin_id
          , org.email
      )
      
      , product_admin_list as(
        SELECT 
          product_admin.admin_id
          , product_admin.email
          , array_agg(t.target_id) AS target_id
          , array_agg(t.macro) AS macro
          , array_agg(t.value) AS value
        FROM (
            SELECT
              a.admin_id
              , a.email
              , unnest(string_to_array(a.product_auth, ','))::en_product_group_type as product_group
            FROM 
              tb_admin a
              join tb_privilege_profile pp ON a.privilege_profile_id = pp.privilege_profile_id
            WHERE
              pp.profile_type = 'PRODUCT_ADMIN'::en_privilege_profile_type  
        )
          product_admin
          JOIN target_list t ON product_admin.product_group = t.product_group
        GROUP BY
          product_admin.admin_id
          , product_admin.email
      )
      
    , special_admin_data as(
    
      SELECT
        sp.admin_id
        , sp.email
        , unnest(string_to_array(sp.admin_group, ','))::bigint as group_id
        , sp.product_group
      FROM (
        SELECT
            a.admin_id
            , a.email
            , unnest(string_to_array(a.product_auth, ','))::en_product_group_type as product_group
            , a.admin_group
            
          FROM 
            tb_admin a
            JOIN tb_privilege_profile pp ON a.privilege_profile_id = pp.privilege_profile_id
          WHERE
            pp.profile_type = ANY(
            array[
              'SECMGR_ADMIN'::en_privilege_profile_type
            ]
            )     
      ) sp
      
      /* 공통 연계규칙도 대상이기 때문에 주석처리
      WHERE
        sp.product_group <> 'EMS'
      */
      
      
    )
    ,  special_admin_mgmt_group AS (
      SELECT
        a.admin_id
        , a.email
        , array_agg(a.target_id) AS target_id
        , array_agg(a.macro) AS macro
        , array_agg(a.value) AS value
      FROM(
        SELECT DISTINCT
          a.admin_id
          , a.email
          , (t.target_id) AS target_id
            , (t.macro) AS macro
            , (t.value) AS value
        FROM(
          WITH RECURSIVE mgmt_group AS(
            SELECT 
              a.admin_id
              , a.group_id 
            FROM 
              special_admin_data a
            UNION ALL
            SELECT 
              m.admin_id
              , g.group_id 
            FROM 
              tb_group g 
              JOIN mgmt_group m ON g.pgroup_id = m.group_id
          )
          SELECT 
            m.admin_id
            , m.group_id
            , d.email
            , d.product_group
          FROM 
            mgmt_group m
            JOIN special_admin_data d on m.admin_id = d.admin_id
        ) a
        JOIN target_list t ON a.product_group = t.product_group AND a.group_id = t.group_id
      ) a
      GROUP BY
        a.admin_id
        , a.email
       
    )
      SELECT da.admin_id, da.email, da.target_id, da.macro, da.value FROM dept_admin_list AS da
      UNION ALL
      SELECT pa.admin_id, pa.email, pa.target_id, pa.macro, pa.value FROM product_admin_list AS pa
      UNION ALL
      SELECT sa.admin_id, sa.email, sa.target_id, sa.macro, sa.value FROM special_admin_mgmt_group AS sa
    ) org
    CROSS JOIN
      sp_make_email_contents(
        i_login_admin_id
        , org.target_id::bigint[]
        , org.macro::en_correlation_condition_id_type[]
        , org.value::text[]
        , i_mail_body
        , i_correlation_name
        , i_correlation_condition
        , array[org.email] -- i_send_mail_list text[]
        , TRUE -- i_is_admin boolean
    ) AS c
    
    
    /* 발생에이전트 개별 전송 */
    UNION ALL
    SELECT
      org.email
      , c.mail_contents
    FROM(
      SELECT
        u.email
        , n.node_id
        , t.correlation_condition_id AS macro_key
        , t.value AS macro_value
      FROM
        UNNEST(
          i_target_list
          , i_macro_type_list
          , i_macro_value_list
        ) t(node_id, correlation_condition_id, value)
        JOIN tb_node n ON t.node_id = n.node_id
        JOIN tb_user u ON n.node_id = u.node_id
      WHERE
        i_send_mail_to_target IS TRUE
    ) org
    CROSS JOIN
      sp_make_email_contents(
        i_login_admin_id
        , ARRAY[org.node_id]
        , ARRAY[org.macro_key]
        , ARRAY[org.macro_value]
        , i_mail_body
        , i_correlation_name
        , i_correlation_condition
        , ARRAY[org.email] -- i_send_mail_list text[]
        , FALSE -- i_is_admin boolean
    ) AS c
      
      
  ) t;  

  
END;
$_$;

------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION sp_add_correlation_rule(i_ce boolean, i_ct boolean, i_name text, i_is_enabled boolean, i_schedule text, i_alarm_threshold integer, i_condition_text text, i_exclude_text text, i_base_report_id en_base_report_id_type, i_alert_template_id bigint, i_send_mail boolean, i_send_mail_to_target boolean, i_custom_email text, i_correlation_condition_id en_correlation_condition_id_type[], i_values text[], i_comparison_operator en_comparison_operator[], i_intersect_set integer[], i_target_id bigint[], i_task_type en_task_type[], i_task_order bigint[], i_payload_params text[], i_send_mail_to_target_agent boolean, i_admin_id text) RETURNS TABLE(correlation_rule_id bigint)
    LANGUAGE plpgsql
    AS $$

DECLARE
  v_rule_id         bigint    DEFAULT 0;
BEGIN

-- correlation name dup check
IF ((SELECT count(1) FROM tb_correlation_rule AS c WHERE c.name = i_name) > 0) THEN
  RAISE EXCEPTION 'The correlation name already exists.' USING HINT = 'DB-00043';
END IF;

--tb_correlation_rule
INSERT INTO tb_correlation_rule(
            correlation_type
           ,name
           ,is_enabled
           ,schedule
           ,alarm_threshold
           ,condition_text
           ,exclude_text
           ,base_report_id
           ,alert_template_id
           ,send_mail
           ,send_mail_to_target
           ,custom_email
           ,admin_id
           ,modified_time
		   ,send_mail_to_target_agent)
VALUES ('GENERAL'
       ,i_name
       ,i_is_enabled
       ,i_schedule
       ,i_alarm_threshold
       ,i_condition_text
       ,i_exclude_text
       ,i_base_report_id
       ,i_alert_template_id
       ,i_send_mail
       ,i_send_mail_to_target
       ,i_custom_email
       ,i_admin_id
       ,now()
	   ,i_send_mail_to_target_agent)
RETURNING tb_correlation_rule.correlation_rule_id INTO v_rule_id;

--tb_correlation_rule_item
INSERT INTO tb_correlation_rule_item(
            correlation_rule_id
           ,correlation_condition_id
           ,values
           ,comparison_operator
           ,intersect_set)
SELECT v_rule_id
      ,t.correlation_condition_id
      ,t.values
      ,t.comparison_operator
      ,t.intersect_set
FROM unnest(i_correlation_condition_id
           ,i_values
           ,i_comparison_operator
           ,i_intersect_set)
AS t(correlation_condition_id
    ,values
    ,comparison_operator
    ,intersect_set);

--tb_correlation_exclude
  IF (i_ce) THEN
  INSERT INTO tb_correlation_exclude(correlation_rule_id, target_id, exclude_type)
  select v_rule_id, t.target_id, 'NODE' from unnest(i_target_id) as t(target_id);
  END IF;

--tb_correlation_task
  IF (i_ct) THEN
  INSERT INTO tb_correlation_task(correlation_rule_id, task_type, task_order, payload_params)
  select v_rule_id, t.task_type, t.task_order, t.payload_params from unnest(i_task_type, i_task_order, i_payload_params) as t(task_type, task_order, payload_params);
  END IF;

  -- 연계 규칙 동기화 업데이트, shkang : 2018. 06. 28
  UPDATE tb_server SET need_correlation_refresh = true;

  RETURN QUERY
    SELECT v_rule_id;

END;
$$;

------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION sp_add_correlation_job_task_target(i_correlation_rule_id bigint, i_target_list bigint[], i_macro_type_list en_correlation_condition_id_type[], i_macro_value_list text[]) RETURNS TABLE(admin_id text, job_id bigint)
    LANGUAGE plpgsql
    AS $$
DECLARE
v_job_id BIGINT;
v_task_id BIGINT;
v_send_notice BOOL;
v_send_mail BOOL;
v_send_mail_to_target BOOL;
v_custom_email TEXT;
v_mail_body TEXT;
v_mail_image TEXT;
v_correlation_name TEXT;
v_correlation_condition TEXT;
v_correlation_type en_correlation_type;
v_base_report_id en_base_report_id_type;
v_custom BIGINT;
v_report_schedule_id BIGINT;
v_admin_id TEXT;

v_agent_notice_title TEXT := '';
v_agent_notice_header TEXT = '<html><body><div>%TITLE</div><div style="margin-top:5px"><table border=1 style="width:100%; margin:0; separate;border-spacing:0; outline:0;"><tr style="background-color:#E6E6E6">';
v_agent_notice_th2 TEXT = '<th>%1</th><th>%2</th></tr>';
v_agent_notice_th3 TEXT = '<th>%1</th><th>%2</th><th>%3</th></tr>';
v_agent_notice_body TEXT := '';
v_agent_notice_bottom TEXT = '</table></div></body></html>';

v_default_period_type en_schedule_period_type;
v_params text[];

v_period_start timestamp;
v_period_end timestamp;

  v_target_list bigint[];
  v_macro_type_list en_correlation_condition_id_type[];
  v_macro_value_list text[];

BEGIN
  

  /* 연계규칙에 의해 검출된 결과를 tb_node와 join하여 유효한 에이전트들을 대상으로 메일 발송 데이터를 취급한다. */
  SELECT
    ARRAY_AGG(t.node_id)
    , ARRAY_AGG(t.macro_type)
    , ARRAY_AGG(t.macro_value)
  INTO
    v_target_list
    , v_macro_type_list
    , v_macro_value_list
  FROM
    UNNEST(
      i_target_list
      , i_macro_type_list
      , i_macro_value_list
    ) AS t(node_id, macro_type, macro_value)
    JOIN
    tb_node n ON t.node_id = n.node_id AND n.is_removed IS FALSE
  ; 
  
  

-- init
v_job_id = 0;

-- get correlation rule settings
SELECT cr.send_mail, cr.send_mail_to_target, REPLACE(cr.custom_email,';',','), cr.correlation_type, cr.send_notice, cr.base_report_id, cr.name, cr.condition_text, coalesce(POSITION('@' in cr.custom_email),0), cr.admin_id
INTO v_send_mail, v_send_mail_to_target, v_custom_email, v_correlation_type, v_send_notice, v_base_report_id, v_correlation_name, v_correlation_condition, v_custom, v_admin_id
FROM tb_correlation_rule cr WHERE cr.correlation_rule_id = i_correlation_rule_id;

-- get mail template
SELECT at.body, at.image INTO v_mail_body, v_mail_image
FROM tb_alert_template at
JOIN tb_correlation_rule cr ON cr.alert_template_id = at.alert_template_id AND cr.correlation_rule_id = i_correlation_rule_id;

-- add job
INSERT INTO tb_job (is_schedule, schedule_detail, admin_id, logical_target, correlation_rule_id, onoff, visible, create_time, modified_time)
VALUES ('0', NULL, v_admin_id, v_target_list, i_correlation_rule_id, true, true, now(), now())
RETURNING tb_job.job_id INTO v_job_id;

-- always send to notification center to root admin
INSERT INTO tb_task (job_id, task_type, logical_payload, task_order, create_time, modified_time)
VALUES(v_job_id, 'NOTIFICATION_CENTER', '', 1, now(), now())
RETURNING tb_task.task_id INTO v_task_id;

INSERT INTO tb_task_target (task_id, payload, target_id, modified_time)
SELECT v_task_id, format(tt.payload_format, v_admin_id, sp_base64_encode(concat('{"correlation_type":"', v_correlation_type, '", "correlation_name":"', v_correlation_name, '", "setting_value":"', cri.values, '"}'))), 0, now()
FROM tb_task_type tt
CROSS JOIN tb_correlation_rule cr
JOIN tb_correlation_rule_item cri
ON cr.correlation_rule_id = cri.correlation_rule_id
AND cri.intersect_set = 1
WHERE tt.task_type = 'NOTIFICATION_CENTER'
AND cr.correlation_rule_id = i_correlation_rule_id
LIMIT 1;

IF (v_correlation_type = 'SYSTEM_ALERT') THEN
  -- 대응현황에 표시하기위해 작업 20180314 EMS5-1331 >>EMS5-1409 서버명령은 표시하지않음20180319
  UPDATE tb_job j SET visible = FALSE WHERE j.job_id = v_job_id;

  -- send notice to root admin
  -- tb_node정보(ip = v_root_admin_ip)가 없어서 공지사항 보낼 대상이없는 상황 발생
  ---> 공지사항 담당자는 메일수신자의 정보를 TB_USER에서 찾은다음 일치되는 NODE_ID를 추출해서 있을 경우 해당에이전트로 명령을 보낸다. 일치되는 경우가 없다면.보낼대상이 없으므로 보내지 않는다.2018020710pm김수한수석님확인.
  ---> 아이피는 로그인 허용 아이피 1로 지정(srs기준) 20180320 수한수석님 확인
  
  
  IF (v_send_notice = TRUE OR v_send_mail = TRUE) THEN
  
    -- EMS5-2745 : html table 생성
    IF (v_correlation_name IN('FILE_SERVER_DISK_SIZE', 'DB_SIZE', 'DISK_USAGE', 'MEMORY_USAGE', 'CPU_USAGE')) THEN
      SELECT 
        string_agg(concat(
        '<tr align="center">'
        , '<td>' , s.name , '</td>'
        , '<td>' , s.ip , '</td>'
        , '<td>' , r.value , '</td>'
        , '</tr>'
        ), '')
      INTO
        v_agent_notice_body
      FROM 
        tb_server s
      JOIN (
        SELECT 
          /* unnest(v_target_list::bigint[]) AS server_id
          , unnest(v_macro_value_list::text[]) AS VALUE */
          /* CWPP-690 : 시스템 알림이므로 서버 ID 기준으로 타겟 변경 */
            unnest(i_target_list::bigint[]) AS server_id
          , unnest(i_macro_value_list::text[]) AS VALUE
        
      ) r ON s.server_id = r.server_id
      ;
      
      
      CASE 
        WHEN v_correlation_name = 'CPU_USAGE' THEN v_agent_notice_title := 'CPU Usage(%)'; 
        WHEN v_correlation_name = 'MEMORY_USAGE' THEN v_agent_notice_title := 'Memory Usage(%)';
        WHEN v_correlation_name = 'DISK_USAGE' THEN v_agent_notice_title := 'Disk Usage(%)';
        WHEN v_correlation_name = 'DB_SIZE' THEN v_agent_notice_title := 'Database Size(GB)';
        WHEN v_correlation_name = 'FILE_SERVER_DISK_SIZE' THEN v_agent_notice_title := 'File Server Disk Size(GB)';
      ELSE
          v_agent_notice_title := '';
      END CASE
      ;
      
      v_agent_notice_header := REPLACE(v_agent_notice_header, '%TITLE', v_agent_notice_title);
      v_agent_notice_th3 := REPLACE(v_agent_notice_th3, '%1', 'Server Name');
      v_agent_notice_th3 := REPLACE(v_agent_notice_th3, '%2', 'Server IP');
      v_agent_notice_th3 := REPLACE(v_agent_notice_th3, '%3', v_agent_notice_title);
      v_agent_notice_body := v_agent_notice_header || v_agent_notice_th3 || v_agent_notice_body || v_agent_notice_bottom;
      
    ELSEIF (v_correlation_name = 'CERTIFICATE_EXPIRE') THEN
      v_agent_notice_header := REPLACE(v_agent_notice_header, '%TITLE', 'Certification Expire');
      v_agent_notice_th2 := REPLACE(v_agent_notice_th2, '%1', 'Certification');
      v_agent_notice_th2 := REPLACE(v_agent_notice_th2, '%2', 'Certification Expire');
      
      
      WITH target_data AS (
        SELECT
         (CASE WHEN ((regexp_split_to_array(value, '\|\|'))[1] = 'cert_epp_expire_date') THEN 'EPP Management Certification' ELSE 'Customer Certification' END) AS name
         , (regexp_split_to_array(value, '\|\|'))[2] AS value
         , (regexp_split_to_array(value, '\|\|'))[3] AS correlation_alret_sent
        FROM(
          SELECT 
            unnest(replace(replace(i_macro_value_list::text, ';', ','), '"', '')::text[]) AS value
        ) as t
        WHERE
          (regexp_split_to_array(value, '\|\|'))[3]::bool is false
      )
      , update_sent AS (
        UPDATE tb_config config SET value = 'true' FROM target_data WHERE config.config_group = 'SYS_NET_CERT' AND config.key = 'correlation_alret_sent' AND target_data.correlation_alret_sent::bool is false
      )
      SELECT
        COALESCE(string_agg(concat(
          '<tr align="center">'
          , '<td>' , name , '</td>'
          , '<td>' , value , '</td>'
          , '</tr>'
        ), ''), 'NO_ALRET_TARGET') AS values      
      INTO v_agent_notice_body 
      FROM target_data
      ;
      
      IF v_agent_notice_body <> 'NO_ALRET_TARGET' THEN
        v_agent_notice_body := v_agent_notice_header || v_agent_notice_th2 || v_agent_notice_body || v_agent_notice_bottom;
      END IF;
      
    ELSEIF (v_correlation_name = 'LICENSE_EXPIRE') THEN
      v_agent_notice_header := REPLACE(v_agent_notice_header, '%TITLE', 'License Expire');
      v_agent_notice_th3 := REPLACE(v_agent_notice_th3, '%1', 'License');
      v_agent_notice_th3 := REPLACE(v_agent_notice_th3, '%2', 'Service Start Date');
      v_agent_notice_th3 := REPLACE(v_agent_notice_th3, '%3', 'Expire Date');
      
      WITH target_data AS (
        SELECT
          (regexp_split_to_array(value, '\|\|'))[1] AS name
          , (regexp_split_to_array(value, '\|\|'))[2] AS service_date
          , (regexp_split_to_array(value, '\|\|'))[3] AS expire_date
          , (regexp_split_to_array(value, '\|\|'))[4] AS correlation_alret_sent
          , (regexp_split_to_array(value, '\|\|'))[5]::en_product_id_type AS product_id
        FROM(
          SELECT 
            unnest(replace(replace(i_macro_value_list::text, ';', ','), '"', '')::text[]) AS value
        ) as t
        WHERE
          (regexp_split_to_array(value, '\|\|'))[4]::bool is false
      )
      , update_sent AS (
          UPDATE tb_product_license pl SET correlation_alret_sent = true FROM target_data WHERE pl.product_id = target_data.product_id
      )
      SELECT
        COALESCE(string_agg(concat(
          '<tr align="center">'
          , '<td>' , name , '</td>'
          , '<td>' , service_date , '</td>'
          , '<td>' , expire_date , '</td>'
          , '</tr>'
        ), ''), 'NO_ALRET_TARGET') AS values      
      INTO v_agent_notice_body
      FROM target_data
      ;
      
      IF v_agent_notice_body <> 'NO_ALRET_TARGET' THEN
        v_agent_notice_body := v_agent_notice_header || v_agent_notice_th3 || v_agent_notice_body || v_agent_notice_bottom;
      END IF;
      
    END IF; -- //EMS5-2745 : html table  
  
  END IF; -- IF (v_send_notice = TRUE OR v_send_mail = TRUE)
  
  
  IF (v_send_notice = TRUE AND v_agent_notice_body <> 'NO_ALRET_TARGET')THEN
    
    INSERT INTO tb_task (job_id, task_type, logical_payload, task_order, create_time, modified_time)
    VALUES(v_job_id, 'SEND_NOTICE', '', 1, now(), now())
    RETURNING tb_task.task_id INTO v_task_id;

    INSERT INTO tb_task_target (task_id, payload, target_id, modified_time)
    SELECT v_task_id, format(tt.payload_format, v_admin_id, to_char(now(), 'YYYY-MM-DD HH24:MI:SS OF00'), v_correlation_name, sp_base64_encode(v_agent_notice_body)), n.node_id, now()
    FROM tb_task_type tt
    CROSS JOIN tb_node n
    WHERE tt.task_type = 'SEND_NOTICE'
    AND n.ip IN (SELECT (concat('{', connect_ip_range, '}')::TEXT[])[1]::inet
           FROM tb_admin a
           JOIN tb_privilege_profile pp ON a.privilege_profile_id = pp.privilege_profile_id
           WHERE profile_type = 'ROOT_ADMIN')
    AND n.is_removed = false;
    
  END IF;

  -- send email to admins
  IF (v_send_mail = TRUE AND v_agent_notice_body <> 'NO_ALRET_TARGET') THEN
    PERFORM sp_add_system_correlation_send_mail(  v_job_id
                ,i_correlation_rule_id
                ,i_macro_type_list
                , array[v_agent_notice_body]  -- 공지보내기 양식에 맞게 이메일도 같은 형식을 쓰는걸로 변경. i_macro_value_list
                ,v_mail_body
                ,v_correlation_name
                ,v_mail_image
                ,v_custom_email
                ,v_custom );

  END IF;

ELSE -- GENERAL correlation

  -- 대응현황에 표시하기위해 작업 20180314 EMS5-1331
  UPDATE tb_job j
     SET logical_target = (SELECT array_to_json (array_agg (row_to_json (t))) ::TEXT
          FROM (SELECT 'NODE' AS type, array_agg (n.node_id) AS target, array_agg (n.ip) AS target_name
          FROM tb_node n
          WHERE n.node_id IN (SELECT *
                  FROM unnest (logical_target::BIGINT[]))) t)
  WHERE j.job_id = v_job_id;

  -- send email
  IF (v_send_mail = true) THEN
    PERFORM sp_add_general_correlation_send_mail( v_admin_id
                ,v_job_id
                ,i_correlation_rule_id
                ,v_target_list
                ,v_macro_type_list
                ,v_macro_value_list
                ,v_mail_body
                ,v_correlation_name
                ,v_correlation_condition
                ,v_mail_image
                ,v_custom_email
                ,v_custom
                ,v_send_mail_to_target );
  END IF;

  -- generate report
  IF (v_base_report_id IS NOT NULL) THEN

    /*
            연계규칙 보고서 생성시 디폴트 파람을 테이블에서 얻어와 보고서 생성 하도록 변경
     shkang.temp, 2018-12-27        
    */
    SELECT 
      REPLACE(r.default_period_type::TEXT,'TODAY','CUSTOM_DAILY')::en_schedule_period_type 
      , r.default_params::text[]
    INTO
      v_default_period_type
      , v_params
    FROM 
      tb_base_report r
    WHERE 
      r.base_report_id = v_base_report_id      
    ;
     
    /* 커스텀 기간 설정 */
    CASE
      WHEN v_default_period_type = 'CUSTOM_MONTHLY' THEN
        v_period_start := DATE_TRUNC('MONTH', NOW())::TIMESTAMP;
        v_period_end := (DATE_TRUNC('MONTH', NOW()) + INTERVAL '1 MONTH - 1 SECOND')::TIMESTAMP;
    ELSE
        v_period_start := null;
        v_period_end := null;       
    end CASE;
  
    SELECT rs.report_schedule_id INTO v_report_schedule_id
    FROM sp_add_report_schedule(  
            v_admin_id,
            v_correlation_name,
            v_correlation_condition,
            'CORRELATION'::en_report_type,
            v_base_report_id,
            null,
            v_default_period_type,
            v_period_start,
            v_period_end,
            v_params,
            null,
            i_correlation_rule_id,
            null,
            TRUE,
            'ONCE'::en_schedule_type) rs;

    INSERT INTO tb_task (job_id, task_type, logical_payload, task_order, create_time, modified_time)
    VALUES(v_job_id, 'GENERATE_REPORT', '', 1, now(), now())
    RETURNING tb_task.task_id INTO v_task_id;

    INSERT INTO tb_task_target (task_id, payload, target_id, modified_time)
    SELECT v_task_id, format(tt.payload_format, v_report_schedule_id::TEXT), 0, now() FROM tb_task_type tt
    WHERE tt.task_type = 'GENERATE_REPORT';
  END IF;

  -- add tasks if any
  PERFORM sp_add_correlation_task_target( v_job_id, i_correlation_rule_id, v_target_list );

END IF;

RETURN QUERY SELECT v_admin_id, v_job_id;

END;
$$;


------------------------------------------------------------------------------------------
-- view
------------------------------------------------------------------------------------------
CREATE VIEW vw_correlation_result AS
  SELECT cr.correlation_rule_id,
    cr.target_id,
    cr.phase,
    cr.macro_type,
    cr.macro_data
  FROM tb_correlation_result AS cr
    JOIN tb_olap_correlation_phase AS oc ON cr.correlation_rule_id = oc.correlation_rule_id AND cr.phase = oc.phase;

COMMENT ON VIEW vw_correlation_result IS '연계규칙 결과 뷰';
COMMENT ON COLUMN vw_correlation_result.correlation_rule_id IS '연계규칙 ID';
COMMENT ON COLUMN vw_correlation_result.target_id IS '대상 ID';
COMMENT ON COLUMN vw_correlation_result.phase IS '단계';
COMMENT ON COLUMN vw_correlation_result.macro_type IS '매크로 타입';
COMMENT ON COLUMN vw_correlation_result.macro_data IS '매크로 데이터';

