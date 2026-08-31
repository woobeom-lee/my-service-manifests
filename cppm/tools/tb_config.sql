--
-- PostgreSQL database dump
--

\restrict ZiOZW0WfHUIeiIiWsGtKLnnGHymKSaUO7r8O9KZMMs1hVMRbLnbadwlGo3H08QA

-- Dumped from database version 15.14
-- Dumped by pg_dump version 15.14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: tb_config; Type: TABLE DATA; Schema: public; Owner: cppoltp
--

INSERT INTO public.tb_config VALUES ('SYS_INFO', 'time_server_use', 'false', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('SYS_INFO', 'response_retry_interval', '7', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('SYS_INFO', 'intergrity_scan_schedule', '{"repeat":{"hourly":6}}', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('SYS_IP', 'ip_auto_change', 'false', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('AGENT_INSTALL_PAGE', 'page_html', '', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('AGENT_MGMT_KEY', 'agent_mgmt_key_use', 'false', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('AGENT_SEND_LOG', 'send_log_interval', '5', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('AGENT_THRESHOLD', 'engine_update_threshold', '3', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('AGENT_THRESHOLD', 'manual_scan_threshold', '7', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('AGENT_THRESHOLD', 'manual_scan_day_interval', '30', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('AGENT_THRESHOLD', 'im_manual_rulecheck_day_interval', '30', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('AHNLAB_COM_V3MASTER', 'ahnlab_com_url', 'http://help.ahnlab.com/rdir/link.do', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('AHNLAB_COM_V3MASTER', 'locale', 'ko_kr', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('AHNLAB_COM_V3MASTER', 'seq', '1810', NULL);
INSERT INTO public.tb_config VALUES ('AHNLAB_COM_V3MASTER_DOWNLOAD_FILE_NAME', 'V3NET_9.0', 'V3_Net_for_Windows_Server_9.0.exe', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('AHNLAB_COM_V3MASTER_FILE_SEQ', 'V3NET_9.0', '503', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('DB_CLEAN', 'db_clean_condition', '80', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('DB_CLEAN', 'db_clean_type', 'disk_usage', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('DB_CLEAN', 'db_clean_deadline', '4', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('DB_CLEAN', 'opensearch_date_threshold', '365', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('DB_BACKUP', 'backup_local_disk_use', 'true', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('DB_BACKUP', 'backup_local_disk_path', '/backup', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('DB_BACKUP', 'backup_local_disk_max', '2', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('DISTRIBUTION', 'concurrent_session_cnt', '256', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('DISTRIBUTION', 'speed_limit', '51200', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('DISTRIBUTION', 'dist_update_forbid_use', 'false', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('DISTRIBUTION', 'dist_update_forbid_product', '[]', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('DISTRIBUTION', 'dist_update_protocol', 'http', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('domain_setting', 'setting_state', 'not_domain_setting', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('GENERAL', 'group_depth', '10', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('GENERAL', 'wizard_step', 'INITIAL_ADMIN', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('GROUP_ORDER', 'update_flag', 'OFF', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('GROUP_ORDER', 'new_group_position', 'BACK', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('GROUP_ORDER', 'select_order', 'USER', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('GROUPING', 'auto_grouping_use', 'true', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('GROUPING', 'auto_grouping_type', 'dept', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('GROUPING', 'auto_grouping_path', '/group', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('GROUPING', 'auto_grouping_target', 'default_group_agent', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('GROUPING', 'auto_grouping_condition', 'ip', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('GROUPING', 'apply_policy_on_group_change', 'all', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('GROUPING', 'empty_group_clean_use', 'true', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('GROUPING', 'empty_group_clean_interval', '7', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('MANUAL', 'manual_type', 'server', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('REPORT_CLEAN', 'report_clean_interval', '3', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('SYS_NET_CERT', 'cert_current_type', 'epp', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('SYS_NET_CERT', 'cert_new_saved_server_id', NULL, '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('SYS_NET_CERT', 'cert_site_expire_date', NULL, '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('SYS_NET_CERT', 'cert_apply_status', '0', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('SYS_NET_CERT', 'cert_new_epp_dir', '/opt/ahnlab/cpp/etc/cert/new-epp', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('SYS_NET_CERT', 'cert_new_site_dir', '/opt/ahnlab/cpp/etc/cert/new-site', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('SYS_NET_CERT', 'cert_upload_epp_dir', '/opt/ahnlab/cpp/etc/cert/upload-epp', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('SYS_NET_CERT', 'cert_upload_site_dir', '/opt/ahnlab/cpp/etc/cert/upload-site', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('SYS_NET_CERT', 'cert_name_chain_file', 'epp_chain.pem', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('SYS_NET_CERT', 'cert_name_cert_file', 'epp_cert.pem', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('SYS_NET_CERT', 'cert_name_key_file', 'epp_key.pem', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('SYS_NET_CERT', 'cert_name_keystore_file', 'epp_keystore.p12', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('SYS_NET_CERT', 'cert_name_keypass_file', 'epp_keypass', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('SYS_NET_CERT', 'cert_name_haproxy_file', 'haproxy.pem', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('SYS_NET_CERT', 'cert_name_lighttpd_file', 'lighttpd.pem', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('SYS_VIRTUAL_SYSTEM', 'virtual_system_intergration_use', 'false', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('UPDATE', 'ast_url', 'http://astweb.ahnlab.co.kr/astmain', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('UPDATE', 'ast_connect_country', '082', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('UPDATE', 'yum_protocol', 'http', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('UPDATE', 'yum_repo_path', '/opt/repo/', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('UPDATE', 'yum_current_repo', 'current', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('UPDATE', 'yum_patch_repo', 'patch', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('UPDATE', 'update_action_retry', '2', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('UPDATE', 'proxy_server_use', 'false', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('UPDATE', 'update_interval', '3', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('UPDATE', 'update_forbid_use', 'false', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('UPDATE', 'proxy_server_ip', NULL, '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('UPDATE', 'proxy_server_port', NULL, '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('UPDATE', 'proxy_server_id', NULL, '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('UPDATE', 'proxy_server_pw', NULL, '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('UPDATE', 'update_server_type', 'ahnlab', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('UPDATE', 'integrated_version', '1.0', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('UPDATE', 'agent_version', NULL, '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('UPDATE', 'proxy_conceal_key', NULL, '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('UPDATE', 'average_cpu_usage', '90', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('UPDATE', 'average_download_speed', '0', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('USER_BROKER', 'user_broker_use', 'false', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('V3_PKG_UPDATE', 'v3_pkg_update_use', 'false', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('V3_PKG_UPDATE', 'v3_pkg_auto_update_use', 'false', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('NETWORK', 'use_nat', 'false', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('SYS_NET_CERT', 'correlation_alret_sent', 'false', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('UPDATE', 'update_server_master', '1', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('GENERAL', 'batch_sleep', '0', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('CLOUD_PROXY', 'cloud_proxy', '{"server":"","port":"","id":"","password":"","use_proxy":false,"sync_interval":30,"remove_no_exist_instance":false}', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('UPDATE_COUNTRY', 'ahnlab', '{"update_server_type":"ahnlab","proxy_server_use":false,"proxy_server_ip" : "","proxy_server_port": "","proxy_server_id": "","proxy_server_pw": "","proxy_conceal_key": "","ast_url": "https://astweb.ahnlab.com/asthome","update_interval": "1440" ,"user_defined_server_path": ""}', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('UPDATE_HIPS_SIGNATURE', 'ahnlab', '{"update_server_type":"ahnlab","proxy_server_use":false,"proxy_server_ip" : "","proxy_server_port": "","proxy_server_id": "","proxy_server_pw": "","proxy_conceal_key": "","ast_url": "https://astweb.ahnlab.com/asthome","update_interval": "1440" ,"user_defined_server_path": ""}', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('HIPS_MGMT', 'IPS_RECOMMEND', '{"recommendType":"MANUAL", "period":"14"}', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('AGENT_RISK_GROUP', 'unconnected_use', 'true', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('AGENT_RISK_GROUP', 'unconnected_period', '7', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('AGENT_RISK_GROUP', 'risk_group_clean_use', 'true', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('AGENT_RISK_GROUP', 'risk_group_clean_period', '7', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('HIPS_MGMT', 'IPS_SIGNATURE_ACTION', 'default', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('UPDATE_IM', 'ahnlab', '{"update_server_type":"ahnlab","proxy_server_use":false,"proxy_server_ip" : "","proxy_server_port": "","proxy_server_id": "","proxy_server_pw": "","proxy_conceal_key": "","ast_url": "https://astweb.ahnlab.com/asthome","update_interval": "1440" ,"user_defined_server_path": ""}', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('AGENT_MANAGE_PRODUCT', 'manage_product', '{"V3NET_9.0":true}', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('UPDATE', 'server_version', '1.0.25.11-2', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('UPDATE', 'admin_version', '1.0.25.11-2', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('SYS_NET_CERT', 'cert_epp_expire_date', '2027-08-12 00:00:00', '2026-08-13 16:12:44.559029');
INSERT INTO public.tb_config VALUES ('UPDATE_SCM', 'ahnlab', '{"update_server_type":"ahnlab","proxy_server_use":false,"proxy_server_ip" : "","proxy_server_port": "","proxy_server_id": "","proxy_server_pw": "","proxy_conceal_key": "","ast_url": "https://astweb.ahnlab.com/asthome","update_interval": "1440" ,"user_defined_server_path": ""}', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('SYSLOG', 'group_name_path', 'true', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('HIPS_MGMT', 'IPS_RECOMMEND_LAST_EXECUTION_DATE', NULL, '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('AGENT_RISK_GROUP', 'remain_log', 'false', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('AGENT_RISK_GROUP', 'remain_log_check_count', '100', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('EVENT_LOG', 'log_limit', '100000', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('HIPS_MGMT', 'IPS_SIGNATURE_PACKET_CAPTURE', 'default', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('ASSET_INFO', 'usage', 'false', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('ASSET_INFO', 'primary_key', 'IP', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('CNAPP', 'cnapp_server', '{"server_ip":"127.0.0.1", "server_port":"9001"}', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('CNAPP', 'ahnlab', '{"update_server_type":"ahnlab","proxy_server_use":false,"proxy_server_ip" : "","proxy_server_port": "","proxy_server_id": "","proxy_server_pw": "","proxy_conceal_key": "","ast_url": "https://astweb.ahnlab.com/asthome","update_interval": "1440" ,"user_defined_server_path": ""}', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('CNAPP', 'license_usage_count', '0', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('LICENSE_UPDATE_INFO', '1.0', NULL, '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('LICENSE_UPDATE_INFO', '2.0', NULL, '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('METERING', 'metering_setting', '{"is_use": false,"duration": "60m"}', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('LONG_TERM_INACTIVITY', 'enable_long_term_inactive_user_blocking', 'false', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('LONG_TERM_INACTIVITY', 'set_long_term_inactivity_period', '1', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('LONG_TERM_INACTIVITY', 'block_or_delete_on_long_term_inactivity', 'block', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('SYS_LICENSE', 'cert_license', 'EMS,AGENT,V3NET_9.0,V3NET_LU,AC_CLIENT,HIPS_CLIENT,SCM_CLIENT,CNAPP,AMC_CLIENT', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('OPENSEARCH', 'language', 'ko', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('OPENSEARCH', 'csv_size_limit', '5', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('COMMAND_DISCLOSURE', 'V3_COLLECT_FEL', 'false', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('AGENT_DUPLICATION_POLICY', 'INHERIT', 'false', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('TIP_HIPS_BLOCK_IP', 'hips_tip_is_use', 'false', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('TIP_HIPS_BLOCK_IP', 'hips_tip_access_key', '', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('TIP_HIPS_BLOCK_IP', 'hips_tip_conceal_key', '', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('TIP_HIPS_BLOCK_IP', 'hips_block_ip_sync_period', '1', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('TIP_HIPS_BLOCK_IP', 'hips_block_ip_rule_use', 'false', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('TIP_HIPS_BLOCK_IP', 'hips_block_ip_action', 'detect', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('TIP_HIPS_BLOCK_IP', 'hips_block_ip_auto_expiration', 'true', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('TIP_HIPS_BLOCK_IP', 'hips_block_ip_expiration_time', '1', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('TIP_HIPS_BLOCK_IP', 'hips_block_ip_auto_remove', 'false', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('HIDDEN', 'open_customer_dept_api_info', '{"company":"none","cppmType":"none","apiServerCount":"http://1.2.3.4:8181/api/v1/config/CIs/servers/count","apiServerList":"http://1.2.3.4:8181/api/v1/config/CIs/servers"}', '2026-06-09 10:36:53.696887');
INSERT INTO public.tb_config VALUES ('DEFAULT_SERVICE_PORT', 'TOMCAT-CONSOLE', '8806', '2026-06-09 10:36:53.698584');
INSERT INTO public.tb_config VALUES ('DEFAULT_SERVICE_PORT', 'TOMCAT-AGENT', '8807', '2026-06-09 10:36:53.698584');
INSERT INTO public.tb_config VALUES ('DEFAULT_SERVICE_PORT', 'TOMCAT-AUTH', '8808', '2026-06-09 10:36:53.698584');
INSERT INTO public.tb_config VALUES ('DEFAULT_SERVICE_PORT', 'FILESERVER-HTTPS', '8809', '2026-06-09 10:36:53.698584');
INSERT INTO public.tb_config VALUES ('DEFAULT_SERVICE_PORT', 'FILESERVER-HTTP', '8810', '2026-06-09 10:36:53.698584');
INSERT INTO public.tb_config VALUES ('DEFAULT_SERVICE_PORT', 'FILESERVER-UPLOAD', '0', '2026-06-09 10:36:53.698584');
INSERT INTO public.tb_config VALUES ('DEFAULT_SERVICE_PORT', 'LBCONSOLE', '8803', '2026-06-09 10:36:53.698584');
INSERT INTO public.tb_config VALUES ('DEFAULT_SERVICE_PORT', 'LBAGENT', '8804', '2026-06-09 10:36:53.698584');
INSERT INTO public.tb_config VALUES ('DEFAULT_SERVICE_PORT', 'LBAUTH', '8805', '2026-06-09 10:36:53.698584');
INSERT INTO public.tb_config VALUES ('DEFAULT_SERVICE_PORT', 'LBDIST-HTTP', '5465', '2026-06-09 10:36:53.698584');
INSERT INTO public.tb_config VALUES ('DEFAULT_SERVICE_PORT', 'LBDIST-HTTPS', '5645', '2026-06-09 10:36:53.698584');
INSERT INTO public.tb_config VALUES ('DEFAULT_SERVICE_PORT', 'DB-EPPOLTP', '8817', '2026-06-09 10:36:53.698584');
INSERT INTO public.tb_config VALUES ('DEFAULT_SERVICE_PORT', 'CONNECTOR-EPPOLTP', '8819', '2026-06-09 10:36:53.698584');
INSERT INTO public.tb_config VALUES ('DEFAULT_SERVICE_PORT', 'CLUSTER-MANAGER', '8851', '2026-06-09 10:36:53.698584');
INSERT INTO public.tb_config VALUES ('DEFAULT_SERVICE_PORT', 'NOSQL-CONFIGSVR1', '8821', '2026-06-09 10:36:53.698584');
INSERT INTO public.tb_config VALUES ('DEFAULT_SERVICE_PORT', 'NOSQL-CONFIGSVR2', '8822', '2026-06-09 10:36:53.698584');
INSERT INTO public.tb_config VALUES ('DEFAULT_SERVICE_PORT', 'NOSQL-CONFIGSVR3', '8823', '2026-06-09 10:36:53.698584');
INSERT INTO public.tb_config VALUES ('DEFAULT_SERVICE_PORT', 'NOSQL-MONGOS', '8825', '2026-06-09 10:36:53.698584');
INSERT INTO public.tb_config VALUES ('DEFAULT_SERVICE_PORT', 'NOSQL-SHARDSVR', '8824', '2026-06-09 10:36:53.698584');
INSERT INTO public.tb_config VALUES ('DEFAULT_SERVICE_PORT', 'CACHED', '8831', '2026-06-09 10:36:53.698584');
INSERT INTO public.tb_config VALUES ('DEFAULT_SERVICE_PORT', 'SCHEDULER', '8832', '2026-06-09 10:36:53.698584');
INSERT INTO public.tb_config VALUES ('DEFAULT_SERVICE_PORT', 'KAFKA-CONSUMER', '0', '2026-06-09 10:36:53.698584');
INSERT INTO public.tb_config VALUES ('DEFAULT_SERVICE_PORT', 'SYSLOG-SENDER', '0', '2026-06-09 10:36:53.698584');
INSERT INTO public.tb_config VALUES ('DEFAULT_SERVICE_PORT', 'KAFKA', '8816', '2026-06-09 10:36:53.698584');
INSERT INTO public.tb_config VALUES ('DEFAULT_SERVICE_PORT', 'BATCH-PROCESSOR', '0', '2026-06-09 10:36:53.698584');
INSERT INTO public.tb_config VALUES ('DEFAULT_SERVICE_PORT', 'EPPCMD', '8858', '2026-06-09 10:36:53.698584');
INSERT INTO public.tb_config VALUES ('DEFAULT_SERVICE_PORT', 'YUM', '8850', '2026-06-09 10:36:53.698584');
INSERT INTO public.tb_config VALUES ('DEFAULT_SERVICE_PORT', 'NTP', '123', '2026-06-09 10:36:53.698584');
INSERT INTO public.tb_config VALUES ('METERING', 'metering_send', '{"is_use": true,"type": "cycle","cycle": "60m"}', '2026-06-09 10:36:53.699087');
INSERT INTO public.tb_config VALUES ('METERING', 'clean_target_collection', 'tb_product_usage', '2026-06-09 10:36:53.699087');
INSERT INTO public.tb_config VALUES ('METERING', 'clean_month_interval', '4', '2026-06-09 10:36:53.699087');
INSERT INTO public.tb_config VALUES ('METERING', 'common_log_clean_interval_days', '365', '2026-06-09 10:36:53.699087');
INSERT INTO public.tb_config VALUES ('MAIL_SERVER', 'otp_use', 'false', '2026-06-09 10:36:53.699303');


--
-- PostgreSQL database dump complete
--

\unrestrict ZiOZW0WfHUIeiIiWsGtKLnnGHymKSaUO7r8O9KZMMs1hVMRbLnbadwlGo3H08QA

