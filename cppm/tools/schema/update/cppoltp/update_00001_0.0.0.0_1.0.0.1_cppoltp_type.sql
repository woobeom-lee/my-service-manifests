SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';

CREATE EXTENSION IF NOT EXISTS ltree WITH SCHEMA public;
COMMENT ON EXTENSION ltree IS 'data type for hierarchical tree-like structures';

CREATE EXTENSION IF NOT EXISTS tablefunc WITH SCHEMA public;
COMMENT ON EXTENSION tablefunc IS 'functions that manipulate whole tables, including crosstab';

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;

SET search_path = public, pg_catalog;


------------------------------------------------------------------------------------------
select '## en_app_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_app_type' ) 
    THEN
        CREATE TYPE en_app_type AS ENUM ();
        COMMENT ON TYPE en_app_type IS 'app 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';
ALTER TYPE en_app_type ADD VALUE IF NOT EXISTS 'INTERNAL';
ALTER TYPE en_app_type ADD VALUE IF NOT EXISTS 'EXTERNAL';
ALTER TYPE en_app_type ADD VALUE IF NOT EXISTS 'VIRTEX';

------------------------------------------------------------------------------------------
select '## en_application_service_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_application_service_type' ) 
    THEN
        CREATE TYPE en_application_service_type AS ENUM ();
        COMMENT ON TYPE en_application_service_type IS '서비스 유형';
    END IF;
END $$ LANGUAGE 'plpgsql';
ALTER TYPE en_application_service_type ADD VALUE IF NOT EXISTS 'SELECT_QUERY';
ALTER TYPE en_application_service_type ADD VALUE IF NOT EXISTS 'COMMAND';
ALTER TYPE en_application_service_type ADD VALUE IF NOT EXISTS 'GET';
    


------------------------------------------------------------------------------------------
select '## en_base_report_group_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_base_report_group_type' ) 
    THEN
        CREATE TYPE en_base_report_group_type AS ENUM ();
        COMMENT ON TYPE en_base_report_group_type IS '기본 보고서 그룹 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';
ALTER TYPE en_base_report_group_type ADD VALUE IF NOT EXISTS 'AGENT';
ALTER TYPE en_base_report_group_type ADD VALUE IF NOT EXISTS 'PRODUCT';
ALTER TYPE en_base_report_group_type ADD VALUE IF NOT EXISTS 'MALWARE';
ALTER TYPE en_base_report_group_type ADD VALUE IF NOT EXISTS 'SUMMARY';
ALTER TYPE en_base_report_group_type ADD VALUE IF NOT EXISTS 'AC';
ALTER TYPE en_base_report_group_type ADD VALUE IF NOT EXISTS 'HIPS';
ALTER TYPE en_base_report_group_type ADD VALUE IF NOT EXISTS 'HIPS_FW';
ALTER TYPE en_base_report_group_type ADD VALUE IF NOT EXISTS 'CLOUD_STATUS';
ALTER TYPE en_base_report_group_type ADD VALUE IF NOT EXISTS 'HIPS_APP_STATUS';
ALTER TYPE en_base_report_group_type ADD VALUE IF NOT EXISTS 'HIPS_SIGNATURE_STATUS';
ALTER TYPE en_base_report_group_type ADD VALUE IF NOT EXISTS 'HIPS_SIP_STATUS';
ALTER TYPE en_base_report_group_type ADD VALUE IF NOT EXISTS 'HIPS_DOMAINURL_TOP';
ALTER TYPE en_base_report_group_type ADD VALUE IF NOT EXISTS 'HIPS_COUNTRY_TOP';
ALTER TYPE en_base_report_group_type ADD VALUE IF NOT EXISTS 'AC_FILE_STATUS';
ALTER TYPE en_base_report_group_type ADD VALUE IF NOT EXISTS 'AC_TARGET_STATUS';
ALTER TYPE en_base_report_group_type ADD VALUE IF NOT EXISTS 'FW_STATUS';

-- CWPP-1779
ALTER TYPE en_base_report_group_type ADD VALUE IF NOT EXISTS 'IM';
-- CWPP-2190
ALTER TYPE en_base_report_group_type ADD VALUE IF NOT EXISTS 'SCM_COMPLIANCE';
ALTER TYPE en_base_report_group_type ADD VALUE IF NOT EXISTS 'SCM_SECRET';

ALTER TYPE en_base_report_group_type ADD VALUE IF NOT EXISTS 'CNAPP';

------------------------------------------------------------------------------------------
select '## en_base_report_id_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_base_report_id_type' ) 
    THEN
        CREATE TYPE en_base_report_id_type AS ENUM ();
        COMMENT ON TYPE en_base_report_id_type IS '기본 보고서 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'AGENT_INSTALL_STATUS';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'AGENT_INSTALL_HISTORY';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'HW_STATUS';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'SW_STATUS';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'OS_STATUS';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'PRODUCT_STATUS';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'V3_INSTALL_STATUS';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'V3_INSTALL_HISTORY';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'V3_POLICY_STATUS';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'MALWARE_SUMMARY';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'MALWARE_NAME_TOP';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'MALWARE_AGENT_TOP';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'MALWARE_DETECT_HISTORY';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'BASE_SUMMARY';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'HIPS_DETECT_HISTORY';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'HIPS_APPLICATION_TOP';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'HIPS_SIP_TOP';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'HIPS_DETECT_AGENT_TOP';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'HIPS_SIGNATURE_TOP';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'HIPS_COUNTRY_TOP';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'AC_FILE_STATUS';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'AC_TARGET_STATUS';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'FW_STATUS';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'HIPS_FW_HISTORY';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'HIPS_FW_SIP_TOP';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'HIPS_FW_AGENT_TOP';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'HIPS_FW_PORT_TOP';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'HIPS_FW_RULE_TOP';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'AC_BLOCK_HISTORY';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'AC_BLOCK_FILE_TOP';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'AC_AGENT_TOP';
    
-- CWPP-1779
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'IM_AGENT_TOP';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'IM_WATCH_TOP';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'IM_RULE_TOP';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'IM_INSPECT_TOP';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'IM_HISTORY';

-- CWPP-2190
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'SCM_COMPLIANCE_SCAN_RESULT_FAILED_AGENT_TOP';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'SCM_COMPLIANCE_SCAN_RESULT_FAILED_ITEM_TOP';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'SCM_SECRET_SCAN_RESULT_FAILED_AGENT_TOP';

ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'CNAPP_IMAGE_SCAN_RESULT';
ALTER TYPE en_base_report_id_type ADD VALUE IF NOT EXISTS 'CNAPP_REGISTRY_IMAGE_SCAN_RESULT';


------------------------------------------------------------------------------------------
select '## en_batch_status';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_batch_status' ) 
    THEN
        CREATE TYPE en_batch_status AS ENUM ();
        COMMENT ON TYPE en_batch_status IS '배치 수행 상태 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_batch_status ADD VALUE IF NOT EXISTS 'RUNNING';
ALTER TYPE en_batch_status ADD VALUE IF NOT EXISTS 'READY';


------------------------------------------------------------------------------------------
select '## en_clean_table_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_clean_table_type' ) 
    THEN
        CREATE TYPE en_clean_table_type AS ENUM ();
        COMMENT ON TYPE en_clean_table_type IS '데이터베이스 테이블 정리 대상 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_clean_table_type ADD VALUE IF NOT EXISTS 'TB_AUDIT_LOG';
ALTER TYPE en_clean_table_type ADD VALUE IF NOT EXISTS 'TB_SERVICE_LOG';
ALTER TYPE en_clean_table_type ADD VALUE IF NOT EXISTS 'TB_ENGINE_UPDATE_LOG';
ALTER TYPE en_clean_table_type ADD VALUE IF NOT EXISTS 'TB_BACKUP_LOG';
ALTER TYPE en_clean_table_type ADD VALUE IF NOT EXISTS 'TB_PKG_DIST_LOG';
ALTER TYPE en_clean_table_type ADD VALUE IF NOT EXISTS 'TB_PKG_SYNC_LOG';
ALTER TYPE en_clean_table_type ADD VALUE IF NOT EXISTS 'TB_AGENT_INSTALL_PKG_LOG';
ALTER TYPE en_clean_table_type ADD VALUE IF NOT EXISTS 'TB_AGENT_EVENT_LOG';
ALTER TYPE en_clean_table_type ADD VALUE IF NOT EXISTS 'TB_TASK_STATUS_LOG';
ALTER TYPE en_clean_table_type ADD VALUE IF NOT EXISTS 'TB_NODE_SW';
ALTER TYPE en_clean_table_type ADD VALUE IF NOT EXISTS 'TB_NODE_HW';
ALTER TYPE en_clean_table_type ADD VALUE IF NOT EXISTS 'TB_POLICY_STATUS_LOG';
ALTER TYPE en_clean_table_type ADD VALUE IF NOT EXISTS 'TB_V3_ALERT_LOG';
ALTER TYPE en_clean_table_type ADD VALUE IF NOT EXISTS 'TB_V3_SS_LOG';
ALTER TYPE en_clean_table_type ADD VALUE IF NOT EXISTS 'TB_V3_SUP_LOG';
ALTER TYPE en_clean_table_type ADD VALUE IF NOT EXISTS 'TB_V3_IS_LOG';
ALTER TYPE en_clean_table_type ADD VALUE IF NOT EXISTS 'TB_V3_QUAR_LOG';
ALTER TYPE en_clean_table_type ADD VALUE IF NOT EXISTS 'TB_HIPS_AGENT_EVENT_LOG';
ALTER TYPE en_clean_table_type ADD VALUE IF NOT EXISTS 'TB_HIPS_DETECT_EVENT_LOG';
ALTER TYPE en_clean_table_type ADD VALUE IF NOT EXISTS 'TB_HIPS_FW_EVENT_LOG';
ALTER TYPE en_clean_table_type ADD VALUE IF NOT EXISTS 'TB_AC_AGENT_EVENT_LOG';
ALTER TYPE en_clean_table_type ADD VALUE IF NOT EXISTS 'TB_AC_EXEC_EVENT_LOG';
ALTER TYPE en_clean_table_type ADD VALUE IF NOT EXISTS 'TB_AC_ACCESS_EVENT_LOG';
ALTER TYPE en_clean_table_type ADD VALUE IF NOT EXISTS 'TB_IM_DETECT_EVENT_LOG';
ALTER TYPE en_clean_table_type ADD VALUE IF NOT EXISTS 'TB_CNAPP_EVENT_LOG'; 
ALTER TYPE en_clean_table_type ADD VALUE IF NOT EXISTS 'TB_CNAPP_MALWARE_SCAN_EVENT_LOG'; 
ALTER TYPE en_clean_table_type ADD VALUE IF NOT EXISTS 'TB_CNAPP_VULNERABILITY_SCAN_EVENT_LOG'; 
ALTER TYPE en_clean_table_type ADD VALUE IF NOT EXISTS 'TB_SCM_SCAN_LOG';
ALTER TYPE en_clean_table_type ADD VALUE IF NOT EXISTS 'TB_SCM_AGENT_LOG';
ALTER TYPE en_clean_table_type ADD VALUE IF NOT EXISTS 'TB_SERVER_ALERT_LOG';

------------------------------------------------------------------------------------------
select '## en_comparison_operator';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_comparison_operator' ) 
    THEN
        CREATE TYPE en_comparison_operator AS ENUM ();
        COMMENT ON TYPE en_comparison_operator IS '비교 연산자 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';
ALTER TYPE en_comparison_operator ADD VALUE IF NOT EXISTS '=';
ALTER TYPE en_comparison_operator ADD VALUE IF NOT EXISTS 'LIKE';
ALTER TYPE en_comparison_operator ADD VALUE IF NOT EXISTS '>';
ALTER TYPE en_comparison_operator ADD VALUE IF NOT EXISTS '>=';
ALTER TYPE en_comparison_operator ADD VALUE IF NOT EXISTS '<';
ALTER TYPE en_comparison_operator ADD VALUE IF NOT EXISTS '<=';
ALTER TYPE en_comparison_operator ADD VALUE IF NOT EXISTS '<>';

------------------------------------------------------------------------------------------
select '## en_config_group';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_config_group' ) 
    THEN
        CREATE TYPE en_config_group AS ENUM ();
        COMMENT ON TYPE en_config_group IS '설정 그룹 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'AC_MGMT';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'AGENT_INSTALL_PAGE';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'AGENT_MANAGE_PRODUCT';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'AGENT_MGMT_KEY';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'AGENT_RISK_GROUP';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'AGENT_SEND_LOG';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'AGENT_THRESHOLD';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'AHNLAB_COM_V3MASTER_DOWNLOAD_FILE_NAME';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'AHNLAB_COM_V3MASTER_FILE_SEQ';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'AHNLAB_COM_V3MASTER';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'AMBASS';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'ASSET_INFO';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'CLOUD_PROXY';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'CNAPP';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'COMMAND_DISCLOSURE';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'CSP_MGMT';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'DB_BACKUP';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'DB_CLEAN';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'DEFAULT_SERVICE_PORT';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'DISTRIBUTION';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'domain_setting';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'EULA';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'EVENT_LOG';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'GENERAL';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'GROUP_ORDER';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'GROUPING';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'HIDDEN';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'HIPS_MGMT';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'LICENSE_UPDATE_INFO';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'LONG_TERM_INACTIVITY';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'MAIL_SERVER';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'MANUAL';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'METERING';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'NETWORK';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'OPENSEARCH';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'REPORT_CLEAN';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'REPORT_LOGO';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'SYS_INFO';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'SYS_IP';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'SYS_LICENSE';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'SYS_NET_CERT';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'SYS_VIRTUAL_SYSTEM';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'SYSLOG';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'UPDATE_COUNTRY';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'UPDATE_HIPS_SIGNATURE';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'UPDATE_IM';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'UPDATE_SCM';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'UPDATE_SERVICE';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'UPDATE';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'USER_BROKER';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'V3_PKG_UPDATE';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'AGENT_DUPLICATION_POLICY';
ALTER TYPE en_config_group ADD VALUE IF NOT EXISTS 'TIP_HIPS_BLOCK_IP';

------------------------------------------------------------------------------------------
select '## en_correlation_condition_id_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_correlation_condition_id_type' ) 
    THEN
        CREATE TYPE en_correlation_condition_id_type AS ENUM ();
        COMMENT ON TYPE en_correlation_condition_id_type IS '연계 규칙 조건 항목 ID 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'LAST_CONNECT_TIME';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'MALWARE_DETECT_COUNT';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'MALWARE_NAME';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'V3_UNINSTALL';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'V3_LAST_ENGINE_UPDATE';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'V3_REAL_TIME_SCAN_OFF';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'NO_LICENSE_USER';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'V3_INSTALL';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'AGENT_VERSION';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'LAST_SCAN_TIME';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'DB_FILE_SIZE';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'LICENSE_EXPIRE';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'CERTIFICATE_EXPIRE';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'CPU_USAGE';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'MEMORY_USAGE';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'DISK_USAGE';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'FILE_SERVER_DISK_USAGE';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'FILE_SERVER_DISK_SIZE';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'TITLE';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'USER_NAME';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'USER_LIST';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'CORRELATION_CONDITION';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'PRODUCT_INSTALL';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'NODE_FAILURE';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'SW_INSTALL';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'SW_UNINSTALL';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'AC_EXEC_BLOCK_COUNT';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'AC_FILE_HASH_DETECT_COUNT';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'AC_FILE_NAME_DETECT_COUNT';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'HIPS_DETECT_COUNT';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'HIPS_SIGNATURE_NAME';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'HIPS_SEVERITY';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'HIPS_APPLYING_COUNT';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'HIPS_LAST_SIGNATURE_UPDATE_TIME';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'AC_IM_DETECT_COUNT';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'AC_IM_WATCHLIST_DETECT_COUNT';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'AC_IM_WATCHLIST_RULE_DETECT_COUNT';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'AC_IM_WATCHLIST_RULE_TARGET_DETECT_COUNT';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'AC_IM_MANUAL_TIME';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'SCM_LAST_SCAN_TIME';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'SCM_COMPLIANCE_SCAN_RESULT_FAILED_DETECT_COUNT';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'SCM_COMPLIANCE_SCAN_RESULT_FAILED_ITEM_DETECT_COUNT';
ALTER TYPE en_correlation_condition_id_type ADD VALUE IF NOT EXISTS 'SCM_SECRET_SCAN_RESULT_FAILED_DETECT_COUNT';


------------------------------------------------------------------------------------------
select '## en_correlation_exclude_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_correlation_exclude_type' ) 
    THEN
        CREATE TYPE en_correlation_exclude_type AS ENUM ();
    END IF;
END $$ LANGUAGE 'plpgsql';
    
ALTER TYPE en_correlation_exclude_type ADD VALUE IF NOT EXISTS 'NODE';
ALTER TYPE en_correlation_exclude_type ADD VALUE IF NOT EXISTS 'GROUP';
    

------------------------------------------------------------------------------------------
select '## en_correlation_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_correlation_type' ) 
    THEN
        CREATE TYPE en_correlation_type AS ENUM ();
        COMMENT ON TYPE en_correlation_type IS '연계 규칙 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';
    
ALTER TYPE en_correlation_type ADD VALUE IF NOT EXISTS 'GENERAL';
ALTER TYPE en_correlation_type ADD VALUE IF NOT EXISTS 'SYSTEM_ALERT';
ALTER TYPE en_correlation_type ADD VALUE IF NOT EXISTS 'MACRO';


------------------------------------------------------------------------------------------
select '## en_country_code_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_country_code_type' ) 
    THEN
        CREATE TYPE en_country_code_type AS ENUM ();
        COMMENT ON TYPE en_country_code_type IS '사용자 정의 국가설정 코드';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'AD';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'AE';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'AF';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'AG';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'AI';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'AL';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'AM';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'AO';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'AQ';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'AR';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'AS';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'AT';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'AU';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'AW';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'AX';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'AZ';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'BA';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'BB';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'BD';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'BE';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'BF';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'BG';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'BH';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'BI';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'BJ';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'BL';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'BM';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'BN';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'BO';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'BQ';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'BR';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'BS';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'BT';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'BV';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'BW';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'BY';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'BZ';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'CA';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'CC';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'CD';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'CF';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'CG';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'CH';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'CI';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'CK';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'CL';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'CM';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'CN';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'CO';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'CR';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'CU';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'CV';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'CW';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'CX';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'CY';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'CZ';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'DE';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'DJ';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'DK';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'DM';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'DO';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'DZ';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'EC';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'EE';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'EG';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'EH';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'ER';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'ES';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'ET';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'FI';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'FJ';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'FK';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'FM';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'FO';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'FR';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'GA';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'GB';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'GD';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'GE';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'GF';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'GG';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'GH';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'GI';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'GL';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'GM';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'GN';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'GP';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'GQ';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'GR';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'GS';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'GT';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'GU';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'GW';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'GY';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'HK';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'HM';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'HN';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'HR';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'HT';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'HU';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'ID';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'IE';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'IL';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'IM';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'IN';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'IO';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'IQ';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'IR';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'IS';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'IT';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'JE';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'JM';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'JO';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'JP';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'KE';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'KG';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'KH';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'KI';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'KM';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'KN';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'KP';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'KR';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'KW';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'KY';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'KZ';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'LA';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'LB';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'LC';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'LI';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'LK';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'LR';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'LS';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'LT';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'LU';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'LV';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'LY';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'MA';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'MC';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'MD';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'ME';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'MF';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'MG';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'MH';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'MK';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'ML';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'MM';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'MN';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'MO';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'MP';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'MQ';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'MR';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'MS';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'MT';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'MU';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'MV';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'MW';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'MX';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'MY';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'MZ';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'NA';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'NC';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'NE';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'NF';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'NG';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'NI';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'NL';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'NO';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'NP';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'NR';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'NU';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'NZ';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'OM';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'PA';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'PE';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'PF';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'PG';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'PH';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'PK';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'PL';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'PM';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'PN';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'PR';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'PS';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'PT';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'PW';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'PY';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'QA';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'RE';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'RO';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'RS';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'RU';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'RW';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'SA';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'SB';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'SC';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'SD';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'SE';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'SG';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'SH';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'SI';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'SJ';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'SK';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'SL';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'SM';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'SN';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'SO';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'SR';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'SS';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'ST';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'SV';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'SX';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'SY';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'SZ';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'TC';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'TD';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'TF';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'TG';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'TH';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'TJ';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'TK';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'TL';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'TM';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'TN';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'TO';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'TR';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'TT';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'TV';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'TW';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'TZ';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'UA';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'UG';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'UM';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'US';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'UY';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'UZ';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'VA';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'VC';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'VE';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'VG';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'VI';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'VN';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'VU';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'WF';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'WS';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'XK';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'YE';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'YT';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'ZA';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'ZM';
ALTER TYPE en_country_code_type ADD VALUE IF NOT EXISTS 'ZW';


------------------------------------------------------------------------------------------
select '## en_db_method';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_db_method' ) 
    THEN
        CREATE TYPE en_db_method AS ENUM ();
        COMMENT ON TYPE en_db_method IS 'DB 처리 방식 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_db_method ADD VALUE IF NOT EXISTS'PROCEDURE';
ALTER TYPE en_db_method ADD VALUE IF NOT EXISTS'FIND';
ALTER TYPE en_db_method ADD VALUE IF NOT EXISTS'AGGREGATE';
ALTER TYPE en_db_method ADD VALUE IF NOT EXISTS'INSERT';
ALTER TYPE en_db_method ADD VALUE IF NOT EXISTS'SET';
ALTER TYPE en_db_method ADD VALUE IF NOT EXISTS'GET';
ALTER TYPE en_db_method ADD VALUE IF NOT EXISTS'DELETE';
ALTER TYPE en_db_method ADD VALUE IF NOT EXISTS'GET_LIKE';
ALTER TYPE en_db_method ADD VALUE IF NOT EXISTS'SET_CACHE';
ALTER TYPE en_db_method ADD VALUE IF NOT EXISTS'GET_CACHE';
ALTER TYPE en_db_method ADD VALUE IF NOT EXISTS'DELETE_CACHE';
ALTER TYPE en_db_method ADD VALUE IF NOT EXISTS'SET_ARRAY';
ALTER TYPE en_db_method ADD VALUE IF NOT EXISTS'NONE';
ALTER TYPE en_db_method ADD VALUE IF NOT EXISTS'AGGREGATE_LOG';
ALTER TYPE en_db_method ADD VALUE IF NOT EXISTS'PROCEDURE_IP_CONNECTED';
ALTER TYPE en_db_method ADD VALUE IF NOT EXISTS'SET_IP_CONNECTED';
ALTER TYPE en_db_method ADD VALUE IF NOT EXISTS'AGGREGATE_LOG_CUSTOM';
ALTER TYPE en_db_method ADD VALUE IF NOT EXISTS'AGGREGATE_LOG_MORE';
ALTER TYPE en_db_method ADD VALUE IF NOT EXISTS'PROCEDURE_LOG';
ALTER TYPE en_db_method ADD VALUE IF NOT EXISTS'PROCEDURE_LOG_FROM';

    
------------------------------------------------------------------------------------------
select '## en_db_mgmt_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_db_mgmt_type' ) 
    THEN
        CREATE TYPE en_db_mgmt_type AS ENUM ();
        COMMENT ON TYPE en_db_mgmt_type IS 'DB 관리 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_db_mgmt_type ADD VALUE IF NOT EXISTS 'BACKUP';
ALTER TYPE en_db_mgmt_type ADD VALUE IF NOT EXISTS 'CLEANUP';
ALTER TYPE en_db_mgmt_type ADD VALUE IF NOT EXISTS 'REPORT_CLEAN';


------------------------------------------------------------------------------------------
select '## en_db_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_db_type' ) 
    THEN
        CREATE TYPE en_db_type AS ENUM ();
        COMMENT ON TYPE en_db_type IS 'DB 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_db_type ADD VALUE IF NOT EXISTS 'OLTP';
ALTER TYPE en_db_type ADD VALUE IF NOT EXISTS 'OLAP';
ALTER TYPE en_db_type ADD VALUE IF NOT EXISTS 'NOSQL';
ALTER TYPE en_db_type ADD VALUE IF NOT EXISTS 'CACHE';
ALTER TYPE en_db_type ADD VALUE IF NOT EXISTS 'CLUSTER';
ALTER TYPE en_db_type ADD VALUE IF NOT EXISTS 'NONE';

------------------------------------------------------------------------------------------
select '## en_enc_algorithm';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_enc_algorithm' ) 
    THEN
        CREATE TYPE en_enc_algorithm AS ENUM ();
        COMMENT ON TYPE en_enc_algorithm IS '대칭 키 암호화 알고리즘';
    END IF;
END $$ LANGUAGE 'plpgsql';
    
ALTER TYPE en_enc_algorithm ADD VALUE IF NOT EXISTS 'NONE';
ALTER TYPE en_enc_algorithm ADD VALUE IF NOT EXISTS 'AES';
ALTER TYPE en_enc_algorithm ADD VALUE IF NOT EXISTS 'SEED';
ALTER TYPE en_enc_algorithm ADD VALUE IF NOT EXISTS 'DESede';
ALTER TYPE en_enc_algorithm ADD VALUE IF NOT EXISTS 'Blowfish';


------------------------------------------------------------------------------------------
select '## en_etl_from';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_etl_from' ) 
    THEN
        CREATE TYPE en_etl_from AS ENUM ();
        COMMENT ON TYPE en_etl_from IS 'ETL 소스 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';
    
ALTER TYPE en_etl_from ADD VALUE IF NOT EXISTS 'OLTP';
ALTER TYPE en_etl_from ADD VALUE IF NOT EXISTS 'OLAP';
ALTER TYPE en_etl_from ADD VALUE IF NOT EXISTS 'NOSQL';

------------------------------------------------------------------------------------------
select '## en_etl_method';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_etl_method' ) 
    THEN
        CREATE TYPE en_etl_method AS ENUM ();
        COMMENT ON TYPE en_etl_method IS 'ETL 방식 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_etl_method ADD VALUE IF NOT EXISTS 'QUERY';
ALTER TYPE en_etl_method ADD VALUE IF NOT EXISTS 'AGGREGATE_LOG';
ALTER TYPE en_etl_method ADD VALUE IF NOT EXISTS 'AGGREGATE_LOG_TO_STATUS';
ALTER TYPE en_etl_method ADD VALUE IF NOT EXISTS 'AGGREGATE_STATUS';
ALTER TYPE en_etl_method ADD VALUE IF NOT EXISTS 'RDB_TO_RDB';
ALTER TYPE en_etl_method ADD VALUE IF NOT EXISTS 'RDB_TO_RDB_TEMP';
ALTER TYPE en_etl_method ADD VALUE IF NOT EXISTS 'AGGREGATE_STATUS_TEMP';



------------------------------------------------------------------------------------------
select '## en_etl_to';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_etl_to' ) 
    THEN
        CREATE TYPE en_etl_to AS ENUM ();
        COMMENT ON TYPE en_etl_to IS 'ETL 목적지 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_etl_to ADD VALUE IF NOT EXISTS 'OLTP';
ALTER TYPE en_etl_to ADD VALUE IF NOT EXISTS 'OLAP';

------------------------------------------------------------------------------------------
select '## en_execute_status';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_execute_status' ) 
    THEN
        CREATE TYPE en_execute_status AS ENUM ();
        COMMENT ON TYPE en_execute_status IS '스케줄 실행 상태';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_execute_status ADD VALUE IF NOT EXISTS 'READY';
ALTER TYPE en_execute_status ADD VALUE IF NOT EXISTS 'PROGRESS';
ALTER TYPE en_execute_status ADD VALUE IF NOT EXISTS 'PENDING';
ALTER TYPE en_execute_status ADD VALUE IF NOT EXISTS 'SUCCESS';
ALTER TYPE en_execute_status ADD VALUE IF NOT EXISTS 'FAIL';
ALTER TYPE en_execute_status ADD VALUE IF NOT EXISTS 'RUN_TIME';
ALTER TYPE en_execute_status ADD VALUE IF NOT EXISTS 'DUPLE_SKIP';

------------------------------------------------------------------------------------------
select '## en_extra_policy_detail_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_extra_policy_detail_type' ) 
    THEN
        CREATE TYPE en_extra_policy_detail_type AS ENUM ();
        COMMENT ON TYPE en_extra_policy_detail_type IS '추가 정책 상세 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_extra_policy_detail_type ADD VALUE IF NOT EXISTS 'VM_AGENT';
ALTER TYPE en_extra_policy_detail_type ADD VALUE IF NOT EXISTS 'UPDATE_SERVER';
ALTER TYPE en_extra_policy_detail_type ADD VALUE IF NOT EXISTS 'VIRTEX_SERVER';
ALTER TYPE en_extra_policy_detail_type ADD VALUE IF NOT EXISTS 'LICENSE_V1';
ALTER TYPE en_extra_policy_detail_type ADD VALUE IF NOT EXISTS 'LICENSE_V2';


------------------------------------------------------------------------------------------
select '## en_file_update_target_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_file_update_target_type' ) 
    THEN
        CREATE TYPE en_file_update_target_type AS ENUM ();
        COMMENT ON TYPE en_file_update_target_type IS '배포 업데이트 서버 대상 유형 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';
    
ALTER TYPE en_file_update_target_type ADD VALUE IF NOT EXISTS 'NODE';
ALTER TYPE en_file_update_target_type ADD VALUE IF NOT EXISTS 'GROUP';



------------------------------------------------------------------------------------------
select '## en_group_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_group_type' ) 
    THEN
        CREATE TYPE en_group_type AS ENUM ();
        COMMENT ON TYPE en_group_type IS '그룹 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_group_type ADD VALUE IF NOT EXISTS 'DEFAULT';
ALTER TYPE en_group_type ADD VALUE IF NOT EXISTS 'TOP';
ALTER TYPE en_group_type ADD VALUE IF NOT EXISTS 'GENERAL';
ALTER TYPE en_group_type ADD VALUE IF NOT EXISTS 'PHYSICAL';
ALTER TYPE en_group_type ADD VALUE IF NOT EXISTS 'CLOUD';
ALTER TYPE en_group_type ADD VALUE IF NOT EXISTS 'CLOUD_AWS';
ALTER TYPE en_group_type ADD VALUE IF NOT EXISTS 'CLOUD_AZURE';
ALTER TYPE en_group_type ADD VALUE IF NOT EXISTS 'CLOUD_AZURE_SUBSCRIPTION';
ALTER TYPE en_group_type ADD VALUE IF NOT EXISTS 'CLOUD_AZURE_RESOURCE_GROUP';
ALTER TYPE en_group_type ADD VALUE IF NOT EXISTS 'CLOUD_ALIBABA';
ALTER TYPE en_group_type ADD VALUE IF NOT EXISTS 'RISK';

------------------------------------------------------------------------------------------
select '## en_hash_algorithm';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_hash_algorithm' ) 
    THEN
        CREATE TYPE en_hash_algorithm AS ENUM ();
        COMMENT ON TYPE en_hash_algorithm IS '해시 알고리즘 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_hash_algorithm ADD VALUE IF NOT EXISTS 'MD5';
ALTER TYPE en_hash_algorithm ADD VALUE IF NOT EXISTS 'SHA_256';
ALTER TYPE en_hash_algorithm ADD VALUE IF NOT EXISTS 'SHA_384';
ALTER TYPE en_hash_algorithm ADD VALUE IF NOT EXISTS 'SHA_512';
ALTER TYPE en_hash_algorithm ADD VALUE IF NOT EXISTS 'SHA_1';
ALTER TYPE en_hash_algorithm ADD VALUE IF NOT EXISTS 'SHA256';

------------------------------------------------------------------------------------------
select '## en_hips_signature_recommendation_status_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_hips_signature_recommendation_status_type' ) 
    THEN
        CREATE TYPE en_hips_signature_recommendation_status_type AS ENUM ();
        COMMENT ON TYPE en_hips_signature_recommendation_status_type IS 'HIPS signature 취약점 분석 상태 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_hips_signature_recommendation_status_type ADD VALUE IF NOT EXISTS 'INIT';
ALTER TYPE en_hips_signature_recommendation_status_type ADD VALUE IF NOT EXISTS 'BEGIN_SCAN';
ALTER TYPE en_hips_signature_recommendation_status_type ADD VALUE IF NOT EXISTS 'END_SCAN';
ALTER TYPE en_hips_signature_recommendation_status_type ADD VALUE IF NOT EXISTS 'RETRY_SCAN';
ALTER TYPE en_hips_signature_recommendation_status_type ADD VALUE IF NOT EXISTS 'BEGIN_MERGE';
ALTER TYPE en_hips_signature_recommendation_status_type ADD VALUE IF NOT EXISTS 'RETRY_MERGE';
ALTER TYPE en_hips_signature_recommendation_status_type ADD VALUE IF NOT EXISTS 'COMPLETE';

------------------------------------------------------------------------------------------
select '## en_hips_signature_recommendation_scan_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_hips_signature_recommendation_scan_type' ) 
    THEN
        CREATE TYPE en_hips_signature_recommendation_scan_type AS ENUM ();
        COMMENT ON TYPE en_hips_signature_recommendation_scan_type IS 'HIPS signature 취약점 분석 스캔 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_hips_signature_recommendation_scan_type ADD VALUE IF NOT EXISTS 'INIT';
ALTER TYPE en_hips_signature_recommendation_scan_type ADD VALUE IF NOT EXISTS 'BEGIN_SCAN';
ALTER TYPE en_hips_signature_recommendation_scan_type ADD VALUE IF NOT EXISTS 'FAIL_SCAN';
ALTER TYPE en_hips_signature_recommendation_scan_type ADD VALUE IF NOT EXISTS 'END_SCAN';
ALTER TYPE en_hips_signature_recommendation_scan_type ADD VALUE IF NOT EXISTS 'RETRY_SCAN';
ALTER TYPE en_hips_signature_recommendation_scan_type ADD VALUE IF NOT EXISTS 'BEGIN_MERGE';
ALTER TYPE en_hips_signature_recommendation_scan_type ADD VALUE IF NOT EXISTS 'FAIL_MERGE';
ALTER TYPE en_hips_signature_recommendation_scan_type ADD VALUE IF NOT EXISTS 'RETRY_MERGE';
ALTER TYPE en_hips_signature_recommendation_scan_type ADD VALUE IF NOT EXISTS 'COMPLETE';

------------------------------------------------------------------------------------------
select '## en_integrity_status';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_integrity_status' ) 
    THEN
        CREATE TYPE en_integrity_status AS ENUM ();
        COMMENT ON TYPE en_integrity_status IS '무결성 상태 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';
        
ALTER TYPE en_integrity_status ADD VALUE IF NOT EXISTS 'NORMAL';
ALTER TYPE en_integrity_status ADD VALUE IF NOT EXISTS 'ABNORMAL';
ALTER TYPE en_integrity_status ADD VALUE IF NOT EXISTS 'UNKNOWN';
ALTER TYPE en_integrity_status ADD VALUE IF NOT EXISTS 'NOT_SCANNED';
------------------------------------------------------------------------------------------
select '## en_v3_scan_status';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_v3_scan_status' ) 
    THEN
        CREATE TYPE en_v3_scan_status AS ENUM ();
        COMMENT ON TYPE en_v3_scan_status IS '검사진행 상태';
    END IF;
END $$ LANGUAGE 'plpgsql';
        
ALTER TYPE en_v3_scan_status ADD VALUE IF NOT EXISTS 'true';
ALTER TYPE en_v3_scan_status ADD VALUE IF NOT EXISTS 'false';
    
------------------------------------------------------------------------------------------
select '## en_language';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_language' ) 
    THEN
        CREATE TYPE en_language AS ENUM ();
        COMMENT ON TYPE en_language IS '언어 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';
  
ALTER TYPE en_language ADD VALUE IF NOT EXISTS 'ko';
ALTER TYPE en_language ADD VALUE IF NOT EXISTS 'en';
ALTER TYPE en_language ADD VALUE IF NOT EXISTS 'zh-Hans';
ALTER TYPE en_language ADD VALUE IF NOT EXISTS 'ja';
ALTER TYPE en_language ADD VALUE IF NOT EXISTS 'others';
 

------------------------------------------------------------------------------------------
select '## en_license_sub_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_license_sub_type' ) 
    THEN
        CREATE TYPE en_license_sub_type AS ENUM ();
        COMMENT ON TYPE en_license_sub_type IS '라이선스 상세 플랫폼 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_license_sub_type ADD VALUE IF NOT EXISTS 'LINUX';
ALTER TYPE en_license_sub_type ADD VALUE IF NOT EXISTS 'UNIX';


------------------------------------------------------------------------------------------
select '## en_log_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_log_type' ) 
    THEN
        CREATE TYPE en_log_type AS ENUM ();
        COMMENT ON TYPE en_log_type IS '로그 항목 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';
 
ALTER TYPE en_log_type ADD VALUE IF NOT EXISTS 'AGENT_EVENT';
ALTER TYPE en_log_type ADD VALUE IF NOT EXISTS 'SW_EVENT';
ALTER TYPE en_log_type ADD VALUE IF NOT EXISTS 'V3_ALERT';
ALTER TYPE en_log_type ADD VALUE IF NOT EXISTS 'V3_IS';
ALTER TYPE en_log_type ADD VALUE IF NOT EXISTS 'V3_DEVICE';
ALTER TYPE en_log_type ADD VALUE IF NOT EXISTS 'V3_SS';
ALTER TYPE en_log_type ADD VALUE IF NOT EXISTS 'V3_QUAR';
ALTER TYPE en_log_type ADD VALUE IF NOT EXISTS 'HW_EVENT';
ALTER TYPE en_log_type ADD VALUE IF NOT EXISTS 'AC_AGENT_EVENT';
ALTER TYPE en_log_type ADD VALUE IF NOT EXISTS 'AC_EVENT';
ALTER TYPE en_log_type ADD VALUE IF NOT EXISTS 'AC_IM_EVENT';
ALTER TYPE en_log_type ADD VALUE IF NOT EXISTS 'HIPS_AGENT_EVENT';
ALTER TYPE en_log_type ADD VALUE IF NOT EXISTS 'HIPS_EVENT';
ALTER TYPE en_log_type ADD VALUE IF NOT EXISTS 'FW_EVENT';
ALTER TYPE en_log_type ADD VALUE IF NOT EXISTS 'V3_SUP'; --CWPP-1924
ALTER TYPE en_log_type ADD VALUE IF NOT EXISTS 'SCM_AGENT'; --CWPP-2200
ALTER TYPE en_log_type ADD VALUE IF NOT EXISTS 'SCM_SCAN'; --CWPP-2200

------------------------------------------------------------------------------------------
select '## en_logical_operator';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_logical_operator' ) 
    THEN
        CREATE TYPE en_logical_operator AS ENUM ();
        COMMENT ON TYPE en_logical_operator IS '논리 연산자 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';
    
ALTER TYPE en_logical_operator ADD VALUE IF NOT EXISTS 'AND';
ALTER TYPE en_logical_operator ADD VALUE IF NOT EXISTS 'OR';
ALTER TYPE en_logical_operator ADD VALUE IF NOT EXISTS 'NONE';

------------------------------------------------------------------------------------------
select '## en_machine_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_machine_type' ) 
    THEN
        CREATE TYPE en_machine_type AS ENUM ();
        COMMENT ON TYPE en_machine_type IS '머신 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_machine_type ADD VALUE IF NOT EXISTS 'REAL';
ALTER TYPE en_machine_type ADD VALUE IF NOT EXISTS 'VM';
ALTER TYPE en_machine_type ADD VALUE IF NOT EXISTS 'LINUX';
ALTER TYPE en_machine_type ADD VALUE IF NOT EXISTS 'GHOST';
ALTER TYPE en_machine_type ADD VALUE IF NOT EXISTS 'CLOUD_AWS';
ALTER TYPE en_machine_type ADD VALUE IF NOT EXISTS 'CLOUD_AZURE';
ALTER TYPE en_machine_type ADD VALUE IF NOT EXISTS 'CLOUD_NHN';
ALTER TYPE en_machine_type ADD VALUE IF NOT EXISTS 'CLOUD_ALIBABA';
ALTER TYPE en_machine_type ADD VALUE IF NOT EXISTS 'CONTAINER';

------------------------------------------------------------------------------------------
select '## en_node_hash_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_node_hash_type' ) 
    THEN
        CREATE TYPE en_node_hash_type AS ENUM ();
        COMMENT ON TYPE en_node_hash_type IS '노드 해시 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_node_hash_type ADD VALUE IF NOT EXISTS 'SHARE_FOLDER';
ALTER TYPE en_node_hash_type ADD VALUE IF NOT EXISTS 'HARDWARE';
ALTER TYPE en_node_hash_type ADD VALUE IF NOT EXISTS 'SOFTWARE';
ALTER TYPE en_node_hash_type ADD VALUE IF NOT EXISTS 'ADD_RTCOMMAND';
ALTER TYPE en_node_hash_type ADD VALUE IF NOT EXISTS 'PRODUCT_STATUS';
ALTER TYPE en_node_hash_type ADD VALUE IF NOT EXISTS 'NODE_STATUS';
ALTER TYPE en_node_hash_type ADD VALUE IF NOT EXISTS 'POLICY_STATUS';
ALTER TYPE en_node_hash_type ADD VALUE IF NOT EXISTS 'V3_STATUS';
ALTER TYPE en_node_hash_type ADD VALUE IF NOT EXISTS 'NODE_INFO';
ALTER TYPE en_node_hash_type ADD VALUE IF NOT EXISTS 'AC_STATUS';
ALTER TYPE en_node_hash_type ADD VALUE IF NOT EXISTS 'HIPS_STATUS';
ALTER TYPE en_node_hash_type ADD VALUE IF NOT EXISTS 'HIPS_SCAN_STATUS';
ALTER TYPE en_node_hash_type ADD VALUE IF NOT EXISTS 'FW_STATUS';
ALTER TYPE en_node_hash_type ADD VALUE IF NOT EXISTS 'SCM_STATUS';
ALTER TYPE en_node_hash_type ADD VALUE IF NOT EXISTS 'AMC_STATUS';

------------------------------------------------------------------------------------------
select '## en_notification_status_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_notification_status_type' ) 
    THEN
        CREATE TYPE en_notification_status_type AS ENUM ();
        COMMENT ON TYPE en_notification_status_type IS '알림 상태 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

    ALTER TYPE en_notification_status_type ADD VALUE IF NOT EXISTS 'ONGOING';
    ALTER TYPE en_notification_status_type ADD VALUE IF NOT EXISTS 'COMPLETE';

------------------------------------------------------------------------------------------
select '## en_notification_sub_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_notification_sub_type' ) 
    THEN
        CREATE TYPE en_notification_sub_type AS ENUM ();
        COMMENT ON TYPE en_notification_sub_type IS '알림 상세 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'APPLY_POLICY';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'APPLY_MERGEABLE_POLICY';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'CHECK_INTEGRITY';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'COLLECT_HARDWARE';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'COLLECT_SOFTWARE';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'INIT_USER_INFO';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'MODIFY_USER_INFO';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'REMOVE_AGENT';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'REMOVE_PRODUCT';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'RESTART_AGENT';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'SEND_NOTICE';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'SET_SERVER';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'V3_EXEC_OPTIMIZATION';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'V3_EXEC_SCAN';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'V3_STOP_SCAN';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'V3_PRODUCT_UPDATE';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'V3_COLLECT_FEL';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'NOTIFICATION_CENTER';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'SEND_MAIL';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'GENERATE_REPORT';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'COLLECT_AHNREPORT_FILE';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'INSTALL_PRODUCT';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'APPLY_PRODUCT_POLICY';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'UPLOAD_PRODUCT_INFO';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'UPLOAD_AGENT_INFO';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'UPLOAD_EVENT_LOG';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'DEPLOY_FILE';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'PATCH_AGENT';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'ENGINE_UPDATE';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'PATCH_SERVER';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'CHECK_SERVER_INTEGRITY';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'GENERATE_SERVER_REPORT';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'UPDATE_PRODUCT';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'V3_REMOVE_PRODUCT';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'DELETE_AGENT';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'HIPS_SIGNATURE_UPDATE';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'HIPS_RECOMMENDATON';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'AC_CHANGING_ACTION_MODE';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'AC_INITIALIZING_WHITELIST';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'IPS_SIGNATURE_RECOMMENDATION';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'IPS_EMERGENCY_OFF';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'IPS_EMERGENCY_OFF_UNLOCK';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'REMOTE_CTRL';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'AC_UPDATE_PRODUCT';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'HIPS_UPDATE_PRODUCT';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'AC_REMOVE_PRODUCT';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'HIPS_REMOVE_PRODUCT';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'AC_CHANGING_INVENTORY_POLICY';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'QUARANTINE_LOOKUP';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'QUARANTINE_RESTORE';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'REMOVE_EMERGENCY_OFF';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'IM_RULECHECK';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'IM_REQLOG';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'SCM_UPDATE_PRODUCT';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'SCM_CHECK';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'SCM_CHECK_CANCEL';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'SCM_REMOVE_PRODUCT';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'RESET_SCAN_CACHE';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'HIPS_PROCESS_ON';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'HIPS_PROCESS_OFF';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'AC_PROCESS_ON';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'AC_PROCESS_OFF';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'IPS_SSL_INSPECTION_ON';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'IPS_SSL_INSPECTION_OFF';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'AMC_UPDATE_PRODUCT';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'ANTIMALWARE_START_PRODUCT';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'ANTIMALWARE_STOP_PRODUCT';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'AM_FILE_IO_ANALYZE_SYNC';
ALTER TYPE en_notification_sub_type ADD VALUE IF NOT EXISTS 'AM_FILE_IO_ANALYZE_RESET';

------------------------------------------------------------------------------------------
select '## en_notification_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_notification_type' ) 
    THEN
        CREATE TYPE en_notification_type AS ENUM ();
        COMMENT ON TYPE en_notification_type IS '알림 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_notification_type ADD VALUE IF NOT EXISTS 'SYSTEM_RSOURCES_ALARM';
ALTER TYPE en_notification_type ADD VALUE IF NOT EXISTS 'LICENSE_EXPIRE_ALARM';
ALTER TYPE en_notification_type ADD VALUE IF NOT EXISTS 'CERTIFICATE_EXPIRE_ALARM';
ALTER TYPE en_notification_type ADD VALUE IF NOT EXISTS 'UPDATE_ALARM';
ALTER TYPE en_notification_type ADD VALUE IF NOT EXISTS 'REPORT_ALARM';
ALTER TYPE en_notification_type ADD VALUE IF NOT EXISTS 'GROUP_RULE_ALARM';
ALTER TYPE en_notification_type ADD VALUE IF NOT EXISTS 'AGENT_COMMAND_ALARM';
ALTER TYPE en_notification_type ADD VALUE IF NOT EXISTS 'SERVER_COMMAND_ALARM';
ALTER TYPE en_notification_type ADD VALUE IF NOT EXISTS 'FILE_UPLOAD_ALARM';
ALTER TYPE en_notification_type ADD VALUE IF NOT EXISTS 'AGENT_SERVICE_STATUS_ALARM';
ALTER TYPE en_notification_type ADD VALUE IF NOT EXISTS 'HIPS_RECOMMENDATON';
ALTER TYPE en_notification_type ADD VALUE IF NOT EXISTS 'AGENT_STATUS_ALARM';

------------------------------------------------------------------------------------------
select '## en_pg_service_status';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_pg_service_status' ) 
    THEN
        CREATE TYPE en_pg_service_status AS ENUM ();
        COMMENT ON TYPE en_pg_service_status IS '설치유도 서버 모드';
    END IF;
END $$ LANGUAGE 'plpgsql';

    ALTER TYPE en_pg_service_status ADD VALUE IF NOT EXISTS 'STOP';
    ALTER TYPE en_pg_service_status ADD VALUE IF NOT EXISTS 'REDIRECT';
    ALTER TYPE en_pg_service_status ADD VALUE IF NOT EXISTS 'SIMULATION';

------------------------------------------------------------------------------------------
select '## en_pkg_status';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_pkg_status' ) 
    THEN
        CREATE TYPE en_pkg_status AS ENUM ();
        COMMENT ON TYPE en_pkg_status IS '패키지 상태 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';
    
ALTER TYPE en_pkg_status ADD VALUE IF NOT EXISTS 'SUCCESS';
ALTER TYPE en_pkg_status ADD VALUE IF NOT EXISTS 'FAIL';

------------------------------------------------------------------------------------------
select '## en_pkg_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_pkg_type' ) 
    THEN
        CREATE TYPE en_pkg_type AS ENUM ();
        COMMENT ON TYPE en_pkg_type IS '패키지 종류 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_pkg_type ADD VALUE IF NOT EXISTS 'UPDATE_OES';
ALTER TYPE en_pkg_type ADD VALUE IF NOT EXISTS 'UPDATE_SES';
ALTER TYPE en_pkg_type ADD VALUE IF NOT EXISTS 'WIN_AGENT_INSTALL';
ALTER TYPE en_pkg_type ADD VALUE IF NOT EXISTS 'CUSTOM';
ALTER TYPE en_pkg_type ADD VALUE IF NOT EXISTS 'PRODUCT_INSTALL';
ALTER TYPE en_pkg_type ADD VALUE IF NOT EXISTS 'SELECTOU';
ALTER TYPE en_pkg_type ADD VALUE IF NOT EXISTS 'WIN_AGENT_MASTER';
ALTER TYPE en_pkg_type ADD VALUE IF NOT EXISTS 'LUS';
ALTER TYPE en_pkg_type ADD VALUE IF NOT EXISTS 'LINUX_AGENT_MASTER';
ALTER TYPE en_pkg_type ADD VALUE IF NOT EXISTS 'LINUX_AGENT_INSTALL';
ALTER TYPE en_pkg_type ADD VALUE IF NOT EXISTS 'IPS_DEFAULT_SIGNATURE';
ALTER TYPE en_pkg_type ADD VALUE IF NOT EXISTS 'IPS_USER_SIGNATURE';
ALTER TYPE en_pkg_type ADD VALUE IF NOT EXISTS 'IPS_GEO_DB';
ALTER TYPE en_pkg_type ADD VALUE IF NOT EXISTS 'IM_PREDEFINED';
ALTER TYPE en_pkg_type ADD VALUE IF NOT EXISTS 'IM_USERDEFINED';
ALTER TYPE en_pkg_type ADD VALUE IF NOT EXISTS 'IM_ONDEMAND_LOG';
ALTER TYPE en_pkg_type ADD VALUE IF NOT EXISTS 'SCM_PREDEFINED';
ALTER TYPE en_pkg_type ADD VALUE IF NOT EXISTS 'SCM_USERDEFINED';
ALTER TYPE en_pkg_type ADD VALUE IF NOT EXISTS 'IPS_DEFAULT_OVAL';
ALTER TYPE en_pkg_type ADD VALUE IF NOT EXISTS 'CNAPP_VULNERABILITY_DB';

------------------------------------------------------------------------------------------
select '## en_platform_id_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_platform_id_type' ) 
    THEN
        CREATE TYPE en_platform_id_type AS ENUM ();
        COMMENT ON TYPE en_platform_id_type IS 'OS 플랫폼 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'UNKNOWN';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_95_OSR2';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_9X';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_NX';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_ALL';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_98';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_98_SE';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_ME';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_NT';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_NT_WORKSTATION';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_NT_PROFESSIONAL';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_2000';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_2000_PROFESSIONAL';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_XP';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_XP_HOME_EDITION';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_XP_PROFESSIONAL';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_2003';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_NT_SERVER';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_2000_SERVER';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_XP_SERVER';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_2003_SERVER';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_NT_ADVANCED_SERVER';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_2000_ADVANCED_SERVER';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_XP_ADVANCED_SERVER';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_2003_ENTERPRISE_EDITION';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_2003_STANDARD_EDITION';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_2003_STANDARD_EDITION_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_XP_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_XP_HOME_EDITION_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_XP_PROFESSIONAL_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_XP_SERVER_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_XP_ADVANCED_SERVER_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_2003_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_2003_SERVER_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_2003_ENTERPRISE_EDITION_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_VISTA';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_VISTA_ULTIMATE';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_VISTA_HOME_PREMIUM';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_VISTA_HOME_BASIC';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_VISTA_BUSINESS';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_VISTA_ENTERPRISE';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_VISTA_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_VISTA_ULTIMATE_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_VISTA_HOME_PREMIUM_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_VISTA_HOME_BASIC_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_VISTA_BUSINESS_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_VISTA_ENTERPRISE_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_SERVER_2008';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_SERVER_2008_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_SERVER_2008_WITHOUT_HYPER-V';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_SERVER_2008_WITHOUT_HYPER-V_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_WEB_SERVER_2008';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_WEB_SERVER_2008_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_SERVER_2008_(CORE)';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_SERVER_2008_(CORE)_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_SERVER_2008_WITHOUT_HYPER-V_(CORE)';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_SERVER_2008_WITHOUT_HYPER-V_(CORE)_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_WEB_SERVER_2008_(CORE)';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_WEB_SERVER_2008_(CORE)_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_SERVER_2008_SERVER';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_SERVER_2008_R2_WITHOUT_HYPER-V_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_WEB_SERVER_2008_R2_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_SERVER_2008_R2_(CORE)_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_SERVER_2008_R2_WITHOUT_HYPER-V_(CORE)_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_WEB_SERVER_2008_R2_(CORE)_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_7';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_7_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_7_HOME_PREMIUM';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_7_HOME_PREMIUM_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_7_PROFESSIONAL';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_7_PROFESSIONAL_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_7_ULTIMATE';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_7_ULTIMATE_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_7_ENTERPRISE';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_7_ENTERPRISE_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_7_HOME_BASIC';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_7_HOME_BASIC_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_SERVER_2008_R2_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'LINUX/UNIX';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'LINUX';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'UNIX';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_8';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_8_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_8_PROFESSIONAL';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_8_PROFESSIONAL_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_8_ENTERPRISE';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_8_ENTERPRISE_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_8_HOME';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_8_HOME_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_SERVER_2012_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'MAC';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_8.1';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_8.1_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_8.1_PROFESSIONAL';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_8.1_PROFESSIONAL_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_8.1_ENTERPRISE';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_8.1_ENTERPRISE_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_8.1_HOME';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_8.1_HOME_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_SERVER_2012_FOUNDATION_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_SERVER_2012_ESSENTIALS_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_SERVER_2012_STANDARD_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_SERVER_2012_DATACENTER_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_SERVER_2012_R2_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_SERVER_2012_R2_FOUNDATION_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_SERVER_2012_R2_ESSENTIALS_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_SERVER_2012_R2_STANDARD_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_SERVER_2012_R2_DATACENTER_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_10';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_10_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_10_PROFESSIONAL';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_10_PROFESSIONAL_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_10_ENTERPRISE';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_10_ENTERPRISE_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_10_HOME';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_10_HOME_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_10_EDUCATION';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_10_EDUCATION_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_10_MOBILE';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_10_MOBILE_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_10_MOBILE_ENTERPRISE';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_10_MOBILE_ENTERPRISE_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_SERVER_2016_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_SERVER_2019_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'CENTOS_5';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'CENTOS_6';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'CENTOS_7';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'CENTOS_STREAM_8';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'CENTOS_STREAM_9';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'AMAZONLINUX_1';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'AMAZONLINUX_2';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'AMAZONLINUX_2023';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'UBUNTU_8';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'UBUNTU_9';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'UBUNTU_10';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'UBUNTU_11';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'UBUNTU_12';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'UBUNTU_13';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'UBUNTU_14';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'UBUNTU_15';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'UBUNTU_16';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'UBUNTU_17';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'UBUNTU_18';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'UBUNTU_19';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'UBUNTU_24';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'REDHAT_9';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'RHEL_4';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'RHEL_5';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'RHEL_6';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'RHEL_7';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'ORACLELINUX_5';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'ORACLELINUX_6';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'ORACLELINUX_7';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'ASIALINUX_1';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'ASIALINUX_2';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'ASIALINUX_3';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'ASIALINUX_4';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'FEDORA_1';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'FEDORA_2';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'FEDORA_3';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'FEDORA_4';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'FEDORA_5';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'FEDORA_6';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'FEDORA_7';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'FEDORA_8';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'FEDORA_9';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'FEDORA_10';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'FEDORA_11';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'FEDORA_12';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'FEDORA_13';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'FEDORA_14';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'FEDORA_15';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'FEDORA_16';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'FEDORA_17';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'FEDORA_18';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'FEDORA_19';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'FEDORA_20';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_SERVER_SAC';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'CENTOS_8';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'RHEL_8';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'RHEL_9';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'UBUNTU_20';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'UNKNOWN_EXTERNAL';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'ORACLELINUX_8';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'ORACLELINUX_9';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_SERVER_2022_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'UBUNTU_22';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'DEBIAN_9';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'DEBIAN_10';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'DEBIAN_11';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'DEBIAN_12';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'SUSE_12';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'SUSE_15';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'ROCKY_8';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'ROCKY_9';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'ALMALINUX_8';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'ALMALINUX_9';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'ALIBABACLOUD_2';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'ALIBABACLOUD_3';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'WINDOWS_SERVER_2025_X64';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'UNKNOWN_LINUX';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'RHEL_10';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'ROCKY_10';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'ORACLELINUX_10';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'CENTOS_STREAM_10';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'ALMALINUX_10';
ALTER TYPE en_platform_id_type ADD VALUE IF NOT EXISTS 'UBUNTU_26';

------------------------------------------------------------------------------------------
select '## en_platform_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_platform_type' ) 
    THEN
        CREATE TYPE en_platform_type AS ENUM ();
        COMMENT ON TYPE en_platform_type IS 'OS 플랫폼 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_platform_type ADD VALUE IF NOT EXISTS 'WINDOWS';
ALTER TYPE en_platform_type ADD VALUE IF NOT EXISTS 'MAC';
ALTER TYPE en_platform_type ADD VALUE IF NOT EXISTS 'LINUX_UNIX';
ALTER TYPE en_platform_type ADD VALUE IF NOT EXISTS 'UNKNOWN';
ALTER TYPE en_platform_type ADD VALUE IF NOT EXISTS 'UNKNOWN_EXTERNAL';


------------------------------------------------------------------------------------------
select '## en_policy_format';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_policy_format' ) 
    THEN
        CREATE TYPE en_policy_format AS ENUM ();
        COMMENT ON TYPE en_policy_format IS '정책 포맷 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_policy_format ADD VALUE IF NOT EXISTS 'JSON';
ALTER TYPE en_policy_format ADD VALUE IF NOT EXISTS 'XML';

------------------------------------------------------------------------------------------
select '## en_policy_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_policy_type' ) 
    THEN
        CREATE TYPE en_policy_type AS ENUM ();
        COMMENT ON TYPE en_policy_type IS '정책 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_policy_type ADD VALUE IF NOT EXISTS 'DEFAULT';
ALTER TYPE en_policy_type ADD VALUE IF NOT EXISTS 'FACTORY';
ALTER TYPE en_policy_type ADD VALUE IF NOT EXISTS 'GENERAL';

------------------------------------------------------------------------------------------
select '## en_predefined_policy_data_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_predefined_policy_data_type' ) 
    THEN
        CREATE TYPE en_predefined_policy_data_type AS ENUM ();
        COMMENT ON TYPE en_predefined_policy_data_type IS '정책내 사용 데이터 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_predefined_policy_data_type ADD VALUE IF NOT EXISTS 'V3NET90_EXCEPTION_PORT';
ALTER TYPE en_predefined_policy_data_type ADD VALUE IF NOT EXISTS 'V3IS90_NET_BLOCK';

------------------------------------------------------------------------------------------
select '## en_privilege_profile_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_privilege_profile_type' ) 
    THEN
        CREATE TYPE en_privilege_profile_type AS ENUM ();
        COMMENT ON TYPE en_privilege_profile_type IS '권한 프로필 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_privilege_profile_type ADD VALUE IF NOT EXISTS 'ROOT_ADMIN';
ALTER TYPE en_privilege_profile_type ADD VALUE IF NOT EXISTS 'POLICY_ADMIN';
ALTER TYPE en_privilege_profile_type ADD VALUE IF NOT EXISTS 'MONITOR_ADMIN';
ALTER TYPE en_privilege_profile_type ADD VALUE IF NOT EXISTS 'DEPT_ADMIN';
ALTER TYPE en_privilege_profile_type ADD VALUE IF NOT EXISTS 'SECMGR_ADMIN';
ALTER TYPE en_privilege_profile_type ADD VALUE IF NOT EXISTS 'CUSTOM_ADMIN';
ALTER TYPE en_privilege_profile_type ADD VALUE IF NOT EXISTS 'PRODUCT_ADMIN';
ALTER TYPE en_privilege_profile_type ADD VALUE IF NOT EXISTS 'TEMP_ADMIN';

------------------------------------------------------------------------------------------
select '## en_product_feature_id_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_product_feature_id_type' ) 
    THEN
        CREATE TYPE en_product_feature_id_type AS ENUM ();
        COMMENT ON TYPE en_product_feature_id_type IS '제품 정책 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_product_feature_id_type ADD VALUE IF NOT EXISTS 'AGENT_MGMT';
ALTER TYPE en_product_feature_id_type ADD VALUE IF NOT EXISTS 'V3NET_9.0_AV';
ALTER TYPE en_product_feature_id_type ADD VALUE IF NOT EXISTS 'V3NET_LU_AV';
ALTER TYPE en_product_feature_id_type ADD VALUE IF NOT EXISTS 'V3NET_LU_UPDATE';
ALTER TYPE en_product_feature_id_type ADD VALUE IF NOT EXISTS 'AC_AGENT';
ALTER TYPE en_product_feature_id_type ADD VALUE IF NOT EXISTS 'AC_MGMT';
ALTER TYPE en_product_feature_id_type ADD VALUE IF NOT EXISTS 'HIPS_AGENT';
ALTER TYPE en_product_feature_id_type ADD VALUE IF NOT EXISTS 'HIPS_MGMT';
ALTER TYPE en_product_feature_id_type ADD VALUE IF NOT EXISTS 'HIPS_FW';
ALTER TYPE en_product_feature_id_type ADD VALUE IF NOT EXISTS 'IM_MGMT';
ALTER TYPE en_product_feature_id_type ADD VALUE IF NOT EXISTS 'SCM_AGENT';
ALTER TYPE en_product_feature_id_type ADD VALUE IF NOT EXISTS 'SCM_MGMT';
ALTER TYPE en_product_feature_id_type ADD VALUE IF NOT EXISTS 'AMC_MGMT';

------------------------------------------------------------------------------------------
select '## en_product_group_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_product_group_type' ) 
    THEN
        CREATE TYPE en_product_group_type AS ENUM ();
        COMMENT ON TYPE en_product_group_type IS '제품 그룹 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_product_group_type ADD VALUE IF NOT EXISTS 'EMS';
ALTER TYPE en_product_group_type ADD VALUE IF NOT EXISTS 'V3';
ALTER TYPE en_product_group_type ADD VALUE IF NOT EXISTS 'AGENT';
ALTER TYPE en_product_group_type ADD VALUE IF NOT EXISTS 'AC'; 
ALTER TYPE en_product_group_type ADD VALUE IF NOT EXISTS 'HIPS';
ALTER TYPE en_product_group_type ADD VALUE IF NOT EXISTS 'SCM';
ALTER TYPE en_product_group_type ADD VALUE IF NOT EXISTS 'CNAPP';

------------------------------------------------------------------------------------------
select '## en_product_id_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_product_id_type' ) 
    THEN
        CREATE TYPE en_product_id_type AS ENUM ();
        COMMENT ON TYPE en_product_id_type IS '제품 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_product_id_type ADD VALUE IF NOT EXISTS 'AGENT';
ALTER TYPE en_product_id_type ADD VALUE IF NOT EXISTS 'V3NET_9.0';
ALTER TYPE en_product_id_type ADD VALUE IF NOT EXISTS 'EMS';
ALTER TYPE en_product_id_type ADD VALUE IF NOT EXISTS 'V3NET_LU';
ALTER TYPE en_product_id_type ADD VALUE IF NOT EXISTS 'AC_CLIENT';
ALTER TYPE en_product_id_type ADD VALUE IF NOT EXISTS 'HIPS_CLIENT';
ALTER TYPE en_product_id_type ADD VALUE IF NOT EXISTS 'SCM_CLIENT';
ALTER TYPE en_product_id_type ADD VALUE IF NOT EXISTS 'CNAPP';
ALTER TYPE en_product_id_type ADD VALUE IF NOT EXISTS 'AMC_CLIENT';

------------------------------------------------------------------------------------------
select '## en_protocol_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_protocol_type' ) 
    THEN
        CREATE TYPE en_protocol_type AS ENUM ();
        COMMENT ON TYPE en_protocol_type IS '프로토콜 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_protocol_type ADD VALUE IF NOT EXISTS 'TCP';
ALTER TYPE en_protocol_type ADD VALUE IF NOT EXISTS 'TCP_OVER_SSL';
ALTER TYPE en_protocol_type ADD VALUE IF NOT EXISTS 'UDP';

------------------------------------------------------------------------------------------
select '## en_report_graph_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_report_graph_type' ) 
    THEN
        CREATE TYPE en_report_graph_type AS ENUM ();
        COMMENT ON TYPE en_report_graph_type IS '보고서 그래프 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_report_graph_type ADD VALUE IF NOT EXISTS 'PIE';
ALTER TYPE en_report_graph_type ADD VALUE IF NOT EXISTS 'BAR';
ALTER TYPE en_report_graph_type ADD VALUE IF NOT EXISTS 'LINE';
ALTER TYPE en_report_graph_type ADD VALUE IF NOT EXISTS 'NONE';

------------------------------------------------------------------------------------------
select '## en_report_item_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_report_item_type' ) 
    THEN
        CREATE TYPE en_report_item_type AS ENUM ();
        COMMENT ON TYPE en_report_item_type IS '사용자정의 보고서 항목 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_report_item_type ADD VALUE IF NOT EXISTS 'QUERY';
ALTER TYPE en_report_item_type ADD VALUE IF NOT EXISTS 'GRAPH';

------------------------------------------------------------------------------------------
select '## en_report_status_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_report_status_type' ) 
    THEN
        CREATE TYPE en_report_status_type AS ENUM ();
        COMMENT ON TYPE en_report_status_type IS '서버리포트 수집 상태 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_report_status_type ADD VALUE IF NOT EXISTS 'COLLECTING';
ALTER TYPE en_report_status_type ADD VALUE IF NOT EXISTS 'DONE';

------------------------------------------------------------------------------------------
select '## en_report_template_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_report_template_type' ) 
    THEN
        CREATE TYPE en_report_template_type AS ENUM ();
        COMMENT ON TYPE en_report_template_type IS '보고서 템플릿 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_report_template_type ADD VALUE IF NOT EXISTS 'QUERY';

------------------------------------------------------------------------------------------
select '## en_report_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_report_type' ) 
    THEN
        CREATE TYPE en_report_type AS ENUM ();
        COMMENT ON TYPE en_report_type IS '보고서 종류 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_report_type ADD VALUE IF NOT EXISTS 'BASE';
ALTER TYPE en_report_type ADD VALUE IF NOT EXISTS 'QUERY';
ALTER TYPE en_report_type ADD VALUE IF NOT EXISTS 'CORRELATION';

------------------------------------------------------------------------------------------
select '## en_role_status_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_role_status_type' ) 
    THEN
        CREATE TYPE en_role_status_type AS ENUM ();
        COMMENT ON TYPE en_role_status_type IS '롤 부여 동작 상태 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_role_status_type ADD VALUE IF NOT EXISTS 'APPLYING';
ALTER TYPE en_role_status_type ADD VALUE IF NOT EXISTS 'DONE';

------------------------------------------------------------------------------------------
select '## en_schedule_code';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_schedule_code' ) 
    THEN
        CREATE TYPE en_schedule_code AS ENUM ();
        COMMENT ON TYPE en_schedule_code IS '스케줄 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'EPP_UPDATE';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'SERVER_INTEGRITY_SCAN';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'REPORT_CLEAN';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'DB_CLEAN';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'AHNREPORT_CLEAN';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'EPP_AUTO_GROUP';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'FILE_SYNC';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'AGENT_STATUS_SCAN';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'AGENT_STATUS_ALARM';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'EPP_CERT';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'VIRTUAL_SYSTEM';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'DB_BACKUP';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'V3_PKG_UPDATE';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'USER_BROKER';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'GROUP_CLEAN';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'RUM_TIME_COMMON_POLICY';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'SEND_INSIGHT_PORTAL';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'HIPS_RECOMMENDATION';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'SYNC_CLOUD_AZURE_ALL_ACCOUNT_VM_LIST';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'SYNC_CLOUD_AWS_ALL_ACCOUNT_INSTANCE_LIST';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'SYNC_CLOUD_ALIBABA_ALL_ACCOUNT_INSTANCE_LIST';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'AC_REMOVE_IGNORE_INVENTORY_POLICY_LIST';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'UPDATE_HIPS_SIGNATURE';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'UPDATE_COUNTRY';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'HIPS_SIGNATURE_RECOMMENDATION_SCAN';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'HIPS_SIGNATURE_RECOMMENDATION_MERGE';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'HIPS_AC_DB_LOG_CLEAN';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'HIPS_SIGNATURE_RECOMMENDATION_CVE_MAPPING';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'HIPS_SIGNATURE_RECOMMENDATION_REMOVE_UNUSED_RESOURCE';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'GROUP_RISK_CLEAN';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'UPDATE_IM';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'UPDATE_SCM';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'TASK_CLEAN';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'HIPS_FW_BLOCK_IP_RULE';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'CNAPP';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'LOCK_ADMIN';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'HEALTHCHECK_WATCHDOG';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'COLRESC';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'EPPSTAT';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'NMON';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'LOGROTATE';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'LICENSE_UPDATE';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'NEXT_LICENSE_UPDATE';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'TIP_HIPS_BLOCK_IP';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'NHN_SYNC_SERVER_MAIN';
ALTER TYPE en_schedule_code ADD VALUE IF NOT EXISTS 'NHN_SYNC_SERVER_SUB';

------------------------------------------------------------------------------------------
select '## en_schedule_job_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_schedule_job_type' ) 
    THEN
        CREATE TYPE en_schedule_job_type AS ENUM ();
        COMMENT ON TYPE en_schedule_job_type IS '스캐줄 JOB 유형';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_schedule_job_type ADD VALUE IF NOT EXISTS 'COMMAND';
ALTER TYPE en_schedule_job_type ADD VALUE IF NOT EXISTS 'CORRELATION';
ALTER TYPE en_schedule_job_type ADD VALUE IF NOT EXISTS 'REPORT';
ALTER TYPE en_schedule_job_type ADD VALUE IF NOT EXISTS 'DB_BACKUP';
ALTER TYPE en_schedule_job_type ADD VALUE IF NOT EXISTS 'CERTIFICATION';
ALTER TYPE en_schedule_job_type ADD VALUE IF NOT EXISTS 'EXTERNAL_USER';
ALTER TYPE en_schedule_job_type ADD VALUE IF NOT EXISTS 'UNITY_JOB';

------------------------------------------------------------------------------------------
select '## en_schedule_period_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_schedule_period_type' ) 
    THEN
        CREATE TYPE en_schedule_period_type AS ENUM ();
        COMMENT ON TYPE en_schedule_period_type IS '스캐줄 주기 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_schedule_period_type ADD VALUE IF NOT EXISTS 'DAILY';
ALTER TYPE en_schedule_period_type ADD VALUE IF NOT EXISTS 'MONTHLY';
ALTER TYPE en_schedule_period_type ADD VALUE IF NOT EXISTS 'CUSTOM_DAILY';
ALTER TYPE en_schedule_period_type ADD VALUE IF NOT EXISTS 'LAST_24HR';
ALTER TYPE en_schedule_period_type ADD VALUE IF NOT EXISTS 'WEEKLY';
ALTER TYPE en_schedule_period_type ADD VALUE IF NOT EXISTS 'LATEST';
ALTER TYPE en_schedule_period_type ADD VALUE IF NOT EXISTS 'TODAY';
ALTER TYPE en_schedule_period_type ADD VALUE IF NOT EXISTS 'LAST_7_DAYS';
ALTER TYPE en_schedule_period_type ADD VALUE IF NOT EXISTS 'LAST_30_DAYS';
ALTER TYPE en_schedule_period_type ADD VALUE IF NOT EXISTS 'YEARLY';
ALTER TYPE en_schedule_period_type ADD VALUE IF NOT EXISTS 'CUSTOM_WEEKLY';
ALTER TYPE en_schedule_period_type ADD VALUE IF NOT EXISTS 'CUSTOM_MONTHLY';
ALTER TYPE en_schedule_period_type ADD VALUE IF NOT EXISTS 'CUSTOM_YEARLY';
ALTER TYPE en_schedule_period_type ADD VALUE IF NOT EXISTS 'LAST_WEEKLY';

------------------------------------------------------------------------------------------
select '## en_schedule_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_schedule_type' ) 
    THEN
        CREATE TYPE en_schedule_type AS ENUM ();
        COMMENT ON TYPE en_schedule_type IS '보고서 스케쥴 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_schedule_type ADD VALUE IF NOT EXISTS 'DAILY';
ALTER TYPE en_schedule_type ADD VALUE IF NOT EXISTS 'WEEKLY';
ALTER TYPE en_schedule_type ADD VALUE IF NOT EXISTS 'MONTHLY';
ALTER TYPE en_schedule_type ADD VALUE IF NOT EXISTS 'ONCE';
ALTER TYPE en_schedule_type ADD VALUE IF NOT EXISTS 'YEARLY';
ALTER TYPE en_schedule_type ADD VALUE IF NOT EXISTS 'NOW';
ALTER TYPE en_schedule_type ADD VALUE IF NOT EXISTS 'CUSTOM_WEEKLY';
ALTER TYPE en_schedule_type ADD VALUE IF NOT EXISTS 'LAST_WEEKLY';

------------------------------------------------------------------------------------------
select '## en_server_status';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_server_status' ) 
    THEN
        CREATE TYPE en_server_status AS ENUM ();
        COMMENT ON TYPE en_server_status IS '서버 상태 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_server_status ADD VALUE IF NOT EXISTS 'NORMAL';
ALTER TYPE en_server_status ADD VALUE IF NOT EXISTS 'ROLE_PENDING';

------------------------------------------------------------------------------------------
select '## en_server_status_check';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_server_status_check' ) 
    THEN
        CREATE TYPE en_server_status_check AS ENUM ();
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_server_status_check ADD VALUE IF NOT EXISTS 'update_status_check';
ALTER TYPE en_server_status_check ADD VALUE IF NOT EXISTS 'role_status_check';
ALTER TYPE en_server_status_check ADD VALUE IF NOT EXISTS 'port_status_check';

------------------------------------------------------------------------------------------
select '## en_server_update_status';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_server_update_status' ) 
    THEN
        CREATE TYPE en_server_update_status AS ENUM ();
        COMMENT ON TYPE en_server_update_status IS '서버 업데이트 상태 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_server_update_status ADD VALUE IF NOT EXISTS 'APPLYING';
ALTER TYPE en_server_update_status ADD VALUE IF NOT EXISTS 'DONE';

------------------------------------------------------------------------------------------
select '## en_service_count_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_service_count_type' ) 
    THEN
        CREATE TYPE en_service_count_type AS ENUM ();
        COMMENT ON TYPE en_service_count_type IS '서비스 개수 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_service_count_type ADD VALUE IF NOT EXISTS 'ONE';
ALTER TYPE en_service_count_type ADD VALUE IF NOT EXISTS 'ONE_OR_MORE';
ALTER TYPE en_service_count_type ADD VALUE IF NOT EXISTS 'ALL';
ALTER TYPE en_service_count_type ADD VALUE IF NOT EXISTS 'ZERO_OR_MORE';
ALTER TYPE en_service_count_type ADD VALUE IF NOT EXISTS 'ZERO_OR_ONE';

------------------------------------------------------------------------------------------
select '## en_service_status';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_service_status' ) 
    THEN
        CREATE TYPE en_service_status AS ENUM ();
        COMMENT ON TYPE en_service_status IS '서비스 상태 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_service_status ADD VALUE IF NOT EXISTS 'NORMAL';
ALTER TYPE en_service_status ADD VALUE IF NOT EXISTS 'ABNORMAL';

------------------------------------------------------------------------------------------
select '## en_service_target';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_service_target' ) 
    THEN
        CREATE TYPE en_service_target AS ENUM ();
        COMMENT ON TYPE en_service_target IS '서비스 대상 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_service_target ADD VALUE IF NOT EXISTS 'AGENT';
ALTER TYPE en_service_target ADD VALUE IF NOT EXISTS 'SERVER';
ALTER TYPE en_service_target ADD VALUE IF NOT EXISTS 'CONSOLE';

------------------------------------------------------------------------------------------
select '## en_service_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_service_type' ) 
    THEN
        CREATE TYPE en_service_type AS ENUM ();
        COMMENT ON TYPE en_service_type IS '서비스 종류 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'TOMCAT-CONSOLE';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'TOMCAT-AUTH';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'TOMCAT-AGENT';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'LBCONSOLE';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'LBAUTH';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'LBAGENT';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'CACHED';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'SCHEDULER';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'KAFKA';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'KAFKA-CONSUMER';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'SYSLOG-SENDER';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'BATCH-PROCESSOR';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'XSERVER';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'CLUSTER-MANAGER';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'FILESERVER-UPLOAD';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'LBDIST-HTTP';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'LBDIST-HTTPS';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'FILESERVER-HTTP';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'FILESERVER-HTTPS';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'DB-EPPOLTP';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'CONNECTOR-EPPOLTP';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'NOSQL-CONFIGSVR1';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'NOSQL-CONFIGSVR2';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'NOSQL-CONFIGSVR3';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'NOSQL-MONGOS';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'NOSQL-SHARDSVR';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'EPPCMD';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'YUM';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'NTP';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'REPORT-PROCESSOR';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'ZOOKEEPER-SERVICE';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'ZOOKEEPER-SERVER1';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'ZOOKEEPER-SERVER2';
ALTER TYPE en_service_type ADD VALUE IF NOT EXISTS 'EUREKA-SERVER';


------------------------------------------------------------------------------------------
select '## en_signature_accuracy_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_signature_accuracy_type' ) 
    THEN
        CREATE TYPE en_signature_accuracy_type AS ENUM ();
        COMMENT ON TYPE en_signature_accuracy_type IS 'HIPS 시그니처 정확도';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_signature_accuracy_type ADD VALUE IF NOT EXISTS 'rarity';
ALTER TYPE en_signature_accuracy_type ADD VALUE IF NOT EXISTS 'possibility';
ALTER TYPE en_signature_accuracy_type ADD VALUE IF NOT EXISTS 'often';
ALTER TYPE en_signature_accuracy_type ADD VALUE IF NOT EXISTS 'never';

------------------------------------------------------------------------------------------
select '## en_signature_action_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_signature_action_type' ) 
    THEN
        CREATE TYPE en_signature_action_type AS ENUM ();
        COMMENT ON TYPE en_signature_action_type IS 'HIPS 시그니처 대응 방법';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_signature_action_type ADD VALUE IF NOT EXISTS 'detect';
ALTER TYPE en_signature_action_type ADD VALUE IF NOT EXISTS 'block';

------------------------------------------------------------------------------------------
select '## en_signature_block_action_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_signature_block_action_type' ) 
    THEN
        CREATE TYPE en_signature_block_action_type AS ENUM ();
        COMMENT ON TYPE en_signature_block_action_type IS 'HIPS 시그니처 차단 방법';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_signature_block_action_type ADD VALUE IF NOT EXISTS 'packetblock';
ALTER TYPE en_signature_block_action_type ADD VALUE IF NOT EXISTS 'sip';
ALTER TYPE en_signature_block_action_type ADD VALUE IF NOT EXISTS 'sipdip';
ALTER TYPE en_signature_block_action_type ADD VALUE IF NOT EXISTS 'sipdipdportproto';
ALTER TYPE en_signature_block_action_type ADD VALUE IF NOT EXISTS 'sipdportproto';
ALTER TYPE en_signature_block_action_type ADD VALUE IF NOT EXISTS 'dip';

------------------------------------------------------------------------------------------
select '## en_signature_detect_pattern_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_signature_detect_pattern_type' ) 
    THEN
        CREATE TYPE en_signature_detect_pattern_type AS ENUM ();
        COMMENT ON TYPE en_signature_detect_pattern_type IS 'HIPS 시그니처 추천 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_signature_detect_pattern_type ADD VALUE IF NOT EXISTS 'content';
ALTER TYPE en_signature_detect_pattern_type ADD VALUE IF NOT EXISTS 'pcre';
ALTER TYPE en_signature_detect_pattern_type ADD VALUE IF NOT EXISTS 'manual';

------------------------------------------------------------------------------------------
select '## en_node_signature_recommendation_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_node_signature_recommendation_type' ) 
    THEN
        CREATE TYPE en_node_signature_recommendation_type AS ENUM ();
        COMMENT ON TYPE en_node_signature_recommendation_type IS '개별 시그니처 추천 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_node_signature_recommendation_type ADD VALUE IF NOT EXISTS 'NONE';
ALTER TYPE en_node_signature_recommendation_type ADD VALUE IF NOT EXISTS 'MANUAL';
ALTER TYPE en_node_signature_recommendation_type ADD VALUE IF NOT EXISTS 'AUTO';

------------------------------------------------------------------------------------------
select '## en_signature_packet_direction_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_signature_packet_direction_type' ) 
    THEN
        CREATE TYPE en_signature_packet_direction_type AS ENUM ();
        COMMENT ON TYPE en_signature_packet_direction_type IS 'HIPS 시그니처 패킷 방향';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_signature_packet_direction_type ADD VALUE IF NOT EXISTS 'in';
ALTER TYPE en_signature_packet_direction_type ADD VALUE IF NOT EXISTS 'out';
ALTER TYPE en_signature_packet_direction_type ADD VALUE IF NOT EXISTS 'all';

------------------------------------------------------------------------------------------
select '## en_signature_protocol_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_signature_protocol_type' ) 
    THEN
        CREATE TYPE en_signature_protocol_type AS ENUM ();
        COMMENT ON TYPE en_signature_protocol_type IS 'HIPS 시그니처 프로토콜';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_signature_protocol_type ADD VALUE IF NOT EXISTS 'tcp';
ALTER TYPE en_signature_protocol_type ADD VALUE IF NOT EXISTS 'udp';
ALTER TYPE en_signature_protocol_type ADD VALUE IF NOT EXISTS 'icmp';
ALTER TYPE en_signature_protocol_type ADD VALUE IF NOT EXISTS 'ip';

------------------------------------------------------------------------------------------
select '## en_signature_recommendation_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_signature_recommendation_type' ) 
    THEN
        CREATE TYPE en_signature_recommendation_type AS ENUM ();
        COMMENT ON TYPE en_signature_recommendation_type IS '시그니처 추천 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_signature_recommendation_type ADD VALUE IF NOT EXISTS 'APPLY';
ALTER TYPE en_signature_recommendation_type ADD VALUE IF NOT EXISTS 'NOT_APPLY';

------------------------------------------------------------------------------------------
select '## en_signature_severity_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_signature_severity_type' ) 
    THEN
        CREATE TYPE en_signature_severity_type AS ENUM ();
        COMMENT ON TYPE en_signature_severity_type IS 'HIPS 시그니처 위험도';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_signature_severity_type ADD VALUE IF NOT EXISTS 'critical';
ALTER TYPE en_signature_severity_type ADD VALUE IF NOT EXISTS 'high';
ALTER TYPE en_signature_severity_type ADD VALUE IF NOT EXISTS 'medium';
ALTER TYPE en_signature_severity_type ADD VALUE IF NOT EXISTS 'low';
ALTER TYPE en_signature_severity_type ADD VALUE IF NOT EXISTS 'information';

------------------------------------------------------------------------------------------
select '## en_supply_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_supply_type' ) 
    THEN
        CREATE TYPE en_supply_type AS ENUM ();
        COMMENT ON TYPE en_supply_type IS 'Query 수행 결과 리턴 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_supply_type ADD VALUE IF NOT EXISTS 'JSON';
ALTER TYPE en_supply_type ADD VALUE IF NOT EXISTS 'XML';
ALTER TYPE en_supply_type ADD VALUE IF NOT EXISTS 'CSV';

------------------------------------------------------------------------------------------
select '## en_task_encoding';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_task_encoding' ) 
    THEN
        CREATE TYPE en_task_encoding AS ENUM ();
        COMMENT ON TYPE en_task_encoding IS '작업 데이터 인코딩 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_task_encoding ADD VALUE IF NOT EXISTS 'none';
ALTER TYPE en_task_encoding ADD VALUE IF NOT EXISTS 'base64';

------------------------------------------------------------------------------------------
select '## en_task_target_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_task_target_type' ) 
    THEN
        CREATE TYPE en_task_target_type AS ENUM ();
        COMMENT ON TYPE en_task_target_type IS '작업 대상 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';
    
ALTER TYPE en_task_target_type ADD VALUE IF NOT EXISTS 'NODE';
ALTER TYPE en_task_target_type ADD VALUE IF NOT EXISTS 'SERVER';

------------------------------------------------------------------------------------------
select '## en_task_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_task_type' ) 
    THEN
        CREATE TYPE en_task_type AS ENUM ();
        COMMENT ON TYPE en_task_type IS '명령 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'APPLY_POLICY';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'CHECK_INTEGRITY';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'COLLECT_HARDWARE';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'COLLECT_SOFTWARE';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'INIT_USER_INFO';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'MODIFY_USER_INFO';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'REMOVE_AGENT';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'REMOVE_PRODUCT';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'RESTART_AGENT';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'SEND_NOTICE';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'SET_SERVER';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'V3_EXEC_OPTIMIZATION';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'V3_EXEC_SCAN';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'V3_STOP_SCAN';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'V3_PRODUCT_UPDATE';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'V3_COLLECT_FEL';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'NOTIFICATION_CENTER';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'SEND_MAIL';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'GENERATE_REPORT';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'COLLECT_AHNREPORT_FILE';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'INSTALL_PRODUCT';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'UPLOAD_PRODUCT_INFO';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'UPLOAD_AGENT_INFO';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'UPLOAD_EVENT_LOG';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'DEPLOY_FILE';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'PATCH_AGENT';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'ENGINE_UPDATE';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'PATCH_SERVER';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'CHECK_SERVER_INTEGRITY';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'GENERATE_SERVER_REPORT';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'UPLOAD_FILE';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'UPDATE_PRODUCT';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'V3_REMOVE_PRODUCT';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'APPLY_MERGEABLE_POLICY';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'DELETE_AGENT';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'AC_SET_MODE';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'AC_RESET_INVENTORY';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'AC_SET_APP';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'HIPS_RECOMMEND';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'AC_CHANGING_ACTION_MODE';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'AC_INITIALIZING_WHITELIST';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'AC_CHANGING_INVENTORY_POLICY';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'IPS_SIGNATURE_RECOMMENDATION';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'IPS_EMERGENCY_OFF';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'IPS_EMERGENCY_OFF_UNLOCK';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'UPDATE_IPS_SIGNATURE';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'UPDATE_IPS_GEO_DB';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'REMOTE_CTRL';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'AC_UPDATE_PRODUCT';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'HIPS_UPDATE_PRODUCT';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'COLLECT_ARTIFACTS';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'AC_REMOVE_PRODUCT';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'HIPS_REMOVE_PRODUCT';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'QUARANTINE_LOOKUP';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'QUARANTINE_RESTORE';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'REMOVE_EMERGENCY_OFF';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'IM_RULECHECK';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'IM_REQLOG';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'SCM_UPDATE_PRODUCT';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'SCM_CHECK';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'SCM_CHECK_CANCEL';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'SCM_REMOVE_PRODUCT';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'DUPLICATED_TASK';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'DUPLICATED_TASK_LIST';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'RESET_SCAN_CACHE';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'HIPS_PROCESS_ON';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'HIPS_PROCESS_OFF';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'AC_PROCESS_ON';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'AC_PROCESS_OFF';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'IPS_SSL_INSPECTION_ON';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'IPS_SSL_INSPECTION_OFF';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'AMC_UPDATE_PRODUCT';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'ANTIMALWARE_START_PRODUCT';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'ANTIMALWARE_STOP_PRODUCT';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'AM_FILE_IO_ANALYZE_SYNC';
ALTER TYPE en_task_type ADD VALUE IF NOT EXISTS 'AM_FILE_IO_ANALYZE_RESET';

------------------------------------------------------------------------------------------
select '## en_upload_file_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_upload_file_type' ) 
    THEN
        CREATE TYPE en_upload_file_type AS ENUM ();
        COMMENT ON TYPE en_upload_file_type IS '파일 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_upload_file_type ADD VALUE IF NOT EXISTS 'AHN_REPORT';
ALTER TYPE en_upload_file_type ADD VALUE IF NOT EXISTS 'HIPS_CLAIR';
ALTER TYPE en_upload_file_type ADD VALUE IF NOT EXISTS 'HIPS_CONTAINER_CLAIR';
ALTER TYPE en_upload_file_type ADD VALUE IF NOT EXISTS 'IM_ONDEMAND_LOG';
ALTER TYPE en_upload_file_type ADD VALUE IF NOT EXISTS 'SCM_SCAN_RESULT_COMMAND';
ALTER TYPE en_upload_file_type ADD VALUE IF NOT EXISTS 'SCM_SCAN_RESULT_POLICY';
ALTER TYPE en_upload_file_type ADD VALUE IF NOT EXISTS 'CSV';
ALTER TYPE en_upload_file_type ADD VALUE IF NOT EXISTS 'XLS';
ALTER TYPE en_upload_file_type ADD VALUE IF NOT EXISTS 'XLSX';

------------------------------------------------------------------------------------------
select '## en_view_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_view_type' ) 
    THEN
        CREATE TYPE en_view_type AS ENUM ();
        COMMENT ON TYPE en_view_type IS '웹 화면 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_view_type ADD VALUE IF NOT EXISTS 'AGENT';
ALTER TYPE en_view_type ADD VALUE IF NOT EXISTS 'V3';
ALTER TYPE en_view_type ADD VALUE IF NOT EXISTS 'POLICY';
ALTER TYPE en_view_type ADD VALUE IF NOT EXISTS 'ISSUE_AGENT';
ALTER TYPE en_view_type ADD VALUE IF NOT EXISTS 'AC';
ALTER TYPE en_view_type ADD VALUE IF NOT EXISTS 'HIPS';
ALTER TYPE en_view_type ADD VALUE IF NOT EXISTS 'HIPS_LOG';
ALTER TYPE en_view_type ADD VALUE IF NOT EXISTS 'HIPS_AGENT_SIGNATURE';
ALTER TYPE en_view_type ADD VALUE IF NOT EXISTS 'HIPS_SIGNATURE_BASIC';
ALTER TYPE en_view_type ADD VALUE IF NOT EXISTS 'HIPS_SIGNATURE_CUSTOM';
ALTER TYPE en_view_type ADD VALUE IF NOT EXISTS 'HIPS_POLICY_SIGNATURE_BASIC';
ALTER TYPE en_view_type ADD VALUE IF NOT EXISTS 'HIPS_POLICY_SIGNATURE_CUSTOM';
ALTER TYPE en_view_type ADD VALUE IF NOT EXISTS 'HIPS_POLICY_SIGNATURE_BASIC_ADD';
ALTER TYPE en_view_type ADD VALUE IF NOT EXISTS 'HIPS_POLICY_SIGNATURE_CUSTOM_ADD';
ALTER TYPE en_view_type ADD VALUE IF NOT EXISTS 'HIPS_FW_HISTORY';
ALTER TYPE en_view_type ADD VALUE IF NOT EXISTS 'HIPS_FW_SIP_TOP';
ALTER TYPE en_view_type ADD VALUE IF NOT EXISTS 'HIPS_FW_PORT_TOP';
ALTER TYPE en_view_type ADD VALUE IF NOT EXISTS 'HIPS_FW_RULE_TOP';
ALTER TYPE en_view_type ADD VALUE IF NOT EXISTS 'HIPS_SIGNATURE_STATUS_BASIC';
ALTER TYPE en_view_type ADD VALUE IF NOT EXISTS 'HIPS_SIGNATURE_STATUS_CUSTOM';
ALTER TYPE en_view_type ADD VALUE IF NOT EXISTS 'AC_EXEC_LOG';
ALTER TYPE en_view_type ADD VALUE IF NOT EXISTS 'AC_ACCESS_LOG';
ALTER TYPE en_view_type ADD VALUE IF NOT EXISTS 'V3_ALERT_LOG';
ALTER TYPE en_view_type ADD VALUE IF NOT EXISTS 'HIPS_FW_BLOCK_LIST';
ALTER TYPE en_view_type ADD VALUE IF NOT EXISTS 'SCM'; -- 관리 > 에이전트 현황

------------------------------------------------------------------------------------------
select '## en_widget_item_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_widget_item_type' ) 
    THEN
        CREATE TYPE en_widget_item_type AS ENUM ();
        COMMENT ON TYPE en_widget_item_type IS '위젯 항목 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'AGENT_INSTALL';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'AGENT_STATUS';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'POLICY_APPLY';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'AGENT_MALWARE';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'MALWARE_INFECTION';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'V3_INSTALL';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'ENGINE_UPDATE_RATIO';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'MANUAL_SCAN_RATIO';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'SERVER_STATUS';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'V3_ENGINE_STATUS';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'V3_MALWARE_HISTORY';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'V3_POLICY_STATUS';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'CLOUD_STATUS';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'AC_STATUS';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'AC_AGENT_TOP';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'AC_BLOCK_FILE_TOP';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'AC_BLOCK_HISTORY';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'AC_EXEC_LIST';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'HIPS_STATUS';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'HIPS_FW_STATUS';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'HIPS_IPS_STATUS';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'AC_INSTALL';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'HIPS_INSTALL';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'AC_POLICY_STATUS';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'HIPS_POLICY_STATUS';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'HIPS_SIP_TOP';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'HIPS_DETECT_AGENT_TOP';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'HIPS_ATTACK_TOP';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'HIPS_DETECT_HISTORY';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'HIPS_APPLICATION_TOP';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'HIPS_COUNTRY_TOP';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'HIPS_SEVERITY_STATUS';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'HIPS_DETECT_LIST';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'HIPS_FW_SIP_TOP';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'HIPS_FW_AGENT_TOP';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'HIPS_FW_HISTORY';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'HIPS_FW_PORT_TOP';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'HIPS_FW_RULE_TOP';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'AC_IM_DETECT_WATCHLIST_TOP';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'AC_IM_DETECT_RULE_TOP';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'AC_IM_DETECT_AGENT_TOP';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'AC_IM_DETECT_TARGET_TYPE_TOP';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'AC_IM_DETECT_HISTORY';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'SCM_STATUS';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'SCM_INSTALL';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'SCM_POLICY_STATUS';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'SCM_COMPLIANCE_AGENT_TOP';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'SCM_SECRET_AGENT_TOP';
ALTER TYPE en_widget_item_type ADD VALUE IF NOT EXISTS 'SCM_MANUAL_SCAN_RATIO';

------------------------------------------------------------------------------------------
select '## en_connection_status';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_connection_status' ) 
    THEN
        CREATE TYPE en_connection_status AS ENUM ();
        COMMENT ON TYPE en_connection_status IS '연결 상태 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';
ALTER TYPE en_connection_status ADD VALUE IF NOT EXISTS 'CONNECTED';
ALTER TYPE en_connection_status ADD VALUE IF NOT EXISTS 'DISCONNECTED';
ALTER TYPE en_connection_status ADD VALUE IF NOT EXISTS 'UNINSTALLED';

------------------------------------------------------------------------------------------
select '## en_engine_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_engine_type' ) 
    THEN
        CREATE TYPE en_engine_type AS ENUM ();
        COMMENT ON TYPE en_engine_type IS '엔진 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';
ALTER TYPE en_engine_type ADD VALUE IF NOT EXISTS 'SES';
ALTER TYPE en_engine_type ADD VALUE IF NOT EXISTS 'OES';
ALTER TYPE en_engine_type ADD VALUE IF NOT EXISTS 'NES';

------------------------------------------------------------------------------------------
select '## en_hw_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_hw_type' ) 
    THEN
        CREATE TYPE en_hw_type AS ENUM ();
        COMMENT ON TYPE en_hw_type IS '하드웨어 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'CPU';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'CPU_DETAIL';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'CPU_SUPPLIER';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'CPU_CLOCK';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'MEMORY_TOTAL';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'MEMORY_FREE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD1_TOTAL';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD1_FREE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD2_TOTAL';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD2_FREE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD3_TOTAL';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD3_FREE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'GRAPHIC_CARD';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'GRAPHIC_CARD_CHIPSET';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'GRAPHIC_CARD_MEMROY';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'MONITOR_RESOLUTION';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'BIOS';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'BIOS_SUPPLIER';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'VMEMORY_TOTAL';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'VMEMORY_FREE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'BIOS_DATE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'BIOS_VERSION';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NETWORK_HOST';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NETWORK_IE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NETWORK_NIC';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NETWORK_WINSOCK';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'CPU_NAME';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'CPU_VERSION';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'CPU_SPEED';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'MEMORY_PHYSICAL';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'MEMORY_VIRTUAL';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'BIOS_NAME';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'BIOS_VENDOR';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'VGA_RESOLUTION';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'VGA_TYPE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'VGA_CHIPSET';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'VGA_MEM';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD1_FILE_SYSTEM';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD1_SIZE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD2_FILE_SYSTEM';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD2_SIZE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD3_FILE_SYSTEM';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD3_SIZE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HOST';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'IEXPLORER';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'WINSOCK';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC1_MAC';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC1_GW';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC1_IP';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC1_DHCP_USE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC1_DHCP_SERVER';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC1_VIRTUAL';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC2_MAC';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC2_GW';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC2_IP';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC2_DHCP_USE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC2_DHCP_SERVER';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC2_VIRTUAL';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC3_MAC';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC3_GW';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC3_IP';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC3_DHCP_USE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC3_DHCP_SERVER';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC3_VIRTUAL';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'OS_NAME';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'OS_NAME_DETAIL';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'OS_INSTALL_TIME';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'OS_VERSION';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'OS_PLATFORM';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'OS_PRODUCT_ID';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'OS_KERNEL_VERSION';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD4_TOTAL';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD4_FREE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD4_FILE_SYSTEM';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD4_SIZE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD5_TOTAL';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD5_FREE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD5_FILE_SYSTEM';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD5_SIZE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD6_TOTAL';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD6_FREE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD6_FILE_SYSTEM';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD6_SIZE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD7_TOTAL';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD7_FREE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD7_FILE_SYSTEM';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD7_SIZE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD8_TOTAL';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD8_FREE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD8_FILE_SYSTEM';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD8_SIZE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD9_TOTAL';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD9_FREE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD9_FILE_SYSTEM';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD9_SIZE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD10_TOTAL';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD10_FREE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD10_FILE_SYSTEM';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'HDD10_SIZE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC4_MAC';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC4_GW';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC4_IP';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC4_DHCP_USE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC4_DHCP_SERVER';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC4_VIRTUAL';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC5_MAC';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC5_GW';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC5_IP';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC5_DHCP_USE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC5_DHCP_SERVER';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC5_VIRTUAL';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC6_MAC';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC6_GW';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC6_IP';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC6_DHCP_USE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC6_DHCP_SERVER';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC6_VIRTUAL';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC7_MAC';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC7_GW';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC7_IP';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC7_DHCP_USE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC7_DHCP_SERVER';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC7_VIRTUAL';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC8_MAC';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC8_GW';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC8_IP';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC8_DHCP_USE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC8_DHCP_SERVER';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC8_VIRTUAL';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC9_MAC';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC9_GW';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC9_IP';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC9_DHCP_USE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC9_DHCP_SERVER';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC9_VIRTUAL';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC10_MAC';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC10_GW';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC10_IP';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC10_DHCP_USE';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC10_DHCP_SERVER';
ALTER TYPE en_hw_type ADD VALUE IF NOT EXISTS 'NIC10_VIRTUAL';


------------------------------------------------------------------------------------------
select '## en_olap_table_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_olap_table_type' ) 
    THEN
        CREATE TYPE en_olap_table_type AS ENUM ();
        COMMENT ON TYPE en_olap_table_type IS 'OLAP 테이블 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_NODE';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_GROUP';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_USER';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_V3_ALERT_LOG';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_APPEND_TEST';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_NODE_SW';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_SHARE_FOLDER';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_NODE_HW';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_POLICY_STATUS';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRODUCT_STATUS';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_NODE_STATUS';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_NODE_SW_LOG';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_NODE_HW_LOG';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_CONFIG';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_POLICY_STATUS';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_CORRELATION_RESULT';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_SERVER';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_SERVICE';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_V3_STATUS';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_TIMELINE_NOSQL_SUCCESS';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_TIMELINE_NOSQL_START';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_TIMELINE_NOSQL';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_NODE_SW';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_NODE_HW';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_NODE_STATUS';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_V3_STATUS';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_TASK_TARGET_STATUS';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_TASK_TARGET_STATUS';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_SERVICE_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_SERVICE_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_AUDIT_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_AUDIT_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_ENGINE_UPDATE_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_ENGINE_UPDATE_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_BACKUP_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_BACKUP_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_PKG_DIST_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PKG_DIST_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_PKG_SYNC_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PKG_SYNC_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_AGENT_INSTALL_PKG_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_AGENT_INSTALL_PKG_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_AGENT_EVENT_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_AGENT_EVENT_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_TASK_STATUS_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_TASK_STATUS_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_NODE_SW_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_NODE_SW_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_NODE_HW_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_NODE_HW_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_V3_ALERT_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_V3_ALERT_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_V3_SS_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_V3_SS_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_V3_IS_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_V3_IS_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_V3_SUP_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_V3_SUP_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_V3_DEVICE_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_V3_DEVICE_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_HIPS_FW_EVENT_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_HIPS_FW_EVENT_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_HIPS_AGENT_EVENT_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_HIPS_AGENT_EVENT_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_HIPS_DETECT_EVENT_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_HIPS_DETECT_EVENT_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_AC_AGENT_EVENT_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_AC_AGENT_EVENT_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_AC_EXEC_EVENT_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_AC_EXEC_EVENT_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_AC_ACCESS_EVENT_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_AC_ACCESS_EVENT_LOG_OBJ_ID';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_AC_STATUS';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_AC_STATUS';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_HIPS_STATUS';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_HIPS_STATUS';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_HIPS_DETECT_EVENT_LOG_HOURLY';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_HIPS_DETECT_EVENT_LOG_HOURLY';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_HIPS_FW_EVENT_LOG_HOURLY';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_HIPS_FW_EVENT_LOG_HOURLY';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_AC_EXECUTION_CONTROL_TIMELINE';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_AC_EXECUTION_CONTROL_TIMELINE';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_PRE_NODE_DISTRIBUTION_STATUS';
ALTER TYPE en_olap_table_type ADD VALUE IF NOT EXISTS 'TB_NODE_DISTRIBUTION_STATUS';


------------------------------------------------------------------------------------------
select '## en_opcode_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_opcode_type' ) 
    THEN
        CREATE TYPE en_opcode_type AS ENUM ();
        COMMENT ON TYPE en_opcode_type IS '동작 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';
ALTER TYPE en_opcode_type ADD VALUE IF NOT EXISTS 'ADD';
ALTER TYPE en_opcode_type ADD VALUE IF NOT EXISTS 'MODIFY';
ALTER TYPE en_opcode_type ADD VALUE IF NOT EXISTS 'DELETE';


------------------------------------------------------------------------------------------
select '## en_policy_status';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_policy_status' ) 
    THEN
        CREATE TYPE en_policy_status AS ENUM ();
        COMMENT ON TYPE en_policy_status IS '정책 상태 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';
ALTER TYPE en_policy_status ADD VALUE IF NOT EXISTS 'APPLIED';
ALTER TYPE en_policy_status ADD VALUE IF NOT EXISTS 'NOT_APPLIED';
ALTER TYPE en_policy_status ADD VALUE IF NOT EXISTS 'APPLYING';
ALTER TYPE en_policy_status ADD VALUE IF NOT EXISTS 'UNSUPPORTED';

------------------------------------------------------------------------------------------
select '## en_task_status';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_task_status' ) 
    THEN
        CREATE TYPE en_task_status AS ENUM ();
        COMMENT ON TYPE en_task_status IS '작업 상태 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';
ALTER TYPE en_task_status ADD VALUE IF NOT EXISTS 'SUCCESS';
ALTER TYPE en_task_status ADD VALUE IF NOT EXISTS 'FAIL';
ALTER TYPE en_task_status ADD VALUE IF NOT EXISTS 'WAITING';
ALTER TYPE en_task_status ADD VALUE IF NOT EXISTS 'SENT';
ALTER TYPE en_task_status ADD VALUE IF NOT EXISTS 'SENT_FAIL';
ALTER TYPE en_task_status ADD VALUE IF NOT EXISTS 'GET';
ALTER TYPE en_task_status ADD VALUE IF NOT EXISTS 'FINISH';
ALTER TYPE en_task_status ADD VALUE IF NOT EXISTS 'PASS_SUCCESS';
ALTER TYPE en_task_status ADD VALUE IF NOT EXISTS 'PASS_FAIL';
ALTER TYPE en_task_status ADD VALUE IF NOT EXISTS 'APPLY_START';
ALTER TYPE en_task_status ADD VALUE IF NOT EXISTS 'APPLY_SUCCESS';
ALTER TYPE en_task_status ADD VALUE IF NOT EXISTS 'APPLY_FAIL';
ALTER TYPE en_task_status ADD VALUE IF NOT EXISTS 'SERVER_APPLY_START';
ALTER TYPE en_task_status ADD VALUE IF NOT EXISTS 'SERVER_APPLY_FAIL';
ALTER TYPE en_task_status ADD VALUE IF NOT EXISTS 'DUPLICATED_TASK';
ALTER TYPE en_task_status ADD VALUE IF NOT EXISTS 'TASK_SUCCESS';
ALTER TYPE en_task_status ADD VALUE IF NOT EXISTS 'TASK_FAIL';
ALTER TYPE en_task_status ADD VALUE IF NOT EXISTS 'UNSUPPORTED';

------------------------------------------------------------------------------------------
select '## en_timeline_item';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_timeline_item' ) 
    THEN
        CREATE TYPE en_timeline_item AS ENUM ();
        COMMENT ON TYPE en_timeline_item IS '타임라인 항목 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';
ALTER TYPE en_timeline_item ADD VALUE IF NOT EXISTS 'AGENT_INSTALL';
ALTER TYPE en_timeline_item ADD VALUE IF NOT EXISTS 'V3_INSTALL';
ALTER TYPE en_timeline_item ADD VALUE IF NOT EXISTS 'ENGINE_SUCCESS';
ALTER TYPE en_timeline_item ADD VALUE IF NOT EXISTS 'ENGINE_FAILURE';
ALTER TYPE en_timeline_item ADD VALUE IF NOT EXISTS 'MANUAL_SCAN';
ALTER TYPE en_timeline_item ADD VALUE IF NOT EXISTS 'AV_INFECT';
ALTER TYPE en_timeline_item ADD VALUE IF NOT EXISTS 'AV_CLEAN';


------------------------------------------------------------------------------------------
select '## en_timeline_target_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_timeline_target_type' ) 
    THEN
        CREATE TYPE en_timeline_target_type AS ENUM ();
        COMMENT ON TYPE en_timeline_target_type IS '타임라인 대상 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';
ALTER TYPE en_timeline_target_type ADD VALUE IF NOT EXISTS 'NODE';
ALTER TYPE en_timeline_target_type ADD VALUE IF NOT EXISTS 'GROUP';


------------------------------------------------------------------------------------------
select '## en_v3_link_param';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_v3_link_param' ) 
    THEN
        CREATE TYPE en_v3_link_param AS ENUM ();
        COMMENT ON TYPE en_v3_link_param IS 'V3 링크 파라미터 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';
ALTER TYPE en_v3_link_param ADD VALUE IF NOT EXISTS 'INSTALL';
ALTER TYPE en_v3_link_param ADD VALUE IF NOT EXISTS 'NO_INSTALL';
ALTER TYPE en_v3_link_param ADD VALUE IF NOT EXISTS 'UNSUPPORTED';
ALTER TYPE en_v3_link_param ADD VALUE IF NOT EXISTS 'NEW_ENGINE';
ALTER TYPE en_v3_link_param ADD VALUE IF NOT EXISTS 'OLD_ENGINE';
ALTER TYPE en_v3_link_param ADD VALUE IF NOT EXISTS 'ON_REALTIME';
ALTER TYPE en_v3_link_param ADD VALUE IF NOT EXISTS 'OFF_REALTIME';
ALTER TYPE en_v3_link_param ADD VALUE IF NOT EXISTS 'EXPIRED_LICENSE';
ALTER TYPE en_v3_link_param ADD VALUE IF NOT EXISTS 'INTEGRITY';
ALTER TYPE en_v3_link_param ADD VALUE IF NOT EXISTS 'NEW_SIGNATURE';
ALTER TYPE en_v3_link_param ADD VALUE IF NOT EXISTS 'OLD_SIGNATURE';
ALTER TYPE en_v3_link_param ADD VALUE IF NOT EXISTS 'NEW_SCM_RULE';
ALTER TYPE en_v3_link_param ADD VALUE IF NOT EXISTS 'OLD_SCM_RULE';

------------------------------------------------------------------------------------------
select '## en_bit_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_bit_type' ) 
    THEN
        CREATE TYPE en_bit_type AS ENUM ();
        COMMENT ON TYPE en_bit_type IS 'OS 플랫폼 bit 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';
ALTER TYPE en_bit_type ADD VALUE IF NOT EXISTS '32';
ALTER TYPE en_bit_type ADD VALUE IF NOT EXISTS '32/64';
ALTER TYPE en_bit_type ADD VALUE IF NOT EXISTS '64';
ALTER TYPE en_bit_type ADD VALUE IF NOT EXISTS 'UNKNOWN';


------------------------------------------------------------------------------------------
select '## en_agent_status_link_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_agent_status_link_type' ) 
    THEN
        CREATE TYPE en_agent_status_link_type AS ENUM ();
    END IF;
END $$ LANGUAGE 'plpgsql';
ALTER TYPE en_agent_status_link_type ADD VALUE IF NOT EXISTS 'DISTRIBUTE';
ALTER TYPE en_agent_status_link_type ADD VALUE IF NOT EXISTS 'V3';
ALTER TYPE en_agent_status_link_type ADD VALUE IF NOT EXISTS 'DASHBOARD';
ALTER TYPE en_agent_status_link_type ADD VALUE IF NOT EXISTS 'CUSTOM_DASHBOARD';
ALTER TYPE en_agent_status_link_type ADD VALUE IF NOT EXISTS 'SW';
ALTER TYPE en_agent_status_link_type ADD VALUE IF NOT EXISTS 'CORRELATION';
ALTER TYPE en_agent_status_link_type ADD VALUE IF NOT EXISTS 'LICENSE';


------------------------------------------------------------------------------------------
select '## en_ac_operation_status';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_ac_operation_status' ) 
    THEN
        CREATE TYPE en_ac_operation_status AS ENUM ();
        COMMENT ON TYPE en_ac_operation_status IS 'AC 동작 상태';
    END IF;
END $$ LANGUAGE 'plpgsql';
ALTER TYPE en_ac_operation_status ADD VALUE IF NOT EXISTS 'LOCKDOWN';
ALTER TYPE en_ac_operation_status ADD VALUE IF NOT EXISTS 'MAINTENANCE';
ALTER TYPE en_ac_operation_status ADD VALUE IF NOT EXISTS 'SIMULATION';
ALTER TYPE en_ac_operation_status ADD VALUE IF NOT EXISTS 'COLLECTING';
ALTER TYPE en_ac_operation_status ADD VALUE IF NOT EXISTS 'OFF';
ALTER TYPE en_ac_operation_status ADD VALUE IF NOT EXISTS 'MEMOFF';
ALTER TYPE en_ac_operation_status ADD VALUE IF NOT EXISTS 'NONE';


------------------------------------------------------------------------------------------
select '## en_hips_status';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_hips_status' ) 
    THEN
        CREATE TYPE en_hips_status AS ENUM ();
        COMMENT ON TYPE en_hips_status IS 'IPS 상태';
    END IF;
END $$ LANGUAGE 'plpgsql';
ALTER TYPE en_hips_status ADD VALUE IF NOT EXISTS 'ON';
ALTER TYPE en_hips_status ADD VALUE IF NOT EXISTS 'OFF';
ALTER TYPE en_hips_status ADD VALUE IF NOT EXISTS 'EOFF';
ALTER TYPE en_hips_status ADD VALUE IF NOT EXISTS 'CTOFF';
ALTER TYPE en_hips_status ADD VALUE IF NOT EXISTS 'MEMOFF';
ALTER TYPE en_hips_status ADD VALUE IF NOT EXISTS 'USER_MODE_ON';
ALTER TYPE en_hips_status ADD VALUE IF NOT EXISTS 'NONE';
ALTER TYPE en_hips_status ADD VALUE IF NOT EXISTS 'BYPASS';
ALTER TYPE en_hips_status ADD VALUE IF NOT EXISTS 'BYPASS_OVERSUBSCRIPTION';


------------------------------------------------------------------------------------------
select '## en_fw_status';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_fw_status' ) 
    THEN
        CREATE TYPE en_fw_status AS ENUM ();
        COMMENT ON TYPE en_fw_status IS 'FW 상태';
    END IF;
END $$ LANGUAGE 'plpgsql';
ALTER TYPE en_fw_status ADD VALUE IF NOT EXISTS 'ON';
ALTER TYPE en_fw_status ADD VALUE IF NOT EXISTS 'OFF';
ALTER TYPE en_fw_status ADD VALUE IF NOT EXISTS 'EOFF';
ALTER TYPE en_fw_status ADD VALUE IF NOT EXISTS 'CTOFF';
ALTER TYPE en_fw_status ADD VALUE IF NOT EXISTS 'MEMOFF';
ALTER TYPE en_fw_status ADD VALUE IF NOT EXISTS 'USER_MODE_ON';
ALTER TYPE en_fw_status ADD VALUE IF NOT EXISTS 'NONE';
ALTER TYPE en_fw_status ADD VALUE IF NOT EXISTS 'BYPASS';
ALTER TYPE en_fw_status ADD VALUE IF NOT EXISTS 'BYPASS_OVERSUBSCRIPTION';


------------------------------------------------------------------------------------------
select '## en_hips_recommendation_status';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_hips_recommendation_status' ) 
    THEN
        CREATE TYPE en_hips_recommendation_status AS ENUM ();
        COMMENT ON TYPE en_hips_recommendation_status IS 'IPS 추천 분석 상태';
    END IF;
END $$ LANGUAGE 'plpgsql';
ALTER TYPE en_hips_recommendation_status ADD VALUE IF NOT EXISTS 'NONE';
ALTER TYPE en_hips_recommendation_status ADD VALUE IF NOT EXISTS 'RUNNING';
ALTER TYPE en_hips_recommendation_status ADD VALUE IF NOT EXISTS 'COMPLETE';


------------------------------------------------------------------------------------------
select '## en_mail_template_macro_type';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_mail_template_macro_type' ) 
    THEN
        CREATE TYPE en_mail_template_macro_type AS ENUM ();
        COMMENT ON TYPE en_mail_template_macro_type IS '메일 템플릿 매크로 타입';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'LAST_CONNECT_TIME';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'MALWARE_DETECT_COUNT';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'MALWARE_NAME';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'V3_UNINSTALL';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'V3_LAST_ENGINE_UPDATE';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'V3_REAL_TIME_SCAN_OFF';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'NO_LICENSE_USER';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'V3_INSTALL';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'AGENT_VERSION';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'LAST_SCAN_TIME';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'DB_FILE_SIZE';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'LICENSE_EXPIRE';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'CERTIFICATE_EXPIRE';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'CPU_USAGE';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'MEMORY_USAGE';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'DISK_USAGE';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'FILE_SERVER_DISK_USAGE';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'FILE_SERVER_DISK_SIZE';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'TITLE';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'USER_NAME';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'USER_LIST';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'CORRELATION_CONDITION';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'PRODUCT_INSTALL';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'NODE_FAILURE';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'SW_INSTALL';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'SW_UNINSTALL';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'AC_EXEC_BLOCK_COUNT';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'AC_FILE_HASH_DETECT_COUNT';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'AC_FILE_NAME_DETECT_COUNT';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'AC_IM_DETECT_COUNT';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'AC_IM_WATCHLIST_DETECT_COUNT';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'AC_IM_WATCHLIST_RULE_DETECT_COUNT';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'AC_IM_WATCHLIST_RULE_TARGET_DETECT_COUNT';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'HIPS_DETECT_COUNT';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'HIPS_SIGNATURE_NAME';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'HIPS_SEVERITY';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'HIPS_APPLYING_COUNT';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'HIPS_LAST_SIGNATURE_UPDATE_TIME';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'SCM_LAST_SCAN_TIME';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'SCM_COMPLIANCE_SCAN_RESULT_FAILED_DETECT_COUNT';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'SCM_COMPLIANCE_SCAN_RESULT_FAILED_ITEM_DETECT_COUNT';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'SCM_SECRET_SCAN_RESULT_FAILED_DETECT_COUNT';

------------------------------------------------------------------------------------------
select '## en_product_service_status';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_product_service_status' ) 
    THEN
        CREATE TYPE en_product_service_status AS ENUM ();
        COMMENT ON TYPE en_product_service_status IS '서비스 상태 (ON/OFF/FAIL/NOT_CONNECTED)';
    END IF;
END $$ LANGUAGE 'plpgsql';
ALTER TYPE en_product_service_status ADD VALUE IF NOT EXISTS 'ON';
ALTER TYPE en_product_service_status ADD VALUE IF NOT EXISTS 'OFF';
ALTER TYPE en_product_service_status ADD VALUE IF NOT EXISTS 'FAIL';
ALTER TYPE en_product_service_status ADD VALUE IF NOT EXISTS 'NOT_CONNECTED';

------------------------------------------------------------------------------------------
select '## en_scm_scan_status';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_scm_scan_status' ) 
    THEN
        CREATE TYPE en_scm_scan_status AS ENUM ();
        COMMENT ON TYPE en_scm_scan_status IS 'Scanner 호출 현재 상태';
    END IF;
END $$ LANGUAGE 'plpgsql';
ALTER TYPE en_scm_scan_status ADD VALUE IF NOT EXISTS 'NONE';
ALTER TYPE en_scm_scan_status ADD VALUE IF NOT EXISTS 'RUNNING';
ALTER TYPE en_scm_scan_status ADD VALUE IF NOT EXISTS 'COMPLETE';

------------------------------------------------------------------------------------------
select '## en_block_ip_rule_action';
DO $$
BEGIN
    IF NOT EXISTS ( select 1 from pg_type where typname = 'en_block_ip_rule_action' ) 
    THEN
        CREATE TYPE en_block_ip_rule_action AS ENUM ();
        COMMENT ON TYPE en_block_ip_rule_action IS 'HIPS FW 차단 IP 규칙 대응 방법';
    END IF;
END $$ LANGUAGE 'plpgsql';

ALTER TYPE en_block_ip_rule_action ADD VALUE IF NOT EXISTS 'detect';
ALTER TYPE en_block_ip_rule_action ADD VALUE IF NOT EXISTS 'block';

