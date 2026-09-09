------------------------------------------------------------------------
select '## migration cnapp config';
------------------------------------------------------------------------
BEGIN;
DO $$

BEGIN
    
    -- (CWPP-9658) CNAPP 서버 설정 변경
    IF EXISTS(SELECT 1 FROM tb_config WHERE config_group = 'CNAPP' AND key = 'cnapp_server') THEN
        IF EXISTS (SELECT 1 FROM tb_config WHERE config_group = 'CNAPP' AND key = 'cnapp_server' AND (value::json ->> 'server_ip') = '127.0.0.1') THEN
            -- 처리
            UPDATE tb_config
            SET
                value = jsonb_set(value::jsonb, '{server_ip}', to_jsonb((SELECT ip FROM tb_server ORDER BY server_id ASC LIMIT 1)), false)
                , modified_time = NOW()
            WHERE
                config_group = 'CNAPP' AND key = 'cnapp_server';
        END IF;
    END IF;

END
$$ LANGUAGE 'plpgsql';
COMMIT;
