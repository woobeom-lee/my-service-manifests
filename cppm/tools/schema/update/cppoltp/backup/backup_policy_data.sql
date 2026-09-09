------------------------------------------------------------------------
select '## tb_policy_backup';
------------------------------------------------------------------------
BEGIN;
DO $$
DECLARE
BEGIN
  
  INSERT INTO tb_policy_backup (
    policy_id, product_feature_id, policy_type, ppolicy_id, name, description
    , online_policy_body, offline_policy_body, use_offline_policy, hash
    , modified_time, backup_time
  )
  SELECT
    p.policy_id, p.product_feature_id, p.policy_type, p.ppolicy_id, p.name, p.description
    , p.online_policy_body, p.offline_policy_body, p.use_offline_policy, p.hash
    , p.modified_time, now()
  FROM
    tb_policy AS p
  ORDER BY
    p.policy_id ASC;

END
$$ LANGUAGE 'plpgsql';
COMMIT;
