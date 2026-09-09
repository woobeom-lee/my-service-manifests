-- 클라우드 그룹 전체 숨김 처리
UPDATE tb_group SET is_removed = true WHERE group_type::text LIKE '%CLOUD%';

-- 기존 클라우드 노드를 기본노드에 포함
UPDATE tb_node
SET group_id = (SELECT group_id FROM tb_group WHERE name = '%DEFAULT_GROUP_NAME%')
WHERE node_id IN (SELECT node_id FROM tb_node WHERE group_id IN (SELECT group_id FROM tb_group WHERE group_type::text LIKE '%CLOUD%'));