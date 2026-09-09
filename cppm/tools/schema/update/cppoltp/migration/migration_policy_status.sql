-- 업데이트시에만 수행
-- (CWPP-6500) 에이전트 platform type에 맞지 않는 정책이 할당되는 케이스가 존재하여 해당 데이터 제거 처리
DELETE FROM
	tb_policy_status
WHERE
	NOT EXISTS (
		SELECT 1
		FROM (
			SELECT
				tb_node.node_id
				, tb_product_feature_map.product_feature_id
			FROM
				tb_node
				INNER JOIN tb_platform ON tb_platform.platform_id = tb_node.platform_id
				INNER JOIN tb_product ON tb_product.platform_support && ARRAY[tb_platform.platform_type]
				INNER JOIN tb_product_feature_map ON tb_product_feature_map.product_id = tb_product.product_id
		) AS node_product_feature_info
		WHERE
			node_product_feature_info.node_id = tb_policy_status.node_id
			AND node_product_feature_info.product_feature_id = tb_policy_status.product_feature_id
	)
;
