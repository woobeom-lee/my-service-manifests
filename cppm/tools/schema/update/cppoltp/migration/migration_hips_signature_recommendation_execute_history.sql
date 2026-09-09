-- (CWPP-6806) 에 의한 마이그레이션 처리
-- 1.0.21에서 tb_node_signature_recommendation_execution_info 테이블 신규 생성으로 인한 기존 데이터 마이그레이션 처리
------------------------------------------------------------------------
select '## migration last_apply_time tb_node_signature_recommendation_execution_info';
------------------------------------------------------------------------
BEGIN;
DO $$

BEGIN

    IF EXISTS(SELECT * FROM information_schema.tables WHERE table_schema = CURRENT_SCHEMA() AND table_name = 'tb_hips_signature_recommendation_execute_history') THEN
        -- migration last_apply_time
        INSERT INTO tb_node_signature_recommendation_execution_info (
            node_id, admin_id, last_apply_time
        )
        SELECT
            node_id, 'SYSTEM', MAX(create_time) AS last_apply_time
        FROM
            tb_hips_signature_recommendation_execute_history
        GROUP BY
            node_id
        ON CONFLICT(node_id) DO
        UPDATE
        SET
            admin_id = EXCLUDED.admin_id
            , last_apply_time = EXCLUDED.last_apply_time
            , modified_time = CURRENT_TIMESTAMP
        ;

        -- drop tb_hips_signature_recommendation_execute_history
        DROP TABLE tb_hips_signature_recommendation_execute_history;
    END IF;

END
$$ LANGUAGE 'plpgsql';
COMMIT;
