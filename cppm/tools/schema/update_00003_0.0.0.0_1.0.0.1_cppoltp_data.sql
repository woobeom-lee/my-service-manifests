SET client_encoding = 'UTF8';

------------------------------------------------------------------------
select '## tb_action_map';
------------------------------------------------------------------------
INSERT INTO tb_action_map (action_name,revision,"procedure",db_type,db_method,check_target,read_only,service_target,product_group,audit_target,audit_type,audit_include_data)
VALUES
    ('authenticate_node', 1, 'sp_authenticate_node(?::bigint, ?::text, ?::en_machine_type)', 'OLTP', 'PROCEDURE', '0', '0', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('authenticate_node', 2, 'sp_authenticate_node2(?::bigint, ?::text, ?::en_machine_type)', 'OLTP', 'PROCEDURE', '0', '0', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('authenticate_node', 7, 'sp_authenticate_node7(?::bigint, ?::text, ?::en_machine_type, ?::text, ?::text, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'AGENT', 'EMS', FALSE, null, FALSE)
    , ('authenticate_product', 1, 'sp_authenticate_product(?::text, ?::en_machine_type)', 'OLTP', 'PROCEDURE', '0', '1', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('get_agent_command', 1, 'sp_get_agent_command(?::bigint, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '1', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('get_file_uri', 1, 'sp_get_file_uri(?::bigint, ?::en_pkg_type)', 'OLTP', 'PROCEDURE', '0', '1', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('get_file_uri', 2, 'sp_get_file_uri2(?::bigint, ?::en_pkg_type, ?::inet)', 'OLTP', 'PROCEDURE_IP_CONNECTED', '0', '1', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('get_mergeable_common_policy', 1, '', 'NONE', 'NONE', '0', '1', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('get_mergeable_common_policy_private', 1, '{"sp":"sp_get_mergeable_common_policy(?::bigint, ?::en_product_feature_id_type, true)", "key":"/mergeable_policy/common/private/@2@"}', 'CACHE', 'GET', '0', '1', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('get_mergeable_common_policy_public', 1, '{"sp":"sp_get_mergeable_common_policy(?::bigint, ?::en_product_feature_id_type, false)", "key":"/mergeable_policy/common/public/@2@"}', 'CACHE', 'GET', '0', '1', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('get_mergeable_extra_policy', 1, 'sp_get_mergeable_extra_policy(?::bigint, ?::en_product_feature_id_type, ?::inet)', 'OLTP', 'PROCEDURE_IP_CONNECTED', '0', '1', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('get_ntp_config', 1, NULL, 'NONE', 'NONE', FALSE, TRUE, 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('get_policy_hash_list', 1, 'sp_get_policy_hash_list(?::bigint, ?::inet)', 'OLTP', 'PROCEDURE_IP_CONNECTED', '0', '1', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('get_product_pkg', 1, 'sp_get_product_pkg(?::bigint, ?::en_product_id_type, ?::en_platform_type, ?::int, ?::int, ?::int, ?::bool)', 'OLTP', 'PROCEDURE', '0', '1', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('get_product_pkg', 2, 'sp_get_product_pkg2(?::bigint, ?::en_product_id_type, ?::en_platform_type, ?::int, ?::int, ?::int, ?::bool, ?::inet)', 'OLTP', 'PROCEDURE_IP_CONNECTED', '0', '1', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('get_product_pkg', 3, 'sp_get_product_pkg3(?::bigint, ?::en_product_id_type, ?::en_platform_type, ?::int, ?::int, ?::int, ?::bool, ?::int, ?::inet)', 'OLTP', 'PROCEDURE_IP_CONNECTED', '0', '1', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('get_license_auth_data', 1, NULL, 'NONE', 'NONE', '0', '0', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('get_license_auth_data_hash', 1, NULL, 'NONE', 'NONE', '0', '0', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('get_product_update', 1, 'sp_get_product_update(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('get_server_config', 1, 'sp_get_server_config(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('get_server_time', 1, 'sp_get_server_time(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('get_server_time', 2, 'sp_get_server_time2(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('get_user_info', 1, 'sp_get_user_info(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('get_vmagent_info', 1, 'sp_get_vmagent_info()', 'OLTP', 'PROCEDURE', '0', '1', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('query_dept_info', 1, 'sp_query_dept_info(?::bigint, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('query_user_info', 1, 'sp_query_user_info(?::bigint, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('register_node', 1, 'sp_register_node(?::text, ?::en_machine_type, ?::text, ?::inet)', 'OLTP', 'PROCEDURE', '0', '0', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('register_node', 2, 'sp_register_node(?::text, ?::en_machine_type, ?::text, ?::inet)', 'OLTP', 'PROCEDURE', FALSE, FALSE, 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('set_user_info', 1, 'sp_set_user_info(?::bigint, ?::text, ?::text, ?::text, ?::text, ?::text, ?::boolean)', 'OLTP', 'PROCEDURE', '0', '0', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('unregister_node', 1, 'sp_unregister_node(?::bigint, ?::text, ?::en_machine_type)', 'OLTP', 'PROCEDURE', '0', '0', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('get_agent_command_target', 1, 'sp_get_agent_command_target(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('register_product', 1, 'sp_register_product(?::bigint, ?::en_product_id_type)', 'OLTP', 'PROCEDURE', '0', '0', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('register_product', 2, NULL, 'NONE', 'NONE', '0', '0', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('set_agent_alive', 1, 'sp_set_agent_alive(?::bigint, ?::en_connection_status)', 'OLTP', 'PROCEDURE', '0', '0', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('unregister_product', 1, 'sp_unregister_product(?::bigint, ?::en_product_id_type)', 'OLTP', 'PROCEDURE', '0', '0', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('add_agent_event_log', 1, '{"collection": "tb_agent_event_log"}', 'NOSQL', 'INSERT', '0', '0', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('set_agent_status', 1, NULL, 'NONE', 'NONE', '0', '0', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('add_policy_status_log', 1, '{"collection":"tb_policy_status_log"}', 'NOSQL', 'INSERT', '0', '0', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_status_log', 1, '{"collection": "tb_task_status_log"}', 'NOSQL', 'INSERT', '0', '0', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('set_hw_all', 1, NULL, 'NONE', 'NONE', '0', '0', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('set_sw_all', 1, NULL, 'NONE', 'NONE', '0', '0', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('get_action_revision', 1, '{"sp":"sp_get_action_revision()", "key":"/agent/server/info/revision"}', 'CACHE', 'GET', '0', '1', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('get_node_hash', 1, '{"sp":"sp_get_node_hash(?::bigint, ?::en_node_hash_type)", "key":"/hash/@1@/@2@"}', 'CACHE', 'GET', '0', '1', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('get_node_hash_list', 1, '{"sp":"sp_get_node_hash_list(?::bigint)", "key":"/hash/@1@", "get_like_key":"node_hash_type"}', 'CACHE', 'GET_LIKE', '0', '1', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('get_node_policy', 1, 'sp_get_node_policy(?::bigint, ?::en_product_feature_id_type)', 'OLTP', 'PROCEDURE', '0', '1', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('get_policy', 1, '{"sp":"sp_get_policy(?::integer)", "key":"/policy/@1@" }', 'CACHE', 'GET', '0', '1', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('set_agent_info', 1, '{"key":"/hash/@1@/@2@","value":[{"node_hash_type":"@2@","hash_value":"@3@"}],"rdb_type":"OLTP","sp":"sp_set_agent_info1(?::bigint, ?::en_node_hash_type, ?::text, ?::inet, ?::text, ?::text, ?::text, ?::text, ?::en_language, ?::text[], ?::text, ?::int, ?::timestamptz, ?::int, ?::inet)","remove_sp_params" : []}', 'CACHE', 'SET_IP_CONNECTED', '0', '0', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('set_agent_info', 2, '{"key":"/hash/@1@/@2@","value":[{"node_hash_type":"@2@","hash_value":"@3@"}],"rdb_type":"OLTP","sp":"sp_set_agent_info2(?::bigint, ?::en_node_hash_type, ?::text, ?::inet, ?::text, ?::text, ?::text, ?::text, ?::en_language, ?::text[], ?::text, ?::int, ?::timestamptz, ?::int, ?::text, ?::inet)","remove_sp_params" : []}', 'CACHE', 'SET_IP_CONNECTED', '0', '0', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('set_agent_info', 7, '{"key":"/hash/@1@/@2@","value":[{"node_hash_type":"@2@","hash_value":"@3@"}],"rdb_type":"OLTP","sp":"sp_set_agent_info7(?::bigint, ?::en_node_hash_type, ?::text, ?::inet, ?::text, ?::text, ?::text, ?::text, ?::en_language, ?::text[], ?::text, ?::int, ?::timestamptz, ?::int, ?::text, ?::text, ?::text, ?::text, ?::text, ?::text, ?::text, ?::text, ?::text, ?::text, ?::inet)","remove_sp_params" : []}', 'CACHE', 'SET_IP_CONNECTED', '0', '0', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('set_agent_info', 8, '{"key":"/hash/@1@/@2@","value":[{"node_hash_type":"@2@","hash_value":"@3@"}],"rdb_type":"OLTP","sp":"sp_set_agent_info8(?::bigint, ?::en_node_hash_type, ?::text, ?::inet, ?::text, ?::text, ?::text, ?::text, ?::en_language, ?::text[], ?::text, ?::int, ?::timestamptz, ?::int, ?::text, ?::text, ?::text, ?::text, ?::text, ?::text, ?::text, ?::text, ?::text, ?::text, ?::text, ?::text, ?::text, ?::inet)","remove_sp_params" : []}', 'CACHE', 'SET_IP_CONNECTED', '0', '0', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('set_agent_info', 9, '{"key":"/hash/@1@/@2@","value":[{"node_hash_type":"@2@","hash_value":"@3@"}],"rdb_type":"OLTP","sp":"sp_set_agent_info9(?::bigint, ?::en_node_hash_type, ?::text, ?::inet, ?::text, ?::text, ?::text, ?::text, ?::en_language, ?::text[], ?::text, ?::int, ?::timestamptz, ?::int, ?::text, ?::text, ?::text, ?::text, ?::text, ?::text, ?::text, ?::text, ?::text, ?::text, ?::text, ?::text, ?::text, ?::text, ?::text, ?::inet)","remove_sp_params" : []}', 'CACHE', 'SET_IP_CONNECTED', FALSE, FALSE, 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('get_pkg_url', 1, 'sp_get_pkg_url(?::bigint, ?::bigint, ?::inet)', 'OLTP', 'PROCEDURE', '0', '1', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('get_update_pkg_list', 1, 'sp_get_update_pkg_list(?::en_pkg_type[])', 'OLTP', 'PROCEDURE', '0', '1', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('add_v3_alert_log', 1, '{"collection": "tb_v3_alert_log"}', 'NOSQL', 'INSERT', '0', '0', 'AGENT', 'V3', FALSE, NULL, FALSE)
    , ('add_v3_device_log', 1, '{"collection": "tb_v3_device_log"}', 'NOSQL', 'INSERT', '0', '0', 'AGENT', 'V3', FALSE, NULL, FALSE)
    , ('add_v3_is_log', 1, '{"collection": "tb_v3_is_log"}', 'NOSQL', 'INSERT', '0', '0', 'AGENT', 'V3', FALSE, NULL, FALSE)
    , ('add_v3_ss_log', 1, '{"collection": "tb_v3_ss_log"}', 'NOSQL', 'INSERT', '0', '0', 'AGENT', 'V3', FALSE, NULL, FALSE)
    , ('add_v3_sup_log', 1, '{"collection": "tb_v3_sup_log"}', 'NOSQL', 'INSERT', '0', '0', 'AGENT', 'V3', FALSE, NULL, FALSE)
    , ('add_v3_quar_log', 1, '{"collection": "tb_v3_quar_log"}', 'NOSQL', 'INSERT', '0', '0', 'AGENT', 'V3', FALSE, NULL, FALSE)
    , ('set_v3_status', 1, NULL, 'NONE', 'NONE', '0', '0', 'AGENT', 'V3', FALSE, NULL, FALSE)
    , ('get_file_update_server_list', 1, 'sp_get_file_update_server_list(?::bigint, ?::en_file_update_target_type)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_file_update_server', 1, 'sp_set_file_update_server(?::bigint, ?::en_file_update_target_type, ?::bigint[], ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_platform_group', 1, 'sp_get_platform_group()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_agent_install_page_info', 1, '{"path":"/agent_install_page", "sp":"sp_set_agent_install_page_info(?::text)"}', 'CLUSTER', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', TRUE, 'SET_AGENT_INSTALL_PAGE_INFO',TRUE)
    , ('set_distribution_config', 1, '{"path":"/domain/dist/config", "sp":"sp_set_distribution_config(?::integer, ?::integer, ?::boolean, ?::text, ?::text[], ?::text[], ?::text[])"}', 'CLUSTER', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', TRUE, 'SET_DISTRIBUTION_CONFIG', FALSE)
    , ('add_admin', 1, 'sp_add_admin(?::text, ?::text, ?::text, ?::text, ?::bigint, ?::bigint, ?::en_product_group_type[], ?::text, ?::integer, ?::text, ?::text, ?::text, ?::text, ?::integer, ?::integer, ?::text, ?::text, ?::text, ?::boolean, ?::text, ?::boolean)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, 'ADD_ADMIN',TRUE)
    , ('add_agent_policy', 1, 'sp_add_agent_policy(?::text, ?::text, ?::text, ?::text, ?::boolean, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_alert_template', 1, 'sp_add_alert_template(?::text, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', TRUE, 'ADD_ALERT_TEMPLATE',FALSE)
    , ('add_beginning_admin', 1, 'sp_add_beginning_admin(?::text, ?::text, ?::text, ?::text, ?::text, ?::text, ?::integer, ?::integer, ?::integer, ?::boolean, ?::text, ?::boolean, ?::text[])', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_beginning_config_server', 1, 'sp_add_config_server(?::text, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_config_server', 1, 'sp_add_config_server(?::text, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', TRUE, 'ADD_SERVER_SERVICE',FALSE)
    , ('add_correlation_rule', 1, 'sp_add_correlation_rule(?::boolean, ?::boolean, ?::text, ?::boolean, ?::text, ?::integer, ?::text, ?::text, ?::en_base_report_id_type, ?::bigint, ?::boolean, ?::boolean, ?::text, ?::en_correlation_condition_id_type[], ?::text[], ?::en_comparison_operator[], ?::integer[], ?::bigint[], ?::en_task_type[], ?::bigint[], ?::text[], ?::boolean, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_custom_privilege_profile', 1, 'sp_add_custom_privilege_profile(?::text, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, 'ADD_CUSTOM_PRIVILEGE_PROFILE',FALSE)
    , ('add_group', 1, 'sp_add_group(?::text, ?::bigint)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_group_node', 1, 'sp_add_group_node(?::bigint, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_license', 1, 'sp_add_license(?::text, ?::en_product_id_type, ?::en_license_sub_type)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', TRUE, 'PRODUCT_LICENSE_ADD',FALSE)
    , ('add_multi_admin', 1, '', 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', TRUE, 'ADD_MULTI_ADMIN',TRUE)
    , ('add_policy_task', 1, 'sp_add_policy_task(?::bigint, ?::bigint[], ?::text, ?::text, ?::boolean)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_query_report', 1, 'sp_add_query_report(?::text, ?::text, ?::text, ?::text[][])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_report_schedule', 1, 'sp_add_report_schedule(?::text, ?::text, ?::text, ?::en_report_type, ?::en_base_report_id_type, ?::bigint, ?::en_schedule_period_type, ?::timestamp, ?::timestamp, ?::text[], ?::text, ?::bigint, ?::text, ?::boolean, ?::en_schedule_type, ?::text, ?::boolean, ?::boolean)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)

    , ('add_task_realtime_v3_product_update', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, null, null, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('add_task_realtime_collect_hardware', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_realtime_collect_software', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_realtime_remove_agent', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_realtime_delete_agent', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_realtime_v3_remove_product', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, null, ?::text, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_realtime_send_notice', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_schedule_generate_report', 1, 'sp_add_task_schedule(?::en_task_type, ?::text, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_realtime_send_mail', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_schedule_apply_policy', 1, 'sp_add_task_schedule(?::en_task_type, ?::text, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_schedule_collect_software', 1, 'sp_add_task_schedule(?::en_task_type, ?::text, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_schedule_deploy', 1, 'sp_add_task_schedule(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, ?::text, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_schedule_edr_collect_ahnreport', 1, 'sp_add_task_schedule(?::en_task_type, ?::text, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_schedule_init_user_info', 1, 'sp_add_task_schedule(?::en_task_type, ?::text, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_schedule_modify_share_folder_auth', 1, 'sp_add_task_schedule(?::en_task_type, ?::text, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_schedule_modify_user_info', 1, 'sp_add_task_schedule(?::en_task_type, ?::text, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_schedule_notification_center', 1, 'sp_add_task_schedule(?::en_task_type, ?::text, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_schedule_remove_agent', 1, 'sp_add_task_schedule(?::en_task_type, ?::text, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_schedule_restart_agent', 1, 'sp_add_task_schedule(?::en_task_type, ?::text, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_schedule_send_mail', 1, 'sp_add_task_schedule(?::en_task_type, ?::text, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_schedule_send_notice', 1, 'sp_add_task_schedule(?::en_task_type, ?::text, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_schedule_set_server', 1, 'sp_add_task_schedule(?::en_task_type, ?::text, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_schedule_v3_exec_scan', 1, 'sp_add_task_schedule(?::en_task_type, ?::text, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('add_task_schedule_v3_exec_scan', 2, 'sp_add_task_schedule(?::en_task_type, ?::text, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('add_task_schedule_v3_product_update', 1, 'sp_add_task_schedule(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, null, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('add_task_realtime_generate_report', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_realtime_edr_collect_ahnreport', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_realtime_init_user_info', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_realtime_modify_user_info', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_realtime_restart_agent', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_realtime_check_agent_status', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_realtime_check_integrity', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_realtime_set_server', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_realtime_check_server_integrity', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_realtime_engine_update', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_realtime_generate_server_report', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_realtime_patch_server', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_schedule_check_server_integrity', 1, 'sp_add_task_schedule(?::en_task_type, ?::text, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_schedule_engine_update', 1, 'sp_add_task_schedule(?::en_task_type, ?::text, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_schedule_generate_server_report', 1, 'sp_add_task_schedule(?::en_task_type, ?::text, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_schedule_patch_server', 1, 'sp_add_task_schedule(?::en_task_type, ?::text, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_realtime_run_dtb', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, null, ?::text, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_schedule_run_dtb', 1, 'sp_add_task_schedule(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, ?::text, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_realtime_apply_policy', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_realtime_deploy', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, null, ?::text, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_realtime_notification_center', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_realtime_patch_agent', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, null, null, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_realtime_am_service_activate', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, null, null, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_realtime_v3_exec_optimization', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('add_task_realtime_v3_exec_scan', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('add_task_realtime_v3_exec_scan', 2, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('add_task_realtime_v3_stop_scan', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('add_task_realtime_v3_stop_scan', 2, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('add_task_realtime_v3_collect_fel', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('add_task_schedule_v3_collect_fel', 1, 'sp_add_task_schedule(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, null, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('add_task_schedule_check_agent_status', 1, 'sp_add_task_schedule(?::en_task_type, ?::text, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_schedule_check_integrity', 1, 'sp_add_task_schedule(?::en_task_type, ?::text, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_schedule_collect_hardware', 1, 'sp_add_task_schedule(?::en_task_type, ?::text, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_schedule_patch_agent', 1, 'sp_add_task_schedule(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, null, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_schedule_v3_exec_optimization', 1, 'sp_add_task_schedule(?::en_task_type, ?::text, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('add_v3_linux_policy', 1, 'sp_add_v3_linux_policy(?::text, ?::text, ?::text, ?::text, ?::boolean, ?::text, ?::text, ?::boolean, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('add_v3_net_policy', 1, 'sp_add_v3_net_policy(?::text, ?::text, ?::text, ?::text, ?::boolean, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('add_widget', 1, 'sp_add_widget(?::text[], ?::text[], ?::bigint[], ?::bigint[], ?::text[], ?::text[], ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('check_server_all_update', 1, 'sp_get_server_update_info())', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('execute_server_all_update', 1, 'sp_get_server_update_info()', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_action_map_procedure', 1, 'sp_get_action_map_procedure(?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_admin', 1, 'sp_get_admin(?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_admin_list', 1, 'sp_get_admin_list(?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_admin_login_status_list', 1, 'sp_get_admin_login_status_list(?::text[])', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_admin_privilege_profile', 1, 'sp_get_admin_privilege_profile(?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_admin_privilege_profile_list', 1, 'sp_get_admin_privilege_profile_list(?::text, ?::en_privilege_profile_type)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_agent_applied_policy', 1, 'sp_get_agent_applied_policy(?::bigint[], ?::en_product_feature_id_type[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_group_update_server_list', 1, 'sp_get_group_update_server_list(?::bigint[])', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_agent_install_page_info', 1, 'sp_get_agent_install_page_info()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_agent_list', 1, 'sp_get_agent_list(?::en_product_id_type)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_agent_master', 1, 'sp_get_agent_master()', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_agent_policy_applied_summary_info', 1, 'sp_get_agent_policy_applied_summary_info(?::bigint[])', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_agent_policy_detail', 1, 'sp_get_agent_policy_detail(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_agent_policy_factory', 1, 'sp_get_agent_policy_factory(?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_agent_user_info', 1, 'sp_get_agent_user_info(?::bigint, ?::boolean, ?::bigint, ?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_alert_correlation_rule', 1, 'sp_get_alert_correlation_rule()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_system_alert_correlation_rule_item', 1, 'sp_get_system_alert_correlation_rule_item(?::en_correlation_condition_id_type)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_alert_template_list', 1, 'sp_get_alert_template_list(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_anti_virus_product_list', 1, 'sp_get_anti_virus_product_list(?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_artifacts_task_list', 1, 'sp_get_artifacts_task_list(?::text, ?::timestamp, ?::timestamp)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_base_report', 1, 'sp_get_base_report(?::en_base_report_id_type)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_base_report_layout', 1, 'sp_get_base_report_layout(?::text, ?::en_base_report_id_type)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_base_report_list', 1, 'sp_get_base_report_list()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_beginning_config_list', 1, 'sp_get_config_list(?::en_config_group[])', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_beginning_license_list', 1, 'sp_get_beginning_license_list()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_beginning_progress_status', 1, 'sp_get_wizard_step()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_beginning_server_service_list', 1, 'sp_get_server_service_list()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_check_group_list', 1, 'sp_get_check_group_list()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_config_group_list', 1, 'sp_get_config_group_list(?::en_config_group)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_config_list', 1, 'sp_get_config_list(?::en_config_group[])', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_correlation_condition_list', 1, 'sp_get_correlation_condition_list(?::en_correlation_type)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_correlation_exclude', 1, 'sp_get_correlation_exclude(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_correlation_rule', 1, 'sp_get_correlation_rule(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_correlation_rule_item', 1, 'sp_get_correlation_rule_item(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_correlation_rule_list', 1, 'sp_get_correlation_rule_list(?::boolean, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_correlation_task', 1, 'sp_get_correlation_task(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_current_iso_time', 1, 'sp_get_current_iso_time()', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_dashboard_domain_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_dashboard_domain_list', 2, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_db_mgmt_list', 1, 'sp_get_db_mgmt_list(?::en_db_mgmt_type, ?::inet, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_department_list', 1, 'sp_get_department_list()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_deploy_detail', 1, 'sp_get_deploy_detail(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_deploy_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_deploy_manifest_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_dist_range_config_list', 1, 'sp_get_dist_range_config_list(?::boolean)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_domain_information', 1, 'sp_get_domain_information()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_download_address', 1, 'sp_get_download_address()', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_group_list', 1, 'sp_get_group_list(?::bigint, ?::boolean, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_group_name_path', 1, 'sp_get_group_name_path(?::bigint, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_group_node_array', 1, 'sp_get_group_node_array(?::bigint[], ?::en_platform_type[], ?)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_group_node_list', 1, 'sp_get_group_node_list(?::bigint, ?::boolean, ?)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_group_order_setting', 1, 'sp_get_group_order_setting()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_group_top', 1, 'sp_get_group_top(?::en_group_type, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_license', 1, 'sp_get_license(?::text, ?::en_product_id_type)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_license_expire', 1, 'sp_get_license_expire_list(?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_license_list', 1, 'sp_get_license_list(?::en_product_group_type)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_license_product_list', 1, 'sp_get_license_product_list(?::en_product_group_type)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_log_config_list', 1, 'sp_get_log_config_list(?::en_product_group_type)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_login_fail_status', 1, 'sp_get_login_fail_status(?::bigint, ?::text, ?::inet)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_login_status_id', 1, 'sp_get_login_status_id(?::text, ?::inet)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_login_status_list', 1, 'sp_get_login_status_list(?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_login_status_privilege', 1, 'sp_get_login_status_privilege(?::bigint, ?::inet, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_mail_config', 1, 'sp_get_mail_config()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_manual_config', 1, 'sp_get_manual_config(?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_net_cert_mgmt_list', 1, 'sp_get_net_cert_mgmt_list()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_node_info_by_id', 1, 'sp_get_node_info_by_id(?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_node_list', 1, 'sp_get_node_list(?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_notification_center_list', 1, 'sp_get_notification_center_list(?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_notification_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('get_open_source_list', 1, 'sp_get_open_source_list()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_otp_support_environment', 1, 'sp_get_config_group(?::en_config_group, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_password_expire', 1, 'sp_get_password_expire(?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_pkg_list_by_id', 1, 'sp_get_pkg_list_by_id(?::bigint)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_policy_agent_apply_list', 1, 'sp_get_policy_agent_apply_list(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_policy_apply_list', 1, 'sp_get_policy_apply_list(?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_policy_detail', 1, 'sp_get_policy_detail(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_policy_factory', 1, 'sp_get_policy_factory(?::en_product_feature_id_type)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_policy_group_apply_list', 1, 'sp_get_policy_group_apply_list(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_policy_list', 1, 'sp_get_policy_list(?::en_product_feature_id_type, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_policy_array_list', 1, 'sp_get_policy_array_list(?::en_product_feature_id_type[])', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_predefined_policy_data', 1, 'sp_get_predefined_policy_data(?::en_predefined_policy_data_type)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_private_ip_range', 1, NULL, 'NONE', 'NONE', false, false, 'CONSOLE', 'EMS', false, null, false)
    , ('get_privilege_profile', 1, 'sp_get_privilege_profile(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_privilege_profile_list', 1, 'sp_get_privilege_profile_list(?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_product_group_list', 1, 'sp_get_product_group_list()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_product_info', 1, 'sp_get_product_info(?::en_product_id_type)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_product_list', 1, 'sp_get_product_list()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_security_product_list', 1, 'sp_get_security_product_list()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_product_list_by_group', 1, 'sp_get_product_list_by_group(?::en_product_group_type)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_product_pkg_list', 1, 'sp_get_product_pkg_list(?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_product_policy_list', 1, 'sp_get_product_policy_list(?::en_product_feature_id_type)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_product_version', 1, 'sp_get_product_version()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_query_report', 1, 'sp_get_query_report(?::text, ?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_query_report_item_list', 1, 'sp_get_query_report_item_list(?::text, ?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_query_report_list', 1, 'sp_get_query_report_list(?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_report_schedule', 1, 'sp_get_report_schedule(?::text, ?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_report_schedule_list', 1, 'sp_get_report_schedule_list(?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_rtcommand', 1, 'sp_get_rtcommand(?::bigint, ?::en_task_type)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_search_file_task_list', 1, 'sp_get_search_file_task_list(?::text, ?::timestamp, ?::timestamp)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_server_in_ip', 1, 'sp_get_server_in_ip(?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_server_service_list', 1, 'sp_get_server_service_list()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_server_version', 1, 'sp_get_server_update_info()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_service_port_list', 1, 'sp_get_service_port_list()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_service_status', 1, 'sp_get_service_status()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_syslog_item_list', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('get_syslog_server_list', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('get_syslog_server', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('add_syslog', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('set_syslog', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('remove_syslog', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_table_clean_config_list', 1, 'sp_get_table_clean_config_list()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_task', 1, 'sp_get_task(?::text, ?::bigint, ?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_task_favorite_cnt_list', 1, 'sp_get_task_favorite_cnt_list()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_task_favorite_list', 1, 'sp_get_task_favorite_list(?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_task_list', 1, 'sp_get_task_list(?::text, ?::timestamp, ?::timestamp)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_task_notification_complete', 1, 'sp_get_task_notification_complete(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_task_notification_list', 1, 'sp_get_task_notification_list(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_task_schedule_detail', 1, 'sp_get_task_schedule_detail(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_task_schedule_list', 1, 'sp_get_task_schedule_list(?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_task_send_mail_list', 1, 'sp_get_task_send_mail_list(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_task_target', 1, 'sp_get_task_target(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_task_target_agent_status_list', 1, 'sp_get_task_target_status_list(?::bigint, ?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_task_target_server_list', 1, 'sp_get_task_target_server_list(?::bigint[])', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_task_type', 1, 'sp_get_task_type()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_update_server_type', 1, 'sp_get_update_server_type()', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_v3_linux_policy_detail', 1, 'sp_get_v3_linux_policy_detail(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('get_v3_linux_policy_factory', 1, 'sp_get_v3_linux_policy_factory(?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('get_v3_management_summary_info', 1, 'sp_get_v3_management_summary_info(?::bigint, ?::boolean, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('get_v3_net_policy_detail', 1, 'sp_get_v3_net_policy_detail(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('get_v3_net_policy_factory', 1, 'sp_get_v3_net_policy_factory(?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('get_view_layout', 1, 'sp_get_view_layout(?::en_view_type, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_widget', 1, 'sp_get_widget(?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_widget_item_layout', 1, 'sp_get_widget_item_layout(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_widget_layout', 1, 'sp_get_widget_layout(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('register_v3_pkg', 1, '', 'NONE', 'NONE', '0', '0', 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('remove_admin', 1, 'sp_remove_admin(?::text, ?::text[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', TRUE, 'REMOVE_ADMIN',FALSE)
    , ('remove_agent_policy', 1, 'sp_remove_agent_policy(?::bigint, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('remove_alert_template', 1, 'sp_remove_alert_template(?::bigint)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', TRUE, 'REMOVE_ALERT_TEMPLATE',FALSE)
    , ('remove_artifacts', 1, '', 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('remove_base_report_layout', 1, 'sp_remove_base_report_layout(?::text, ?::en_base_report_id_type, ?::text[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('remove_beginning_config_server', 1, 'sp_remove_config_server(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('remove_config_server', 1, 'sp_remove_config_server(?::bigint)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('remove_correlation_rule', 1, 'sp_remove_correlation_rule(?::bigint)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('remove_custom_privilege_profile', 1, 'sp_remove_custom_privilege_profile(?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, 'REMOVE_CUSTOM_PRIVILEGE_PROFILE',FALSE)
    , ('remove_group', 1, 'sp_remove_group(?::bigint)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('remove_group_node', 1, 'sp_remove_group_node(?::bigint, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('remove_license', 1, 'sp_remove_license(?::text, ?::en_product_id_type)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', TRUE, 'PRODUCT_LICENSE_REMOVE',FALSE)
    , ('remove_license_cert_file', 1, 'sp_remove_license_cert_file()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', TRUE, 'PRIVATE_LICENSE_UPLOAD_REMOVE',FALSE)
    , ('remove_login_status', 1, 'sp_remove_login_status(?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('remove_product_install_pkg', 1, 'sp_remove_product_install_pkg(?::bigint)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, '에이전트 설치 파일 Windows 에이전트 파일 삭제',TRUE)
    , ('remove_query_report', 1, 'sp_remove_query_report(?::text, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('remove_report_logo_image', 1, 'sp_remove_report_logo_image()', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('remove_report_schedule', 1, 'sp_remove_report_schedule(?::text, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('remove_report_status', 1, 'sp_get_report_schedule_id_array(?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('remove_report_status_item', 1, 'sp_check_report_status_list(?::text, ?::bigint[], ?::integer[], ?::text[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('remove_task', 1, 'sp_remove_task(?::text, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('remove_task_schedule', 1, 'sp_remove_task_schedule(?::text, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('remove_user_info', 1, 'sp_remove_user_info(?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('remove_v3_linux_policy', 1, 'sp_remove_v3_linux_policy(?::bigint, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('remove_v3_net_policy', 1, 'sp_remove_v3_net_policy(?::bigint, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('remove_v3_pkg', 1, '', 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('remove_widget', 1, 'sp_remove_widget(?::bigint, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_admin', 1, 'sp_set_admin(?::text, ?::text, ?::text, ?::text, ?::bigint, ?::bigint, ?::en_product_group_type[], ?::text, ?::integer, ?::text, ?::text, ?::text, ?::text, ?::integer, ?::integer, ?::text, ?::text, ?::text, ?::boolean, ?::text, ?::boolean)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, 'SET_ADMIN',TRUE)
    , ('set_admin_by_self', 1, 'sp_set_admin_by_self(?::text, ?::text, ?::text, ?::text, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, 'SET_ADMIN', FALSE)
    , ('set_admin_password', 1, 'sp_set_admin_password(?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', TRUE, 'SET_ADMIN', FALSE)
    , ('set_agent_mgmt_key', 1, 'sp_set_agent_mgmt_key(?::text, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, 'SET_AGENT_MGMT_KEY', FALSE)
    , ('set_agent_policy', 1, 'sp_set_agent_policy(?::bigint, ?::text, ?::text, ?::text, ?::text, ?::boolean, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_agent_threshold', 1, 'sp_set_agent_threshold(?::integer, ?::integer, ?::integer, ?::integer)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', TRUE, 'SET_AGENT_THRESHOLD',FALSE)
    , ('set_agent_risk_group', 1, 'sp_set_agent_risk_group(?::boolean, ?::integer, ?::boolean, ?::integer)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', TRUE, 'SET_AGENT_RISK_GROUP',FALSE)
    , ('set_agent_risk_group_clean', 1, 'sp_set_agent_risk_group_clean(?::boolean, ?::integer, ?::boolean, ?::integer)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', TRUE, 'SET_AGENT_RISK_GROUP_CLEAN',FALSE)
    , ('set_alert_correlation_rule', 1, 'sp_set_alert_correlation_rule(?::bigint, ?::en_correlation_type, ?::boolean, ?::integer, ?::text, ?::en_comparison_operator, ?::boolean, ?::bigint, ?::boolean, ?::boolean, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', TRUE, 'SET_ALERT_CORRELATION_RULE',FALSE)
    , ('set_alert_template', 1, 'sp_set_alert_template(?::bigint, ?::text, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', TRUE, 'SET_ALERT_TEMPLATE',FALSE)
    , ('set_auto_grouping', 1, 'sp_set_auto_grouping(?::bigint, ?::text, ?::en_machine_type, ?::inet, ?::text, ?::text, ?::text, ?::en_platform_id_type, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_base_report_layout', 1, 'sp_set_base_report_layout(?::text, ?::en_base_report_id_type, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_beginning_mail_server', 1, 'sp_set_mail_server(?::text, ?::text, ?::integer, ?::boolean, ?::text, ?::text, ?::text, ?::boolean, ?::boolean, ?::boolean)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_beginning_server_service', 1, 'sp_set_server_service(?::text[][])', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_beginning_system_eula', 1, 'sp_set_system_eula(?::en_product_group_type, ?::boolean, ?::boolean)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_beginning_system_info', 1, 'sp_set_beginning_system_info(?::text, ?::text, ?::text, ?::text, ?::text, ?::text, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_beginning_system_info', 2, 'sp_set_beginning_system_info(?::text, ?::text, ?::text, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_correlation_rule', 1, 'sp_set_correlation_rule(?::integer, ?::integer, ?::integer, ?::integer, ?::integer, ?::bigint, ?::text, ?::boolean, ?::text, ?::integer, ?::text, ?::text, ?::en_base_report_id_type, ?::bigint, ?::boolean, ?::boolean, ?::text, ?::en_correlation_condition_id_type[], ?::text[], ?::en_comparison_operator[], ?::integer[], ?::bigint[], ?::en_task_type[], ?::bigint[], ?::text[], ?::boolean, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_custom_privilege_profile', 1, 'sp_set_custom_privilege_profile(?::bigint, ?::text, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, 'SET_CUSTOM_PRIVILEGE_PROFILE',FALSE)
    , ('set_db_backup_config', 1, 'sp_set_db_backup_config(?::boolean, ?::text, ?::integer, ?::boolean, ?::text, ?::text, ?::integer, ?::boolean, ?::text, ?::text, ?::text, ?::text[], ?::boolean, ?::text, ?::text, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', TRUE, 'SET_DATABASE_BACKUP',FALSE)
    , ('set_each_agent_policy_apply', 1, 'sp_set_each_agent_policy_apply(?::bigint, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_each_policy_apply', 1, 'sp_set_each_policy_apply(?::bigint, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_each_v3_linux_policy_apply', 1, 'sp_set_each_v3_linux_policy_apply(?::bigint, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('set_each_v3_net_policy_apply', 1, 'sp_set_each_v3_net_policy_apply(?::bigint, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('set_group', 1, 'sp_set_group(?::bigint, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_group_agent_policy_apply', 1, 'sp_set_group_agent_policy_apply(?::bigint, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_group_order', 1, 'sp_set_group_order()', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_group_order_setting', 1, 'sp_set_group_order_setting(?::text, ?::text, ?::text[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_group_policy_apply', 1, 'sp_set_group_policy_apply(?::bigint, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_group_v3_linux_policy_apply', 1, 'sp_set_group_v3_linux_policy_apply(?::bigint, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('set_group_v3_net_policy_apply', 1, 'sp_set_group_v3_net_policy_apply(?::bigint, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('set_grouping_config', 1, 'sp_set_grouping_config(?::boolean, ?::text, ?::text, ?::text, ?::text, ?::text, ?::boolean, ?::integer)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', TRUE, 'SET_GROUPING_CONFIG',FALSE)
    , ('set_license', 1, 'sp_set_license(?::text, ?::en_product_id_type, ?::en_license_sub_type, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', TRUE, 'PRODUCT_LICENSE_SET',FALSE)
    , ('set_log_configs', 1, 'sp_set_log_configs(?::en_product_group_type[], ?::en_log_type[], ?::boolean[], ?::integer)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', TRUE, 'SET_LOG_CONFIGS',FALSE)
    , ('set_mail_server', 1, 'sp_set_mail_server(?::text, ?::text, ?::integer, ?::boolean, ?::text, ?::text, ?::text, ?::boolean, ?::boolean, ?::boolean)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', TRUE, 'MAIL_SERVER_SET',FALSE)
    , ('send_mail', 1, '', 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_manual_config', 1, 'sp_set_manual_config(?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', TRUE, 'SET_MANUAL_CONFIG',FALSE)
    , ('set_mergeable_common_policy', 1, 'sp_set_mergeable_common_policy(?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_net_cert_mgmt_customer', 1, 'sp_set_net_cert_mgmt_customer(?::text, ?::text, ?::text, ?::text, ?::text, ?::text, ?::boolean)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, 'NET_CERT_CUSTOMER_UPLOAD_SET',TRUE)
    , ('set_net_cert_mgmt_epp', 1, 'sp_set_net_cert_mgmt_epp(?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, 'NET_CERT_EPP_SET',FALSE)
    , ('set_notification_center', 1, 'sp_set_notification_center(?::en_notification_type, ?::text, ?::en_notification_sub_type, ?::en_notification_status_type, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_policy_schedule', 1, 'sp_set_policy_schedule(?::bigint)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_product_install_pkg', 1, 'sp_set_product_install_pkg(?::text, ?::en_pkg_type, ?::text, ?::text, ?::en_product_id_type, ?::text, ?::text, ?::bigint, ?::en_platform_type)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, '에이전트 설치 파일 설치본 생성',TRUE)
    , ('modify_agent_installer', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', '에이전트 설치본 버전 변경', '0') 
    , ('set_query_report', 1, 'sp_set_query_report(?::text, ?::bigint, ?::text, ?::text, ?::text[][])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_report_clean', 1, 'sp_get_report_clean()', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_report_clean', 1, 'sp_set_report_clean(?::integer)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', TRUE, 'SET_REPORT_CLEAN',FALSE)
    , ('set_report_logo_image', 1, 'sp_set_report_logo_image(?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', TRUE, 'SET_REPORT_LOGO_IMAGE',TRUE)
    , ('set_report_logo_position', 1, 'sp_set_report_logo_position(?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', TRUE, 'SET_REPORT_LOGO_POSITION',FALSE)
    , ('set_report_schedule', 1, 'sp_set_report_schedule(?::text, ?::bigint, ?::en_report_type, ?::en_base_report_id_type, ?::bigint, ?::en_schedule_period_type, ?::timestamp, ?::timestamp, ?::text[], ?::text, ?::boolean, ?::text, ?::bigint, ?::text, ?::text, ?::en_schedule_type, ?::text, ?::boolean, ?::boolean)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_server_service', 1, 'sp_set_server_service(?::text[][])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', TRUE, 'SET_SERVER_SERVICE',FALSE)
    , ('set_service_port', 1, 'sp_set_service_port(?::en_service_type[], ?::integer[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', TRUE, 'SET_SERVICE_PORT',FALSE)
    , ('set_system_eula', 1, 'sp_set_system_eula(?::en_product_group_type, ?::boolean, ?::boolean)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_system_info', 1, 'sp_set_system_info(?::text, ?::text, ?::text, ?::boolean, ?::text, ?::text, ?::text, ?::text, ?::integer, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', TRUE, 'SYSTEM_SETTING_SAVE',FALSE)
    , ('set_system_info', 2, 'sp_set_system_info(?::text, ?::text, ?::text, ?::integer, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', TRUE, 'SYSTEM_SETTING_SAVE',FALSE)
    , ('get_table_clean_config', 1, 'sp_get_table_clean_config()', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_table_clean_config', 1, 'sp_set_table_clean_config(?::text, ?::integer, ?::en_clean_table_type[], ?::boolean[], ?::en_product_group_type[], ?::bigint[], ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', TRUE, 'SET_DATABASE_CLEAN',FALSE)
    , ('set_task_favorite_list', 1, 'sp_set_task_favorite_list(?::text, ?::text[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_task_schedule', 1, 'sp_set_task_schedule(?::bigint, ?::en_task_type, ?::text, ?::text, ?::text, ?::text, ?::text, ?::text, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_task_target_in_target_id', 1, 'sp_set_task_target_in_target_id(?::bigint, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_update_product_ahnlab_config', 1, 'sp_set_update_product_ahnlab_config(?::boolean, ?::text, ?::integer, ?::text, ?::text, ?::integer, ?::integer, ?::boolean, ?::text, ?::text, ?::text, ?::text, ?::text, ?::text)', 'OLTP', 'PROCEDURE', false, true, 'CONSOLE', 'EMS', TRUE, 'SET_UPDATE_PRODUCT_AHNLAB_CONFIG',FALSE)
    , ('set_update_product_ems_config', 1, 'sp_set_update_product_ems_config(?::boolean, ?::text, ?::integer, ?::text, ?::text, ?::text, ?::text)', 'OLTP', 'PROCEDURE', false, true, 'CONSOLE', 'EMS', TRUE, 'SET_UPDATE_PRODUCT_EPP_CONFIG',FALSE)
    , ('set_update_product_user_config', 1, 'sp_set_update_product_user_config(?::text, ?::boolean, ?::text, ?::integer, ?::text, ?::text, ?::integer, ?::integer, ?::boolean, ?::text, ?::text, ?::text, ?::text, ?::text, ?::text)', 'OLTP', 'PROCEDURE', false, true, 'CONSOLE', 'EMS', TRUE, 'SET_UPDATE_PRODUCT_USER_CONFIG',FALSE)
    , ('set_v3_linux_policy', 1, 'sp_set_v3_linux_policy(?::bigint, ?::text, ?::text, ?::text, ?::text, ?::boolean, ?::text, ?::text, ?::boolean, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('set_v3_net_policy', 1, 'sp_set_v3_net_policy(?::bigint, ?::text, ?::text, ?::text, ?::text, ?::boolean, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('set_v3_pkg_update', 1, 'sp_set_v3_pkg_update(?::boolean, ?::boolean, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_view_layout', 1, 'sp_set_view_layout(?::en_view_type, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_widget', 1, 'sp_set_widget(?::bigint[], ?::text[], ?::text[], ?::bigint[], ?::bigint[], ?::text[], ?::text[], ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_widget_item_layout', 1, 'sp_set_widget_item_layout(?::bigint[], ?::text[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_widget_layout', 1, 'sp_set_widget_layout(?::bigint[], ?::text[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('upload_policy_file', 1, '', 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_target_status', 1, 'sp_add_task_target_status(?::bigint, ?::en_task_type, ?::en_task_target_type, ?::bigint[], ?::bigint, ?::en_task_status, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_agent_detail_hw_info', 1, 'sp_get_agent_detail_hw_info(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_agent_detail_sw_info', 1, 'sp_get_agent_detail_sw_info(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_agent_policy_status', 1, 'sp_get_agent_policy_status(?::bigint[])', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_agent_summary_olap_info', 1, 'sp_get_agent_summary_olap_info(?::bigint[])', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_agent_timeline', 1, 'sp_get_agent_timeline(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_blocked_node_status', 1, 'sp_get_blocked_node_status(?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_correlation_rule_group', 1, 'sp_get_correlation_rule_group(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_disk_status', 1, 'sp_get_disk_status()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_domain_policy_status', 1, 'sp_get_domain_policy_status()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_engine_update', 1, 'sp_get_engine_update(?::bigint[])', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_group_agent_summary', 1, 'sp_get_group_agent_summary(?::bigint[], ?::text[])', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_group_policy_summary', 1, 'sp_get_group_policy_summary(?::bigint[], ?::text[])', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_group_timeline', 1, 'sp_get_group_timeline(?::bigint[])', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_group_v3_summary', 1, 'sp_get_group_v3_summary(?::bigint[], ?::text[])', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_node_hw', 1, 'sp_get_node_hw(?::bigint[])', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_node_hw_os', 1, 'sp_get_node_hw_os(?::bigint[])', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_node_policy_status', 1, 'sp_get_node_policy_status(?::bigint[], ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_node_sw', 1, 'sp_get_node_sw(?::bigint[])', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_policy_apply_count_list', 1, 'sp_get_policy_apply_count_list(?::bigint, ?::bigint, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_raid_status', 1, 'sp_get_raid_status()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_register_agent_summary', 1, 'sp_get_register_agent_summary(?::bigint[])', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_server_resource', 1, 'sp_get_server_resource(?::bigint[])', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_server_resource_list', 1, 'sp_get_server_resource_list()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_sw_list', 1, 'sp_get_sw_list(?::bigint[])', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_system_resource', 1, 'sp_get_system_resource()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_task_target_status_fail_list', 1, 'sp_get_task_target_status_fail_list(?::bigint[], ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_task_target_status_list', 1, 'sp_get_task_target_status_list(?::bigint, ?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_timeline', 1, 'sp_get_timeline(?::integer, ?::en_timeline_target_type, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_v3_malware_count', 1, 'sp_get_v3_malware_count(?::bigint[])', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('get_v3_product_count', 1, 'sp_get_v3_product_count(?::text,?::bigint[])', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_agent_install_pkg_log', 1, '{"collection" : "tb_agent_install_pkg_log"}', 'NOSQL', 'INSERT', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_audit_log', 1, '{"collection": "tb_audit_log"}', 'NOSQL', 'INSERT', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_db_backup_event_log', 1, '{"collection": "tb_backup_log"}', 'NOSQL', 'INSERT', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_distribution_event_log', 1, '{"collection": "tb_pkg_dist_log"}', 'NOSQL', 'INSERT', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_engine_update_event_log', 1, '{"collection": "tb_engine_update_log"}', 'NOSQL', 'INSERT', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_pkg_sync_log', 1, '{"collection" : "tb_pkg_sync_log"}', 'NOSQL', 'INSERT', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_service_event_log', 1, '{"collection": "tb_service_log"}', 'NOSQL', 'INSERT', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_agent_detail_hw_log', 1, '{"collection" : "_tb_node_hw_log", "data" : [{$match: {"node_id":@@, "client_time": {$gte: "@@"}}}] }', 'NOSQL', 'AGGREGATE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_agent_detail_sw_log', 1, '{"collection" : "_tb_node_sw_log", "data" : [{$match: {"node_id":@@, "client_time": {$gte: "@@"}}}] }', 'NOSQL', 'AGGREGATE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_agent_hw_event_log', 1, '{"collection" : "tb_node_hw", "data" : [{"$match":{"node_id":{"$in":[@@]},"hw.opcode":{"$in":["ADD","DELETE"]},"client_time":{$gt: {$date: "@utc_date_day@"}}}},{"$unwind":"$hw"},{"$sort":{"_id":-1}},{"$project":{"_id":"$_id","client_time":"$client_time","node_id":"$node_id","hw_type":"$hw.hw_type","opcode":"$hw.opcode","value":"$hw.value"}}]}', 'NOSQL', 'AGGREGATE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_agent_sw_event_log', 1, '{"collection" : "tb_node_sw", "data" : [{"$match":{"node_id":{"$in":[@@]}}},{"$unwind":"$sw"},{"$match":{"$and":[{"sw.install_time":{"$gte":{$date: "@utc_date_day@"}}},{"sw.opcode":{"$in":["ADD","DELETE"]}}]}},{"$group":{"_id":{"node_id":"$node_id","name":"$sw.name","install_time":{"$dateToString":{"format":"%Y-%m-%d","date":{"$add":["$sw.install_time",{"$multiply":["$tz_offset",3600000]}]}}}},"update_time":{"$max":{"$add":["$sw.install_time",{"$multiply":["$tz_offset",3600000]}]}},"opcode":{"$max":"$sw.opcode"}}},{"$sort":{"node_id":1,"update_time":1,"opcode":1}},{"$project":{"_id":0,"node_id":"$_id.node_id","name":"$_id.name","opcode":"$opcode","update_time":{"$dateToString":{"format":"%Y-%m-%d","date":"$update_time"}}}}]}', 'NOSQL', 'AGGREGATE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_event_log_agent_install_pkg_list', 1, '{"collection" : "tb_agent_install_pkg_log", "data" : [{"$match":{"_id":{"$gt":{"$oid": "@@"}}}},{"$sort":{"_id":-1}},{"$limit": @@},{"$project":{"_id":"$_id","file_name":"$file_name","log_string_id":"$log_string_id","log_string_args":"$log_string_args","server_time":"$server_time"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', false, true, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_event_log_audit_list', 1, '{"collection" : "tb_audit_log", "data" : [{"$match":{"_id":{"$gt":{"$oid": "@@"}}}},{"$sort":{"_id":-1}},{"$limit": @@},{"$project":{"_id":"$_id","login_ip":"$login_ip","admin_id":"$admin_id","log_string_id":"$log_string_id","log_string_args":"$log_string_args","server_time":"$server_time"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', false, true, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_event_log_backup_list', 1, '{"collection" : "tb_backup_log", "data" : [{"$match":{"_id":{"$gt":{"$oid": "@@"}}}},{"$sort":{"_id":-1}},{"$limit": @@},{"$project":{"_id":"$_id","server_id":"$server_id","server_time":"$server_time","server_ip":"$server_ip","server_name":"$server_name","log_string_id":"$log_string_id","log_string_args":"$log_string_args","type":"$type"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', false, true, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_event_log_dist_list', 1, '{"collection" : "tb_pkg_dist_log", "data" : [{"$match":{"_id":{"$gt":{"$oid": "@@"}}}},{"$sort":{"_id":-1}},{"$limit": @@},{"$project":{"_id":"$_id","server_id":"$server_id","server_time":"$server_time","server_ip":"$server_ip","server_name":"$server_name","log_string_id":"$log_string_id","log_string_args":"$log_string_args","type":"$type","package_type":"$package_type","package_name":"$package_name","log_string_id":"$log_string_id","log_string_args":"$log_string_args"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', false, true, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_event_log_engine_update_list', 1, '{"collection" : "tb_engine_update_log", "data" : [{"$match":{"_id":{"$gt":{"$oid": "@@"}}}},{"$sort":{"_id":-1}},{"$limit": @@},{"$project":{"_id":"$_id","server_id":"$server_id","server_time":"$server_time","server_ip":"$server_ip","server_name":"$server_name","log_string_id":"$log_string_id","log_string_args":"$log_string_args","type":"$type"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', false, true, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_event_log_node_hw_list', 1, '{"collection" : "tb_node_hw", "data" : [{"$unwind":{path:"$hw",includeArrayIndex:"index_num"}},{"$match":{"_id":{"$gt":{"$oid":"@@"}}}},{"$sort":{"_id":-1}},{"$limit":@@},{"$project":{"_id":"$_id","index_num":{"$add":["$index_num",1]},"client_time":"$client_time","node_id":"$node_id","ip":"$ip","computer_name":"$computer_name","login_id":"$login_id","department":"$department","hw_type":"$hw.hw_type","opcode":"$hw.opcode","value":"$hw.value"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', false, true, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_event_log_pkg_sync_list', 1, '{"collection" : "tb_pkg_sync_log", "data" : [{"$match":{"_id":{"$gt":{"$oid": "@@"}}}},{"$sort":{"_id":-1}},{"$limit": @@},{"$project": {"_id": "$_id","server_id": "$server_id","server_name": "$server_name","type": "$type","log_string_id": "$log_string_id","log_string_args": "$log_string_args","server_time": "$server_time","server_ip": "$server_ip"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', false, true, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_event_log_task_status_list', 1, '{"collection" : "tb_task_status_log", "data" : [{"$match":{"_id": { "$gt": { "$oid": "@@" } },"task_type":{"$ne":"APPLY_MERGEABLE_POLICY"}}},{"$sort":{"_id":-1}},{"$limit":@@},{"$project":{"_id":"$_id","client_time":"$client_time","node_id":"$node_id","instance_id":"$instance_id","task_type":"$task_type","task_status":"$task_status","task_error":"$task_error","product_id": {$ifNull: [ "$product_id", "AGENT"]},"tz_offset":"$tz_offset", "ip": {$ifNull: [ "$ip", ""]},"computer_name": {$ifNull: [ "$computer_name", ""]}, "department": {$ifNull: [ "$department", ""]}, "login_id": {$ifNull: [ "$login_id", ""]}}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', false, true, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_event_log_v3_alert_list', 1, '{"collection" : "tb_v3_alert_log", "data" : [{"$match":{"_id" : { "$gt": { "$oid": "@@" } }}},{"$sort":{"_id":-1}},{"$limit":@@},{"$project":{"_id":"$_id", "client_time":"$client_time", "node_id":"$node_id", "ip":"$ip", "computer_name":"$computer_name", "login_id":"$login_id", "department":"$department", "name":"$name", "file_hash":{"$ifNull":["$file_hash",""]}, "path":"$path", "status":"$status", "scan_type":"$scan_type", "owner":"$owner", "access":"$access", "infector":"$infector", "ctnr_name":"$ctnr_name", "ctnr_id":"$ctnr_id", "ctnr_img_name":"$ctnr_img_name", "ns_name":"$ns_name", "pod_id":"$pod_id", "pod_name":"$pod_name", "created_time":"$created_time", "modified_time":"$modified_time", "sha256_hash":{"$ifNull":["$sha256_hash",""]}}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', false, true, 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('get_event_log_v3_device_list', 1, '{"collection" : "tb_v3_device_log", "data" : [{"$match":{"_id": { "$gt": { "$oid": "@@" } }}},{"$sort":{"_id":-1}},{"$limit":@@},{"$project":{"_id":"$_id","client_time":"$client_time","node_id":"$node_id","ip":"$ip","computer_name":"$computer_name","login_id":"$login_id","department":"$department","function":"$function","log_string_id":"$log_string_id", "log_string_args":"$log_string_args","detail_string_id":"$detail_string_id", "detail_string_args":"$detail_string_args"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', false, true, 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('get_event_log_v3_is_list', 1, '{"collection" : "tb_v3_is_log", "data" : [{"$match":{"_id": { "$gt": { "$oid": "@@" } }}},{"$sort":{"_id":-1}},{"$limit":@@},{"$project":{"_id":"$_id","client_time":"$client_time","node_id":"$node_id","ip":"$ip","computer_name":"$computer_name","login_id":"$login_id","department":"$department","log_string_id":"$log_string_id", "log_string_args":"$log_string_args","detail_string_id":"$detail_string_id", "detail_string_args":"$detail_string_args"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', false, true, 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('get_event_log_v3_ss_list', 1, '{"collection" : "tb_v3_ss_log", "data" : [{"$match":{"_id": { "$gt": { "$oid": "@@" } }}},{"$sort":{"_id":-1}},{"$limit":@@},{"$project":{"_id":"$_id","client_time":"$client_time","node_id":"$node_id","ip":"$ip","computer_name":"$computer_name","login_id":"$login_id","department":"$department","log_string_id":"$log_string_id", "log_string_args":"$log_string_args","detail_string_id":"$detail_string_id", "detail_string_args":"$detail_string_args"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', false, true, 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('get_event_log_v3_sup_list', 1, '{"collection" : "tb_v3_sup_log", "data" : [{"$match":{"_id": { "$gt": { "$oid": "@@" } }}},{"$sort":{"_id":-1}},{"$limit":@@},{"$project":{"_id":"$_id","client_time":"$client_time","node_id":"$node_id","ip":"$ip","computer_name":"$computer_name","login_id":"$login_id","department":"$department","log_string_id":"$log_string_id", "log_string_args":"$log_string_args","detail_string_id":"$detail_string_id", "detail_string_args":"$detail_string_args"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', false, true, 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('get_event_log_v3_quar_list', 1, '{"collection" : "tb_v3_quar_log", "data" : [{"$match":{"_id": { "$gt": { "$oid": "@@" } }}},{"$sort":{"_id":-1}},{"$limit":@@},{"$project":{"_id":"$_id","client_time":"$client_time","node_id":"$node_id","ip":"$ip","computer_name":"$computer_name","login_id":"$login_id","department":"$department","log_string_id":"$log_string_id", "log_string_args":"$log_string_args","detail_string_id":"$detail_string_id", "detail_string_args":"$detail_string_args"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', false, true, 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('get_event_log_service_list', 1, '{"collection" : "tb_service_log", "data" : [{"$match":{"_id":{"$gt":{"$oid": "@@"}}}},{"$sort":{"_id":-1}},{"$limit": @@},{"$project": {"_id": "$_id","server_id": "$server_id","server_name": "$server_name","type": "$type","log_string_id": "$log_string_id","log_string_args": "$log_string_args","server_time": "$server_time","server_ip": "$server_ip"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', false, true, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_event_log_agent_event_list', 1, '{"collection" : "tb_agent_event_log", "data" : [{"$match":{"_id": { "$gt": { "$oid": "@@" } }}},{"$sort":{"_id":-1}},{"$limit":@@},{"$project":{"_id":"$_id","client_time":"$client_time","node_id":"$node_id","ip":"$ip","computer_name":"$computer_name","login_id":"$login_id","department":"$department","log_string_id":"$log_string_id", "log_string_args":"$log_string_args"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', false, true, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_event_log_node_sw_list', 1, '{"collection" : "tb_node_sw", "data" : [{"$unwind":{path:"$sw",includeArrayIndex:"index_num"}},{"$match":{"_id":{"$gt":{"$oid":"@@"}}}},{"$sort":{"_id":-1}},{"$limit":@@},{"$project":{"_id":"$_id","index_num":{"$add":["$index_num",1]},"client_time":"$client_time","node_id":"$node_id","ip":"$ip","computer_name":"$computer_name","login_id":"$login_id","department":"$department","name":"$sw.name","publisher":"$sw.publisher","size":{"$cond":[{"$eq":["$sw.size","0"]},"","$sw.size"]},"version":"$sw.version","opcode":"$sw.opcode"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', false, true, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_hwsw_event_log', 1, '{"collection" : "tb_hwsw_event_log", "data" : [{"$match":{"event_type":{"$in":[@@]},"client_time":{$gt: {$date: "@utc_date_day@"}}}}]}', 'NOSQL', 'AGGREGATE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_report_latest_list', 1, '{"collection" : "tb_report_status", "data" : [{"$match":{"report_status":"COMPLETED","report_schedule_id":{"$in":[@@]}}},{"$group":{"_id":{"report_schedule_id":"$report_schedule_id","item_order":"$item_order"},"create_time":{"$max":"$create_time"}}},{"$project":{"_id":0,"report_schedule_id":"$_id.report_schedule_id","item_order":"$_id.item_order","create_time":"$create_time"}}]}', 'NOSQL', 'AGGREGATE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_report_status', 1, '{"collection":"tb_report_status", "data":[{"$match":{"report_status":"COMPLETED", "$or":@@}},{"$project":{"_id":0, "report_schedule_id":"$report_schedule_id", "item_order":"$item_order", "create_time":"$create_time", "version":{"$ifNull":["$version","1"]}, "period_start":"$period_start", "period_end":"$period_end", "name":"$name", "description":"$description", "report_type":"$report_type", "schedule_type":"$schedule_type", "period_type":"$period_type", "base_report_id":"$base_report_id", "query_report_id":"$query_report_id", "correlation_rule_id":"$correlation_rule_id", "correlation_name":"$correlation_name", "correlation_enabled":"$correlation_enabled", "condition_text":"$condition_text", "exclude_text":"$exclude_text", "target":"$target", "target_name":"$target_name", "params":"$params", "schedule":"$schedule", "mail_alarm":"$mail_alarm", "query_name":"$query_name", "query_description":"$query_description", "report_item_type":"$report_item_type", "report_graph_type":"$report_graph_type", "graph_title":"$graph_title", "graph_color":"$graph_color", "report_data":"$report_data_is_empty", "summary_data":"$summary_data_is_empty"}}]}', 'NOSQL', 'AGGREGATE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_report_status_list', 1, '{"collection":"tb_report_status", "data":[{"$match":{"create_time":{"$gte":"@@", "$lte":"@@"}, "item_order":"1", "report_status":"COMPLETED"}},{"$sort":{"create_time":1}},{"$project":{"_id":0, "report_schedule_id":"$report_schedule_id", "item_order":"$item_order", "create_time":"$create_time", "period_start":"$period_start", "period_end":"$period_end", "name":"$name", "description":"$description", "report_type":"$report_type", "schedule_type":"$schedule_type", "period_type":"$period_type", "base_report_id":"$base_report_id", "query_report_id":"$query_report_id", "correlation_rule_id":"$correlation_rule_id", "target":"$target", "params":"$params", "schedule":"$schedule", "mail_alarm":"$mail_alarm", "query_name":"$query_name", "query_description":"$query_description", "report_item_type":"$report_item_type", "report_graph_type":"$report_graph_type", "graph_title":"$graph_title", "graph_color":"$graph_color"}}]}', 'NOSQL', 'AGGREGATE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_report_status_list_self', 1, '{"collection":"tb_report_status", "data":[{"$match":{"create_time":{"$gte":"@@", "$lte":"@@"}, "item_order":"1", "report_status":"COMPLETED", "admin_id":"@@"}},{"$sort":{"create_time":1}},{"$project":{"_id":0, "report_schedule_id":"$report_schedule_id", "item_order":"$item_order", "create_time":"$create_time", "period_start":"$period_start", "period_end":"$period_end", "name":"$name", "description":"$description", "report_type":"$report_type", "schedule_type":"$schedule_type", "period_type":"$period_type", "base_report_id":"$base_report_id", "query_report_id":"$query_report_id", "correlation_rule_id":"$correlation_rule_id", "target":"$target", "params":"$params", "schedule":"$schedule", "mail_alarm":"$mail_alarm", "query_name":"$query_name", "query_description":"$query_description", "report_item_type":"$report_item_type", "report_graph_type":"$report_graph_type", "graph_title":"$graph_title", "graph_color":"$graph_color"}}]}', 'NOSQL', 'AGGREGATE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_server_integrity_detail_log', 1, '{"collection" : "tb_service_log", "data" : [{"$match":{"server_id":"@@","_id":{"$gte":{"$oid":"@@"}},"log_string_id":{"$in":["SERVER_INTEGRITY_START","SERVER_INTEGRITY_DELETE","SERVER_INTEGRITY_CHANGE","SERVER_INTEGRITY_SUCCESS","SERVER_INTEGRITY_FAIL","SERVER_INTEGRITY_END"]}}},{"$sort":{"_id":1}}]}', 'NOSQL', 'AGGREGATE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_server_integrity_log', 1, '{"collection" : "tb_service_log", "data" : [{"$match":{"server_id":"@@","log_string_id":"SERVER_INTEGRITY_START"}},{"$group":{"_id":0, "max_end_oid":{"$max":"$_id"}}}]}', 'NOSQL', 'AGGREGATE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_v3_infection_count', 1, '{"collection" : "tb_v3_alert_log", "data" : [{"$match":{"node_id":{"$in":[@@]},"client_time":{$gte: {$date: "@utc_30_date_day@"}}}},{"$project":{"result":"success_count"}},{"$group":{"_id":"$result","count":{"$sum":1}}}]}', 'NOSQL', 'AGGREGATE', '0', '1', 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('get_v3_infection_list', 1, '{"collection" : "tb_v3_alert_log", "data" : [{"$match":{"node_id":{"$in":[@@]},"client_time":{$gte: {$date: "@utc_30_date_day@"}}}},{"$limit":@@}]}', 'NOSQL', 'AGGREGATE', '0', '1', 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('add_console_event_log', 1, '', 'NONE', 'NONE', FALSE, FALSE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('check_connection_change_sesrver', 1, '', 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('check_file_sync_schedule', 1, '', 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_file_upload_check', 1, '', 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_file_upload_ready', 1, '', 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_import_policy_file', 1, '', 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('issue_login_otp_code', 1, '', 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('issue_otp_code', 1, '', 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('issue_otp_uninstall_agent', 1, '', 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('preview_query_report', 1, '', 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('register_agent_master_pkg', 1, '', 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', FALSE, '에이전트 설치 파일 Windows 에이전트 마스터 파일 등록',TRUE)
    , ('register_agent_pkg', 1, '', 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', FALSE, '에이전트 설치본 업로드',TRUE)
    , ('remove_server_report', 1, '', 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('send_file_sync', 1, '', 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('remove_file_sync', 1, '', 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_license_cert_file', 1, '', 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', TRUE, 'PRIVATE_LICENSE_UPLOAD_SET',TRUE)
    , ('set_document_file', 1, '', 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', TRUE, NULL,TRUE)
    , ('update_ahnlabcom_product', 1, '', 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('update_ahnlabcom_v3', 1, '', 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('upload_server_patch', 1, '', 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', TRUE, 'UPLOAD_SERVER_PATCH',TRUE)
    , ('upload_update_product_ems_engine', 1, '', 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', TRUE, 'UPLOAD_EPP_ENGINE',TRUE)
    , ('verify_login_otp_code', 1, '', 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('verify_otp_code', 1, '', 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_rtcommand', 1, '{"collection": "tb_task_status", "key": "/hash/@1@/@2@", "value": "@3@", "sp": "sp_set_node_hash(?::bigint, ?::en_node_hash_type, ?::text)"}', 'CACHE', 'SET', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('cancel_job', 1, 'cancel_job(?::bigint)', 'CACHE', 'SET_CACHE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('excute_job', 1, 'excute_job(?::bigint)', 'CACHE', 'SET_CACHE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('excute_server_command', 1, 'excute_server_command(?::text, ?::text, ?::text, ?::text)', 'CACHE', 'SET_CACHE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_policy_body', 1, '{"sp":"sp_get_group_policy(?::text, ?::text)", "key":"/group_policy/@1@/@2@"}', 'CACHE', 'GET', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('remove_policy_cache', 1, '{"key":"/policy/@1@"}', 'CACHE', 'DELETE_CACHE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('retry_job', 1, 'retry_job(?::bigint, ?::bigint[])', 'CACHE', 'SET_CACHE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_each_policy_apply_cache', 1, '{"key":"/node_policy/@1@/@2@", "value":[{"policy_id":"@3@"}]}', 'CACHE', 'SET_CACHE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_group_policy_apply_cache', 1, '{"key":"/group_policy/@1@/@2@[]", "value":{"policy_id":"@3@","group_id":"@4@[]"}}', 'CACHE', 'SET_ARRAY', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_policy_body', 1, '{"sp":"sp_set_group_policy(?::text, ?::text, ?::text)", "key":"/group_policy/@1@/@2@", "value":{"policy_body":"@3@"}}', 'CACHE', 'SET', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_policy_cache', 1, '{"key":"/policy/@1@", "value":[{"policy_id":"@2@","hash":"@3@","online_policy_body":"@4@","offline_policy_body":"@5@"}]}', 'CACHE', 'SET_CACHE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_config_server_name', 1, 'sp_set_config_server_name(?::bigint, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_policy_task', 1, 'sp_get_policy_task(?::bigint, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_config_server_nat', 1, NULL, 'OLTP', 'NONE', false, false, 'CONSOLE', 'EMS', TRUE, 'SET_CONFIG_SERVER_NAT',FALSE)
    , ('get_server_nat_list', 1, 'sp_get_server_nat_list()', 'OLTP', 'PROCEDURE', false, true, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_product_server', '1', 'sp_add_product_server(?::en_product_group_type, ?::text, ?::bigint, ?::boolean, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_product_server', 1, 'sp_get_product_server()', 'OLTP', 'PROCEDURE', false, true, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_dtb_list', 1, 'sp_get_dtb_list()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_dtb_detail', 1, 'sp_get_dtb_detail(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_realtime_apply_mergeable_policy', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('upload_release_package', 1, '', 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('remove_release_package', 1, '', 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('upload_custom_package', 1, '', 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('remove_custom_package', 1, '', 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('finalize_upload', 1, '', 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_agent_status_agent_info_olap', 1, 'sp_get_agent_status_agent_info_olap(?::bigint[], ?::text, ?::text, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_agent_status_v3_info', 1, 'sp_get_agent_status_v3_info(?::bigint[], ?::text, ?::text, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_agent_status_policy_applied_info', 1, 'sp_get_agent_status_policy_applied_info(?::bigint[], ?::text, ?::text, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_agent_status_agent_info_oltp', 1, 'sp_get_agent_status_agent_info_oltp(?::bigint, ?::bigint[], ?::boolean, ?::bigint, ?::bigint, ?::boolean[], ?::text[], ?::text[], ?::boolean, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_mergeable_extra_policy_target', 1, 'sp_get_mergeable_extra_policy_target(?::en_file_update_target_type)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_custom_dashboard_widget', 1, 'sp_get_custom_dashboard_widget(?::en_widget_item_type[], ?::bigint, ?::bigint, ?::en_language, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_admin_seed_key', 1, 'sp_set_admin_seed_key(?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_admin_seed_key_regist', 1, 'sp_get_admin_seed_key_regist()', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_dashboard_layout', 1,'sp_get_dashboard_layout(?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_dashboard_layout', 1, 'sp_set_dashboard_layout(?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_agent_status_group_issue_agent', 1, 'sp_get_agent_status_group_issue_agent(?::bigint[], ?::text[], ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_agent_status_issue_agent', 1, 'sp_get_agent_status_issue_agent(?::bigint[], ?::text, ?::text, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_dashboard_issue_agent_summary', 1,  NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_dashboard_issue_agent_history', 1,  NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_issue_agent_status', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('get_dashboard_agent_status_history', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('get_dashboard_agent_status_history_count', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('get_dashboard_summary_report', 1, '{"collection" : "tb_report_status", "data":[{"$match":{"admin_id":"@@","report_status":"COMPLETED","item_order":"1","$and":[{"create_time":{"$gte":"@kst_date_from@"}},{"create_time":{"$lte":"@kst_date_to@"}}]}},{$count: "report_cnt"}]}', 'NOSQL', 'AGGREGATE', false, true, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_dashboard_summary_report_all', 1, '{"collection" : "tb_report_status", "data":[{"$match":{"report_status":"COMPLETED","item_order":"1","$and":[{"create_time":{"$gte":"@kst_date_from@"}},{"create_time":{"$lte":"@kst_date_to@"}}]}},{$count: "report_cnt"}]}', 'NOSQL', 'AGGREGATE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_agent_v3_info', 1, 'sp_get_agent_v3_info(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_event_log_common_obj_id_list', 1, 'sp_get_event_log_common_obj_id_list(?::text, ?::text, ?::text, ?::integer)', 'OLTP', 'PROCEDURE_LOG', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_topology_status', 1, '', 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_event_log_common_obj_id', 1, 'sp_get_event_log_common_obj_id(?::text, ?::text, ?::integer)', 'OLTP', 'PROCEDURE_LOG_FROM', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_agent_version', 1, 'sp_get_agent_version(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_license_all_expire_date', 1, 'sp_get_license_all_expire_date(?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_agent_platform', 1, 'sp_get_agent_platform(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_agent_last_connected_time', 1, 'sp_get_agent_last_connected_time(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_agent_policy_apply_count_list', 1, 'sp_get_policy_apply_count_list(?::bigint, ?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_task_type_product_id', 1, 'sp_get_task_type_product_id()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_node_user_info', 1, 'sp_get_user_info(?::bigint)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('upload_file', 1, '', 'NONE', 'NONE', '0', '0', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('upload_file', 2, '', 'NONE', 'NONE', '0', '0', 'AGENT', 'EMS', FALSE, NULL, FALSE)
    , ('get_ips_recommand_config', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('modify_ips_recommand_config', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('get_aws_account_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('get_aws_account', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('add_aws_account', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('modify_aws_account', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('remove_aws_account', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('remove_aws_account_list', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('test_aws_account', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('get_azure_account_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('get_azure_account', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('add_azure_account', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('modify_azure_account', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('remove_azure_account', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('remove_azure_account_list', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('test_azure_account', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('get_alibaba_account_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('get_alibaba_account', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('add_alibaba_account', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('modify_alibaba_account', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('remove_alibaba_account', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('remove_alibaba_account_list', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('test_alibaba_account', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('save_alibaba_all_account_instance_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('get_cloud_proxy_setting', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('modify_cloud_proxy_setting', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('upload_ips_signature', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('upload_geo_db', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('get_country_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('add_country', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('modify_country', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('remove_country', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('remove_country_list', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('save_update_hips_signature', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('save_update_country', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('get_update_hips_signature', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('get_update_country', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('get_update_im', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('save_update_im', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'AC', '0', NULL, '0')
    , ('upload_im', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'AC', '0', NULL, '0')
    , ('get_ac_exec_summary_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('get_ac_allow_inventory_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('add_ac_allow_inventory', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('remove_ac_allow_inventory_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('get_hips_detect_log_packet_detail', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('get_hips_detect_log_packet_file_download', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('get_hips_signature_custom_import_file', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('get_hips_signature_custom_export_file', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('save_cloud_all_account_resource_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('save_azure_all_account_vm_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('save_aws_all_account_instance_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('get_agent_aws_system', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('get_agent_azure_system', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('add_ac_agent_policy', 1, 'sp_add_ac_agent_policy(?::text, ?::text, ?::text, ?::text, ?::boolean, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('get_ac_agent_policy_detail', 1, 'sp_get_ac_agent_policy_detail(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('get_ac_agent_policy_factory', 1, 'sp_get_ac_agent_policy_factory(?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('remove_ac_agent_policy', 1, 'sp_remove_ac_agent_policy(?::bigint, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('set_ac_agent_policy', 1, 'sp_set_ac_agent_policy(?::bigint, ?::text, ?::text, ?::text, ?::text, ?::boolean, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('set_each_ac_agent_policy_apply', 1, 'sp_set_each_ac_agent_policy_apply(?::bigint, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('set_group_ac_agent_policy_apply', 1, 'sp_set_group_ac_agent_policy_apply(?::bigint, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('add_ac_mgmt_policy', 1, 'sp_add_ac_mgmt_policy(?::text, ?::text, ?::text, ?::text, ?::boolean, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('get_ac_mgmt_policy_detail', 1, 'sp_get_ac_mgmt_policy_detail(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('get_ac_mgmt_policy_factory', 1, 'sp_get_ac_mgmt_policy_factory(?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('remove_ac_mgmt_policy', 1, 'sp_remove_ac_mgmt_policy(?::bigint, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('set_ac_mgmt_policy', 1, 'sp_set_ac_mgmt_policy(?::bigint, ?::text, ?::text, ?::text, ?::text, ?::boolean, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('set_each_ac_mgmt_policy_apply', 1, 'sp_set_each_ac_mgmt_policy_apply(?::bigint, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('set_group_ac_mgmt_policy_apply', 1, 'sp_set_group_ac_mgmt_policy_apply(?::bigint, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('add_hips_agent_policy', 1, 'sp_add_hips_agent_policy(?::text, ?::text, ?::text, ?::text, ?::boolean, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('get_hips_agent_policy_detail', 1, 'sp_get_hips_agent_policy_detail(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('get_hips_agent_policy_factory', 1, 'sp_get_hips_agent_policy_factory(?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('remove_hips_agent_policy', 1, 'sp_remove_hips_agent_policy(?::bigint, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('set_hips_agent_policy', 1, 'sp_set_hips_agent_policy(?::bigint, ?::text, ?::text, ?::text, ?::text, ?::boolean, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('set_each_hips_agent_policy_apply', 1, 'sp_set_each_hips_agent_policy_apply(?::bigint, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('set_group_hips_agent_policy_apply', 1, 'sp_set_group_hips_agent_policy_apply(?::bigint, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('add_hips_mgmt_policy', 1, 'sp_add_hips_mgmt_policy(?::text, ?::text, ?::text, ?::text, ?::boolean, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('get_hips_mgmt_policy_detail', 1, 'sp_get_hips_mgmt_policy_detail(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('get_hips_mgmt_policy_factory', 1, 'sp_get_hips_mgmt_policy_factory(?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('remove_hips_mgmt_policy', 1, 'sp_remove_hips_mgmt_policy(?::bigint, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('set_hips_mgmt_policy', 1, 'sp_set_hips_mgmt_policy(?::bigint, ?::text, ?::text, ?::text, ?::text, ?::boolean, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('set_each_hips_mgmt_policy_apply', 1, 'sp_set_each_hips_mgmt_policy_apply(?::bigint, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('set_group_hips_mgmt_policy_apply', 1, 'sp_set_group_hips_mgmt_policy_apply(?::bigint, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('add_hips_fw_policy', 1, 'sp_add_hips_fw_policy(?::text, ?::text, ?::text, ?::text, ?::boolean, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('get_hips_fw_policy_detail', 1, 'sp_get_hips_fw_policy_detail(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('get_hips_fw_policy_factory', 1, 'sp_get_hips_fw_policy_factory(?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('remove_hips_fw_policy', 1, 'sp_remove_hips_fw_policy(?::bigint, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('set_hips_fw_policy', 1, 'sp_set_hips_fw_policy(?::bigint, ?::text, ?::text, ?::text, ?::text, ?::boolean, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('set_each_hips_fw_policy_apply', 1, 'sp_set_each_hips_fw_policy_apply(?::bigint, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('set_group_hips_fw_policy_apply', 1, 'sp_set_group_hips_fw_policy_apply(?::bigint, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('add_scm_agent_policy', 1, 'sp_add_scm_agent_policy(?::text, ?::text, ?::text, ?::text, ?::boolean, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'SCM', '0', NULL, '0') 
    , ('get_scm_agent_policy_detail', 1, 'sp_get_scm_agent_policy_detail(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0') 
    , ('get_scm_agent_policy_factory', 1, 'sp_get_scm_agent_policy_factory()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0') 
    , ('remove_scm_agent_policy', 1, 'sp_remove_scm_agent_policy(?::bigint)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'SCM', '0', NULL, '0') 
    , ('set_scm_agent_policy', 1, 'sp_set_scm_agent_policy(?::bigint, ?::text, ?::text, ?::text, ?::text, ?::boolean, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'SCM', '0', NULL, '0') 
    , ('set_each_scm_agent_policy_apply', 1, 'sp_set_each_scm_agent_policy_apply(?::bigint, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'SCM', '0', NULL, '0') 
    , ('set_group_scm_agent_policy_apply', 1, 'sp_set_group_scm_agent_policy_apply(?::bigint, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'SCM', '0', NULL, '0')         
    , ('add_scm_mgmt_policy', 1, 'sp_add_scm_mgmt_policy(?::text, ?::text, ?::text, ?::text, ?::boolean, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'SCM', '0', NULL, '0') 
    , ('get_scm_mgmt_policy_detail', 1, 'sp_get_scm_mgmt_policy_detail(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0') 
    , ('get_scm_mgmt_policy_factory', 1, 'sp_get_scm_mgmt_policy_factory()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0') 
    , ('remove_scm_mgmt_policy', 1, 'sp_remove_scm_mgmt_policy(?::bigint)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'SCM', '0', NULL, '0') 
    , ('set_scm_mgmt_policy', 1, 'sp_set_scm_mgmt_policy(?::bigint, ?::text, ?::text, ?::text, ?::text, ?::boolean, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'SCM', '0', NULL, '0') 
    , ('set_each_scm_mgmt_policy_apply', 1, 'sp_set_each_scm_mgmt_policy_apply(?::bigint, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'SCM', '0', NULL, '0') 
    , ('set_group_scm_mgmt_policy_apply', 1, 'sp_set_group_scm_mgmt_policy_apply(?::bigint, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'SCM', '0', NULL, '0')             
    , ('add_hips_fw_event_log', 1, '{"collection": "tb_hips_fw_event_log"}', 'NOSQL', 'INSERT', '0', '1', 'AGENT', 'HIPS', '0', NULL, '0') 
    , ('add_hips_agent_event_log', 1, '{"collection": "tb_hips_agent_event_log"}', 'NOSQL', 'INSERT', '0', '1', 'AGENT', 'HIPS', '0', NULL, '0') 
    , ('add_hips_detect_event_log', 1, '{"collection": "tb_hips_detect_event_log"}', 'NOSQL', 'INSERT', '0', '1', 'AGENT', 'HIPS', '0', NULL, '0') 
    , ('add_ac_agent_event_log', 1, '{"collection": "tb_ac_agent_event_log"}', 'NOSQL', 'INSERT', '0', '1', 'AGENT', 'AC', '0', NULL, '0') 
    , ('add_ac_exec_event_log', 1, '{"collection": "tb_ac_exec_event_log"}', 'NOSQL', 'INSERT', '0', '1', 'AGENT', 'AC', '0', NULL, '0') 
    , ('add_ac_access_event_log', 1, '{"collection": "tb_ac_access_event_log"}', 'NOSQL', 'INSERT', '0', '1', 'AGENT', 'AC', '0', NULL, '0') 
    , ('add_im_detect_event_log', 1, '{"collection": "tb_im_detect_event_log"}', 'NOSQL', 'INSERT', '0', '1', 'AGENT', 'AC', '0', NULL, '0')
    , ('get_event_log_fw_list', 1, '{"collection":"tb_hips_fw_event_log","data":[{"$match":{"_id":{"$gt":{"$oid":"@@"}}}},{"$sort":{"_id":-1}},{"$limit":@@}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', false, true, 'CONSOLE', 'HIPS', FALSE, NULL, FALSE) 
    , ('get_event_log_hips_agent_list', 1, '{"collection" : "tb_hips_agent_event_log", "data" : [{"$match":{"_id":{"$gt":{"$oid": "@@"}}}},{"$sort":{"_id":-1}},{"$limit": @@},{"$project":{"_id":"$_id","client_time":"$client_time","node_id":"$node_id","ip":"$ip","computer_name" : "$computer_name","type": "$type","login_id":"$login_id","user_name":"$user_name","department":"$department","log_string_id":"$log_string_id","log_string_args":"$log_string_args"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', false, true, 'CONSOLE', 'HIPS', FALSE, NULL, FALSE) 
    , ('get_event_log_hips_detect_list', 1, '{"collection":"tb_hips_detect_event_log","data":[{"$match":{"_id":{"$gt":{"$oid":"@@"}}}},{"$sort":{"_id":-1}},{"$limit":@@},{"$project":{"_id":"$_id","application_type":"$application_type","attack_try_cnt":"$attack_try_cnt","attackid":"$attackid","attackname":"$attackname","block":"$block","block_action":"$block_action","client_time":"$client_time","computer_name":"$computer_name","container_id":"$container_id","container_name":"$container_name","ns_name":"$ns_name","pod_id":"$pod_id","data_uuid":"$data_uuid","department":"$department","detect_bytes":"$detect_bytes","detect_pkts":"$detect_pkts","detour":"$detour","dst_country":"$dst_country","dst_ip":"$dst_ip","dst_port":"$dst_port","etime":"$etime","image_name":"$image_name","ip":"$ip","ips_mode":"$ips_mode","login_id":"$login_id","logtype":"$logtype","mode":"$mode","ndir":"$ndir","node_id":"$node_id","offset":"$offset","pattern_size":"$pattern_size","pdir":"$pdir","pod_name":"$pod_name","priority":"$priority","protection_area":"$protection_area","proto":"$proto","sdir":"$sdir","service_src_country":"$service_src_country","service_src_ip":"$service_src_ip","src_country":"$src_country","src_ip":"$src_ip","src_port":"$src_port","stime":"$stime","tz_offset":"$tz_offset","user_name":"$user_name","raw_type":"$raw_type","session_id":"$session_id", "ip_auto_mask":"$ip_auto_mask","tstamp":"$tstamp","v_data":"$v_data","object_id_str":{"$toString":"$_id"},"has_payload":{"$switch":{"branches":[{"case":{"$eq":[{"$type":"$payload"},"null"]},"then":false},{"case":{"$eq":[{"$strLenBytes":"$payload"},0]},"then":false}],"default":true}}}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', false, true, 'CONSOLE', 'HIPS', FALSE, NULL, FALSE) 
    , ('get_event_log_ac_agent_list', 1, '{"collection" : "tb_ac_agent_event_log", "data" : [{"$match":{"_id":{"$gt":{"$oid": "@@"}}}},{"$sort":{"_id":-1}},{"$limit": @@},{"$project":{"_id":"$_id","client_time":"$client_time","node_id":"$node_id","ip":"$ip","computer_name" : "$computer_name","type": "$type","login_id":"$login_id","user_name":"$user_name","department":"$department","log_string_id":"$log_string_id","log_string_args":"$log_string_args"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', false, true, 'CONSOLE', 'AC', FALSE, NULL, FALSE) 
    , ('get_event_log_ac_exec_list', 1, '{"collection":"tb_ac_exec_event_log","data":[{"$match":{"_id":{"$gt":{"$oid":"@@"}}}},{"$sort":{"_id":-1}},{"$limit":@@},{"$project":{"_id":"$_id","client_time":"$client_time","node_id":"$node_id","ip":"$ip","computer_name" : "$computer_name","login_id":"$login_id","user_name":"$user_name","department":"$department","file_name":"$file_name","owner_pid":"$owner_pid","owner_process_name":"$owner_process_name","file_path":"$file_path","file_hash":"$file_hash","file_size":"$file_size","file_supplier":"$file_supplier","file_signer":"$file_signer","file_version":"$file_version","file_creation_time":"$file_creation_time","file_last_write_time":"$file_last_write_time","action":"$action","mode":"$mode","asd_reputation":"$asd_reputation","reason":"$reason"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', false, true, 'CONSOLE', 'AC', FALSE, NULL, FALSE) 
    , ('get_event_log_ac_access_list', 1, '{"collection":"tb_ac_access_event_log","data":[{"$match":{"_id":{"$gt":{"$oid":"@@"}}}},{"$sort":{"_id":-1}},{"$limit":@@},{"$project":{"_id":"$_id","client_time":"$client_time","node_id":"$node_id","ip":"$ip","computer_name" : "$computer_name","login_id":"$login_id","user_name":"$user_name","department":"$department","process_name":"$process_name","pid":"$pid","process_path":"$process_path","file_hash":"$file_hash","file_supplier":"$file_supplier","file_signer":"$file_signer","file_version":"$file_version","file_creation_time":"$file_creation_time","file_last_write_time":"$file_last_write_time","access_path":"$access_path","action_type":"$action_type","action":"$action","mode":"$mode","reason":"$reason"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', false, true, 'CONSOLE', 'AC', FALSE, NULL, FALSE) 
    , ('set_ac_status', 1, NULL, 'NONE', 'NONE', '0', '0', 'AGENT', 'AC', '0', NULL, '0') 
    , ('set_hips_status', 1, NULL, 'NONE', 'NONE', '0', '0', 'AGENT', 'HIPS', '0', NULL, '0') 
    , ('add_task_realtime_changing_action_mode', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('add_task_realtime_initializing_whitelist', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('add_task_realtime_ac_changing_inventory_policy', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('add_task_realtime_ac_product_update', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('add_task_schedule_ac_product_update', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('get_agent_status_ac_info', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('get_agent_status_ac_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_agent_status_ac_im_info', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('get_agent_status_ac_im_watchlist_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_agent_status_ac_im_rule_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_group_subgroup_ac_status_summary_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_agent_agent_ac_status_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_agent_status_ips_info', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_agent_status_ips_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('add_task_realtime_ips_signature_recommendation', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('add_task_realtime_ips_emergency_off', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('add_task_realtime_ips_emergency_off_unlock', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('add_task_realtime_hips_product_update', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('add_task_schedule_hips_product_update', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('get_mgmt_hips_signature_basic_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('get_mgmt_hips_signature_basic_detail', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('get_mgmt_hips_signature_factory_detail', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('modify_mgmt_hips_signature_basic', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('save_mgmt_hips_signature_basic', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('save_mgmt_hips_signature_basic_all_recommendation', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('save_mgmt_hips_signature_basic_recommendation_scan', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('save_mgmt_hips_signature_basic_recommendation_scan_node', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('save_mgmt_hips_signature_basic_recommendation', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('get_mgmt_hips_signature_basic_agent_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('get_mgmt_hips_signature_custom_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('get_mgmt_hips_signature_custom_detail', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('add_mgmt_hips_signature_custom', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('modify_mgmt_hips_signature_custom', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('remove_mgmt_hips_signature_custom_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('save_mgmt_hips_signature_custom', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('get_group_summary_ac_status', 1, 'sp_get_group_summary_ac_status(?::bigint[])', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0')
    , ('get_group_summary_hips_status', 1, 'sp_get_group_summary_hips_status(?::bigint[])', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('get_group_summary_scm_status', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0')
    , ('get_agent_status_ips_signature_basic_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('get_agent_status_ips_signature_basic_detail', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('get_hips_signature_basic_recommendation_used_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('save_hips_signature_basic_recommendation_used_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('get_agent_status_ips_signature_custom_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('get_agent_status_ips_signature_custom_detail', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('save_agent_status_ips_signature', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('get_hips_signature_common_agent_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('get_agent_status_ac_summary', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('get_agent_status_ips_summary', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('get_agent_status_ips_summary_timeline', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('get_group_subgroup_hips_status_summary_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('get_agent_agent_hips_status_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('get_agent_hips_status_link_list', 1, 'sp_get_agent_hips_status_link_list(?::bigint[], ?::text, ?::text, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('get_agent_ac_status_link_list', 1, 'sp_get_agent_ac_status_link_list(?::bigint[], ?::text, ?::text, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('add_task_realtime_update_ips_signature', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('add_task_realtime_update_ips_geo_db', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('register_ac_pkg', 1, '', 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('register_hips_pkg', 1, '', 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('add_task_schedule_ac_changing_action_mode', 1, NULL, 'NONE', 'NONE', false, true, 'CONSOLE', 'AC', false, NULL, false)
    , ('add_task_schedule_ac_initializing_whitelist', 1, NULL, 'NONE', 'NONE', false, true, 'CONSOLE', 'AC', false, NULL, false)
    , ('add_task_schedule_ips_signature_recommendation', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('get_ips_signature_update_server_type', 1, 'sp_get_ips_signature_update_server_type()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('get_ips_geodb_update_server_type', 1, 'sp_get_ips_geodb_update_server_type()', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('get_external_system_list',1,NULL,'NONE','NONE',false,true,'CONSOLE','EMS',false,NULL,false)
    , ('get_external_system_detail',1,NULL,'NONE','NONE',false,true,'CONSOLE','EMS',false,NULL,false)
    , ('remove_external_system',1,NULL,'NONE','NONE',false,true,'CONSOLE','EMS',false,NULL,false)
    , ('add_external_system',1,NULL,'NONE','NONE',false,true,'CONSOLE','EMS',false,NULL,false)
    , ('modify_external_system',1,NULL,'NONE','NONE',false,true,'CONSOLE','EMS',false,NULL,false)
    , ('get_watch_info', 1, 'sp_get_watch_info()', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('set_session_timeout', 1, '', 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_agent_distribute_status', 1, 'sp_get_agent_distribute_status(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_distribution_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('remove_distribution_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_realtime_remote_ctrl', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, ?::text, null, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_agent_install_page', 1, 'sp_get_agent_install_page(?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_realtime_remove_product', 1, 'sp_add_task_realtime(?::en_task_type, ?::text, ?::text, ?::text, null, ?::text, null, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_policy_ips_signature_basic_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('get_policy_ips_signature_custom_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('verify_mgmt_hips_signature_custom_pattern', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('get_product_pkg', 4, NULL, 'NONE', 'NONE', '0', '1', 'AGENT', 'EMS', '0', NULL, '0')
    , ('set_hips_recommendation', 1, NULL, 'NONE', 'NONE', '0', '0', 'AGENT', 'HIPS', '0', NULL, '0')
    , ('set_hips_basic_recommendation', 1, NULL, 'NONE', 'NONE', '0', '0', 'AGENT', 'HIPS', '0', NULL, '0')
    , ('set_hips_recommendation_cpe', 1, NULL, 'NONE', 'NONE', '0', '0', 'AGENT', 'HIPS', '0', NULL, '0')
    , ('get_batch_lag_count', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_hips_signature_release_last', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('get_hips_signature_release_list', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('get_update_version_info', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('apply_multiple_policy', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_hips_ip_exception_list', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('add_hips_ip_exception', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('set_hips_ip_exception', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('remove_hips_ip_exception', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('multiple_add_hips_ip_exception', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('save_ips_signature_unit_all_agent', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('remove_ips_signature_unit_all_agent', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('get_ips_signature_basic_info', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('get_quarantine_info_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0') 
    , ('add_task_realtime_v3_quarantine_lookup', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'V3', '0', NULL, '0')
    , ('add_task_realtime_v3_quarantine_restore', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'V3', '0', NULL, '0')
    , ('add_task_realtime_v3_remove_emergency_off', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'V3', '0', NULL, '0')
    , ('v3_quarantine_info', 1, '{"collection": "tb_v3_quar_info"}', 'NOSQL', 'INSERT', '0', '0', 'AGENT', 'V3', FALSE, NULL, FALSE)
    , ('v3_command_quarantine_info', 1, '{"collection": "tb_v3_cmd_quar_info"}', 'NOSQL', 'INSERT', '0', '0', 'AGENT', 'V3', FALSE, NULL, FALSE)
    , ('v3_command_quarantine_result', 1, '{"collection": "tb_v3_cmd_quar_result"}', 'NOSQL', 'INSERT', '0', '0', 'AGENT', 'V3', FALSE, NULL, FALSE)
    , ('get_mgmt_ac_im_watchlist_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('get_mgmt_ac_im_watchlist_detail', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0')
    , ('get_mgmt_ac_im_watchlist_rule', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0')
    , ('get_mgmt_ac_im_watchlist_agent_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0')
    , ('get_mgmt_ac_im_detect_list', 1, '{"collection" : "tb_im_detect_event_log", "data" : [{"$match":{"watchlist_info.id":{"$in": ["@@"]},"_id":{"$gte":{"$oid":"@@"},"$lte":{"$oid":"@@"}}}},{"$sort":{"_id":-1}},{"$limit":@@},{"$project":{"_id":"$_id","client_time":"$client_time","node_id":"$node_id","ip":"$ip","computer_name":"$computer_name","login_id":"$login_id","user_name":"$user_name","department":"$department","type":"$type","target":"$target","action_time":"$action_time","modified_attribute_list":"$modified_attribute_list","compression_count":"$compression_count","tag":"$tag","watchlist_info":"$watchlist_info","compliance":"$compliance","event_type":"$event_type"}}]}', 'NOSQL', 'AGGREGATE', '0', '1', 'CONSOLE', 'AC', FALSE, NULL, FALSE)
    , ('modify_mgmt_ac_im_watchlist', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0')
    , ('add_mgmt_ac_im_watchlist', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0')
    , ('remove_mgmt_ac_im_watchlist', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0')
    , ('save_mgmt_ac_im_watchlist_use', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0')
    , ('get_mgmt_ac_im_rule_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0')
    , ('add_mgmt_ac_im_rule', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0')
    , ('modify_mgmt_ac_im_rule', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0')
    , ('modify_mgmt_ac_predefined_im_rule', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0')
    , ('remove_mgmt_ac_im_rule', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0')
    , ('save_mgmt_ac_im_rule_watchlist', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0')
    , ('get_mgmt_ac_im_rule_detail', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0')
    , ('get_task_ac_im_ondemand_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('get_task_ac_im_ondemand_detail', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('remove_task_ac_im_ondemand', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('get_event_log_ac_im_detect_list', 1, '{"collection":"tb_im_detect_event_log","data":[{"$match":{"_id":{"$gt":{"$oid":"@@"}}}},{"$sort":{"_id":-1}},{"$limit":@@},{"$project":{"_id":"$_id","client_time":"$client_time","node_id":"$node_id","ip":"$ip","computer_name" :"$computer_name","login_id":"$login_id","user_name":"$user_name","department":"$department","type":"$type","target":"$target","modified_attribute_list":"$modified_attribute_list","compression_count":"$compression_count","tag":"$tag","watchlist_info":"$watchlist_info","compliance":"$compliance","event_type":"$event_type","detector_type":"$detector_type"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('get_ips_signature_action_config', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('modify_ips_signature_action_config', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('add_task_realtime_im_rulecheck', 1, NULL, 'NONE', 'NONE', false, false, 'CONSOLE', 'AC', false, NULL, false)
    , ('add_task_schedule_im_rulecheck', 1, NULL, 'NONE', 'NONE', false, true, 'CONSOLE', 'AC', false, NULL, false)
    , ('add_task_realtime_im_reqlog', 1, NULL, 'NONE', 'NONE', false, false, 'CONSOLE', 'AC', false, NULL, false)
    , ('add_im_mgmt_policy', 1, 'sp_add_im_mgmt_policy(?::text, ?::text, ?::text, ?::text, ?::boolean, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('get_im_mgmt_policy_detail', 1, 'sp_get_im_mgmt_policy_detail(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('get_im_mgmt_policy_factory', 1, 'sp_get_im_mgmt_policy_factory(?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('remove_im_mgmt_policy', 1, 'sp_remove_im_mgmt_policy(?::bigint, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('set_im_mgmt_policy', 1, 'sp_set_im_mgmt_policy(?::bigint, ?::text, ?::text, ?::text, ?::text, ?::boolean, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('set_each_im_mgmt_policy_apply', 1, 'sp_set_each_im_mgmt_policy_apply(?::bigint, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('set_group_im_mgmt_policy_apply', 1, 'sp_set_group_im_mgmt_policy_apply(?::bigint, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'AC', '0', NULL, '0') 
    , ('get_policy_im_watchlist_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0')
    , ('add_policy_im_watchlist_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0')
    , ('get_mgmt_watchlist_tag', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0')
    , ('save_mgmt_watchlist_tag', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0')
    , ('modify_mgmt_watchlist_tag', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0')
    , ('remove_mgmt_watchlist_tag', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0')
    , ('set_agent_manage_product', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', TRUE, 'SET_AGENT_MANAGE_PRODUCT', FALSE)
    , ('register_scm_pkg', 1, NULL, 'NONE', 'NONE', false, false, 'CONSOLE', 'EMS', false, NULL, false)
    , ('set_scm_status', 1, NULL, 'NONE', 'NONE', false, false, 'AGENT', 'SCM', false, NULL, false) 
    , ('add_task_realtime_scm_product_update', 1, NULL, 'NONE', 'NONE', false, true, 'CONSOLE', 'SCM', false, NULL, false)
    , ('add_task_schedule_scm_product_update', 1, NULL, 'NONE', 'NONE', false, true, 'CONSOLE', 'SCM', false, NULL, false)
    , ('add_task_realtime_scm_check', 1, NULL, 'NONE', 'NONE', false, true, 'CONSOLE', 'SCM', false, NULL, false)
    , ('add_task_schedule_scm_check', 1, NULL, 'NONE', 'NONE', false, true, 'CONSOLE', 'SCM', false, NULL, false)
    , ('add_task_realtime_scm_check_cancel', 1, NULL, 'NONE', 'NONE', false, true, 'CONSOLE', 'SCM', false, NULL, false)
    , ('add_scm_agent_log', 1, NULL, 'NONE', 'NONE', false, false, 'AGENT', 'SCM', false, NULL, false) 
    , ('add_scm_scan_log', 1, NULL, 'NONE', 'NONE', false, false, 'AGENT', 'SCM', false, NULL, false) 
    , ('get_event_log_scm_agent_list', 1, '{"collection" : "tb_scm_agent_log", "data" : [{"$match":{"_id":{"$gt":{"$oid": "@@"}}}},{"$sort":{"_id":-1}},{"$limit": @@},{"$project":{"_id":"$_id","client_time":"$client_time","node_id":"$node_id","ip":"$ip","computer_name":"$computer_name","tz_offset":"$tz_offset","type":"$type","log_string_id":"$log_string_id","log_string_args":"$log_string_args"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', false, true, 'CONSOLE', 'SCM', FALSE, NULL, FALSE) 
    , ('get_event_log_scm_scan_list', 1, '{"collection" : "tb_scm_scan_log", "data" : [{"$match":{"_id":{"$gt":{"$oid": "@@"}}}},{"$sort":{"_id":-1}},{"$limit": @@},{"$project":{"_id":"$_id","client_time":"$client_time","node_id":"$node_id","ip":"$ip","computer_name":"$computer_name","tz_offset":"$tz_offset","type":"$type","log_string_id":"$log_string_id","log_string_args":"$log_string_args"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', false, true, 'CONSOLE', 'SCM', FALSE, NULL, FALSE)
    , ('get_update_scm', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0') 
    , ('save_update_scm', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'SCM', '0', NULL, '0')
    , ('upload_scm', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'SCM', '0', NULL, '0')
    , ('get_group_subgroup_scm_status_summary_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0') 
    , ('get_agent_scm_status_link_list', 1, 'sp_get_agent_scm_status_link_list(?::bigint[], ?::text, ?::text, ?::text, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0')
    , ('get_agent_scm_status_detail', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0') 
    , ('get_event_log_scm_scan_detail_count', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0') 
    , ('get_event_log_scm_scan_detail', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0') 
    , ('get_event_log_scm_scan_detail_summary', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0') 
    , ('get_event_log_scm_scan_detail_compliance_summary', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0') 
    , ('get_event_log_scm_scan_detail_secret_summary', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0') 
    , ('get_mgmt_scm_predefinition_compliance_rule_set_info', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0')
    , ('get_mgmt_scm_predefinition_compliance_rule_set_audit_detail', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0')
    , ('get_mgmt_scm_predefinition_compliance_agent_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0')
    , ('get_mgmt_scm_predefinition_secret_rule_set_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0')
    , ('get_mgmt_scm_predefinition_secret_rule_set_audit_detail', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0')
    , ('get_mgmt_scm_predefinition_secret_agent_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0')
    , ('get_mgmt_scm_userdefined_compliance_rule_set_info', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0')
    , ('remove_mgmt_scm_userdefined_compliance_rule_set_info', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0')
    , ('get_mgmt_scm_userdefined_compliance_rule_set_info_basic', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0')
    , ('get_mgmt_scm_userdefined_compliance_rule_set_info_agent', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0')
    , ('modify_mgmt_scm_userdefined_compliance_rule_set_info', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0')
    , ('add_mgmt_scm_userdefined_compliance_rule_set_info', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0')
    , ('get_mgmt_scm_userdefined_secret_rule_set_info', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0')
    , ('remove_mgmt_scm_userdefined_secret_rule_set_info', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0')
    , ('get_mgmt_scm_userdefined_secret_rule_set_info_basic', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0')
    , ('get_mgmt_scm_userdefined_secret_rule_set_info_agent', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0')
    , ('modify_mgmt_scm_userdefined_secret_rule_set_info', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0')
    , ('add_mgmt_scm_userdefined_secret_rule_set_info', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0')
    , ('get_agent_scm_predefinition_rule_set_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0') 
    , ('get_agent_scm_userdefinition_rule_set_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0') 
    , ('get_policy_scm_userdefinition_rule_set_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0') 
    , ('get_policy_scm_checked_predefinition_rule_set_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0') 
    , ('get_policy_scm_checked_userdefinition_rule_set_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'SCM', '0', NULL, '0')
    , ('get_product_pkg', 5, NULL, 'NONE', 'NONE', '0', '1', 'AGENT', 'EMS', '0', NULL, '0')
    , ('get_product_pkg', 6, NULL, 'NONE', 'NONE', '0', '1', 'AGENT', 'EMS', '0', NULL, '0')
    , ('get_product_pkg', 7, NULL, 'NONE', 'NONE', '0', '1', 'AGENT', 'EMS', '0', NULL, '0')
    , ('get_update_oval', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('save_update_oval', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('upload_oval', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0')  
    , ('upload_clair_db', 1, NULL, 'NONE', 'NONE', FALSE, FALSE, 'CONSOLE', 'HIPS', FALSE, NULL, FALSE)
    , ('set_after_changing_ip', 1, NULL, 'NONE', 'NONE', FALSE, FALSE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_realtime_v3_reset_scan_cache', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'V3', '0', NULL, '0')
    , ('add_task_schedule_v3_reset_scan_cache', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'V3', '0', NULL, '0')
    , ('get_upload_file_status', 1, NULL, 'NONE', 'NONE', FALSE, FALSE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('modify_upload_file_status', 1, NULL, 'NONE', 'NONE', FALSE, FALSE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_product_usage', 1, '{"collection": "tb_product_usage"}', 'NOSQL', 'INSERT', '0', '1', 'AGENT', 'EMS', '0', NULL, '0')
    , ('get_product_patch_info', 1, NULL, 'NONE', 'NONE', FALSE, FALSE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('update_product_patch_info', 1, NULL, 'NONE', 'NONE', FALSE, FALSE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('modify_upload_file_status_finish', 1, NULL, 'NONE', 'NONE', FALSE, FALSE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_product_patch_base', 1, NULL, 'NONE', 'NONE', FALSE, FALSE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)

    , ('get_event_log_service_list_custom', 1, '{"collection" : "tb_service_log", "data" : [{"$match":{"_id":{"$gt":{"$oid": "@@"}, "$lte":{"$oid": "@@"}}}},{"$sort":{"_id":-1}},{"$limit": @@},{"$project": {"_id": "$_id","server_id": "$server_id","server_name": "$server_name","type": "$type","log_string_id": "$log_string_id","log_string_args": "$log_string_args","server_time": "$server_time","server_ip": "$server_ip"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', FALSE, TRUE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_event_log_audit_list_custom', 1, '{"collection" : "tb_audit_log", "data" : [{"$match":{"_id":{"$gt":{"$oid": "@@"}, "$lte":{"$oid": "@@"}}}},{"$sort":{"_id":-1}},{"$limit": @@},{"$project":{"_id":"$_id","login_ip":"$login_ip","admin_id":"$admin_id","log_string_id":"$log_string_id","log_string_args":"$log_string_args","server_time":"$server_time"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', FALSE, TRUE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_event_log_engine_update_list_custom', 1, '{"collection" : "tb_engine_update_log", "data" : [{"$match":{"_id":{"$gt":{"$oid": "@@"}, "$lte":{"$oid": "@@"}}}},{"$sort":{"_id":-1}},{"$limit": @@},{"$project":{"_id":"$_id","server_id":"$server_id","server_time":"$server_time","server_ip":"$server_ip","server_name":"$server_name","log_string_id":"$log_string_id","log_string_args":"$log_string_args","type":"$type"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', FALSE, TRUE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_event_log_backup_list_custom', 1, '{"collection" : "tb_backup_log", "data" : [{"$match":{"_id":{"$gt":{"$oid": "@@"}, "$lte":{"$oid": "@@"}}}},{"$sort":{"_id":-1}},{"$limit": @@},{"$project":{"_id":"$_id","server_id":"$server_id","server_time":"$server_time","server_ip":"$server_ip","server_name":"$server_name","log_string_id":"$log_string_id","log_string_args":"$log_string_args","type":"$type"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', FALSE, TRUE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_event_log_dist_list_custom', 1, '{"collection" : "tb_pkg_dist_log", "data" : [{"$match":{"_id":{"$gt":{"$oid": "@@"}, "$lte":{"$oid": "@@"}}}},{"$sort":{"_id":-1}},{"$limit": @@},{"$project":{"_id":"$_id","server_id":"$server_id","server_time":"$server_time","server_ip":"$server_ip","server_name":"$server_name","log_string_id":"$log_string_id","log_string_args":"$log_string_args","type":"$type","package_type":"$package_type","package_name":"$package_name","log_string_id":"$log_string_id","log_string_args":"$log_string_args"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', FALSE, TRUE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_event_log_pkg_sync_list_custom', 1, '{"collection" : "tb_pkg_sync_log", "data" : [{"$match":{"_id":{"$gt":{"$oid": "@@"}, "$lte":{"$oid": "@@"}}}},{"$sort":{"_id":-1}},{"$limit": @@},{"$project": {"_id": "$_id","server_id": "$server_id","server_name": "$server_name","type": "$type","log_string_id": "$log_string_id","log_string_args": "$log_string_args","server_time": "$server_time","server_ip": "$server_ip"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', FALSE, TRUE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_event_log_agent_install_pkg_list_custom', 1, '{"collection" : "tb_agent_install_pkg_log", "data" : [{"$match":{"_id":{"$gt":{"$oid": "@@"}, "$lte":{"$oid": "@@"}}}},{"$sort":{"_id":-1}},{"$limit": @@},{"$project":{"_id":"$_id","file_name":"$file_name","log_string_id":"$log_string_id","log_string_args":"$log_string_args","server_time":"$server_time"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', FALSE, TRUE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_event_log_agent_event_list_custom', 1, '{"collection" : "tb_agent_event_log", "data" : [{"$match":{"_id": { "$gt": { "$oid": "@@" }, "$lte": { "$oid": "@@" } }}},{"$sort":{"_id":-1}},{"$limit":@@},{"$project":{"_id":"$_id","client_time":"$client_time","node_id":"$node_id","ip":"$ip","computer_name":"$computer_name","login_id":"$login_id","department":"$department","log_string_id":"$log_string_id", "log_string_args":"$log_string_args"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', FALSE, TRUE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_event_log_task_status_list_custom', 1, '{"collection" : "tb_task_status_log", "data" : [{"$match":{"_id": { "$gt": { "$oid": "@@" }, "$lte":{ "$oid": "@@" } },"task_type":{"$ne":"APPLY_MERGEABLE_POLICY"}}},{"$sort":{"_id":-1}},{"$limit":@@},{"$project":{"_id":"$_id","client_time":"$client_time","node_id":"$node_id","instance_id":"$instance_id","task_type":"$task_type","task_status":"$task_status","task_error":"$task_error","product_id": {$ifNull: [ "$product_id", "AGENT"]},"tz_offset":"$tz_offset", "ip": {$ifNull: [ "$ip", ""]},"computer_name": {$ifNull: [ "$computer_name", ""]}, "department": {$ifNull: [ "$department", ""]}, "login_id": {$ifNull: [ "$login_id", ""]}}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', FALSE, TRUE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_event_log_node_sw_list_custom', 1, '{"collection" : "tb_node_sw", "data" : [{"$unwind":{path:"$sw",includeArrayIndex:"index_num"}},{"$match":{"_id":{"$gt":{"$oid":"@@"}, "$lte":{"$oid": "@@"}}}},{"$sort":{"_id":-1}},{"$limit":@@},{"$project":{"_id":"$_id","index_num":{"$add":["$index_num",1]},"client_time":"$client_time","node_id":"$node_id","ip":"$ip","computer_name":"$computer_name","login_id":"$login_id","department":"$department","name":"$sw.name","publisher":"$sw.publisher","size":{"$cond":[{"$eq":["$sw.size","0"]},"","$sw.size"]},"version":"$sw.version","opcode":"$sw.opcode"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', FALSE, TRUE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)   
    , ('get_event_log_node_hw_list_custom', 1, '{"collection" : "tb_node_hw", "data" : [{"$unwind":{path:"$hw",includeArrayIndex:"index_num"}},{"$match":{"_id":{"$gt":{"$oid":"@@"}, "$lte":{"$oid": "@@"}}}},{"$sort":{"_id":-1}},{"$limit":@@},{"$project":{"_id":"$_id","index_num":{"$add":["$index_num",1]},"client_time":"$client_time","node_id":"$node_id","ip":"$ip","computer_name":"$computer_name","login_id":"$login_id","department":"$department","hw_type":"$hw.hw_type","opcode":"$hw.opcode","value":"$hw.value"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', FALSE, TRUE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_event_log_v3_alert_list_custom', 1, '{"collection" : "tb_v3_alert_log", "data" : [{"$match":{"_id" : { "$gt": { "$oid": "@@" }, "$lte": { "$oid": "@@" } }}},{"$sort":{"_id":-1}},{"$limit":@@},{"$project":{"_id":"$_id", "client_time":"$client_time", "node_id":"$node_id", "ip":"$ip", "computer_name":"$computer_name", "login_id":"$login_id", "department":"$department", "name":"$name", "file_hash":{"$ifNull":["$file_hash",""]}, "path":"$path", "status":"$status", "scan_type":"$scan_type", "owner":"$owner", "access":"$access", "infector":"$infector", "ctnr_name":"$ctnr_name", "ctnr_id":"$ctnr_id", "ctnr_img_name":"$ctnr_img_name", "ns_name":"$ns_name", "pod_id":"$pod_id", "pod_name":"$pod_name", "created_time":"$created_time", "modified_time":"$modified_time", "sha256_hash":{"$ifNull":["$sha256_hash",""]}}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', FALSE, TRUE, 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('get_event_log_v3_ss_list_custom', 1, '{"collection" : "tb_v3_ss_log", "data" : [{"$match":{"_id": { "$gt": { "$oid": "@@" }, "$lte": { "$oid": "@@" } }}},{"$sort":{"_id":-1}},{"$limit":@@},{"$project":{"_id":"$_id","client_time":"$client_time","node_id":"$node_id","ip":"$ip","computer_name":"$computer_name","login_id":"$login_id","department":"$department","log_string_id":"$log_string_id", "log_string_args":"$log_string_args","detail_string_id":"$detail_string_id", "detail_string_args":"$detail_string_args"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', FALSE, TRUE, 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('get_event_log_v3_is_list_custom', 1, '{"collection" : "tb_v3_is_log", "data" : [{"$match":{"_id": { "$gt": { "$oid": "@@" }, "$lte": { "$oid": "@@" } }}},{"$sort":{"_id":-1}},{"$limit":@@},{"$project":{"_id":"$_id","client_time":"$client_time","node_id":"$node_id","ip":"$ip","computer_name":"$computer_name","login_id":"$login_id","department":"$department","log_string_id":"$log_string_id", "log_string_args":"$log_string_args","detail_string_id":"$detail_string_id", "detail_string_args":"$detail_string_args"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', FALSE, TRUE, 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('get_event_log_v3_sup_list_custom', 1, '{"collection" : "tb_v3_sup_log", "data" : [{"$match":{"_id": { "$gt": { "$oid": "@@" }, "$lte": { "$oid": "@@" } }}},{"$sort":{"_id":-1}},{"$limit":@@},{"$project":{"_id":"$_id","client_time":"$client_time","node_id":"$node_id","ip":"$ip","computer_name":"$computer_name","login_id":"$login_id","department":"$department","log_string_id":"$log_string_id", "log_string_args":"$log_string_args","detail_string_id":"$detail_string_id", "detail_string_args":"$detail_string_args"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', FALSE, TRUE, 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('get_event_log_v3_quar_list_custom', 1, '{"collection" : "tb_v3_quar_log", "data" : [{"$match":{"_id": { "$gt": { "$oid": "@@" }, "$lte": { "$oid": "@@" } }}},{"$sort":{"_id":-1}},{"$limit":@@},{"$project":{"_id":"$_id","client_time":"$client_time","node_id":"$node_id","ip":"$ip","computer_name":"$computer_name","login_id":"$login_id","department":"$department","log_string_id":"$log_string_id", "log_string_args":"$log_string_args","detail_string_id":"$detail_string_id", "detail_string_args":"$detail_string_args"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', FALSE, TRUE, 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('get_event_log_hips_agent_list_custom', 1, '{"collection" : "tb_hips_agent_event_log", "data" : [{"$match":{"_id":{"$gt":{"$oid": "@@"}, "$lte":{"$oid": "@@"}}}},{"$sort":{"_id":-1}},{"$limit": @@},{"$project":{"_id":"$_id","client_time":"$client_time","node_id":"$node_id","ip":"$ip","computer_name" : "$computer_name","type": "$type","login_id":"$login_id","user_name":"$user_name","department":"$department","log_string_id":"$log_string_id","log_string_args":"$log_string_args"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', FALSE, TRUE, 'CONSOLE', 'HIPS', FALSE, NULL, FALSE)
    , ('get_event_log_hips_detect_list_custom', 1, '{"collection":"tb_hips_detect_event_log","data":[{"$match":{"_id":{"$gt":{"$oid":"@@"}, "$lte":{"$oid": "@@"}}}},{"$sort":{"_id":-1}},{"$limit":@@},{"$project":{"_id":"$_id","application_type":"$application_type","attack_try_cnt":"$attack_try_cnt","attackid":"$attackid","attackname":"$attackname","block":"$block","block_action":"$block_action","client_time":"$client_time","computer_name":"$computer_name","container_id":"$container_id","container_name":"$container_name","ns_name":"$ns_name","pod_id":"$pod_id","data_uuid":"$data_uuid","department":"$department","detect_bytes":"$detect_bytes","detect_pkts":"$detect_pkts","detour":"$detour","dst_country":"$dst_country","dst_ip":"$dst_ip","dst_port":"$dst_port","etime":"$etime","image_name":"$image_name","ip":"$ip","ips_mode":"$ips_mode","login_id":"$login_id","logtype":"$logtype","mode":"$mode","ndir":"$ndir","node_id":"$node_id","offset":"$offset","pattern_size":"$pattern_size","pdir":"$pdir","pod_name":"$pod_name","priority":"$priority","protection_area":"$protection_area","proto":"$proto","sdir":"$sdir","service_src_country":"$service_src_country","service_src_ip":"$service_src_ip","src_country":"$src_country","src_ip":"$src_ip","src_port":"$src_port","stime":"$stime","tz_offset":"$tz_offset","user_name":"$user_name","raw_type":"$raw_type","session_id":"$session_id", "ip_auto_mask":"$ip_auto_mask", "tstamp":"$tstamp","v_data":"$v_data","object_id_str":{"$toString":"$_id"},"has_payload":{"$switch":{"branches":[{"case":{"$eq":[{"$type":"$payload"},"null"]},"then":false},{"case":{"$eq":[{"$strLenBytes":"$payload"},0]},"then":false}],"default":true}}}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', FALSE, TRUE, 'CONSOLE', 'HIPS', FALSE, NULL, FALSE)
    , ('get_event_log_fw_list_custom', 1, '{"collection":"tb_hips_fw_event_log","data":[{"$match":{"_id":{"$gt":{"$oid":"@@"}, "$lte":{"$oid": "@@"}}}},{"$sort":{"_id":-1}},{"$limit":@@}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', FALSE, TRUE, 'CONSOLE', 'HIPS', FALSE, NULL, FALSE)
    , ('get_event_log_ac_agent_list_custom', 1, '{"collection" : "tb_ac_agent_event_log", "data" : [{"$match":{"_id":{"$gt":{"$oid": "@@"}, "$lte":{"$oid": "@@"}}}},{"$sort":{"_id":-1}},{"$limit": @@},{"$project":{"_id":"$_id","client_time":"$client_time","node_id":"$node_id","ip":"$ip","computer_name" : "$computer_name","type": "$type","login_id":"$login_id","user_name":"$user_name","department":"$department","log_string_id":"$log_string_id","log_string_args":"$log_string_args"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', FALSE, TRUE, 'CONSOLE', 'AC', FALSE, NULL, FALSE)
    , ('get_event_log_ac_exec_list_custom', 1, '{"collection":"tb_ac_exec_event_log","data":[{"$match":{"_id":{"$gt":{"$oid":"@@"}, "$lte":{"$oid": "@@"}}}},{"$sort":{"_id":-1}},{"$limit":@@},{"$project":{"_id":"$_id","client_time":"$client_time","node_id":"$node_id","ip":"$ip","computer_name" : "$computer_name","login_id":"$login_id","user_name":"$user_name","department":"$department","file_name":"$file_name","owner_pid":"$owner_pid","owner_process_name":"$owner_process_name","file_path":"$file_path","file_hash":"$file_hash","file_size":"$file_size","file_supplier":"$file_supplier","file_signer":"$file_signer","file_version":"$file_version","file_creation_time":"$file_creation_time","file_last_write_time":"$file_last_write_time","action":"$action","mode":"$mode","asd_reputation":"$asd_reputation","reason":"$reason"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', FALSE, TRUE, 'CONSOLE', 'AC', FALSE, NULL, FALSE)
    , ('get_event_log_ac_access_list_custom', 1, '{"collection":"tb_ac_access_event_log","data":[{"$match":{"_id":{"$gt":{"$oid":"@@"}, "$lte":{"$oid": "@@"}}}},{"$sort":{"_id":-1}},{"$limit":@@},{"$project":{"_id":"$_id","client_time":"$client_time","node_id":"$node_id","ip":"$ip","computer_name" : "$computer_name","login_id":"$login_id","user_name":"$user_name","department":"$department","process_name":"$process_name","pid":"$pid","process_path":"$process_path","file_hash":"$file_hash","file_supplier":"$file_supplier","file_signer":"$file_signer","file_version":"$file_version","file_creation_time":"$file_creation_time","file_last_write_time":"$file_last_write_time","access_path":"$access_path","action_type":"$action_type","action":"$action","mode":"$mode","reason":"$reason"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', FALSE, TRUE, 'CONSOLE', 'AC', FALSE, NULL, FALSE)
    , ('get_event_log_ac_im_detect_list_custom', 1, '{"collection":"tb_im_detect_event_log","data":[{"$match":{"_id":{"$gt":{"$oid":"@@"},"$lte":{"$oid": "@@"}}}},{"$sort":{"_id":-1}},{"$limit":@@},{"$project":{"_id":"$_id","client_time":"$client_time","node_id":"$node_id","ip":"$ip","computer_name" :"$computer_name","login_id":"$login_id","user_name":"$user_name","department":"$department","type":"$type","target":"$target","modified_attribute_list":"$modified_attribute_list","compression_count":"$compression_count","tag":"$tag","watchlist_info":"$watchlist_info","compliance":"$compliance","event_type":"$event_type","detector_type":"$detector_type"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', '0', '1', 'CONSOLE', 'AC', '0', NULL, '0')
    , ('get_event_log_scm_agent_list_custom', 1, '{"collection" : "tb_scm_agent_log", "data" : [{"$match":{"_id":{"$gt":{"$oid": "@@"}, "$lte":{"$oid": "@@"}}}},{"$sort":{"_id":-1}},{"$limit": @@},{"$project":{"_id":"$_id","client_time":"$client_time","node_id":"$node_id","ip":"$ip","computer_name":"$computer_name","tz_offset":"$tz_offset","type":"$type","log_string_id":"$log_string_id","log_string_args":"$log_string_args"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', FALSE, TRUE, 'CONSOLE', 'SCM', FALSE, NULL, FALSE)
    , ('get_event_log_scm_scan_list_custom', 1, '{"collection" : "tb_scm_scan_log", "data" : [{"$match":{"_id":{"$gt":{"$oid": "@@"}, "$lte":{"$oid": "@@"}}}},{"$sort":{"_id":-1}},{"$limit": @@},{"$project":{"_id":"$_id","client_time":"$client_time","node_id":"$node_id","ip":"$ip","computer_name":"$computer_name","tz_offset":"$tz_offset","type":"$type","log_string_id":"$log_string_id","log_string_args":"$log_string_args"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', FALSE, TRUE, 'CONSOLE', 'SCM', FALSE, NULL, FALSE)
    , ('get_event_log_search_list', 1, NULL, 'NONE', 'NONE', FALSE, TRUE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_event_log_search_csv', 1, NULL, 'NONE', 'NONE', FALSE, TRUE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_event_log_lucene_search_list', 1, NULL, 'NONE', 'NONE', FALSE, TRUE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_event_log_lucene_search_csv', 1, NULL, 'NONE', 'NONE', FALSE, TRUE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_event_log_search_csv_list', 1, NULL, 'NONE', 'NONE', FALSE, TRUE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('remove_event_log_search_csv', 1, NULL, 'NONE', 'NONE', FALSE, TRUE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('cancel_event_log_search_csv', 1, NULL, 'NONE', 'NONE', FALSE, TRUE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_event_log_search_field_list', 1, NULL, 'NONE', 'NONE', FALSE, TRUE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_event_log_search_type_field_list', 1, NULL, 'NONE', 'NONE', FALSE, TRUE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)

    , ('get_event_log_server_alert_list', 1, '{"collection" : "tb_server_alert_log", "data" : [{"$match":{"_id":{"$gt":{"$oid": "@@"}}}},{"$sort":{"_id":-1}},{"$limit": @@}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', false, true, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_event_log_server_alert_list_custom', 1, '{"collection" : "tb_server_alert_log", "data" : [{"$match":{"_id":{"$gt":{"$oid": "@@"}, "$lte":{"$oid": "@@"}}}},{"$sort":{"_id":-1}},{"$limit": @@}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', FALSE, TRUE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)

    , ('get_distribution_info', 1, NULL, 'NONE', 'NONE', '0', '1', 'AGENT', 'EMS', '0', NULL, '0')
    , ('get_event_log_limit', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_search_type', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_search_language', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('modify_search_language', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('modify_event_log_limit', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_product_deploy_config', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_ips_signature_config', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('modify_ips_signature_config', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0')

    , ('get_hips_fw_block_ip_rule', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('get_hips_fw_block_ip_rule_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('get_hips_fw_block_ip_rule_count', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('get_hips_fw_block_ip_rule_use_agent_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('add_hips_fw_block_ip_rule', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('modify_hips_fw_block_ip_rule', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('remove_hips_fw_block_ip_rule', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 

    , ('get_policy_hips_fw_block_ip_rule', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('get_policy_hips_fw_block_ip_rule_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0') 
    , ('get_policy_hips_fw_block_ip_rule_count', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0')

    , ('get_block_ip_rule_info', 1, NULL, 'NONE', 'NONE', '0', '1', 'AGENT', 'HIPS', '0', NULL, '0')
    , ('get_block_ip_rule_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'AGENT', 'HIPS', '0', NULL, '0')

    , ('add_manager_group', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('modify_manager_group', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('remove_manager_group_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_manager_group', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_manager_group_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_manager_group_policy_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_manager_group_admin_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_manager_group_group_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')

    , ('get_license_detail', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_license_list', 2, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_license_count_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('add_license', 2, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_license_eula_detail', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('modify_license', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('remove_license', 2, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_group_license_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_group_license_usage_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('modify_group_license_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('modify_main_license', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_license_update_info_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('add_license_oafq', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_license_oafq_info', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('update_license_info', 1, NULL, 'NONE', 'NONE', FALSE, TRUE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('apply_license', 1, NULL, 'NONE', 'NONE', FALSE, TRUE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_license_usage_timeline', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_license_avg_usage', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')


    , ('get_asset_info_detail', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('modify_asset_info', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('upload_asset_target', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')

    , ('add_task_realtime_hips_process_on_off', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('add_task_realtime_ac_process_on_off', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'AC', '0', NULL, '0')
    , ('add_task_realtime_ips_ssl_inspection_on_off', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('get_ssl_inspection_target_list', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0')
    , ('get_ssl_engine_info', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'HIPS', '0', NULL, '0')

    , ('add_cnapp_event_log', 1, '{"collection": "tb_cnapp_event_log"}', 'NOSQL', 'INSERT', '0', '0', 'AGENT', 'CNAPP', '0', NULL, '0')
    , ('add_cnapp_vulnerability_scan_event_log', 1, '{"collection": "tb_cnapp_vulnerability_scan_event_log"}', 'NOSQL', 'INSERT', '0', '0', 'AGENT', 'CNAPP', '0', NULL, '0')
    , ('add_cnapp_malware_scan_event_log', 1, '{"collection": "tb_cnapp_malware_scan_event_log"}', 'NOSQL', 'INSERT', '0', '0', 'AGENT', 'CNAPP', '0', NULL, '0')

    , ('get_event_log_cnapp_list', 1, '{"collection": "tb_cnapp_event_log","data": [{"$match": {"_id": {"$gt": {"$oid": "@@"}}}},{"$sort": {"_id": -1}},{"$limit": @@},{"$project": {"_id": "$_id","client_time": "$client_time","type": "$type","log_string_id": "$log_string_id","log_string_args": "$log_string_args"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', '0', '1', 'CONSOLE', 'CNAPP', '0', NULL, '0')
    , ('get_event_log_cnapp_malware_scan_list', 1, '{"collection": "tb_cnapp_malware_scan_event_log","data": [{"$match": {"_id": {"$gt": {"$oid": "@@"}}}},{"$sort": {"_id": -1}},{"$limit": @@},{"$project": {"_id": "$_id","client_time": "$client_time","registry_type": "$registry_type","image_url": "$image_url","image_hash": "$image_hash","engine_version": "$engine_version","file_name": "$file_name","virus_name": "$virus_name","virus_type": "$virus_type"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', '0', '1', 'CONSOLE', 'CNAPP', '0', NULL, '0')
    , ('get_event_log_cnapp_vulnerability_scan_list', 1, '{"collection": "tb_cnapp_vulnerability_scan_event_log","data": [{"$match": {"_id": {"$gt": {"$oid": "@@"}}}},{"$sort": {"_id": -1}},{"$limit": @@},{"$project": {"_id": "$_id","client_time": "$client_time","registry_type": "$registry_type","image_url": "$image_url","image_hash": "$image_hash","cve_id": "$cve_id","package_name": "$package_name","package_version": "$package_version","severity": "$severity","fixed_version": "$fixed_version"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', '0', '1', 'CONSOLE', 'CNAPP', '0', NULL, '0')
    , ('get_event_log_cnapp_list_custom', 1, '{"collection": "tb_cnapp_event_log","data": [{"$match": {"_id": {"$gt": {"$oid": "@@"},"$lte": {"$oid": "@@"}}}},{"$sort": {"_id": -1}},{"$limit":@@},{"$project": {"_id": "$_id","client_time": "$client_time","type": "$type","log_string_id": "$log_string_id","log_string_args": "$log_string_args"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', '0', '1', 'CONSOLE', 'CNAPP', '0', NULL, '0')
    , ('get_event_log_cnapp_malware_scan_list_custom', 1, '{"collection": "tb_cnapp_malware_scan_event_log","data": [{"$match": {"_id": {"$gt": {"$oid": "@@"},"$lte": {"$oid": "@@"}}}},{"$sort": {"_id": -1}},{"$limit":@@},{"$project": {"_id": "$_id","client_time": "$client_time","registry_type": "$registry_type","image_url": "$image_url","image_hash": "$image_hash","engine_version": "$engine_version","file_name": "$file_name","virus_name": "$virus_name","virus_type": "$virus_type"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', '0', '1', 'CONSOLE', 'CNAPP', '0', NULL, '0')
    , ('get_event_log_cnapp_vulnerability_scan_list_custom',1, '{"collection": "tb_cnapp_vulnerability_scan_event_log","data": [{"$match": {"_id": {"$gt": {"$oid": "@@"},"$lte": {"$oid": "@@"}}}},{"$sort": {"_id": -1}},{"$limit":@@},{"$project": {"_id": "$_id","client_time": "$client_time","registry_type": "$registry_type","image_url": "$image_url","image_hash": "$image_hash","cve_id": "$cve_id","package_name": "$package_name","package_version": "$package_version","severity": "$severity","fixed_version": "$fixed_version"}}]}', 'NOSQL', 'AGGREGATE_LOG_CUSTOM', '0', '1', 'CONSOLE', 'CNAPP', '0', NULL, '0')
    , ('get_update_cnapp', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'CNAPP', '0', NULL, '0') 
    , ('save_update_cnapp', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'CNAPP', '0', NULL, '0')
    , ('upload_cnapp', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'CNAPP', '0', NULL, '0')

    , ('enable_metering', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('find_mongo_collection', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_server_info', 1, NULL, 'NONE', 'NONE', false, true, 'CONSOLE', 'EMS', false, NULL, false)

    , ('set_amc_status', 1, NULL, 'NONE', 'NONE', '0', '0', 'AGENT', 'V3', FALSE, NULL, FALSE)
    , ('add_amc_alert_log', 1, '{"collection": "tb_v3_alert_log"}', 'NOSQL', 'INSERT', '0', '0', 'AGENT', 'V3', FALSE, NULL, FALSE)
    , ('add_amc_is_log', 1, '{"collection": "tb_v3_is_log"}', 'NOSQL', 'INSERT', '0', '0', 'AGENT', 'V3', FALSE, NULL, FALSE)
    , ('add_amc_ss_log', 1, '{"collection": "tb_v3_ss_log"}', 'NOSQL', 'INSERT', '0', '0', 'AGENT', 'V3', FALSE, NULL, FALSE)
    , ('add_amc_sup_log', 1, '{"collection": "tb_v3_sup_log"}', 'NOSQL', 'INSERT', '0', '0', 'AGENT', 'V3', FALSE, NULL, FALSE)
    , ('add_amc_quar_log', 1, '{"collection": "tb_v3_quar_log"}', 'NOSQL', 'INSERT', '0', '0', 'AGENT', 'V3', FALSE, NULL, FALSE)
    , ('amc_quarantine_info', 1, '{"collection": "tb_v3_quar_info"}', 'NOSQL', 'INSERT', '0', '0', 'AGENT', 'V3', FALSE, NULL, FALSE)
    , ('amc_command_quarantine_info', 1, '{"collection": "tb_v3_cmd_quar_info"}', 'NOSQL', 'INSERT', '0', '0', 'AGENT', 'V3', FALSE, NULL, FALSE)
    , ('amc_command_quarantine_result', 1, '{"collection": "tb_v3_cmd_quar_result"}', 'NOSQL', 'INSERT', '0', '0', 'AGENT', 'V3', FALSE, NULL, FALSE)
    , ('register_amc_pkg', 1, '', 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('add_amc_mgmt_policy', 1, 'sp_add_amc_mgmt_policy(?::text, ?::text, ?::text, ?::text, ?::boolean, ?::text, ?::text)', 'OLTP', 'PROCEDURE', false, false, 'CONSOLE', 'V3', false, NULL, false)
    , ('set_amc_mgmt_policy', 1, 'sp_set_amc_mgmt_policy(?::bigint, ?::text, ?::text, ?::text, ?::text, ?::boolean, ?::text, ?::text)', 'OLTP', 'PROCEDURE', false, false, 'CONSOLE', 'V3', false, NULL, false)
    , ('remove_amc_mgmt_policy', 1, 'sp_remove_amc_mgmt_policy(?::bigint, ?::text)', 'OLTP', 'PROCEDURE', false, false, 'CONSOLE', 'V3', false, NULL, false)
    , ('get_amc_mgmt_policy_detail', 1, 'sp_get_amc_mgmt_policy_detail(?::bigint)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'V3', '0', NULL, '0') 
    , ('get_amc_mgmt_policy_factory', 1, 'sp_get_amc_mgmt_policy_factory(?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'V3', '0', NULL, '0')
    , ('get_yaml_daemonset', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('get_yaml_serverless', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('set_each_amc_mgmt_policy_apply', 1, 'sp_set_each_amc_mgmt_policy_apply(?::bigint, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'V3', '0', NULL, '0') 
    , ('set_group_amc_mgmt_policy_apply', 1, 'sp_set_group_amc_mgmt_policy_apply(?::bigint, ?::bigint[])', 'OLTP', 'PROCEDURE', '0', '0', 'CONSOLE', 'V3', '0', NULL, '0')
    , ('get_agent_InstallFile', 1, NULL, 'NONE', 'NONE', false, false, 'CONSOLE', 'EMS', false, NULL, false)
    , ('update_agent_InstallFile', 1, NULL, 'NONE', 'NONE', false, false, 'CONSOLE', 'EMS', false, NULL, false)
    , ('add_task_realtime_amc_product_update', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'V3', '0', NULL, '0') 
    , ('add_task_schedule_amc_product_update', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'V3', '0', NULL, '0') 

    , ('long_term_inactivity', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('long_term_inactivity_modify', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')
    , ('unlock_feature', 1, NULL, 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', '0', NULL, '0')

    , ('get_k8s_clusters', 1, NULL, 'NONE', 'NONE', false, true, 'CONSOLE', 'CNAPP', false, NULL, false)
    , ('get_cert_license_info_list', 1, '', 'NONE', 'NONE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)

    , ('get_atip_bundle_config', 1, NULL, 'NONE', 'NONE', FALSE, TRUE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_atip_bundle_config_option', 1, NULL, 'NONE', 'NONE', FALSE, TRUE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_atip_bundle_config', 1, NULL, 'NONE', 'NONE', FALSE, FALSE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_atip_bundle_user_overall_quotas', 1, NULL, 'NONE', 'NONE', FALSE, TRUE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_atip_bundle_cve_info', 1, NULL, 'NONE', 'NONE', FALSE, TRUE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)

    , ('get_command_disclosure_config', 1, NULL, 'NONE', 'NONE', FALSE, TRUE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('set_command_disclosure_config', 1, NULL, 'NONE', 'NONE', FALSE, FALSE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)

    , ('get_agent_status_agent_info_detail', 1, 'sp_get_issue_agent_node_detail_data(?::bigint, ?::text)', 'OLTP', 'PROCEDURE', '0', '1', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)

    , ('get_helm_package_tar_url', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('add_task_realtime_am_file_io_analyze_sync', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'V3', '0', NULL, '0') 
    , ('add_task_realtime_am_file_io_analyze_reset', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'V3', '0', NULL, '0') 
    , ('get_am_file_io_info', 1, NULL, 'NONE', 'NONE', FALSE, TRUE, 'CONSOLE', 'V3', FALSE, NULL, FALSE)
    , ('get_runtime_image_url', 1, NULL, 'NONE', 'NONE', FALSE, TRUE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_group_summary_am_status', 1, NULL, 'NONE', 'NONE', FALSE, FALSE, 'CONSOLE', 'EMS', FALSE, NULL, FALSE)
    , ('get_yaml_openshift', 1, NULL, 'NONE', 'NONE', '0', '0', 'CONSOLE', 'EMS', '0', NULL, '0')
ON CONFLICT(action_name, revision)
DO UPDATE 
   SET("procedure", db_type, db_method, check_target, read_only, service_target, product_group, audit_target, audit_type, audit_include_data) 
   = (excluded."procedure", excluded.db_type, excluded.db_method, excluded.check_target, excluded.read_only, excluded.service_target, excluded.product_group, excluded.audit_target, excluded.audit_type, excluded.audit_include_data);

------------------------------------------------------------------------
select '## tb_action_map_feature';
------------------------------------------------------------------------
INSERT INTO tb_action_map_feature(action_name, revision, feature_name, uri)
VALUES 
    ('set_task_schedule',1,'/response/domain','/api/console/ems/task/schedule/set')
    , ('add_task_schedule_engine_update',1,'/command/update_engine',NULL)
    , ('get_department_list',1,'/default','/api/console/management/department/list')
    , ('set_alert_correlation_rule',1,'/command/config_general','/api/console/ems/correlation/alert/set')
    , ('add_task_realtime_ips_signature_recommendation',1,'/command/hips_signature_recommandation','/api/console/ems/command/realtime')
    , ('get_beginning_server_service_list',1,'/default','/api/console/config/beginning/server/list')
    , ('save_mgmt_hips_signature_basic_recommendation_scan_node',1,'/management/signature',NULL)
    , ('set_manual_config',1,'/command/config_general','/api/console/config/manual/modify')
    , ('remove_license_cert_file',1,'/command/config_general','/api/console/config/license/certfile/remove')
    , ('get_agent_applied_policy',1,'/policy',NULL)
    , ('remove_ac_mgmt_policy',1,'/command/policy','/api/console/ems/policy/remove')
    , ('get_task',1,'/response/domain','/api/console/ems/task/get')
    , ('get_mail_config',1,'/config/general',NULL)
    , ('set_each_hips_agent_policy_apply',1,'/command/policy','/api/console/ems/policy/each/apply')
    , ('set_group_order',1,'/management/domain','/api/console/management/group/setGroupOrder')
    , ('get_external_system_detail',1,'/default','/api/console/config/external/system/detail')
    , ('save_mgmt_hips_signature_basic_recommendation_scan',1,'/management/signature',NULL)
    , ('upload_server_patch',1,'/command/deploy_product','/api/console/upload/server/patch')
    , ('add_task_realtime_send_mail',1,'/management/domain/job',NULL)
    , ('get_import_policy_file',1,'/command/policy','/api/console/ems/policy/import/file')
    , ('add_task_realtime_send_notice',1,'/command/notice','/api/console/ems/command/realtime')
    , ('get_agent_detail_sw_log',1,'/eventlog','/api/console/ems/group/agent/info')
    , ('set_update_product_user_config',1,'/command/config_general','/api/console/config/update/user/modify')
    , ('check_connection_change_sesrver',1,'/default','/api/console/ems/command/connection_check')
    , ('save_azure_all_account_vm_list',1,'/management/domain','/api/console/v1/cloud/azure/sync/all-account/vm/save')
    , ('get_product_info',1,'/default','/api/console/management/product/info')
    , ('remove_azure_account_list',1,'/config/general','/api/console/v1/config/cloud/azure/account/remove/list')
    , ('remove_base_report_layout',1,'/report','/api/console/ems/base/report/layout/remove')
    , ('get_rtcommand',1,'/response/domain','/api/agent/ems/task')
    , ('add_task_schedule_generate_report',1,'/command/artifact',NULL)
    , ('set_task_target_in_target_id',1,'/default',NULL)
    , ('get_agent_detail_hw_log',1,'/eventlog','/api/console/ems/group/agent/info')
    , ('add_ac_mgmt_policy',1,'/command/policy','/api/console/ems/policy/add')
    , ('get_policy_task',1,'/response/domain','/api/console/ems/policy/task/add')
    , ('add_task_schedule_ac_changing_action_mode',1,'/command/ac_changing_action_mode','/api/console/ems/task/schedule/set||/api/console/ems/command/schedule')
    , ('add_beginning_admin',1,'/default','/api/console/ems/beginning/admin/create')
    , ('set_alert_template',1,'/command/config_general','/api/console/ems/template/alert/set')
    , ('remove_query_report',1,'/report','/api/console/ems/query/report/remove')
    , ('remove_aws_account_list',1,'/config/general','/api/console/v1/config/cloud/aws/account/remove/list')
    , ('save_cloud_all_account_resource_list',1,'/management/domain','/api/console/v1/cloud/common/sync/all-account/resource/save')
    , ('add_task_realtime_notification_center',1,'/management/domain/job',NULL)
    , ('remove_config_server',1,'/command/config_general','/api/console/config/domain/server/remove')
    , ('remove_external_system',1,'/config/general','/api/console/config/external/system/remove')
    , ('set_system_info',1,'/command/config_general','/api/console/config/system/modify')
    , ('set_system_info',2,'/command/config_general','/api/console/config/system/modify')
    , ('add_task_schedule_generate_server_report',1,'/command/serverreport',NULL)
    , ('add_task_realtime_generate_report',1,'/command/artifact',NULL)
    , ('get_task_target_server_list',1,'/response/domain','/api/console/ems/task/target/serverList')
    , ('get_node_list',1,'/default','/api/console/ems/group/agent/share/folder/info')
    , ('get_task_favorite_cnt_list',1,'/response/domain','/api/console/ems/task/favorite/list')
    , ('set_report_clean',1,'/command/config_general','/api/console/config/report/clean/modify')
    , ('save_hips_signature_basic_recommendation_used_list',1,'/management/signature','/api/console/v1/management/hips/signature/basic/recommendation/used/save/list')
    , ('get_agent_agent_hips_status_list',1,'/management/domain','/api/console/v1/group/agent/hips/status/list')
    , ('get_ips_geodb_update_server_type',1,'/default',NULL)
    , ('get_policy_detail',1,'/policy','/api/console/ems/policy/detail')
    , ('get_admin_login_status_list',1,'/default','/api/console/ems/admin/login/list')
    , ('get_predefined_policy_data',1,'/policy','/api/console/ems/policy/predefined/data')
    , ('modify_external_system',1,'/default','/api/console/config/external/system/modify')
    , ('set_each_ac_agent_policy_apply',1,'/command/policy','/api/console/ems/policy/each/apply')
    , ('remove_release_package',1,'/management/product',NULL)
    , ('add_hips_fw_policy',1,'/command/policy','/api/console/ems/policy/add')
    , ('add_task_realtime_update_ips_geo_db',1,'/command/update_ips',NULL)
    , ('set_v3_pkg_update',1,'/management/domain','/api/console/config/v3/pkg/update/modify')
    , ('get_hips_detect_log_packet_file_download',1,'/eventlog','/api/console/v1/packet/viewer/log/hips/detect/download/pcap')
    , ('add_task_target_status',1,'/default',NULL)
    , ('add_aws_account',1,'/config/general','/api/console/v1/config/cloud/aws/account/add')
    , ('add_task_schedule_hips_product_update',1,'/command/update_product','/api/console/ems/command/schedule')
    , ('set_config_server_name',1,'/command/config_general','/api/console/config/domain/server/nameModify')
    , ('save_agent_status_ips_signature',1,'/management/domain','/api/console/v1/group/agent/status/ips/signature/save')
    , ('upload_ips_signature',1,'/command/update_ips','/api/console/hips/upload/signature')
    , ('issue_otp_code',1,'/default','/api/console/ems/otp/issue')
    , ('get_server_in_ip',1,'/default','/api/console/ems/deployment/register/agent||/api/console/ems/deployment/register/agent/fileserver||/api/console/ems/deployment/agent/remove||/api/console/ems/deployment/agent/remove/page||/api/console/ems/deployment/agent/remove_execute||/api/console/ems/deployment/register/agent/getInstallFile||/api/console/ems/deployment/register/agent/updateInstallFile||/api/console/ems/deployment/agent/master||/api/console/ems/deployment/agent/page')
    , ('get_correlation_rule_group',1,'/default','/api/console/ems/correlation/list')
    , ('set_log_configs',1,'/command/config_general','/api/console/config/log/modify')
    , ('get_agent_policy_applied_summary_info',1,'/management/domain','/api/console/ems/group/agent/policy/applied/summary/info')
    , ('add_task_realtime_check_server_integrity',1,'/command/integrity','/api/console/ems/command/realtime')
    , ('add_task_schedule_send_mail',1,'/management/domain/schedule',NULL)
    , ('add_task_realtime_v3_exec_optimization',1,'/command/v3_optimize','/api/console/ems/command/realtime')
    , ('get_disk_status',1,'/management/domain','/api/console/management/domain/diskStatus')
    , ('get_server_integrity_log',1,'/default','/api/console/ems/dashboard/integrity/log')
    , ('remove_mgmt_hips_signature_custom_list',1,'/management/signature','/api/console/v1/management/hips/signature/custom/remove/list')
    , ('set_query_report',1,'/report','/api/console/ems/query/report/modify')
    , ('get_agent_distribute_status',1,'/management/domain','/api/console/apm/mgmt')
    , ('add_task_schedule_collect_hardware',1,'/command/asset_command','/api/console/ems/task/schedule/set||/api/console/ems/command/schedule')
    , ('save_update_hips_signature',1,'/config/general','/api/console/v1/config/update/hips_signature/save')
    , ('upload_im',1,'/config/general','/api/console/v1/config/update/im/upload')
    , ('get_ac_allow_inventory_list',1,'/management/ac','/api/console/v1/management/ac/allow/inventory/list')
    , ('add_task_realtime_engine_update',1,'/command/update_engine','/api/console/ems/command/realtime')
    , ('issue_otp_uninstall_agent',1,'/command/uninstall_agent','/api/console/ems/otp/issue')
    , ('add_task_schedule_send_notice',1,'/command/notice','/api/console/ems/task/schedule/set||/api/console/ems/command/schedule')
    , ('add_task_schedule_check_server_integrity',1,'/command/integrity',NULL)
    , ('get_agent_azure_system',1,'/management/domain','/api/console/v1/group/agent/cloud/azure')
    , ('get_open_source_list',1,'/default','/api/console/ems/intro/help/openSourceList')
    , ('set_policy_schedule',1,'/command/policy',NULL)
    , ('remove_ac_allow_inventory_list',1,'/management/ac','/api/console/v1/management/ac/allow/inventory/remove/list')
    , ('set_file_update_server',1,'/command/config_general','/api/console/config/file_update_server/set')
    , ('get_blocked_node_status',1,'/management/domain',NULL)
    , ('remove_country_list',1,'/config/general','/api/console/v1/config/country/remove/list')
    , ('add_task_realtime_set_server',1,'/command/agent_command','/api/console/ems/command/realtime')
    , ('remove_aws_account',1,'/config/general','/api/console/v1/config/cloud/aws/account/remove/list')
    , ('set_group_order_setting',1,'/management/domain','/api/console/management/group/setGroupOrderSetting')
    , ('set_agent_threshold',1,'/command/config_general','/api/console/config/agent/threshold/modify')
    , ('set_agent_risk_group',1,'/command/config_general','/api/console/config/grouping/risk/modify')
    , ('set_agent_risk_group_clean',1,'/command/config_general','/api/console/config/grouping/risk/modify')
    , ('upload_release_package',1,'/management/product','/api/console/upload/resumable/upload')
    , ('get_file_upload_check',1,'/default','/api/agent/upload/resumable/upload')
    , ('add_task_schedule_apply_policy',1,'/command/policy','/api/console/ems/task/schedule/set||/api/console/ems/command/schedule')
    , ('get_task_type',1,'/default','/api/console/ems/correlation/taskType')
    , ('add_task_schedule_ac_product_update',1,'/command/update_product','/api/console/ems/command/schedule')
    , ('get_agent_install_page_info',1,'/config/general','/api/console/config/agent/install/page/get')
    , ('set_beginning_system_info',1,'/default','/api/console/config/beginning/system/modify')
    , ('set_beginning_system_info',2,'/default','/api/console/config/beginning/system/modify')
    , ('set_dashboard_layout',1,'/dashboard','/api/console/dashboard/default')
    , ('get_agent_detail_hw_info',1,'/management/domain',NULL)
    , ('retry_job',1,'/response/domain','/api/console/ems/command/job/retry')
    , ('add_task_schedule_init_user_info',1,'/response/domain',NULL)
    , ('add_task_realtime_v3_exec_scan',1,'/command/v3_scan','/api/console/ems/command/realtime')
    , ('add_task_realtime_v3_exec_scan',2,'/command/v3_scan','/api/console/ems/command/realtime')
    , ('add_task_realtime_v3_stop_scan',1,'/command/v3_stop_scan','/api/console/ems/command/realtime')
    , ('add_task_realtime_v3_stop_scan',2,'/command/v3_stop_scan','/api/console/ems/command/realtime')
    , ('set_net_cert_mgmt_epp',1,'/command/config_general','/api/console/config/certificate/epp/modify')
    , ('set_each_v3_net_policy_apply',1,'/command/policy','/api/console/ems/policy/each/apply')
    , ('get_hips_signature_custom_import_file',1,'/management/signature',NULL)
    , ('add_task_schedule_check_agent_status',1,'/command/agent_command','/api/console/ems/command/schedule')
    , ('set_group_v3_linux_policy_apply',1,'/command/policy','/api/console/ems/policy/group/apply')
    , ('get_agent_agent_ac_status_list',1,'/management/domain','/api/console/v1/group/agent/ac/status/list')
    , ('set_admin_seed_key',1,'/command/config_general','/api/console/config/aprm/adminseed/add')
    , ('remove_v3_net_policy',1,'/command/policy','/api/console/ems/policy/remove')
    , ('add_task_realtime_initializing_whitelist',1,'/command/ac_initializing_whitelist','/api/console/ems/command/realtime')
    , ('get_agent_detail_sw_info',1,'/management/domain',NULL)
    , ('add_mgmt_hips_signature_custom',1,'/management/signature','/api/console/v1/management/hips/signature/custom/add||/api/console/v1/management/hips/signature/custom/modify')
    , ('add_task_schedule_modify_user_info',1,'/response/domain',NULL)
    , ('add_rtcommand',1,'/response/domain','/api/agent/ems/hash')
    , ('add_task_schedule_notification_center',1,'/management/domain/schedule',NULL)
    , ('remove_artifacts',1,'/detection','/api/console/ems/edr/artifacts/remove_execute||/api/console/ems/edr/artifacts/remove')
    , ('cancel_job',1,'/response/domain',NULL)
    , ('remove_report_status',1,'/report','/api/console/ems/report/status/remove')
    , ('set_group_policy_apply',1,'/command/policy',NULL)
    , ('upload_custom_package',1,'/management/distribution','/api/console/ems/otp/issue||/api/console/ems/otp/verify||/api/console/apm/mgmt/custom/pkg/register')
    , ('execute_server_all_update',1,'/command/deploy_product','/api/console/server/receive/console')
    , ('add_task_realtime_changing_action_mode',1,'/command/ac_changing_action_mode','/api/console/ems/command/realtime')
    , ('modify_ips_recommand_config',1,'/config/general','/api/console/v1/config/ips-recommend/modify')
    , ('add_task_realtime_apply_policy',1,'/command/policy','/api/console/ems/command/realtime')
    , ('excute_job',1,'/response/domain',NULL)
    , ('verify_login_otp_code',1,'/default','/api/console/ems/otp/verify')
    , ('set_beginning_server_service',1,'/default','/api/console/setting/receive/console')
    , ('get_login_status_privilege',1,'/default',NULL)
    , ('get_agent_summary_olap_info',1,'/management/domain','/api/console/ems/group/agent/summary/olap/info')
    , ('get_agent_list',1,'/default',NULL)
    , ('remove_report_logo_image',1,'/config/general','/api/console/config/report/logo/remove')
    , ('get_product_list_by_group',1,'/response/domain','/api/console/deploy/product_by_group/list')
    , ('get_report_schedule',1,'/report','/api/console/ems/report/latest/list')
    , ('remove_alert_template',1,'/command/config_general','/api/console/ems/template/alert/remove')
    , ('add_task_realtime_run_dtb',1,'/command/distribution','/api/console/ems/command/realtime')
    , ('set_task_favorite_list',1,'/management/domain','/api/console/ems/task/favorite/set')
    , ('add_config_server',1,'/command/config_general','/api/console/config/domain/server/add')
    , ('remove_custom_package',1,'/management/distribution','/api/console/apm/mgmt/custom/pkg/remove')
    , ('set_syslog',1,'/command/config_general','/api/console/v1/syslog/modify')
    , ('add_task_realtime_v3_remove_product',1,'/command/uninstall_product','/api/console/ems/command/realtime')
    , ('modify_agent_installer',1,'/command/deploy_product','/api/console/upload/agent/installer/modify')
    , ('register_agent_pkg',1,'/command/deploy_product','/api/console/upload/agent/install')
    , ('set_group_hips_fw_policy_apply',1,'/command/policy','/api/console/ems/policy/group/apply')
    , ('add_alibaba_account',1,'/config/general','/api/console/v1/config/cloud/alibaba/account/add')
    , ('set_group_v3_net_policy_apply',1,'/command/policy','/api/console/ems/policy/group/apply')
    , ('add_ac_allow_inventory',1,'/management/ac','/api/console/v1/management/ac/allow/inventory/add')
    , ('add_task_schedule_collect_software',1,'/command/asset_command','/api/console/ems/task/schedule/set||/api/console/ems/command/schedule')
    , ('get_task_target',1,'/response/domain',NULL)
    , ('get_widget_layout',1,'/dashboard',NULL)
    , ('add_task_realtime_ips_emergency_off',1,'/command/hips_emergency_off','/api/console/ems/command/realtime')
    , ('get_license',1,'/default','/api/console/config/license/get')
    , ('get_task_target_status_fail_list',1,'/response/domain','/api/console/ems/task/status/list')
    , ('set_policy_body',1,'/command/policy',NULL)
    , ('add_task_schedule_run_dtb',1,'/command/distribution','/api/console/ems/task/schedule/set||/api/console/ems/command/schedule')
    , ('get_node_info_by_id',1,'/management/domain',NULL)
    , ('add_beginning_config_server',1,'/default','/api/console/config/beginning/server/add')
    , ('get_base_report',1,'/report','/api/console/ems/correlation/report')
    , ('set_net_cert_mgmt_customer',1,'/command/config_general','/api/console/config/certificate/epp/modify||/api/console/config/certificate/customer/modify')
    , ('get_task_notification_list',1,'/correlation',NULL)
    , ('get_v3_management_summary_info',1,'/management/domain','/api/console/ems/group/agent/v3/management/summary/info')
    , ('remove_report_status_item',1,'/report','/api/console/ems/report/status/itemRemove')
    , ('set_ac_agent_policy',1,'/command/policy','/api/console/ems/policy/set')
    , ('upload_file',1,'/default','/api/agent/ems/im/upload_file')
    , ('add_task_schedule_remove_agent',1,'/command/uninstall_agent',NULL)
    , ('get_task_target_status_list',1,'/response/domain','/api/console/ems/task/status/list')
    , ('add_product_server',1,'/command/config_general','/api/console/config/domain/server/addConfig')
    , ('get_agent_v3_info',1,'/response/on_demand','/api/console/v3')
    , ('remove_country',1,'/config/general',NULL)
    , ('add_hips_agent_policy',1,'/command/policy','/api/console/ems/policy/add')
    , ('remove_ac_agent_policy',1,'/command/policy','/api/console/ems/policy/remove')
    , ('remove_server_report',1,'/command/serverreport','/api/console/ems/dashboard/domain/report/remove_execute||/api/console/ems/dashboard/domain/report/remove')
    , ('add_task_schedule_v3_exec_optimization',1,'/command/v3_optimize','/api/console/ems/task/schedule/set||/api/console/ems/command/schedule')
    , ('set_admin_password',1,'/command/config_admin','/api/console/ems/admin/password/modify')
    , ('add_task_schedule_modify_share_folder_auth',1,'/command/share_folder',NULL)
    , ('set_group_policy_apply_cache',1,'/command/policy',NULL)
    , ('set_base_report_layout',1,'/report','/api/console/ems/base/report/layout/modify')
    , ('add_task_realtime_update_ips_signature',1,'/command/update_ips','/api/console/ems/command/realtime')
    , ('get_service_status',1,'/management/domain','/api/console/management/domain/serviceStatus')
    , ('remove_hips_mgmt_policy',1,'/command/policy','/api/console/ems/policy/remove')
    , ('get_policy_body',1,'/policy',NULL)
    , ('add_task_realtime_ips_emergency_off_unlock',1,'/command/hips_emergency_off','/api/console/ems/command/realtime')
    , ('add_task_schedule_v3_exec_scan',1,'/command/v3_scan','/api/console/ems/command/schedule')
    , ('add_task_schedule_v3_exec_scan',2,'/command/v3_scan','/api/console/ems/command/schedule')
    , ('update_ahnlabcom_product',1,'/command/deploy_product',NULL)
    , ('get_domain_policy_status',1,'/management/domain','/api/console/management/domain/domainPolicyApply')
    , ('get_password_expire',1,'/default',NULL)
    , ('send_file_sync',1,'/default','/api/console/sync/package/send')
    , ('remove_file_sync',1,'/default',NULL)
    , ('get_login_status_id',1,'/default',NULL)
    , ('set_each_hips_mgmt_policy_apply',1,'/command/policy','/api/console/ems/policy/each/apply')
    , ('get_policy_factory',1,'/policy',NULL)
    , ('get_file_update_server_list',1,'/config/general','/api/console/config/file_update_server/list')
    , ('set_license',1,'/command/config_general','/api/console/config/license/modify')
    , ('set_each_policy_apply',1,'/command/policy',NULL)
    , ('send_mail',1,'/command/config_general','/api/console/config/mailserver/sendMail')
    , ('get_file_upload_ready',1,'/default','/api/console/upload/resumable/ready')
    , ('get_dtb_detail',1,'/management/distribution','/api/console/apm/policy')
    , ('upload_file',2,'/default','/api/agent/ems/im/upload_file')
    , ('get_hips_signature_custom_export_file',1,'/management/signature','/api/console/v1/management/hips/signature/custom/export/file')
    , ('get_mgmt_hips_signature_basic_agent_list',1,'/management/signature',NULL)
    , ('set_group_hips_mgmt_policy_apply',1,'/command/policy','/api/console/ems/policy/group/apply')
    , ('remove_group',1,'/management/domain','/api/console/management/group/remove')
    , ('get_license_product_list',1,'/config/general','/api/console/config/license/list')
    , ('get_deploy_detail',1,'/command/deploy_product',NULL)
    , ('get_agent_status_ips_summary_timeline',1,'/management/domain',NULL)
    , ('add_task_realtime_patch_server',1,'/command/update_server','/api/console/server/update')
    , ('set_server_service',1,'/command/config_general','/api/console/config/domain/server/modify')
    , ('remove_custom_privilege_profile',1,'/command/config_admin','/api/console/ems/role/profile/remove')
    , ('get_event_log_v3_device_list',1,'/eventlog','/api/console/ems/eventlog/v3Device/list')
    , ('check_file_sync_schedule',1,'/default',NULL)
    , ('get_agent_status_ips_signature_custom_detail',1,'/management/domain','/api/console/v1/group/agent/status/ips/signature/custom/detail')
    , ('get_login_fail_status',1,'/default',NULL)
    , ('get_task_notification_complete',1,'/default',NULL)
    , ('get_server_version',1,'/default','/api/console/server/version')
    , ('set_report_logo_image',1,'/config/general','/api/console/config/report/logo/imageModify')
    , ('get_platform_group',1,'/default','/api/console/ems/task/platform/group')
    , ('add_external_system',1,'/config/general','/api/console/config/external/system/add')
    , ('set_group_hips_agent_policy_apply',1,'/command/policy','/api/console/ems/policy/group/apply')
    , ('add_task_schedule_patch_server',1,'/command/update_server',NULL)
    , ('upload_geo_db',1,'/command/update_ips','/api/console/hips/upload/geodb')
    , ('set_ac_mgmt_policy',1,'/command/policy','/api/console/ems/policy/set')
    , ('add_group',1,'/management/domain','/api/console/management/group/add')
    , ('save_aws_all_account_instance_list',1,'/management/domain','/api/console/v1/cloud/aws/sync/all-account/instance/save')
    , ('get_task_send_mail_list',1,'/correlation',NULL)
    , ('register_v3_pkg',1,'/command/deploy_product','/api/console/management/v3/register')
    , ('add_task_schedule_set_server',1,'/command/agent_command','/api/console/ems/task/schedule/set||/api/console/ems/command/schedule')
    , ('get_policy_array_list',1,'/config/general','/api/console/ems/policy/arrayList')
    , ('get_check_group_list',1,'/default',NULL)
    , ('get_ac_mgmt_policy_detail',1,'/policy/policy_AC_PC_R','/api/console/ems/policy/detail')
    , ('get_mgmt_hips_signature_basic_detail',1,'/management/signature','/api/console/v1/management/hips/signature/basic/detail')
    , ('get_mgmt_hips_signature_factory_detail',1,'/management/signature','/api/console/v1/management/hips/signature/factory/detail')
    , ('modify_mgmt_hips_signature_basic',1,'/management/signature','/api/console/v1/management/hips/signature/basic/modify')
    , ('save_mgmt_hips_signature_basic',1,'/management/signature','/api/console/v1/management/hips/signature/basic/all-action/save')
    , ('save_mgmt_hips_signature_basic_all_recommendation',1,'/management/signature','/api/console/v1/management/hips/signature/basic/all-recommendation/save')
    , ('remove_azure_account',1,'/config/general','/api/console/v1/config/cloud/azure/account/remove/list')
    , ('set_widget',1,'/dashboard','/api/console/dashboard/widget/set')
    , ('set_each_hips_fw_policy_apply',1,'/command/policy','/api/console/ems/policy/each/apply')
    , ('get_pkg_list_by_id',1,'/management/product',NULL)
    , ('set_notification_center',1,'/default',NULL)
    , ('set_hips_fw_policy',1,'/command/policy','/api/console/ems/policy/set')
    , ('upload_policy_file',1,'/command/policy','/api/console/ems/policy/upload/file')
    , ('set_agent_install_page_info',1,'/command/config_general','/api/console/config/agent/install/page/modify||/api/console/config/agent/modify')
    , ('get_agent_user_info',1,'/management/domain','/api/console/ems/task/user')
    , ('remove_group_node',1,'/management/domain','/api/console/management/group/removeGroupNode')
    , ('set_group_ac_agent_policy_apply',1,'/command/policy','/api/console/ems/policy/group/apply')
    , ('update_ahnlabcom_v3',1,'/command/deploy_product','/api/console/ems/deploy/ahnlabcom/v3')
    , ('set_report_logo_position',1,'/report','/api/console/config/report/logo/positionModify')
    , ('get_dtb_list',1,'/management/distribution','/api/console/apm/policy')
    , ('get_product_server',1,'/default','/api/console/config/domain/server/Config')
    , ('add_task_schedule_check_integrity',1,'/command/agent_command','/api/console/ems/command/schedule')
    , ('add_ac_agent_policy',1,'/command/policy','/api/console/ems/policy/add')
    , ('set_group',1,'/management/domain','/api/console/management/group/set')
    , ('add_task_schedule_ips_signature_recommendation',1,'/command/hips_signature_recommandation','/api/console/ems/command/schedule')
    , ('get_widget_item_layout',1,'/dashboard',NULL)
    , ('set_system_eula',1,'/command/config_general','/api/console/config/system/eula/modify')
    , ('set_beginning_mail_server',1,'/command/config_general','/api/console/config/beginning/mailserver/modify')
    , ('get_topology_status',1,'/config/general','/api/console/config/virtual/system/topology_status')
    , ('verify_otp_code',1,'/default','/api/console/ems/otp/verify')
    , ('set_each_ac_mgmt_policy_apply',1,'/command/policy','/api/console/ems/policy/each/apply')
    , ('add_country',1,'/config/general','/api/console/v1/config/country/add')
    , ('set_service_port',1,'/command/config_general','/api/console/config/domain/port/modify')
    , ('remove_hips_agent_policy',1,'/command/policy','/api/console/ems/policy/remove')
    , ('set_auto_grouping',1,'/command/config_general',NULL)
    , ('preview_query_report',1,'/report','/api/console/ems/query/report/preview')
    , ('modify_mgmt_hips_signature_custom',1,'/management/signature','/api/console/v1/management/hips/signature/custom/modify')
    , ('get_mergeable_extra_policy_target',1,'/default',NULL)
    , ('get_config_list',1,'/config/general',NULL)
    , ('check_server_all_update',1,'/default','/api/console/server/update')
    , ('get_system_resource',1,'/management/domain','/api/console/management/domain/systemResource')
    , ('add_azure_account',1,'/config/general','/api/console/v1/config/cloud/azure/account/add')
    , ('add_task_schedule_deploy',1,'/response/domain','/api/console/ems/command/schedule')
    , ('add_query_report',1,'/report','/api/console/ems/query/report/create')
    , ('set_group_ac_mgmt_policy_apply',1,'/command/policy','/api/console/ems/policy/group/apply')
    , ('set_license_cert_file',1,'/command/config_general','/api/console/config/license/certfile/modify')
    , ('add_task_realtime_ac_changing_inventory_policy',1,'/management/ac','/api/console/ems/task/ac/change/inventory')
    , ('get_hips_signature_basic_recommendation_used_list',1,'/management/signature','/api/console/v1/management/hips/signature/basic/recommendation/used/list')
    , ('get_agent_status_ips_signature_basic_detail',1,'/management/domain','/api/console/v1/group/agent/status/ips/signature/basic/detail')
    , ('issue_login_otp_code',1,'/default','/api/console/ems/otp/issue')
    , ('get_raid_status',1,'/management/domain',NULL)
    , ('remove_task',1,'/response/domain','/api/console/ems/task/remove')
    , ('remove_beginning_config_server',1,'/default','/api/console/config/beginning/server/remove')
    , ('remove_hips_fw_policy',1,'/command/policy','/api/console/ems/policy/remove')
    , ('get_group_summary_scm_status',1,'/management/domain','/api/console/management/group/groupAgentSummary')
    , ('add_multi_admin',1,'/command/config_admin','/api/console/ems/admin/createList')
    , ('get_hwsw_event_log',1,'/eventlog',NULL)
    , ('set_beginning_system_eula',1,'/default','/api/console/config/beginning/eula/modify')
    , ('get_agent_status_ips_list',1,'/management/domain',NULL)
    , ('add_task_schedule_ac_initializing_whitelist',1,'/command/ac_initializing_whitelist','/api/console/ems/command/schedule')
    , ('modify_country',1,'/config/general','/api/console/v1/config/country/modify')
    , ('get_distribution_list',1,'/management/distribution','/api/console/management/distribution/list')
    , ('remove_distribution_list',1,'/management/distribution',NULL)
    , ('add_task_realtime_remote_ctrl',1,'/command/remote_control','/api/console/ems/command/realtime')
    , ('get_policy_ips_signature_basic_list',1,'/policy','/api/console/v1/policy/ips/signature/basic/list')
    , ('get_policy_ips_signature_custom_list',1,'/policy','/api/console/v1/policy/ips/signature/custom/list')
    , ('set_hips_recommendation',1,'/default','/api/agent/ems/hips/recommendation')
    , ('set_hips_basic_recommendation',1,'/default','/api/agent/ems/hips/recommendation-basic')
    , ('set_hips_recommendation_cpe',1,'/default','/api/agent/ems/hips/recommendation-cpe')
    , ('get_batch_lag_count',1,'/dashboard/batch/lag/count','/api/console/v1/dashboard/batch/lag/count')
    , ('get_update_version_info',1,'/default',NULL)
    , ('apply_multiple_policy',1,'/command/policy','/api/console/ems/policy/multiple/apply')
    , ('add_hips_ip_exception',1,'/command/policy','/api/console/ems/policy/hips/ip-exception/add')
    , ('set_hips_ip_exception',1,'/command/policy','/api/console/ems/policy/hips/ip-exception/set')
    , ('remove_hips_ip_exception',1,'/command/policy','/api/console/ems/policy/hips/ip-exception/remove')
    , ('multiple_add_hips_ip_exception',1,'/command/policy','/api/console/ems/policy/hips/ip-exception-list/add')
    , ('save_ips_signature_unit_all_agent',1,'/management/domain','/api/console/v1/management/hips/signature/unit/all-agent/save')
    , ('remove_ips_signature_unit_all_agent',1,'/management/domain','/api/console/v1/management/hips/signature/unit/all-agent/remove')
    , ('get_ips_signature_basic_info',1,'/management/signature','/api/console/v1/management/hips/signature/basic/info')
    , ('add_task_realtime_v3_quarantine_lookup',1,'/command/v3_quarantine_lookup','/api/console/ems/command/realtime')
    , ('add_task_realtime_v3_remove_emergency_off',1,'/command/v3_remove_emergency_off','/api/console/ems/command/realtime')
    , ('add_task_realtime_v3_quarantine_restore',1,'/default','/api/console/ems/task/quarantine/restore')
    , ('modify_mgmt_ac_im_watchlist',1,'/management/ac','/api/console/v1/management/ac/im/watchlist/modify')
    , ('add_mgmt_ac_im_watchlist',1,'/management/ac','/api/console/v1/management/ac/im/watchlist/add')
    , ('remove_mgmt_ac_im_watchlist',1,'/management/ac','/api/console/v1/management/ac/im/watchlist/remove')
    , ('save_mgmt_ac_im_watchlist_use',1,'/management/ac','/api/console/v1/management/ac/im/watchlist/use/save')
    , ('add_mgmt_ac_im_rule',1,'/management/ac','/api/console/v1/management/ac/im/rule/add')
    , ('modify_mgmt_ac_im_rule',1,'/management/ac','/api/console/v1/management/ac/im/rule/modify')
    , ('modify_mgmt_ac_predefined_im_rule',1,'/management/ac','/api/console/v1/management/ac/im/rule/predefined/modify')
    , ('remove_mgmt_ac_im_rule',1,'/management/ac','/api/console/v1/management/ac/im/rule/remove')
    , ('save_mgmt_ac_im_rule_watchlist',1,'/management/ac','/api/console/v1/management/ac/im/rule/watchlist/save')
    , ('get_mgmt_ac_im_rule_detail',1,'/management/ac','/api/console/v1/management/ac/im/rule/detail')
    , ('get_task_ac_im_ondemand_detail',1,'/default','/api/console/v1/ac/im/ondemand/detail')
    , ('remove_task_ac_im_ondemand',1,'/default','/api/console/v1/ac/im/ondemand/remove')
    , ('get_ips_signature_action_config',1,'/config/general','/api/console/v1/config/ips-signature/action/detail')
    , ('modify_ips_signature_action_config',1,'/config/general','/api/console/v1/config/ips-signature/action/modify||/api/console/v1/config/ips-signature/modify')
    , ('add_task_realtime_im_rulecheck',1,'/command/im_rulecheck','/api/console/ems/command/realtime')
    , ('add_task_realtime_im_reqlog',1,'/command/im_reqlog','/api/console/ems/command/realtime')
    , ('save_mgmt_hips_signature_custom',1,'/management/signature','/api/console/v1/management/hips/signature/custom/all-action/save')
    , ('remove_im_mgmt_policy',1,'/command/policy','/api/console/ems/policy/remove')
    , ('set_each_im_mgmt_policy_apply',1,'/command/policy','/api/console/ems/policy/each/apply')
    , ('set_group_im_mgmt_policy_apply',1,'/command/policy','/api/console/ems/policy/group/apply')
    , ('add_policy_im_watchlist_list',1,'/policy','/api/console/v1/policy/im/watchlist/add')
    , ('save_mgmt_watchlist_tag',1,'/management/ac','/api/console/v1/management/ac/im/watchlist/tag/save')
    , ('modify_mgmt_watchlist_tag',1,'/management/ac','/api/console/v1/management/ac/im/watchlist/tag/modify')
    , ('remove_mgmt_watchlist_tag',1,'/management/ac','/api/console/v1/management/ac/im/watchlist/tag/remove')
    , ('set_agent_manage_product',1,'/command/config_general','/api/console/config/agent/modify')
    , ('register_scm_pkg',1,'/command/deploy_product','/api/console/scm/mgmt/client/register')
    , ('add_task_realtime_scm_product_update',1,'/command/update_product','/api/console/ems/command/realtime')
    , ('add_task_schedule_scm_product_update',1,'/command/update_product','/api/console/ems/command/schedule')
    , ('add_task_realtime_scm_check',1,'/command/scm_check','/api/console/ems/command/realtime')
    , ('add_task_schedule_scm_check',1,'/command/scm_check','/api/console/ems/task/schedule/set||/api/console/ems/command/schedule')
    , ('add_task_realtime_scm_check_cancel',1,'/command/scm_check_cancel','/api/console/ems/command/realtime')
    , ('get_event_log_scm_agent_list',1,'/eventlog','/api/console/ems/eventlog')
    , ('get_event_log_scm_scan_list',1,'/eventlog','/api/console/ems/eventlog')
    , ('get_update_scm',1,'/config/general','/api/console/v1/config/update/detail')
    , ('save_update_scm',1,'/config/general','/api/console/v1/config/update/scm/save')
    , ('add_scm_agent_policy',1,'/command/policy','/api/console/ems/policy/add')
    , ('get_scm_agent_policy_detail',1,'/policy','/api/console/ems/policy/detail')
    , ('get_scm_agent_policy_factory',1,'/policy','/api/console/ems/policy/get/factory')
    , ('remove_scm_agent_policy',1,'/command/policy','/api/console/ems/policy/remove')
    , ('set_scm_agent_policy',1,'/command/policy','/api/console/ems/policy/set')
    , ('set_each_scm_agent_policy_apply',1,'/command/policy','/api/console/ems/policy/each/apply')
    , ('set_group_scm_agent_policy_apply',1,'/command/policy','/api/console/ems/policy/group/apply')
    , ('add_scm_mgmt_policy',1,'/command/policy','/api/console/ems/policy/add')
    , ('get_scm_mgmt_policy_detail',1,'/policy','/api/console/ems/policy/detail')
    , ('get_scm_mgmt_policy_factory',1,'/policy','/api/console/ems/policy/get/factory')
    , ('remove_scm_mgmt_policy',1,'/command/policy','/api/console/ems/policy/remove')
    , ('set_scm_mgmt_policy',1,'/command/policy','/api/console/ems/policy/set')
    , ('set_each_scm_mgmt_policy_apply',1,'/command/policy','/api/console/ems/policy/each/apply')
    , ('set_group_scm_mgmt_policy_apply',1,'/command/policy','/api/console/ems/policy/group/apply')
    , ('get_group_subgroup_scm_status_summary_list',1,'/management/domain','/api/console/v1/group/subgroup/scm/status/summary/list')
    , ('get_agent_scm_status_link_list',1,'/management/domain','/api/console/ems/agent/status/link')
    , ('get_agent_scm_status_detail',1,'/management/domain','/api/console/v1/group/agent/scm/status/detail')
    , ('get_event_log_scm_scan_detail_count',1,'/eventlog','/api/console/v1/scm/eventlog/scan/detail/count')
    , ('get_event_log_scm_scan_detail',1,'/eventlog','/api/console/v1/scm/eventlog/scan/detail')
    , ('get_event_log_scm_scan_detail_summary',1,'/eventlog','/api/console/v1/scm/eventlog/scan/detail/summary')
    , ('get_event_log_scm_scan_detail_compliance_summary',1,'/eventlog','/api/console/v1/scm/eventlog/scan/detail/compliance-summary')
    , ('get_event_log_scm_scan_detail_secret_summary',1,'/eventlog','/api/console/v1/scm/eventlog/scan/detail/secret-summary')
    , ('get_mgmt_scm_predefinition_compliance_rule_set_info',1,'/management/scm','/api/console/v1/management/scm/predefinition/compliance/rule-set/info')
    , ('get_mgmt_scm_predefinition_compliance_rule_set_audit_detail',1,'/management/scm','/api/console/v1/management/scm/predefinition/compliance/rule-set/audit/detail')
    , ('get_mgmt_scm_predefinition_compliance_agent_list',1,'/management/scm','/api/console/v1/management/scm/predefinition/compliance/agent/list')
    , ('get_mgmt_scm_predefinition_secret_rule_set_list',1,'/management/scm','/api/console/v1/management/scm/predefinition/secret/rule-set/list')
    , ('get_mgmt_scm_predefinition_secret_rule_set_audit_detail',1,'/management/scm','/api/console/v1/management/scm/predefinition/secret/rule-set/audit/detail')
    , ('get_mgmt_scm_predefinition_secret_agent_list',1,'/management/scm','/api/console/v1/management/scm/predefinition/secret/agent/list')
    , ('get_mgmt_scm_userdefined_compliance_rule_set_info',1,'/management/scm','/api/console/v1/management/scm/userdefined/compliance/list')
    , ('remove_mgmt_scm_userdefined_compliance_rule_set_info',1,'/management/scm','/api/console/v1/management/scm/userdefined/compliance/remove')
    , ('get_mgmt_scm_userdefined_compliance_rule_set_info_basic',1,'/management/scm','/api/console/v1/management/scm/userdefined/compliance/detail/basic')
    , ('get_mgmt_scm_userdefined_compliance_rule_set_info_agent',1,'/management/scm','/api/console/v1/management/scm/userdefined/compliance/detail/agent')
    , ('modify_mgmt_scm_userdefined_compliance_rule_set_info',1,'/management/scm','/api/console/v1/management/scm/userdefined/compliance/modify')
    , ('add_mgmt_scm_userdefined_compliance_rule_set_info',1,'/management/scm','/api/console/v1/management/scm/userdefined/compliance/add')
    , ('get_mgmt_scm_userdefined_secret_rule_set_info',1,'/management/scm','/api/console/v1/management/scm/userdefined/secret/list')
    , ('remove_mgmt_scm_userdefined_secret_rule_set_info',1,'/management/scm','/api/console/v1/management/scm/userdefined/secret/remove')
    , ('get_mgmt_scm_userdefined_secret_rule_set_info_basic',1,'/management/scm','/api/console/v1/management/scm/userdefined/secret/detail/basic')
    , ('get_mgmt_scm_userdefined_secret_rule_set_info_agent',1,'/management/scm','/api/console/v1/management/scm/userdefined/secret/detail/agent')
    , ('modify_mgmt_scm_userdefined_secret_rule_set_info',1,'/management/scm','/api/console/v1/management/scm/userdefined/secret/modify')
    , ('add_mgmt_scm_userdefined_secret_rule_set_info',1,'/management/scm','/api/console/v1/management/scm/userdefined/secret/add')
    , ('get_agent_scm_predefinition_rule_set_list',1,'/management/domain','/api/console/v1/group/agent/scm/predefinition/rule-set/list')
    , ('get_agent_scm_userdefinition_rule_set_list',1,'/management/domain','/api/console/v1/group/agent/scm/userdefinition/rule-set/list')
    , ('get_policy_scm_userdefinition_rule_set_list',1,'/policy','/api/console/v1/policy/scm/userdefinition/rule-set/list')
    , ('get_policy_scm_checked_predefinition_rule_set_list',1,'/policy','/api/console/v1/policy/scm/checked/predefinition/rule-set/list')
    , ('get_policy_scm_checked_userdefinition_rule_set_list',1,'/policy','/api/console/v1/policy/scm/checked/userdefinition/rule-set/list')
    , ('upload_scm',1,'/config/general','/api/console/v1/config/update/scm/upload')
    , ('get_update_oval',1,'/config/general','/api/console/v1/config/update/detail')
    , ('save_update_oval',1,'/config/general','/api/console/v1/config/update/oval/save')
    , ('upload_oval',1,'/config/general','/api/console/v1/config/update/oval/upload')
    , ('upload_clair_db',1,'/config/general','/api/console/hips/upload/clairdb')
    , ('add_task_realtime_v3_reset_scan_cache',1,'/command/v3_reset_scan_cache','/api/console/ems/command/realtime')
    , ('add_task_schedule_v3_reset_scan_cache',1,'/command/v3_reset_scan_cache','/api/console/ems/command/schedule')
    , ('set_after_changing_ip',1,'/config/general','/api/console/internal/ip/change')
    , ('modify_upload_file_status',1,'/config/general','/api/console/upload/status/modify')
    , ('get_event_log_service_list_custom',1,'/eventlog','/api/console/ems/eventlog/service/list')
    , ('get_event_log_audit_list_custom',1,'/eventlog','/api/console/ems/eventlog/audit/list')
    , ('get_event_log_engine_update_list_custom',1,'/eventlog','/api/console/ems/eventlog/engineUpdate/list')
    , ('get_event_log_backup_list_custom',1,'/eventlog','/api/console/ems/eventlog/backup/list')
    , ('get_event_log_dist_list_custom',1,'/eventlog','/api/console/ems/eventlog/dist/list')
    , ('get_event_log_pkg_sync_list_custom',1,'/eventlog','/api/console/ems/eventlog/pkgSync/list')
    , ('get_event_log_agent_install_pkg_list_custom',1,'/eventlog','/api/console/ems/eventlog/agentInstallPkg/list')
    , ('get_event_log_agent_event_list_custom',1,'/eventlog','/api/console/ems/eventlog/agentEvent/list')
    , ('get_event_log_task_status_list_custom',1,'/eventlog','/api/console/ems/eventlog/taskStatus/list')
    , ('get_event_log_node_sw_list_custom',1,'/eventlog','/api/console/ems/eventlog/nodeSw/list')
    , ('get_event_log_node_hw_list_custom',1,'/eventlog','/api/console/ems/eventlog/nodeHw/list')
    , ('get_event_log_v3_ss_list_custom',1,'/eventlog','/api/console/ems/eventlog/v3Ss/list')
    , ('get_event_log_v3_is_list_custom',1,'/eventlog','/api/console/ems/eventlog/v3Is/list')
    , ('get_event_log_v3_sup_list_custom',1,'/eventlog','/api/console/ems/eventlog/v3Sup/list')
    , ('get_event_log_v3_quar_list_custom',1,'/eventlog','/api/console/ems/eventlog')
    , ('get_event_log_hips_agent_list_custom',1,'/eventlog','/api/console/ems/eventlog')
    , ('get_event_log_ac_agent_list_custom',1,'/eventlog','/api/console/ems/eventlog')
    , ('get_event_log_ac_exec_list_custom',1,'/eventlog','/api/console/ems/eventlog')
    , ('get_event_log_ac_access_list_custom',1,'/eventlog','/api/console/ems/eventlog')
    , ('get_event_log_ac_im_detect_list_custom',1,'/eventlog','/api/console/ems/eventlog')
    , ('get_event_log_scm_agent_list_custom',1,'/eventlog','/api/console/ems/eventlog')
    , ('get_event_log_scm_scan_list_custom',1,'/eventlog','/api/console/ems/eventlog')
    , ('get_event_log_search_list', 1, '/eventlog', '/api/console/v1/eventlog/search/list')
    , ('add_event_log_search_csv', 1, '/eventlog', '/api/console/v1/eventlog/search/csv/add')
    , ('get_event_log_lucene_search_list', 1, '/eventlog', '/api/console/v1/eventlog/lucene/search/list')
    , ('add_event_log_lucene_search_csv', 1, '/eventlog', '/api/console/v1/eventlog/lucene/search/csv/add')
    , ('get_event_log_search_csv_list', 1, '/eventlog', '/api/console/v1/eventlog/search/csv/list')
    , ('remove_event_log_search_csv', 1, '/eventlog', '/api/console/v1/eventlog/search/csv/remove')
    , ('cancel_event_log_search_csv', 1, '/eventlog', '/api/console/v1/eventlog/search/csv/cancel')
    , ('get_event_log_search_field_list', 1, '/eventlog', '/api/console/v1/eventlog/search/field/list')
    , ('get_event_log_search_type_field_list', 1, '/eventlog', '/api/console/v1/eventlog/search/type/field/list')
    , ('get_event_log_server_alert_list_custom',1,'/eventlog','/api/console/ems/eventlog/serverAlert/list')
    , ('modify_event_log_limit',1,'/config/general','/api/console/v1/config/modify')
    , ('get_product_deploy_config',1,'/config/general',NULL)
    , ('modify_ips_signature_config',1,'/config/general','/api/console/v1/config/ips-signature/modify')
    , ('get_hips_fw_block_ip_rule',1,'/management/signature','/api/console/v1/management/hips/fw/block-ip-rule/detail||/api/console/v1/group/agent/status/ips/block-ip-rule/detail')
    , ('get_hips_fw_block_ip_rule_use_agent_list',1,'/management/signature','/api/console/v1/management/hips/fw/block-ip-rule/use-agent/list')
    , ('add_hips_fw_block_ip_rule',1,'/management/signature','/api/console/v1/management/hips/fw/block-ip-rule/add')
    , ('modify_hips_fw_block_ip_rule',1,'/management/signature','/api/console/v1/management/hips/fw/block-ip-rule/modify')
    , ('remove_hips_fw_block_ip_rule',1,'/management/signature','/api/console/v1/management/hips/fw/block-ip-rule/remove')
    , ('get_policy_hips_fw_block_ip_rule',1,'/policy','/api/console/v1/policy/hips/fw/block-ip-rule/detail')
    , ('get_policy_hips_fw_block_ip_rule_list',1,'/policy','/api/console/v1/policy/hips/fw/block-ip-rule/list||/api/console/v1/policy/hips/fw/block-ip-rule/policy/list||/api/console/v1/policy/hips/fw/block-ip-rule/list/rule-ids')
    , ('get_policy_hips_fw_block_ip_rule_count',1,'/policy','/api/console/v1/policy/hips/fw/block-ip-rule/count')
    , ('get_block_ip_rule_info',1,'/default','/api/agent/ems/hips/fw/block-ip-rule')
    , ('get_block_ip_rule_list',1,'/default','/api/agent/ems/hips/fw/block-ip-rule/list')
    , ('get_manager_group_group_list',1,'/config/general','/api/console/v1/manager-group/group/list')
    , ('get_license_detail',1,'/config/license','/api/console/v1/config/license/detail')
    , ('get_license_eula_detail',1,'/config/license','/api/console/v1/config/license/eula/detail')
    , ('modify_license',1,'/config/license','/api/console/v1/config/license/modify')
    , ('get_group_license_usage_list',1,'/config/license','/api/console/v1/config/group/license/usage/list')
    , ('modify_group_license_list',1,'/config/license','/api/console/v1/config/group/license/modify')
    , ('modify_main_license',1,'/config/license','/api/console/v1/config/license/main/modify')
    , ('add_license_oafq',1,'/config/license','/api/console/v1/config/license/oafq/add')
    , ('modify_asset_info',1,'/config/general','/api/console/v1/config/asset-info/modify')
    , ('upload_asset_target',1,'/config/general','/api/console/v1/config/asset-info/upload')
    , ('get_event_log_cnapp_list_custom',1,'/security','/api/console/ems/eventlog')
    , ('get_event_log_cnapp_malware_scan_list_custom',1,'/security','/api/console/ems/eventlog')
    , ('get_event_log_cnapp_vulnerability_scan_list_custom',1,'/security','/api/console/ems/eventlog')
    , ('save_update_cnapp',1,'/config/general','/api/console/v1/config/update/cnapp/save')
    , ('upload_cnapp',1,'/config/general','/api/console/v1/config/update/cnapp/upload')
    , ('enable_metering',1,'/config/general/metering','/api/console/config/metering/enable')
    , ('remove_alibaba_account',1,'/config/general',NULL)
    , ('remove_alibaba_account_list',1,'/config/general','/api/console/v1/config/cloud/alibaba/account/remove/list')
    , ('save_alibaba_all_account_instance_list',1,'/management/domain','/api/console/v1/cloud/alibaba/sync/all-account/instance/save')
    , ('find_mongo_collection',1,'/eventlog','/api/console/v1/eventlog/mongo/find')
    , ('get_server_info',1,'/default','/api/console/ems/dashboard/server/info')
    , ('register_amc_pkg',1,'/command/deploy_product','/api/console/amc/mgmt/client/register')
    , ('add_amc_mgmt_policy',1,'/policy/policy_AMC_W','/api/console/ems/policy/add')
    , ('set_amc_mgmt_policy',1,'/policy/policy_AMC_W','/api/console/ems/policy/set')
    , ('remove_amc_mgmt_policy',1,'/policy/policy_AMC_W','/api/console/ems/policy/detail||/api/console/ems/policy/remove')
    , ('set_each_amc_mgmt_policy_apply',1,'/command/policy','/api/console/ems/policy/each/apply')
    , ('set_group_amc_mgmt_policy_apply',1,'/command/policy','/api/console/ems/policy/group/apply')
    , ('get_agent_InstallFile',1,'/config/general','/api/console/ems/deployment/register/agent/getInstallFile')
    , ('update_agent_InstallFile',1,'/config/general','/api/console/ems/deployment/register/agent/updateInstallFile')
    , ('add_task_realtime_amc_product_update',1,'/command/update_product','/api/console/ems/command/realtime')
    , ('add_task_schedule_amc_product_update',1,'/command/update_product','/api/console/ems/command/schedule')
    , ('add_console_event_log',1,'/eventlog','/api/console/v1/eventlog/audit')
    , ('get_cert_license_info_list',1,'/default','/api/console/v1/config/license/cert/info/list')
    , ('get_event_log_dist_list',1,'/eventlog','/api/console/ems/eventlog/dist/list')
    , ('add_task_schedule_edr_collect_ahnreport',1,'/command/artifact','/api/console/ems/command/schedule')
    , ('remove_correlation_rule',1,'/correlation','/api/console/ems/correlation/remove')
    , ('get_admin',1,'/default','/api/console/ems/admin/get')
    , ('get_agent_status_v3_info',1,'/management/domain','/api/console/ems/agent/status/link')
    , ('add_task_realtime_init_user_info',1,'/management/domain','/api/console/ems/command/realtime')
    , ('get_cloud_proxy_setting',1,'/config/general','/api/console/v1/config/cloud-proxy/info')
    , ('get_task_type_product_id',1,'/eventlog','/api/console/ems/eventlog/tasktype')
    , ('get_alert_correlation_rule',1,'/command/config_general','/api/console/ems/correlation/alert/get')
    , ('get_server_resource',1,'/default','/api/console/ems/admin/server/resource')
    , ('get_correlation_exclude',1,'/correlation','/api/console/ems/correlation/exclude')
    , ('modify_aws_account',1,'/config/general','/api/console/v1/config/cloud/aws/account/modify')
    , ('get_table_clean_config_list',1,'/config/general','/api/console/config/db/clean/list')
    , ('set_report_schedule',1,'/report','/api/console/ems/report/schd/modify')
    , ('get_group_name_path',1,'/default','/api/console/management/group/name/path')
    , ('get_hips_agent_policy_detail',1,'/policy/policy_HIPS_A_R','/api/console/ems/policy/detail')
    , ('save_mgmt_hips_signature_basic_recommendation',1,'/config/general','/api/console/v1/management/hips/signature/basic/recommendation/save')
    , ('get_agent_status_agent_info_olap',1,'/management/domain','/api/console/ems/agent/status/link')
    , ('add_v3_net_policy',1,'/command/policy','/api/console/ems/policy/add')
    , ('get_report_status_list',1,'/report','/api/console/ems/report/status/list')
    , ('get_current_iso_time',1,'/default','/api/console/ems/currentIsoTime')
    , ('get_custom_dashboard_widget',1,'/dashboard','/api/console/ems/dashboard/custom/getWidgetDashboard')
    , ('set_agent_mgmt_key',1,'/command/config_general','/api/console/config/agent/modify')
    , ('get_agent_status_ips_signature_custom_list',1,'/management/domain','/api/console/v1/group/agent/status/ips/signature/custom/list')
    , ('get_manual_config',1,'/default','/api/console/config/manual/get')
    , ('get_hips_fw_policy_factory',1,'/policy','/api/console/ems/policy/get/factory')
    , ('set_hips_mgmt_policy',1,'/command/policy','/api/console/ems/policy/set')
    , ('add_correlation_rule',1,'/correlation','/api/console/ems/correlation/add')
    , ('get_agent_last_connected_time',1,'/management/domain','/api/console/ems/agent/info')
    , ('get_policy_agent_apply_list',1,'/management/domain','/api/console/ems/policy/agent/applyList')
    , ('add_task_realtime_apply_mergeable_policy',1,'/default','/api/console/ems/command/realtime')
    , ('set_view_layout',1,'/default','/api/console/view/getlayout')
    , ('get_agent_master',1,'/config/general','/api/console/ems/deployment/agent/master')
    , ('add_task_realtime_collect_software',1,'/command/asset_command','/api/console/ems/command/realtime')
    , ('get_external_system_list',1,'/default','/api/console/config/external/system/list')
    , ('get_v3_product_count',1,'/management/product','/api/console/management/v3/product/count')
    , ('get_log_config_list',1,'/config/general','/api/console/config/log/list')
    , ('register_agent_master_pkg',1,'/command/deploy_product','/api/console/upload/agent/master')
    , ('set_db_backup_config',1,'/command/db_backup','/api/console/config/db/backup/modify')
    , ('get_admin_privilege_profile_list',1,'/config/admin','/api/console/ems/role/profile/list')
    , ('get_login_status_list',1,'/default','/api/console/ems/admin/login/status')
    , ('get_product_list',1,'/default','/api/console/deploy/product/list')
    , ('add_alert_template',1,'/command/config_general','/api/console/ems/template/alert/add')
    , ('get_hips_detect_log_packet_detail',1,'/eventlog','/api/console/v1/packet/viewer/log/hips/detect/detail')
    , ('add_task_realtime_check_integrity',1,'/command/agent_command','/api/console/ems/command/realtime')
    , ('set_v3_linux_policy',1,'/command/policy','/api/console/ems/policy/set')
    , ('get_server_nat_list',1,'/config/general','/api/console/config/domain/server/list')
    , ('get_event_log_engine_update_list',1,'/eventlog','/api/console/ems/eventlog/engineUpdate/list')
    , ('get_event_log_task_status_list',1,'/eventlog','/api/console/ems/eventlog/taskStatus/list')
    , ('set_each_agent_policy_apply',1,'/command/policy','/api/console/ems/policy/each/apply')
    , ('get_server_service_list',1,'/management/domain','/api/console/config/domain/server/list')
    , ('get_hips_fw_policy_detail',1,'/policy/policy_HIPS_FW_R','/api/console/ems/policy/detail')
    , ('get_yaml_daemonset',1,'/config/general','/api/console/config/daemonset/yaml')
    , ('register_hips_pkg',1,'/command/deploy_product','/api/console/hips/mgmt/client/register')
    , ('get_agent_hips_status_link_list',1,'/management/domain','/api/console/ems/agent/status/link')
    , ('excute_server_command',1,'/response/domain','/api/console/ems/command/server/execute')
    , ('get_dashboard_summary_report',1,'/dashboard','/api/console/ems/dashboard/summary/alert')
    , ('get_agent_status_ips_info',1,'/management/domain','/api/console/v1/group/agent/status/ips/list||/api/console/v1/group/agent/status/ips/detail')
    , ('get_config_group_list',1,'/default','/api/console/config/system/list')
    , ('get_server_resource_list',1,'/default','/api/console/ems/dashboard/domain/resourceList')
    , ('get_dashboard_issue_agent_history',1,'/dashboard','/api/console/ems/dashboard/issueAgent')
    , ('get_group_summary_ac_status',1,'/management/domain','/api/console/management/group/groupAgentSummary')
    , ('get_query_report_list',1,'/report','/api/console/ems/query/report/list')
    , ('get_event_log_node_sw_list',1,'/eventlog','/api/console/ems/eventlog/nodeSw/list')
    , ('remove_v3_linux_policy',1,'/command/policy','/api/console/ems/policy/remove')
    , ('set_agent_policy',1,'/command/policy','/api/console/ems/policy/set')
    , ('get_dashboard_layout',1,'/dashboard','/api/console/dashboard/default')
    , ('remove_product_install_pkg',1,'/command/deploy_product','/api/console/ems/deployment/agent/remove_execute||/api/console/ems/deployment/agent/remove')
    , ('get_hips_agent_policy_factory',1,'/policy','/api/console/ems/policy/get/factory')
    , ('get_mgmt_hips_signature_custom_detail',1,'/management/signature','/api/console/v1/management/hips/signature/custom/detail')
    , ('get_node_policy_status',1,'/management/domain','/api/console/management/domain/domainPolicyApply')
    , ('register_ac_pkg',1,'/command/deploy_product','/api/console/ac/mgmt/client/register')
    , ('add_custom_privilege_profile',1,'/command/config_admin','/api/console/ems/role/profile/create')
    , ('get_agent_policy_detail',1,'/policy/policy_SA_R','/api/console/ems/policy/detail')
    , ('add_task_realtime_v3_product_update',1,'/command/update_product','/api/console/ems/command/realtime')
    , ('get_license_expire',1,'/default','/api/console/config/license/admin')
    , ('modify_cloud_proxy_setting',1,'/config/general','/api/console/v1/config/cloud-proxy/modify')
    , ('add_task_realtime_hips_product_update',1,'/command/update_product','/api/console/ems/command/realtime')
    , ('set_distribution_config',1,'/command/config_general','/api/console/config/domain/modify')
    , ('get_engine_update',1,'/default','/api/console/management/domain/engeneUpdate')
    , ('get_sw_list',1,'/management/software','/api/console/management/sw/list')
    , ('get_report_schedule_list',1,'/report','/api/console/ems/report/schd/list')
    , ('set_widget_layout',1,'/dashboard','/api/console/dashboard/widget/layout/set')
    , ('remove_syslog',1,'/command/config_general','/api/console/v1/syslog/remove')
    , ('add_task_realtime_edr_collect_ahnreport',1,'/command/ahnreport','/api/console/ems/command/realtime')
    , ('add_task_realtime_collect_hardware',1,'/command/asset_command','/api/console/ems/command/realtime')
    , ('get_update_im',1,'/config/general','/api/console/v1/config/update/detail')
    , ('save_update_im',1,'/config/general','/api/console/v1/config/update/im/save')
    , ('get_license_all_expire_date',1,'/management/domain','/api/console/ems/agent/info')
    , ('set_grouping_config',1,'/command/config_general','/api/console/config/grouping/modify')
    , ('get_agent_policy_status',1,'/management/domain','/api/console/management/agent/policy/count')
    , ('get_beginning_license_list',1,'/default','/api/console/config/beginning/license/list')
    , ('set_update_product_ems_config',1,'/command/config_general','/api/console/config/update/ems/modify')
    , ('get_table_clean_config',1,'/config/general','/api/console/config/db/clean/list')
    , ('get_register_agent_summary',1,'/default','/api/console/management/group/registerAgentSummary')
    , ('get_syslog_server',1,'/config/general','/api/console/v1/syslog/detail')
    , ('add_admin',1,'/command/config_admin','/api/console/ems/admin/create')
    , ('get_v3_infection_list',1,'/management/domain','/api/console/management/domain/malware/list')
    , ('get_agent_platform',1,'/management/domain','/api/console/ems/agent/info')
    , ('get_agent_status_agent_info_oltp',1,'/management/domain','/api/console/ems/group/agent/info')
    , ('get_event_log_ac_exec_list',1,'/eventlog','/api/console/ems/eventlog')
    , ('get_group_subgroup_ac_status_summary_list',1,'/management/domain','/api/console/v1/group/subgroup/ac/status/summary/list')
    , ('get_syslog_item_list',1,'/config/general','/api/console/v1/syslog/item/list')
    , ('set_table_clean_config',1,'/command/db_clean','/api/console/config/db/clean/modify')
    , ('get_aws_account_list',1,'/config/general','/api/console/v1/config/cloud/aws/account/list')
    , ('get_agent_status_issue_agent',1,'/management/domain','/api/console/ems/agent/status/issueAgent')
    , ('add_task_realtime_ac_product_update',1,'/command/update_product','/api/console/ems/command/realtime')
    , ('get_ac_mgmt_policy_factory',1,'/policy','/api/console/ems/policy/get/factory')
    , ('set_hips_agent_policy',1,'/command/policy','/api/console/ems/policy/set')
    , ('set_update_product_ahnlab_config',1,'/command/config_general','/api/console/config/update/ahnlab/modify')
    , ('test_azure_account',1,'/config/general','/api/console/v1/config/cloud/azure/account/test')
    , ('get_event_log_node_hw_list',1,'/eventlog','/api/console/ems/eventlog/nodeHw/list')
    , ('get_agent_status_group_issue_agent',1,'/management/domain','/api/console/ems/group/agent/issueAgent')
    , ('get_agent_status_policy_applied_info',1,'/management/domain','/api/console/ems/agent/status/link')
    , ('get_watch_info',1,'/default','/api/console/ems/watch/info')
    , ('get_privilege_profile',1,'/config/admin','/api/console/ems/role/profile/get')
    , ('add_widget',1,'/dashboard','/api/console/dashboard/widget/add')
    , ('get_anti_virus_product_list',1,'/management/product','/api/console/management/av/product/list')
    , ('add_task_realtime_patch_agent',1,'/command/update_product','/api/console/ems/command/realtime')
    , ('get_group_timeline',1,'/management/domain','/api/console/management/group/timeline')
    , ('get_country_list',1,'/config/general','/api/console/v1/config/country/list')
    , ('set_session_timeout',1,'/default','/api/console/ems/admin/set_session_timeout')
    , ('get_v3_linux_policy_factory',1,'/policy','/api/console/ems/policy/get/factory')
    , ('get_node_sw',1,'/management/domain','/api/console/management/domain/software/list')
    , ('get_event_log_agent_install_pkg_list',1,'/eventlog','/api/console/ems/eventlog/agentInstallPkg/list')
    , ('get_domain_information',1,'/default','/api/console/management/domain/domainInformation')
    , ('get_event_log_agent_event_list',1,'/eventlog','/api/console/ems/eventlog/agentEvent/list')
    , ('get_event_log_fw_list',1,'/eventlog','/api/console/ems/eventlog')
    , ('get_privilege_profile_list',1,'/config/admin','/api/console/ems/role/profile/list')
    , ('get_agent_version',1,'/management/domain','/api/console/ems/agent/info')
    , ('add_report_schedule',1,'/report','/api/console/ems/report/schd/create')
    , ('add_license',1,'/command/config_general','/api/console/v1/config/license/add')
    , ('get_task_schedule_list',1,'/response/domain','/api/console/ems/task/schedule/list')
    , ('get_event_log_common_obj_id',1,'/eventlog','/api/console/ems/eventlog')
    , ('add_task_schedule_restart_agent',1,'/command/agent_command','/api/console/ems/command/schedule')
    , ('get_agent_status_ac_summary',1,'/management/domain','/api/console/v1/group/agent/status/ac/summary')
    , ('get_event_log_common_obj_id_list',1,'/eventlog','/api/console/ems/eventlog')
    , ('set_admin_by_self',1,'/default','/api/console/ems/admin/selfModify')
    , ('set_config_server_nat',1,'/command/config_general','/api/console/config/domain/server/natModify')
    , ('get_net_cert_mgmt_list',1,'/config/general','/api/console/config/certificate/get')
    , ('get_event_log_backup_list',1,'/eventlog','/api/console/ems/eventlog/backup/list')
    , ('add_group_node',1,'/management/domain','/api/console/management/group/addGroupNode')
    , ('get_ac_exec_summary_list',1,'/management/ac','/api/console/v1/management/ac/exec/summary/list')
    , ('get_event_log_hips_agent_list',1,'/eventlog','/api/console/ems/eventlog')
    , ('get_beginning_config_list',1,'/default','/api/console/config/beginning/system/list')
    , ('get_query_report_item_list',1,'/report','/api/console/ems/query/report/get')
    , ('get_query_report',1,'/report','/api/console/ems/query/report/get')
    , ('get_admin_privilege_profile',1,'/default','/api/console/ems/role/profile/get')
    , ('set_product_install_pkg',1,'/command/deploy_product','/api/console/ems/deployment/register/agent/fileserver||/api/console/ems/deployment/register/agent')
    , ('get_aws_account',1,'/config/general','/api/console/v1/config/cloud/aws/account/detail')
    , ('get_dashboard_issue_agent_summary',1,'/dashboard','/api/console/ems/dashboard/issueAgent')
    , ('add_task_realtime_modify_user_info',1,'/management/domain','/api/console/ems/command/realtime')
    , ('get_node_hw_os',1,'/management/domain','/api/console/management/node/osInformation')
    , ('get_group_agent_summary',1,'/management/domain','/api/console/management/group/registerAgentSummary')
    , ('add_task_realtime_generate_server_report',1,'/command/serverreport','/api/console/ems/command/realtime')
    , ('get_azure_account',1,'/config/general','/api/console/v1/config/cloud/azure/account/detail')
    , ('get_widget',1,'/dashboard','/api/console/dashboard/widget/get')
    , ('get_notification_center_list',1,'/default','/api/console/ems/notificationcenter/list')
    , ('get_notification_list',1,'/default','/api/console/v1/notification/list')
    , ('get_agent_status_ac_info',1,'/management/domain','/api/console/v1/group/agent/status/ac/detail')
    , ('get_update_country',1,'/config/general','/api/console/v1/config/update/detail')
    , ('get_service_port_list',1,'/config/general','/api/console/config/domain/port/list')
    , ('get_dashboard_agent_status_history_count',1,'/dashboard','/api/console/dashboard/default')
    , ('get_agent_timeline',1,'/management/domain','/api/console/management/agent/timeline')
    , ('get_event_log_ac_access_list',1,'/eventlog','/api/console/ems/eventlog')
    , ('get_dashboard_domain_list',1,'/default','/api/console/ems/dashboard/domain/serviceList')
    , ('get_dashboard_domain_list',2,'/default','/api/console/ems/dashboard/domain/serviceList')
    , ('get_node_user_info',1,'/management/domain','/api/console/ems/task/user')
    , ('get_mgmt_hips_signature_basic_list',1,'/management/signature','/api/console/v1/management/hips/signature/basic/list')
    , ('get_report_latest_list',1,'/report','/api/console/ems/report/latest/list')
    , ('add_policy_task',1,'/policy','/api/console/ems/policy/task/add')
    , ('set_correlation_rule',1,'/correlation','/api/console/ems/correlation/set')
    , ('get_base_report_layout',1,'/report','/api/console/ems/base/report/layout/get')
    , ('get_product_pkg_list',1,'/command/deploy_product','/api/console/deploy/product_package/list')
    , ('get_v3_infection_count',1,'/management/domain','/api/console/management/domain/malwareInfection')
    , ('get_policy_apply_list',1,'/policy','/api/console/ems/policy/agent/applyList')
    , ('get_alert_template_list',1,'/default','/api/console/ems/template/alert/get')
    , ('add_agent_policy',1,'/command/policy','/api/console/ems/policy/add')
    , ('get_event_log_v3_alert_list',1,'/eventlog','/api/console/ems/eventlog/v3Alert/list')
    , ('add_task_realtime_remove_agent',1,'/command/uninstall_agent','/api/console/ems/command/realtime')
    , ('add_task_realtime_deploy',1,'/command/deploy_product','/api/console/ems/command/realtime')
    , ('get_correlation_task',1,'/correlation','/api/console/ems/correlation/task')
    , ('set_custom_privilege_profile',1,'/command/config_admin','/api/console/ems/role/profile/modify')
    , ('get_event_log_v3_is_list',1,'/eventlog','/api/console/ems/eventlog/v3Is/list')
    , ('add_v3_linux_policy',1,'/command/policy','/api/console/ems/policy/add')
    , ('get_v3_linux_policy_detail',1,'/policy/policy_V3L_R','/api/console/ems/policy/detail')
    , ('get_ips_signature_update_server_type',1,'/default','/api/console/hips/mgmt')
    , ('get_agent_status_ips_signature_basic_list',1,'/management/domain','/api/console/v1/group/agent/status/ips/signature/basic/list')
    , ('get_update_server_type',1,'/default','/api/console/config/update/server/type')
    , ('get_azure_account_list',1,'/config/general','/api/console/v1/config/cloud/azure/account/list')
    , ('get_agent_policy_apply_count_list',1,'/management/domain','/api/console/ems/policy/applyCountList')
    , ('get_group_top',1,'/default','/api/console/management/group/top')
    , ('get_event_log_pkg_sync_list',1,'/eventlog','/api/console/ems/eventlog/pkgSync/list')
    , ('get_view_layout',1,'/default','/api/console/view/getlayout')
    , ('get_ac_agent_policy_detail',1,'/policy/policy_AC_A_R','/api/console/ems/policy/detail')
    , ('get_event_log_ac_agent_list',1,'/eventlog','/api/console/ems/eventlog')
    , ('remove_task_schedule',1,'/response/domain','/api/console/ems/task/schedule/remove')
    , ('get_issue_agent_status',1,'/dashboard','/api/console/ems/dashboard/issueAgent')
    , ('add_task_realtime_check_agent_status',1,'/command/agent_command','/api/console/ems/command/checkagent')
    , ('get_task_schedule_detail',1,'/management/domain/schedule','/api/console/ems/task/schedule/detail')
    , ('get_report_clean',1,'/config/general','/api/console/config/report/clean/get')
    , ('set_group_agent_policy_apply',1,'/command/policy','/api/console/ems/policy/group/apply')
    , ('get_report_status',1,'/report','/api/console/ems/report')
    , ('get_group_list',1,'/default','/api/console/management/group/list')
    , ('get_correlation_rule_list',1,'/default','/api/console/ems/correlation/list')
    , ('get_beginning_progress_status',1,'/default','/api/console/config/beginning/progress/status')
    , ('get_node_hw',1,'/management/domain','/api/console/management/domain/hardware/list')
    , ('get_correlation_rule_item',1,'/correlation','/api/console/ems/correlation/item')
    , ('get_agent_sw_event_log',1,'/management/domain','/api/console/management/domain/software/history')
    , ('get_group_v3_summary',1,'/management/domain','/api/console/management/group/v3')
    , ('get_admin_list',1,'/default','/api/console/ems/admin/list')
    , ('get_event_log_audit_list',1,'/eventlog','/api/console/ems/eventlog/audit/list')
    , ('get_hips_mgmt_policy_detail',1,'/policy/policy_HIPS_IPS_R','/api/console/ems/policy/detail')
    , ('get_correlation_condition_list',1,'/default','/api/console/ems/correlation/condition')
    , ('get_artifacts_task_list',1,'/response/report','/api/console/ems/edr/artifacts/tasks')
    , ('get_group_update_server_list',1,'/management/domain','/api/console/management/group/groupUpdateServerList')
    , ('get_download_address',1,'/default','/api/console/ems/download/address')
    , ('get_ac_agent_policy_factory',1,'/policy','/api/console/ems/policy/get/factory')
    , ('get_group_node_array',1,'/default','/api/console/management/group/node/array')
    , ('get_system_alert_correlation_rule_item',1,'/default','/api/console/ems/correlation/get')
    , ('get_license_list',1,'/config/general','/api/console/v1/config/license/list')
    , ('get_product_policy_list',1,'/response/domain','/api/console/deploy/product/policy')
    , ('get_otp_support_environment',1,'/default','/api/console/config/mailserver/use_otp')
    , ('get_task_list',1,'/response/domain','/api/console/ems/task/list')
    , ('get_base_report_list',1,'/default','/api/console/ems/base/report/list')
    , ('remove_agent_policy',1,'/command/policy','/api/console/ems/policy/remove')
    , ('set_admin',1,'/command/config_admin','/api/console/ems/admin/modify')
    , ('get_task_target_agent_status_list',1,'/response/domain','/api/console/ems/task/target/agentList')
    , ('add_task_schedule_patch_agent',1,'/command/update_product','/api/console/ems/command/schedule')
    , ('get_task_favorite_list',1,'/default','/api/console/ems/task/favorite/list')
    , ('get_event_log_service_list',1,'/eventlog','/api/console/ems/eventlog/service/list')
    , ('remove_license',1,'/command/config_general','/api/console/v1/config/license/remove')
    , ('get_dashboard_agent_status_history',1,'/dashboard','/api/console/dashboard/default')
    , ('get_hips_mgmt_policy_factory',1,'/policy','/api/console/ems/policy/get/factory')
    , ('get_ips_recommand_config',1,'/config/general','/api/console/v1/config/ips-recommend/detail')
    , ('get_v3_net_policy_detail',1,'/policy/policy_V3W_R','/api/console/ems/policy/detail')
    , ('get_agent_status_ips_summary',1,'/management/domain','/api/console/v1/group/agent/status/ips/summary')
    , ('get_event_log_v3_ss_list',1,'/eventlog','/api/console/ems/eventlog/v3Ss/list')
    , ('add_task_schedule_v3_product_update',1,'/command/update_product','/api/console/ems/command/schedule')
    , ('add_task_realtime_restart_agent',1,'/command/agent_command','/api/console/ems/command/realtime')
    , ('get_update_hips_signature',1,'/config/general','/api/console/v1/config/update/detail')
    , ('modify_azure_account',1,'/config/general','/api/console/v1/config/cloud/azure/account/modify')
    , ('set_mail_server',1,'/command/config_general','/api/console/config/mailserver/modify')
    , ('upload_update_product_ems_engine',1,'/command/update_engine','/api/console/config/update/ems/upload')
    , ('set_each_v3_linux_policy_apply',1,'/command/policy','/api/console/ems/policy/each/apply')
    , ('test_aws_account',1,'/config/general','/api/console/v1/config/cloud/aws/account/test')
    , ('get_product_group_list',1,'/default','/api/console/deploy/product_group/list')
    , ('get_agent_status_ac_list',1,'/management/domain','/api/console/v1/group/agent/status/ac/list')
    , ('add_syslog',1,'/command/config_general','/api/console/v1/syslog/add||/api/console/v1/syslog/modify')
    , ('remove_admin',1,'/command/config_admin','/api/console/ems/admin/remove')
    , ('get_event_log_v3_sup_list',1,'/eventlog','/api/console/ems/eventlog/v3Sup/list')
    , ('get_product_version',1,'/default','/api/console/ems/intro/productVersion')
    , ('get_syslog_server_list',1,'/config/general','/api/console/v1/syslog/list')
    , ('get_agent_hw_event_log',1,'/management/domain','/api/console/management/domain/hardware/history')
    , ('get_event_log_hips_detect_list',1,'/eventlog','/api/console/ems/eventlog')
    , ('get_policy_list',1,'/policy','/api/console/ems/policy/list')
    , ('remove_widget',1,'/dashboard','/api/console/dashboard/widget/remove')
    , ('get_security_product_list',1,'/default','/api/console/ems/security/product/list')
    , ('get_agent_ac_status_link_list',1,'/management/domain','/api/console/ems/agent/status/link')
    , ('set_widget_item_layout',1,'/dashboard','/api/console/dashboard/item/layout/set')
    , ('get_dist_range_config_list',1,'/config/general','/api/console/config/domain/list')
    , ('get_v3_malware_count',1,'/management/domain','/api/console/management/domain/v3Install')
    , ('get_group_order_setting',1,'/default','/api/console/management/group/getGroupOrderSetting')
    , ('get_mgmt_hips_signature_custom_list',1,'/management/signature','/api/console/v1/management/hips/signature/custom/list')
    , ('set_v3_net_policy',1,'/command/policy','/api/console/ems/policy/set')
    , ('get_timeline',1,'/management/domain','/cnapp/timeline')
    , ('get_agent_aws_system',1,'/management/domain','/api/console/v1/group/agent/cloud/aws')
    , ('get_group_node_list',1,'/default','/api/console/management/group/getGroupNode')
    , ('set_document_file',1,'/command/config_general','/api/console/upload/document/file')
    , ('get_group_policy_summary',1,'/management/domain','/api/console/management/group/policy')
    , ('get_agent_policy_factory',1,'/policy','/api/console/ems/policy/get/factory')
    , ('remove_v3_pkg',1,'/command/deploy_product','/api/console/management/v3/remove_execute||/api/console/management/v3/remove')
    , ('add_task_realtime_delete_agent',1,'/command/uninstall_agent','/api/console/ems/command/deleteagent')
    , ('finalize_upload',1,'/default','/api/console/upload/resumable/finalize')
    , ('get_policy_group_apply_list',1,'/management/domain','/api/console/ems/policy/group/applyList')
    , ('save_update_country',1,'/config/general','/api/console/v1/config/update/country/save')
    , ('add_hips_mgmt_policy',1,'/command/policy','/api/console/ems/policy/add')
    , ('get_policy_apply_count_list',1,'/policy','/api/console/ems/policy/applyCountList')
    , ('get_group_summary_hips_status',1,'/management/domain','/api/console/management/group/groupAgentSummary')
    , ('get_correlation_rule',1,'/correlation','/api/console/ems/correlation/get')
    , ('get_db_mgmt_list',1,'/config/general','/api/console/config/db/mgmt/list')
    , ('get_group_subgroup_hips_status_summary_list',1,'/management/domain','/api/console/v1/group/subgroup/hips/status/summary/list')
    , ('remove_report_schedule',1,'/report','/api/console/ems/report/schd/remove')
    , ('get_v3_net_policy_factory',1,'/policy','/api/console/ems/policy/get/factory')
    , ('get_deploy_list',1,'/config/general','/api/console/deploy/getList')
    , ('get_deploy_manifest_list',1,'/config/general','/api/console/deploy/manifest/list')
    , ('get_agent_install_page',1,'/config/general','/api/console/ems/deployment/agent/page')
    , ('add_task_realtime_remove_product',1,'/command/uninstall_product','/api/console/ems/command/realtime')
    , ('verify_mgmt_hips_signature_custom_pattern',1,'/management/signature','/api/console/v1/management/hips/signature/custom/pattern/verify')
    , ('get_hips_signature_common_agent_list',1,'/management/signature','/api/console/v1/management/hips/signature/common/agent/list')
    , ('get_hips_signature_release_last',1,'/management/signature','/api/console/v1/management/hips/signature/release/last')
    , ('get_hips_signature_release_list',1,'/management/signature','/api/console/v1/management/hips/signature/release/list')
    , ('get_hips_ip_exception_list',1,'/default','/api/console/ems/policy/hips/ip-exception-list')
    , ('get_quarantine_info_list',1,'/response/file','/api/console/v1/quarantine/list')
    , ('get_event_log_v3_quar_list',1,'/eventlog','/api/console/ems/eventlog')
    , ('get_mgmt_ac_im_watchlist_list',1,'/management/ac','/api/console/v1/management/ac/im/watchlist/list')
    , ('get_mgmt_ac_im_watchlist_detail',1,'/management/ac','/api/console/v1/management/ac/im/watchlist/detail')
    , ('get_mgmt_ac_im_watchlist_rule',1,'/management/ac','/api/console/v1/management/ac/im/watchlist/rule/list')
    , ('get_mgmt_ac_im_watchlist_agent_list',1,'/management/ac','/api/console/v1/management/ac/im/watchlist/agent/list')
    , ('get_mgmt_ac_im_detect_list',1,'/management/ac','/api/console/ems/eventlog')
    , ('get_mgmt_ac_im_rule_list',1,'/management/ac','/api/console/v1/management/ac/im/rule/list')
    , ('get_task_ac_im_ondemand_list',1,'/response/on_demand','/api/console/v1/ac/im/ondemand/list')
    , ('get_event_log_ac_im_detect_list',1,'/eventlog','/api/console/ems/eventlog')
    , ('get_agent_status_ac_im_info',1,'/management/domain','/api/console/v1/group/agent/status/ac/im/detail')
    , ('get_agent_status_ac_im_watchlist_list',1,'/management/domain','/api/console/v1/group/agent/status/ac/im/watchlist/list')
    , ('get_agent_status_ac_im_rule_list',1,'/management/domain','/api/console/v1/group/agent/status/ac/im/rule/list')
    , ('add_task_schedule_im_rulecheck',1,'/command/im_rulecheck','/api/console/ems/command/schedule')
    , ('add_im_mgmt_policy',1,'/command/policy','/api/console/ems/policy/add')
    , ('get_im_mgmt_policy_detail',1,'/policy/policy_AC_IM_R','/api/console/ems/policy/detail')
    , ('get_im_mgmt_policy_factory',1,'/policy','/api/console/ems/policy/get/factory')
    , ('set_im_mgmt_policy',1,'/command/policy','/api/console/ems/policy/set')
    , ('get_policy_im_watchlist_list',1,'/policy','/api/console/v1/policy/im/watchlist/list')
    , ('get_mgmt_watchlist_tag',1,'/management/ac','/api/console/v1/management/ac/im/watchlist/tag/list')
    , ('get_upload_file_status',1,'/config/general','/api/console/upload/status')
    , ('get_product_patch_info',1,'/config/general','/api/console/ems/dashboard/domain/serviceList||/api/console/config/product/patch/info')
    , ('update_product_patch_info',1,'/config/general','/api/console/product/patch/info/update')
    , ('modify_upload_file_status_finish',1,'/config/general','/api/console/upload/status/modify/finish')
    , ('get_product_patch_base',1,'/config/general','/api/console/config/product/base')
    , ('get_event_log_v3_alert_list_custom',1,'/eventlog','/api/console/ems/eventlog/v3Alert/list')
    , ('get_event_log_hips_detect_list_custom',1,'/eventlog','/api/console/ems/eventlog')
    , ('get_event_log_fw_list_custom',1,'/eventlog','/api/console/ems/eventlog')
    , ('get_event_log_server_alert_list',1,'/eventlog','/api/console/ems/eventlog/serverAlert/list')
    , ('get_event_log_limit',1,'/default','/api/console/v1/config/detail')
    , ('get_search_type',1,'/default','/api/console/v1/config/search/type')
    , ('get_search_language',1,'/default','/api/console/v1/config/search/language')
    , ('modify_search_language',1,'/config/general','/api/console/v1/config/search/language/modify')
    , ('get_ips_signature_config',1,'/config/general','/api/console/v1/config/ips-signature/detail')
    , ('get_hips_fw_block_ip_rule_list',1,'/management/signature','/api/console/v1/group/agent/status/ips/block-ip-rule/list||/api/console/v1/management/hips/fw/block-ip-rule/list')
    , ('get_hips_fw_block_ip_rule_count',1,'/management/signature','/api/console/v1/management/hips/fw/block-ip-rule/count')
    , ('add_manager_group',1,'/config/general','/api/console/v1/manager-group/add')
    , ('modify_manager_group',1,'/config/general','/api/console/v1/manager-group/modify')
    , ('remove_manager_group_list',1,'/config/general','/api/console/v1/manager-group/remove/list')
    , ('get_manager_group',1,'/default','/api/console/v1/manager-group/detail')
    , ('get_manager_group_list',1,'/default','/api/console/v1/manager-group/list')
    , ('get_manager_group_policy_list',1,'/default','/api/console/v1/manager-group/policy/list')
    , ('get_manager_group_admin_list',1,'/default','/api/console/v1/manager-group/admin/list')
    , ('get_license_list',2,'/config/license','/api/console/v1/config/license/list')
    , ('get_license_count_list',1,'/config/license','/api/console/v1/config/license/count/list')
    , ('add_license',2,'/config/license','/api/console/v1/config/license/add')
    , ('remove_license',2,'/config/license','/api/console/v1/config/license/remove')
    , ('get_group_license_list',1,'/config/license','/api/console/v1/config/group/license-id/list')
    , ('get_license_update_info_list',1,'/config/license','/api/console/v1/config/license/update/info/list')
    , ('get_license_oafq_info',1,'/config/license','/api/console/v1/config/license/oafq/info')
    , ('update_license_info',1,'/config/license','/api/console/config/license/update/info')
    , ('apply_license',1,'/config/license','/api/console/v1/config/license/apply')
    , ('get_license_usage_timeline',1,'/config/license','/api/console/v1/config/license/usage/timeline/product')
    , ('get_license_avg_usage',1,'/config/license','/api/console/v1/config/license/avg-usage/product')
    , ('get_asset_info_detail',1,'/config/general','/api/console/v1/config/asset-info/detail')
    , ('get_private_ip_range',1,'/default','/api/console/config/domain/server/private-ip-range')
    , ('add_task_realtime_hips_process_on_off',1,'/command/hips_on_off','/api/console/ems/command/realtime')
    , ('add_task_realtime_ac_process_on_off',1,'/command/ac_on_off','/api/console/ems/command/realtime')
    , ('add_task_realtime_ips_ssl_inspection_on_off',1,'/command/hips_ssl_inspection','/api/console/ems/command/realtime')
    , ('get_ssl_inspection_target_list',1,'/management/domain','/api/console/v1/group/agent/hips/status/ssl-inspection')
    , ('get_ssl_engine_info',1,'/management/domain','/api/console/v1/group/agent/hips/status/ssl-engine')
    , ('get_event_log_cnapp_list',1,'/security','/api/console/ems/eventlog')
    , ('get_event_log_cnapp_malware_scan_list',1,'/security','/api/console/ems/eventlog')
    , ('get_event_log_cnapp_vulnerability_scan_list',1,'/security','/api/console/ems/eventlog')
    , ('get_update_cnapp',1,'/config/general','/api/console/v1/config/update/detail')
    , ('get_alibaba_account_list',1,'/config/general','/api/console/v1/config/cloud/alibaba/account/list')
    , ('get_alibaba_account',1,'/config/general','/api/console/v1/config/cloud/alibaba/account/detail')
    , ('modify_alibaba_account',1,'/config/general','/api/console/v1/config/cloud/alibaba/account/modify')
    , ('test_alibaba_account',1,'/config/general','/api/console/v1/config/cloud/alibaba/account/test')
    , ('get_amc_mgmt_policy_detail',1,'/policy/policy_AMC_R','/api/console/ems/policy/detail')
    , ('get_amc_mgmt_policy_factory',1,'/policy/policy_AMC_R','/api/console/ems/policy/get/factory')
    , ('get_yaml_serverless',1,'/config/general','/api/console/config/serverless/yaml')
    , ('long_term_inactivity',1,'/config/admin','/api/console/ems/admin/longTerm/get')
    , ('long_term_inactivity_modify',1,'/config/admin','/api/console/ems/admin/longTerm/modify')
    , ('unlock_feature',1,'/config/admin','/api/console/ems/admin/longTerm/unlock')
    , ('get_k8s_clusters',1,'/security','/api/console/v1/account/k8s/clusters||/cnapp/account/k8s/clusters')
    , ('get_atip_bundle_config',1,'/security','/api/console/v1/atip/bundle/config')
    , ('get_atip_bundle_config_option',1,'/config/general','/api/console/v1/atip/bundle/config')
    , ('set_atip_bundle_config',1,'/command/config_general','/api/console/v1/atip/bundle/config/set')
    , ('get_atip_bundle_user_overall_quotas',1,'/security','/api/console/v1/atip/bundle/user/overall-quotas')
    , ('get_atip_bundle_cve_info',1,'/security','/api/console/v1/atip/bundle/cve/search')
    , ('get_command_disclosure_config',1,'/default','/api/console/v1/config/command/disclosure')
    , ('set_command_disclosure_config',1,'/command/config_general','/api/console/v1/config/command/disclosure/set')
    , ('get_agent_status_agent_info_detail',1,'/management/domain','/api/console/ems/group/agent/info/detail')
    , ('add_task_realtime_v3_collect_fel',1,'/command/v3_collect_fel','/api/console/ems/command/realtime')
    , ('add_task_schedule_v3_collect_fel',1,'/command/v3_collect_fel','/api/console/ems/command/schedule')
    , ('add_task_realtime_am_service_activate',1,'/command/am_on_off','/api/console/ems/command/realtime')
    , ('get_helm_package_tar_url',1,'/default','/api/console/config/daemonset/helm-package-url||/api/console/config/openshift/helm-package-url')
    , ('add_task_realtime_am_file_io_analyze_sync',1,'/command/am_file_io_analyze_sync','/api/console/ems/command/realtime')
    , ('add_task_realtime_am_file_io_analyze_reset',1,'/command/am_file_io_analyze_reset','/api/console/ems/command/realtime')
    , ('get_am_file_io_info',1,'/management/domain','/api/console/v1/management/am/file/io/info')
    , ('get_runtime_image_url',1,'/default','/api/console/config/runtime/image_url')
    , ('get_group_summary_am_status',1,'/default','/api/console/management/group/antimalware-summary')
    , ('get_yaml_openshift',1,'/config/general','/api/console/config/openshift/yaml')
ON CONFLICT(action_name, revision)
    DO UPDATE SET feature_name = EXCLUDED.feature_name, uri = EXCLUDED.uri;

------------------------------------------------------------------------
SELECT '## tb_open_source';
DELETE FROM tb_open_source;
------------------------------------------------------------------------
INSERT INTO tb_open_source ("name",home_page,license_type) VALUES 
('tinyxml 2.6.1', 'https://github.com/leethomason/tinyxml2', 'ZLIB LICENSE')
, ('native-lib-loader 2.3.4', 'https://github.com/scijava/native-lib-loader', 'BSD')
, ('jquery 1.10.2', 'https://github.com/jquery/jquery', 'MIT')
, ('javax.websocket-client-api 1.0', 'http://websocket-spec.java.net', 'CDDL1.1GPL2 WITH CLASSPATH EXCEPTION')
, ('poi 5.2.3', 'https://poi.apache.org/', 'APACHE2.0')
, ('jackson-dataformat-csv 2.9.9', 'https://github.com/FasterXML/jackson-dataformats-text', 'APACHE2.0')
, ('ini4j 0.5.4', 'http://www.ini4j.org', 'APACHE2.0')
, ('phantomjs 2.1.1', 'http://phantomjs.org/', 'BSD')
, ('angularjs-crypto 1.4.0', 'https://github.com/pussinboots/angularjs-crypto', 'MIT')
, ('sevenzipjbinding 9.20-2.00beta', 'http://www.7-zip.org/, http://p7zip.sourceforge.net/', 'LGPL2.1UNRAR RESTRICTION')
, ('spring-batch-infrastructure 4.2.4.RELEASE', 'https://spring.io/projects/spring-batch', 'APACHE2.0')
, ('javax.activation 1.1.1', 'http://ftp.gnu.org/gnu/classpathx/activation-1.1.1.tar.gz', 'CDDL1.0')
, ('json-path 2.2.0', 'https://github.com/jayway/JsonPath', 'APACHE2.0')
, ('junit4 4.12', 'https://github.com/junit-team/junit4', 'EPL 1.0')
, ('commons-net 3.9.0', 'https://github.com/apache/commons-net', 'APACHE2.0')
, ('httpclient 4.5.14', 'http://hc.apache.org/httpcomponents-client', 'APACHE2.0')
, ('spring-data-redis 2.1.10.RELEASE', 'http://projects.spring.io/spring-data/', 'APACHE2.0')
, ('cryptojs 3.1.2', 'https://github.com/sytelus/cryptojs', 'MIT')
, ('openssl 1.1.1t', 'https://www.openssl.org', 'OPENSSL LICENSE')
, ('angular-toastr 1.5.0', 'https://github.com/Foxandxss/angular-toastr', 'MIT')
, ('ng-stomp 0.4.0', 'https://github.com/beevelop/ng-stomp', 'MIT')
, ('spring-kafka 2.2.9', 'https://github.com/spring-projects/spring-kafka', 'APACHE2.0')
, ('log4j-jul 2.20.0', 'https://logging.apache.org/', 'APACHE2.0')
, ('commons-exec 1.3', 'http://commons.apache.org/proper/commons-exec/', 'APACHE2.0')
, ('curl 7.71.1', 'https://curl.haxx.se/docs/copyright.html', 'MIT')
, ('kafka-clients 2.0.1', 'http://kafka.apache.org', 'APACHE2.0')
, ('angular-ui-tree 2.22.6', 'https://github.com/angular-ui-tree/angular-ui-tree', 'MIT')
, ('checklist-model 0.8.0', 'https://github.com/vitalets/checklist-model', 'MIT')
, ('commons-compress 1.23.0', 'https://commons.apache.org/proper/commons-compress/', 'APACHE2.0')
, ('tika-core 2.8.0', 'http://tika.apache.org/', 'APACHE2.0')
, ('jquery ui 1.12.1', 'http://jqueryui.com', 'MIT')
, ('jansson 2.14', 'http://www.digip.org/jansson/', 'MIT')
, ('commons-pool2 2.11.1', 'https://github.com/apache/commons-pool', 'APACHE2.0')
, ('javax.servlet.jsp-api 2.3.3', 'https://javaee.github.io/servlet-spec/', 'CDDL1.0GPL2 WITH CLASSPATTH EXCEPTION')
, ('lettuce-core 5.1.8.RELEASE', 'http://github.com/lettuce-io/lettuce-core', 'APACHE2.0')
, ('jettison 1.5.4', 'https://github.com/jettison-json/jettison', 'APACHE2.0')
, ('angular-translate 2.18.1', 'https://github.com/angular-translate/angular-translate', 'MIT')
, ('moment 2.10.6', 'https://momentjs.com', 'MIT')
, ('angular-messages 1.6.10', 'https://angularjs.org/', 'MIT')
, ('jaxb-impl 2.3.1', 'https://eclipse-ee4j.github.io/jaxb-ri/', 'CDDL1.1GPL2 WITH CLASSPATTH EXCEPTION')
, ('log4j-core 2.20.0', 'https://github.com/apache/log4j', 'APACHE2.0')
, ('angular ui-uploader 1.1.3', 'https://github.com/angular-ui/ui-uploader', 'MIT')
, ('angular-route 1.3.13', 'https://angularjs.org/', 'MIT')
, ('bcprov-jdk15on 1.70', 'https://www.bouncycastle.org/java.html', 'MIT')
, ('highlight.js 8.9.1', 'https://highlightjs.org/', 'BSD')
, ('cabparser 2.15', 'https://github.com/dorkbox/CabParser', 'APACHE2.0')
, ('commons-io 2.13.0', 'https://github.com/apache/commons-io', 'APACHE2.0')
, ('aopalliance 1.0', 'http://aopalliance.sourceforge.net', 'PUBLIC DOMAIN')
, ('mongo-java-driver 3.8.2', 'https://github.com/mongodb/mongo-java-driver', 'APACHE2.0')
, ('jquery.filedownload 1.4.5', 'http://www.johnculviner.com', 'MIT')
, ('iniparser 4.0', 'http://ndevilla.free.fr/iniparser/, http://github.com/ndevilla/iniparser', 'MIT')
, ('commons-fileupload 1.5', 'http://commons.apache.org/proper/commons-fileupload/', 'APACHE2.0')
, ('commons-email 1.5', 'https://github.com/apache/commons-email', 'APACHE2.0')
, ('commons-dbcp2 2.9.0', 'https://github.com/apache/commons-dbcp', 'APACHE2.0')
, ('libyaml 0.1.7', 'http://pyyaml.org/wiki/LibYAML', 'MIT')
, ('javax.interceptor-api 1.2.2', 'https://github.com/jakartaee/interceptors', 'CDDL1.1GPL2 WITH CLASSPATTH EXCEPTION')
, ('httpasyncclient 4.1.4', 'https://hc.apache.org/httpcomponents-asyncclient-4.1.x/index.html', 'APACHE2.0')
, ('nimbus-jose-jwt 5.1', 'https://connect2id.com/products/nimbus-jose-jwt', 'APACHE2.0')
, ('gson 2.10.1', 'https://github.com/google/gson', 'APACHE2.0')
, ('pgjdbc 42.6.0', 'https://github.com/pgjdbc/pgjdbc', 'BSD')
, ('angular-breadcrumb 0.5.0', 'https://github.com/ncuillery/angular-breadcrumb', 'MIT')
, ('jackson-databind 2.15.2', 'http://github.com/FasterXML/jackson', 'APACHE2.0')
, ('bcpkix-jdk15on 1.70', 'https://www.bouncycastle.org/java.html', 'MIT')
, ('postgresql 15.5', 'https://www.postgresql.org/', 'POSTGRESQL LICENSE')
, ('spring-boot 2.1.9.RELEASE', 'https://github.com/spring-projects/spring-boot', 'APACHE2.0')
, ('aspectjweaver 1.9.4', 'http://www.eclipse.org/aspectj/', 'EPL 1.0')
, ('angular-highlightjs 0.3.2', 'http://highlightjs.org/', 'MIT')
, ('angular-highlightjs 0.3.3', 'http://highlightjs.org/', 'MIT')
, ('jjwt 0.9.1', 'https://github.com/jwtk/jjwt', 'APACHE2.0')
, ('poi-ooxml 5.2.3', 'https://poi.apache.org/components/', 'APACHE2.0')
, ('boost 1.64.0', 'http://www.boost.org/', 'BSL1.0MIT')
, ('httpmime 4.3.5', 'http://hc.apache.org/httpcomponents-client', 'APACHE2.0')
, ('angular-cookies 1.6.10', 'https://angularjs.org/', 'MIT')
, ('angular-sha 0.3.3', 'https://www.npmjs.com/package/angular-sha', 'MIT')
, ('mongodb 6.0.5', 'https://www.mongodb.com', 'SSPL')
, ('jedis 2.9.3', 'https://github.com/xetorthio/jedis', 'MIT')
, ('ngstorage 0.3.11', 'https://github.com/gsklee/ngStorage', 'MIT')
, ('aws sdk for java 1.12.303', 'https://aws.amazon.com/sdk-for-java', 'APACHE2.0')
, ('spring-boot 2.1.8.RELEASE', 'https://github.com/spring-projects/spring-boot', 'APACHE2.0')
, ('jackson-dataformat-xml 2.15.2', 'https://github.com/FasterXML/jackson-dataformat-xml', 'APACHE2.0')
, ('angular-sockjs 0.1.0', 'https://github.com/bendrucker/angular-sockjs', 'MIT')
, ('mockito-all 1.10.19', 'http://www.mockito.org/', 'MIT')
, ('angular-resource 1.3.13', 'https://angularjs.org/', 'MIT')
, ('jquery ui 1.11.0', 'http://jqueryui.com', 'MIT')
, ('kafka 2.12-2.0.1', 'http://kafka.apache.org', 'APACHE2.0')
, ('ng-flow 2.7.8', 'https://github.com/flowjs/ng-flow', 'MIT')
, ('jaxb2-basics-runtime 0.6.5', 'http://grepcode.com/snapshot/repo1.maven.org/maven2/org.jvnet.jaxb2_commons/jaxb2-basics-runtime/0.6.5', 'BSD')
, ('malarkey 1.3.1', 'https://github.com/yuanqing/malarkey', 'MIT')
, ('angular-ui-router 0.4.3', 'https://github.com/angular-ui/ui-router', 'MIT')
, ('mybatis-spring-boot-starter 2.1.3', 'https://mybatis.org/spring-boot-starter/mybatis-spring-boot-autoconfigure/', 'APACHE2.0')
, ('kafka 2.11-1.0.1_Log4j-2.17.0', 'http://kafka.apache.org', 'APACHE2.0')
, ('lighttpd 1.4.49', 'https://www.lighttpd.net/', 'BSD')
, ('psqlodbc 09.03.0100', 'https://odbc.postgresql.org/', 'LGPL')
, ('quartz 2.3.2', 'https://www.quartz-scheduler.org/', 'APACHE2.0')
, ('curator-recipes 2.11.1', 'https://curator.apache.org/', 'APACHE2.0')
, ('jackson-datatype-jsr310 2.15.2', 'https://github.com/FasterXML/jackson-datatype-jsr310', 'APACHE2.0')
, ('json-path-assert 2.2.0', 'https://github.com/json-path/JsonPath/tree/master/json-path-assert', 'APACHE2.0')
, ('log4j-api 2.20.0', 'https://github.com/apache/log4j', 'APACHE2.0')
, ('pgbouncer 1.18.0', 'https://pgbouncer.github.io/', 'ISC LICENSE')
, ('angular 1.6.10', 'https://angularjs.org/', 'MIT')
, ('commons-lang3 3.12.0', 'https://commons.apache.org/proper/commons-lang/', 'APACHE2.0')
, ('angular-sanitize 1.6.10', 'https://angularjs.org/', 'MIT')
, ('jstl 1.2', 'https://javaee.github.io/jstl-api/', 'CDDL1.0GPL2 WITH CLASSPATTH EXCEPTION')
, ('jquery flot 0.8.3', 'http://www.flotcharts.org', 'MIT')
, ('bzip2 1.0.8', 'https://sourceforge.net/projects/bzip2', 'BSD')
, ('spring-data-mongodb 2.1.10.RELEASE', 'https://spring.io/projects/spring-data-mongodb', 'APACHE2.0')
, ('jssha 2.0.2', 'https://github.com/Caligatio/jsSHA', 'BSD')
, ('pecoff4j 0.0.2.1', 'https://github.com/whitesource/pecoff4j-maven', 'CPL1.0')
, ('jaxb-core 2.3.0', 'https://eclipse-ee4j.github.io/jaxb-ri/', 'CDDL1.1GPL2 WITH CLASSPATH EXCEPTION')
, ('commons-beanutils 1.9.4', 'https://commons.apache.org/proper/commons-beanutils/', 'APACHE2.0')
, ('libnet 1.1.6', 'https://github.com/libnet/libnet', 'BSD')
, ('angular-touch 1.6.10', 'https://angularjs.org/', 'MIT')
, ('lombok 1.18.28', 'https://projectlombok.org/', 'MIT')
, ('librdkafka 1.9.2', 'https://github.com/edenhill/librdkafka', 'BSD')
, ('log4j-jcl 2.20.0', 'https://logging.apache.org/log4j/2.x/', 'APACHE2.0')
, ('log4j-1.2-api 2.20.0', 'https://logging.apache.org/log4j/2.x/', 'APACHE2.0')
, ('sevenzipjbinding-all-platforms 9.20-2.00beta', 'http://www.7-zip.org/, http://p7zip.sourceforge.net/', 'LGPL2.1UNRAR RESTRICTION')
, ('jyaml 1.3', 'http://jyaml.sourceforge.net, https://github.com/yafengli/jyaml', 'BSD')
, ('jsch 0.1.55', 'https://github.com/is/jsch', 'BSD')
, ('javax.websocket-api 1.0', 'http://websocket-spec.java.net', 'CDDL1.1GPL2 WITH CLASSPATH EXCEPTION')
, ('haproxy 1.7.10', 'http://www.haproxy.org/', 'GPL 2.0')
, ('libssh2 1.9.0', 'https://libssh2.org', 'BSD')
, ('jackson-core 2.15.2', 'http://github.com/FasterXML/jackson', 'APACHE2.0')
, ('spring-webmvc 5.1.9.RELEASE', 'https://github.com/spring-projects/spring-framework', 'APACHE2.0')
, ('angular-animate 1.6.10', 'https://angularjs.org/', 'MIT')
, ('azure sdk for java 1.23.0', 'https://github.com/Azure/azure-sdk-for-java', 'MIT')
, ('httpclient-cache 4.3.5', 'http://hc.apache.org/httpcomponents-client', 'APACHE2.0')
, ('curator-framework 2.11.1', 'https://curator.apache.org/', 'APACHE2.0')
, ('x2js 1.2.0', 'https://github.com/cesarbarone/angular-x2js', 'APACHE2.0')
, ('ng-idle 1.3.2', 'https://github.com/HackedByChinese/ng-idle', 'MIT')
, ('jnetpcap 1.4.r1425-1g', 'https//jnetpcap.com/', 'LGPL3.0')
, ('ipaddr.js 1.9.1', 'https://github.com/whitequark/ipaddr.js', 'MIT')
, ('clair 2.0.8', 'https://github.com/quay/clair', 'APACHE2.0')
, ('angular-translate-loader-static-files 2.18.1', 'https://github.com/angular-translate/bower-angular-translate-loader-static-files', 'MIT')
, ('lodash 4.17.11', 'https://lodash.com', 'MIT')
, ('angular treeview 0.1.6', 'https://github.com/eu81273/angular.treeview', 'MIT')
, ('mongo-c-driver 1.20.0', 'http://mongoc.org/', 'APACHE2.0')
, ('jquery 3.2.1', 'https://github.com/jquery/jquery', 'MIT')
, ('bcmail-jdk15on 1.70', 'https://www.bouncycastle.org/java.html', 'MIT')
, ('jsoup 1.15.4', 'https://jsoup.org/', 'MIT')
, ('commons-text 1.10.0', 'https://commons.apache.org/proper/commons-text/', 'APACHE2.0')
, ('jackson-annotations 2.15.2', 'http://github.com/FasterXML/jackson', 'APACHE2.0')
, ('fluent-hc 4.3.5', 'http://hc.apache.org/httpcomponents-client', 'APACHE2.0')
, ('angular 1.5.0', 'https://angularjs.org/', 'MIT')
, ('gridstack.js 0.2.6', 'https://github.com/gridstack/gridstack.js', 'MIT')
, ('angular-aria 1.6.10', 'https://angularjs.org/', 'MIT')
, ('pkts-streams 3.0.3', 'https://www.aboutsip.com/pktsio/', 'MIT')
, ('bootstrap 3.3.7', 'http://getbootstrap.com', 'MIT')
, ('gridstack-angular 0.5.0', 'https://github.com/kdietrich/gridstack-angular', 'MIT')
, ('flow.js 2.13.0', 'https://github.com/flowjs/flow.js', 'MIT')
, ('simple-xml 2.7.1', 'https://github.com/shevek/simple-xml', 'APACHE2.0')
, ('redis 4.0.0', 'https://redis.io/', 'BSD')
, ('requirejs 2.1.17', 'https://requirejs.org', 'MIT, BSD')
, ('requirejs-text 2.0.12', 'https://github.com/requirejs/text', 'MIT, BSD')
, ('rest-client 0.4.1', 'https://github.com/mrtazz/restclient-cpp', 'MIT')
, ('slf4j-api 1.7.28', 'http://www.slf4j.org', 'MIT')
, ('slf4j 1.7.28', 'http://www.slf4j.org', 'MIT')
, ('snappy-java 1.1.7.1', 'https://github.com/xerial/snappy-java', 'APACHE2.0')
, ('sockjs 1.1.1', 'http://sockjs.org', 'MIT')
, ('sparkmd5 3.0.0', 'https://github.com/satazor/js-spark-md5', 'WTFPL LICENSE')
, ('spring-aop 5.1.9', 'https://github.com/spring-projects/spring-framework', 'Apache2.0')
, ('spring-batch-core 4.1.2', 'https://spring.io/projects/spring-batch', 'APACHE2.0')
, ('spring-batch-infrastructure 4.2.4', 'https://spring.io/projects/spring-batch', 'APACHE2.0')
, ('spring-beans 5.1.9', 'https://github.com/spring-projects/spring-framework', 'Apache2.0')
, ('spring-boot-starter-batch 2.1.9', 'https://spring.io/projects/spring-batch', 'APACHE2.0')
, ('spring-boot 2.1.8', 'https://github.com/spring-projects/spring-boot', 'APACHE2.0')
, ('spring-context-support 5.1.9', 'https://github.com/spring-projects/spring-framework', 'Apache2.0')
, ('spring-context 5.1.9', 'https://github.com/spring-projects/spring-framework', 'Apache2.0')
, ('spring-core 5.1.9', 'https://github.com/spring-projects/spring-framework', 'Apache2.0')
, ('spring-data-commons 2.1.10', 'http://projects.spring.io/spring-data/', 'APACHE2.0')
, ('spring-data-keyvalue 2.1.10', 'http://projects.spring.io/spring-data/', 'APACHE2.0')
, ('spring-data-mongodb 2.1.10', 'https://spring.io/projects/spring-data-mongodb', 'APACHE2.0')
, ('spring-data-redis 2.1.10', 'http://projects.spring.io/spring-data/', 'APACHE2.0')
, ('spring-expression 5.1.9', 'https://github.com/spring-projects/spring-framework', 'Apache2.0')
, ('spring-framework 5.1.9', 'https://github.com/spring-projects/spring-framework', 'Apache2.0')
, ('spring-oxm 5.1.9', 'https://github.com/spring-projects/spring-framework', 'Apache2.0')
, ('spring-security-config 5.1.6', 'http://spring.io/spring-security', 'Apache2.0')
, ('spring-security-core 5.1.6', 'http://spring.io/spring-security', 'Apache2.0')
, ('spring-security-oauth2 2.3.8', 'http://docs.spring.io/spring-security/oauth/spring-security-oauth2/', 'APACHE2.0')
, ('spring-security-web 5.1.6', 'http://spring.io/spring-security', 'Apache2.0')
, ('spring-security 5.1.6', 'http://spring.io/spring-security', 'Apache2.0')
, ('spring-test 5.1.9', 'https://github.com/spring-projects/spring-framework', 'Apache2.0')
, ('spring-tx 5.1.9', 'https://github.com/spring-projects/spring-framework', 'Apache2.0')
, ('spring-web 5.1.9', 'https://github.com/spring-projects/spring-framework', 'Apache2.0')
, ('spring-webmvc 5.1.9', 'https://github.com/spring-projects/spring-framework', 'Apache2.0')
, ('spring-websocket 5.1.9', 'https://github.com/spring-projects/spring-framework', 'Apache2.0')
, ('stix 1.2.0.2', 'https://github.com/STIXProject/java-stix', 'BSD-3-CLAUSE')
, ('stomp-websocket 2.3.4', 'https://github.com/jmesnil/stomp-websocket', 'APACHE2.0')
, ('syslog-java-client 1.1.7', 'https://github.com/CloudBees-community/syslog-java-client', 'MIT')
, ('tika-core 2.80', 'http://tika.apache.org/', 'Apache 2.0')
, ('tinyxml2 9.0.0', 'https://github.com/leethomason/tinyxml2', 'ZLIB LICENSE')
, ('tomcat 9.0.24', 'http://tomcat.apache.org/', 'APACHE2.0')
, ('ui-grid 3.1.1', 'https://github.com/angular-ui/ui-grid', 'MIT')
, ('unixodbc 2.3.1', 'http://www.unixodbc.org/, https://sourceforge.net/projects/unixodbc/', 'LGPL 2.1')
, ('wget 1.14', 'https://www.gnu.org/software/wget/', 'GPL3.0')
, ('cytoscape 3.28.1', 'https://js.cytoscape.org', 'MIT License')
, ('grphlib 2.1.13', 'https://github.com/dagrejs/graphlib', 'MIT License')
, ('dagre 0.8.5', 'https://github.com/dagrejs/dagre', 'MIT License')
, ('cytoscape-dagre 2.5.0', 'https://github.com/cytoscape/cytoscape.js-dagre', 'MIT License')
, ('cytoscape-node-html-label 1.1.5', 'https://github.com/kaluginserg/cytoscape-node-html-label', 'MIT License')
, ('cytoscape-popper 4.0.0', 'https://github.com/cytoscape/cytoscape.js-popper', 'MIT License')
, ('floating-ui/core 1.6.0', 'https://floating-ui.com/', 'MIT License')
, ('floating-ui/dom 1.6.3', 'https://floating-ui.com/', 'MIT License')
, ('tea-openapi', 'https://www.alibabacloud.com/', 'Alibaba')
, ('alibabacloud-ecs20140526', 'https://www.alibabacloud.com/', 'Alibaba')
, ('ecs20140526', 'https://www.alibabacloud.com/', 'Alibaba')
;

------------------------------------------------------------------------
select '## tb_predefined_policy_data';
delete from tb_predefined_policy_data;
------------------------------------------------------------------------
INSERT INTO tb_predefined_policy_data (data_type, data)
VALUES ('V3NET90_EXCEPTION_PORT', '80-83,TCP,원격,나가기 허용;443,TCP,원격,나가기 허용;1080,TCP,원격,나가기 허용;8080,TCP,원격,나가기 허용;8088,TCP,원격,나가기 허용;11523,TCP,원격,나가기 허용;2869,UDP,원격,나가기 허용;25,TCP,원격,나가기 허용;1433,TCP,원격,모두 허용;2002,TCP,로컬 / 원격,모두 허용;2186,TCP,로컬 / 원격,모두 허용;2191,TCP/UDP,로컬 / 원격,모두 허용;2195,UDP,원격,나가기 허용;5465,TCP,로컬 / 원격,모두 허용;5645,TCP,원격,모두 허용;6063,TCP,로컬 / 원격,모두 허용;6101,UDP,로컬 / 원격,모두 허용;6178,TCP,로컬,모두 허용;6721,TCP,로컬 / 원격,모두 허용;8080,UDP,원격,모두 허용;8951,TCP,로컬 / 원격,모두 허용;40000,UDP,원격,모두 허용;50000,TCP,원격,모두 허용;53,TCP/UDP,원격,모두 허용;137,UDP,로컬 / 원격,모두 허용;80,TCP,로컬,모두 허용;67,UDP,원격,모두 허용;68,UDP,로컬,모두 허용;546,UDP,원격,모두 허용;547,UDP,로컬,모두 허용;1235,TCP,원격,모두 허용;');

INSERT INTO tb_predefined_policy_data (data_type, data)
VALUES ('V3IS90_NET_BLOCK', '1,ms03-026_dcom_rpc_exploit-1;2,ms04-011_lsass_exploit-1;3,ms04-011_lsass_exploit-2;4,ms04-011_lsass_exploit-3;5,malicious_worm_qaz;6,ftp_pwd_overflow_exploit;7,telnet_livingstone_dos;8,malicious_worm_bagle.p;9,shellcode_win32_script_bindshell;10,malicious_worm_perl_santy-1;11,ms03-026_dcom_rpc_exploit-2;12,ms02-039_sql_server_resolution_overflow;13,malicious_worm_codered;14,malicious_worm_witty;15,malicious_worm_netsky;16,ms03-007_iis_webdav_exploit;17,ms01-059_upnp_overflow;18,ms04-007_workstation_service_exploit-1;19,ms04-007_workstation_service_exploit-2;20,ms04-007_workstation_service_exploit-3;21,ms04-007_workstation_service_exploit-4;22,ms04-031_netdde_service_exploit-1;23,ms04-031_netdde_service_exploit-2;24,nullsoft_shoutcast_format_string_exploit;25,ms05-041_rdp_remote_kernel_dos_exploit;26,ms05-039_pnp_service_exploit-1;27,ms05-039_pnp_service_exploit-2;28,ms05-047_pnp_service_exploit-1;29,ms05-047_pnp_service_exploit-2;30,ms05-047_pnp_service_exploit-3;31,malicious_worm_perl_santy-2;32,malicious_worm_perl_santy-3;33,ms03-029_dcom_rpc_exploit;34,ms06-040_server_service_exploit-1;35,ms06-040_server_service_exploit-2;36,ms06-040_server_service_exploit-3;37,ms06-040_server_service_exploit-4;38,ms06-040_server_service_exploit-5;39,ms06-040_server_service_exploit-6;40,ms06-035_srv.sys_mailslot_dos_exploit;41,ms06-070_workstation_service_exploit-1;42,ms06-070_workstation_service_exploit-2;43,ms08-067_server_service_exploit-1;44,ms08-067_server_service_exploit-2;45,ms08-067_server_service_exploit-3;46,ms08-067_server_service_exploit-4;47,ms08-067_server_service_exploit-5;48,ms08-067_server_service_exploit-6;49,ms05-047_windows_pnp_remote_exploit(CAN-2005-2120);50,ms09-050_smb_negotiate_func_exploit(CVE-2009-3103);51,ms10-061_printer_spooler_exploit-1(CVE-2010-2729);52,ms10-061_printer_spooler_exploit-2(CVE-2010-2729);53,ms12-020_rdp_exploit-1(CVE-2012-0002);54,ms12-020_rdp_exploit-2(CVE-2012-0002);55,Win32/Downloader.Overtls.gen-1(HTTP);56,Win32/Downloader.Overtls.gen-2(HTTP);57,Win32/Downloader.Overtls.gen-3(HTTP);58,Win32/Downloader.Overtls.gen-4(HTTP);59,Win-Trojan/Winsoft.gen(HTTP);60,Win-Trojan/Koreasys.gen(HTTP);61,Win32/CoreFlood.gen-1(HTTP);62,Win32/CoreFlood.gen-2(HTTP);63,Win32/CoreFlood.gen-3(HTTP);64,Win32/CoreFlood.gen-4(HTTP);65,Win32-Trojan/Downloader.1hg.gen-1(HTTP);66,Win32-Trojan/Downloader.1hg.gen-2(HTTP);67,Win32/Downloader.FakeAV.gen(HTTP);68,malware_exploitpack_neosploit-1(HTTP);69,malware_exploitpack_neosploit-2(HTTP);70,malware_exploitpack_neosploit-3(HTTP);71,Win32/OnlineGameHack.80.gen(HTTP);72,ircbot_suspicious_infection;73,malware_gauss_cnc(HTTP);74,Win32/SpyEye.worm.gen(HTTP);75,malware_trojan_palevo-1;76,malware_trojan_palevo-2;77,malware_trojan_palevo-3;78,malware_trojan_palevo-4;79,malware_trojan_palevo-5;80,malware_trojan_palevo-6;81,malware_trojan_palevo-7;82,malware_trojan_palevo-9;83,malware_trojan_palevo-10;84,malware_trojan_palevo-11;85,malware_trojan_palevo-12;86,malware_trojan_palevo-14;87,malware_trojan_palevo-15;88,malware_trojan_palevo-16;89,malware_trojan_palevo-17;90,malware_trojan_palevo-18;91,malware_trojan_palevo-19;92,malware_trojan_palevo-20;93,malware_trojan_palevo-21;94,malware_trojan_palevo-22;95,malware_trojan_palevo-23;96,malware_trojan_palevo-24;97,malware_trojan_palevo-25;98,malware_trojan_palevo-26;99,malware_trojan_palevo-27;100,malware_rat_dynamic_dns-1(UDP);101,malware_rat_dynamic_dns-2(UDP);102,malware_rat_ddos_tool_darkshell(HTTP);103,malware_blackhole_exploit_kit-1(HTTP);104,malware_blackhole_exploit_kit-2(HTTP);105,malware_blackhole_exploit_kit-3(HTTP);106,malware_blackhole_exploit_kit-4(HTTP);107,malware_rat_ddos_tool_connection-1(TCP);108,malware_rat_ddos_tool_connection-2(TCP);109,malware_rat_schwarze_sonne(TCP);110,malware_rootkit_zeroaccess(TCP);111,malware_rat_cybergate_alive(TCP);112,malware_smb_sql_injection_tool(TCP);113,malware_smb_sql_injection_tool(RPC);114,malware_tool_htran(TCP);115,malware_tool_wce(TCP);116,malware_tool_lslsass(TCP);117,malware_zxshell_binary(TCP);118,malware_rat_chinese_keylogger-1(TCP);119,malware_rat_chinese_keylogger-2(TCP);120,malware_rat_chinese_1004(TCP);121,malware_apt_htran_connection_error-1(TCP);122,malware_apt_htran_connection_error-2(TCP);123,malware_rat_zwshell-1(TCP);124,malware_rat_zwshell-2(TCP);125,malware_rat_zwshell-3(TCP);126,malware_hkdoor(TCP);127,malware_rat_zxshell_info-1(TCP);128,malware_rat_zxshell_info-2(TCP);129,malware_rat_gh0st-1(TCP);130,malware_rat_gh0st-3(TCP);131,malware_rat_gh0st-4(TCP);132,malware_rat_gh0st-5(TCP);133,malware_rat_gh0st-6(TCP);134,malware_rat_gh0st-7(TCP);135,malware_rat_gh0st-8(TCP);136,malware_rat_gh0st-9(TCP);137,malware_rat_gh0st-10(TCP);138,malware_rat_gh0st-11(TCP);139,malware_rat_gh0st-12(TCP);140,malware_rat_gh0st-13(TCP);141,malware_rat_gh0st-14(TCP);142,malware_rat_gh0st-15(TCP);143,malware_rat_gh0st-16(TCP);144,malware_rat_gh0st-17(TCP);145,malware_rat_gh0st-18(TCP);146,malware_rat_gh0st-19(TCP);147,malware_rat_gh0st-20(TCP);148,malware_rat_gh0st-21(TCP);149,malware_rat_gh0st-22(TCP);150,malware_rat_gh0st-23(TCP);151,malware_rat_gh0st-24(TCP);152,malware_rat_gh0st-25(TCP);153,malware_rat_gh0st-26(TCP);154,malware_rat_gh0st-27(TCP);155,malware_rat_gh0st-28(TCP);156,malware_rat_gh0st-29(TCP);157,malware_rat_gh0st-30(TCP);158,malware_rat_gh0st-31(TCP);159,malware_rat_gh0st-32(TCP);160,malware_rat_gh0st-33(TCP);161,malware_rat_gh0st-34(TCP);162,malware_rat_gh0st-35(TCP);163,malware_rat_gh0st-36(TCP);164,malware_rat_gh0st-37(TCP);165,malware_rat_gh0st-38(TCP);166,malware_rat_gh0st-39(TCP);167,malware_rat_gh0st-40(TCP);168,malware_rat_gh0st-41(TCP);169,malware_rat_gh0st-42(TCP);170,malware_rat_gh0st-43(TCP);171,malware_rat_gh0st-44(TCP);172,malware_rat_gh0st-45(TCP);173,malware_rat_gh0st-46(TCP);174,malware_rat_gh0st-47(TCP);175,malware_rat_gh0st-48(TCP);176,malware_rat_gh0st-49(TCP);177,smb_c$_share_unicode_access(TCP);178,smb_c$_share_unicode_access(RPC);179,smb_admin$_share_unicode_access(TCP);180,smb_admin$_share_unicode_access(RPC);181,smb_auth_admin_request(TCP);182,smb_auth_admin_request(RPC);183,smb_startup_folder_access(TCP);184,smb_nt_null_session(TCP);185,smb_hidden_file_copy-1(TCP);186,smb_hidden_file_copy-1(RPC);187,smb_atsvc_request-1(TCP);188,smb_atsvc_request-1(RPC);189,smb_addjob_request-1(TCP);190,smb_addjob_request-1(RPC);191,smb_system32_directory-1(TCP);192,smb_system32_directory-1(RPC);193,smb_system32_directory-2(TCP);194,smb_system32_directory-2(RPC);195,smb_command_psexec-1(TCP);196,smb_command_psexec-1(RPC);197,smb_command_psexec-2(TCP);198,smb_command_psexec-2(RPC);199,ms_sql_xp_cmdshell_program_exec-1;200,ms_sql_sp_oacreate_exec-1;201,ms_sql_sp_start_job_program_exec-1;202,ms_sql_sp_password_change-1;203,ms_sql_sp_delete_log-1;204,ms_sql_sp_adduser_user_creation-1;205,ms_sql_sp_adduser_user_creation-2;206,ms_sql_xp_cmdshell_program_exec-2;207,ms_sql_sp_oacreate_exec-2;208,ms_sql_sp_start_job_program_exec-2;209,ms_sql_sp_password_change-2;210,ms_sql_sp_delete_log-2;211,malware_tool_mimi(TCP);212,telnet_command_force_dd;213,telnet_command_force_rm;214,Port Scan;215,Null Scan;216,X-Mas Scan;217,Winnuke;218,Tear Drop;219,Netbios Brute Force;');

------------------------------------------------------------------------
select '## tb_common_policy';
------------------------------------------------------------------------
INSERT INTO tb_common_policy(product_feature_id, policy_format, online_policy_format, offline_policy_format, online_policy_data, offline_policy_data, hash_value, private_policy_data)
VALUES
(
    'AGENT_MGMT'
    , 'JSON'
    , '{ "uninstall_option": { "uninstall_confirm_password": "${AGENT_MGMT_KEY}" }, "exit_option": { "exit_confirm_password": "${AGENT_MGMT_KEY}" }, "patch": { "oes_url": "${ENGINE_UPDATE_OES}", "ses_url": "${ENGINE_UPDATE_SES}", "oes_url_list": ["${ENGINE_UPDATE_OES_LIST}"], "ses_url_list": ["${ENGINE_UPDATE_SES_LIST}"] }, "main_service": { "license": { "main_server_policy": true, "AGENT": ${AGENT_LICENSE_DATA}, "V3NET_9.0": ${V3NET_9.0_LICENSE_DATA}, "AC_CLIENT": ${AC_LICENSE_DATA}, "HIPS_CLIENT": ${HIPS_LICENSE_DATA}, "V3NET_LU": ${V3NET_LU_LICENSE_DATA} }, "license2": { "main_server_policy": true, "AGENT": ${AGENT_LICENSE_DATA_V2}, "V3NET_9.0": ${V3NET_9.0_LICENSE_DATA_V2}, "AC_CLIENT": ${AC_LICENSE_DATA_V2}, "HIPS_CLIENT": ${HIPS_LICENSE_DATA_V2}, "V3NET_LU": ${V3NET_LU_LICENSE_DATA_V2}, "AMC_CLIENT": ${AMC_LICENSE_DATA_V2}}, "main_server_info": { "site_auth_key": "${SITE_AUTH_KEY}", "enable_ipv6": false, "scheme": "https", "ipv4": ${IP4_INFO}, "ipv6": [] }, "extra_mgmt_server_ip": { "is_use": false, "main_server_policy": true, "V3": {  "is_use": false,  "site_auth_key": "${SITE_AUTH_KEY}",  "enable_ipv6": false,  "scheme": "https", "ipv4": {  "ip": null,  "port": null },  "ipv6": {  "ip": null,  "port": null  } }, "AC": {  "is_use": false,  "site_auth_key":  "${SITE_AUTH_KEY}",  "enable_ipv6": false,  "scheme": "https",  "ipv4": {  "ip": null,  "port": null },  "ipv6": {  "ip": null,  "port": null  } }, "HIPS": {  "is_use": false,  "site_auth_key": "${SITE_AUTH_KEY}",  "enable_ipv6": false,  "scheme": "https",  "ipv4": {  "ip": null,  "port": null }, "ipv6": {  "ip": null,  "port": null  } } }, "policyguard_ip_info": { "main_server_policy": true, "ip_address": ${PG_SERVER} }, "event_log": { "main_server_policy": true, "log_filter": ${LOG_FILTER_CONFIG} }, "metering": ${METERING_CONFIG}, "scheduler": ${SCHEDULE_CONFIG} }}'
    , '{ "uninstall_option": { "uninstall_confirm_password": "${AGENT_MGMT_KEY}" }, "exit_option": { "exit_confirm_password": "${AGENT_MGMT_KEY}" }, "patch": { "oes_url": "${ENGINE_UPDATE_OES}", "ses_url": "${ENGINE_UPDATE_SES}", "oes_url_list": ["${ENGINE_UPDATE_OES_LIST}"], "ses_url_list": ["${ENGINE_UPDATE_SES_LIST}"] }, "main_service": { "license": { "main_server_policy": true, "AGENT": ${AGENT_LICENSE_DATA}, "V3NET_9.0": ${V3NET_9.0_LICENSE_DATA}, "AC_CLIENT": ${AC_LICENSE_DATA}, "HIPS_CLIENT": ${HIPS_LICENSE_DATA}, "V3NET_LU": ${V3NET_LU_LICENSE_DATA} }, "license2": { "main_server_policy": true, "AGENT": ${AGENT_LICENSE_DATA_V2}, "V3NET_9.0": ${V3NET_9.0_LICENSE_DATA_V2}, "AC_CLIENT": ${AC_LICENSE_DATA_V2}, "HIPS_CLIENT": ${HIPS_LICENSE_DATA_V2}, "V3NET_LU": ${V3NET_LU_LICENSE_DATA_V2}, "AMC_CLIENT": ${AMC_LICENSE_DATA_V2}}, "main_server_info": { "site_auth_key": "${SITE_AUTH_KEY}", "enable_ipv6": false, "scheme": "https", "ipv4": ${IP4_INFO}, "ipv6": [] }, "extra_mgmt_server_ip": { "is_use": false, "main_server_policy": true, "V3": {  "is_use": false,  "site_auth_key": "${SITE_AUTH_KEY}",  "enable_ipv6": false,  "scheme": "https", "ipv4": {  "ip": null,  "port": null },  "ipv6": {  "ip": null,  "port": null  } }, "AC": {  "is_use": false,  "site_auth_key":  "${SITE_AUTH_KEY}",  "enable_ipv6": false,  "scheme": "https",  "ipv4": {  "ip": null,  "port": null },  "ipv6": {  "ip": null,  "port": null  } }, "HIPS": {  "is_use": false,  "site_auth_key": "${SITE_AUTH_KEY}",  "enable_ipv6": false,  "scheme": "https",  "ipv4": {  "ip": null,  "port": null }, "ipv6": {  "ip": null,  "port": null  } } }, "policyguard_ip_info": { "main_server_policy": true, "ip_address": ${PG_SERVER} }, "event_log": { "main_server_policy": true, "log_filter": ${LOG_FILTER_CONFIG} }, "metering": ${METERING_CONFIG}, "scheduler": ${SCHEDULE_CONFIG} }}'
    , NULL
    , NULL
    , NULL
    , NULL
),
(
    'V3NET_LU_UPDATE'
    , 'XML'
    , '<PEF><Policy><MPSEC_AGENT><MANUAL_UPDATE_URL>${ENGINE_UPDATE_OES}</MANUAL_UPDATE_URL><MANUAL_UPDATE_STABLE_URL>${ENGINE_UPDATE_SES}</MANUAL_UPDATE_STABLE_URL></MPSEC_AGENT></Policy></PEF>'
    , '<PEF><Policy><MPSEC_AGENT><MANUAL_UPDATE_URL>${ENGINE_UPDATE_OES}</MANUAL_UPDATE_URL><MANUAL_UPDATE_STABLE_URL>${ENGINE_UPDATE_SES}</MANUAL_UPDATE_STABLE_URL></MPSEC_AGENT></Policy></PEF>'
    , NULL
    , NULL
    , NULL
    , NULL
),
(
    'V3NET_9.0_AV'
    , 'XML'
    , '<AHNLAB_POLICY><V3NET90><UPDATE MANUAL_UPDATE_URL="${ENGINE_UPDATE_OES}" MANUAL_UPDATE_STABLE_URL="${ENGINE_UPDATE_SES}"/></V3NET90></AHNLAB_POLICY>'
    , '<AHNLAB_POLICY><V3NET90><UPDATE MANUAL_UPDATE_URL="${ENGINE_UPDATE_OES}" MANUAL_UPDATE_STABLE_URL="${ENGINE_UPDATE_SES}"/></V3NET90></AHNLAB_POLICY>'
    , NULL
    , NULL
    , NULL
    , NULL
),
(
    'HIPS_AGENT'
    , 'JSON'
    , '{ "body": { "policy_hips_agent": { "license": ${HIPS_LICENSE_DATA}, "agent_config" : {  "event_log": { "log_filter": { "HIPS_AGENT": ${LOG_SEND_HIPS_AGENT}, "HIPS_DETECT": ${LOG_SEND_HIPS_DETECT}, "HIPS_FW": ${LOG_SEND_HIPS_FW} } } }, "server_info": { "site_auth_key": "${SITE_AUTH_KEY}", "enable_ipv6": false, "scheme": "https", "ipv4": ${IP4_INFO}, "ipv6": [] }, "update": { "oes_url_list": ["${ENGINE_UPDATE_OES_LIST}"] }, "nation": ${HIPS_GEO_DB}, "user_nation": ${HIPS_USER_GEO_DB} } } }'
    , '{ "body": { "policy_hips_agent": { "license": ${HIPS_LICENSE_DATA}, "agent_config" : {  "event_log": { "log_filter": { "HIPS_AGENT": ${LOG_SEND_HIPS_AGENT}, "HIPS_DETECT": ${LOG_SEND_HIPS_DETECT}, "HIPS_FW": ${LOG_SEND_HIPS_FW} } } }, "server_info": { "site_auth_key": "${SITE_AUTH_KEY}", "enable_ipv6": false, "scheme": "https", "ipv4": ${IP4_INFO}, "ipv6": [] }, "update": { "oes_url_list": ["${ENGINE_UPDATE_OES_LIST}"] }, "nation": ${HIPS_GEO_DB}, "user_nation": ${HIPS_USER_GEO_DB} } } }'
    , NULL
    , NULL
    , NULL
    , NULL
),
(
    'HIPS_MGMT'
    , 'JSON'
    , '{ "body": { "policy_hips_ips_mgmt": { "signature": ${HIPS_DEFAULT_SIGNATURE}, "user_signature": ${HIPS_USER_SIGNATURE}, "recommendationpack": ${HIPS_RECOMMENDATIONPACK}, "recommendation": ${HIPS_RECOMMENDATION} } } }'
    , '{ "body": { "policy_hips_ips_mgmt": { "signature": ${HIPS_DEFAULT_SIGNATURE}, "user_signature": ${HIPS_USER_SIGNATURE}, "recommendationpack": ${HIPS_RECOMMENDATIONPACK}, "recommendation": ${HIPS_RECOMMENDATION} } } }'
    , NULL
    , NULL
    , NULL
    , NULL
),
(    'AC_AGENT'
    ,'JSON'
    , '{ "body": { "policy_ac_agent": { "agent_config":{ "event_log": { "log_filter": { "AC_AGENT": ${LOG_SEND_AC_AGENT}, "AC_EXEC": ${LOG_SEND_AC_EXEC}, "AC_ACCESS": ${LOG_SEND_AC_ACCESS} , "AC_IM": ${LOG_SEND_AC_IM}} } }, "license": ${AC_LICENSE_DATA}, "server_info": { "site_auth_key": "${SITE_AUTH_KEY}", "enable_ipv6": false, "scheme": "https", "ipv4": ${IP4_INFO} }, "update": { "oes_url_list": ["${ENGINE_UPDATE_OES_LIST}"] } } } }'
    , '{ "body": { "policy_ac_agent": { "agent_config":{ "event_log": { "log_filter": { "AC_AGENT": ${LOG_SEND_AC_AGENT}, "AC_EXEC": ${LOG_SEND_AC_EXEC}, "AC_ACCESS": ${LOG_SEND_AC_ACCESS} , "AC_IM": ${LOG_SEND_AC_IM}} } }, "license": ${AC_LICENSE_DATA}, "server_info": { "site_auth_key": "${SITE_AUTH_KEY}", "enable_ipv6": false, "scheme": "https", "ipv4": ${IP4_INFO} }, "update": { "oes_url_list": ["${ENGINE_UPDATE_OES_LIST}"] } } } }'
    , NULL
    , NULL
    , NULL
    , NULL
),
(
    'IM_MGMT'
    , 'JSON'
    , '{ "body": { "policy_im_mgmt": { "imrule": ${IM_PREDEFINED_RULE}, "imrule_user": ${IM_USERDEFINED_RULE} } } }'
    , '{ "body": { "policy_im_mgmt": { "imrule": ${IM_PREDEFINED_RULE}, "imrule_user": ${IM_USERDEFINED_RULE} } } }'
    , NULL
    , NULL
    , NULL
    , NULL
),
(
    'SCM_MGMT'
    , 'JSON'
    , '{ "body": { "policy_hardening_mgmt": { "rule": ${SCM_PREDEFINED_RULE}, "user_rule": ${SCM_USERDEFINED_RULE} } } }'
    , '{ "body": { "policy_hardening_mgmt": { "rule": ${SCM_PREDEFINED_RULE}, "user_rule": ${SCM_USERDEFINED_RULE} } } }'
    , NULL
    , NULL
    , NULL
    , NULL
),
(
    'SCM_AGENT'
    , 'JSON'
    , '{ "body": { "policy_hardening_agent": { "license": ${SCM_LICENSE_DATA}, "agent_config":{ "event_log": { "log_filter": { "HARDENING_AGENTEVENT": ${LOG_SEND_SCM_AGENT}, "HARDENING_SCANEVENT": ${LOG_SEND_SCM_SCAN}} }}, "update": { "oes_url_list": ["${ENGINE_UPDATE_OES_LIST}"]}, "server_info": { "site_auth_key": "${SITE_AUTH_KEY}", "enable_ipv6": false, "scheme": "https", "ipv4": ${IP4_INFO}} } }}'
    , '{ "body": { "policy_hardening_agent": { "license": ${SCM_LICENSE_DATA}, "agent_config":{ "event_log": { "log_filter": { "HARDENING_AGENTEVENT": ${LOG_SEND_SCM_AGENT}, "HARDENING_SCANEVENT": ${LOG_SEND_SCM_SCAN}} }}, "update": { "oes_url_list": ["${ENGINE_UPDATE_OES_LIST}"]}, "server_info": { "site_auth_key": "${SITE_AUTH_KEY}", "enable_ipv6": false, "scheme": "https", "ipv4": ${IP4_INFO}} } }}'
    , NULL
    , NULL
    , NULL
    , NULL
),
(
    'AMC_MGMT'
    , 'JSON'
    , '{"body": {"policy_amc_mgmt": {"license": ${AMC_LICENSE_DATA},"agent_config": {"event_log": {"log_filter": {"AMC_ALERT": ${LOG_SEND_AMC_ALERT},"AMC_SS": ${LOG_SEND_AMC_SS},"AMC_IS": ${LOG_SEND_AMC_IS},"AMC_SUP": ${LOG_SEND_AMC_SUP},"AMC_DEVICE": ${LOG_SEND_AMC_DEVICE},"AMC_QUAR": ${LOG_SEND_AMC_QUAR}}}},"server_info": {"site_auth_key": "${SITE_AUTH_KEY}","enable_ipv6": false,"scheme": "https","ipv4": ${IP4_INFO},"ipv6": []},"update": {"manual_update_stable_url": "${ENGINE_UPDATE_SES}","manual_update_url": "${ENGINE_UPDATE_OES}"}}}}'
    , '{"body": {"policy_amc_mgmt": {"license": ${AMC_LICENSE_DATA},"agent_config": {"event_log": {"log_filter": {"AMC_ALERT": ${LOG_SEND_AMC_ALERT},"AMC_SS": ${LOG_SEND_AMC_SS},"AMC_IS": ${LOG_SEND_AMC_IS},"AMC_SUP": ${LOG_SEND_AMC_SUP},"AMC_DEVICE": ${LOG_SEND_AMC_DEVICE},"AMC_QUAR": ${LOG_SEND_AMC_QUAR}}}},"server_info": {"site_auth_key": "${SITE_AUTH_KEY}","enable_ipv6": false,"scheme": "https","ipv4": ${IP4_INFO},"ipv6": []},"update": {"manual_update_stable_url": "${ENGINE_UPDATE_SES}","manual_update_url": "${ENGINE_UPDATE_OES}"}}}}'
    , NULL
    , NULL
    , NULL
    , NULL
)
ON CONFLICT(product_feature_id) DO UPDATE SET(policy_format, online_policy_format, offline_policy_format) = (EXCLUDED.policy_format, EXCLUDED.online_policy_format, EXCLUDED.offline_policy_format);

------------------------------------------------------------------------
select '## tb_extra_policy_format';
delete from tb_extra_policy_format;
------------------------------------------------------------------------
INSERT INTO tb_extra_policy_format (product_feature_id, policy_format, online_policy_format, offline_policy_format)
VALUES ('V3NET_9.0_AV', 'XML', '<AHNLAB_POLICY><V3NET90>%s</V3NET90></AHNLAB_POLICY>', '<AHNLAB_POLICY><V3NET90>%s</V3NET90></AHNLAB_POLICY>')
ON CONFLICT (product_feature_id) DO UPDATE SET online_policy_format = EXCLUDED.online_policy_format, offline_policy_format = EXCLUDED.offline_policy_format;

INSERT INTO tb_extra_policy_format (product_feature_id, policy_format, online_policy_format, offline_policy_format)
VALUES ('V3NET_LU_UPDATE', 'XML', '<PEF><Policy><MPSEC_AGENT>%s</MPSEC_AGENT></Policy></PEF>', '<PEF><Policy><MPSEC_AGENT>%s</MPSEC_AGENT></Policy></PEF>')
ON CONFLICT (product_feature_id) DO UPDATE SET online_policy_format = EXCLUDED.online_policy_format, offline_policy_format = EXCLUDED.offline_policy_format;

INSERT INTO tb_extra_policy_format (product_feature_id, policy_format, online_policy_format, offline_policy_format)
VALUES ('AGENT_MGMT', 'JSON', NULL, NULL)
ON CONFLICT (product_feature_id) DO UPDATE SET online_policy_format = EXCLUDED.online_policy_format, offline_policy_format = EXCLUDED.offline_policy_format;

------------------------------------------------------------------------
select '## tb_base_report';
------------------------------------------------------------------------

INSERT INTO tb_base_report ( base_report_id, product_group, base_report_group, load_nosql_procedure, load_nosql_to_rdb_table, load_rdb_procedure, summary_procedure, report_procedure, save_rdb_table, fill_empty, nosql_collection, load_nosql_to_rdb_column, step, default_period_type, db_type, enabled)
VALUES ('BASE_SUMMARY', 'EMS', 'SUMMARY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TODAY', 'OLTP', false )
ON CONFLICT (base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report (base_report_id, product_group, base_report_group, load_nosql_procedure, load_nosql_to_rdb_table, load_rdb_procedure, summary_procedure, report_procedure, save_rdb_table, fill_empty, nosql_collection, load_nosql_to_rdb_column, step, default_period_type, db_type, enabled)
VALUES ('AGENT_INSTALL_STATUS', 'EMS', 'AGENT', NULL, NULL, NULL, NULL, NULL, NULL, true, NULL, NULL, NULL, 'LATEST', 'OLTP', false)
ON CONFLICT (base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report (base_report_id, product_group, base_report_group, load_nosql_procedure, load_nosql_to_rdb_table, load_rdb_procedure, summary_procedure, report_procedure, save_rdb_table, fill_empty, nosql_collection, load_nosql_to_rdb_column, step, default_period_type, db_type, enabled)
VALUES ('AGENT_INSTALL_HISTORY', 'EMS', 'AGENT', NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, 'TODAY', 'OLTP', false)
ON CONFLICT (base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report (base_report_id, product_group, base_report_group, load_nosql_procedure, load_nosql_to_rdb_table, load_rdb_procedure, summary_procedure, report_procedure, save_rdb_table, fill_empty, nosql_collection, load_nosql_to_rdb_column, step, default_period_type, db_type, enabled)
VALUES ('HW_STATUS', 'EMS', 'AGENT', NULL, NULL, NULL, NULL, NULL, NULL, true, NULL, NULL, NULL, 'LATEST', 'OLTP', false)
ON CONFLICT (base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report (base_report_id, product_group, base_report_group, load_nosql_procedure, load_nosql_to_rdb_table, load_rdb_procedure, summary_procedure, report_procedure, save_rdb_table, fill_empty, nosql_collection, load_nosql_to_rdb_column, step, default_period_type, db_type, enabled)
VALUES ('SW_STATUS', 'EMS', 'AGENT', NULL, NULL, NULL, NULL, NULL, NULL, true, NULL, NULL, NULL, 'LATEST', 'OLTP', false)
ON CONFLICT (base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report (base_report_id, product_group, base_report_group, load_nosql_procedure, load_nosql_to_rdb_table, load_rdb_procedure, summary_procedure, report_procedure, save_rdb_table, fill_empty, nosql_collection, load_nosql_to_rdb_column, step, default_period_type, db_type, enabled)
VALUES ('OS_STATUS', 'EMS', 'AGENT', NULL, NULL, NULL, NULL, NULL, NULL, true, NULL, NULL, NULL, 'LATEST', 'OLTP', false)
ON CONFLICT (base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report (base_report_id, product_group, base_report_group, load_nosql_procedure, load_nosql_to_rdb_table, load_rdb_procedure, summary_procedure, report_procedure, save_rdb_table, fill_empty, nosql_collection, load_nosql_to_rdb_column, step, default_period_type, db_type, enabled)
VALUES ('PRODUCT_STATUS', 'V3', 'PRODUCT', NULL, NULL, NULL, NULL, NULL, NULL, true, NULL, NULL, NULL, 'LATEST', 'OLTP', false)
ON CONFLICT (base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report (base_report_id, product_group, base_report_group, load_nosql_procedure, load_nosql_to_rdb_table, load_rdb_procedure, summary_procedure, report_procedure, save_rdb_table, fill_empty, nosql_collection, load_nosql_to_rdb_column, step, default_period_type, db_type, enabled)
VALUES ('V3_INSTALL_STATUS', 'V3', 'PRODUCT', NULL, NULL, NULL, NULL, NULL, NULL, true, NULL, NULL, NULL, 'LATEST', 'OLTP', false)
ON CONFLICT (base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report (base_report_id, product_group, base_report_group, load_nosql_procedure, load_nosql_to_rdb_table, load_rdb_procedure, summary_procedure, report_procedure, save_rdb_table, fill_empty, nosql_collection, load_nosql_to_rdb_column, step, default_period_type, db_type, enabled)
VALUES ('V3_INSTALL_HISTORY', 'V3', 'PRODUCT', NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, 'TODAY', 'OLTP', false)
ON CONFLICT (base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report (base_report_id, product_group, base_report_group, load_nosql_procedure, load_nosql_to_rdb_table, load_rdb_procedure, summary_procedure, report_procedure, save_rdb_table, fill_empty, nosql_collection, load_nosql_to_rdb_column, step, default_period_type, db_type, enabled)
VALUES ('V3_POLICY_STATUS', 'V3', 'PRODUCT', NULL, NULL, NULL, NULL, NULL, NULL, true, NULL, NULL, NULL, 'LATEST', 'OLTP', false)
ON CONFLICT (base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report (base_report_id, product_group, base_report_group, load_nosql_procedure, load_nosql_to_rdb_table, load_rdb_procedure, summary_procedure, report_procedure, save_rdb_table, fill_empty, nosql_collection, load_nosql_to_rdb_column, step, default_period_type, db_type, enabled)
VALUES ('MALWARE_SUMMARY', 'V3', 'MALWARE', NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, 'LAST_24HR', 'OLTP', false)
ON CONFLICT (base_report_id) DO UPDATE SET load_nosql_to_rdb_column = EXCLUDED.load_nosql_to_rdb_column, nosql_collection = EXCLUDED.nosql_collection, load_nosql_procedure = EXCLUDED.load_nosql_procedure, load_nosql_to_rdb_table = EXCLUDED.load_nosql_to_rdb_table, default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report (base_report_id, product_group, base_report_group, load_nosql_procedure, load_nosql_to_rdb_table, load_rdb_procedure, summary_procedure, report_procedure, save_rdb_table, fill_empty, nosql_collection, load_nosql_to_rdb_column, step, default_period_type, db_type, enabled)
VALUES ('MALWARE_NAME_TOP', 'V3', 'MALWARE', NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, 'TODAY', 'OLTP', false)
ON CONFLICT (base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report (base_report_id, product_group, base_report_group, load_nosql_procedure, load_nosql_to_rdb_table, load_rdb_procedure, summary_procedure, report_procedure, save_rdb_table, fill_empty, nosql_collection, load_nosql_to_rdb_column, step, default_period_type, db_type, enabled)
VALUES ('MALWARE_AGENT_TOP', 'V3', 'MALWARE', NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, 'TODAY', 'OLTP', false)
ON CONFLICT (base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report (base_report_id, product_group, base_report_group, load_nosql_procedure, load_nosql_to_rdb_table, load_rdb_procedure, summary_procedure, report_procedure, save_rdb_table, fill_empty, nosql_collection, load_nosql_to_rdb_column, step, default_period_type, db_type, enabled)
VALUES ('MALWARE_DETECT_HISTORY', 'V3', 'MALWARE', NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, 'TODAY', 'OLTP', false)
ON CONFLICT (base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report(base_report_id,product_group,base_report_group,load_nosql_procedure,load_nosql_to_rdb_table,load_rdb_procedure,summary_procedure,report_procedure,save_rdb_table,fill_empty,nosql_collection,load_nosql_to_rdb_column,step,default_period_type,db_type,enabled) 
VALUES('HIPS_APPLICATION_TOP','HIPS','HIPS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TODAY','OLTP',false)
ON CONFLICT(base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report(base_report_id,product_group,base_report_group,load_nosql_procedure,load_nosql_to_rdb_table,load_rdb_procedure,summary_procedure,report_procedure,save_rdb_table,fill_empty,nosql_collection,load_nosql_to_rdb_column,step,default_period_type,db_type,enabled) 
VALUES('HIPS_SIP_TOP','HIPS','HIPS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TODAY','OLTP',false)
ON CONFLICT(base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report(base_report_id,product_group,base_report_group,load_nosql_procedure,load_nosql_to_rdb_table,load_rdb_procedure,summary_procedure,report_procedure,save_rdb_table,fill_empty,nosql_collection,load_nosql_to_rdb_column,step,default_period_type,db_type,enabled) 
VALUES('HIPS_SIGNATURE_TOP','HIPS','HIPS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TODAY','OLTP',false)
ON CONFLICT(base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report(base_report_id,product_group,base_report_group,load_nosql_procedure,load_nosql_to_rdb_table,load_rdb_procedure,summary_procedure,report_procedure,save_rdb_table,fill_empty,nosql_collection,load_nosql_to_rdb_column,step,default_period_type,db_type,enabled) 
VALUES('HIPS_COUNTRY_TOP','HIPS','HIPS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TODAY','OLTP',false)
ON CONFLICT(base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report(base_report_id,product_group,base_report_group,load_nosql_procedure,load_nosql_to_rdb_table,load_rdb_procedure,summary_procedure,report_procedure,save_rdb_table,fill_empty,nosql_collection,load_nosql_to_rdb_column,step,default_period_type,db_type,enabled) 
VALUES('HIPS_DETECT_AGENT_TOP','HIPS','HIPS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TODAY','OLTP',false)
ON CONFLICT(base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report(base_report_id,product_group,base_report_group,load_nosql_procedure,load_nosql_to_rdb_table,load_rdb_procedure,summary_procedure,report_procedure,save_rdb_table,fill_empty,nosql_collection,load_nosql_to_rdb_column,step,default_period_type,db_type,enabled) 
VALUES('HIPS_DETECT_HISTORY','HIPS','HIPS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TODAY','OLTP',false)
ON CONFLICT(base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report(base_report_id,product_group,base_report_group,load_nosql_procedure,load_nosql_to_rdb_table,load_rdb_procedure,summary_procedure,report_procedure,save_rdb_table,fill_empty,nosql_collection,load_nosql_to_rdb_column,step,default_period_type,db_type,enabled) 
VALUES('HIPS_FW_SIP_TOP','HIPS','HIPS_FW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TODAY','OLTP',false)
ON CONFLICT(base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report(base_report_id,product_group,base_report_group,load_nosql_procedure,load_nosql_to_rdb_table,load_rdb_procedure,summary_procedure,report_procedure,save_rdb_table,fill_empty,nosql_collection,load_nosql_to_rdb_column,step,default_period_type,db_type,enabled) 
VALUES('HIPS_FW_PORT_TOP','HIPS','HIPS_FW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TODAY','OLTP',false)
ON CONFLICT(base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report(base_report_id,product_group,base_report_group,load_nosql_procedure,load_nosql_to_rdb_table,load_rdb_procedure,summary_procedure,report_procedure,save_rdb_table,fill_empty,nosql_collection,load_nosql_to_rdb_column,step,default_period_type,db_type,enabled) 
VALUES('HIPS_FW_RULE_TOP','HIPS','HIPS_FW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TODAY','OLTP',false)
ON CONFLICT(base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report(base_report_id,product_group,base_report_group,load_nosql_procedure,load_nosql_to_rdb_table,load_rdb_procedure,summary_procedure,report_procedure,save_rdb_table,fill_empty,nosql_collection,load_nosql_to_rdb_column,step,default_period_type,db_type,enabled) 
VALUES('HIPS_FW_HISTORY','HIPS','HIPS_FW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TODAY','OLTP',false)
ON CONFLICT(base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report(base_report_id,product_group,base_report_group,load_nosql_procedure,load_nosql_to_rdb_table,load_rdb_procedure,summary_procedure,report_procedure,save_rdb_table,fill_empty,nosql_collection,load_nosql_to_rdb_column,step,default_period_type,db_type,enabled) 
VALUES('HIPS_FW_AGENT_TOP','HIPS','HIPS_FW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TODAY','OLTP',false)
ON CONFLICT(base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report (base_report_id,product_group,base_report_group,load_nosql_procedure,load_nosql_to_rdb_table,load_rdb_procedure,summary_procedure,report_procedure,save_rdb_table,fill_empty,nosql_collection,load_nosql_to_rdb_column,step,default_period_type,db_type,enabled)
VALUES('AC_BLOCK_HISTORY','AC','AC',NULL,NULL,NULL,NULL,NULL,NULL,true,NULL,NULL,NULL,'TODAY','OLTP',false)
ON CONFLICT(base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report (base_report_id,product_group,base_report_group,load_nosql_procedure,load_nosql_to_rdb_table,load_rdb_procedure,summary_procedure,report_procedure,save_rdb_table,fill_empty,nosql_collection,load_nosql_to_rdb_column,step,default_period_type,db_type,enabled)
VALUES('AC_BLOCK_FILE_TOP','AC','AC',NULL,NULL,NULL,NULL,NULL,NULL,true,NULL,NULL,NULL,'TODAY','OLTP',false)
ON CONFLICT(base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report (base_report_id,product_group,base_report_group,load_nosql_procedure,load_nosql_to_rdb_table,load_rdb_procedure,summary_procedure,report_procedure,save_rdb_table,fill_empty,nosql_collection,load_nosql_to_rdb_column,step,default_period_type,db_type,enabled)
VALUES('AC_AGENT_TOP','AC','AC',NULL,NULL,NULL,NULL,NULL,NULL,true,NULL,NULL,NULL,'TODAY','OLTP',false)
ON CONFLICT(base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

-- CWPP-1779
INSERT INTO tb_base_report (base_report_id,product_group,base_report_group,load_nosql_procedure,load_nosql_to_rdb_table,load_rdb_procedure,summary_procedure,report_procedure,save_rdb_table,fill_empty,nosql_collection,load_nosql_to_rdb_column,step,default_period_type,db_type,enabled)
VALUES('IM_AGENT_TOP','AC','IM',NULL,NULL,NULL,NULL,NULL,NULL,true,NULL,NULL,NULL,'TODAY','OLTP',false)
ON CONFLICT(base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report (base_report_id,product_group,base_report_group,load_nosql_procedure,load_nosql_to_rdb_table,load_rdb_procedure,summary_procedure,report_procedure,save_rdb_table,fill_empty,nosql_collection,load_nosql_to_rdb_column,step,default_period_type,db_type,enabled)
VALUES('IM_HISTORY','AC','IM',NULL,NULL,NULL,NULL,NULL,NULL,true,NULL,NULL,NULL,'TODAY','OLTP',false)
ON CONFLICT(base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report (base_report_id,product_group,base_report_group,load_nosql_procedure,load_nosql_to_rdb_table,load_rdb_procedure,summary_procedure,report_procedure,save_rdb_table,fill_empty,nosql_collection,load_nosql_to_rdb_column,step,default_period_type,db_type,enabled)
VALUES('IM_WATCH_TOP','AC','IM',NULL,NULL,NULL,NULL,NULL,NULL,true,NULL,NULL,NULL,'TODAY','OLTP',false)
ON CONFLICT(base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report (base_report_id,product_group,base_report_group,load_nosql_procedure,load_nosql_to_rdb_table,load_rdb_procedure,summary_procedure,report_procedure,save_rdb_table,fill_empty,nosql_collection,load_nosql_to_rdb_column,step,default_period_type,db_type,enabled)
VALUES('IM_RULE_TOP','AC','IM',NULL,NULL,NULL,NULL,NULL,NULL,true,NULL,NULL,NULL,'TODAY','OLTP',false)
ON CONFLICT(base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report (base_report_id,product_group,base_report_group,load_nosql_procedure,load_nosql_to_rdb_table,load_rdb_procedure,summary_procedure,report_procedure,save_rdb_table,fill_empty,nosql_collection,load_nosql_to_rdb_column,step,default_period_type,db_type,enabled)
VALUES('IM_INSPECT_TOP','AC','IM',NULL,NULL,NULL,NULL,NULL,NULL,true,NULL,NULL,NULL,'TODAY','OLTP',false)
ON CONFLICT(base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report (base_report_id,product_group,base_report_group,load_nosql_procedure,load_nosql_to_rdb_table,load_rdb_procedure,summary_procedure,report_procedure,save_rdb_table,fill_empty,nosql_collection,load_nosql_to_rdb_column,step,default_period_type,db_type,enabled)
VALUES('SCM_COMPLIANCE_SCAN_RESULT_FAILED_AGENT_TOP','SCM','SCM_COMPLIANCE',NULL,NULL,NULL,NULL,NULL,NULL,true,NULL,NULL,NULL,'TODAY','OLTP',false)
ON CONFLICT(base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;


INSERT INTO tb_base_report (base_report_id,product_group,base_report_group,load_nosql_procedure,load_nosql_to_rdb_table,load_rdb_procedure,summary_procedure,report_procedure,save_rdb_table,fill_empty,nosql_collection,load_nosql_to_rdb_column,step,default_period_type,db_type,enabled)
VALUES('SCM_COMPLIANCE_SCAN_RESULT_FAILED_ITEM_TOP','SCM','SCM_COMPLIANCE',NULL,NULL,NULL,NULL,NULL,NULL,true,NULL,NULL,NULL,'TODAY','OLTP',false)
ON CONFLICT(base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;


INSERT INTO tb_base_report (base_report_id,product_group,base_report_group,load_nosql_procedure,load_nosql_to_rdb_table,load_rdb_procedure,summary_procedure,report_procedure,save_rdb_table,fill_empty,nosql_collection,load_nosql_to_rdb_column,step,default_period_type,db_type,enabled)
VALUES('SCM_SECRET_SCAN_RESULT_FAILED_AGENT_TOP','SCM','SCM_SECRET',NULL,NULL,NULL,NULL, NULL,NULL,true,NULL,NULL,NULL,'TODAY','OLTP',false)
ON CONFLICT(base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report (base_report_id, product_group, base_report_group, load_nosql_procedure, load_nosql_to_rdb_table, load_rdb_procedure, summary_procedure, report_procedure, save_rdb_table, fill_empty, nosql_collection, load_nosql_to_rdb_column, step, default_period_type, db_type, enabled)
VALUES ('CNAPP_IMAGE_SCAN_RESULT', 'CNAPP', 'CNAPP', NULL, NULL, NULL, NULL, NULL, NULL, true, NULL, NULL, NULL, 'LATEST', 'OLTP', false)
ON CONFLICT (base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

INSERT INTO tb_base_report (base_report_id, product_group, base_report_group, load_nosql_procedure, load_nosql_to_rdb_table, load_rdb_procedure, summary_procedure, report_procedure, save_rdb_table, fill_empty, nosql_collection, load_nosql_to_rdb_column, step, default_period_type, db_type, enabled)
VALUES ('CNAPP_REGISTRY_IMAGE_SCAN_RESULT', 'CNAPP', 'CNAPP', NULL, NULL, NULL, NULL, NULL, NULL, true, NULL, NULL, NULL, 'LATEST', 'OLTP', false)
ON CONFLICT (base_report_id) DO UPDATE SET default_period_type = EXCLUDED.default_period_type, default_params = EXCLUDED.default_params, enabled = EXCLUDED.enabled, load_rdb_procedure = EXCLUDED.load_rdb_procedure, summary_procedure = EXCLUDED.summary_procedure, report_procedure = EXCLUDED.report_procedure, save_rdb_table = EXCLUDED.save_rdb_table, step = EXCLUDED.step;

------------------------------------------------------------------------
select '## tb_task_type';
------------------------------------------------------------------------

------------------------------------------------------------------------
select '## tb_task_type';
------------------------------------------------------------------------
INSERT INTO tb_task_type (task_type, task_target_type, request_name, interface_id, payload_format, task_target_product_id, request_format_version, request_from, agent_task_type, update_task_result, is_correlation_task, task_encoding, push_format, send_product_log, server_context)
VALUES
    ('AC_CHANGING_ACTION_MODE', 'NODE', 'process_command', 32, '{"task_id":%s,"task_type":"%s","update_task_result":%s,"update_task_result_from_product":%s,"server_context":%s,"payload":%s}', 'AC', '1.0', 'server', 'INTERLOCK_PRODUCT_COMMAND', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d, "console_context_payload" : @console_context_payload@}, "payload" : @payload@}', '0',  NULL)
    , ('AC_CHANGING_INVENTORY_POLICY', 'NODE', 'process_command', 32, '{"task_id":%s,"task_type":"%s","update_task_result":%s,"update_task_result_from_product":%s,"server_context":%s,"payload":%s}', 'AC', '1.0', 'server', 'INTERLOCK_PRODUCT_COMMAND', 'true',NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('AC_INITIALIZING_WHITELIST', 'NODE', 'process_command', 32, '{"task_id":%s,"task_type":"%s","update_task_result":%s,"update_task_result_from_product":%s,"server_context":%s,"payload":%s}', 'AC', '1.0', 'server', 'INTERLOCK_PRODUCT_COMMAND', 'true',NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('AC_PROCESS_OFF', 'NODE', 'process_command', 32, '{"task_id":%s,"task_type":"%s","update_task_result":%s,"update_task_result_from_product":%s,"server_context":%s,"payload":%s}', 'AC', '1.0', 'server', 'INTERLOCK_PRODUCT_COMMAND', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('AC_PROCESS_ON', 'NODE', 'process_command', 32, '{"task_id":%s,"task_type":"%s","update_task_result":%s,"update_task_result_from_product":%s,"server_context":%s,"payload":%s}', 'AC', '1.0', 'server', 'INTERLOCK_PRODUCT_COMMAND', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('AC_REMOVE_PRODUCT', 'NODE', 'thread_command', 14, '{"target_product_id":"%v"}', 'AC', '1.0', 'server', 'REMOVE_PRODUCT', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('AC_UPDATE_PRODUCT', 'NODE', 'process_command', 32, '{"task_id":%s,"task_type":"%s","update_task_result":%s,"update_task_result_from_product":%s,"server_context":%s,"payload":%s}', 'AC', '1.0', 'server', 'INTERLOCK_PRODUCT_COMMAND', 'true',NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d, "console_context_payload" : @console_context_payload@}, "payload" : @payload@}', '0',  NULL)
    , ('AM_FILE_IO_ANALYZE_SYNC', 'NODE', 'process_command', 32, '{"task_id":%s,"task_type":"%s","update_task_result":%s,"update_task_result_from_product":%s,"server_context":%s,"payload":%s}', 'V3', '1.0', 'server', 'INTERLOCK_PRODUCT_COMMAND', 'true',NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d, "console_context_payload" : @console_context_payload@}, "payload" : @payload@}', '0',  NULL)
    , ('AM_FILE_IO_ANALYZE_RESET', 'NODE', 'process_command', 32, '{"task_id":%s,"task_type":"%s","update_task_result":%s,"update_task_result_from_product":%s,"server_context":%s,"payload":%s}', 'V3', '1.0', 'server', 'INTERLOCK_PRODUCT_COMMAND', 'true',NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d, "console_context_payload" : @console_context_payload@}, "payload" : @payload@}', '0',  NULL)
    , ('AMC_UPDATE_PRODUCT', 'NODE', 'process_command', 32, '{"task_id":%s,"task_type":"%s","update_task_result":%s,"update_task_result_from_product":%s,"server_context":%s,"payload":%s}', 'V3', '1.0', 'server', 'INTERLOCK_PRODUCT_COMMAND', 'true',NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d, "console_context_payload" : @console_context_payload@}, "payload" : @payload@}', '0',  NULL)
    , ('APPLY_MERGEABLE_POLICY', 'NODE', 'thread_command', '17', '{ "product_feature_id" : "%s"}', 'AGENT', '1.0', 'server', 'APPLY_POLICY', 'false', NULL, 'base64', NULL, '0',  NULL)
    , ('APPLY_POLICY', 'NODE', 'thread_command', '17', '{ "product_feature_id" : "%s"}', 'AGENT', '1.0', 'server', 'APPLY_POLICY', 'true', NULL, 'base64', NULL, '0',  NULL)
    , ('CHECK_INTEGRITY', 'NODE', 'process_command', '4', NULL, 'AGENT', '1.0', 'server', 'CHECK_INTEGRITY', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('CHECK_SERVER_INTEGRITY', 'SERVER', NULL, NULL, NULL, 'EMS', NULL, NULL, 'CHECK_SERVER_INTEGRITY', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('COLLECT_AHNREPORT_FILE', 'NODE', 'process_command', '8', NULL, 'AGENT', '1.0', 'server', 'COLLECT_AHNREPORT_FILE', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('COLLECT_HARDWARE', 'NODE', 'thread_command', '23', NULL, 'AGENT', '1.0', 'server', 'COLLECT_HARDWARE', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('COLLECT_SOFTWARE', 'NODE', 'thread_command', '24', NULL, 'AGENT', '1.0', 'server', 'COLLECT_SOFTWARE', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('DEPLOY_FILE', 'NODE', 'process_command', '21', '{ "pkg_id": "%s" }', 'AGENT', '1.0', 'server', 'DEPLOY_FILE', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d, "server_context_payload" : @server_context_payload@, "console_context_payload" : @console_context_payload@}, "payload" : @payload@}', '0', '{ "pkg_id": "%s" }')
    , ('DUPLICATED_TASK_LIST', 'NODE', 'process_command', 32, '{"task_id":%s,"task_type":"%s","update_task_result":%s,"update_task_result_from_product":%s,"server_context":%s,"payload":%s}', 'EMS', '1.0', 'server', 'INTERLOCK_PRODUCT_COMMAND', 'true',NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "target_id_list" : "%s"}, "payload" : @payload@}', '0',  NULL)
    , ('DUPLICATED_TASK', 'NODE', 'process_command', 32, '{"task_id":%s,"task_type":"%s","update_task_result":%s,"update_task_result_from_product":%s,"server_context":%s,"payload":%s}', 'EMS', '1.0', 'server', 'INTERLOCK_PRODUCT_COMMAND', 'true',NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "target_id" : "%s"}, "payload" : @payload@}', '0',  NULL)
    , ('ENGINE_UPDATE', 'SERVER', NULL, NULL, NULL, 'EMS', NULL, NULL, 'ENGINE_UPDATE', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('GENERATE_REPORT', 'SERVER', NULL, NULL, '[{"report_schedule_id" : "%s"}]', 'EMS', NULL, NULL, 'GENERATE_REPORT', 'true', NULL, 'base64', NULL, '0',  NULL)
    , ('GENERATE_SERVER_REPORT', 'SERVER', NULL, NULL, NULL, 'EMS', NULL, NULL, 'GENERATE_SERVER_REPORT', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('HIPS_PROCESS_OFF', 'NODE', 'process_command', 32, '{"task_id":%s,"task_type":"%s","update_task_result":%s,"update_task_result_from_product":%s,"server_context":%s,"payload":%s}', 'HIPS', '1.0', 'server', 'INTERLOCK_PRODUCT_COMMAND', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('HIPS_PROCESS_ON', 'NODE', 'process_command', 32, '{"task_id":%s,"task_type":"%s","update_task_result":%s,"update_task_result_from_product":%s,"server_context":%s,"payload":%s}', 'HIPS', '1.0', 'server', 'INTERLOCK_PRODUCT_COMMAND', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('HIPS_REMOVE_PRODUCT', 'NODE', 'thread_command', 14, '{"target_product_id":"%v"}', 'HIPS', '1.0', 'server', 'REMOVE_PRODUCT', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('HIPS_UPDATE_PRODUCT', 'NODE', 'process_command', 32, '{"task_id":%s,"task_type":"%s","update_task_result":%s,"update_task_result_from_product":%s,"server_context":%s,"payload":%s}', 'HIPS', '1.0', 'server', 'INTERLOCK_PRODUCT_COMMAND', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d, "console_context_payload" : @console_context_payload@}, "payload" : @payload@}', '0',  NULL)
    , ('IM_REQLOG', 'NODE', 'process_command', 32, '{"task_id":%s,"task_type":"%s","update_task_result":%s,"update_task_result_from_product":%s,"server_context":%s,"payload":%s}', 'AC', '1.0', 'server', 'INTERLOCK_PRODUCT_COMMAND', 'true',NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', true,  NULL)
    , ('IM_RULECHECK', 'NODE', 'process_command', 32, '{"task_id":%s,"task_type":"%s","update_task_result":%s,"update_task_result_from_product":%s,"server_context":%s,"payload":%s}', 'AC', '1.0', 'server', 'INTERLOCK_PRODUCT_COMMAND', 'true',NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('INIT_USER_INFO', 'NODE', 'thread_command', '27', NULL, 'AGENT', '1.0', 'server', 'INIT_USER_INFO', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('INSTALL_PRODUCT', 'NODE', 'thread_command', '13', '{"target_product_id":"%s"}', 'AGENT', '1.0', 'server', 'INSTALL_PRODUCT', 'true', '1', 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('IPS_EMERGENCY_OFF_UNLOCK', 'NODE', 'process_command', 32, '{"task_id":%s,"task_type":"%s","update_task_result":%s,"update_task_result_from_product":%s,"server_context":%s,"payload":%s}', 'HIPS', '1.0', 'server', 'INTERLOCK_PRODUCT_COMMAND', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('IPS_EMERGENCY_OFF', 'NODE', 'process_command', 32, '{"task_id":%s,"task_type":"%s","update_task_result":%s,"update_task_result_from_product":%s,"server_context":%s,"payload":%s}', 'HIPS', '1.0', 'server', 'INTERLOCK_PRODUCT_COMMAND', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('IPS_SIGNATURE_RECOMMENDATION', 'NODE', 'process_command', 32, '{"task_id":%s,"task_type":"%s","update_task_result":%s,"update_task_result_from_product":%s,"server_context":%s,"payload":%s}', 'HIPS', '1.0', 'server', 'INTERLOCK_PRODUCT_COMMAND', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('IPS_SSL_INSPECTION_OFF', 'NODE', 'process_command', 32, '{"task_id":%s,"task_type":"%s","update_task_result":%s,"update_task_result_from_product":%s,"server_context":%s,"payload":%s}', 'HIPS', '1.0', 'server', 'INTERLOCK_PRODUCT_COMMAND', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('IPS_SSL_INSPECTION_ON', 'NODE', 'process_command', 32, '{"task_id":%s,"task_type":"%s","update_task_result":%s,"update_task_result_from_product":%s,"server_context":%s,"payload":%s}', 'HIPS', '1.0', 'server', 'INTERLOCK_PRODUCT_COMMAND', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('MODIFY_USER_INFO', 'NODE', 'thread_command', '26', NULL, 'AGENT', '1.0', 'server', 'MODIFY_USER_INFO', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('NOTIFICATION_CENTER', 'SERVER', NULL, NULL, '[{"admin_id" : "%s", "message" : "%s"}]', 'EMS', NULL, NULL, 'NOTIFICATION_CENTER', 'true', NULL, 'base64', NULL, '0',  NULL)
    , ('PATCH_AGENT', 'NODE', 'process_command', '1', NULL, 'AGENT', '1.0', 'server', 'PATCH_AGENT', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d, "console_context_payload" : @console_context_payload@}, "payload" : @payload@}', '0',  NULL)
    , ('PATCH_SERVER', 'SERVER', NULL, NULL, NULL, 'EMS', NULL, NULL, 'PATCH_SERVER', 'true', NULL, 'base64', NULL, '0',  NULL)
    , ('QUARANTINE_LOOKUP', 'NODE', 'process_command', 60, '{"task_id":%s,"task_type":"%s","update_task_result":%s,"update_task_result_from_product":%s,"server_context":%s,"payload":%s}', 'V3', '1.1', 'server', 'UPLOAD_PRODUCT_DATA', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('QUARANTINE_RESTORE', 'NODE', 'process_command', 32, '{"task_id":%s,"task_type":"%s","update_task_result":%s,"update_task_result_from_product":%s,"server_context":%s,"payload":%s}', 'V3', '1.1', 'server', 'INTERLOCK_PRODUCT_COMMAND', 'true',NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('REMOTE_CTRL', 'NODE', 'process_command', '2', '{"server_ip":"%s","server_port":"%s","send_time":"%s"}', 'AGENT', '1.0', 'server', 'REMOTE_CTRL', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}','0',NULL)
    , ('REMOVE_AGENT', 'NODE', 'process_command', '7', NULL, 'AGENT', '1.0', 'server', 'REMOVE_AGENT', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('REMOVE_EMERGENCY_OFF', 'NODE', 'process_command', 32, '{"task_id":%s,"task_type":"%s","update_task_result":%s,"update_task_result_from_product":%s,"server_context":%s,"payload":%s}', 'V3', '1.0', 'server', 'INTERLOCK_PRODUCT_COMMAND', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('RESET_SCAN_CACHE', 'NODE', 'process_command', 32, '{"task_id":%s,"task_type":"%s","update_task_result":%s,"update_task_result_from_product":%s,"server_context":%s,"payload":%s}', 'V3', '1.0', 'server', 'INTERLOCK_PRODUCT_COMMAND', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('RESTART_AGENT', 'NODE', 'thread_command', '20', NULL, 'AGENT', '1.0', 'server', 'RESTART_AGENT', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('SCM_CHECK_CANCEL', 'NODE', 'process_command', 32, '{"task_id":%s,"task_type":"%s","update_task_result":%s,"update_task_result_from_product":%s,"server_context":%s,"payload":%s}', 'SCM', '1.0', 'server', 'INTERLOCK_PRODUCT_COMMAND', 'true',NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('SCM_CHECK', 'NODE', 'process_command', 32, '{"task_id":%s,"task_type":"%s","update_task_result":%s,"update_task_result_from_product":%s,"server_context":%s,"payload":%s}', 'SCM', '1.0', 'server', 'INTERLOCK_PRODUCT_COMMAND', 'true',NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('SCM_REMOVE_PRODUCT', 'NODE', 'thread_command', 14, '{"target_product_id":"%v"}', 'SCM', '1.0', 'server', 'REMOVE_PRODUCT', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)    
    , ('SCM_UPDATE_PRODUCT', 'NODE', 'process_command', 32, '{"task_id":%s,"task_type":"%s","update_task_result":%s,"update_task_result_from_product":%s,"server_context":%s,"payload":%s}', 'SCM', '1.0', 'server', 'INTERLOCK_PRODUCT_COMMAND', 'true',NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d, "console_context_payload" : @console_context_payload@}, "payload" : @payload@}', '0',  NULL)
    , ('SEND_MAIL', 'SERVER', NULL, NULL, '{"mail_to" : "%s", "title" : "%s", "body" : "%s", "image" : "%s"}', 'EMS', NULL, NULL, 'SEND_MAIL', 'true', NULL, 'base64', NULL, '0',  NULL)
    , ('SEND_NOTICE', 'NODE', 'process_command', '11', '{"sender": "%s", "send_time": "%s", "title": "%s", "message": "%s"}', 'AGENT', '1.0', 'server', 'SEND_NOTICE', 'true', '1', 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('SET_SERVER', 'NODE', 'thread_command', '28', NULL, 'AGENT', '1.0', 'server', 'SET_SERVER', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('UPDATE_IPS_GEO_DB', 'SERVER', NULL, NULL, NULL, 'HIPS', NULL, NULL, 'UPDATE_IPS_GEO_DB', 'true', NULL, 'base64', NULL, '0',  NULL)
    , ('UPDATE_IPS_SIGNATURE', 'SERVER', NULL, NULL, NULL, 'HIPS', NULL, NULL, 'UPDATE_IPS_SIGNATURE', 'true', NULL, 'base64', NULL, '0',  NULL)
    , ('UPDATE_PRODUCT', 'NODE', 'process_command', '22', '{"target_product_id":"%v"}', 'V3', '1.0', 'server', 'UPDATE_PRODUCT', 'true', '1', 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d, "console_context_payload" : @console_context_payload@}, "payload" : @payload@}', '0',  NULL)
    , ('UPLOAD_AGENT_INFO', 'NODE', 'thread_command', '18', NULL, 'AGENT', '1.0', 'server', 'UPLOAD_AGENT_INFO', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('UPLOAD_EVENT_LOG', 'NODE', 'thread_command', '19', '{"target_product_id":"%v"}', 'V3', '1.0', 'server', 'UPLOAD_EVENT_LOG', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('UPLOAD_PRODUCT_INFO', 'NODE', 'thread_command', '5', '{"target_product_id":"%v"}', 'V3', '1.0', 'server', 'UPLOAD_PRODUCT_INFO', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('V3_EXEC_OPTIMIZATION', 'NODE', 'process_command', '32', '{"target_product_id":"%v","command": "%s"}', 'V3', '1.0', 'server', 'INTERLOCK_PRODUCT_COMMAND', 'true', '1', 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('V3_EXEC_SCAN', 'NODE', 'process_command', '32', '{"target_product_id":"%v","command": "%s"}', 'V3', '1.0', 'server', 'INTERLOCK_PRODUCT_COMMAND', 'true', '1', 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)    
    , ('V3_PRODUCT_UPDATE', 'NODE', NULL, NULL, NULL, 'AGENT', '1.0', 'server', 'V3_PRODUCT_UPDATE', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d, "console_context_payload" : @console_context_payload@}, "payload" : @payload@}', '0',  NULL)
    , ('V3_REMOVE_PRODUCT', 'NODE', 'thread_command', '14', '{"target_product_id":"%v"}', 'V3', '1.0', 'server', 'REMOVE_PRODUCT', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0',  NULL)
    , ('V3_STOP_SCAN', 'NODE', 'process_command', '32', '{"target_product_id":"%v","command": "%s"}', 'V3', '1.0', 'server', 'INTERLOCK_PRODUCT_COMMAND', 'true', '1', 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0', NULL)
    , ('V3_COLLECT_FEL', 'NODE', 'process_command', '32', '{"task_id":%s,"task_type":"%s","update_task_result":%s,"update_task_result_from_product":%s,"server_context":%s,"payload":%s}', 'V3', '1.0', 'server', 'INTERLOCK_PRODUCT_COMMAND', 'true', '1', 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0', NULL)
    , ('ANTIMALWARE_START_PRODUCT', 'NODE', 'thread_command', '71', '{"task_id":%s,"task_type":"%s","update_task_result":%s,"update_task_result_from_product":%s,"server_context":%s,"payload":%s}', 'AGENT', '1.0', 'server', 'ANTIMALWARE_START_PRODUCT', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0', NULL)
    , ('ANTIMALWARE_STOP_PRODUCT', 'NODE', 'thread_command', '72', '{"task_id":%s,"task_type":"%s","update_task_result":%s,"update_task_result_from_product":%s,"server_context":%s,"payload":%s}', 'AGENT', '1.0', 'server', 'ANTIMALWARE_STOP_PRODUCT', 'true', NULL, 'base64', '{"type" : "toastInfo", "info" : {"task_id" : "@task_id@", "task_type" : "@task_type@", "target_ip" : "@ip@", "additional" : "@additional@", "date" : "%s", "all_cnt" : %d, "progress_cnt" : %d, "success_cnt" : %d, "fail_cnt" : %d}, "payload" : @payload@}', '0', NULL)
ON CONFLICT (task_type) DO UPDATE SET (task_target_type, request_name, interface_id, payload_format, task_target_product_id, request_format_version, request_from, agent_task_type, update_task_result, is_correlation_task, task_encoding, push_format, send_product_log, server_context)
    = (EXCLUDED.task_target_type, EXCLUDED.request_name, EXCLUDED.interface_id, EXCLUDED.payload_format, EXCLUDED.task_target_product_id, EXCLUDED.request_format_version, EXCLUDED.request_from, EXCLUDED.agent_task_type, EXCLUDED.update_task_result, EXCLUDED.is_correlation_task, EXCLUDED.task_encoding, EXCLUDED.push_format, EXCLUDED.send_product_log,  EXCLUDED.server_context);


------------------------------------------------------------------------
select '## tb_correlation_condition';
------------------------------------------------------------------------
INSERT INTO tb_correlation_condition (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES ('GENERAL', NULL, '', '', 'sp_get_correlation_v3_uninstall(@comparison@, @values@::text[])', 'V3', 'OLTP', 'V3_UNINSTALL')
ON CONFLICT (correlation_condition_id) DO UPDATE SET procedure = EXCLUDED.procedure;

INSERT INTO tb_correlation_condition (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES ('GENERAL', NULL, '>=, >, <=, <, =', '', 'sp_get_correlation_last_connect_time(@comparison@, @values@::text[])', 'EMS', 'OLTP', 'LAST_CONNECT_TIME')
ON CONFLICT (correlation_condition_id) DO UPDATE SET procedure = EXCLUDED.procedure;

INSERT INTO tb_correlation_condition (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES ('GENERAL', NULL, '', '', 'sp_get_correlation_no_license_user(@comparison@, @values@::bigint[])', 'EMS', 'OLTP', 'NO_LICENSE_USER')
ON CONFLICT (correlation_condition_id) DO UPDATE SET procedure = EXCLUDED.procedure;

INSERT INTO tb_correlation_condition (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES ('GENERAL', NULL, '', '', 'sp_get_correlation_v3_real_time_scan_off(@comparison@, @values@::bigint[])', 'V3', 'OLTP', 'V3_REAL_TIME_SCAN_OFF')
ON CONFLICT (correlation_condition_id) DO UPDATE SET procedure = EXCLUDED.procedure;

INSERT INTO tb_correlation_condition (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES ('GENERAL', NULL, '>=, >, <=, <, =', '', 'sp_get_correlation_v3_last_engine_update(@comparison@, @values@::bigint[])', 'V3', 'OLTP', 'V3_LAST_ENGINE_UPDATE')
ON CONFLICT (correlation_condition_id) DO UPDATE SET procedure = EXCLUDED.procedure;

INSERT INTO tb_correlation_condition (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES ('GENERAL', NULL, '=, LIKE', '', 'sp_get_correlation_agent_version(@comparison@, @values@::text[])', 'EMS', 'OLTP', 'AGENT_VERSION')
ON CONFLICT (correlation_condition_id) DO UPDATE SET procedure = EXCLUDED.procedure;

INSERT INTO tb_correlation_condition (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES ('GENERAL', NULL, '>=, >, <=, <, =', '', 'sp_get_correlation_last_scan_time(@comparison@, @values@::bigint[])', 'V3', 'OLTP', 'LAST_SCAN_TIME')
ON CONFLICT (correlation_condition_id) DO UPDATE SET procedure = EXCLUDED.procedure;

INSERT INTO tb_correlation_condition (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES ('GENERAL', NULL, '', '', 'sp_get_correlation_product_install(@comparison@, @values@::text[])', 'EMS', 'OLTP', 'PRODUCT_INSTALL')
ON CONFLICT (correlation_condition_id) DO UPDATE SET procedure = EXCLUDED.procedure;

INSERT INTO tb_correlation_condition (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES ('GENERAL', 'tb_v3_alert_log', '=, LIKE', '', '[{$match:{"client_time":{$gt: {$date: "@utc_date@"}}, "name": @comparison@}}, {$project : {"_id": 0, "node_id":"$node_id", "name": {$concat: ["$name", " (", { $dateToString: { format: "%Y-%m-%d %H:%M:%S.%L", date: {"$add": ["$client_time", {"$multiply": [{$toInt : "$tz_offset"}, 3600000]}]}}}, ")"]}}}]', 'V3', 'NOSQL', 'MALWARE_NAME')
ON CONFLICT (correlation_condition_id) DO UPDATE SET procedure = EXCLUDED.procedure;

INSERT INTO tb_correlation_condition (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES ('GENERAL', 'tb_v3_alert_log', '>=, >, <=, <, =', '', '[{$match:{"client_time":{$gt: {$date: "@utc_date@"}}}},{$group:{"_id":"$node_id","count":{"$sum":1}}}, {$match:{"count":@comparison@}},{$project : {"_id": 0, "node_id":"$_id", "count":"$count"}}]', 'V3', 'NOSQL', 'MALWARE_DETECT_COUNT')
ON CONFLICT (correlation_condition_id) DO UPDATE SET procedure = EXCLUDED.procedure;

INSERT INTO tb_correlation_condition (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES ('MACRO', NULL, NULL, '', NULL, 'EMS', 'NONE', 'TITLE')
ON CONFLICT (correlation_condition_id) DO UPDATE SET procedure = EXCLUDED.procedure;

INSERT INTO tb_correlation_condition (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES ('MACRO', NULL, NULL, '', NULL, 'EMS', 'NONE', 'USER_NAME')
ON CONFLICT (correlation_condition_id) DO UPDATE SET procedure = EXCLUDED.procedure;

INSERT INTO tb_correlation_condition (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES ('MACRO', NULL, NULL, '', NULL, 'EMS', 'NONE', 'USER_LIST')
ON CONFLICT (correlation_condition_id) DO UPDATE SET procedure = EXCLUDED.procedure;

INSERT INTO tb_correlation_condition (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES ('MACRO', NULL, NULL, '', NULL, 'EMS', 'NONE', 'CORRELATION_CONDITION')
ON CONFLICT (correlation_condition_id) DO UPDATE SET procedure = EXCLUDED.procedure;

INSERT INTO tb_correlation_condition (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES ('SYSTEM_ALERT', NULL, '>=, >, <=, <, =', '', 'sp_get_correlation_memory(@comparison@, @values@::bigint[])', 'EMS', 'OLTP', 'MEMORY_USAGE')
ON CONFLICT (correlation_condition_id) DO UPDATE SET procedure = EXCLUDED.procedure;

INSERT INTO tb_correlation_condition (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES ('SYSTEM_ALERT', NULL, '>=, >, <=, <, =', '', 'sp_get_correlation_cpu(@comparison@, @values@::bigint[])', 'EMS', 'OLTP', 'CPU_USAGE')
ON CONFLICT (correlation_condition_id) DO UPDATE SET procedure = EXCLUDED.procedure;

INSERT INTO tb_correlation_condition (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES ('SYSTEM_ALERT', NULL, '>=, >, <=, <, =', '', 'sp_get_correlation_db_file_size(@comparison@, @values@::bigint[])', 'EMS', 'OLTP', 'DB_FILE_SIZE')
ON CONFLICT (correlation_condition_id) DO UPDATE SET procedure = EXCLUDED.procedure;

INSERT INTO tb_correlation_condition (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES ('SYSTEM_ALERT', NULL, '<', '', 'sp_get_correlation_license_expire(@comparison@, @values@::bigint[])', 'EMS', 'OLTP', 'LICENSE_EXPIRE')
ON CONFLICT (correlation_condition_id) DO UPDATE SET procedure = EXCLUDED.procedure;

INSERT INTO tb_correlation_condition (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES ('SYSTEM_ALERT', NULL, '>=, >, <=, <, =', '', 'sp_get_correlation_disk_usage(@comparison@, @values@::bigint[])', 'EMS', 'OLTP', 'DISK_USAGE')
ON CONFLICT (correlation_condition_id) DO UPDATE SET procedure = EXCLUDED.procedure;

INSERT INTO tb_correlation_condition (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES ('SYSTEM_ALERT', NULL, '>=, >, <=, <, =', '', 'sp_get_correlation_file_server_disk_size(@comparison@, @values@::bigint[])', 'EMS', 'OLTP', 'FILE_SERVER_DISK_SIZE')
ON CONFLICT (correlation_condition_id) DO UPDATE SET procedure = EXCLUDED.procedure;

INSERT INTO tb_correlation_condition (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES ('SYSTEM_ALERT', NULL, '<=', '', 'sp_get_correlation_certificate_expire(@comparison@, @values@::bigint[])', 'EMS', 'OLTP', 'CERTIFICATE_EXPIRE')
ON CONFLICT (correlation_condition_id) DO UPDATE SET procedure = EXCLUDED.procedure;

INSERT INTO tb_correlation_condition (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES ('GENERAL', NULL, '', '', 'sp_get_correlation_product_install(@comparison@, @values@::en_product_id_type[])', 'EMS', 'OLTP', 'PRODUCT_INSTALL')
ON CONFLICT (correlation_condition_id) DO UPDATE SET procedure = EXCLUDED.procedure;

INSERT INTO tb_correlation_condition(correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES 
('GENERAL', null, '>=, >, <=, <, =', '', 'sp_get_correlation_hips_detect_count(@comparison@, @values@::bigint[])', 'HIPS', 'OLTP', 'HIPS_DETECT_COUNT')
ON CONFLICT(correlation_condition_id) DO UPDATE
    SET (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type)
        = (excluded.correlation_type, excluded.collection, excluded.comparison_candidate, excluded.macro_candidate, excluded."procedure", excluded.product_group, excluded.db_type);

INSERT INTO tb_correlation_condition(correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES 
('GENERAL', null, '>=, >, <=, <, =', '', 'sp_get_correlation_hips_signature_name(@comparison@, @values@::text[])', 'HIPS', 'OLTP', 'HIPS_SIGNATURE_NAME')
ON CONFLICT(correlation_condition_id) DO UPDATE
    SET (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type)
        = (excluded.correlation_type, excluded.collection, excluded.comparison_candidate, excluded.macro_candidate, excluded."procedure", excluded.product_group, excluded.db_type);

INSERT INTO tb_correlation_condition(correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES 
('GENERAL', null, '>=, >, <=, <, =', '', 'sp_get_correlation_hips_severity(@comparison@, @values@::text[])', 'HIPS', 'OLTP', 'HIPS_SEVERITY')
ON CONFLICT(correlation_condition_id) DO UPDATE
    SET (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type)
        = (excluded.correlation_type, excluded.collection, excluded.comparison_candidate, excluded.macro_candidate, excluded."procedure", excluded.product_group, excluded.db_type);

INSERT INTO tb_correlation_condition(correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES 
('GENERAL', null, '>=, >, <=, <, =', '', 'sp_get_correlation_hips_applying_count(@comparison@, @values@::bigint[])', 'HIPS', 'OLTP', 'HIPS_APPLYING_COUNT')
ON CONFLICT(correlation_condition_id) DO UPDATE
    SET (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type)
        = (excluded.correlation_type, excluded.collection, excluded.comparison_candidate, excluded.macro_candidate, excluded."procedure", excluded.product_group, excluded.db_type);

INSERT INTO tb_correlation_condition(correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES 
('GENERAL', null, '>=, >, <=, <, =', '', 'sp_get_correlation_hips_last_signature_update_time(@comparison@, @values@::bigint[])', 'HIPS', 'OLTP', 'HIPS_LAST_SIGNATURE_UPDATE_TIME')
ON CONFLICT(correlation_condition_id) DO UPDATE
    SET (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type)
        = (excluded.correlation_type, excluded.collection, excluded.comparison_candidate, excluded.macro_candidate, excluded."procedure", excluded.product_group, excluded.db_type);                                                     

INSERT INTO tb_correlation_condition(correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES('GENERAL', NULL, '>=, >, <=, <, =', '', 'sp_get_correlation_ac_exec_block_count(@comparison@, @values@::bigint[])', 'AC', 'OLTP', 'AC_EXEC_BLOCK_COUNT')
ON CONFLICT(correlation_condition_id) DO UPDATE
    SET (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type)
        = (excluded.correlation_type, excluded.collection, excluded.comparison_candidate, excluded.macro_candidate, excluded."procedure", excluded.product_group, excluded.db_type);

INSERT INTO tb_correlation_condition(correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES('GENERAL', NULL, '>=, >, <=, <, =', '', 'sp_get_correlation_ac_file_hash_detect_count(@comparison@, @values@::text[])', 'AC', 'OLTP', 'AC_FILE_HASH_DETECT_COUNT')
ON CONFLICT(correlation_condition_id) DO UPDATE
    SET (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type)
        = (excluded.correlation_type, excluded.collection, excluded.comparison_candidate, excluded.macro_candidate, excluded."procedure", excluded.product_group, excluded.db_type);

INSERT INTO tb_correlation_condition(correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES('GENERAL', NULL, '>=, >, <=, <, =', '', 'sp_get_correlation_ac_file_name_detect_count(@comparison@, @values@::text[])', 'AC', 'OLTP', 'AC_FILE_NAME_DETECT_COUNT')
ON CONFLICT(correlation_condition_id) DO UPDATE
    SET (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type)
        = (excluded.correlation_type, excluded.collection, excluded.comparison_candidate, excluded.macro_candidate, excluded."procedure", excluded.product_group, excluded.db_type);

INSERT INTO tb_correlation_condition (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES ('GENERAL', NULL, '>=, >, <=, <, =', '', 'sp_get_correlation_ac_im_detect_count(@comparison@, @values@::bigint[])', 'AC', 'OLTP', 'AC_IM_DETECT_COUNT')
ON CONFLICT (correlation_condition_id) DO UPDATE 
    SET (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type)
        = (excluded.correlation_type, excluded.collection, excluded.comparison_candidate, excluded.macro_candidate, excluded."procedure", excluded.product_group, excluded.db_type);

INSERT INTO tb_correlation_condition (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES ('GENERAL', NULL, '>=, >, <=, <, =', '', 'sp_get_correlation_ac_im_watchlist_detect_count(@comparison@, @values@::text[])', 'AC', 'OLTP', 'AC_IM_WATCHLIST_DETECT_COUNT')
ON CONFLICT (correlation_condition_id) DO UPDATE 
    SET (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type)
        = (excluded.correlation_type, excluded.collection, excluded.comparison_candidate, excluded.macro_candidate, excluded."procedure", excluded.product_group, excluded.db_type);

INSERT INTO tb_correlation_condition (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES ('GENERAL', NULL, '>=, >, <=, <, =', '', 'sp_get_correlation_ac_im_watchlist_rule_detect_count(@comparison@, @values@::text[])', 'AC', 'OLTP', 'AC_IM_WATCHLIST_RULE_DETECT_COUNT')
ON CONFLICT (correlation_condition_id) DO UPDATE 
    SET (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type)
        = (excluded.correlation_type, excluded.collection, excluded.comparison_candidate, excluded.macro_candidate, excluded."procedure", excluded.product_group, excluded.db_type);

INSERT INTO tb_correlation_condition (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES ('GENERAL', NULL, '>=, >, <=, <, =', '', 'sp_get_correlation_ac_im_watchlist_rule_target_detect_count(@comparison@, @values@::text[])', 'AC', 'OLTP', 'AC_IM_WATCHLIST_RULE_TARGET_DETECT_COUNT')
ON CONFLICT (correlation_condition_id) DO UPDATE 
    SET (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type)
        = (excluded.correlation_type, excluded.collection, excluded.comparison_candidate, excluded.macro_candidate, excluded."procedure", excluded.product_group, excluded.db_type);

INSERT INTO tb_correlation_condition(correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES ('GENERAL', null, '>=, >, <=, <, =', '', 'sp_get_correlation_ac_im_manual_time(@comparison@, @values@::text[])', 'AC', 'OLTP', 'AC_IM_MANUAL_TIME')
ON CONFLICT(correlation_condition_id) DO UPDATE
    SET (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type)
        = (excluded.correlation_type, excluded.collection, excluded.comparison_candidate, excluded.macro_candidate, excluded."procedure", excluded.product_group, excluded.db_type);    

INSERT INTO tb_correlation_condition (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES ('GENERAL', NULL, '>=, >, <=, <, =', '', 'sp_get_correlation_scm_last_scan_time(@comparison@, @values@::text[])', 'SCM', 'OLTP', 'SCM_LAST_SCAN_TIME')
ON CONFLICT (correlation_condition_id) DO UPDATE 
    SET (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type)
        = (excluded.correlation_type, excluded.collection, excluded.comparison_candidate, excluded.macro_candidate, excluded."procedure", excluded.product_group, excluded.db_type);

INSERT INTO tb_correlation_condition (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES ('GENERAL', NULL, '>=, >, <=, <, =', '', 'sp_get_correlation_scm_compliance_scan_result_failed_detect_count(@comparison@, @values@::text[])', 'SCM', 'OLTP', 'SCM_COMPLIANCE_SCAN_RESULT_FAILED_DETECT_COUNT')
ON CONFLICT (correlation_condition_id) DO UPDATE 
    SET (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type)
        = (excluded.correlation_type, excluded.collection, excluded.comparison_candidate, excluded.macro_candidate, excluded."procedure", excluded.product_group, excluded.db_type);

INSERT INTO tb_correlation_condition (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES ('GENERAL', NULL, '>=, >, <=, <, =', '', 'sp_get_correlation_scm_compliance_scan_result_failed_item_detect_count(@comparison@, @values@::text[])', 'SCM', 'OLTP', 'SCM_COMPLIANCE_SCAN_RESULT_FAILED_ITEM_DETECT_COUNT')
ON CONFLICT (correlation_condition_id) DO UPDATE 
    SET (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type)
        = (excluded.correlation_type, excluded.collection, excluded.comparison_candidate, excluded.macro_candidate, excluded."procedure", excluded.product_group, excluded.db_type);

INSERT INTO tb_correlation_condition (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES ('GENERAL', NULL, '>=, >, <=, <, =', '', 'sp_get_correlation_scm_secret_scan_result_failed_detect_count(@comparison@, @values@::text[])', 'SCM', 'OLTP', 'SCM_SECRET_SCAN_RESULT_FAILED_DETECT_COUNT')
ON CONFLICT (correlation_condition_id) DO UPDATE 
    SET (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type)
        = (excluded.correlation_type, excluded.collection, excluded.comparison_candidate, excluded.macro_candidate, excluded."procedure", excluded.product_group, excluded.db_type);           

INSERT INTO tb_correlation_condition (correlation_type, collection, comparison_candidate, macro_candidate, "procedure", product_group, db_type, correlation_condition_id)
VALUES ('GENERAL', NULL, '', '', 'sp_get_correlation_node_failure(@comparison@, @values@::text[])', 'EMS', 'OLTP', 'NODE_FAILURE')
ON CONFLICT (correlation_condition_id) DO UPDATE SET procedure = EXCLUDED.procedure;


------------------------------------------------------------------------
select '## tb_group';
------------------------------------------------------------------------
DO $$
BEGIN
    IF NOT EXISTS ( SELECT 1 FROM tb_group WHERE group_type = 'TOP' ) THEN
        INSERT INTO tb_group (name, path, name_path, pgroup_id, group_type, is_removed, group_order) 
        VALUES ('최상위그룹', NULL, NULL, NULL, 'TOP', '0', 1);
    END IF;

    IF NOT EXISTS ( SELECT 1 FROM tb_group WHERE group_type = 'PHYSICAL' ) THEN
        INSERT INTO tb_group (name, path, name_path, pgroup_id, group_type, is_removed, group_order)
        VALUES ('%PHYSICAL_GROUP_NAME%', NULL, NULL, (SELECT group_id FROM tb_group WHERE group_type = 'TOP' LIMIT 1), 'PHYSICAL', false, 1);
    END IF;

    IF NOT EXISTS ( SELECT 1 FROM tb_group WHERE group_type = 'DEFAULT' ) THEN
        INSERT INTO tb_group (name, path, name_path, pgroup_id, group_type, is_removed, group_order) 
        VALUES ('%DEFAULT_GROUP_NAME%', NULL, NULL, (SELECT group_id FROM tb_group WHERE group_type = 'PHYSICAL' LIMIT 1), 'DEFAULT', '0', 1);
    END IF;

    IF NOT EXISTS ( SELECT 1 FROM tb_group WHERE group_type = 'GENERAL' and name = '%DEFAULT_RISK_GROUP_NAME%' ) THEN
        INSERT INTO tb_group (name, path, name_path, pgroup_id, group_type, is_removed, group_order) 
        VALUES ('%DEFAULT_RISK_GROUP_NAME%', NULL, NULL, (SELECT group_id FROM tb_group WHERE group_type = 'PHYSICAL' LIMIT 1), 'GENERAL', '0', 1);
    END IF;
END
$$ LANGUAGE 'plpgsql';


------------------------------------------------------------------------
select '## tb_manager_group';
------------------------------------------------------------------------
DO $$
BEGIN
    IF NOT EXISTS ( SELECT 1 FROM tb_manager_group WHERE group_id = 1 ) THEN
        INSERT INTO tb_manager_group (group_id, "name", description, node_group, view_able) 
        VALUES (1, '최상위 관리자 그룹', '기본생성 최상위 관리자 그룹', 1, false);
    END IF;
END
$$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------
select '## tb_policy';
------------------------------------------------------------------------
DO $$
BEGIN
    UPDATE
        tb_policy
    SET
        manager_group_id = 1
    WHERE
        policy_type = 'DEFAULT';
END
$$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------
select '## tb_log_config';
------------------------------------------------------------------------
INSERT INTO tb_log_config (log_type, send, product_group_type)
VALUES 
    ('AGENT_EVENT', '1', 'EMS'),
    ('SW_EVENT', '1', 'EMS'),
    ('HW_EVENT', '1', 'EMS'),
    ('V3_ALERT', '1', 'V3'),
    ('V3_SS', '1', 'V3'),
    ('V3_IS', '1', 'V3'),
    ('V3_DEVICE', '1', 'V3'),
    ('V3_QUAR', false, 'V3'),   -- CWPP-1587
    ('AC_AGENT_EVENT', '1', 'AC'),
    ('AC_EVENT', '1', 'AC'),
    ('AC_IM_EVENT', '1', 'AC'),
    ('HIPS_AGENT_EVENT', '1', 'HIPS'),
    ('HIPS_EVENT', '1', 'HIPS'),
    ('FW_EVENT', '1', 'HIPS'),
    ('V3_SUP', '1', 'V3'), --CWPP-1924
    ('SCM_AGENT', '1', 'SCM'),--CWPP-2200
    ('SCM_SCAN', '1', 'SCM') --CWPP-2200
ON CONFLICT(log_type) DO NOTHING;

------------------------------------------------------------------------
select '## tb_platform';
------------------------------------------------------------------------
INSERT INTO tb_platform (platform_id, name, is_server, description, major, minor, bit, platform_type, platform_group, is_supported, platform_pkg_group, release_id)
VALUES
    ('WINDOWS_VISTA', 'Windows Vista', 'false', 'Windows Vista', 6, 0, 32, 'WINDOWS', 'WINDOWS_VISTA', 'false', 'WINDOWS_VISTA', NULL)
    , ('WINDOWS_VISTA_ENTERPRISE', 'Windows Vista Enterprise', 'false', 'Windows Vista Enterprise', 6, 0, 32, 'WINDOWS', 'WINDOWS_VISTA', 'false', 'WINDOWS_VISTA', NULL)
    , ('WINDOWS_VISTA_HOME_BASIC', 'Windows Vista Home Basic', 'false', 'Windows Vista Home Basic', 6, 0, 32, 'WINDOWS', 'WINDOWS_VISTA', 'false', 'WINDOWS_VISTA', NULL)
    , ('WINDOWS_VISTA_HOME_PREMIUM', 'Windows Vista Home Premium', 'false', 'Windows Vista Home Premium', 6, 0, 32, 'WINDOWS', 'WINDOWS_VISTA', 'false', 'WINDOWS_VISTA', NULL)
    , ('WINDOWS_VISTA_ULTIMATE', 'Windows Vista Ultimate', 'false', 'Windows Vista Ultimate', 6, 0, 32, 'WINDOWS', 'WINDOWS_VISTA', 'false', 'WINDOWS_VISTA', NULL)
    , ('WINDOWS_VISTA_BUSINESS_X64', 'Windows Vista Business x64', 'false', 'Windows Vista Business x64', 6, 0, 64, 'WINDOWS', 'WINDOWS_VISTA', 'false', 'WINDOWS_VISTA_X64', NULL)
    , ('WINDOWS_VISTA_ENTERPRISE_X64', 'Windows Vista Enterprise x64', 'false', 'Windows Vista Enterprise x64', 6, 0, 64, 'WINDOWS', 'WINDOWS_VISTA', 'false', 'WINDOWS_VISTA_X64', NULL)
    , ('WINDOWS_VISTA_HOME_BASIC_X64', 'Windows Vista Home Basic x64', 'false', 'Windows Vista Home Basic x64', 6, 0, 64, 'WINDOWS', 'WINDOWS_VISTA', 'false', 'WINDOWS_VISTA_X64', NULL)
    , ('WINDOWS_VISTA_HOME_PREMIUM_X64', 'Windows Vista Home Premium x64', 'false', 'Windows Vista Home Premium x64', 6, 0, 64, 'WINDOWS', 'WINDOWS_VISTA', 'false', 'WINDOWS_VISTA_X64', NULL)
    , ('WINDOWS_VISTA_X64', 'Windows Vista x64', 'false', 'Windows Vista x64', 6, 0, 64, 'WINDOWS', 'WINDOWS_VISTA', 'false', 'WINDOWS_VISTA_X64', NULL)
    , ('WINDOWS_VISTA_ULTIMATE_X64', 'Windows Vista Ultimate x64', 'false', 'Windows Vista Ultimate x64', 6, 0, 64, 'WINDOWS', 'WINDOWS_VISTA', 'false', 'WINDOWS_VISTA_X64', NULL)
    , ('WINDOWS_VISTA_BUSINESS', 'Windows Vista Business x64', 'false', 'Windows Vista Business', 6, 0, 32, 'WINDOWS', 'WINDOWS_VISTA', 'false', 'WINDOWS_VISTA', NULL)
    , ('WINDOWS_7_X64', 'Windows 7 x64', 'false', 'Windows 7 x64', 6, 1, 64, 'WINDOWS', 'WINDOWS_7', 'false', 'WINDOWS_7_X64', NULL)
    , ('WINDOWS_7', 'Windows 7', 'false', 'Windows 7', 6, 1, 32, 'WINDOWS', 'WINDOWS_7', 'false', 'WINDOWS_7', NULL)
    , ('WINDOWS_7_HOME_PREMIUM', 'Windows 7 Home Premium', 'false', 'Windows 7 Home Premium', 6, 1, 32, 'WINDOWS', 'WINDOWS_7', 'false', 'WINDOWS_7', NULL)
    , ('WINDOWS_7_HOME_PREMIUM_X64', 'Windows 7 Home Premium x64', 'false', 'Windows 7 Home Premium x64', 6, 1, 64, 'WINDOWS', 'WINDOWS_7', 'false', 'WINDOWS_7_X64', NULL)
    , ('WINDOWS_7_ENTERPRISE', 'Windows 7 Enterprise', 'false', 'Windows 7 Enterprise', 6, 1, 32, 'WINDOWS', 'WINDOWS_7', 'false', 'WINDOWS_7', NULL)
    , ('WINDOWS_7_HOME_BASIC', 'Windows 7 Home Basic', 'false', 'Windows 7 Home Basic', 6, 1, 32, 'WINDOWS', 'WINDOWS_7', 'false', 'WINDOWS_7', NULL)
    , ('WINDOWS_7_PROFESSIONAL', 'WINDOWS_7_PROFESSIONAL', 'false', 'Windows 7 Professional', 6, 1, 32, 'WINDOWS', 'WINDOWS_7', 'false', 'WINDOWS_7', NULL)
    , ('WINDOWS_7_ULTIMATE', 'Windows 7 Ultimate', 'false', 'Windows 7 Ultimate', 6, 1, 32, 'WINDOWS', 'WINDOWS_7', 'false', 'WINDOWS_7', NULL)
    , ('WINDOWS_7_ENTERPRISE_X64', 'Windows 7 Enterprise x64', 'false', 'Windows 7 Enterprise x64', 6, 1, 64, 'WINDOWS', 'WINDOWS_7', 'false', 'WINDOWS_7_X64', NULL)
    , ('WINDOWS_7_HOME_BASIC_X64', 'Windows 7 Home Basic x64', 'false', 'Windows 7 Home Basic', 6, 1, 64, 'WINDOWS', 'WINDOWS_7', 'false', 'WINDOWS_7_X64', NULL)
    , ('WINDOWS_7_PROFESSIONAL_X64', 'Windows 7 Professional x64', 'false', 'Windows 7 Professional x64', 6, 1, 64, 'WINDOWS', 'WINDOWS_7', 'false', 'WINDOWS_7_X64', NULL)
    , ('WINDOWS_7_ULTIMATE_X64', 'Windows 7 Ultimate x64', 'false', 'Windows 7 Ultimate x64', 6, 1, 64, 'WINDOWS', 'WINDOWS_7', 'false', 'WINDOWS_7_X64', NULL)
    , ('WINDOWS_2000_PROFESSIONAL', 'Windows 2000 Professional', 'false', 'Windows 2000 Professional', 5, 0, 32, 'WINDOWS', 'WINDOWS_2000', 'false', 'WINDOWS_2000', NULL)
    , ('WINDOWS_2000_ADVANCED_SERVER', 'Windows 2000 Advanced Server', 'true', 'Windows 2000 Advanced Server', 5, 0, 32, 'WINDOWS', 'WINDOWS_2000', 'false', 'WINDOWS_2000', NULL)
    , ('WINDOWS_2000_SERVER', 'Windows 2000 Server', 'true', 'Windows 2000 Server', 5, 0, 32, 'WINDOWS', 'WINDOWS_2000', 'false', 'WINDOWS_2000', NULL)
    , ('WINDOWS_2000', 'Windows 2000', 'false', 'Windows 2000', 5, 0, 32, 'WINDOWS', 'WINDOWS_2000', 'false', 'WINDOWS_2000', NULL)
    , ('WINDOWS_8.1_X64', 'Windows 8.1 x64', 'false', 'Windows 8.1 x64', 6, 3, 64, 'WINDOWS', 'WINDOWS_8.1', 'false', 'WINDOWS_8.1_X64', NULL)
    , ('WINDOWS_8_ENTERPRISE_X64', 'Windows 8 Enterprise x64', 'false', 'Windows 8 Enterprise x64', 6, 2, 64, 'WINDOWS', 'WINDOWS_8', 'false', 'WINDOWS_8_X64', NULL)
    , ('WINDOWS_8_HOME_X64', 'Windows 8 Home x64', 'false', 'Windows 8.0 Home x64', 6, 2, 64, 'WINDOWS', 'WINDOWS_8', 'false', 'WINDOWS_8_X64', NULL)
    , ('WINDOWS_8_X64', 'Windows 8 x64', 'false', 'Windows 8 x64', 6, 2, 64, 'WINDOWS', 'WINDOWS_8', 'false', 'WINDOWS_8_X64', NULL)
    , ('WINDOWS_8_PROFESSIONAL_X64', 'Windows 8 Professional x64', 'false', 'Windows 8 Professional x64', 6, 2, 64, 'WINDOWS', 'WINDOWS_8', 'false', 'WINDOWS_8_X64', NULL)
    , ('WINDOWS_8_ENTERPRISE', 'Windows 8 Enterprise', 'false', 'Windows 8 Enterprise', 6, 2, 32, 'WINDOWS', 'WINDOWS_8', 'false', 'WINDOWS_8', NULL)
    , ('WINDOWS_8_HOME', 'Windows 8 Home', 'false', 'Windows 8.0 Home', 6, 2, 32, 'WINDOWS', 'WINDOWS_8', 'false', 'WINDOWS_8', NULL)
    , ('WINDOWS_8', 'Windows 8', 'false', 'Windows 8', 6, 2, 32, 'WINDOWS', 'WINDOWS_8', 'false', 'WINDOWS_8', NULL)
    , ('WINDOWS_8_PROFESSIONAL', 'Windows 8 Professional', 'false', 'Windows 8 Professional', 6, 2, 32, 'WINDOWS', 'WINDOWS_8', 'false', 'WINDOWS_8', NULL)
    , ('WINDOWS_8.1', 'Windows 8.1', 'false', 'Windows 8.1', 6, 3, 32, 'WINDOWS', 'WINDOWS_8.1', 'false', 'WINDOWS_8.1', NULL)
    , ('WINDOWS_8.1_PROFESSIONAL', 'Windows 8.1 Professional', 'false', 'Windows 8.1 Professional', 6, 3, 32, 'WINDOWS', 'WINDOWS_8.1', 'false', 'WINDOWS_8.1', NULL)
    , ('WINDOWS_8.1_ENTERPRISE', 'Windows 8.1 Enterprise', 'false', 'Windows 8.1 Enterprise', 6, 3, 32, 'WINDOWS', 'WINDOWS_8.1', 'false', 'WINDOWS_8.1', NULL)
    , ('WINDOWS_8.1_HOME', 'Windows 8.1 Home', 'false', 'Windows 8.1 Home', 6, 3, 32, 'WINDOWS', 'WINDOWS_8.1', 'false', 'WINDOWS_8.1', NULL)
    , ('WINDOWS_8.1_ENTERPRISE_X64', 'Windows 8.1 Enterprise x64', 'false', 'Windows 8.1 Enterprise x64', 6, 3, 64, 'WINDOWS', 'WINDOWS_8.1', 'false', 'WINDOWS_8.1_X64', NULL)
    , ('WINDOWS_8.1_HOME_X64', 'Windows 8.1 Home x64', 'false', 'Windows 8.1 Home x64', 6, 3, 64, 'WINDOWS', 'WINDOWS_8.1', 'false', 'WINDOWS_8.1_X64', NULL)
    , ('WINDOWS_8.1_PROFESSIONAL_X64', 'Windows 8.1 Professional x64', 'false', 'Windows 8.1 Professional x64', 6, 3, 64, 'WINDOWS', 'WINDOWS_8.1', 'false', 'WINDOWS_8.1_X64', NULL)
    , ('WINDOWS_98', 'Windows 98', 'false', 'Windows 98', 4, 10, 32, 'WINDOWS', 'WINDOWS_9X', 'false', 'WINDOWS_9X', NULL)
    , ('WINDOWS_98_SE', 'Windows 98 SE', 'false', 'Windows 98 SE', 4, 10, 32, 'WINDOWS', 'WINDOWS_9X', 'false', 'WINDOWS_9X', NULL)
    , ('WINDOWS_9X', 'Windows 9X', 'false', 'Windows 9X', 0, 0, 32, 'WINDOWS', 'WINDOWS_9X', 'false', 'WINDOWS_9X', NULL)
    , ('WINDOWS_ME', 'Windows ME', 'false', 'Windows ME', 4, 90, 32, 'WINDOWS', 'WINDOWS_9X', 'false', 'WINDOWS_9X', NULL)
    , ('WINDOWS_NT', 'Windows NT', 'false', 'Windows NT', 4, 0, 32, 'WINDOWS', 'WINDOWS_NT', 'false', 'WINDOWS_NT', NULL)
    , ('WINDOWS_NT_PROFESSIONAL', 'Windows NT Professional', 'false', 'Windows NT Professional', 4, 0, 32, 'WINDOWS', 'WINDOWS_NT', 'false', 'WINDOWS_NT', NULL)
    , ('WINDOWS_NT_WORKSTATION', 'Windows NT Workstation', 'false', 'Windows NT Workstation', 4, 0, 32, 'WINDOWS', 'WINDOWS_NT', 'false', 'WINDOWS_NT', NULL)
    , ('WINDOWS_NT_SERVER', 'Windows NT Server', 'true', 'Windows NT Server', 4, 0, 32, 'WINDOWS', 'WINDOWS_NT', 'false', 'WINDOWS_NT', NULL)
    , ('LINUX/UNIX', 'Linux/Unix', 'true', 'Linux/Unix', 0, 0, 0, 'LINUX_UNIX', 'LINUX/UNIX', 'true', 'LINUX/UNIX', NULL)
    , ('LINUX', 'Linux', 'true', 'Linux', 0, 0, 0, 'LINUX_UNIX', 'LINUX', 'true', 'LINUX', NULL)
    , ('UNIX', 'Unix', 'true', 'Unix', 0, 0, 0, 'LINUX_UNIX', 'UNIX', 'false', 'UNIX', NULL)
    , ('UNKNOWN_LINUX', 'Linux', 'true', 'Linux', 0, 0, 0, 'LINUX_UNIX', 'LINUX', 'true', 'LINUX', NULL)
    , ('MAC', 'Mac', 'false', 'Mac', 0, 0, 0, 'MAC', 'MAC', 'false', 'MAC', NULL)
    , ('UNKNOWN', 'Unknown', 'true', 'Unknown OS', 0, 0, 0, 'UNKNOWN', 'UNKNOWN', 'true', 'UNKNOWN', NULL)
    , ('WINDOWS_2003_ENTERPRISE_EDITION', 'Windows 2003 Enterprise Edition', 'true', 'Windows 2003 Enterprise Edition', 5, 2, 32, 'WINDOWS', 'WINDOWS_2003', 'true', 'WINDOWS_2003', NULL)
    , ('WINDOWS_2003_SERVER', 'Windows 2003 Server', 'true', 'Windows 2003 Server', 5, 2, 32, 'WINDOWS', 'WINDOWS_2003', 'true', 'WINDOWS_2003', NULL)
    , ('WINDOWS_2003_STANDARD_EDITION', 'Windows 2003 Standard Edition', 'true', 'Windows 2003 Standard Edition', 5, 2, 32, 'WINDOWS', 'WINDOWS_2003', 'true', 'WINDOWS_2003', NULL)
    , ('WINDOWS_2003_ENTERPRISE_EDITION_X64', 'Windows 2003 Enterprise Edition x64', 'true', 'Windows 2003 Enterprise Edition x64', 5, 2, 64, 'WINDOWS', 'WINDOWS_2003', 'true', 'WINDOWS_2003_X64', NULL)
    , ('WINDOWS_2003_STANDARD_EDITION_X64', 'Windows 2003 Standard Edition x64', 'true', 'Windows 2003 Standard Edition x64', 5, 2, 64, 'WINDOWS', 'WINDOWS_2003', 'true', 'WINDOWS_2003_X64', NULL)
    , ('WINDOWS_2003_SERVER_X64', 'Windows 2003 Server x64', 'true', 'Windows 2003 Server x64', 5, 2, 64, 'WINDOWS', 'WINDOWS_2003', 'true', 'WINDOWS_2003_X64', NULL)
    , ('WINDOWS_2003_X64', 'Windows 2003 x64', 'true', 'Windows 2003 x64', 5, 2, 64, 'WINDOWS', 'WINDOWS_2003', 'true', 'WINDOWS_2003_X64', NULL)
    , ('WINDOWS_2003', 'Windows 2003', 'true', 'Windows 2003', 5, 2, 32, 'WINDOWS', 'WINDOWS_2003', 'true', 'WINDOWS_2003', NULL)
    , ('WINDOWS_ALL', 'Windows All', 'true', 'Windows Al', 0, 0, 32, 'WINDOWS', 'WINDOWS_9X', 'false', 'WINDOWS_9X', NULL)
    , ('WINDOWS_NX', 'Windows Nx', 'true', 'Windows Nx', 0, 0, 32, 'WINDOWS', 'WINDOWS_9X', 'false', 'WINDOWS_9X', NULL)
    , ('WINDOWS_SERVER_2008', 'Windows Server 2008', 'true', 'Windows Server 2008', 6, 0, 32, 'WINDOWS', 'WINDOWS_SERVER_2008', 'true', 'WINDOWS_SERVER_2008', NULL)
    , ('WINDOWS_SERVER_2008_R2_(CORE)_X64', 'Windows Server 2008 R2 (core) x64', 'true', 'Windows Server 2008 R2 (core) x64', 6, 0, 64, 'WINDOWS', 'WINDOWS_SERVER_2008_R2_X64', 'true', 'WINDOWS_SERVER_2008_R2_X64', NULL)
    , ('WINDOWS_SERVER_2008_R2_WITHOUT_HYPER-V_(CORE)_X64', 'Windows Server 2008 R2 without Hyper-V (core) x64', '1', 'Windows Server 2008 R2 without Hyper-V (core) x64', 6, 0, 64, 'WINDOWS', 'WINDOWS_SERVER_2008_R2_X64', 'true', 'WINDOWS_SERVER_2008_R2_X64', NULL)
    , ('WINDOWS_SERVER_2008_R2_WITHOUT_HYPER-V_X64', 'Windows Server 2008 R2 without Hyper-V x64', 'true', 'Windows Server 2008 R2 without Hyper-V x64', 6, 0, 64, 'WINDOWS', 'WINDOWS_SERVER_2008_R2_X64', 'true', 'WINDOWS_SERVER_2008_R2_X64', NULL)
    , ('WINDOWS_SERVER_2008_SERVER', 'Windows Server 2008 Server', 'true', 'Windows Server 2008 Server', 6, 0, 32, 'WINDOWS', 'WINDOWS_SERVER_2008', 'true', 'WINDOWS_SERVER_2008', NULL)
    , ('WINDOWS_SERVER_2008_WITHOUT_HYPER-V', 'Windows Server 2008 without Hyper-V', 'true', 'Windows Server 2008 without Hyper-V', 6, 0, 32, 'WINDOWS', 'WINDOWS_SERVER_2008', 'true', 'WINDOWS_SERVER_2008', NULL)
    , ('WINDOWS_SERVER_2008_WITHOUT_HYPER-V_(CORE)', 'Windows Server 2008 without Hyper-V (core)', '1', 'Windows Server 2008 without Hyper-V (core)', 6, 0, 32, 'WINDOWS', 'WINDOWS_SERVER_2008', 'true', 'WINDOWS_SERVER_2008', NULL)
    , ('WINDOWS_SERVER_2008_WITHOUT_HYPER-V_X64', 'Windows Server 2008 without Hyper-V x64', 'true', 'Windows Server 2008 without Hyper-V x64', 6, 0, 64, 'WINDOWS', 'WINDOWS_SERVER_2008', 'true', 'WINDOWS_SERVER_2008_X64', NULL)
    , ('WINDOWS_SERVER_2008_X64', 'Windows Server 2008 x64', 'true', 'Windows Server 2008 x64', 6, 0, 64, 'WINDOWS', 'WINDOWS_SERVER_2008', 'true', 'WINDOWS_SERVER_2008_X64', NULL)
    , ('WINDOWS_SERVER_2008_(CORE)', 'Windows Server 2008 (core)', 'true', 'Windows Server 2008 (core)', 6, 0, 32, 'WINDOWS', 'WINDOWS_SERVER_2008', 'true', 'WINDOWS_SERVER_2008', NULL)
    , ('WINDOWS_SERVER_2008_WITHOUT_HYPER-V_(CORE)_X64', 'Windows Server 2008 without Hyper-V (core) x64', 'true', 'Windows Server 2008 without Hyper-V (core) x64', 6, 0, 64, 'WINDOWS', 'WINDOWS_SERVER_2008', 'true', 'WINDOWS_SERVER_2008_X64', NULL)
    , ('WINDOWS_SERVER_2008_R2_X64', 'Windows Server 2008 R2 x64', 'true', 'Windows Server 2008 R2 x64', 6, 1, 64, 'WINDOWS', 'WINDOWS_SERVER_2008_R2_X64', 'true', 'WINDOWS_SERVER_2008_R2_X64', NULL)
    , ('WINDOWS_SERVER_2008_(CORE)_X64', 'Windows Server 2008 (core) x64', 'true', 'Windows Server 2008 (core) x64', 6, 0, 64, 'WINDOWS', 'WINDOWS_SERVER_2008', 'true', 'WINDOWS_SERVER_2008_X64', NULL)
    , ('WINDOWS_WEB_SERVER_2008', 'Windows Web Server 2008', 'true', 'Windows Web Server 2008', 6, 0, 32, 'WINDOWS', 'WINDOWS_SERVER_2008', 'true', 'WINDOWS_SERVER_2008', NULL)
    , ('WINDOWS_WEB_SERVER_2008_(CORE)', 'Windows Web Server 2008 (core)', 'true', 'Windows Web Server 2008 (core)', 6, 0, 32, 'WINDOWS', 'WINDOWS_SERVER_2008', 'true', 'WINDOWS_SERVER_2008', NULL)
    , ('WINDOWS_WEB_SERVER_2008_(CORE)_X64', 'Windows Web Server 2008 (core) x64', 'true', 'Windows Web Server 2008 (core) x64', 6, 0, 64, 'WINDOWS', 'WINDOWS_SERVER_2008', 'true', 'WINDOWS_SERVER_2008_X64', NULL)
    , ('WINDOWS_WEB_SERVER_2008_R2_(CORE)_X64', 'Windows Web Server 2008 R2 (core) x64', 'true', 'Windows Web Server 2008 R2 (core) x64', 6, 0, 64, 'WINDOWS', 'WINDOWS_SERVER_2008', 'true', 'WINDOWS_SERVER_2008_X64', NULL)
    , ('WINDOWS_WEB_SERVER_2008_R2_X64', 'Windows Web Server 2008 R2 x64', 'true', 'Windows Web Server 2008 R2 x64', 6, 0, 64, 'WINDOWS', 'WINDOWS_SERVER_2008', 'true', 'WINDOWS_SERVER_2008_X64', NULL)
    , ('WINDOWS_WEB_SERVER_2008_X64', 'Windows Web Server 2008 x64', 'true', 'Windows Web Server 2008 x64', 6, 0, 64, 'WINDOWS', 'WINDOWS_SERVER_2008', 'true', 'WINDOWS_SERVER_2008_X64', NULL)
    , ('WINDOWS_SERVER_2012_X64', 'Windows Server 2012 x64', 'true', 'Windows Server 2012 x64', 6, 2, 64, 'WINDOWS', 'WINDOWS_SERVER_2012_X64', 'true', 'WINDOWS_SERVER_2012_X64', NULL)
    , ('WINDOWS_XP_SERVER_X64', 'Windows XP Server x64', 'true', 'Windows XP Server x64', 5, 2, 64, 'WINDOWS', 'WINDOWS_XP', 'false', 'WINDOWS_XP', NULL)
    , ('WINDOWS_XP_SERVER', 'Windows XP Server', 'true', 'Windows XP Server', 5, 1, 32, 'WINDOWS', 'WINDOWS_XP', 'false', 'WINDOWS_XP', NULL)
    , ('WINDOWS_XP_HOME_EDITION_X64', 'Windows XP Home Edition x64', 'false', 'Windows XP Home Edition x64', 5, 2, 64, 'WINDOWS', 'WINDOWS_XP', 'false', 'WINDOWS_XP_X64', NULL)
    , ('WINDOWS_XP_PROFESSIONAL_X64', 'Windows XP Professional x64', 'false', 'Windows XP Professional x64', 5, 2, 64, 'WINDOWS', 'WINDOWS_XP', 'false', 'WINDOWS_XP_X64', NULL)
    , ('WINDOWS_XP_ADVANCED_SERVER_X64', 'Windows XP Advanced Server x64', 'true', 'Windows XP Advanced Server x64', 5, 2, 64, 'WINDOWS', 'WINDOWS_XP', 'false', 'WINDOWS_XP', NULL)
    , ('WINDOWS_XP_ADVANCED_SERVER', 'Windows XP Advanced Serve', 'true', 'Windows XP Advanced Server', 5, 1, 32, 'WINDOWS', 'WINDOWS_XP', 'false', 'WINDOWS_XP', NULL)
    , ('WINDOWS_XP_X64', 'Windows XP x64', 'false', 'Windows XP x64', 5, 2, 64, 'WINDOWS', 'WINDOWS_XP', 'false', 'WINDOWS_XP_X64', NULL)
    , ('WINDOWS_XP', 'Windows XP', 'false', 'Windows XP', 5, 1, 32, 'WINDOWS', 'WINDOWS_XP', 'false', 'WINDOWS_XP', NULL)
    , ('WINDOWS_XP_HOME_EDITION', 'Windows XP Home Edition', 'false', 'Windows XP Home Edition', 5, 1, 32, 'WINDOWS', 'WINDOWS_XP', 'false', 'WINDOWS_XP', NULL)
    , ('WINDOWS_XP_PROFESSIONAL', 'Windows XP Professional', 'false', 'Windows XP Professional', 5, 1, 32, 'WINDOWS', 'WINDOWS_XP', 'false', 'WINDOWS_XP', NULL)
    , ('WINDOWS_10', 'Windows 10', 'false', 'Windows 10', 10, 0, 32, 'WINDOWS', 'WINDOWS_10', 'false', 'WINDOWS_10', NULL)
    , ('WINDOWS_10_EDUCATION', 'Windows 10 Education', 'false', 'Windows 10 Education', 10, 0, 32, 'WINDOWS', 'WINDOWS_10', 'false', 'WINDOWS_10', NULL)
    , ('WINDOWS_10_EDUCATION_X64', 'Windows 10 Education x64', 'false', 'Windows 10 Education x64', 10, 0, 64, 'WINDOWS', 'WINDOWS_10', 'false', 'WINDOWS_10_X64', NULL)
    , ('WINDOWS_10_ENTERPRISE_X64', 'Windows 10 Enterprise x64', 'false', 'Windows 10 Enterprise x64', 10, 0, 64, 'WINDOWS', 'WINDOWS_10', 'false', 'WINDOWS_10_X64', NULL)
    , ('WINDOWS_10_HOME_X64', 'Windows 10 Home x64', 'false', 'Windows 10 Home x64', 10, 0, 64, 'WINDOWS', 'WINDOWS_10', 'false', 'WINDOWS_10_X64', NULL)
    , ('WINDOWS_10_MOBILE_ENTERPRISE_X64', 'Windows 10 Mobile Enterprise x64', 'false', 'Windows 10 Mobile Enterprise x64', 10, 0, 64, 'WINDOWS', 'WINDOWS_10', 'false', 'WINDOWS_10_X64', NULL)
    , ('WINDOWS_10_MOBILE_X64', 'Windows 10 Mobile x64', 'false', 'Windows 10 Mobile x64', 10, 0, 64, 'WINDOWS', 'WINDOWS_10', 'false', 'WINDOWS_10_X64', NULL)
    , ('WINDOWS_10_PROFESSIONAL_X64', 'Windows 10 Professional x64', 'false', 'Windows 10 Professional x64', 10, 0, 64, 'WINDOWS', 'WINDOWS_10', 'false', 'WINDOWS_10_X64', NULL)
    , ('WINDOWS_10_X64', 'Windows 10 x64', 'false', 'Windows 10 x64', 10, 0, 64, 'WINDOWS', 'WINDOWS_10', 'false', 'WINDOWS_10_X64', NULL)
    , ('WINDOWS_10_ENTERPRISE', 'Windows 10 Enterprise', 'false', 'Windows 10 Enterprise', 10, 0, 32, 'WINDOWS', 'WINDOWS_10', 'false', 'WINDOWS_10', NULL)
    , ('WINDOWS_10_HOME', 'Windows 10 Home', 'false', 'Windows 10 Home', 10, 0, 32, 'WINDOWS', 'WINDOWS_10', 'false', 'WINDOWS_10', NULL)
    , ('WINDOWS_10_MOBILE', 'Windows 10 Mobile', 'false', 'Windows 10 Mobile', 10, 0, 32, 'WINDOWS', 'WINDOWS_10', 'false', 'WINDOWS_10', NULL)
    , ('WINDOWS_10_MOBILE_ENTERPRISE', 'Windows 10 Mobile Enterprise', 'false', 'Windows 10 Mobile Enterprise', 10, 0, 32, 'WINDOWS', 'WINDOWS_10', 'false', 'WINDOWS_10', NULL)
    , ('WINDOWS_10_PROFESSIONAL', 'Windows 10 Professional', 'false', 'Windows 10 Professional', 10, 0, 32, 'WINDOWS', 'WINDOWS_10', 'false', 'WINDOWS_10', NULL)
    , ('WINDOWS_95_OSR2', 'Windows 95 OSR2', 'false', 'Windows 95 OSR2', 0, 0, 32, 'WINDOWS', 'WINDOWS_9X', 'false', 'WINDOWS_9X', NULL)
    , ('WINDOWS_NT_ADVANCED_SERVER', 'Windows NT Advanced Server', 'true', 'Windows NT Advanced Server', 4, 0, 32, 'WINDOWS', 'WINDOWS_NT', 'false', 'WINDOWS_NT', NULL)
    , ('WINDOWS_SERVER_2012_DATACENTER_X64', 'Windows Server 2012 Datacenter x64', 'true', 'Windows Server 2012 x64', 6, 2, 64, 'WINDOWS', 'WINDOWS_SERVER_2012_X64', 'true', 'WINDOWS_SERVER_2012_X64', NULL)
    , ('WINDOWS_SERVER_2012_ESSENTIALS_X64', 'Windows Server 2012 Essentials x64', 'true', 'Windows Server 2012 x64', 6, 2, 64, 'WINDOWS', 'WINDOWS_SERVER_2012_X64', 'true', 'WINDOWS_SERVER_2012_X64', NULL)
    , ('WINDOWS_SERVER_2012_FOUNDATION_X64', 'Windows Server 2012 Foundation x64', 'true', 'Windows Server 2012 x64', 6, 2, 64, 'WINDOWS', 'WINDOWS_SERVER_2012_X64', 'true', 'WINDOWS_SERVER_2012_X64', NULL)
    , ('WINDOWS_SERVER_2012_R2_DATACENTER_X64', 'Windows Server 2012 R2 Datacenter x64', 'true', 'Windows Server 2012 x64', 6, 3, 64, 'WINDOWS', 'WINDOWS_SERVER_2012_R2_X64', 'true', 'WINDOWS_SERVER_2012_R2_X64', NULL)
    , ('WINDOWS_SERVER_2012_R2_ESSENTIALS_X64', 'Windows Server 2012 R2 Essentials x64', 'true', 'Windows Server 2012 x64', 6, 3, 64, 'WINDOWS', 'WINDOWS_SERVER_2012_R2_X64', 'true', 'WINDOWS_SERVER_2012_R2_X64', NULL)
    , ('WINDOWS_SERVER_2012_R2_FOUNDATION_X64', 'Windows Server 2012 R2 Foundation x64', 'true', 'Windows Server 2012 x64', 6, 3, 64, 'WINDOWS', 'WINDOWS_SERVER_2012_R2_X64', 'true', 'WINDOWS_SERVER_2012_R2_X64', NULL)
    , ('WINDOWS_SERVER_2012_R2_STANDARD_X64', 'Windows Server 2012 R2 Standard x64', 'true', 'Windows Server 2012 x64', 6, 3, 64, 'WINDOWS', 'WINDOWS_SERVER_2012_R2_X64', 'true', 'WINDOWS_SERVER_2012_R2_X64', NULL)
    , ('WINDOWS_SERVER_2012_R2_X64', 'Windows Server 2012 R2 x64', 'true', 'Windows Server 2012 x64', 6, 3, 64, 'WINDOWS', 'WINDOWS_SERVER_2012_R2_X64', 'true', 'WINDOWS_SERVER_2012_R2_X64', NULL)
    , ('WINDOWS_SERVER_2012_STANDARD_X64', 'Windows Server 2012 Standard x64', 'true', 'Windows Server 2012 x64', 6, 2, 64, 'WINDOWS', 'WINDOWS_SERVER_2012_X64', 'true', 'WINDOWS_SERVER_2012_X64', NULL)
    , ('WINDOWS_SERVER_2016_X64', 'Windows Server 2016 x64', 'true', 'Windows Server 2016 x64', 10, 0, 64, 'WINDOWS', 'WINDOWS_SERVER_2016_X64', 'true', 'WINDOWS_SERVER_2016_X64', 1607)
    , ('WINDOWS_SERVER_2019_X64', 'Windows Server 2019 x64', 'true', 'Windows Server 2019 x64', 10, 0, 64, 'WINDOWS', 'WINDOWS_SERVER_2019_X64', 'true', 'WINDOWS_SERVER_2019_X64', 1809)
    , ('WINDOWS_SERVER_2022_X64', 'Windows Server 2022 x64', 'true', 'Windows Server 2022', 10, 0, 64, 'WINDOWS', 'WINDOWS_SERVER_2022_X64', 'true', 'WINDOWS_SERVER_2022_X64', 1809)
    , ('WINDOWS_SERVER_2025_X64', 'Windows Server 2025 x64', 'true', 'Windows Server 2025', 10, 0, 64, 'WINDOWS', 'WINDOWS_SERVER_2025_X64', 'true', 'WINDOWS_SERVER_2025_X64', 2009)
    , ('AMAZONLINUX_1', 'Amazon Linux 1', 'true', 'Amazon Linux 1', 18, 3, 0, 'LINUX_UNIX', 'AMAZONLINUX_1', 'true', 'AMAZONLINUX_1', NULL)
    , ('AMAZONLINUX_2', 'Amazon Linux 2', 'true', 'Amazon Linux 2', 4, 14, 0, 'LINUX_UNIX', 'AMAZONLINUX_2', 'true', 'AMAZONLINUX_2', NULL)
    , ('AMAZONLINUX_2023', 'Amazon Linux 2023', 'true', 'Amazon Linux 2023', 23, 0, 0, 'LINUX_UNIX', 'AMAZONLINUX_2023', 'true', 'AMAZONLINUX_2023', NULL)
    , ('ASIALINUX_1', 'Asia Linux 1', 'true', 'Asia Linux 1', 1, 0, 0, 'LINUX_UNIX', 'ASIALINUX_1', 'false', 'ASIALINUX_1', NULL)
    , ('ASIALINUX_2', 'Asia Linux 2', 'true', 'Asia Linux 2', 2, 0, 0, 'LINUX_UNIX', 'ASIALINUX_2', 'false', 'ASIALINUX_2', NULL)
    , ('ASIALINUX_3', 'Asia Linux 3', 'true', 'Asia Linux 3', 3, 0, 0, 'LINUX_UNIX', 'ASIALINUX_3', 'false', 'ASIALINUX_3', NULL)
    , ('ASIALINUX_4', 'Asia Linux 4', 'true', 'Asia Linux 4', 4, 0, 0, 'LINUX_UNIX', 'ASIALINUX_4', 'false', 'ASIALINUX_4', NULL)
    , ('CENTOS_5', 'CentOS 5', 'true', 'CentOS 5', 5, 0, 0, 'LINUX_UNIX', 'CENTOS_5', 'true', 'CENTOS_5', NULL)
    , ('CENTOS_6', 'CentOS 6', 'true', 'CentOS 6', 6, 0, 0, 'LINUX_UNIX', 'CENTOS_6', 'true', 'CENTOS_6', NULL)
    , ('CENTOS_7', 'CentOS 7', 'true', 'CentOS 7', 7, 0, 0, 'LINUX_UNIX', 'CENTOS_7', 'true', 'CENTOS_7', NULL)
    , ('CENTOS_8', 'CentOS 8', 'true', 'CentOS 8', 8, 0, 0, 'LINUX_UNIX', 'CENTOS_8', 'true', 'CENTOS_8', NULL)
    , ('CENTOS_STREAM_8', 'CentOS Stream 8', 'true', 'CentOS Stream 8', 8, 0, 0, 'LINUX_UNIX', 'CENTOS_STREAM_8', 'true', 'CENTOS_STREAM_8', NULL)
    , ('CENTOS_STREAM_9', 'CentOS Stream 9', 'true', 'CentOS Stream 9', 9, 0, 0, 'LINUX_UNIX', 'CENTOS_STREAM_9', 'true', 'CENTOS_STREAM_9', NULL)
    , ('DEBIAN_9', 'Debian 9', 'true', 'Debian 9', 9, 0, 0, 'LINUX_UNIX', 'DEBIAN_9', 'true', 'DEBIAN_9', NULL)
    , ('DEBIAN_10', 'Debian 10', 'true', 'Debian 10', 10, 0, 0, 'LINUX_UNIX', 'DEBIAN_10', 'true', 'DEBIAN_10', NULL)
    , ('DEBIAN_11', 'Debian 11', 'true', 'Debian 11', 11, 0, 0, 'LINUX_UNIX', 'DEBIAN_11', 'true', 'DEBIAN_11', NULL)
    , ('DEBIAN_12', 'Debian 12', 'true', 'Debian 12', 12, 0, 0, 'LINUX_UNIX', 'DEBIAN_12', 'true', 'DEBIAN_12', NULL)
    , ('FEDORA_1', 'Fedora 1', 'true', 'Fedora 1', 1, 0, 0, 'LINUX_UNIX', 'FEDORA_1', 'false', 'FEDORA_1', NULL)
    , ('FEDORA_2', 'Fedora 2', 'true', 'Fedora 2', 2, 0, 0, 'LINUX_UNIX', 'FEDORA_2', 'false', 'FEDORA_2', NULL)
    , ('FEDORA_3', 'Fedora 3', 'true', 'Fedora 3', 3, 0, 0, 'LINUX_UNIX', 'FEDORA_3', 'false', 'FEDORA_3', NULL)
    , ('FEDORA_4', 'Fedora 4', 'true', 'Fedora 4', 4, 0, 0, 'LINUX_UNIX', 'FEDORA_4', 'false', 'FEDORA_4', NULL)
    , ('FEDORA_5', 'Fedora 5', 'true', 'Fedora 5', 5, 0, 0, 'LINUX_UNIX', 'FEDORA_5', 'false', 'FEDORA_5', NULL)
    , ('FEDORA_6', 'Fedora 6', 'true', 'Fedora 6', 6, 0, 0, 'LINUX_UNIX', 'FEDORA_6', 'false', 'FEDORA_6', NULL)
    , ('FEDORA_7', 'Fedora 7', 'true', 'Fedora 7', 7, 0, 0, 'LINUX_UNIX', 'FEDORA_7', 'false', 'FEDORA_7', NULL)
    , ('FEDORA_8', 'Fedora 8', 'true', 'Fedora 8', 8, 0, 0, 'LINUX_UNIX', 'FEDORA_8', 'false', 'FEDORA_8', NULL)
    , ('FEDORA_9', 'Fedora 9', 'true', 'Fedora 9', 9, 0, 0, 'LINUX_UNIX', 'FEDORA_9', 'false', 'FEDORA_9', NULL)
    , ('FEDORA_10', 'Fedora 10', 'true', 'Fedora 10', 10, 0, 0, 'LINUX_UNIX', 'FEDORA_10', 'false', 'FEDORA_10', NULL)
    , ('FEDORA_11', 'Fedora 11', 'true', 'Fedora 11', 11, 0, 0, 'LINUX_UNIX', 'FEDORA_11', 'false', 'FEDORA_11', NULL)
    , ('FEDORA_12', 'Fedora 12', 'true', 'Fedora 12', 12, 0, 0, 'LINUX_UNIX', 'FEDORA_12', 'false', 'FEDORA_12', NULL)
    , ('FEDORA_13', 'Fedora 13', 'true', 'Fedora 13', 13, 0, 0, 'LINUX_UNIX', 'FEDORA_13', 'false', 'FEDORA_14', NULL)
    , ('FEDORA_14', 'Fedora 14', 'true', 'Fedora 14', 14, 0, 0, 'LINUX_UNIX', 'FEDORA_14', 'false', 'FEDORA_14', NULL)
    , ('FEDORA_15', 'Fedora 15', 'true', 'Fedora 15', 15, 0, 0, 'LINUX_UNIX', 'FEDORA_15', 'false', 'FEDORA_15', NULL)
    , ('FEDORA_16', 'Fedora 16', 'true', 'Fedora 16', 16, 0, 0, 'LINUX_UNIX', 'FEDORA_16', 'false', 'FEDORA_16', NULL)
    , ('FEDORA_17', 'Fedora 17', 'true', 'Fedora 17', 17, 0, 0, 'LINUX_UNIX', 'FEDORA_17', 'false', 'FEDORA_17', NULL)
    , ('FEDORA_18', 'Fedora 18', 'true', 'Fedora 18', 18, 0, 0, 'LINUX_UNIX', 'FEDORA_18', 'false', 'FEDORA_18', NULL)
    , ('FEDORA_19', 'Fedora 19', 'true', 'Fedora 19', 19, 0, 0, 'LINUX_UNIX', 'FEDORA_19', 'false', 'FEDORA_19', NULL)
    , ('FEDORA_20', 'Fedora 20', 'true', 'Fedora 20', 20, 0, 0, 'LINUX_UNIX', 'FEDORA_20', 'false', 'FEDORA_20', NULL)
    , ('ORACLELINUX_5', 'Oracle Linux 5', 'true', 'Oracle Linux 5', 5, 0, 0, 'LINUX_UNIX', 'ORACLELINUX_5', 'false', 'ORACLELINUX_5', NULL)
    , ('ORACLELINUX_6', 'Oracle Linux 6', 'true', 'Oracle Linux 6', 6, 0, 0, 'LINUX_UNIX', 'ORACLELINUX_6', 'true', 'ORACLELINUX_6', NULL)
    , ('ORACLELINUX_7', 'Oracle Linux 7', 'true', 'Oracle Linux 7', 7, 0, 0, 'LINUX_UNIX', 'ORACLELINUX_7', 'true', 'ORACLELINUX_7', NULL)
    , ('ORACLELINUX_8', 'Oracle Linux 8', 'true', 'Oracle Linux 8', 8, 0, 0, 'LINUX_UNIX', 'ORACLELINUX_8', 'true', 'ORACLELINUX_8', NULL)
    , ('ORACLELINUX_9', 'Oracle Linux 9', 'true', 'Oracle Linux 9', 9, 0, 0, 'LINUX_UNIX', 'ORACLELINUX_9', 'true', 'ORACLELINUX_9', NULL)
    , ('REDHAT_9', 'RedHat 9', 'true', 'RedHat 9', 0, 0, 0, 'LINUX_UNIX', 'REDHAT_9', 'false', 'REDHAT_9', NULL)
    , ('RHEL_4', 'RedHat Enterprise Linux 4', 'true', 'RedHat Enterprise Linux 4', 4, 0, 0, 'LINUX_UNIX', 'RHEL_4', 'false', 'RHEL_4', NULL)
    , ('RHEL_5', 'RedHat Enterprise Linux 5', 'true', 'RedHat Enterprise Linux 5', 5, 0, 0, 'LINUX_UNIX', 'RHEL_5', 'true', 'RHEL_5', NULL)
    , ('RHEL_6', 'RedHat Enterprise Linux 6', 'true', 'RedHat Enterprise Linux 6', 6, 0, 0, 'LINUX_UNIX', 'RHEL_6', 'true', 'RHEL_6', NULL)
    , ('RHEL_7', 'RedHat Enterprise Linux 7', 'true', 'RedHat Enterprise Linux 7', 7, 0, 0, 'LINUX_UNIX', 'RHEL_7', 'true', 'RHEL_7', NULL)
    , ('RHEL_8', 'RedHat Enterprise Linux 8', 'true', 'RedHat Enterprise Linux 8', 8, 0, 0, 'LINUX_UNIX', 'RHEL_8', 'true', 'RHEL_8', NULL)
    , ('RHEL_9', 'RedHat Enterprise Linux 9', 'true', 'RedHat Enterprise Linux 9', 9, 0, 0, 'LINUX_UNIX', 'RHEL_9', 'true', 'RHEL_9', NULL)
    , ('ROCKY_8', 'Rocky Linux 8', 'true', 'Rocky Linux 8', 8, 0, 0, 'LINUX_UNIX', 'ROCKY_8', 'true', 'ROCKY_8', NULL)
    , ('ROCKY_9', 'Rocky Linux 9', 'true', 'Rocky Linux 9', 9, 0, 0, 'LINUX_UNIX', 'ROCKY_9', 'true', 'ROCKY_9', NULL)
    , ('SUSE_12', 'SUSE Linux Enterprise Server 12', 'true', 'SUSE Linux Enterprise Server 12', 12, 0, 0, 'LINUX_UNIX', 'SUSE_12', 'true', 'SUSE_12', NULL)
    , ('SUSE_15', 'SUSE Linux Enterprise Server 15', 'true', 'SUSE Linux Enterprise Server 15', 15, 0, 0, 'LINUX_UNIX', 'SUSE_15', 'true', 'SUSE_15', NULL)
    , ('UBUNTU_8', 'Ubuntu 8', 'true', 'Ubuntu 8', 8, 0, 0, 'LINUX_UNIX', 'UBUNTU_8', 'false', 'UBUNTU_8', NULL)
    , ('UBUNTU_9', 'Ubuntu 9', 'true', 'Ubuntu 9', 9, 0, 0, 'LINUX_UNIX', 'UBUNTU_9', 'false', 'UBUNTU_9', NULL)
    , ('UBUNTU_10', 'Ubuntu 10', 'true', 'Ubuntu 10', 10, 0, 0, 'LINUX_UNIX', 'UBUNTU_10', 'false', 'UBUNTU_10', NULL)
    , ('UBUNTU_11', 'Ubuntu 11', 'true', 'Ubuntu 11', 11, 0, 0, 'LINUX_UNIX', 'UBUNTU_11', 'false', 'UBUNTU_11', NULL)
    , ('UBUNTU_12', 'Ubuntu 12', 'true', 'Ubuntu 12', 12, 0, 0, 'LINUX_UNIX', 'UBUNTU_12', 'false', 'UBUNTU_12', NULL)
    , ('UBUNTU_13', 'Ubuntu 13', 'true', 'Ubuntu 13', 13, 0, 0, 'LINUX_UNIX', 'UBUNTU_13', 'false', 'UBUNTU_13', NULL)
    , ('UBUNTU_14', 'Ubuntu 14', 'true', 'Ubuntu 14', 14, 0, 0, 'LINUX_UNIX', 'UBUNTU_14', 'true', 'UBUNTU_14', NULL)
    , ('UBUNTU_15', 'Ubuntu 15', 'true', 'Ubuntu 15', 15, 0, 0, 'LINUX_UNIX', 'UBUNTU_15', 'false', 'UBUNTU_15', NULL)
    , ('UBUNTU_16', 'Ubuntu 16', 'true', 'Ubuntu 16', 16, 0, 0, 'LINUX_UNIX', 'UBUNTU_16', 'true', 'UBUNTU_16', NULL)
    , ('UBUNTU_17', 'Ubuntu 17', 'true', 'Ubuntu 17', 17, 0, 0, 'LINUX_UNIX', 'UBUNTU_17', 'false', 'UBUNTU_17', NULL)
    , ('UBUNTU_18', 'Ubuntu 18', 'true', 'Ubuntu 18', 18, 0, 0, 'LINUX_UNIX', 'UBUNTU_18', 'true', 'UBUNTU_18', NULL)
    , ('UBUNTU_19', 'Ubuntu 19', 'true', 'Ubuntu 19', 19, 0, 0, 'LINUX_UNIX', 'UBUNTU_19', 'false', 'UBUNTU_19', NULL)
    , ('UBUNTU_20', 'Ubuntu 20', 'true', 'Ubuntu 20', 20, 0, 0, 'LINUX_UNIX', 'UBUNTU_20', 'true', 'UBUNTU_20', NULL)
    , ('UBUNTU_22', 'Ubuntu 22', 'true', 'Ubuntu 22', 22, 0, 0, 'LINUX_UNIX', 'UBUNTU_22', 'true', 'UBUNTU_22', NULL)
    , ('UBUNTU_24', 'Ubuntu 24', 'true', 'Ubuntu 24', 24, 0, 0, 'LINUX_UNIX', 'UBUNTU_24', 'true', 'UBUNTU_24', NULL)
    , ('ALMALINUX_8', 'AlmaLinux 8', 'true', 'AlmaLinux 8', 8, 0, 0, 'LINUX_UNIX', 'ALMALINUX_8', 'true', 'ALMALINUX_8', NULL)
    , ('ALMALINUX_9', 'AlmaLinux 9', 'true', 'AlmaLinux 9', 9, 0, 0, 'LINUX_UNIX', 'ALMALINUX_9', 'true', 'ALMALINUX_9', NULL)
    , ('WINDOWS_SERVER_SAC', 'Windows Server (SAC)', 'true', 'Windows Server (SAC)', 10, 0, 64, 'WINDOWS', 'WINDOWS_SERVER_SAC', 'true', 'WINDOWS_SERVER_SAC', NULL)
    , ('UNKNOWN_EXTERNAL', 'Unknown External', 'true', 'Unknown External OS', 0, 0, 0, 'UNKNOWN_EXTERNAL', 'UNKNOWN_EXTERNAL', 'true', 'UNKNOWN_EXTERNAL', NULL)
    , ('ALIBABACLOUD_2', 'Alibaba Cloud Linux 2', 'true', 'Alibaba Cloud Linux 2', 2, 0, 64, 'LINUX_UNIX', 'ALIBABACLOUD_2', 'true', 'ALIBABACLOUD_2', null)
    , ('ALIBABACLOUD_3', 'Alibaba Cloud Linux 3', 'true', 'Alibaba Cloud Linux 3', 3, 0, 64, 'LINUX_UNIX', 'ALIBABACLOUD_3', 'true', 'ALIBABACLOUD_3', null)
    , ('RHEL_10', 'RedHat Enterprise Linux 10', 'true', 'RedHat Enterprise Linux 10', 10, 0, 0, 'LINUX_UNIX', 'RHEL_10', 'true', 'RHEL_10', NULL)
    , ('ROCKY_10', 'Rocky Linux 10', 'true', 'Rocky Linux 10', 10, 0, 0, 'LINUX_UNIX', 'ROCKY_10', 'true', 'ROCKY_10', NULL)
    , ('ORACLELINUX_10', 'Oracle Linux 10', 'true', 'Oracle Linux 10', 10, 0, 0, 'LINUX_UNIX', 'ORACLELINUX_10', 'true', 'ORACLELINUX_10', NULL)
    , ('CENTOS_STREAM_10', 'CentOS Stream 10', 'true', 'CentOS Stream 10', 10, 0, 0, 'LINUX_UNIX', 'CENTOS_STREAM_10', 'true', 'CENTOS_STREAM_10', NULL)
    , ('ALMALINUX_10', 'AlmaLinux 10', 'true', 'AlmaLinux 10', 10, 0, 0, 'LINUX_UNIX', 'ALMALINUX_10', 'true', 'ALMALINUX_10', NULL)
    , ('UBUNTU_26', 'Ubuntu 26', 'true', 'Ubuntu 26', 26, 0, 0, 'LINUX_UNIX', 'UBUNTU_26', 'true', 'UBUNTU_26', NULL)
ON CONFLICT (platform_id) DO UPDATE 
    SET (name, is_server, description, major, minor, bit, platform_type, platform_group, is_supported, platform_pkg_group, release_id) = 
        (EXCLUDED.name, EXCLUDED.is_server, EXCLUDED.description, EXCLUDED.major, EXCLUDED.minor, EXCLUDED.bit, EXCLUDED.platform_type, EXCLUDED.platform_group, EXCLUDED.is_supported, EXCLUDED.platform_pkg_group, EXCLUDED.release_id);

------------------------------------------------------------------------
select '## tb_container_platform';
------------------------------------------------------------------------
INSERT INTO tb_container_platform (container_service_type, is_amc_supported, is_hips_supported, is_ac_supported)
VALUES
    ('SELF_MANAGED_K8S', TRUE, TRUE, TRUE)
    , ('AWS_EKS', TRUE, TRUE, TRUE)
    , ('ALIBABA_ACK', TRUE, TRUE, TRUE)
    , ('AWS_EKS_SERVERLESS', FALSE, TRUE, TRUE)
    , ('AWS_ECS', FALSE, TRUE, TRUE)
    , ('ALIBABA_ACK_SERVERLESS', FALSE, TRUE, TRUE)
    , ('ALIBABA_ECI', FALSE, TRUE, TRUE)
    , ('NAVER_CLOUD_NKS', TRUE, TRUE, TRUE)
	, ('NHN_CLOUD_K8S', TRUE, TRUE, TRUE)
	, ('KAKAO_CLOUD_K8S', TRUE, TRUE, TRUE)
	, ('GCP_GKE_STANDARD', TRUE, TRUE, TRUE)
	, ('AZURE_AKS', TRUE, TRUE, TRUE)
    , ('GCP_GKE_AUTOPILOT', FALSE, TRUE, FALSE)
    , ('OKD4_K8S', TRUE, TRUE, TRUE)
    , ('OPENSHIFT_K8S', TRUE, TRUE, TRUE)

ON CONFLICT (container_service_type) DO UPDATE 
    SET (is_amc_supported, is_hips_supported, is_ac_supported) = 
        (EXCLUDED.is_amc_supported, EXCLUDED.is_hips_supported, EXCLUDED.is_ac_supported);
------------------------------------------------------------------------
select '## tb_product';
------------------------------------------------------------------------
INSERT INTO tb_product (
    product_id, name, description, product_group, is_server_product, is_client_product, managed, is_manageable, is_default, product_code, license_id, is_upload_event_log, platform_support)
VALUES
    ('EMS', 'AhnLab EPP Management', 'EPPM', 'EMS', true, true, true, true, true, 0, '', false, '{}')
    , ('AGENT', 'AhnLab Security Agent', 'AhnLab Security Agent', 'EMS', false, true, true, true, true, 6062, '1', true, '{WINDOWS,LINUX_UNIX,MAC}')
    , ('V3NET_9.0', 'V3 Net 9.0', 'V3 Net 9.0', 'V3', true, false, true, true, true, 8020, '703', true, '{WINDOWS}')
    , ('V3NET_LU', 'V3 Net for Linux Server', 'V3 Net for Unix/Linux Server', 'V3', true, false, true, true, true, 302033, '', true, '{LINUX_UNIX}')
    , ('AC_CLIENT', 'AhnLab Application Control', 'AhnLab Application Control', 'AC', true, false, true, true, true, 0, '', true, '{WINDOWS,LINUX_UNIX}')
    , ('HIPS_CLIENT', 'AhnLab Host IPS', 'AhnLab Host IPS', 'HIPS', true, false, true, true, true, 0, '', true, '{WINDOWS,LINUX_UNIX}')
    , ('SCM_CLIENT', 'AhnLab Security Configuration Management', 'AhnLab Security Configuration Management', 'SCM', true, false, true, true, true, NULL, NULL, true, '{WINDOWS,LINUX_UNIX}')
    , ('CNAPP', 'AhnLab Container Security', 'AhnLab Container Security', 'CNAPP', true, false, true, true, true, 0, '', true, '{LINUX_UNIX}')
    , ('AMC_CLIENT', 'Anti-Malware for Container', 'Anti-Malware for Container', 'V3', true, false, true, true, true, 316011, '', true, '{LINUX_UNIX}')
ON CONFLICT (product_id) DO
UPDATE SET
    name = EXCLUDED.name
    , description =  EXCLUDED.description
    , product_group = EXCLUDED.product_group
    , is_server_product = EXCLUDED.is_server_product
    , is_client_product = EXCLUDED.is_client_product
    , managed = EXCLUDED.managed
    , is_manageable = EXCLUDED.is_manageable
    , is_default = EXCLUDED.is_default
    , product_code = EXCLUDED.product_code
    , license_id = EXCLUDED.license_id
    , is_upload_event_log = EXCLUDED.is_upload_event_log
    , platform_support = EXCLUDED.platform_support;

------------------------------------------------------------------------
select '## tb_product_feature';
------------------------------------------------------------------------
INSERT INTO tb_product_feature(product_feature_id, name)
VALUES
    ('AGENT_MGMT', 'Agent Management')
    , ('V3NET_9.0_AV', 'V3 Net 9.0 AV')
    , ('V3NET_LU_AV', 'V3 Linux AV')
    , ('V3NET_LU_UPDATE', 'V3 Linux Update')
    , ('AC_AGENT', 'AC Agent')
    , ('AC_MGMT', 'AC Management')
    , ('HIPS_AGENT', 'HIPS Agent')
    , ('HIPS_MGMT', 'HIPS Management')
    , ('HIPS_FW', 'HIPS FW')
    , ('IM_MGMT', 'IM Management')
    , ('SCM_AGENT', 'AhnLab SCM Agent')
    , ('SCM_MGMT', 'AhnLab SCM Management')
    , ('AMC_MGMT', 'Anti-Malware for Container')
ON CONFLICT(product_feature_id) DO UPDATE SET name = excluded.name;

------------------------------------------------------------------------
select '## tb_product_feature_map';
------------------------------------------------------------------------
INSERT INTO tb_product_feature_map(product_feature_id, product_id)
VALUES 
    ('V3NET_LU_UPDATE', 'V3NET_LU')
    , ('V3NET_LU_AV', 'V3NET_LU')
    , ('V3NET_9.0_AV', 'V3NET_9.0')
    , ('AGENT_MGMT', 'AGENT')
    , ('AC_AGENT', 'AC_CLIENT')
    , ('AC_MGMT', 'AC_CLIENT')
    , ('HIPS_AGENT', 'HIPS_CLIENT')
    , ('HIPS_MGMT', 'HIPS_CLIENT')
    , ('HIPS_FW', 'HIPS_CLIENT')
    , ('IM_MGMT', 'AC_CLIENT')
    , ('SCM_AGENT', 'SCM_CLIENT')
    , ('SCM_MGMT', 'SCM_CLIENT')
    , ('AMC_MGMT', 'AMC_CLIENT')
ON CONFLICT(product_feature_id, product_id) DO NOTHING;

------------------------------------------------------------------------
select '## tb_privilege_profile';
------------------------------------------------------------------------
DO $$
BEGIN
    IF NOT EXISTS ( SELECT 1 FROM tb_privilege_profile WHERE profile_type = 'ROOT_ADMIN' ) THEN
        INSERT INTO tb_privilege_profile(profile_name, profile_type, description, modified_time, profile_body)
        VALUES
        (
            '서버 관리자', 'ROOT_ADMIN', 'ROOT_ADMIN', CURRENT_TIMESTAMP, 
            '["/dashboard","/detection","/management/domain","/management/product","/management/software","/management/patch","/management/distribution","/management/privacy","/management/survey","/response/domain","/response/schedule","/response/report","/response/file","/response/on_demand","/policy","/policy/policy_SA_R","/policy/policy_SA_W","/policy/policy_V3W_R","/policy/policy_V3W_W","/policy/policy_V3L_R","/policy/policy_V3L_W","/policy/policy_HIPS_A_R","/policy/policy_HIPS_A_W","/policy/policy_HIPS_IPS_R","/policy/policy_HIPS_IPS_W","/policy/policy_HIPS_FW_R","/policy/policy_HIPS_FW_W","/policy/policy_AC_A_R","/policy/policy_AC_A_W","/policy/policy_AC_PC_R","/policy/policy_AC_PC_W","/policy/policy_AC_IM_R","/policy/policy_AC_IM_W","/policy/policy_AMC_R","/policy/policy_AMC_W","/correlation","/report","/report/query","/eventlog","/config/domain","/config/general","/config/general/metering","/config/admin","/config/admin_group","/config/license","/command/config_domain","/command/config_general","/command/config_admin","/command/update_engine","/command/update_server","/command/update_patchlab","/command/integrity","/command/db_backup","/command/db_clean","/command/import_userinfo","/command/serverreport","/command/update_product","/command/policy","/command/agent_command","/command/share_folder","/command/asset_command","/command/v3_scan","/command/v3_stop_scan","/command/cancel_scheduled_scan","/command/v3_optimize","/command/artifact","/command/ahnreport","/command/kill_process","/command/suspicious_file","/command/uninstall_agent","/command/uninstall_product","/command/deploy_product","/command/distribution","/command/hips_signature_recommandation","/command/hips_signature_setting","/command/ac_initializing_whitelist","/command/im_rulecheck","/command/im_reqlog","/command/update_ips","/command/v3_quarantine_lookup","/command/v3_remove_emergency_off","/management/signature","/management/ac","/management/scm","/command/scm_check","/command/scm_check_cancel","/command/v3_reset_scan_cache","/command/hips_on_off","/command/ac_on_off","/command/am_on_off","/command/hips_ssl_inspection","/security","/security/topology","/security/img_scan","/security/config_cluster","/security/config_img","/security/img_reg_scan","/command/v3_collect_fel","/command/am_file_io_analyze_sync","/command/am_file_io_analyze_reset"]'
        );
    ELSE
        UPDATE tb_privilege_profile 
        SET 
            profile_body = '["/dashboard","/detection","/management/domain","/management/product","/management/software","/management/patch","/management/distribution","/management/privacy","/management/survey","/response/domain","/response/schedule","/response/report","/response/file","/response/on_demand","/policy","/policy/policy_SA_R","/policy/policy_SA_W","/policy/policy_V3W_R","/policy/policy_V3W_W","/policy/policy_V3L_R","/policy/policy_V3L_W","/policy/policy_HIPS_A_R","/policy/policy_HIPS_A_W","/policy/policy_HIPS_IPS_R","/policy/policy_HIPS_IPS_W","/policy/policy_HIPS_FW_R","/policy/policy_HIPS_FW_W","/policy/policy_AC_A_R","/policy/policy_AC_A_W","/policy/policy_AC_PC_R","/policy/policy_AC_PC_W","/policy/policy_AC_IM_R","/policy/policy_AC_IM_W","/policy/policy_AMC_R","/policy/policy_AMC_W","/correlation","/report","/report/query","/eventlog","/config/domain","/config/general","/config/general/metering","/config/admin","/config/admin_group","/config/license","/command/config_domain","/command/config_general","/command/config_admin","/command/update_engine","/command/update_server","/command/update_patchlab","/command/integrity","/command/db_backup","/command/db_clean","/command/import_userinfo","/command/serverreport","/command/update_product","/command/policy","/command/agent_command","/command/share_folder","/command/asset_command","/command/v3_scan","/command/v3_stop_scan","/command/cancel_scheduled_scan","/command/v3_optimize","/command/artifact","/command/ahnreport","/command/kill_process","/command/suspicious_file","/command/uninstall_agent","/command/uninstall_product","/command/deploy_product","/command/distribution","/command/hips_signature_recommandation","/command/hips_signature_setting","/command/ac_initializing_whitelist","/command/im_rulecheck","/command/im_reqlog","/command/update_ips","/command/v3_quarantine_lookup","/command/v3_remove_emergency_off","/management/signature","/management/ac","/management/scm","/command/scm_check","/command/scm_check_cancel","/command/v3_reset_scan_cache","/command/hips_on_off","/command/ac_on_off","/command/am_on_off","/command/hips_ssl_inspection","/security","/security/topology","/security/img_scan","/security/config_cluster","/security/config_img","/security/img_reg_scan","/command/v3_collect_fel","/command/am_file_io_analyze_sync","/command/am_file_io_analyze_reset"]'
            , modified_time = CURRENT_TIMESTAMP
        WHERE profile_type = 'ROOT_ADMIN';
    END IF;

    IF NOT EXISTS ( SELECT 1 FROM tb_privilege_profile WHERE profile_type = 'TEMP_ADMIN' ) THEN
        INSERT INTO tb_privilege_profile(profile_name, profile_type, description, modified_time, profile_body)
        VALUES
        (
            '초기 사용자', 'TEMP_ADMIN', 'TEMP_ADMIN', CURRENT_TIMESTAMP, 
            '["/dashboard","/detection","/management/domain","/management/product","/management/software","/management/patch","/management/distribution","/management/privacy","/management/survey","/response/domain","/response/schedule","/response/report","/response/file","/response/on_demand","/policy","/policy/policy_SA_R","/policy/policy_SA_W","/policy/policy_V3W_R","/policy/policy_V3W_W","/policy/policy_V3L_R","/policy/policy_V3L_W","/policy/policy_HIPS_A_R","/policy/policy_HIPS_A_W","/policy/policy_HIPS_IPS_R","/policy/policy_HIPS_IPS_W","/policy/policy_HIPS_FW_R","/policy/policy_HIPS_FW_W","/policy/policy_AC_A_R","/policy/policy_AC_A_W","/policy/policy_AC_PC_R","/policy/policy_AC_PC_W","/policy/policy_AC_IM_R","/policy/policy_AC_IM_W","/policy/policy_AMC_R","/policy/policy_AMC_W","/correlation","/report","/report/query","/eventlog","/config/domain","/config/general","/config/admin","/config/license","/command/config_domain","/command/config_general","/command/config_admin","/command/update_engine","/command/update_server","/command/update_patchlab","/command/integrity","/command/db_backup","/command/db_clean","/command/import_userinfo","/command/serverreport","/command/update_product","/command/policy","/command/agent_command","/command/share_folder","/command/asset_command","/command/v3_scan","/command/v3_stop_scan","/command/cancel_scheduled_scan","/command/v3_optimize","/command/artifact","/command/ahnreport","/command/kill_process","/command/suspicious_file","/command/uninstall_agent","/command/uninstall_product","/command/deploy_product","/command/distribution","/command/hips_signature_recommandation","/command/hips_signature_setting","/command/ac_initializing_whitelist","/command/im_rulecheck","/command/im_reqlog","/command/update_ips","/command/v3_quarantine_lookup","/command/v3_remove_emergency_off","/management/signature","/management/ac","/management/scm","/command/scm_check","/command/scm_check_cancel","/command/v3_reset_scan_cache","/command/hips_on_off","/command/ac_on_off","/command/am_on_off","/command/hips_ssl_inspection","/security","/security/topology","/security/img_scan","/security/config_cluster","/security/config_img","/security/img_reg_scan","/command/v3_collect_fel","/command/am_file_io_analyze_sync","/command/am_file_io_analyze_reset"]'
        );
    ELSE
        UPDATE tb_privilege_profile 
        SET 
            profile_body = '["/dashboard","/detection","/management/domain","/management/product","/management/software","/management/patch","/management/distribution","/management/privacy","/management/survey","/response/domain","/response/schedule","/response/report","/response/file","/response/on_demand","/policy","/policy/policy_SA_R","/policy/policy_SA_W","/policy/policy_V3W_R","/policy/policy_V3W_W","/policy/policy_V3L_R","/policy/policy_V3L_W","/policy/policy_HIPS_A_R","/policy/policy_HIPS_A_W","/policy/policy_HIPS_IPS_R","/policy/policy_HIPS_IPS_W","/policy/policy_HIPS_FW_R","/policy/policy_HIPS_FW_W","/policy/policy_AC_A_R","/policy/policy_AC_A_W","/policy/policy_AC_PC_R","/policy/policy_AC_PC_W","/policy/policy_AC_IM_R","/policy/policy_AMC_R","/policy/policy_AMC_W","/policy/policy_AC_IM_W","/correlation","/report","/report/query","/eventlog","/config/domain","/config/general","/config/admin","/config/license","/command/config_domain","/command/config_general","/command/config_admin","/command/update_engine","/command/update_server","/command/update_patchlab","/command/integrity","/command/db_backup","/command/db_clean","/command/import_userinfo","/command/serverreport","/command/update_product","/command/policy","/command/agent_command","/command/share_folder","/command/asset_command","/command/v3_scan","/command/v3_stop_scan","/command/cancel_scheduled_scan","/command/v3_optimize","/command/artifact","/command/ahnreport","/command/kill_process","/command/suspicious_file","/command/uninstall_agent","/command/uninstall_product","/command/deploy_product","/command/distribution","/command/hips_signature_recommandation","/command/hips_signature_setting","/command/ac_initializing_whitelist","/command/im_rulecheck","/command/im_reqlog","/command/update_ips","/command/v3_quarantine_lookup","/command/v3_remove_emergency_off","/management/signature","/management/ac","/management/scm","/command/scm_check","/command/scm_check_cancel","/command/v3_reset_scan_cache","/command/hips_on_off","/command/ac_on_off","/command/am_on_off","/command/hips_ssl_inspection","/security","/security/topology","/security/img_scan","/security/config_cluster","/security/config_img","/security/img_reg_scan","/command/v3_collect_fel","/command/am_file_io_analyze_sync","/command/am_file_io_analyze_reset"]'
            , modified_time = CURRENT_TIMESTAMP
        WHERE profile_type = 'TEMP_ADMIN';
    END IF;

    IF NOT EXISTS ( SELECT 1 FROM tb_privilege_profile WHERE profile_type = 'POLICY_ADMIN' ) THEN
        INSERT INTO tb_privilege_profile(profile_name, profile_type, description, modified_time, profile_body)
        VALUES
        (
            '정책 관리자', 'POLICY_ADMIN', 'POLICY_ADMIN', CURRENT_TIMESTAMP, 
            '["/management/domain","/management/product","/management/software","/management/patch","/management/distribution","/management/privacy","/management/survey","/response/domain","/response/schedule","/response/report","/response/file","/response/on_demand","/policy","/policy/policy_SA_R","/policy/policy_SA_W","/policy/policy_V3W_R","/policy/policy_V3W_W","/policy/policy_V3L_R","/policy/policy_V3L_W","/policy/policy_HIPS_A_R","/policy/policy_HIPS_A_W","/policy/policy_HIPS_IPS_R","/policy/policy_HIPS_IPS_W","/policy/policy_HIPS_FW_R","/policy/policy_HIPS_FW_W","/policy/policy_AC_A_R","/policy/policy_AC_A_W","/policy/policy_AC_PC_R","/policy/policy_AC_PC_W","/policy/policy_AC_IM_R","/policy/policy_AC_IM_W","/policy/policy_AMC_R","/policy/policy_AMC_W","/correlation","/command/update_product","/command/policy","/command/agent_command","/command/share_folder","/command/asset_command","/command/v3_scan","/command/v3_stop_scan","/command/cancel_scheduled_scan","/command/v3_optimize","/command/artifact","/command/ahnreport","/command/kill_process","/command/suspicious_file","/command/uninstall_agent","/command/uninstall_product","/command/deploy_product","/command/hips_signature_recommandation","/command/hips_signature_setting","/command/ac_initializing_whitelist","/command/im_rulecheck","/command/im_reqlog","/command/update_ips","/command/v3_quarantine_lookup","/command/v3_remove_emergency_off","/management/signature","/management/ac","/management/scm","/command/scm_check","/command/scm_check_cancel","/command/v3_reset_scan_cache","/command/hips_on_off","/command/ac_on_off","/command/am_on_off","/command/hips_ssl_inspection"]'
        );
    ELSE
        UPDATE tb_privilege_profile 
        SET 
            profile_body = '["/management/domain","/management/product","/management/software","/management/patch","/management/distribution","/management/privacy","/management/survey","/response/domain","/response/schedule","/response/report","/response/file","/response/on_demand","/policy","/policy/policy_SA_R","/policy/policy_SA_W","/policy/policy_V3W_R","/policy/policy_V3W_W","/policy/policy_V3L_R","/policy/policy_V3L_W","/policy/policy_HIPS_A_R","/policy/policy_HIPS_A_W","/policy/policy_HIPS_IPS_R","/policy/policy_HIPS_IPS_W","/policy/policy_HIPS_FW_R","/policy/policy_HIPS_FW_W","/policy/policy_AC_A_R","/policy/policy_AC_A_W","/policy/policy_AC_PC_R","/policy/policy_AC_PC_W","/policy/policy_AC_IM_R","/policy/policy_AC_IM_W","/policy/policy_AMC_R","/policy/policy_AMC_W","/correlation","/command/update_product","/command/policy","/command/agent_command","/command/share_folder","/command/asset_command","/command/v3_scan","/command/v3_stop_scan","/command/cancel_scheduled_scan","/command/v3_optimize","/command/artifact","/command/ahnreport","/command/kill_process","/command/suspicious_file","/command/uninstall_agent","/command/uninstall_product","/command/deploy_product","/command/hips_signature_recommandation","/command/hips_signature_setting","/command/ac_initializing_whitelist","/command/im_rulecheck","/command/im_reqlog","/command/update_ips","/command/v3_quarantine_lookup","/command/v3_remove_emergency_off","/management/signature","/management/ac","/management/scm","/command/scm_check","/command/scm_check_cancel","/command/v3_reset_scan_cache","/command/hips_on_off","/command/ac_on_off","/command/am_on_off","/command/hips_ssl_inspection"]'
            , modified_time = CURRENT_TIMESTAMP
        WHERE profile_type = 'POLICY_ADMIN';
    END IF;

    IF NOT EXISTS ( SELECT 1 FROM tb_privilege_profile WHERE profile_type = 'PRODUCT_ADMIN' ) THEN
        INSERT INTO tb_privilege_profile(profile_name, profile_type, description, modified_time, profile_body)
        VALUES
        (
            '라이선스 관리자', 'PRODUCT_ADMIN', 'PRODUCT_ADMIN', CURRENT_TIMESTAMP, 
            '["/dashboard","/detection","/management/domain","/management/product","/management/software","/management/patch","/management/distribution","/management/privacy","/management/survey","/response/domain","/response/schedule","/response/report","/response/file","/response/on_demand","/policy","/policy/policy_SA_R","/policy/policy_SA_W","/policy/policy_V3W_R","/policy/policy_V3W_W","/policy/policy_V3L_R","/policy/policy_V3L_W","/policy/policy_HIPS_A_R","/policy/policy_HIPS_A_W","/policy/policy_HIPS_IPS_R","/policy/policy_HIPS_IPS_W","/policy/policy_HIPS_FW_R","/policy/policy_HIPS_FW_W","/policy/policy_AC_A_R","/policy/policy_AC_A_W","/policy/policy_AC_PC_R","/policy/policy_AC_PC_W","/policy/policy_AC_IM_R","/policy/policy_AC_IM_W","/policy/policy_AMC_R","/policy/policy_AMC_W","/report","/report/query","/eventlog","/config/admin","/command/config_admin","/command/update_engine","/command/update_patchlab","/command/integrity","/command/update_product","/command/policy","/command/agent_command","/command/share_folder","/command/asset_command","/command/v3_scan","/command/v3_stop_scan","/command/cancel_scheduled_scan","/command/v3_optimize","/command/artifact","/command/ahnreport","/command/kill_process","/command/suspicious_file","/command/uninstall_product","/command/patch_command","/command/deploy_product","/command/distribution","/command/hips_signature_recommandation","/command/hips_signature_setting","/command/ac_initializing_whitelist","/command/im_rulecheck","/command/im_reqlog","/command/update_ips","/command/v3_quarantine_lookup","/command/v3_remove_emergency_off","/management/signature","/management/ac","/management/scm","/command/scm_check","/command/scm_check_cancel","/command/v3_reset_scan_cache","/command/hips_on_off","/command/ac_on_off","/command/am_on_off","/command/hips_ssl_inspection"]'
        );
    ELSE
        UPDATE tb_privilege_profile 
        SET 
            profile_body = '["/dashboard","/detection","/management/domain","/management/product","/management/software","/management/patch","/management/distribution","/management/privacy","/management/survey","/response/domain","/response/schedule","/response/report","/response/file","/response/on_demand","/policy","/policy/policy_SA_R","/policy/policy_SA_W","/policy/policy_V3W_R","/policy/policy_V3W_W","/policy/policy_V3L_R","/policy/policy_V3L_W","/policy/policy_HIPS_A_R","/policy/policy_HIPS_A_W","/policy/policy_HIPS_IPS_R","/policy/policy_HIPS_IPS_W","/policy/policy_HIPS_FW_R","/policy/policy_HIPS_FW_W","/policy/policy_AC_A_R","/policy/policy_AC_A_W","/policy/policy_AC_PC_R","/policy/policy_AC_PC_W","/policy/policy_AC_IM_R","/policy/policy_AC_IM_W","/policy/policy_AMC_R","/policy/policy_AMC_W","/report","/report/query","/eventlog","/config/admin","/command/config_admin","/command/update_engine","/command/update_patchlab","/command/integrity","/command/update_product","/command/policy","/command/agent_command","/command/share_folder","/command/asset_command","/command/v3_scan","/command/v3_stop_scan","/command/cancel_scheduled_scan","/command/v3_optimize","/command/artifact","/command/ahnreport","/command/kill_process","/command/suspicious_file","/command/uninstall_product","/command/patch_command","/command/deploy_product","/command/distribution","/command/hips_signature_recommandation","/command/hips_signature_setting","/command/ac_initializing_whitelist","/command/im_rulecheck","/command/im_reqlog","/command/update_ips","/command/v3_quarantine_lookup","/command/v3_remove_emergency_off","/management/signature","/management/ac","/management/scm","/command/scm_check","/command/scm_check_cancel","/command/v3_reset_scan_cache","/command/hips_on_off","/command/ac_on_off","/command/am_on_off","/command/hips_ssl_inspection"]'
            , modified_time = CURRENT_TIMESTAMP
        WHERE profile_type = 'PRODUCT_ADMIN';
    END IF;

    IF NOT EXISTS ( SELECT 1 FROM tb_privilege_profile WHERE profile_type = 'DEPT_ADMIN' ) THEN
        INSERT INTO tb_privilege_profile(profile_name, profile_type, description, modified_time, profile_body)
        VALUES
        (
            '부서 관리자', 'DEPT_ADMIN', 'DEPT_ADMIN', CURRENT_TIMESTAMP, 
            '["/detection","/management/domain","/response/domain","/response/schedule","/response/report","/response/file","/report","/command/update_product"]'
        );
    ELSE
        UPDATE tb_privilege_profile 
        SET 
            profile_body = '["/detection","/management/domain","/response/domain","/response/schedule","/response/report","/response/file","/report","/command/update_product"]'
            , modified_time = CURRENT_TIMESTAMP
        WHERE profile_type = 'DEPT_ADMIN';
    END IF;

    IF NOT EXISTS ( SELECT 1 FROM tb_privilege_profile WHERE profile_type = 'MONITOR_ADMIN' ) THEN
        INSERT INTO tb_privilege_profile(profile_name, profile_type, description, modified_time, profile_body)
        VALUES
        (
            '일반 관리자', 'MONITOR_ADMIN', 'MONITOR_ADMIN', CURRENT_TIMESTAMP, 
            '["/dashboard","/management/product","/management/software","/report","/report/query","/eventlog"]'
        );
    ELSE
        UPDATE tb_privilege_profile 
        SET 
            profile_body = '["/dashboard","/management/product","/management/software","/report","/report/query","/eventlog"]'
            , modified_time = CURRENT_TIMESTAMP
        WHERE profile_type = 'MONITOR_ADMIN';
    END IF;

    IF NOT EXISTS ( SELECT 1 FROM tb_privilege_profile WHERE profile_type = 'SECMGR_ADMIN' ) THEN
        INSERT INTO tb_privilege_profile(profile_name, profile_type, description, modified_time, profile_body)
        VALUES
        (
            '보안 관리자', 'SECMGR_ADMIN', 'SECMGR_ADMIN', CURRENT_TIMESTAMP, 
            '["/detection","/management/domain","/response/domain","/response/schedule","/response/report","/response/file","/response/on_demand","/report","/command/update_product"]'
        );
    ELSE
        UPDATE tb_privilege_profile 
        SET 
            profile_body = '["/detection","/management/domain","/response/domain","/response/schedule","/response/report","/response/file","/response/on_demand","/report","/command/update_product"]'
            , modified_time = CURRENT_TIMESTAMP
        WHERE profile_type = 'SECMGR_ADMIN';
    END IF;

    UPDATE
        tb_admin
    SET
        manager_group_id = 1
    WHERE
        privilege_profile_id IN (SELECT privilege_profile_id FROM tb_privilege_profile WHERE profile_type IN ('ROOT_ADMIN', 'TEMP_ADMIN', 'POLICY_ADMIN', 'MONITOR_ADMIN'));


END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------
select '## tb_group_policy';
------------------------------------------------------------------------
INSERT INTO tb_group_policy( group_id, product_feature_id, policy_id, modified_time )
  SELECT g.group_id, p.product_feature_id, p.policy_id, now()
  FROM tb_group AS g, tb_policy AS p
  WHERE p.policy_type = 'DEFAULT'
ON CONFLICT (group_id, product_feature_id) DO NOTHING;



------------------------------------------------------------------------
select '## tb_node_policy';
------------------------------------------------------------------------
INSERT INTO tb_node_policy(node_id, product_feature_id, policy_id, keep_agent_policy, modified_time)
  SELECT n.node_id, p.product_feature_id, p.policy_id, false, now()
  FROM tb_node AS n, tb_policy AS p
  WHERE p.policy_type = 'DEFAULT'
ON CONFLICT (node_id, product_feature_id) DO NOTHING;

------------------------------------------------------------------------
select '## tb_admin';
------------------------------------------------------------------------
DO $$
BEGIN
    IF NOT EXISTS ( SELECT 1 FROM tb_admin WHERE privilege_profile_id = 1 ) THEN
        INSERT INTO tb_admin
        (
            admin_id, name, password, pw_due, connect_ip_range, connect_dofw, connect_time_start, connect_time_end, timeout_value, auth_wait_time, 
            privilege_profile_id, computer_name, connect_ipaddr, login_time, logout_time, admin_group, pw_modify_time, 
            email, phone, dashboard_layout, modified_time, description, use_otp, product_auth, task_menu_layout, manager_group_id
        )
        VALUES (
            'cpp', '초기임시관리자', '/QPXOYKhLmLpeNAhYSgEAQoyDCT7xYyFOI3x5SLrGHFUQKlBrYLaF0drF5F20beFUKf32Y+nnHSlO26HBX1mbTEuMA==',
            180, NULL, 'SUN,MON,TUE,WED,THU,FRI,SAT', 0, 24, 100, 100, 
            (SELECT privilege_profile_id FROM tb_privilege_profile WHERE profile_type = 'TEMP_ADMIN'), 
            NULL, NULL, NULL, NULL, NULL, '9999-12-31 23:59:59', NULL, NULL, NULL, NULL, NULL, FALSE, NULL, NULL, 1
        )
        ON CONFLICT (admin_id) DO NOTHING;
    END IF;
END 
$$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------
select '## tb_product_group_info';
------------------------------------------------------------------------
INSERT INTO tb_product_group_info (product_group, watch_info) 
VALUES 
    ('EMS', false)
    , ('V3', false)
    , ('AC', false)
    , ('HIPS', false)
    , ('CNAPP', false)
ON CONFLICT (product_group) DO NOTHING;

------------------------------------------------------------------------
select '## tb_product_group_exclude_platform';
------------------------------------------------------------------------
INSERT INTO tb_product_group_exclude_platform (product_group, platform_group) 
VALUES 
    ('V3', 'WINDOWS_XP')
    , ('V3', 'WINDOWS_VISTA')
    , ('V3', 'WINDOWS_8')
    , ('V3', 'MAC')
    , ('V3', 'WINDOWS_2003')
ON CONFLICT(product_group, platform_group) DO NOTHING;


------------------------------------------------------------------------
select '## tb_base_report_column';
delete from tb_base_report_column;
------------------------------------------------------------------------
INSERT INTO tb_base_report_column (base_report_id, version, column_list)
VALUES
    ('BASE_SUMMARY', 1, 'data_datetime,node_id,computer_name,login_id,platform_id,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,connection_status,oes_engine_version,ses_engine_version,engine_update_threshold,is_v3_install,is_last_engine_applied,agent_policy_status,v3_policy_status,malware_name,infected_file_path,infected_time,infected_count,scan_type')
    , ('BASE_SUMMARY', 2, 'data_datetime,node_id,computer_name,login_id,platform_id,platform_name,platform_type,os_language,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,connection_status,oes_engine_version,ses_engine_version,engine_update_threshold,is_v3_install,is_last_engine_applied,agent_policy_status,v3_policy_status,malware_name,infected_file_path,infected_time,infected_count,scan_type,status, is_ac_install, is_hips_install,ac_agent_policy_status, ac_mgmt_policy_status, hips_agent_policy_status, hips_mgmt_policy_status, hips_fw_policy_status, ac_agent_top_info, ac_detect_top_info, hips_detect_agent_top_info, hips_detect_signature_top_info, v3_info')
    , ('BASE_SUMMARY', 3, 'data_datetime,node_id,computer_name,login_id,platform_id,platform_name,platform_type,os_language,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,connection_status,oes_engine_version,ses_engine_version,engine_update_threshold,is_v3_install,is_last_engine_applied,agent_policy_status,v3_policy_status,malware_name,infected_file_path,infected_time,infected_count,scan_type,status,is_ac_install,is_hips_install,is_scm_install, hips_agent_policy_status, hips_mgmt_policy_status, hips_fw_policy_status, ac_agent_policy_status, ac_mgmt_policy_status, scm_agent_policy_status, scm_mgmt_policy_status, ac_agent_top_info, ac_detect_top_info, hips_detect_agent_top_info, hips_detect_signature_top_info, scm_compliance_failed_agent_top_info, scm_secret_failed_agent_top_info, v3_info')
    , ('AGENT_INSTALL_STATUS', 1, 'data_datetime,node_id,computer_name,login_id,platform_id,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,connection_status')
    , ('AGENT_INSTALL_STATUS', 2, 'data_datetime,node_id,computer_name,login_id,platform_id,platform_name,platform_type,os_language,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,connection_status')
    , ('AGENT_INSTALL_STATUS', 3, 'data_datetime,node_id,computer_name,login_id,platform_id,platform_name,platform_type,os_language,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,connection_status,agent_version')
    , ('AGENT_INSTALL_HISTORY', 1, 'data_datetime,node_id,computer_name,login_id,platform_id,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,connection_status,install_time')
    , ('AGENT_INSTALL_HISTORY', 2, 'data_datetime,node_id,computer_name,login_id,platform_id,platform_name,platform_type,os_language,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,connection_status,agent_install_time')
    , ('HW_STATUS', 1, 'data_datetime,node_id,computer_name,login_id,platform_id,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,connection_status,cpu_name,cpu_detail,cpu_version,cpu_speed,memory_physical,memory_virtual,bios_date,bios_name,bios_vendor,bios_version,vga_resolution,vga_type,vga_chipset,vga_mem,hdd1_file_system,hdd1_size,hdd1_free,hdd2_file_system,hdd2_size,hdd2_free,hdd3_file_system,hdd3_size,hdd3_free,hdd4_file_system,hdd4_size,hdd4_free,hdd5_file_system,hdd5_size,hdd5_free,host,iexplorer,winsock,nic1_mac,nic1_gw,nic1_ip,nic1_dhcp_use,nic1_dhcp_server,nic1_virtual,nic2_mac,nic2_gw,nic2_ip,nic2_dhcp_use,nic2_dhcp_server,nic2_virtual,nic3_mac,nic3_gw,nic3_ip,nic3_dhcp_use,nic3_dhcp_server,nic3_virtual,nic4_mac,nic4_gw,nic4_ip,nic4_dhcp_use,nic4_dhcp_server,nic4_virtual,nic5_mac,nic5_gw,nic5_ip,nic5_dhcp_use,nic5_dhcp_server,nic5_virtual,os_name,os_name_detail,os_install_time,os_version,os_platform,os_product_id')
    , ('HW_STATUS', 2, 'data_datetime,node_id,computer_name,login_id,platform_id,platform_name,platform_type,os_language,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,connection_status,cpu_name,cpu_detail,cpu_version,cpu_speed,memory_physical,memory_virtual,bios_date,bios_name,bios_vendor,bios_version,vga_resolution,vga_type,vga_chipset,vga_mem,hdd1_file_system,hdd1_size,hdd1_free,hdd2_file_system,hdd2_size,hdd2_free,hdd3_file_system,hdd3_size,hdd3_free,hdd4_file_system,hdd4_size,hdd4_free,hdd5_file_system,hdd5_size,hdd5_free,host,iexplorer,winsock,nic1_mac,nic1_gw,nic1_ip,nic1_dhcp_use,nic1_dhcp_server,nic1_virtual,nic2_mac,nic2_gw,nic2_ip,nic2_dhcp_use,nic2_dhcp_server,nic2_virtual,nic3_mac,nic3_gw,nic3_ip,nic3_dhcp_use,nic3_dhcp_server,nic3_virtual,nic4_mac,nic4_gw,nic4_ip,nic4_dhcp_use,nic4_dhcp_server,nic4_virtual,nic5_mac,nic5_gw,nic5_ip,nic5_dhcp_use,nic5_dhcp_server,nic5_virtual,os_name,os_name_detail,os_install_time,os_version,os_platform,os_product_id')
    , ('SW_STATUS', 1, 'data_datetime,node_id,computer_name,login_id,platform_id,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,connection_status,sw_name,publisher,version,size,install_time')
    , ('SW_STATUS', 2, 'data_datetime,node_id,computer_name,login_id,platform_id,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,connection_status,sw_name,publisher,version,size,install_time,platform_name,platform_type,os_language')
    , ('OS_STATUS', 1, 'data_datetime,node_id,computer_name,login_id,platform_id,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,connection_status,is_server,os_install_time,os_version,os_platform,os_product_id')
    , ('OS_STATUS', 2, 'data_datetime,node_id,computer_name,login_id,platform_id,platform_name,platform_type,os_language,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,connection_status,is_server,os_install_time,os_version,os_platform,os_product_id')
    , ('PRODUCT_STATUS', 1, 'data_datetime,node_id,computer_name,login_id,platform_id,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,connection_status,product_id,is_server_product,is_server')
    , ('PRODUCT_STATUS', 2, 'data_datetime,node_id,computer_name,login_id,platform_id,platform_name,os_language,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,connection_status,product_id,product_name,is_server_product,is_server,agent_version,engine_version,last_scan_time,realtime_status,platform_type')
    , ('PRODUCT_STATUS', 3, 'data_datetime,node_id,computer_name,login_id,platform_id,platform_name,os_language,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,connection_status,product_id,product_name,is_server_product,is_server,agent_version,engine_version,last_scan_time,realtime_status,platform_type,is_client_product')
    , ('PRODUCT_STATUS', 4, 'data_datetime,node_id,computer_name,login_id,platform_id,platform_name,os_language,ip,mac,nt_domain,group_id,container_service_type,group_name,user_name,department,phone,email,empno,connection_status,product_id,product_name,is_server_product,is_server,agent_version,engine_version,last_scan_time,realtime_status,platform_type,is_client_product')
    , ('V3_INSTALL_STATUS', 1, 'data_datetime,node_id,computer_name,login_id,platform_id,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,connection_status,product_id,is_server_product,is_server')
    , ('V3_INSTALL_STATUS', 2, 'data_datetime,node_id,computer_name,login_id,platform_id,platform_name,os_language,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,connection_status,product_id,product_name,is_server_product,is_server,agent_version,engine_version,last_scan_time,realtime_status,platform_type')
    , ('V3_INSTALL_STATUS', 3, 'data_datetime,node_id,computer_name,login_id,platform_id,platform_name,os_language,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,connection_status,product_id,product_name,is_server_product,is_server,agent_version,engine_version,last_scan_time,realtime_status,platform_type,is_client_product')
    , ('V3_INSTALL_STATUS', 4, 'data_datetime,node_id,computer_name,login_id,platform_id,platform_name,os_language,ip,mac,nt_domain,group_id,container_service_type,group_name,user_name,department,phone,email,empno,connection_status,product_id,product_name,is_server_product,is_server,agent_version,engine_version,last_scan_time,realtime_status,platform_type,is_client_product')
    , ('V3_POLICY_STATUS', 1, 'data_datetime,node_id,computer_name,login_id,platform_id,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,product_id,product_feature_id,policy_id,policy_status,server_time,apply_time,connection_status,is_server')
    , ('V3_POLICY_STATUS', 2, 'data_datetime,node_id,computer_name,login_id,platform_id,platform_name,os_language,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,product_id,product_name,policy_id,policy_status,server_time,apply_time,connection_status,is_server_product,is_server,engine_version,last_scan_time,realtime_status,agent_version,platform_type')
    , ('V3_POLICY_STATUS', 3, 'data_datetime,node_id,computer_name,login_id,platform_id,platform_name,os_language,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,product_id,product_name,policy_id,policy_status,server_time,apply_time,connection_status,is_server_product,is_server,engine_version,last_scan_time,realtime_status,agent_version,platform_type,is_client_product')
    , ('V3_POLICY_STATUS', 4, 'data_datetime,node_id,computer_name,login_id,platform_id,platform_name,os_language,ip,mac,nt_domain,group_id,container_service_type,group_name,user_name,department,phone,email,empno,product_id,product_name,policy_id,policy_status,server_time,apply_time,connection_status,is_server_product,is_server,engine_version,last_scan_time,realtime_status,agent_version,platform_type,is_client_product')
    , ('V3_INSTALL_HISTORY', 1, 'data_datetime,node_id,computer_name,login_id,platform_id,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,connection_status,install_time')
    , ('V3_INSTALL_HISTORY', 2, 'data_datetime,node_id,computer_name,login_id,platform_id,platform_name,os_language,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,connection_status,install_time,product_id,product_name,is_server_product,is_server,agent_version,engine_version,last_scan_time,realtime_status,platform_type')
    , ('MALWARE_SUMMARY', 1, 'data_datetime,node_id,computer_name,login_id,platform_id,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,connection_status,malware_name,infected_file_path,infected_time,infected_count,scan_type,status')
    , ('MALWARE_SUMMARY', 2, 'data_datetime,node_id,computer_name,login_id,platform_id,platform_name,platform_type,os_language,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,connection_status,malware_name,infected_file_path,infected_time,infected_count,scan_type,status')
    , ('MALWARE_NAME_TOP', 1, 'data_datetime,node_id,computer_name,login_id,platform_id,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,connection_status,malware_name,infected_file_path,infected_time,infected_count,scan_type,status')
    , ('MALWARE_NAME_TOP', 2, 'data_datetime,node_id,computer_name,login_id,platform_id,platform_name,platform_type,os_language,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,connection_status,malware_name,infected_file_path,infected_time,infected_count,scan_type,status')
    , ('MALWARE_AGENT_TOP', 1, 'data_datetime,node_id,computer_name,login_id,platform_id,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,connection_status,malware_name,infected_file_path,infected_time,infected_count,scan_type,status')
    , ('MALWARE_AGENT_TOP', 2, 'data_datetime,node_id,computer_name,login_id,platform_id,platform_name,platform_type,os_language,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,connection_status,malware_name,infected_file_path,infected_time,infected_count,scan_type,status')
    , ('MALWARE_DETECT_HISTORY', 1, 'data_datetime,node_id,computer_name,login_id,platform_id,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,connection_status,malware_name,infected_file_path,infected_time,infected_count,scan_type,status')
    , ('MALWARE_DETECT_HISTORY', 2, 'data_datetime,node_id,computer_name,login_id,platform_id,platform_name,platform_type,os_language,ip,mac,nt_domain,group_id,group_name,user_name,department,phone,email,empno,connection_status,malware_name,infected_file_path,infected_time,infected_count,scan_type,status')
    , ('HIPS_APPLICATION_TOP',1,'data_datetime, connection_status, ip, mac, name_path, nt_domain, computer_name, login_id, node_id, user_name, department, phone, email, empno, platform_id, platform_name, platform_type, os_language, application_type, application_type_count')
    , ('HIPS_SIP_TOP',1,'data_datetime, connection_status, ip, mac, name_path, nt_domain, computer_name, login_id, node_id, user_name, department, phone, email, empno, platform_id, platform_name, platform_type, os_language, saddr, saddr_count')
    , ('HIPS_SIGNATURE_TOP',1,'data_datetime, connection_status, ip, mac, name_path, nt_domain, computer_name, login_id, node_id, user_name, department, phone, email, empno, platform_id, platform_name, platform_type, os_language, name, name_count')
    , ('HIPS_COUNTRY_TOP',1,'data_datetime, connection_status, ip, mac, name_path, nt_domain, computer_name, login_id, node_id, user_name, department, phone, email, empno, platform_id, platform_name, platform_type, os_language, scountry, scountry_count')
    , ('HIPS_DETECT_AGENT_TOP',1,'data_datetime, ip, node_id, ip_count, name')
    , ('HIPS_DETECT_HISTORY',1,'data_datetime, connection_status, ip, mac, name_path, nt_domain, computer_name, login_id, node_id, user_name, department, phone, email, empno, platform_id, platform_name, platform_type, os_language, detect_count')
    , ('HIPS_FW_SIP_TOP', 1, 'data_datetime, connection_status, ip, mac, name_path, nt_domain, computer_name, login_id, node_id, user_name, department, phone, email, empno, platform_id, platform_name, platform_type, os_language, src_ip, src_ip_count')
    , ('HIPS_FW_PORT_TOP', 1, 'data_datetime, connection_status, ip, mac, name_path, nt_domain, computer_name, login_id, node_id, user_name, department, phone, email, empno, platform_id, platform_name, platform_type, os_language, dst_port, dst_port_count')
    , ('HIPS_FW_RULE_TOP', 1, 'data_datetime, connection_status, ip, mac, name_path, nt_domain, computer_name, login_id, node_id, user_name, department, phone, email, empno, platform_id, platform_name, platform_type, os_language, rule_name, rule_name_count')
    , ('HIPS_FW_HISTORY', 1, 'data_datetime, connection_status, ip, mac, name_path, nt_domain, computer_name, login_id, node_id, user_name, department, phone, email, empno, platform_id, platform_name, platform_type, os_language, block_count')
    , ('HIPS_FW_AGENT_TOP', 1, 'data_datetime, ip, node_id, ip_count, src_ip')
    , ('AC_BLOCK_HISTORY',1,'data_datetime,node_id,computer_name,login_id,platform_id,platform_name,platform_type,ip,ip_connected,mac,nt_domain,os_language,group_id,group_name,user_name,department,phone,email,empno,connection_status,block_count,block_node_count')
    , ('AC_BLOCK_FILE_TOP',1,'data_datetime,node_id,computer_name,login_id,platform_id,platform_name,platform_type,ip,ip_connected,mac,nt_domain,os_language,group_id,group_name,user_name,department,phone,email,empno,connection_status,block_file_hash,block_file_name,block_last_modified_time,block_count,block_node_count')
    , ('AC_AGENT_TOP',1,'data_datetime,node_id,computer_name,login_id,platform_id,platform_name,platform_type,ip,ip_connected,mac,nt_domain,os_language,group_id,group_name,user_name,department,phone,email,empno,connection_status,block_file_hash,block_file_name,block_last_modified_time,block_count,block_node_count')
    , ('IM_AGENT_TOP',1,'data_datetime,node_id,computer_name,login_id,platform_id,platform_name,platform_type,ip,ip_connected,mac,nt_domain,os_language,group_id,group_name,user_name,department,phone,email,empno,connection_status,detect_last_modified_time,last_detect_path,detect_count')
    , ('IM_WATCH_TOP',1,'data_datetime,node_id,computer_name,login_id,platform_id,platform_name,platform_type,ip,ip_connected,mac,nt_domain,os_language,group_id,group_name,user_name,department,phone,email,empno,connection_status,watchlist_name,detect_count,detect_node_count')
    , ('IM_HISTORY',1,'data_datetime,node_id,computer_name,login_id,platform_id,platform_name,platform_type,ip,ip_connected,mac,nt_domain,os_language,group_id,group_name,user_name,department,phone,email,empno,connection_status,detect_count')
    , ('IM_RULE_TOP',1,'data_datetime,node_id,computer_name,login_id,platform_id,platform_name,platform_type,ip,ip_connected,mac,nt_domain,os_language,group_id,group_name,user_name,department,phone,email,empno,connection_status,rule_name,detect_target,except_detect_target,detect_count,detect_node_count')
    , ('IM_INSPECT_TOP',1,'data_datetime,node_id,computer_name,login_id,platform_id,platform_name,platform_type,ip,ip_connected,mac,nt_domain,os_language,group_id,group_name,user_name,department,phone,email,empno,connection_status,detect_path,detect_last_modified_time,detect_count,detect_node_count')
ON CONFLICT(base_report_id, "version") DO UPDATE SET column_list = excluded.column_list;


------------------------------------------------------------------------
select '## tb_base_report_status';
delete from tb_base_report_status;
------------------------------------------------------------------------
INSERT INTO tb_base_report_status (base_report_id, version)
VALUES
    ('BASE_SUMMARY', 1)
    , ('BASE_SUMMARY', 2)
    , ('BASE_SUMMARY', 3)
    , ('AGENT_INSTALL_STATUS', 1)
    , ('AGENT_INSTALL_HISTORY', 1)
    , ('AGENT_INSTALL_HISTORY', 2)
    , ('HW_STATUS', 1)
    , ('SW_STATUS', 1)
    , ('OS_STATUS', 1)
    , ('PRODUCT_STATUS', 1)
    , ('V3_INSTALL_STATUS', 1)
    , ('V3_POLICY_STATUS', 1)
    , ('V3_INSTALL_HISTORY', 1)
    , ('V3_INSTALL_HISTORY', 2)
    , ('MALWARE_SUMMARY', 1)
    , ('MALWARE_NAME_TOP', 1)
    , ('MALWARE_AGENT_TOP', 1)
    , ('MALWARE_DETECT_HISTORY', 1)
    , ('MALWARE_DETECT_HISTORY', 2)
    , ('HIPS_FW_HISTORY', 1)
    , ('HIPS_FW_SIP_TOP', 1)
    , ('HIPS_FW_AGENT_TOP', 1)
    , ('HIPS_FW_PORT_TOP', 1)
    , ('HIPS_FW_RULE_TOP', 1)
    , ('AC_BLOCK_HISTORY', 1)
    , ('AC_BLOCK_FILE_TOP', 1)
    , ('AC_AGENT_TOP', 1);

    
------------------------------------------------------------------------
select '## tb_extra_policy_detail_format';
------------------------------------------------------------------------
INSERT INTO tb_extra_policy_detail_format (product_feature_id, extra_policy_detail, policy_format, online_policy_format, offline_policy_format)
VALUES
    ('V3NET_9.0_AV', 'VM_AGENT', 'XML', '<VMAGENT VMNODECOUNT="%s" VMAGENTINDEX="%s" VMAGENTCOUNT="%s" VMAGENTCHECK="%s" />', '<VMAGENT VMNODECOUNT="%s" VMAGENTINDEX="%s" VMAGENTCOUNT="%s" VMAGENTCHECK="%s" />')
    , ('V3NET_9.0_AV', 'UPDATE_SERVER', 'XML', '<UPDATE MANUAL_UPDATE_URL="%s"/>', '<UPDATE MANUAL_UPDATE_URL="%s"/>')
    , ('V3NET_LU_UPDATE', 'UPDATE_SERVER', 'XML', '<MANUAL_UPDATE_URL>%s</MANUAL_UPDATE_URL>', '<MANUAL_UPDATE_URL>%s</MANUAL_UPDATE_URL>')
    , ('AGENT_MGMT', 'UPDATE_SERVER', 'JSON', '"patch":{"oes_url":"%s","ses_url":"%s","oes_url_list":["%s"],"ses_url_list":["%s"]}', '"patch":{"oes_url":"%s","ses_url":"%s","oes_url_list":["%s"],"ses_url_list":["%s"]}')
    , ('AGENT_MGMT', 'LICENSE_V1', 'JSON', '"license":{"main_server_policy":true,%s}', '"license":{"main_server_policy":true,%s}')
    , ('AGENT_MGMT', 'LICENSE_V2', 'JSON', '"license2":{"main_server_policy":true,%s}', '"license2":{"main_server_policy":true,%s}')
ON CONFLICT(product_feature_id, extra_policy_detail) DO UPDATE 
    SET (policy_format, online_policy_format, offline_policy_format) = (EXCLUDED.policy_format, EXCLUDED.online_policy_format, EXCLUDED.offline_policy_format);

------------------------------------------------------------------------
select '## tb_table_clean_config';
------------------------------------------------------------------------
INSERT INTO tb_table_clean_config (clean_table, clean, display, product_group, storage_limit_date, column_order)
VALUES
     ('TB_AGENT_EVENT_LOG', true, true, 'AGENT', 180, 0)
    , ('TB_TASK_STATUS_LOG', true, true, 'AGENT', 180, 1)
    , ('TB_NODE_SW', true, true, 'AGENT', 30, 2)
    , ('TB_NODE_HW', true, true, 'AGENT', 30, 3)
    , ('TB_POLICY_STATUS_LOG', true, false, 'AGENT', 90, 4)

    , ('TB_V3_ALERT_LOG', false, true, 'V3', 180, 100)
    , ('TB_V3_SS_LOG', true, true, 'V3', 180, 101)
    , ('TB_V3_IS_LOG', true, true, 'V3', 180, 102)
    , ('TB_V3_SUP_LOG', true, true, 'V3', 180, 103)
    , ('TB_V3_QUAR_LOG', true, true, 'V3', 180, 104)

    , ('TB_HIPS_AGENT_EVENT_LOG', true, true, 'HIPS', 180, 200)
    , ('TB_HIPS_DETECT_EVENT_LOG', false, true, 'HIPS', 180, 201)
    , ('TB_HIPS_FW_EVENT_LOG', false, true, 'HIPS', 180, 202)

    , ('TB_AC_AGENT_EVENT_LOG', true, true, 'AC', 180, 300)
    , ('TB_AC_EXEC_EVENT_LOG', false, true, 'AC', 180, 301)
    , ('TB_AC_ACCESS_EVENT_LOG', false, true, 'AC', 180, 302)
    , ('TB_IM_DETECT_EVENT_LOG', false, true, 'AC', 180, 304)

    , ('TB_SCM_SCAN_LOG', true, true, 'SCM', 180, 400)
    , ('TB_SCM_AGENT_LOG', true, true, 'SCM', 180, 401)

    , ('TB_CNAPP_EVENT_LOG', true, true, 'CNAPP', 180, 500)
    , ('TB_CNAPP_MALWARE_SCAN_EVENT_LOG', true, true, 'CNAPP', 180, 501)
    , ('TB_CNAPP_VULNERABILITY_SCAN_EVENT_LOG', true, true, 'CNAPP', 180, 502)

    , ('TB_SERVICE_LOG', true, true, 'EMS', 180, 1000)
    , ('TB_AUDIT_LOG', true, true, 'EMS', 180, 1001)
    , ('TB_ENGINE_UPDATE_LOG', true, true, 'EMS', 180, 1002)
    , ('TB_BACKUP_LOG', true, true, 'EMS', 180, 1003)
    , ('TB_PKG_DIST_LOG', true, true, 'EMS', 180, 1004)
    , ('TB_PKG_SYNC_LOG', true, true, 'EMS', 180, 1005)
    , ('TB_AGENT_INSTALL_PKG_LOG', true, true, 'EMS', 180, 1006)
    , ('TB_SERVER_ALERT_LOG', true, true, 'EMS', 15, 1007)
ON CONFLICT(clean_table) DO UPDATE SET (product_group,column_order) = (EXCLUDED.product_group,EXCLUDED.column_order);

-- CWPP-5161
-- 하위 버전에서 업데이트 했을 경우 ON CONFLICT 옵션으로 인해 storage_limit_date 가 NULL 로 유지되기 떄문에 update 해준다
-- DO UPDATE 를 설정하면 추후 CPPM 업데이트 했을 때 사용자가 변경한 storage_limit_date가 Default 로 강제변경 될 수 있기 때문에 DO UPDATE로 변경하지 않는다.
UPDATE
    tb_table_clean_config
SET
    storage_limit_date = 180
WHERE
    storage_limit_date IS NULL;

-- CWPP-8724
-- 화면 표기여부가 추가되어 null인 경우 TRUE 로 Update
UPDATE
    tb_table_clean_config
SET
    display = TRUE
WHERE
    display IS NULL;

------------------------------------------------------------------------
select '## tb_service_port';
-- NOTE: tb_config 보다 tb_service_port 가 반드시 먼저 insert 되어야 한다.
------------------------------------------------------------------------
INSERT INTO tb_service_port (service_type, port, count_type, dep_service_type, always_static, init_static, param_enabled)
VALUES
    ('TOMCAT-CONSOLE', 8806, 'ALL', NULL, NULL, NULL, NULL)
    , ('TOMCAT-AGENT', 8807, 'ONE_OR_MORE', NULL, NULL, NULL, true)
    , ('TOMCAT-AUTH', 8808, 'ONE', 'LBCONSOLE', NULL, true, NULL)
    , ('FILESERVER-HTTPS', 8809, 'ONE_OR_MORE', 'FILESERVER-HTTP', NULL, NULL, NULL)
    , ('FILESERVER-HTTP', 8810, 'ONE_OR_MORE', NULL, NULL, NULL, true)
    , ('FILESERVER-UPLOAD', 0, 'ONE_OR_MORE', NULL, true, NULL, true)
    , ('LBCONSOLE', 8803, 'ONE_OR_MORE', NULL, NULL, true, true)
    , ('LBAGENT', 8804, 'ONE_OR_MORE', 'LBCONSOLE', NULL, true, NULL)
    , ('LBAUTH', 8805, 'ONE_OR_MORE', 'LBCONSOLE', NULL, true, NULL)
    , ('LBDIST-HTTP', 5465, 'ONE_OR_MORE', 'LBCONSOLE', NULL, true, NULL)
    , ('LBDIST-HTTPS', 5645, 'ONE_OR_MORE', 'LBCONSOLE', NULL, true, NULL)
    , ('DB-EPPOLTP', 8817, 'ONE', NULL, true, NULL, true)
    , ('CONNECTOR-EPPOLTP', 8819, 'ONE', 'DB-EPPOLTP', true, NULL, NULL)
    , ('CLUSTER-MANAGER', 8851, 'ALL', NULL, NULL, NULL, NULL)
    , ('NOSQL-CONFIGSVR1', 8821, 'ONE', NULL, NULL, NULL, NULL)
    , ('NOSQL-CONFIGSVR2', 8822, 'ONE', NULL, NULL, NULL, NULL)
    , ('NOSQL-CONFIGSVR3', 8823, 'ONE', NULL, NULL, NULL, NULL)
    , ('NOSQL-MONGOS', 8825, 'ONE', 'DB-EPPOLTP', true, NULL, NULL)
    , ('NOSQL-SHARDSVR', 8824, 'ONE_OR_MORE', NULL, true, NULL, true)
    , ('CACHED', 8831, 'ONE', 'DB-EPPOLTP', true, NULL, NULL)
    , ('SCHEDULER', 8832, 'ALL', NULL, NULL, NULL, NULL)
    , ('KAFKA-CONSUMER', 0, 'ONE_OR_MORE', 'DB-EPPOLTP', true, NULL, NULL)
    , ('SYSLOG-SENDER', 0, 'ONE', 'DB-EPPOLTP', true, NULL, NULL)
    , ('KAFKA', 8816, 'ONE', 'DB-EPPOLTP', true, NULL, NULL)
    , ('BATCH-PROCESSOR', 0, 'ALL', NULL, NULL, NULL, NULL)
    , ('EPPCMD', 8858, 'ALL', NULL, NULL, NULL, NULL)
    , ('YUM', 8850, 'ONE_OR_MORE', 'FILESERVER-HTTP', NULL, NULL, NULL)
    , ('NTP', 123, 'ALL', NULL, NULL, NULL, NULL)
ON CONFLICT(service_type) DO UPDATE 
    SET (count_type, dep_service_type, always_static, param_enabled) = (excluded.count_type, excluded.dep_service_type, excluded.always_static, excluded.param_enabled);

------------------------------------------------------------------------
select '## tb_correlation_rule';
-- tb_correlation_rule > tb_correlation_rule_item;
------------------------------------------------------------------------
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM tb_correlation_rule WHERE correlation_type = 'SYSTEM_ALERT' AND "name" = 'CPU_USAGE')
    THEN
        INSERT INTO tb_correlation_rule 
        (
            correlation_type, name, is_enabled, schedule, alarm_threshold, condition_text, exclude_text, send_notice
            , base_report_id, alert_template_id, send_mail, send_mail_to_target, custom_email, modified_time, admin_id, send_log
        )
        VALUES('SYSTEM_ALERT', 'CPU_USAGE', '0', '{"repeat":{"minute":10}}', NULL, NULL, NULL, '0', NULL, NULL, '0', '0', NULL, NULL, NULL, NULL);

        -- tb_correlation_rule_item
        INSERT INTO tb_correlation_rule_item 
            (correlation_rule_id, intersect_set, correlation_condition_id, comparison_operator, "values") 
        VALUES 
            (
                (SELECT correlation_rule_id FROM tb_correlation_rule WHERE correlation_type = 'SYSTEM_ALERT' AND name = 'CPU_USAGE')
                , 1
                , 'CPU_USAGE'
                , '>'
                , '{90}'
            ); 
    END IF;

    IF NOT EXISTS (SELECT 1 FROM tb_correlation_rule WHERE correlation_type = 'SYSTEM_ALERT' AND "name" = 'MEMORY_USAGE')
    THEN
        INSERT INTO tb_correlation_rule 
        (
            correlation_type, name, is_enabled, schedule, alarm_threshold, condition_text, exclude_text, send_notice
            , base_report_id, alert_template_id, send_mail, send_mail_to_target, custom_email, modified_time, admin_id, send_log
        )
        VALUES('SYSTEM_ALERT', 'MEMORY_USAGE', '0', '{"repeat":{"minute":10}}', NULL, NULL, NULL, '0', NULL, NULL, '0', '0', NULL, NULL, NULL, NULL);

        -- tb_correlation_rule_item
        INSERT INTO tb_correlation_rule_item 
            (correlation_rule_id, intersect_set, correlation_condition_id, comparison_operator, "values") 
        VALUES 
            (
                (SELECT correlation_rule_id FROM tb_correlation_rule WHERE correlation_type = 'SYSTEM_ALERT' AND name = 'MEMORY_USAGE')
                , 1
                , 'MEMORY_USAGE'
                , '>'
                , '{90}'
            ); 
    END IF;


    IF NOT EXISTS (SELECT 1 FROM tb_correlation_rule WHERE correlation_type = 'SYSTEM_ALERT' AND "name" = 'DISK_USAGE')
    THEN
        INSERT INTO tb_correlation_rule 
        (
            correlation_type, name, is_enabled, schedule, alarm_threshold, condition_text, exclude_text, send_notice
            , base_report_id, alert_template_id, send_mail, send_mail_to_target, custom_email, modified_time, admin_id, send_log
        )
        VALUES('SYSTEM_ALERT', 'DISK_USAGE', '0', '{"repeat":{"minute":10}}', NULL, NULL, NULL, '0', NULL, NULL, '0', '0', NULL, NULL, NULL, NULL);

        -- tb_correlation_rule_item
        INSERT INTO tb_correlation_rule_item 
            (correlation_rule_id, intersect_set, correlation_condition_id, comparison_operator, "values") 
        VALUES 
            (
                (SELECT correlation_rule_id FROM tb_correlation_rule WHERE correlation_type = 'SYSTEM_ALERT' AND name = 'DISK_USAGE')
                , 1
                , 'DISK_USAGE'
                , '>'
                , '{90}'
            ); 
    END IF;

    IF NOT EXISTS (SELECT 1 FROM tb_correlation_rule WHERE correlation_type = 'SYSTEM_ALERT' AND "name" = 'DB_SIZE')
    THEN
        INSERT INTO tb_correlation_rule 
        (
            correlation_type, name, is_enabled, schedule, alarm_threshold, condition_text, exclude_text, send_notice
            , base_report_id, alert_template_id, send_mail, send_mail_to_target, custom_email, modified_time, admin_id, send_log
        )
        VALUES('SYSTEM_ALERT', 'DB_SIZE', '0', '{"repeat":{"minute":10}}', NULL, NULL, NULL, '0', NULL, NULL, '0', '0', NULL, NULL, NULL, NULL);

        -- tb_correlation_rule_item
        INSERT INTO tb_correlation_rule_item 
            (correlation_rule_id, intersect_set, correlation_condition_id, comparison_operator, "values") 
        VALUES 
            (
                (SELECT correlation_rule_id FROM tb_correlation_rule WHERE correlation_type = 'SYSTEM_ALERT' AND name = 'DB_SIZE')
                , 1
                , 'DB_FILE_SIZE'
                , '>'
                , '{50}'
            );
    END IF;

    IF NOT EXISTS ( SELECT 1 FROM tb_correlation_rule WHERE correlation_type = 'SYSTEM_ALERT' AND "name" = 'FILE_SERVER_DISK_SIZE')
    THEN
        INSERT INTO tb_correlation_rule 
        (
            correlation_type, name, is_enabled, schedule, alarm_threshold, condition_text, exclude_text, send_notice
            , base_report_id, alert_template_id, send_mail, send_mail_to_target, custom_email, modified_time, admin_id, send_log
        )
        VALUES('SYSTEM_ALERT', 'FILE_SERVER_DISK_SIZE', '0', '{"repeat":{"minute":10}}', NULL, NULL, NULL, '0', NULL, NULL, '0', '0', NULL, NULL, NULL, NULL);

        -- tb_correlation_rule_item
        INSERT INTO tb_correlation_rule_item 
            (correlation_rule_id, intersect_set, correlation_condition_id, comparison_operator, "values") 
        VALUES 
            (
                (SELECT correlation_rule_id FROM tb_correlation_rule WHERE correlation_type = 'SYSTEM_ALERT' AND name = 'FILE_SERVER_DISK_SIZE')
                , 1
                , 'FILE_SERVER_DISK_SIZE'
                , '>'
                , '{50}'
            );
    END IF;

    IF NOT EXISTS ( SELECT 1 FROM tb_correlation_rule WHERE correlation_type = 'SYSTEM_ALERT' AND "name" = 'LICENSE_EXPIRE')
    THEN
        INSERT INTO tb_correlation_rule 
        (
            correlation_type, name, is_enabled, schedule, alarm_threshold, condition_text, exclude_text, send_notice
            , base_report_id, alert_template_id, send_mail, send_mail_to_target, custom_email, modified_time, admin_id, send_log
        )
        VALUES('SYSTEM_ALERT', 'LICENSE_EXPIRE', '0', '{"repeat":{"minute":10}}', NULL, NULL, NULL, '0', NULL, NULL, '0', '0', NULL, NULL, NULL, NULL);

        -- tb_correlation_rule_item
        INSERT INTO tb_correlation_rule_item 
            (correlation_rule_id, intersect_set, correlation_condition_id, comparison_operator, "values") 
        VALUES 
            (
                (SELECT correlation_rule_id FROM tb_correlation_rule WHERE correlation_type = 'SYSTEM_ALERT' AND name = 'LICENSE_EXPIRE')
                , 1
                , 'LICENSE_EXPIRE'
                , '<='
                , '{30}'
            );
    END IF;

    IF NOT EXISTS (SELECT 1 FROM tb_correlation_rule WHERE correlation_type = 'SYSTEM_ALERT' AND "name" = 'CERTIFICATE_EXPIRE')
    THEN
        INSERT INTO tb_correlation_rule 
        (
            correlation_type, name, is_enabled, schedule, alarm_threshold, condition_text, exclude_text, send_notice
            , base_report_id, alert_template_id, send_mail, send_mail_to_target, custom_email, modified_time, admin_id, send_log
        )
        VALUES('SYSTEM_ALERT', 'CERTIFICATE_EXPIRE', '0', '{"repeat":{"minute":10}}', NULL, NULL, NULL, '0', NULL, NULL, '0', '0', NULL, NULL, NULL, NULL);

        -- tb_correlation_rule_item
        INSERT INTO tb_correlation_rule_item 
            (correlation_rule_id, intersect_set, correlation_condition_id, comparison_operator, "values") 
        VALUES 
            (
                (SELECT correlation_rule_id FROM tb_correlation_rule WHERE correlation_type = 'SYSTEM_ALERT' AND name = 'CERTIFICATE_EXPIRE')
                , 1
                , 'CERTIFICATE_EXPIRE'
                , '<='
                , '{30}'
            );
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------
select '## tb_schedule';
------------------------------------------------------------------------
INSERT INTO tb_schedule(schedule_code, schedule_code_index, product_group, schedule, work_all, execute_uri, modified_time, enabled, description)
VALUES
    ('EPP_UPDATE', 1,  'EMS', '{"repeat":{"hourly":3}}', true, '/api/console/config/update/ahnlab/run_update', now(), true, '서버/엔진 업데이트')
    , ('SERVER_INTEGRITY_SCAN', 1, 'EMS', '{"repeat":{"hourly":6}}', true, '/api/console/config/system/execute', now(), true, '서버 무결성 검사')
    , ('EPP_AUTO_GROUP', 1, 'EMS', '{"repeat":{"hourly":1}}', false, '/api/console/managment/group/autogroup', now(), true, '자동 그룹핑')
    , ('FILE_SYNC', 1, 'EMS', '{"repeat":{"minute":5}}', true, '/api/console/sync/package/schedule', now(), true, '파일 동기화')
    , ('AGENT_STATUS_SCAN', 1, 'EMS', '{"repeat":{"minute":5}}', false, '/api/console/config/agent/signal/schedule', now(), true, '에이전트 상태 스캔')
    , ('AGENT_STATUS_ALARM', 1, 'EMS', '{"repeat":{"minute":10}}', false, '/api/console/agent/status/alarm', now(), true, '에이전트 상태 알림')
    , ('REPORT_CLEAN', 1, 'EMS', '{"repeat":{"daily":1},"basic_moment":{"year":"0","month":"0","week":"0","day":"0","hour":4,"minute":30,"second":0}}', false, '/api/console/ems/report/oldDataClean', now(), true, '보고서 정리')
    , ('DB_CLEAN', 1, 'EMS', '{"repeat":{"daily":1},"basic_moment":{"year":"0","month":"0","week":"0","day":"0","hour":3,"minute":0,"second":0}}', false, '/api/console/config/db/clean/execute', now(), true, '디비 정리 스케쥴')
    , ('AHNREPORT_CLEAN', 1, 'EMS', '{"repeat":{"daily":1},"basic_moment":{"year":"0","month":"0","week":"0","day":"0","hour":2,"minute":50,"second":0}}', true, '/api/console/config/ahnreport/clean/execute', now(), true, '안리포트 정리 스케쥴')
    , ('GROUP_CLEAN', 1, 'EMS','{"repeat":{"daily":7},"basic_moment":{"year":"0","month":"0","week":"0","day":"0","hour":1,"minute":0,"second":0}}', FALSE, '/api/console/config/grouping/empty_group_clean', now(), TRUE, '빈 그룹 정리')
    , ('SEND_INSIGHT_PORTAL', 1, 'EMS', '{"basic_moment":{"year":"0","month":"0","week":"0","day":"0","hour":5,"minute":0,"second":0}}', false, '/api/console/config/insight/sendInfoData', now(), true, '인사이트포탈 CPP 정보 전송')
    , ('SEND_INSIGHT_PORTAL', 2, 'EMS', '{"basic_moment":{"year":"0","month":"0","week":"0","day":"0","hour":4,"minute":40}}',true, '/api/console/config/insight/setServerHardwareInfo', now(), true, '서버 하드웨어 정보 저장 ')
    , ('SYNC_CLOUD_AZURE_ALL_ACCOUNT_VM_LIST', 1, 'EMS', '{"repeat":{"minute":30}}', false, '/api/console/v1/cloud/azure/sync/all-account/vm/save', now(), true, 'Azure의 모든 계정정보에 대한 VM 정보 저장')
    , ('SYNC_CLOUD_AWS_ALL_ACCOUNT_INSTANCE_LIST', 1, 'EMS', '{"repeat":{"minute":30}}', false, '/api/console/v1/cloud/aws/sync/all-account/instance/save', now(), true, 'AWS의 모든 계정정보에 대한 EC2 정보 저장')
    , ('SYNC_CLOUD_ALIBABA_ALL_ACCOUNT_INSTANCE_LIST', 1, 'EMS', '{"repeat":{"minute":30}}', false, '/api/console/v1/cloud/alibaba/sync/all-account/instance/save', now(), true, 'ALIBABA의 모든 계정정보에 대한 ECS 정보 저장')
    , ('AC_REMOVE_IGNORE_INVENTORY_POLICY_LIST', 1, 'EMS', '{"basic_moment":{"year":0,"month":0,"week":0,"day":0,"hour":3,"minute":0,"second":0}}', false, '/api/console/v1/management/ac/inventory/remove-list', now(), true, 'AC 현황 내 인벤토리 30일간 보지 않기 정리 스케쥴')
    , ('UPDATE_HIPS_SIGNATURE', 1, 'HIPS', '{"repeat":{"minute":1440}}', false, '/api/console/hips/signature/pull', now(), true, 'HIPS 시그니처 리스트 가져오기')
    , ('UPDATE_COUNTRY', 1, 'HIPS', '{"repeat":{"minute":1440}}', false, '/api/console/country/pull', now(), true, '국가DB 리스트 가져오기')
    , ('HIPS_SIGNATURE_RECOMMENDATION_SCAN', 1, 'HIPS', '{"repeat":{"minute":30}}', false, '/api/console/v1/management/hips/signature/basic/recommendation/scan/save', now(), true, '시그니처 추천 및 적용')
    , ('HIPS_AC_DB_LOG_CLEAN', 1, 'EMS', '{"repeat":{"daily":1},"basic_moment":{"year":"0","month":"0","week":"0","day":"0","hour":2,"minute":30,"second":0}}', false, '/api/console/v1/setting/database/timeline/remove/list', now(), true, 'HIPS/AC DB로그 데이터 정리')
    , ('HIPS_SIGNATURE_RECOMMENDATION_CVE_MAPPING', 1, 'HIPS', '{"repeat":{"daily":1},"basic_moment":{"year":"0","month":"0","week":"0","day":"0","hour":2,"minute":30,"second":0}}', false, '/api/console/v1/management/hips/signature/basic/recommendation/cve-mapping/save', now(), true, 'HIPS 시그니처 추천 CVE 맵핑 메타데이터 저장')
    , ('HIPS_SIGNATURE_RECOMMENDATION_REMOVE_UNUSED_RESOURCE', 1, 'HIPS', '{"repeat":{"daily":1},"basic_moment":{"year":"0","month":"0","week":"0","day":"0","hour":0,"minute":30,"second":0}}', false, '/api/console/v1/recommendation/hips/signature/unused-resource/remove/list', now(), true, '취약점 분석 상태 대상 미사용 리소스 제거')
    , ('GROUP_RISK_CLEAN', 1, 'EMS','{"repeat":{"daily":1},"basic_moment":{"year":"0","month":"0","week":"0","day":"0","hour":3,"minute":0,"second":0}}', FALSE, '/api/console/config/grouping/risk_group', now(), TRUE, '미접속 위험 그룹 이동')
    , ('UPDATE_IM', 1, 'AC', '{"repeat":{"minute":1440}}', false, '/api/console/im/pull', now(), true, 'IM Predefined 리스트 가져오기')
    , ('UPDATE_SCM', 1, 'SCM', '{"repeat":{"minute":1440}}', false, '/api/console/scm/pull', now(), true, 'SCM 룰셋 가져오기')
    , ('TASK_CLEAN', 1, 'EMS', '{"repeat":{"daily":1},"basic_moment":{"year":"0","month":"0","week":"0","day":"0","hour":1,"minute":30,"second":0}}', false, '/api/console/ems/task/clean/execute', now(), TRUE, '관리 명령 정리 스케줄')
    , ('HIPS_FW_BLOCK_IP_RULE', 1, 'HIPS',  '{"repeat":{"hourly":1},"basic_moment":{"year":"0","month":"0","week":"0","day":"0","hour":0,"minute":1,"second":0}}', false, '/api/console/v1/management/hips/fw/block-ip-rule/auto/remove', now(), true, '차단 IP 규칙 자동 만료 및 삭제')
    , ('CNAPP', 1, 'CNAPP', '{"repeat":{"daily":1}}', false, '/api/console/cnapp/pull', now(), true, 'CNAPP 취약점 DB 가져오기')
    , ('LOCK_ADMIN', 1, 'EMS', '{"repeat":{"daily":1},"basic_moment":{"year":"0","month":"0","week":"0","day":"0","hour":0,"minute":0,"second":0}}', false, '/api/console/config/admin/lock', now(), true, '미장기사용자 잠금처리')
    , ('HEALTHCHECK_WATCHDOG', 1, 'EMS', '{"repeat":{"minute":3}}', false, '/api/console/healthcheck/watchdog', now(), false, 'HEALTHCHECK WATCHDOG')
    , ('COLRESC', 1, 'EMS', '{"repeat":{"minute":1}}', true, '/api/cron/colresc', now(), true, '/etc/cron.d/colresc 실행')
    , ('EPPSTAT', 1, 'EMS', '{"repeat":{"minute":1}}', true, '/api/cron/eppstat', now(), true, '/etc/cron.d/eppstat 실행')
    , ('NMON', 1, 'EMS', '{"repeat":{"daily":1},"basic_moment":{"year":"0","month":"0","week":"0","day":"0","hour":0,"minute":0,"second":0}}', true, '/api/cron/nmon', now(), true, '/etc/cron.d/nmon 실행')
    , ('LICENSE_UPDATE', 1, 'EMS', '{"repeat":{"daily":1},"basic_moment":{"year":"0","month":"0","week":"0","day":"0","hour":23,"minute":30,"second":0}}', false, '/api/console/config/license/update', now(), true, '라이선스 갱신')
    , ('NEXT_LICENSE_UPDATE', 1, 'EMS', '{"repeat":{"daily":1},"basic_moment":{"year":"0","month":"0","week":"0","day":"0","hour":0,"minute":0,"second":0}}', false, '/api/console/config/next/license/update', now(), true, '대기 라이선스 갱신')
    , ('TIP_HIPS_BLOCK_IP', 1, 'EMS', '{"repeat":{"daily":1},"basic_moment":{"year":"0","month":"0","week":"0","day":"0","hour":5,"minute":30,"second":0}}', false, '/api/console/config/tip_hips_block_ip', now(), false, 'Host IPS TIP 연동')
    , ('NHN_SYNC_SERVER_MAIN', 1, 'EMS', '{"repeat":{"daily":1},"basic_moment":{"year":"0","month":"0","week":"0","day":"0","hour":1,"minute":30,"second":0}}', false, '/api/console/vendor/nhn/sync/server/main', now(), false, 'nhn server synchronization cppm main')
    , ('NHN_SYNC_SERVER_SUB', 1, 'EMS', '{"repeat":{"daily":1},"basic_moment":{"year":"0","month":"0","week":"0","day":"0","hour":2,"minute":30,"second":0}}', false, '/api/console/vendor/nhn/sync/server/sub', now(), false, 'nhn server synchronization cppm sub')
ON CONFLICT ON CONSTRAINT tb_schedule_schedule_code_ukey DO NOTHING;

-- CWPP-3805
-- CWPP-3919
INSERT INTO tb_schedule(schedule_code, schedule_code_index, product_group, schedule, work_all, execute_uri, modified_time, enabled, description)
VALUES
    ('GROUP_RISK_CLEAN', 2, 'EMS','{"repeat":{"daily":1},"basic_moment":{"year":"0","month":"0","week":"0","day":"0","hour":1,"minute":0,"second":0}}', FALSE, '/api/console/config/grouping/risk_group_clean', now(), TRUE, '미접속 위험 그룹 정리')
    , ('HIPS_SIGNATURE_RECOMMENDATION_MERGE', 1, 'HIPS', '{"repeat":{"daily":1},"basic_moment":{"year":"0","month":"0","week":"0","day":"0","hour":3,"minute":0,"second":0}}', false, '/api/console/v1/management/hips/signature/basic/recommendation/scan/node/save', now(), true, '시그니처 노드별 추천 저장')
    , ('LOGROTATE', 1, 'EMS', '{"repeat":{"daily":1},"basic_moment":{"year":"0","month":"0","week":"0","day":"0","hour":0,"minute":15,"second":0}}', true, '/api/cron/logrotate', now(), true, '/etc/cron.daily/logrotate 실행')
ON CONFLICT ON CONSTRAINT tb_schedule_schedule_code_ukey DO UPDATE SET (schedule, work_all, modified_time, enabled) = (EXCLUDED.schedule, EXCLUDED.work_all, EXCLUDED.modified_time, EXCLUDED.enabled);

------------------------------------------------------------------------
select '## tb_config';
------------------------------------------------------------------------
INSERT INTO tb_config (config_group, "key", value, modified_time) 
VALUES 
    ('SYS_INFO', 'time_server_use', 'false', now())
    , ('SYS_INFO', 'response_retry_interval', '7', now())
    , ('SYS_INFO', 'intergrity_scan_schedule', '{"repeat":{"hourly":6}}', now())
    , ('SYS_IP', 'ip_auto_change', 'false', now())
    , ('AGENT_INSTALL_PAGE', 'page_html', '', now())
    , ('AGENT_MGMT_KEY', 'agent_mgmt_key_use', 'false', now())
    , ('AGENT_SEND_LOG', 'send_log_interval', '5', now())
    , ('AGENT_THRESHOLD', 'engine_update_threshold', '3', now())
    , ('AGENT_THRESHOLD', 'manual_scan_threshold', '7', now())
    , ('AGENT_THRESHOLD', 'manual_scan_day_interval', '30', now())
    , ('AGENT_THRESHOLD', 'im_manual_rulecheck_day_interval', '30', now())
    , ('AHNLAB_COM_V3MASTER', 'ahnlab_com_url', 'http://help.ahnlab.com/rdir/link.do', now())
    , ('AHNLAB_COM_V3MASTER', 'locale', 'ko_kr', now())
    , ('AHNLAB_COM_V3MASTER', 'seq', '1810', NULL)
    , ('AHNLAB_COM_V3MASTER_DOWNLOAD_FILE_NAME', 'V3NET_9.0', 'V3_Net_for_Windows_Server_9.0.exe', now())
    , ('AHNLAB_COM_V3MASTER_FILE_SEQ', 'V3NET_9.0', '503', now())
    , ('DB_CLEAN', 'db_clean_condition', '80', now())
    , ('DB_CLEAN', 'db_clean_type', 'disk_usage', now())
    , ('DB_CLEAN', 'db_clean_deadline', '4', now())
    , ('DB_CLEAN', 'opensearch_date_threshold', '365', now())
    , ('DB_BACKUP', 'backup_local_disk_use', 'true', now())
    , ('DB_BACKUP', 'backup_local_disk_path', '/backup', now())
    , ('DB_BACKUP', 'backup_local_disk_max', '2', now())
    , ('DISTRIBUTION', 'concurrent_session_cnt', '256', now())
    , ('DISTRIBUTION', 'speed_limit', '51200', now())
    , ('DISTRIBUTION', 'dist_update_forbid_use', 'false', now())
    , ('DISTRIBUTION', 'dist_update_forbid_product', '[]', now())
    , ('DISTRIBUTION', 'dist_update_protocol', 'http', now())
    , ('domain_setting', 'setting_state', 'not_domain_setting', now())
    , ('GENERAL', 'group_depth', '10', now())
    , ('GENERAL', 'wizard_step', 'INITIAL_ADMIN', now())
    , ('GROUP_ORDER', 'update_flag', 'OFF', now())
    , ('GROUP_ORDER', 'new_group_position', 'BACK', now())
    , ('GROUP_ORDER', 'select_order', 'USER', now())
    , ('GROUPING', 'auto_grouping_use', 'true', now())
    , ('GROUPING', 'auto_grouping_type', 'dept', now())
    , ('GROUPING', 'auto_grouping_path', '/group', now())
    , ('GROUPING', 'auto_grouping_target', 'default_group_agent', now())
    , ('GROUPING', 'auto_grouping_condition', 'ip', now())
    , ('GROUPING', 'apply_policy_on_group_change', 'all', now())
    , ('GROUPING', 'empty_group_clean_use', 'true', now())
    , ('GROUPING', 'empty_group_clean_interval', '7', now())
    , ('MANUAL', 'manual_type', 'server', now())
    , ('REPORT_CLEAN', 'report_clean_interval', '3', now())
    , ('SYS_NET_CERT', 'cert_current_type', 'epp', now())
    , ('SYS_NET_CERT', 'cert_new_saved_server_id', NULL, now())
    , ('SYS_NET_CERT', 'cert_epp_expire_date', NULL, now())
    , ('SYS_NET_CERT', 'cert_site_expire_date', NULL, now())
    , ('SYS_NET_CERT', 'cert_apply_status', '0', now())
    , ('SYS_NET_CERT', 'cert_new_epp_dir', '/opt/ahnlab/cpp/etc/cert/new-epp', now())
    , ('SYS_NET_CERT', 'cert_new_site_dir', '/opt/ahnlab/cpp/etc/cert/new-site', now())
    , ('SYS_NET_CERT', 'cert_upload_epp_dir', '/opt/ahnlab/cpp/etc/cert/upload-epp', now())
    , ('SYS_NET_CERT', 'cert_upload_site_dir', '/opt/ahnlab/cpp/etc/cert/upload-site', now())
    , ('SYS_NET_CERT', 'cert_name_chain_file', 'epp_chain.pem', now())
    , ('SYS_NET_CERT', 'cert_name_cert_file', 'epp_cert.pem', now())
    , ('SYS_NET_CERT', 'cert_name_key_file', 'epp_key.pem', now())
    , ('SYS_NET_CERT', 'cert_name_keystore_file', 'epp_keystore.p12', now())
    , ('SYS_NET_CERT', 'cert_name_keypass_file', 'epp_keypass', now())
    , ('SYS_NET_CERT', 'cert_name_haproxy_file', 'haproxy.pem', now())
    , ('SYS_NET_CERT', 'cert_name_lighttpd_file', 'lighttpd.pem', now())
    , ('SYS_VIRTUAL_SYSTEM', 'virtual_system_intergration_use', 'false', now())
    , ('UPDATE', 'ast_url', 'http://astweb.ahnlab.co.kr/astmain', now())
    , ('UPDATE', 'ast_connect_country', '082', now())
    , ('UPDATE', 'yum_protocol', 'http', now())
    , ('UPDATE', 'yum_repo_path', '/opt/repo/', now())
    , ('UPDATE', 'yum_current_repo', 'current', now())
    , ('UPDATE', 'yum_patch_repo', 'patch', now())
    , ('UPDATE', 'update_action_retry', '2', now())
    , ('UPDATE', 'proxy_server_use', 'false', now())
    , ('UPDATE', 'update_interval', '3', now())
    , ('UPDATE', 'update_forbid_use', 'false', now())
    , ('UPDATE', 'proxy_server_ip', NULL, now())
    , ('UPDATE', 'proxy_server_port', NULL, now())
    , ('UPDATE', 'proxy_server_id', NULL, now())
    , ('UPDATE', 'proxy_server_pw', NULL, now())
    , ('UPDATE', 'update_server_type', 'ahnlab', now())
    , ('UPDATE', 'admin_version', NULL, now())
    , ('UPDATE', 'server_version', NULL, now())
    , ('UPDATE', 'integrated_version', '1.0', now())
    , ('UPDATE', 'agent_version', NULL, now())
    , ('UPDATE', 'proxy_conceal_key', NULL, now())
    , ('UPDATE', 'average_cpu_usage', '90', NOW())
    , ('UPDATE', 'average_download_speed', '0', NOW())
    , ('USER_BROKER', 'user_broker_use', 'false', now())
    , ('V3_PKG_UPDATE', 'v3_pkg_update_use', 'false', now())
    , ('V3_PKG_UPDATE', 'v3_pkg_auto_update_use', 'false', now())
    , ('NETWORK', 'use_nat', 'false', now())
    , ('SYS_NET_CERT', 'correlation_alret_sent', 'false', now())
    , ('UPDATE', 'update_server_master', '1', now() )
    , ('GENERAL', 'batch_sleep', '0', now())
    , ('CLOUD_PROXY', 'cloud_proxy', '{"server":"","port":"","id":"","password":"","use_proxy":false,"sync_interval":30,"remove_no_exist_instance":false}', now())
    , ('UPDATE_COUNTRY', 'ahnlab', '{"update_server_type":"ahnlab","proxy_server_use":false,"proxy_server_ip" : "","proxy_server_port": "","proxy_server_id": "","proxy_server_pw": "","proxy_conceal_key": "","ast_url": "https://astweb.ahnlab.com/asthome","update_interval": "1440" ,"user_defined_server_path": ""}', now())
    , ('UPDATE_HIPS_SIGNATURE', 'ahnlab', '{"update_server_type":"ahnlab","proxy_server_use":false,"proxy_server_ip" : "","proxy_server_port": "","proxy_server_id": "","proxy_server_pw": "","proxy_conceal_key": "","ast_url": "https://astweb.ahnlab.com/asthome","update_interval": "1440" ,"user_defined_server_path": ""}', now())
    , ('HIPS_MGMT', 'IPS_RECOMMEND', '{"recommendType":"MANUAL", "period":"14"}', now())
    , ('AGENT_RISK_GROUP', 'unconnected_use', 'true', now())
    , ('AGENT_RISK_GROUP', 'unconnected_period', '7', now())
    , ('AGENT_RISK_GROUP', 'risk_group_clean_use', 'true', now())
    , ('AGENT_RISK_GROUP', 'risk_group_clean_period', '7', now())
    , ('HIPS_MGMT', 'IPS_SIGNATURE_ACTION', 'default', now())
    , ('UPDATE_IM', 'ahnlab', '{"update_server_type":"ahnlab","proxy_server_use":false,"proxy_server_ip" : "","proxy_server_port": "","proxy_server_id": "","proxy_server_pw": "","proxy_conceal_key": "","ast_url": "https://astweb.ahnlab.com/asthome","update_interval": "1440" ,"user_defined_server_path": ""}', now()) 
    , ('AGENT_MANAGE_PRODUCT', 'manage_product', '{"V3NET_9.0":true}', NOW())
    , ('UPDATE_SCM', 'ahnlab', '{"update_server_type":"ahnlab","proxy_server_use":false,"proxy_server_ip" : "","proxy_server_port": "","proxy_server_id": "","proxy_server_pw": "","proxy_conceal_key": "","ast_url": "https://astweb.ahnlab.com/asthome","update_interval": "1440" ,"user_defined_server_path": ""}', now()) 
    , ('SYSLOG', 'group_name_path', 'true', now())
    , ('HIPS_MGMT', 'IPS_RECOMMEND_LAST_EXECUTION_DATE', NULL, now())
    , ('AGENT_RISK_GROUP', 'remain_log', 'false', NOW())
    , ('AGENT_RISK_GROUP', 'remain_log_check_count', '100', NOW())
    , ('EVENT_LOG', 'log_limit', '100000', NOW())
    , ('HIPS_MGMT', 'IPS_SIGNATURE_PACKET_CAPTURE', 'default', now())
    , ('ASSET_INFO', 'usage', 'false', NOW())
    , ('ASSET_INFO', 'primary_key', 'IP', NOW())
    , ('CNAPP', 'cnapp_server', '{"server_ip":"127.0.0.1", "server_port":"9001"}', now())
    , ('CNAPP', 'ahnlab', '{"update_server_type":"ahnlab","proxy_server_use":false,"proxy_server_ip" : "","proxy_server_port": "","proxy_server_id": "","proxy_server_pw": "","proxy_conceal_key": "","ast_url": "https://astweb.ahnlab.com/asthome","update_interval": "1440" ,"user_defined_server_path": ""}', now())
    , ('CNAPP', 'license_usage_count', '0', now())
    , ('LICENSE_UPDATE_INFO', '1.0', null, NOW())
    , ('LICENSE_UPDATE_INFO', '2.0', null, NOW())
    , ('METERING', 'metering_setting', '{"is_use": false,"duration": "60m"}', now())
    , ('LONG_TERM_INACTIVITY', 'enable_long_term_inactive_user_blocking', 'false', NOW())
    , ('LONG_TERM_INACTIVITY', 'set_long_term_inactivity_period', '1', NOW())
    , ('LONG_TERM_INACTIVITY', 'block_or_delete_on_long_term_inactivity', 'block', NOW())
    , ('SYS_LICENSE', 'cert_license', 'EMS,AGENT,V3NET_9.0,V3NET_LU,AC_CLIENT,HIPS_CLIENT,SCM_CLIENT,CNAPP,AMC_CLIENT', now())
    , ('OPENSEARCH', 'language', 'ko', NOW())
    , ('OPENSEARCH', 'csv_size_limit', '5', NOW())
    , ('COMMAND_DISCLOSURE', 'V3_COLLECT_FEL', 'false', NOW())
    , ('AGENT_DUPLICATION_POLICY', 'INHERIT', 'false', NOW())
    , ('TIP_HIPS_BLOCK_IP', 'hips_tip_is_use', 'false', NOW())
    , ('TIP_HIPS_BLOCK_IP', 'hips_tip_access_key', '', NOW())
    , ('TIP_HIPS_BLOCK_IP', 'hips_tip_conceal_key', '', NOW())
    , ('TIP_HIPS_BLOCK_IP', 'hips_block_ip_sync_period', '1', NOW())
    , ('TIP_HIPS_BLOCK_IP', 'hips_block_ip_rule_use', 'false', NOW())
    , ('TIP_HIPS_BLOCK_IP', 'hips_block_ip_action', 'detect', NOW())
    , ('TIP_HIPS_BLOCK_IP', 'hips_block_ip_auto_expiration', 'true', NOW())
    , ('TIP_HIPS_BLOCK_IP', 'hips_block_ip_expiration_time', '1', NOW())
    , ('TIP_HIPS_BLOCK_IP', 'hips_block_ip_auto_remove', 'false', NOW())

    , ('HIDDEN', 'open_customer_dept_api_info', '{"company":"none","cppmType":"none","apiServerCount":"http://1.2.3.4:8181/api/v1/config/CIs/servers/count","apiServerList":"http://1.2.3.4:8181/api/v1/config/CIs/servers"}', NOW())
ON CONFLICT (config_group, "key") DO NOTHING;

INSERT INTO tb_config (config_group, "key", value, modified_time) 
SELECT 'DEFAULT_SERVICE_PORT', service_type, port, now() FROM tb_service_port
ON CONFLICT(config_group, "key") DO UPDATE SET(value, modified_time) = (EXCLUDED.value, EXCLUDED.modified_time);

INSERT INTO tb_config (config_group, "key", value, modified_time) 
VALUES
    ('METERING', 'metering_send', '{"is_use": true,"type": "cycle","cycle": "60m"}', now())
    , ('METERING', 'clean_target_collection','tb_product_usage', now())
    , ('METERING', 'clean_month_interval','4', now())
    , ('METERING', 'common_log_clean_interval_days', '365', now())
ON CONFLICT(config_group, "key") DO UPDATE SET(value, modified_time) = (EXCLUDED.value, EXCLUDED.modified_time);

INSERT INTO tb_config (config_group, "key", value, modified_time)
VALUES ('MAIL_SERVER', 'otp_use', 'false', now())
ON CONFLICT (config_group, "key") DO UPDATE SET modified_time = EXCLUDED.modified_time;
------------------------------------------------------------------------
select '## tb_search_field';
DELETE FROM tb_search_field;
------------------------------------------------------------------------
INSERT INTO tb_search_field (document_log_type, field, data_type)
VALUES 
    -- AcAccessEventIndex (AC_ACCESS_EVENT_LOG)
    ('AC_ACCESS_EVENT_LOG', 'document_id', 'text'),
    ('AC_ACCESS_EVENT_LOG', 'document_created_time', 'date'),
    ('AC_ACCESS_EVENT_LOG', 'translated', 'text'),
    ('AC_ACCESS_EVENT_LOG', 'document_log_type', 'text'),
    ('AC_ACCESS_EVENT_LOG', 'document_log_type_tw', 'text'),
    ('AC_ACCESS_EVENT_LOG', 'access_path', 'text'),
    ('AC_ACCESS_EVENT_LOG', 'action', 'text'),
    ('AC_ACCESS_EVENT_LOG', 'action_tw', 'text'),
    ('AC_ACCESS_EVENT_LOG', 'action_type', 'text'),
    ('AC_ACCESS_EVENT_LOG', 'action_type_tw', 'text'),
    ('AC_ACCESS_EVENT_LOG', 'asd_reputation', 'text'),
    ('AC_ACCESS_EVENT_LOG', 'client_time', 'date'),
    ('AC_ACCESS_EVENT_LOG', 'computer_name', 'text'),
    ('AC_ACCESS_EVENT_LOG', 'data_uuid', 'text'),
    ('AC_ACCESS_EVENT_LOG', 'department', 'text'),
    ('AC_ACCESS_EVENT_LOG', 'file_creation_time', 'date'),
    ('AC_ACCESS_EVENT_LOG', 'file_hash', 'text'),
    ('AC_ACCESS_EVENT_LOG', 'file_last_write_time', 'date'),
    ('AC_ACCESS_EVENT_LOG', 'file_signer', 'text'),
    ('AC_ACCESS_EVENT_LOG', 'file_size', 'text'),
    ('AC_ACCESS_EVENT_LOG', 'file_supplier', 'text'),
    ('AC_ACCESS_EVENT_LOG', 'file_version', 'text'),
    ('AC_ACCESS_EVENT_LOG', 'ip', 'ip'),
    ('AC_ACCESS_EVENT_LOG', 'login_id', 'text'),
    ('AC_ACCESS_EVENT_LOG', 'mode', 'text'),
    ('AC_ACCESS_EVENT_LOG', 'node_id', 'long'),
    ('AC_ACCESS_EVENT_LOG', 'pid', 'text'),
    ('AC_ACCESS_EVENT_LOG', 'process_name', 'text'),
    ('AC_ACCESS_EVENT_LOG', 'process_path', 'text'),
    ('AC_ACCESS_EVENT_LOG', 'process_user_id', 'text'),
    ('AC_ACCESS_EVENT_LOG', 'process_user_name', 'text'),
    ('AC_ACCESS_EVENT_LOG', 'reason', 'text'),
    ('AC_ACCESS_EVENT_LOG', 'reason_tw', 'text'),
    ('AC_ACCESS_EVENT_LOG', 'tz_offset', 'long'),
    ('AC_ACCESS_EVENT_LOG', 'user_name', 'text'),

    -- AcAgentEventIndex (AC_AGENT_EVENT_LOG)
    ('AC_AGENT_EVENT_LOG', 'document_id', 'text'),
    ('AC_AGENT_EVENT_LOG', 'document_created_time', 'date'),
    ('AC_AGENT_EVENT_LOG', 'translated', 'text'),
    ('AC_AGENT_EVENT_LOG', 'document_log_type', 'text'),
    ('AC_AGENT_EVENT_LOG', 'document_log_type_tw', 'text'),
    ('AC_AGENT_EVENT_LOG', 'client_time', 'date'),
    ('AC_AGENT_EVENT_LOG', 'computer_name', 'text'),
    ('AC_AGENT_EVENT_LOG', 'data_uuid', 'text'),
    ('AC_AGENT_EVENT_LOG', 'department', 'text'),
    ('AC_AGENT_EVENT_LOG', 'email', 'text'),
    ('AC_AGENT_EVENT_LOG', 'empno', 'text'),
    ('AC_AGENT_EVENT_LOG', 'ip', 'ip'),
    ('AC_AGENT_EVENT_LOG', 'log_string_args', 'text'),
    ('AC_AGENT_EVENT_LOG', 'log_string_id', 'text'),
    ('AC_AGENT_EVENT_LOG', 'login_id', 'text'),
    ('AC_AGENT_EVENT_LOG', 'node_id', 'long'),
    ('AC_AGENT_EVENT_LOG', 'phone', 'text'),
    ('AC_AGENT_EVENT_LOG', 'type', 'text'),
    ('AC_AGENT_EVENT_LOG', 'type_tw', 'text'),
    ('AC_AGENT_EVENT_LOG', 'tz_offset', 'long'),
    ('AC_AGENT_EVENT_LOG', 'user_name', 'text'),

    -- AcExecEventIndex (AC_EXEC_EVENT_LOG)
    ('AC_EXEC_EVENT_LOG', 'document_id', 'text'),
    ('AC_EXEC_EVENT_LOG', 'document_created_time', 'date'),
    ('AC_EXEC_EVENT_LOG', 'translated', 'text'),
    ('AC_EXEC_EVENT_LOG', 'document_log_type', 'text'),
    ('AC_EXEC_EVENT_LOG', 'document_log_type_tw', 'text'),
    ('AC_EXEC_EVENT_LOG', 'action', 'text'),
    ('AC_EXEC_EVENT_LOG', 'action_tw', 'text'),
    ('AC_EXEC_EVENT_LOG', 'asd_reputation', 'text'),
    ('AC_EXEC_EVENT_LOG', 'asd_reputation_tw', 'text'),
    ('AC_EXEC_EVENT_LOG', 'client_time', 'date'),
    ('AC_EXEC_EVENT_LOG', 'computer_name', 'text'),
    ('AC_EXEC_EVENT_LOG', 'data_uuid', 'text'),
    ('AC_EXEC_EVENT_LOG', 'department', 'text'),
    ('AC_EXEC_EVENT_LOG', 'email', 'text'),
    ('AC_EXEC_EVENT_LOG', 'empno', 'text'),
    ('AC_EXEC_EVENT_LOG', 'file_creation_time', 'date'),
    ('AC_EXEC_EVENT_LOG', 'file_hash', 'text'),
    ('AC_EXEC_EVENT_LOG', 'file_last_write_time', 'date'),
    ('AC_EXEC_EVENT_LOG', 'file_name', 'text'),
    ('AC_EXEC_EVENT_LOG', 'file_path', 'text'),
    ('AC_EXEC_EVENT_LOG', 'file_signer', 'text'),
    ('AC_EXEC_EVENT_LOG', 'file_size', 'text'),
    ('AC_EXEC_EVENT_LOG', 'file_supplier', 'text'),
    ('AC_EXEC_EVENT_LOG', 'file_version', 'text'),
    ('AC_EXEC_EVENT_LOG', 'ip', 'ip'),
    ('AC_EXEC_EVENT_LOG', 'log_string_args', 'text'),
    ('AC_EXEC_EVENT_LOG', 'log_string_id', 'text'),
    ('AC_EXEC_EVENT_LOG', 'login_id', 'text'),
    ('AC_EXEC_EVENT_LOG', 'mode', 'text'),
    ('AC_EXEC_EVENT_LOG', 'node_id', 'long'),
    ('AC_EXEC_EVENT_LOG', 'owner_pid', 'long'),
    ('AC_EXEC_EVENT_LOG', 'owner_process_name', 'text'),
    ('AC_EXEC_EVENT_LOG', 'phone', 'text'),
    ('AC_EXEC_EVENT_LOG', 'process_user_id', 'text'),
    ('AC_EXEC_EVENT_LOG', 'process_user_name', 'text'),
    ('AC_EXEC_EVENT_LOG', 'reason', 'text'),
    ('AC_EXEC_EVENT_LOG', 'reason_tw', 'text'),
    ('AC_EXEC_EVENT_LOG', 'type', 'text'),
    ('AC_EXEC_EVENT_LOG', 'tz_offset', 'long'),
    ('AC_EXEC_EVENT_LOG', 'user_id', 'long'),
    ('AC_EXEC_EVENT_LOG', 'user_name', 'text'),

    -- AgentEventIndex (AGENT_EVENT_LOG)
    ('AGENT_EVENT_LOG', 'document_id', 'text'),
    ('AGENT_EVENT_LOG', 'document_created_time', 'date'),
    ('AGENT_EVENT_LOG', 'translated', 'text'),
    ('AGENT_EVENT_LOG', 'document_log_type', 'text'),
    ('AGENT_EVENT_LOG', 'document_log_type_tw', 'text'),
    ('AGENT_EVENT_LOG', 'client_time', 'date'),
    ('AGENT_EVENT_LOG', 'computer_name', 'text'),
    ('AGENT_EVENT_LOG', 'data_uuid', 'text'),
    ('AGENT_EVENT_LOG', 'department', 'text'),
    ('AGENT_EVENT_LOG', 'ip', 'ip'),
    ('AGENT_EVENT_LOG', 'log_string_args', 'text'),
    ('AGENT_EVENT_LOG', 'log_string_id', 'text'),
    ('AGENT_EVENT_LOG', 'login_id', 'text'),
    ('AGENT_EVENT_LOG', 'node_id', 'long'),
    ('AGENT_EVENT_LOG', 'type', 'text'),
    ('AGENT_EVENT_LOG', 'tz_offset', 'long'),
    ('AGENT_EVENT_LOG', 'user_name', 'text'),

    -- AgentInstallPkgIndex (AGENT_INSTALL_PKG_LOG)
    ('AGENT_INSTALL_PKG_LOG', 'document_id', 'text'),
    ('AGENT_INSTALL_PKG_LOG', 'document_created_time', 'date'),
    ('AGENT_INSTALL_PKG_LOG', 'translated', 'text'),
    ('AGENT_INSTALL_PKG_LOG', 'document_log_type', 'text'),
    ('AGENT_INSTALL_PKG_LOG', 'document_log_type_tw', 'text'),
    ('AGENT_INSTALL_PKG_LOG', 'data_uuid', 'text'),
    ('AGENT_INSTALL_PKG_LOG', 'file_name', 'text'),
    ('AGENT_INSTALL_PKG_LOG', 'log_string_args', 'text'),
    ('AGENT_INSTALL_PKG_LOG', 'log_string_id', 'text'),
    ('AGENT_INSTALL_PKG_LOG', 'server_time', 'date'),

    -- AuditIndex (AUDIT_LOG)
    ('AUDIT_LOG', 'document_id', 'text'),
    ('AUDIT_LOG', 'document_created_time', 'date'),
    ('AUDIT_LOG', 'translated', 'text'),
    ('AUDIT_LOG', 'document_log_type', 'text'),
    ('AUDIT_LOG', 'document_log_type_tw', 'text'),
    ('AUDIT_LOG', 'admin_id', 'text'),
    ('AUDIT_LOG', 'data_uuid', 'text'),
    ('AUDIT_LOG', 'log_string_args', 'text'),
    ('AUDIT_LOG', 'log_string_id', 'text'),
    ('AUDIT_LOG', 'login_ip', 'ip'),
    ('AUDIT_LOG', 'server_time', 'date'),

    -- BackupIndex (BACKUP_LOG)
    ('BACKUP_LOG', 'document_id', 'text'),
    ('BACKUP_LOG', 'document_created_time', 'date'),
    ('BACKUP_LOG', 'translated', 'text'),
    ('BACKUP_LOG', 'document_log_type', 'text'),
    ('BACKUP_LOG', 'document_log_type_tw', 'text'),
    ('BACKUP_LOG', 'data_uuid', 'text'),
    ('BACKUP_LOG', 'log_string_args', 'text'),
    ('BACKUP_LOG', 'log_string_id', 'text'),
    ('BACKUP_LOG', 'server_id', 'text'),
    ('BACKUP_LOG', 'server_ip', 'ip'),
    ('BACKUP_LOG', 'server_name', 'text'),
    ('BACKUP_LOG', 'server_time', 'date'),
    ('BACKUP_LOG', 'type', 'text'),
    ('BACKUP_LOG', 'type_tw', 'text'),
    ('BACKUP_LOG', 'tz_offset', 'long'),

    -- CnappEventIndex (CNAPP_EVENT_LOG)
    ('CNAPP_EVENT_LOG', 'document_id', 'text'),
    ('CNAPP_EVENT_LOG', 'document_created_time', 'date'),
    ('CNAPP_EVENT_LOG', 'translated', 'text'),
    ('CNAPP_EVENT_LOG', 'document_log_type', 'text'),
    ('CNAPP_EVENT_LOG', 'document_log_type_tw', 'text'),
    ('CNAPP_EVENT_LOG', 'client_time', 'date'),
    ('CNAPP_EVENT_LOG', 'data_uuid', 'text'),
    ('CNAPP_EVENT_LOG', 'log_string_args', 'text'),
    ('CNAPP_EVENT_LOG', 'log_string_id', 'text'),
    ('CNAPP_EVENT_LOG', 'type', 'text'),
    ('CNAPP_EVENT_LOG', 'type_tw', 'text'),
    ('CNAPP_EVENT_LOG', 'tz_offset', 'long'),

    -- CnappMalwareScanEventIndex (CNAPP_MALWARE_SCAN_EVENT_LOG)
    ('CNAPP_MALWARE_SCAN_EVENT_LOG', 'document_id', 'text'),
    ('CNAPP_MALWARE_SCAN_EVENT_LOG', 'document_created_time', 'date'),
    ('CNAPP_MALWARE_SCAN_EVENT_LOG', 'translated', 'text'),
    ('CNAPP_MALWARE_SCAN_EVENT_LOG', 'document_log_type', 'text'),
    ('CNAPP_MALWARE_SCAN_EVENT_LOG', 'document_log_type_tw', 'text'),
    ('CNAPP_MALWARE_SCAN_EVENT_LOG', 'client_time', 'date'),
    ('CNAPP_MALWARE_SCAN_EVENT_LOG', 'data_uuid', 'text'),
    ('CNAPP_MALWARE_SCAN_EVENT_LOG', 'engine_version', 'text'),
    ('CNAPP_MALWARE_SCAN_EVENT_LOG', 'file_name', 'text'),
    ('CNAPP_MALWARE_SCAN_EVENT_LOG', 'image_hash', 'text'),
    ('CNAPP_MALWARE_SCAN_EVENT_LOG', 'image_url', 'text'),
    ('CNAPP_MALWARE_SCAN_EVENT_LOG', 'log_string_id', 'text'),
    ('CNAPP_MALWARE_SCAN_EVENT_LOG', 'registry_type', 'text'),
    ('CNAPP_MALWARE_SCAN_EVENT_LOG', 'type', 'text'),
    ('CNAPP_MALWARE_SCAN_EVENT_LOG', 'tz_offset', 'long'),
    ('CNAPP_MALWARE_SCAN_EVENT_LOG', 'virus_name', 'text'),
    ('CNAPP_MALWARE_SCAN_EVENT_LOG', 'virus_type', 'text'),

    -- CnappVulnerabilityScanEventIndex (CNAPP_VULNERABILITY_SCAN_EVENT_LOG)
    ('CNAPP_VULNERABILITY_SCAN_EVENT_LOG', 'document_id', 'text'),
    ('CNAPP_VULNERABILITY_SCAN_EVENT_LOG', 'document_created_time', 'date'),
    ('CNAPP_VULNERABILITY_SCAN_EVENT_LOG', 'translated', 'text'),
    ('CNAPP_VULNERABILITY_SCAN_EVENT_LOG', 'document_log_type', 'text'),
    ('CNAPP_VULNERABILITY_SCAN_EVENT_LOG', 'document_log_type_tw', 'text'),
    ('CNAPP_VULNERABILITY_SCAN_EVENT_LOG', 'client_time', 'date'),
    ('CNAPP_VULNERABILITY_SCAN_EVENT_LOG', 'cve_id', 'text'),
    ('CNAPP_VULNERABILITY_SCAN_EVENT_LOG', 'data_uuid', 'text'),
    ('CNAPP_VULNERABILITY_SCAN_EVENT_LOG', 'fixed_version', 'text'),
    ('CNAPP_VULNERABILITY_SCAN_EVENT_LOG', 'image_hash', 'text'),
    ('CNAPP_VULNERABILITY_SCAN_EVENT_LOG', 'image_url', 'text'),
    ('CNAPP_VULNERABILITY_SCAN_EVENT_LOG', 'log_string_id', 'text'),
    ('CNAPP_VULNERABILITY_SCAN_EVENT_LOG', 'package_name', 'text'),
    ('CNAPP_VULNERABILITY_SCAN_EVENT_LOG', 'package_version', 'text'),
    ('CNAPP_VULNERABILITY_SCAN_EVENT_LOG', 'registry_type', 'text'),
    ('CNAPP_VULNERABILITY_SCAN_EVENT_LOG', 'severity', 'text'),
    ('CNAPP_VULNERABILITY_SCAN_EVENT_LOG', 'severity_tw', 'text'),
    ('CNAPP_VULNERABILITY_SCAN_EVENT_LOG', 'type', 'text'),
    ('CNAPP_VULNERABILITY_SCAN_EVENT_LOG', 'tz_offset', 'long'),

    -- EngineUpdateIndex (ENGINE_UPDATE_LOG)
    ('ENGINE_UPDATE_LOG', 'document_id', 'text'),
    ('ENGINE_UPDATE_LOG', 'document_created_time', 'date'),
    ('ENGINE_UPDATE_LOG', 'translated', 'text'),
    ('ENGINE_UPDATE_LOG', 'document_log_type', 'text'),
    ('ENGINE_UPDATE_LOG', 'document_log_type_tw', 'text'),
    ('ENGINE_UPDATE_LOG', 'data_uuid', 'text'),
    ('ENGINE_UPDATE_LOG', 'log_string_args', 'text'),
    ('ENGINE_UPDATE_LOG', 'log_string_id', 'text'),
    ('ENGINE_UPDATE_LOG', 'server_id', 'text'),
    ('ENGINE_UPDATE_LOG', 'server_ip', 'ip'),
    ('ENGINE_UPDATE_LOG', 'server_name', 'text'),
    ('ENGINE_UPDATE_LOG', 'server_time', 'date'),
    ('ENGINE_UPDATE_LOG', 'type', 'text'),
    ('ENGINE_UPDATE_LOG', 'type_tw', 'text'),
    ('ENGINE_UPDATE_LOG', 'tz_offset', 'long'),

    -- HipsAgentEventIndex (HIPS_AGENT_EVENT_LOG)
    ('HIPS_AGENT_EVENT_LOG', 'document_id', 'text'),
    ('HIPS_AGENT_EVENT_LOG', 'document_created_time', 'date'),
    ('HIPS_AGENT_EVENT_LOG', 'translated', 'text'),
    ('HIPS_AGENT_EVENT_LOG', 'document_log_type', 'text'),
    ('HIPS_AGENT_EVENT_LOG', 'document_log_type_tw', 'text'),
    ('HIPS_AGENT_EVENT_LOG', 'client_time', 'date'),
    ('HIPS_AGENT_EVENT_LOG', 'computer_name', 'text'),
    ('HIPS_AGENT_EVENT_LOG', 'data_uuid', 'text'),
    ('HIPS_AGENT_EVENT_LOG', 'department', 'text'),
    ('HIPS_AGENT_EVENT_LOG', 'ip', 'ip'),
    ('HIPS_AGENT_EVENT_LOG', 'is_runtime', 'boolean'),
    ('HIPS_AGENT_EVENT_LOG', 'log_string_args', 'text'),
    ('HIPS_AGENT_EVENT_LOG', 'log_string_id', 'text'),
    ('HIPS_AGENT_EVENT_LOG', 'login_id', 'text'),
    ('HIPS_AGENT_EVENT_LOG', 'node_id', 'long'),
    ('HIPS_AGENT_EVENT_LOG', 'type', 'text'),
    ('HIPS_AGENT_EVENT_LOG', 'type_tw', 'text'),
    ('HIPS_AGENT_EVENT_LOG', 'tz_offset', 'long'),
    ('HIPS_AGENT_EVENT_LOG', 'user_name', 'text'),

    -- HipsDetectEventIndex (HIPS_DETECT_EVENT_LOG)
    ('HIPS_DETECT_EVENT_LOG', 'document_id', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'document_created_time', 'date'),
    ('HIPS_DETECT_EVENT_LOG', 'translated', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'document_log_type', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'document_log_type_tw', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'application_type', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'attack_try_cnt', 'long'),
    ('HIPS_DETECT_EVENT_LOG', 'attackid', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'attackname', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'block', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'block_tw', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'block_action', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'block_action_tw', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'client_time', 'date'),
    ('HIPS_DETECT_EVENT_LOG', 'computer_name', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'container_id', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'container_name', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'data_uuid', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'is_runtime', 'boolean'),
    ('HIPS_DETECT_EVENT_LOG', 'department', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'detect_bytes', 'long'),
    ('HIPS_DETECT_EVENT_LOG', 'detect_pkts', 'long'),
    ('HIPS_DETECT_EVENT_LOG', 'detour', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'dst_country', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'dst_ip', 'ip'),
    ('HIPS_DETECT_EVENT_LOG', 'dst_port', 'long'),
    ('HIPS_DETECT_EVENT_LOG', 'etime', 'date'),
    ('HIPS_DETECT_EVENT_LOG', 'image_name', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'ip', 'ip'),
    ('HIPS_DETECT_EVENT_LOG', 'ips_mode', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'ips_mode_tw', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'login_id', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'logtype', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'mode', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'ndir', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'ndir_tw', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'node_id', 'long'),
    ('HIPS_DETECT_EVENT_LOG', 'offset', 'long'),
    ('HIPS_DETECT_EVENT_LOG', 'pattern_size', 'long'),
    ('HIPS_DETECT_EVENT_LOG', 'payload', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'pdir', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'pod_id', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'pod_name', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'ns_id', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'ns_name', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'k8s_node_id', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'priority', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'priority_tw', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'protection_area', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'proto', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'raw_type', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'sdir', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'sdir_tw', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'service_src_country', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'service_src_ip', 'ip'),
    ('HIPS_DETECT_EVENT_LOG', 'src_country', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'src_ip', 'ip'),
    ('HIPS_DETECT_EVENT_LOG', 'src_port', 'long'),
    ('HIPS_DETECT_EVENT_LOG', 'src_service', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'stime', 'date'),
    ('HIPS_DETECT_EVENT_LOG', 'tz_offset', 'long'),
    ('HIPS_DETECT_EVENT_LOG', 'user_name', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'v_data', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'session_id', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'ip_auto_mask', 'text'),
    ('HIPS_DETECT_EVENT_LOG', 'tstamp', 'date'),

    -- HipsFwEventIndex (HIPS_FW_EVENT_LOG)
    ('HIPS_FW_EVENT_LOG', 'document_id', 'text'),
    ('HIPS_FW_EVENT_LOG', 'document_created_time', 'date'),
    ('HIPS_FW_EVENT_LOG', 'translated', 'text'),
    ('HIPS_FW_EVENT_LOG', 'document_log_type', 'text'),
    ('HIPS_FW_EVENT_LOG', 'document_log_type_tw', 'text'),
    ('HIPS_FW_EVENT_LOG', 'block', 'text'),
    ('HIPS_FW_EVENT_LOG', 'block_tw', 'text'),
    ('HIPS_FW_EVENT_LOG', 'block_nation', 'text'),
    ('HIPS_FW_EVENT_LOG', 'block_reason', 'text'),
    ('HIPS_FW_EVENT_LOG', 'block_reason_tw', 'text'),
    ('HIPS_FW_EVENT_LOG', 'client_time', 'date'),
    ('HIPS_FW_EVENT_LOG', 'computer_name', 'text'),
    ('HIPS_FW_EVENT_LOG', 'container_id', 'text'),
    ('HIPS_FW_EVENT_LOG', 'container_name', 'text'),
    ('HIPS_FW_EVENT_LOG', 'data_uuid', 'text'),
    ('HIPS_FW_EVENT_LOG', 'department', 'text'),
    ('HIPS_FW_EVENT_LOG', 'type', 'text'),
    ('HIPS_FW_EVENT_LOG', 'detect_bytes', 'long'),
    ('HIPS_FW_EVENT_LOG', 'detect_pkts', 'long'),
    ('HIPS_FW_EVENT_LOG', 'dst_country', 'text'),
    ('HIPS_FW_EVENT_LOG', 'dst_ip', 'ip'),
    ('HIPS_FW_EVENT_LOG', 'dst_port', 'long'),
    ('HIPS_FW_EVENT_LOG', 'etime', 'date'),
    ('HIPS_FW_EVENT_LOG', 'image_name', 'text'),
    ('HIPS_FW_EVENT_LOG', 'ip', 'ip'),
    ('HIPS_FW_EVENT_LOG', 'is_runtime', 'boolean'),
    ('HIPS_FW_EVENT_LOG', 'k8s_node_id', 'text'),
    ('HIPS_FW_EVENT_LOG', 'login_id', 'text'),
    ('HIPS_FW_EVENT_LOG', 'mode', 'text'),
    ('HIPS_FW_EVENT_LOG', 'ndir', 'text'),
    ('HIPS_FW_EVENT_LOG', 'node_id', 'long'),
    ('HIPS_FW_EVENT_LOG', 'ns_id', 'text'),
    ('HIPS_FW_EVENT_LOG', 'ns_name', 'text'),
    ('HIPS_FW_EVENT_LOG', 'pdir', 'text'),
    ('HIPS_FW_EVENT_LOG', 'pod_id', 'text'),
    ('HIPS_FW_EVENT_LOG', 'pod_name', 'text'),
    ('HIPS_FW_EVENT_LOG', 'policy_name', 'text'),
    ('HIPS_FW_EVENT_LOG', 'proto', 'text'),
    ('HIPS_FW_EVENT_LOG', 'rule_name', 'text'),
    ('HIPS_FW_EVENT_LOG', 'service_src_country', 'text'),
    ('HIPS_FW_EVENT_LOG', 'service_src_ip', 'ip'),
    ('HIPS_FW_EVENT_LOG', 'src_country', 'text'),
    ('HIPS_FW_EVENT_LOG', 'src_ip', 'ip'),
    ('HIPS_FW_EVENT_LOG', 'src_port', 'long'),
    ('HIPS_FW_EVENT_LOG', 'stime', 'date'),
    ('HIPS_FW_EVENT_LOG', 'tz_offset', 'long'),
    ('HIPS_FW_EVENT_LOG', 'user_name', 'text'),
    ('HIPS_FW_EVENT_LOG', 'session_id', 'text'),
    ('HIPS_FW_EVENT_LOG', 'ip_auto_mask', 'text'),
    ('HIPS_FW_EVENT_LOG', 'tstamp', 'date'),

    -- ImDetectEventIndex (IM_DETECT_EVENT_LOG)
    ('IM_DETECT_EVENT_LOG', 'document_id', 'text'),
    ('IM_DETECT_EVENT_LOG', 'document_created_time', 'date'),
    ('IM_DETECT_EVENT_LOG', 'translated', 'text'),
    ('IM_DETECT_EVENT_LOG', 'document_log_type', 'text'),
    ('IM_DETECT_EVENT_LOG', 'document_log_type_tw', 'text'),
    ('IM_DETECT_EVENT_LOG', 'action_time', 'date'),
    ('IM_DETECT_EVENT_LOG', 'client_time', 'date'),
    ('IM_DETECT_EVENT_LOG', 'compliance', 'text'),
    ('IM_DETECT_EVENT_LOG', 'compression_count', 'long'),
    ('IM_DETECT_EVENT_LOG', 'computer_name', 'text'),
    ('IM_DETECT_EVENT_LOG', 'data_uuid', 'text'),
    ('IM_DETECT_EVENT_LOG', 'department', 'text'),
    ('IM_DETECT_EVENT_LOG', 'detector_type', 'text'),
    ('IM_DETECT_EVENT_LOG', 'event_type', 'text'),
    ('IM_DETECT_EVENT_LOG', 'ip', 'ip'),
    ('IM_DETECT_EVENT_LOG', 'login_id', 'text'),
    ('IM_DETECT_EVENT_LOG', 'modified_attribute_list', 'text'),
    ('IM_DETECT_EVENT_LOG', 'node_id', 'long'),
    ('IM_DETECT_EVENT_LOG', 'rule_id', 'text'),
    ('IM_DETECT_EVENT_LOG', 'target', 'text'),
    ('IM_DETECT_EVENT_LOG', 'type', 'text'),
    ('IM_DETECT_EVENT_LOG', 'type_tw', 'text'),
    ('IM_DETECT_EVENT_LOG', 'tz_offset', 'long'),
    ('IM_DETECT_EVENT_LOG', 'user_name', 'text'),
    ('IM_DETECT_EVENT_LOG', 'watchlist_info', 'text'),

    -- NodeSwIndex (NODE_SW)
    ('NODE_SW', 'document_id', 'text'),
    ('NODE_SW', 'document_created_time', 'date'),
    ('NODE_SW', 'translated', 'text'),
    ('NODE_SW', 'document_log_type', 'text'),
    ('NODE_SW', 'document_log_type_tw', 'text'),
    ('NODE_SW', 'client_time', 'date'),
    ('NODE_SW', 'computer_name', 'text'),
    ('NODE_SW', 'data_uuid', 'text'),
    ('NODE_SW', 'department', 'text'),
    ('NODE_SW', 'hash_value', 'text'),
    ('NODE_SW', 'ip', 'ip'),
    ('NODE_SW', 'login_id', 'text'),
    ('NODE_SW', 'node_hash_type', 'text'),
    ('NODE_SW', 'node_id', 'long'),
    ('NODE_SW', 'reset_data', 'text'),
    ('NODE_SW', 'sw', 'text'),
    ('NODE_SW', 'tz_offset', 'long'),
    ('NODE_SW', 'user_name', 'text'),

    -- NodeHwIndex (NODE_HW)
    ('NODE_HW', 'document_id', 'text'),
    ('NODE_HW', 'document_created_time', 'date'),
    ('NODE_HW', 'translated', 'text'),
    ('NODE_HW', 'document_log_type', 'text'),
    ('NODE_HW', 'document_log_type_tw', 'text'),
    ('NODE_HW', 'client_time', 'date'),
    ('NODE_HW', 'computer_name', 'text'),
    ('NODE_HW', 'data_uuid', 'text'),
    ('NODE_HW', 'department', 'text'),
    ('NODE_HW', 'hash_value', 'text'),
    ('NODE_HW', 'hw', 'text'),
    ('NODE_HW', 'ip', 'ip'),
    ('NODE_HW', 'login_id', 'text'),
    ('NODE_HW', 'node_hash_type', 'text'),
    ('NODE_HW', 'node_id', 'long'),
    ('NODE_HW', 'reset_data', 'text'),
    ('NODE_HW', 'tz_offset', 'long'),
    ('NODE_HW', 'user_name', 'text'),

    -- PkgDistIndex (PKG_DIST_LOG)
    ('PKG_DIST_LOG', 'document_id', 'text'),
    ('PKG_DIST_LOG', 'document_created_time', 'date'),
    ('PKG_DIST_LOG', 'translated', 'text'),
    ('PKG_DIST_LOG', 'document_log_type', 'text'),
    ('PKG_DIST_LOG', 'document_log_type_tw', 'text'),
    ('PKG_DIST_LOG', 'data_uuid', 'text'),
    ('PKG_DIST_LOG', 'log_string_args', 'text'),
    ('PKG_DIST_LOG', 'log_string_id', 'text'),
    ('PKG_DIST_LOG', 'package_name', 'text'),
    ('PKG_DIST_LOG', 'package_type', 'text'),
    ('PKG_DIST_LOG', 'package_type_tw', 'text'),
    ('PKG_DIST_LOG', 'server_id', 'text'),
    ('PKG_DIST_LOG', 'server_time', 'date'),

    -- PkgSyncIndex (PKG_SYNC_LOG)
    ('PKG_SYNC_LOG', 'document_id', 'text'),
    ('PKG_SYNC_LOG', 'document_created_time', 'date'),
    ('PKG_SYNC_LOG', 'translated', 'text'),
    ('PKG_SYNC_LOG', 'document_log_type', 'text'),
    ('PKG_SYNC_LOG', 'document_log_type_tw', 'text'),
    ('PKG_SYNC_LOG', 'log_string_id', 'text'),
    ('PKG_SYNC_LOG', 'pkg_type', 'text'),
    ('PKG_SYNC_LOG', 'product_pkg_id', 'text'),
    ('PKG_SYNC_LOG', 'log_string_args', 'text'),
    ('PKG_SYNC_LOG', 'data_uuid', 'text'),
    ('PKG_SYNC_LOG', 'server_time', 'date'),

    -- ServerAlertIndex (SERVER_ALERT_LOG)
    ('SERVER_ALERT_LOG', 'document_id', 'text'),
    ('SERVER_ALERT_LOG', 'document_created_time', 'date'),
    ('SERVER_ALERT_LOG', 'translated', 'text'),
    ('SERVER_ALERT_LOG', 'document_log_type', 'text'),
    ('SERVER_ALERT_LOG', 'document_log_type_tw', 'text'),
    ('SERVER_ALERT_LOG', 'node_id', 'long'),
    ('SERVER_ALERT_LOG', 'node_ip', 'ip'),
    ('SERVER_ALERT_LOG', 'computer_name', 'text'),
    ('SERVER_ALERT_LOG', 'user', 'text'),
    ('SERVER_ALERT_LOG', 'department', 'text'),
    ('SERVER_ALERT_LOG', 'log_string_id', 'text'),
    ('SERVER_ALERT_LOG', 'server_time', 'date'),
    ('SERVER_ALERT_LOG', 'data_uuid', 'text'),

    -- ServiceIndex (SERVICE_LOG)
    ('SERVICE_LOG', 'document_id', 'text'),
    ('SERVICE_LOG', 'document_created_time', 'date'),
    ('SERVICE_LOG', 'translated', 'text'),
    ('SERVICE_LOG', 'document_log_type', 'text'),
    ('SERVICE_LOG', 'document_log_type_tw', 'text'),
    ('SERVICE_LOG', 'data_uuid', 'text'),
    ('SERVICE_LOG', 'log_string_args', 'text'),
    ('SERVICE_LOG', 'log_string_id', 'text'),
    ('SERVICE_LOG', 'server_id', 'text'),
    ('SERVICE_LOG', 'server_ip', 'ip'),
    ('SERVICE_LOG', 'server_name', 'text'),
    ('SERVICE_LOG', 'server_time', 'date'),
    ('SERVICE_LOG', 'type', 'text'),
    ('SERVICE_LOG', 'type_tw', 'text'),

    -- TaskStatusIndex (TASK_STATUS_LOG)
    ('TASK_STATUS_LOG', 'document_id', 'text'),
    ('TASK_STATUS_LOG', 'document_created_time', 'date'),
    ('TASK_STATUS_LOG', 'translated', 'text'),
    ('TASK_STATUS_LOG', 'document_log_type', 'text'),
    ('TASK_STATUS_LOG', 'document_log_type_tw', 'text'),
    ('TASK_STATUS_LOG', 'client_time', 'date'),
    ('TASK_STATUS_LOG', 'computer_name', 'text'),
    ('TASK_STATUS_LOG', 'data_uuid', 'text'),
    ('TASK_STATUS_LOG', 'department', 'text'),
    ('TASK_STATUS_LOG', 'instance_id', 'text'),
    ('TASK_STATUS_LOG', 'ip', 'ip'),
    ('TASK_STATUS_LOG', 'is_runtime', 'boolean'),
    ('TASK_STATUS_LOG', 'login_id', 'text'),
    ('TASK_STATUS_LOG', 'node_id', 'long'),
    ('TASK_STATUS_LOG', 'product_id', 'text'),
    ('TASK_STATUS_LOG', 'task_error', 'text'),
    ('TASK_STATUS_LOG', 'task_error_tw', 'text'),
    ('TASK_STATUS_LOG', 'task_id', 'text'),
    ('TASK_STATUS_LOG', 'task_status', 'text'),
    ('TASK_STATUS_LOG', 'task_status_tw', 'text'),
    ('TASK_STATUS_LOG', 'task_type', 'text'),
    ('TASK_STATUS_LOG', 'task_type_tw', 'text'),
    ('TASK_STATUS_LOG', 'tz_offset', 'long'),
    ('TASK_STATUS_LOG', 'user_name', 'text'),

    -- V3AlertIndex (V3_ALERT_LOG)
    ('V3_ALERT_LOG', 'document_id', 'text'),
    ('V3_ALERT_LOG', 'document_created_time', 'date'),
    ('V3_ALERT_LOG', 'translated', 'text'),
    ('V3_ALERT_LOG', 'document_log_type', 'text'),
    ('V3_ALERT_LOG', 'document_log_type_tw', 'text'),
    ('V3_ALERT_LOG', 'access', 'text'),
    ('V3_ALERT_LOG', 'client_time', 'date'),
    ('V3_ALERT_LOG', 'computer_name', 'text'),
    ('V3_ALERT_LOG', 'created_time', 'date'),
    ('V3_ALERT_LOG', 'container_id', 'text'),
    ('V3_ALERT_LOG', 'image_name', 'text'),
    ('V3_ALERT_LOG', 'container_name', 'text'),
    ('V3_ALERT_LOG', 'data_uuid', 'text'),
    ('V3_ALERT_LOG', 'department', 'text'),
    ('V3_ALERT_LOG', 'engine_version', 'text'),
    ('V3_ALERT_LOG', 'file_hash', 'text'),
    ('V3_ALERT_LOG', 'file_size', 'text'),
    ('V3_ALERT_LOG', 'infector', 'text'),
    ('V3_ALERT_LOG', 'ip', 'ip'),
    ('V3_ALERT_LOG', 'is_runtime', 'boolean'),
    ('V3_ALERT_LOG', 'k8s_node_id', 'text'),
    ('V3_ALERT_LOG', 'log_type', 'text'),
    ('V3_ALERT_LOG', 'login_id', 'text'),
    ('V3_ALERT_LOG', 'modified_time', 'date'),
    ('V3_ALERT_LOG', 'virus_name', 'text'),
    ('V3_ALERT_LOG', 'node_id', 'long'),
    ('V3_ALERT_LOG', 'ns_id', 'text'),
    ('V3_ALERT_LOG', 'ns_name', 'text'),
    ('V3_ALERT_LOG', 'owner', 'text'),
    ('V3_ALERT_LOG', 'path', 'text'),
    ('V3_ALERT_LOG', 'pod_id', 'text'),
    ('V3_ALERT_LOG', 'pod_name', 'text'),
    ('V3_ALERT_LOG', 'rule_type', 'text'),
    ('V3_ALERT_LOG', 'scan_type', 'text'),
    ('V3_ALERT_LOG', 'scan_type_tw', 'text'),
    ('V3_ALERT_LOG', 'sha256_hash', 'text'),
    ('V3_ALERT_LOG', 'status', 'text'),
    ('V3_ALERT_LOG', 'status_tw', 'text'),
    ('V3_ALERT_LOG', 'tz_offset', 'long'),
    ('V3_ALERT_LOG', 'user_name', 'text'),

    -- V3IsIndex (V3_IS_LOG)
    ('V3_IS_LOG', 'document_id', 'text'),
    ('V3_IS_LOG', 'document_created_time', 'date'),
    ('V3_IS_LOG', 'translated', 'text'),
    ('V3_IS_LOG', 'document_log_type', 'text'),
    ('V3_IS_LOG', 'document_log_type_tw', 'text'),
    ('V3_IS_LOG', 'client_time', 'date'),
    ('V3_IS_LOG', 'computer_name', 'text'),
    ('V3_IS_LOG', 'data_uuid', 'text'),
    ('V3_IS_LOG', 'department', 'text'),
    ('V3_IS_LOG', 'function', 'text'),
    ('V3_IS_LOG', 'ip', 'ip'),
    ('V3_IS_LOG', 'level', 'text'),
    ('V3_IS_LOG', 'log_string_args', 'text'),
    ('V3_IS_LOG', 'log_string_id', 'text'),
    ('V3_IS_LOG', 'login_id', 'text'),
    ('V3_IS_LOG', 'node_id', 'long'),
    ('V3_IS_LOG', 'tz_offset', 'long'),
    ('V3_IS_LOG', 'user_name', 'text'),
    ('V3_IS_LOG', 'detail_string_id', 'text'),
    ('V3_IS_LOG', 'detail_string_args', 'text'),
    ('V3_IS_LOG', 'translated_detail', 'text'),

    -- V3QuarIndex (V3_QUAR_LOG)
    ('V3_QUAR_LOG', 'document_id', 'text'),
    ('V3_QUAR_LOG', 'document_created_time', 'date'),
    ('V3_QUAR_LOG', 'translated', 'text'),
    ('V3_QUAR_LOG', 'document_log_type', 'text'),
    ('V3_QUAR_LOG', 'document_log_type_tw', 'text'),
    ('V3_QUAR_LOG', 'client_time', 'date'),
    ('V3_QUAR_LOG', 'computer_name', 'text'),
    ('V3_QUAR_LOG', 'data_uuid', 'text'),
    ('V3_QUAR_LOG', 'department', 'text'),
    ('V3_QUAR_LOG', 'detail_string_args', 'text'),
    ('V3_QUAR_LOG', 'detail_string_id', 'text'),
    ('V3_QUAR_LOG', 'translated_detail', 'text'),
    ('V3_QUAR_LOG', 'function', 'text'),
    ('V3_QUAR_LOG', 'ip', 'ip'),
    ('V3_QUAR_LOG', 'level', 'text'),
    ('V3_QUAR_LOG', 'log_string_args', 'text'),
    ('V3_QUAR_LOG', 'log_string_id', 'text'),
    ('V3_QUAR_LOG', 'login_id', 'text'),
    ('V3_QUAR_LOG', 'node_id', 'long'),
    ('V3_QUAR_LOG', 'tz_offset', 'long'),
    ('V3_QUAR_LOG', 'user_name', 'text'),

    -- V3SsIndex (V3_SS_LOG)
    ('V3_SS_LOG', 'document_id', 'text'),
    ('V3_SS_LOG', 'document_created_time', 'date'),
    ('V3_SS_LOG', 'translated', 'text'),
    ('V3_SS_LOG', 'document_log_type', 'text'),
    ('V3_SS_LOG', 'document_log_type_tw', 'text'),
    ('V3_SS_LOG', 'client_time', 'date'),
    ('V3_SS_LOG', 'computer_name', 'text'),
    ('V3_SS_LOG', 'data_uuid', 'text'),
    ('V3_SS_LOG', 'department', 'text'),
    ('V3_SS_LOG', 'detail_string_args', 'text'),
    ('V3_SS_LOG', 'detail_string_id', 'text'),
    ('V3_SS_LOG', 'translated_detail', 'text'),
    ('V3_SS_LOG', 'function', 'text'),
    ('V3_SS_LOG', 'ip', 'ip'),
    ('V3_SS_LOG', 'level', 'text'),
    ('V3_SS_LOG', 'log_string_args', 'text'),
    ('V3_SS_LOG', 'log_string_id', 'text'),
    ('V3_SS_LOG', 'login_id', 'text'),
    ('V3_SS_LOG', 'node_id', 'long'),
    ('V3_SS_LOG', 'tz_offset', 'long'),
    ('V3_SS_LOG', 'user_name', 'text'),

    -- V3SupIndex (V3_SUP_LOG)
    ('V3_SUP_LOG', 'document_id', 'text'),
    ('V3_SUP_LOG', 'document_created_time', 'date'),
    ('V3_SUP_LOG', 'translated', 'text'),
    ('V3_SUP_LOG', 'document_log_type', 'text'),
    ('V3_SUP_LOG', 'document_log_type_tw', 'text'),
    ('V3_SUP_LOG', 'client_time', 'date'),
    ('V3_SUP_LOG', 'computer_name', 'text'),
    ('V3_SUP_LOG', 'data_uuid', 'text'),
    ('V3_SUP_LOG', 'department', 'text'),
    ('V3_SUP_LOG', 'detail_string_args', 'text'),
    ('V3_SUP_LOG', 'detail_string_id', 'text'),
    ('V3_SUP_LOG', 'translated_detail', 'text'),
    ('V3_SUP_LOG', 'function', 'text'),
    ('V3_SUP_LOG', 'ip', 'ip'),
    ('V3_SUP_LOG', 'level', 'text'),
    ('V3_SUP_LOG', 'log_string_args', 'text'),
    ('V3_SUP_LOG', 'log_string_id', 'text'),
    ('V3_SUP_LOG', 'login_id', 'text'),
    ('V3_SUP_LOG', 'node_id', 'long'),
    ('V3_SUP_LOG', 'tz_offset', 'long'),
    ('V3_SUP_LOG', 'user_name', 'text')

ON CONFLICT(document_log_type, field) DO NOTHING;
------------------------------------------------------------------------
select '## tb_widget_item_type';
------------------------------------------------------------------------
INSERT INTO tb_widget_item_type (widget_item_type, widget_item_sub_type, product_group, description) 
VALUES 
-- EMS
    ('AGENT_INSTALL', 'AGENT_INSTALLED_SERVER', 'EMS', 'EPP 설치 서버')
    , ('AGENT_INSTALL', 'AGENT_INSTALLED_SERVER_WINDOWS', 'EMS', 'EPP 설치 서버-WINDOWS')
    , ('AGENT_INSTALL', 'AGENT_INSTALLED_SERVER_LINUX', 'EMS', 'EPP 설치 서버-LINUX')
    , ('AGENT_INSTALL', 'AGENT_NOT_INSTALL_SERVER', 'EMS', 'EPP 미설치 서버')
    , ('POLICY_APPLY', 'AGENT_MGMT_APPLIED', 'EMS', 'EPP 에이전트 정책 적용 - 적용')
    , ('POLICY_APPLY', 'AGENT_MGMT_APPLYING', 'EMS', 'EPP 에이전트 정책 적용 - 적용중')
    , ('POLICY_APPLY', 'AGENT_MGMT_NOT_APPLIED', 'EMS', 'EPP 에이전트 정책 적용 - 미적용')
    , ('SERVER_STATUS', 'SERVER_STATUS_RESOURCE', 'EMS', '서버 리소스 상태')
    , ('AGENT_STATUS', 'AGENT_STATUS_CONNECTED', 'EMS', '에이전트 상태 현황 - 연결')
    , ('AGENT_STATUS', 'AGENT_STATUS_DISCONNECTED', 'EMS', '에이전트 상태 현황 - 미연결')
    , ('AGENT_STATUS', 'AGENT_STATUS_NOT_INSTALL', 'EMS', '에이전트 상태 현황 - 미설치')
    
-- V3
    , ('V3_INSTALL', 'V3_INSTALLED_SERVER', 'V3', 'V3 설치 서버')
    , ('V3_INSTALL', 'V3_INSTALL_NOT_INSTALLED_SERVER', 'V3', 'V3 미설치 서버')
    , ('V3_INSTALL', 'V3_INSTALL_NOT_SUPPORTED_SERVER', 'V3', 'Anti-Malware 미지원 서버')
    , ('V3_INSTALL', 'V3_NOT_MANAGE', 'V3', 'Anti-Malware 미관리 서버')
    , ('V3_POLICY_STATUS', 'V3_POLICY_STATUS_APPLIED', 'V3', 'V3 정책 - 적용')
    , ('V3_POLICY_STATUS', 'V3_POLICY_STATUS_APPLYING', 'V3', 'V3 정책 - 적용중')
    , ('V3_POLICY_STATUS', 'V3_POLICY_STATUS_NOT_APPLIED', 'V3', 'V3 정책 - 미적용')
    , ('MANUAL_SCAN_RATIO', 'MANUAL_SCANNED_SERVER', 'V3', '최근 7일내 수동 검사한 서버')
    , ('MANUAL_SCAN_RATIO', 'MANUAL_NOT_SCAN_SERVER', 'V3', '최근 7일내 수동 검사 안한 서버')
    , ('ENGINE_UPDATE_RATIO', 'ENGINE_UPDATED_SERVER', 'V3', '엔진 업데이트 데스크탑')
    , ('ENGINE_UPDATE_RATIO', 'ENGINE_NOT_UPDATE_SERVER', 'V3', '엔진 미업데이트 서버')
    , ('ENGINE_UPDATE_RATIO', 'ENGINE_UPDATE_VERSION_OES', 'V3', 'OES 업데이트 정보')
    , ('ENGINE_UPDATE_RATIO', 'ENGINE_UPDATE_VERSION_SES', 'V3', 'SES 업데이트 정보')
    , ('AGENT_MALWARE', 'AGENT_MALWARE_LAST_30_DAYS', 'V3', '악성코드 감염 에이전트 순위 - 최근 30일')
    , ('AGENT_MALWARE', 'AGENT_MALWARE_LAST_7_DAYS', 'V3', '악성코드 감염 에이전트 순위 - 최근 7일')
    , ('AGENT_MALWARE', 'AGENT_MALWARE_LAST_24HR', 'V3', '악성코드 감염 에이전트 순위 - 최근 24시간')
    , ('MALWARE_INFECTION', 'MALWARE_INFECTION_LAST_30_DAYS', 'V3', '악성코드 순위 - 최근 30일')
    , ('MALWARE_INFECTION', 'MALWARE_INFECTION_LAST_7_DAYS', 'V3', '악성코드 순위 - 최근 7일')
    , ('MALWARE_INFECTION', 'MALWARE_INFECTION_LAST_24HR', 'V3', '악성코드 순위 - 최근 24시간')
    , ('V3_ENGINE_STATUS', 'V3_ENGINE_STATUS_LAST_30_DAYS', 'V3', '엔진 적용 추이 - 최근 30일')
    , ('V3_ENGINE_STATUS', 'V3_ENGINE_STATUS_LAST_7_DAYS', 'V3', '엔진 적용 추이 - 최근 7일')
    , ('V3_ENGINE_STATUS', 'V3_ENGINE_STATUS_LAST_24_HR', 'V3', '엔진 적용 추이 - 최근 24시간')
    , ('V3_MALWARE_HISTORY', 'V3_MALWARE_HISTORY_LAST_30_DAYS', 'V3', '악성코드 및 평판 기반 탐지 추이 - 최근 30일')
    , ('V3_MALWARE_HISTORY', 'V3_MALWARE_HISTORY_LAST_7_DAYS', 'V3', '악성코드 및 평판 기반 탐지 추이 - 최근 7일')
    , ('V3_MALWARE_HISTORY', 'V3_MALWARE_HISTORY_LAST_24_HR', 'V3', '악성코드 및 평판 기반 탐지 추이 - 최근 24시간')
-- AC
    ,('AC_INSTALL', 'AC_INSTALLED_SERVER_ON', 'AC', 'AC 설치 서버 ON')
    ,('AC_INSTALL', 'AC_INSTALLED_SERVER_OFF', 'AC', 'AC 설치 서버 OFF')
    ,('AC_INSTALL', 'AC_NOT_INSTALL_SERVER', 'AC', 'AC 미설치 서버')
    ,('AC_INSTALL', 'AC_NOT_SUPPORTED_SERVER', 'AC', 'AC 미지원 서버')
    ,('AC_POLICY_STATUS', 'AC_AGENT_APPLIED', 'AC', 'AC 에이전트 정책 적용 - 적용')
    ,('AC_POLICY_STATUS', 'AC_AGENT_APPLYING', 'AC', 'AC 에이전트 정책 적용 - 적용중')
    ,('AC_POLICY_STATUS', 'AC_AGENT_NOT_APPLIED', 'AC', 'AC 에이전트 정책 적용 - 미적용')
    ,('AC_POLICY_STATUS', 'AC_MGMT_APPLYING', 'AC', 'AC 정책 적용 - 적용중')
    ,('AC_POLICY_STATUS', 'AC_MGMT_APPLIED', 'AC', 'AC 정책 적용 - 적용')
    ,('AC_POLICY_STATUS', 'AC_MGMT_NOT_APPLIED', 'AC', 'AC 정책 적용 - 미적용')
    ,('AC_POLICY_STATUS', 'IM_MGMT_APPLYING', 'AC', 'IM 정책 적용 - 적용중')
    ,('AC_POLICY_STATUS', 'IM_MGMT_APPLIED', 'AC', 'IM 정책 적용 - 적용')
    ,('AC_POLICY_STATUS', 'IM_MGMT_NOT_APPLIED', 'AC', 'IM 정책 적용 - 미적용')
    ,('AC_STATUS', 'AC_STATUS_COLLECTING', 'AC', 'AC 상태 - COLLECTING')
    ,('AC_STATUS', 'AC_STATUS_LOCKDOWN', 'AC', 'AC 상태 - LOCKDOWN')
    ,('AC_STATUS', 'AC_STATUS_MAINTENANCE', 'AC', 'AC 상태 - MAINTENANCE')
    ,('AC_STATUS', 'AC_STATUS_OFF', 'AC', 'AC 상태 - OFF')
    ,('AC_STATUS', 'AC_STATUS_SIMULATION', 'AC', 'AC 상태 - SIMULATION')
    ,('AC_STATUS', 'AC_STATUS_MEMOFF', 'AC', 'AC 상태 - MEMOFF')
    ,('AC_AGENT_TOP', 'AC_AGENT_TOP_LAST_30_DAYS', 'AC', '실행 제어 차단 에이전트 순위 - 최근 30일')
    ,('AC_AGENT_TOP', 'AC_AGENT_TOP_LAST_7_DAYS', 'AC', '실행 제어 차단 에이전트 순위 - 최근 7일')
    ,('AC_AGENT_TOP', 'AC_AGENT_TOP_LAST_24_HR', 'AC', '실행 제어 차단 에이전트 순위- 최근 24시간')
    ,('AC_BLOCK_FILE_TOP', 'AC_BLOCK_FILE_TOP_LAST_30_DAYS', 'AC', '실행 제어 차단 파일 순위 - 최근 30일')
    ,('AC_BLOCK_FILE_TOP', 'AC_BLOCK_FILE_TOP_LAST_7_DAYS', 'AC', '실행 제어 차단 파일 순위 - 최근 7일')
    ,('AC_BLOCK_FILE_TOP', 'AC_BLOCK_FILE_TOP_LAST_24_HR', 'AC', '실행 제어 차단 파일 순위- 최근 24시간')
    ,('AC_BLOCK_HISTORY', 'AC_BLOCK_HISTORY_LAST_30_DAYS', 'AC', '실행 제어 차단 추이 - 최근 30일')
    ,('AC_BLOCK_HISTORY', 'AC_BLOCK_HISTORY_LAST_7_DAYS', 'AC', '실행 제어 차단 추이 - 최근 7일')
    ,('AC_BLOCK_HISTORY', 'AC_BLOCK_HISTORY_LAST_24_HR', 'AC', '실행 제어 차단 추이 - 최근 24시간')
    ,('AC_EXEC_LIST', 'AC_EXEC_LIST', 'AC', '최근 실행 제어 이벤트')
-- IM
    ,('AC_IM_DETECT_WATCHLIST_TOP', 'AC_IM_DETECT_WATCHLIST_TOP_LAST_30_DAYS', 'AC', 'IM 탐지 Watchlist 순위 - 최근 30일')
    ,('AC_IM_DETECT_WATCHLIST_TOP', 'AC_IM_DETECT_WATCHLIST_TOP_LAST_7_DAYS', 'AC', 'IM 탐지 Watchlist 순위 - 최근 7일')
    ,('AC_IM_DETECT_WATCHLIST_TOP', 'AC_IM_DETECT_WATCHLIST_TOP_LAST_24_HR', 'AC', 'IM 탐지 Watchlist 순위 - 최근 24시간')
    ,('AC_IM_DETECT_RULE_TOP', 'AC_IM_DETECT_RULE_TOP_LAST_30_DAYS', 'AC', 'IM 탐지 규칙 순위 - 최근 30일')
    ,('AC_IM_DETECT_RULE_TOP', 'AC_IM_DETECT_RULE_TOP_LAST_7_DAYS', 'AC', 'IM 탐지 규칙 순위 - 최근 7일')
    ,('AC_IM_DETECT_RULE_TOP', 'AC_IM_DETECT_RULE_TOP_LAST_24_HR', 'AC', 'IM 탐지 규칙 순위 - 최근 24시간')
    ,('AC_IM_DETECT_AGENT_TOP', 'AC_IM_DETECT_AGENT_TOP_LAST_30_DAYS', 'AC', 'IM 탐지 에이전트 순위 - 최근 30일')
    ,('AC_IM_DETECT_AGENT_TOP', 'AC_IM_DETECT_AGENT_TOP_LAST_7_DAYS', 'AC', 'IM 탐지 에이전트 순위 - 최근 7일')
    ,('AC_IM_DETECT_AGENT_TOP', 'AC_IM_DETECT_AGENT_TOP_LAST_24_HR', 'AC', 'IM 탐지 에이전트 순위 - 최근 24시간')
    ,('AC_IM_DETECT_TARGET_TYPE_TOP', 'AC_IM_DETECT_TARGET_TYPE_TOP_LAST_30_DAYS', 'AC', 'IM 탐지 파일/디렉토리 순위 - 최근 30일')
    ,('AC_IM_DETECT_TARGET_TYPE_TOP', 'AC_IM_DETECT_TARGET_TYPE_TOP_LAST_7_DAYS', 'AC', 'IM 탐지 파일/디렉토리 순위 - 최근 7일')
    ,('AC_IM_DETECT_TARGET_TYPE_TOP', 'AC_IM_DETECT_TARGET_TYPE_TOP_LAST_24_HR', 'AC', 'IM 탐지 파일/디렉토리 순위 - 최근 24시간')
    ,('AC_IM_DETECT_HISTORY', 'AC_IM_DETECT_HISTORY_LAST_30_DAYS', 'AC', 'IM 탐지 추이 - 최근 30일')
    ,('AC_IM_DETECT_HISTORY', 'AC_IM_DETECT_HISTORY_LAST_7_DAYS', 'AC', 'IM 탐지 추이 - 최근 7일')
    ,('AC_IM_DETECT_HISTORY', 'AC_IM_DETECT_HISTORY_LAST_24_HR', 'AC', 'IM 탐지 추이 - 최근 24시간')
-- HIPS
    ,('HIPS_INSTALL', 'HIPS_INSTALLED_SERVER_ON', 'HIPS', 'HIPS 설치 서버 ON')
    ,('HIPS_INSTALL', 'HIPS_INSTALLED_SERVER_OFF', 'HIPS', 'HIPS 설치 서버 OFF')
    ,('HIPS_INSTALL', 'HIPS_NOT_INSTALL_SERVER', 'HIPS', 'HIPS 미설치 서버')
    ,('HIPS_POLICY_STATUS', 'HIPS_AGENT_APPLIED', 'HIPS', 'HIPS 에이전트 정책 적용 - 적용')
    ,('HIPS_POLICY_STATUS', 'HIPS_AGENT_APPLYING', 'HIPS', 'HIPS 에이전트 정책 적용 - 적용중')
    ,('HIPS_POLICY_STATUS', 'HIPS_AGENT_NOT_APPLIED', 'HIPS', 'HIPS 에이전트 정책 적용 - 미적용')
    ,('HIPS_POLICY_STATUS', 'HIPS_MGMT_APPLIED', 'HIPS', 'HIPS 정책 적용 - 적용')
    ,('HIPS_POLICY_STATUS', 'HIPS_MGMT_APPLYING', 'HIPS', 'HIPS 정책 적용 - 적용중')
    ,('HIPS_POLICY_STATUS', 'HIPS_MGMT_NOT_APPLIED', 'HIPS', 'HIPS 정책 적용 - 미적용')
    ,('HIPS_POLICY_STATUS', 'HIPS_FW_APPLIED', 'HIPS', 'HIPS FW 정책 적용 - 적용')
    ,('HIPS_POLICY_STATUS', 'HIPS_FW_APPLYING', 'HIPS', 'HIPS FW 정책 적용 - 적용중')
    ,('HIPS_POLICY_STATUS', 'HIPS_FW_NOT_APPLIED', 'HIPS', 'HIPS FW 정책 적용 - 미적용')
    ,('HIPS_IPS_STATUS', 'HIPS_IPS_STATUS_EOFF', 'HIPS', 'HIPS IPS 상태 - 긴급 OFF')
    ,('HIPS_IPS_STATUS', 'HIPS_IPS_STATUS_OFF', 'HIPS', 'HIPS IPS 상태 - OFF')
    ,('HIPS_IPS_STATUS', 'HIPS_IPS_STATUS_ON', 'HIPS', 'HIPS IPS 상태 - ON')
    ,('HIPS_IPS_STATUS', 'HIPS_IPS_STATUS_MEMOFF', 'HIPS', 'HIPS IPS 상태 - MEMOFF')
    ,('HIPS_IPS_STATUS', 'HIPS_IPS_STATUS_CTOFF', 'HIPS', 'HIPS IPS 상태 - CTOFF')
    ,('HIPS_IPS_STATUS', 'HIPS_IPS_STATUS_ENGINE_OFF', 'HIPS', 'HIPS IPS 상태 - ENGINE_OFF')
    ,('HIPS_IPS_STATUS', 'HIPS_IPS_STATUS_USER_MODE_ON', 'HIPS', 'HIPS IPS 상태 - USER_MODE_ON')
    ,('HIPS_IPS_STATUS', 'HIPS_IPS_STATUS_BYPASS', 'HIPS', 'HIPS IPS 상태 - BYPASS')
    ,('HIPS_IPS_STATUS', 'HIPS_IPS_STATUS_BYPASS_OVERSUBSCRIPTION', 'HIPS', 'HIPS IPS 상태 - BYPASS_OVERSUBSCRIPTION')
    ,('HIPS_SIP_TOP','HIPS_SIP_TOP_LAST_30_DAYS','HIPS','HIPS 공격자 탐지 Top-최근 30일')
    ,('HIPS_SIP_TOP','HIPS_SIP_TOP_LAST_7_DAYS','HIPS','HIPS 공격자 탐지 Top-최근 7일')
    ,('HIPS_SIP_TOP','HIPS_SIP_TOP_LAST_24_HR','HIPS','HIPS 공격자 탐지 Top-최근 24시간')
    ,('HIPS_DETECT_AGENT_TOP','HIPS_DETECT_AGENT_TOP_LAST_30_DAYS','HIPS','HIPS 탐지 에이전트 Top-최근 30일')
    ,('HIPS_DETECT_AGENT_TOP','HIPS_DETECT_AGENT_TOP_LAST_7_DAYS','HIPS','HIPS 탐지 에이전트 Top-최근 7일')
    ,('HIPS_DETECT_AGENT_TOP','HIPS_DETECT_AGENT_TOP_LAST_24_HR','HIPS','HIPS 탐지 에이전트 Top-최근 24시간')
    ,('HIPS_ATTACK_TOP','HIPS_ATTACK_TOP_LAST_30_DAYS','HIPS','HIPS 시그니처 공격명 Top-최근 30일')
    ,('HIPS_ATTACK_TOP','HIPS_ATTACK_TOP_LAST_7_DAYS','HIPS','HIPS 시그니처 공격명 Top-최근 7일')
    ,('HIPS_ATTACK_TOP','HIPS_ATTACK_TOP_LAST_24_HR','HIPS','HIPS 시그니처 공격명 Top-최근 24시간')
    ,('HIPS_DETECT_HISTORY','HIPS_DETECT_HISTORY_LAST_30_DAYS','HIPS','HIPS 시그니처 탐지 추이-최근 30일')
    ,('HIPS_DETECT_HISTORY','HIPS_DETECT_HISTORY_LAST_7_DAYS','HIPS','HIPS 시그니처 탐지 추이-최근 7일')
    ,('HIPS_DETECT_HISTORY','HIPS_DETECT_HISTORY_LAST_24_HR','HIPS','HIPS 시그니처 탐지 추이-최근 24시간')
    ,('HIPS_APPLICATION_TOP','HIPS_APPLICATION_TOP_LAST_30_DAYS','HIPS','HIPS Application Type 탐지 Top-최근 30일')
    ,('HIPS_APPLICATION_TOP','HIPS_APPLICATION_TOP_LAST_7_DAYS','HIPS','HIPS Application Type 탐지 Top-최근 7일')
    ,('HIPS_APPLICATION_TOP','HIPS_APPLICATION_TOP_LAST_24_HR','HIPS','HIPS Application Type 탐지 Top-최근 24시')
    ,('HIPS_COUNTRY_TOP','HIPS_COUNTRY_TOP_LAST_30_DAYS','HIPS','HIPS 공격 국가 Top-최근 30일')
    ,('HIPS_COUNTRY_TOP','HIPS_COUNTRY_TOP_LAST_7_DAYS','HIPS','HIPS 공격 국가 Top-최근 7일')
    ,('HIPS_COUNTRY_TOP','HIPS_COUNTRY_TOP_LAST_24_HR','HIPS','HIPS 공격 국가 Top-최근 24시간')
    ,('HIPS_SEVERITY_STATUS','HIPS_SEVERITY_STATUS_LAST_30_DAYS','HIPS','HIPS 위험도별 현황-최근 30일')
    ,('HIPS_SEVERITY_STATUS','HIPS_SEVERITY_STATUS_LAST_7_DAYS','HIPS','HIPS 위험도별 현황-최근 7일')
    ,('HIPS_SEVERITY_STATUS','HIPS_SEVERITY_STATUS_LAST_24_HR','HIPS','HIPS 위험도별 현황-최근 24시간')
    ,('HIPS_DETECT_LIST','HIPS_DETECT_LIST','HIPS','최근 HIPS 차단/탐지 현황')
    ,('HIPS_FW_STATUS', 'HIPS_FW_STATUS_EOFF', 'HIPS', 'HIPS FW 상태 - 긴급 OFF')
    ,('HIPS_FW_STATUS', 'HIPS_FW_STATUS_OFF', 'HIPS', 'HIPS FW 상태 - OFF')
    ,('HIPS_FW_STATUS', 'HIPS_FW_STATUS_ON', 'HIPS', 'HIPS FW 상태 - ON')
    ,('HIPS_FW_STATUS', 'HIPS_FW_STATUS_MEMOFF', 'HIPS', 'HIPS FW 상태 - MEMOFF')
    ,('HIPS_FW_STATUS', 'HIPS_FW_STATUS_CTOFF', 'HIPS', 'HIPS FW 상태 - CTOFF')
    ,('HIPS_FW_STATUS', 'HIPS_FW_STATUS_ENGINE_OFF', 'HIPS', 'HIPS FW 상태 - ENGINE_OFF')
    ,('HIPS_FW_STATUS', 'HIPS_FW_STATUS_USER_MODE_ON', 'HIPS', 'HIPS FW 상태 - USER_MODE_ON')
    ,('HIPS_FW_STATUS', 'HIPS_FW_STATUS_BYPASS', 'HIPS', 'HIPS FW 상태 - BYPASS')
    ,('HIPS_FW_STATUS', 'HIPS_FW_STATUS_BYPASS_OVERSUBSCRIPTION', 'HIPS', 'HIPS FW 상태 - BYPASS_OVERSUBSCRIPTION')
    ,('HIPS_FW_SIP_TOP', 'HIPS_FW_SIP_TOP_LAST_30_DAYS', 'HIPS', '방화벽 차단 IP 순위 - 최근 30일')
    ,('HIPS_FW_SIP_TOP', 'HIPS_FW_SIP_TOP_LAST_7_DAYS', 'HIPS', '방화벽 차단 IP 순위 - 최근 7일')
    ,('HIPS_FW_SIP_TOP', 'HIPS_FW_SIP_TOP_LAST_24_HR', 'HIPS', '방화벽 차단 IP 순위 - 최근 24시간')
    ,('HIPS_FW_AGENT_TOP', 'HIPS_FW_AGENT_TOP_LAST_30_DAYS', 'HIPS', '방화벽 차단 에이전트 Top - 최근 30일')
    ,('HIPS_FW_AGENT_TOP', 'HIPS_FW_AGENT_TOP_LAST_7_DAYS', 'HIPS', '방화벽 차단 에이전트 Top - 최근 7일')
    ,('HIPS_FW_AGENT_TOP', 'HIPS_FW_AGENT_TOP_LAST_24_HR', 'HIPS', '방화벽 차단 에이전트 Top - 최근 24시간')
    ,('HIPS_FW_HISTORY', 'HIPS_FW_HISTORY_LAST_30_DAYS', 'HIPS', '방화벽 차단 추이 - 최근 30일')
    ,('HIPS_FW_HISTORY', 'HIPS_FW_HISTORY_LAST_7_DAYS', 'HIPS', '방화벽 차단 추이 - 최근 7일')
    ,('HIPS_FW_HISTORY', 'HIPS_FW_HISTORY_LAST_24_HR', 'HIPS', '방화벽 차단 추이 - 최근 24시간')
    ,('HIPS_FW_PORT_TOP', 'HIPS_FW_PORT_TOP_LAST_30_DAYS', 'HIPS', '방화벽 차단 포트 순위 - 최근 30일')
    ,('HIPS_FW_PORT_TOP', 'HIPS_FW_PORT_TOP_LAST_7_DAYS', 'HIPS', '방화벽 차단 포트 순위 - 최근 7일')
    ,('HIPS_FW_PORT_TOP', 'HIPS_FW_PORT_TOP_LAST_24_HR', 'HIPS', '방화벽 차단 포트 순위 - 최근 24시간')
    ,('HIPS_FW_RULE_TOP', 'HIPS_FW_RULE_TOP_LAST_30_DAYS', 'HIPS', '방화벽 차단 규칙 순위 - 최근 30일')
    ,('HIPS_FW_RULE_TOP', 'HIPS_FW_RULE_TOP_LAST_7_DAYS', 'HIPS', '방화벽 차단 규칙 순위 - 최근 7일')
    ,('HIPS_FW_RULE_TOP', 'HIPS_FW_RULE_TOP_LAST_24_HR', 'HIPS', '방화벽 차단 규칙 순위 - 최근 24시간')
-- SCM
    ,('SCM_INSTALL', 'SCM_INSTALLED_SERVER_ON', 'SCM', 'SCM 설치율 - 설치 서버 ON')
    ,('SCM_INSTALL', 'SCM_INSTALLED_SERVER_OFF', 'SCM', 'SCM 설치율 - 설치 서버 OFF')
    ,('SCM_INSTALL', 'SCM_NOT_INSTALL_SERVER', 'SCM', 'SCM 설치율 - 미설치 서버')
    ,('SCM_POLICY_STATUS', 'SCM_AGENT_APPLYING', 'SCM', 'SCM 에이전트 정책 적용 - 적용중')
    ,('SCM_POLICY_STATUS', 'SCM_AGENT_APPLIED', 'SCM', 'SCM 에이전트 정책 적용 - 적용')
    ,('SCM_POLICY_STATUS', 'SCM_AGENT_NOT_APPLIED', 'SCM', 'SCM 에이전트 정책 적용 - 미적용')
    ,('SCM_POLICY_STATUS', 'SCM_MGMT_APPLYING', 'SCM', 'SCM 정책 적용 - 적용중')
    ,('SCM_POLICY_STATUS', 'SCM_MGMT_APPLIED', 'SCM', 'SCM 정책 적용 - 적용')
    ,('SCM_POLICY_STATUS', 'SCM_MGMT_NOT_APPLIED', 'SCM', 'SCM 정책 적용 - 미적용')
    ,('SCM_STATUS', 'SCM_STATUS_ON', 'SCM', 'SCM 상태 - ON')
    ,('SCM_STATUS', 'SCM_STATUS_OFF', 'SCM', 'SCM 상태 - OFF')
    ,('SCM_COMPLIANCE_AGENT_TOP', 'SCM_COMPLIANCE_AGENT_TOP', 'SCM', '보안 수준 취약 건 수 에이전트 순위')
    ,('SCM_SECRET_AGENT_TOP', 'SCM_SECRET_AGENT_TOP', 'SCM', '민감 정보 취약 건 수 에이전트 순위')
    ,('SCM_MANUAL_SCAN_RATIO', 'SCM_MANUAL_SCANNED_SERVER', 'SCM', '최근 30일 내 SCM 수동 검사한 서버')
    ,('SCM_MANUAL_SCAN_RATIO', 'SCM_MANUAL_NOT_SCAN_SERVER', 'SCM', '최근 30일 내 SCM 수동 검사 안한 서버')
ON CONFLICT ON CONSTRAINT tb_widget_item_type_ukey DO UPDATE 
    SET (widget_item_type, product_group, description) = (EXCLUDED.widget_item_type, EXCLUDED.product_group, EXCLUDED.description);

------------------------------------------------------------------------
select '## tb_product_patch_base';
------------------------------------------------------------------------
INSERT INTO tb_product_patch_base (product_id, platform_type, product_code)
VALUES
('AGENT', 'WINDOWS', '68')
, ('AGENT', 'LINUX_UNIX', '65')
, ('V3NET_9.0', 'WINDOWS', 'd4')
, ('V3NET_LU', 'LINUX_UNIX', '7e')
, ('HIPS_CLIENT', 'WINDOWS', '61')
, ('HIPS_CLIENT', 'LINUX_UNIX', '62')
, ('AC_CLIENT', 'WINDOWS', '63')
, ('AC_CLIENT', 'LINUX_UNIX', '64')
, ('SCM_CLIENT', 'WINDOWS', '76')
, ('SCM_CLIENT', 'LINUX_UNIX', '75')
, ('CNAPP', 'LINUX_UNIX', '77')
, ('AMC_CLIENT', 'LINUX_UNIX', '7b')
ON CONFLICT ON CONSTRAINT tb_product_patch_base_pkey DO UPDATE 
    SET (product_id, platform_type, product_code) = (EXCLUDED.product_id, EXCLUDED.platform_type, EXCLUDED.product_code)
;
    
-- CWPP-2337 : 대응 > 대응 현황 > 관리제어 목록 조회 대상 제거 처리
UPDATE    tb_job
SET        visible = FALSE
WHERE    job_id IN (SELECT job_id FROM tb_task WHERE task_type = 'REMOTE_CTRL')
AND        visible = TRUE
;

-- CWPP-2337 : 관리 > 에이전트 현황 > 관리 명령 메뉴 설정 > 관리제어 즐겨찾기 데이터 제거
UPDATE    tb_admin
SET        task_menu_layout = CASE WHEN cardinality(array_remove(task_menu_layout::TEXT[], 'REMOTE_CTRL')) = 0 THEN NULL
                                ELSE array_remove(task_menu_layout::TEXT[], 'REMOTE_CTRL') END
WHERE    'REMOTE_CTRL' = ANY(task_menu_layout::TEXT[])
;

-- CWPP-3546 : 기존 서비스 포탈 연동 스케줄 정보 제거
DELETE FROM tb_schedule WHERE execute_uri LIKE '%service-portal%'
;
-- CWPP-6597 : 대시보드 연결 끊김 상태를 조건을 위해 과거에 사용되고 이후 사용되지 않는 서비스 삭제
DELETE FROM tb_service WHERE service_type = 'REPORT-PROCESSOR'
;

------------------------------------------------------------------------
select '## tb_cloud_sync_status';
------------------------------------------------------------------------
INSERT INTO tb_cloud_sync_status (cloud_provider_type, sync_status)
VALUES
('CLOUD_AWS', false)
, ('CLOUD_AZURE', false)
, ('CLOUD_ALIBABA', false)
ON CONFLICT(cloud_provider_type) DO NOTHING
;

------------------------------------------------------------------------
select '## tb_atip_config';
------------------------------------------------------------------------
INSERT INTO tb_atip_config (server_type, access_key, conceal_key, is_use, modified_time) 
VALUES 
    ('bundle', '', '', false, NOW())
ON CONFLICT(server_type) DO NOTHING;