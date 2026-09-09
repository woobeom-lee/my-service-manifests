-- 업데이트 수행 시에만 처리
    
-- [CWPP-7565] 데이터를 초기부터 탐색할 필요가 없기 때문에
-- 마지막으로 실행된 agent-event-log-obj-id-job, hips-agent-event-log-obj-id-job, ac-agent-event-log-obj-id-job, v3-sup-log-obj-id-job배치 이후부터 실행한다.

    INSERT INTO tb_batch_job_last_execution (job_name, last_obj_id, modified_time)
    SELECT 'agent-failure-history-job', (SELECT last_obj_id FROM tb_batch_job_last_execution WHERE job_name = 'agent-event-log-obj-id-job'), NOW()
    WHERE
        NOT EXISTS (
            SELECT
                1
            FROM
                tb_batch_job_last_execution
            WHERE
                job_name = 'agent-failure-history-job'
        )
    AND
        EXISTS (
            SELECT
                1
            FROM
                tb_batch_job_last_execution
            WHERE
                job_name = 'agent-event-log-obj-id-job'
        )
    ;

    INSERT INTO tb_batch_job_last_execution (job_name, last_obj_id, modified_time)
    SELECT 'hips-failure-history-job', (SELECT last_obj_id FROM tb_batch_job_last_execution WHERE job_name = 'hips-agent-event-log-obj-id-job'), NOW()
    WHERE
        NOT EXISTS (
            SELECT
                1
            FROM
                tb_batch_job_last_execution
            WHERE
                job_name = 'hips-failure-history-job'
        )
    AND
        EXISTS (
            SELECT
                1
            FROM
                tb_batch_job_last_execution
            WHERE
                job_name = 'hips-agent-event-log-obj-id-job'
        )
    ;

    INSERT INTO tb_batch_job_last_execution (job_name, last_obj_id, modified_time)
    SELECT 'ac-failure-history-job', (SELECT last_obj_id FROM tb_batch_job_last_execution WHERE job_name = 'ac-agent-event-log-obj-id-job'), NOW()
    WHERE
        NOT EXISTS (
            SELECT
                1
            FROM
                tb_batch_job_last_execution
            WHERE
                job_name = 'ac-failure-history-job'
        )
    AND
        EXISTS (
            SELECT
                1
            FROM
                tb_batch_job_last_execution
            WHERE
                job_name = 'ac-agent-event-log-obj-id-job'
        )
    ;

    INSERT INTO tb_batch_job_last_execution (job_name, last_obj_id, modified_time)
    SELECT 'am-failure-history-job', (SELECT last_obj_id FROM tb_batch_job_last_execution WHERE job_name = 'v3-sup-log-obj-id-job'), NOW()
    WHERE
        NOT EXISTS (
            SELECT
                1
            FROM
                tb_batch_job_last_execution
            WHERE
                job_name = 'am-failure-history-job'
        )
    AND
        EXISTS (
            SELECT
                1
            FROM
                tb_batch_job_last_execution
            WHERE
                job_name = 'v3-sup-log-obj-id-job'
        )
    ;