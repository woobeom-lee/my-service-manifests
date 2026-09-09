------------------------------------------------------------------------
select '## migration config update interval';
------------------------------------------------------------------------
BEGIN;
DO $$

DECLARE
    v_type TEXT;

BEGIN
    SELECT value INTO v_type
    FROM tb_config
    WHERE config_group = 'UPDATE' AND key = 'update_server_type';

    -- (CWPP-10316) update_per_hour 설정 존재 유무 확인
    IF EXISTS(SELECT 1 FROM tb_config WHERE config_group = 'UPDATE' and key = 'update_per_hour') THEN
        -- update_interval 생성은 cppoltp_data.sql 에서 수행

        -- 안랩업데이트 서버 OR 사용자정의 서버 의 경우
        IF v_type IN ('user', 'ahnlab') THEN
            UPDATE tb_schedule
            SET schedule = jsonb_set(
                schedule::jsonb,
                '{repeat}',
                '{"hourly": 3}'::jsonb
            )::text                                  
            WHERE schedule_code = 'EPP_UPDATE';
        END IF;

        -- 이 로직이 1회만 구동하도록 update_per_hour 삭제
        delete from tb_config where config_group = 'UPDATE' and key = 'update_per_hour';
    END IF;

END
$$ LANGUAGE 'plpgsql';
COMMIT;
