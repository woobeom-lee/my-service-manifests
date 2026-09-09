-- 업데이트 수행 시에만 처리
    
-- [CWPP-8523] runtime 을 지원하는 CPPM 으로 업데이트 시 AMC, Runtime HIPS batch 는 데이터를 초기부터 탐색할 필요가 없기 때문에
-- 마지막으로 실행된 v3-alert-log-job, hips-detect-event-log-job, hips-fw-event-log-job 배치 이후부터 실행한다.

    INSERT INTO tb_batch_job_last_execution (job_name, last_obj_id, modified_time)
    SELECT 'amc-alert-timeline-job', (SELECT last_obj_id FROM tb_batch_job_last_execution WHERE job_name = 'v3-alert-log-job'), NOW()
    WHERE
        NOT EXISTS (
            SELECT
                1
            FROM
                tb_batch_job_last_execution
            WHERE
                job_name = 'amc-alert-timeline-job'
        )
    AND
        EXISTS (
            SELECT
                1
            FROM
                tb_batch_job_last_execution
            WHERE
                job_name = 'v3-alert-log-job'
        )
    ;

    INSERT INTO tb_batch_job_last_execution (job_name, last_obj_id, modified_time)
    SELECT 'hips-runtime-ips-timeline-job', (SELECT last_obj_id FROM tb_batch_job_last_execution WHERE job_name = 'hips-detect-event-log-job'), NOW()
    WHERE
        NOT EXISTS (
            SELECT
                1
            FROM
                tb_batch_job_last_execution
            WHERE
                job_name = 'hips-runtime-ips-timeline-job'
        )
    AND
        EXISTS (
            SELECT
                1
            FROM
                tb_batch_job_last_execution
            WHERE
                job_name = 'hips-detect-event-log-job'
        )
    ;

    INSERT INTO tb_batch_job_last_execution (job_name, last_obj_id, modified_time)
    SELECT 'hips-runtime-fw-timeline-job', (SELECT last_obj_id FROM tb_batch_job_last_execution WHERE job_name = 'hips-fw-event-log-job'), NOW()
    WHERE
        NOT EXISTS (
            SELECT
                1
            FROM
                tb_batch_job_last_execution
            WHERE
                job_name = 'hips-runtime-fw-timeline-job'
        )
    AND
        EXISTS (
            SELECT
                1
            FROM
                tb_batch_job_last_execution
            WHERE
                job_name = 'hips-fw-event-log-job'
        )
    ;