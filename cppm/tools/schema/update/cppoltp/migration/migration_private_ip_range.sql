-- 업데이트 수행 시에만 처리 필요.

-- [CWPP-5146] NAT 예외 대상 IP 목록 tb_config -> tb_prviate_ip_range로 이동.
INSERT INTO tb_private_ip_range (range_origin, range_from, range_to, created_time)
SELECT
    CONCAT(range.range_from, '-', range.range_to) AS range_origin
    , COALESCE(NULLIF(range.range_from, ''), SUBSTRING(range_to, 0, POSITION('.' IN range_to))||'.0.0.0', NULL)::inet AS range_from
    , COALESCE(NULLIF(range.range_to, ''), SUBSTRING(range_from, 0, POSITION('.' IN range_from))||'.255.255.255', NULL)::inet AS range_to
    , NOW() AS created_time
FROM
    (SELECT
        SPLIT_PART(UNNEST(STRING_TO_ARRAY(value, '||')), ',', 1) AS range_from,
        SPLIT_PART(UNNEST(STRING_TO_ARRAY(value, '||')), ',', 2) AS range_to
    FROM
        tb_config
    WHERE
        config_group = 'NETWORK'
        AND key = 'private_ip_range'
    ) AS range
ON CONFLICT ON CONSTRAINT tb_private_ip_range_unique_key DO NOTHING;

-- 기존 tb_config에 저장되던 private ip 삭제
DELETE FROM
    tb_config
WHERE
    config_group = 'NETWORK'
    AND key = 'private_ip_range';