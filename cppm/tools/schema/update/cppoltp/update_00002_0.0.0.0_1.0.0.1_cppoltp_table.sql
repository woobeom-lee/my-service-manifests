
SET client_encoding = 'UTF8';

------------------------------------------------------------------------------------------
select '## tb_action_map';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_action_map();
    COMMENT ON TABLE tb_action_map IS '기능 매핑';

    ALTER TABLE IF EXISTS tb_action_map ADD COLUMN IF NOT EXISTS action_name text NOT NULL;
    ALTER TABLE IF EXISTS tb_action_map ADD COLUMN IF NOT EXISTS revision integer NOT NULL;
    ALTER TABLE IF EXISTS tb_action_map ADD COLUMN IF NOT EXISTS procedure text;
    ALTER TABLE IF EXISTS tb_action_map ADD COLUMN IF NOT EXISTS db_type en_db_type;
    ALTER TABLE IF EXISTS tb_action_map ADD COLUMN IF NOT EXISTS db_method en_db_method DEFAULT 'NONE'::en_db_method;
    ALTER TABLE IF EXISTS tb_action_map ADD COLUMN IF NOT EXISTS check_target boolean DEFAULT false NOT NULL;
    ALTER TABLE IF EXISTS tb_action_map ADD COLUMN IF NOT EXISTS read_only boolean DEFAULT false;
    ALTER TABLE IF EXISTS tb_action_map ADD COLUMN IF NOT EXISTS service_target en_service_target;
    ALTER TABLE IF EXISTS tb_action_map ADD COLUMN IF NOT EXISTS product_group en_product_group_type;
    ALTER TABLE IF EXISTS tb_action_map ADD COLUMN IF NOT EXISTS audit_target boolean DEFAULT false;
    ALTER TABLE IF EXISTS tb_action_map ADD COLUMN IF NOT EXISTS audit_type text;
    ALTER TABLE IF EXISTS tb_action_map ADD COLUMN IF NOT EXISTS audit_include_data boolean DEFAULT false;

    COMMENT ON COLUMN tb_action_map.action_name IS '액션명';
    COMMENT ON COLUMN tb_action_map.revision IS '기능 버전';
    COMMENT ON COLUMN tb_action_map.procedure IS '프로시저 / 실행 구문';
    COMMENT ON COLUMN tb_action_map.db_type IS 'DB 타입';
    COMMENT ON COLUMN tb_action_map.db_method IS 'DB 실행 방법';
    COMMENT ON COLUMN tb_action_map.check_target IS '대상 확인 필요 여부';
    COMMENT ON COLUMN tb_action_map.read_only IS '읽기만 허용';
    COMMENT ON COLUMN tb_action_map.service_target IS '서비스 대상';
    COMMENT ON COLUMN tb_action_map.product_group IS '제품 그룹';
    COMMENT ON COLUMN tb_action_map.audit_target IS '해당 액션 감사로그 저장 여부';
    COMMENT ON COLUMN tb_action_map.audit_type IS '감사로그 타입';
    COMMENT ON COLUMN tb_action_map.audit_include_data IS '감사로그 데이타부 포함여부';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_action_map' AND constraint_type = 'PRIMARY KEY')
    THEN
        ALTER TABLE IF EXISTS ONLY tb_action_map ADD CONSTRAINT tb_action_map_pkey PRIMARY KEY (action_name, revision);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_action_map_feature';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_action_map_feature();
    COMMENT ON TABLE tb_action_map_feature IS '액션 기능 맵핑';


    ALTER TABLE IF EXISTS tb_action_map_feature ADD COLUMN IF NOT EXISTS action_name text NOT NULL;
    ALTER TABLE IF EXISTS tb_action_map_feature ADD COLUMN IF NOT EXISTS revision integer NOT NULL;
    ALTER TABLE IF EXISTS tb_action_map_feature ADD COLUMN IF NOT EXISTS feature_name text NOT NULL;
    ALTER TABLE IF EXISTS tb_action_map_feature ADD COLUMN IF NOT EXISTS uri text;

    COMMENT ON COLUMN tb_action_map_feature.action_name IS '액션명';
    COMMENT ON COLUMN tb_action_map_feature.revision IS '기능 버전';
    COMMENT ON COLUMN tb_action_map_feature.feature_name IS '기능명';
    COMMENT ON COLUMN tb_action_map_feature.uri IS '해당URI';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_action_map_feature' AND constraint_type = 'PRIMARY KEY')
    THEN
        ALTER TABLE IF EXISTS ONLY tb_action_map_feature ADD CONSTRAINT tb_action_map_feature_pkey PRIMARY KEY (action_name, revision);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_admin';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_admin();
    COMMENT ON TABLE tb_admin IS '관리자';

    ALTER TABLE IF EXISTS tb_admin ADD COLUMN IF NOT EXISTS admin_id text NOT NULL;
    ALTER TABLE IF EXISTS tb_admin ADD COLUMN IF NOT EXISTS name text;
    ALTER TABLE IF EXISTS tb_admin ADD COLUMN IF NOT EXISTS password text;
    ALTER TABLE IF EXISTS tb_admin ADD COLUMN IF NOT EXISTS pw_due integer;
    ALTER TABLE IF EXISTS tb_admin ADD COLUMN IF NOT EXISTS connect_ip_range text;
    ALTER TABLE IF EXISTS tb_admin ADD COLUMN IF NOT EXISTS connect_dofw text;
    ALTER TABLE IF EXISTS tb_admin ADD COLUMN IF NOT EXISTS connect_time_start text;
    ALTER TABLE IF EXISTS tb_admin ADD COLUMN IF NOT EXISTS connect_time_end text;
    ALTER TABLE IF EXISTS tb_admin ADD COLUMN IF NOT EXISTS timeout_value integer;
    ALTER TABLE IF EXISTS tb_admin ADD COLUMN IF NOT EXISTS auth_wait_time integer;
    ALTER TABLE IF EXISTS tb_admin ADD COLUMN IF NOT EXISTS privilege_profile_id bigint;
    ALTER TABLE IF EXISTS tb_admin ADD COLUMN IF NOT EXISTS computer_name text;
    ALTER TABLE IF EXISTS tb_admin ADD COLUMN IF NOT EXISTS connect_ipaddr inet;
    ALTER TABLE IF EXISTS tb_admin ADD COLUMN IF NOT EXISTS login_time timestamp without time zone;
    ALTER TABLE IF EXISTS tb_admin ADD COLUMN IF NOT EXISTS logout_time timestamp without time zone;
    ALTER TABLE IF EXISTS tb_admin ADD COLUMN IF NOT EXISTS admin_group text;
    ALTER TABLE IF EXISTS tb_admin ADD COLUMN IF NOT EXISTS pw_modify_time timestamp without time zone;
    ALTER TABLE IF EXISTS tb_admin ADD COLUMN IF NOT EXISTS email text;
    ALTER TABLE IF EXISTS tb_admin ADD COLUMN IF NOT EXISTS phone text;
    ALTER TABLE IF EXISTS tb_admin ADD COLUMN IF NOT EXISTS dashboard_layout text;
    ALTER TABLE IF EXISTS tb_admin ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;
    ALTER TABLE IF EXISTS tb_admin ADD COLUMN IF NOT EXISTS description text;
    ALTER TABLE IF EXISTS tb_admin ADD COLUMN IF NOT EXISTS use_otp boolean;
    ALTER TABLE IF EXISTS tb_admin ADD COLUMN IF NOT EXISTS product_auth text;
    ALTER TABLE IF EXISTS tb_admin ADD COLUMN IF NOT EXISTS task_menu_layout text;
    ALTER TABLE IF EXISTS tb_admin ADD COLUMN IF NOT EXISTS language en_language;
    ALTER TABLE IF EXISTS tb_admin ADD COLUMN IF NOT EXISTS use_connect_ip boolean;
    ALTER TABLE IF EXISTS tb_admin ADD COLUMN IF NOT EXISTS manager_group_id bigint;
    ALTER TABLE IF EXISTS tb_admin ADD COLUMN IF NOT EXISTS lock_status boolean;
    ALTER TABLE IF EXISTS tb_admin ADD COLUMN IF NOT EXISTS lock_type text;

    COMMENT ON COLUMN tb_admin.admin_id IS '관리자 ID';
    COMMENT ON COLUMN tb_admin.name IS '관리자 이름';
    COMMENT ON COLUMN tb_admin.password IS '관리자 패스워드';
    COMMENT ON COLUMN tb_admin.pw_due IS '패스워드 만료 기간';
    COMMENT ON COLUMN tb_admin.connect_ip_range IS '접속 가능 IP 주소 범위';
    COMMENT ON COLUMN tb_admin.connect_dofw IS '접속 가능 요일';
    COMMENT ON COLUMN tb_admin.connect_time_start IS '접속 가능 시작 시간';
    COMMENT ON COLUMN tb_admin.connect_time_end IS '접속 가능 종료 시간';
    COMMENT ON COLUMN tb_admin.timeout_value IS '접속 Timeout 시간';
    COMMENT ON COLUMN tb_admin.auth_wait_time IS '로그인 인증 보류 시간';
    COMMENT ON COLUMN tb_admin.privilege_profile_id IS '관리자 권한 프로필 ID';
    COMMENT ON COLUMN tb_admin.computer_name IS '컴퓨터 이름';
    COMMENT ON COLUMN tb_admin.connect_ipaddr IS '접속 IP 주소';
    COMMENT ON COLUMN tb_admin.login_time IS '로그인 시각';
    COMMENT ON COLUMN tb_admin.logout_time IS '로그 아웃 시각';
    COMMENT ON COLUMN tb_admin.admin_group IS '관리 대상 그룹';
    COMMENT ON COLUMN tb_admin.pw_modify_time IS '비밀번호 변경 시각';
    COMMENT ON COLUMN tb_admin.email IS 'Email';
    COMMENT ON COLUMN tb_admin.phone IS '관리자 핸드폰';
    COMMENT ON COLUMN tb_admin.dashboard_layout IS '대시보드 레이아웃';
    COMMENT ON COLUMN tb_admin.modified_time IS '변경 시각';
    COMMENT ON COLUMN tb_admin.description IS '설명';
    COMMENT ON COLUMN tb_admin.use_otp IS 'OTP 사용여부';
    COMMENT ON COLUMN tb_admin.product_auth IS '제품 권한';
    COMMENT ON COLUMN tb_admin.task_menu_layout IS '작업 메뉴 레이아웃';
    COMMENT ON COLUMN tb_admin.language IS '언어';
    COMMENT ON COLUMN tb_admin.use_connect_ip IS '로그인 허용 IP 제한 사용여부(true:사용/false:미사용)';
    COMMENT ON COLUMN tb_admin.manager_group_id IS 'tb_manager_group 그룹 ID';
    COMMENT ON COLUMN tb_admin.lock_status IS '장기사용자 잠금여부';
    COMMENT ON COLUMN tb_admin.lock_type IS '잠금여부';

    CREATE SEQUENCE IF NOT EXISTS tb_admin_admin_id_seq
            START WITH 1
            INCREMENT BY 1
            NO MINVALUE
            NO MAXVALUE
            CACHE 1;

    ALTER SEQUENCE IF EXISTS tb_admin_admin_id_seq OWNED BY tb_admin.admin_id;

    ALTER TABLE IF EXISTS ONLY tb_admin ALTER COLUMN admin_id SET DEFAULT nextval('tb_admin_admin_id_seq'::regclass);

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_admin' AND constraint_type = 'PRIMARY KEY')
    THEN
        ALTER TABLE IF EXISTS ONLY tb_admin ADD CONSTRAINT tb_admin_pkey PRIMARY KEY (admin_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_admin_pw_history';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_admin_pw_history();
    COMMENT ON TABLE tb_admin_pw_history IS '관리자 패스워드 변경 이력';

    ALTER TABLE IF EXISTS tb_admin_pw_history ADD COLUMN IF NOT EXISTS history_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_admin_pw_history ADD COLUMN IF NOT EXISTS admin_id text;
    ALTER TABLE IF EXISTS tb_admin_pw_history ADD COLUMN IF NOT EXISTS password text;
    ALTER TABLE IF EXISTS tb_admin_pw_history ADD COLUMN IF NOT EXISTS "time" timestamp without time zone;

    COMMENT ON COLUMN tb_admin_pw_history.history_id IS '패스워드 변경 이력 ID';
    COMMENT ON COLUMN tb_admin_pw_history.admin_id IS '관리자 ID';
    COMMENT ON COLUMN tb_admin_pw_history.password IS '관리자 패스워드';
    COMMENT ON COLUMN tb_admin_pw_history."time" IS '패스워드 변경 시각';

    CREATE SEQUENCE IF NOT EXISTS tb_admin_pw_history_history_id_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;
    ALTER SEQUENCE IF EXISTS tb_admin_pw_history_history_id_seq OWNED BY tb_admin_pw_history.history_id;

    ALTER TABLE IF EXISTS ONLY tb_admin_pw_history ALTER COLUMN history_id SET DEFAULT nextval('tb_admin_pw_history_history_id_seq'::regclass);

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_admin_pw_history' AND constraint_type = 'PRIMARY KEY')
    THEN
        ALTER TABLE IF EXISTS ONLY tb_admin_pw_history ADD CONSTRAINT tb_admin_pw_history_pkey PRIMARY KEY (history_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_alert_template';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_alert_template();
    COMMENT ON TABLE tb_alert_template IS '알림 템플릿';

    ALTER TABLE IF EXISTS tb_alert_template ADD COLUMN IF NOT EXISTS alert_template_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_alert_template ADD COLUMN IF NOT EXISTS name text;
    ALTER TABLE IF EXISTS tb_alert_template ADD COLUMN IF NOT EXISTS body text;
    ALTER TABLE IF EXISTS tb_alert_template ADD COLUMN IF NOT EXISTS image text;

    COMMENT ON COLUMN tb_alert_template.alert_template_id IS '알림 템플릿 ID';
    COMMENT ON COLUMN tb_alert_template.name IS '이름';
    COMMENT ON COLUMN tb_alert_template.body IS '내용';
    COMMENT ON COLUMN tb_alert_template.image IS '이미지';

    CREATE SEQUENCE IF NOT EXISTS tb_alert_template_alert_template_id_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;

    ALTER SEQUENCE IF EXISTS tb_alert_template_alert_template_id_seq OWNED BY tb_alert_template.alert_template_id;
    ALTER TABLE IF EXISTS ONLY tb_alert_template ALTER COLUMN alert_template_id SET DEFAULT nextval('tb_alert_template_alert_template_id_seq'::regclass);

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_alert_template' AND constraint_type = 'PRIMARY KEY')
    THEN
        ALTER TABLE IF EXISTS ONLY tb_alert_template ADD CONSTRAINT tb_alert_template_pkey PRIMARY KEY (alert_template_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_application_auth';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_application_auth();
    COMMENT ON TABLE tb_application_auth IS '응용프로그램 인증 정보';

    ALTER TABLE IF EXISTS tb_application_auth ADD COLUMN IF NOT EXISTS app_id text NOT NULL;
    ALTER TABLE IF EXISTS tb_application_auth ADD COLUMN IF NOT EXISTS app_key text NOT NULL;
    ALTER TABLE IF EXISTS tb_application_auth ADD COLUMN IF NOT EXISTS app_type en_app_type NOT NULL;
    ALTER TABLE IF EXISTS tb_application_auth ADD COLUMN IF NOT EXISTS connect_ipaddr text[];
    ALTER TABLE IF EXISTS tb_application_auth ADD COLUMN IF NOT EXISTS from_date date;
    ALTER TABLE IF EXISTS tb_application_auth ADD COLUMN IF NOT EXISTS to_date date;
    ALTER TABLE IF EXISTS tb_application_auth ADD COLUMN IF NOT EXISTS expire_time bigint;
    ALTER TABLE IF EXISTS tb_application_auth ADD COLUMN IF NOT EXISTS db_type en_db_type;
    ALTER TABLE IF EXISTS tb_application_auth ADD COLUMN IF NOT EXISTS query text;
    ALTER TABLE IF EXISTS tb_application_auth ADD COLUMN IF NOT EXISTS supply_type en_supply_type;
    ALTER TABLE IF EXISTS tb_application_auth ADD COLUMN IF NOT EXISTS description text;
    ALTER TABLE IF EXISTS tb_application_auth ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;
    ALTER TABLE IF EXISTS tb_application_auth ADD COLUMN IF NOT EXISTS service_type en_application_service_type[] NULL;
    ALTER TABLE IF EXISTS tb_application_auth ADD COLUMN IF NOT EXISTS command_list text[] NULL;
    ALTER TABLE IF EXISTS tb_application_auth ADD COLUMN IF NOT EXISTS use boolean NULL;
    ALTER TABLE IF EXISTS tb_application_auth ADD COLUMN IF NOT EXISTS modified_by text NULL;
    ALTER TABLE IF EXISTS tb_application_auth ADD COLUMN IF NOT EXISTS visible_app_key text NULL;

    COMMENT ON COLUMN tb_application_auth.app_id IS 'APP ID';
    COMMENT ON COLUMN tb_application_auth.app_key IS 'SHA256(APP_KEY)';
    COMMENT ON COLUMN tb_application_auth.app_type IS '내부/외부 타입';
    COMMENT ON COLUMN tb_application_auth.connect_ipaddr IS '접속 IP 주소';
    COMMENT ON COLUMN tb_application_auth.from_date IS '접속 허용 기간 시작';
    COMMENT ON COLUMN tb_application_auth.to_date IS '접속 허용 기간 끝';
    COMMENT ON COLUMN tb_application_auth.expire_time IS '토큰 만료 시간';
    COMMENT ON COLUMN tb_application_auth.db_type IS 'DB 타입';
    COMMENT ON COLUMN tb_application_auth.query IS 'SELECT QUERY';
    COMMENT ON COLUMN tb_application_auth.supply_type IS '제공 형식';
    COMMENT ON COLUMN tb_application_auth.description IS '설명';
    COMMENT ON COLUMN tb_application_auth.modified_time IS '변경 시각';
    COMMENT ON COLUMN tb_application_auth.service_type IS '서비스 유형';
    COMMENT ON COLUMN tb_application_auth.command_list IS '관리 명령';
    COMMENT ON COLUMN tb_application_auth.use IS '사용여부';
    COMMENT ON COLUMN tb_application_auth.modified_by IS '생성/수정 관리자 아이디';
    COMMENT ON COLUMN tb_application_auth.visible_app_key IS '암호화 전 app 키';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_application_auth' AND constraint_type = 'PRIMARY KEY')
    THEN
        ALTER TABLE IF EXISTS ONLY tb_application_auth ADD CONSTRAINT tb_application_auth_pkey PRIMARY KEY (app_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_base_report';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_base_report();
    COMMENT ON TABLE tb_base_report IS '기본 보고서';

    ALTER TABLE IF EXISTS tb_base_report ADD COLUMN IF NOT EXISTS base_report_id en_base_report_id_type NOT NULL;
    ALTER TABLE IF EXISTS tb_base_report ADD COLUMN IF NOT EXISTS product_group en_product_group_type;
    ALTER TABLE IF EXISTS tb_base_report ADD COLUMN IF NOT EXISTS base_report_group en_base_report_group_type;
    ALTER TABLE IF EXISTS tb_base_report ADD COLUMN IF NOT EXISTS load_nosql_procedure text;
    ALTER TABLE IF EXISTS tb_base_report ADD COLUMN IF NOT EXISTS load_nosql_to_rdb_table text;
    ALTER TABLE IF EXISTS tb_base_report ADD COLUMN IF NOT EXISTS load_rdb_procedure text;
    ALTER TABLE IF EXISTS tb_base_report ADD COLUMN IF NOT EXISTS summary_procedure text;
    ALTER TABLE IF EXISTS tb_base_report ADD COLUMN IF NOT EXISTS report_procedure text;
    ALTER TABLE IF EXISTS tb_base_report ADD COLUMN IF NOT EXISTS save_rdb_table text;
    ALTER TABLE IF EXISTS tb_base_report ADD COLUMN IF NOT EXISTS fill_empty boolean;
    ALTER TABLE IF EXISTS tb_base_report ADD COLUMN IF NOT EXISTS nosql_collection text;
    ALTER TABLE IF EXISTS tb_base_report ADD COLUMN IF NOT EXISTS load_nosql_to_rdb_column text;
    ALTER TABLE IF EXISTS tb_base_report ADD COLUMN IF NOT EXISTS step integer;
    ALTER TABLE IF EXISTS tb_base_report ADD COLUMN IF NOT EXISTS default_period_type en_schedule_period_type;
    ALTER TABLE IF EXISTS tb_base_report ADD COLUMN IF NOT EXISTS db_type en_db_type;
    ALTER TABLE IF EXISTS tb_base_report ADD COLUMN IF NOT EXISTS enabled boolean;
    ALTER TABLE IF EXISTS tb_base_report ADD COLUMN IF NOT EXISTS default_params text;

    COMMENT ON COLUMN tb_base_report.base_report_id IS '기본 보고서 ID';
    COMMENT ON COLUMN tb_base_report.product_group IS '제품 그룹';
    COMMENT ON COLUMN tb_base_report.base_report_group IS '기본 보고서 그룹';
    COMMENT ON COLUMN tb_base_report.load_nosql_procedure IS 'NoSQL 로드 프로시저';
    COMMENT ON COLUMN tb_base_report.load_nosql_to_rdb_table IS 'NoSQL 에서 RDB 로드 테이블';
    COMMENT ON COLUMN tb_base_report.load_rdb_procedure IS 'RDB 로드 프로시저';
    COMMENT ON COLUMN tb_base_report.summary_procedure IS '요약 보고서 프로시저';
    COMMENT ON COLUMN tb_base_report.report_procedure IS '보고서 프로시저';
    COMMENT ON COLUMN tb_base_report.save_rdb_table IS 'RDB 테이블 저장 프로시저';
    COMMENT ON COLUMN tb_base_report.fill_empty IS '빠진 항목 채움 여부';
    COMMENT ON COLUMN tb_base_report.nosql_collection IS 'NoSQL 컬렉션';
    COMMENT ON COLUMN tb_base_report.load_nosql_to_rdb_column IS 'NoSQL 에서 RDB 로드 컬럼';
    COMMENT ON COLUMN tb_base_report.step IS '단계';
    COMMENT ON COLUMN tb_base_report.default_period_type IS '기본 주기 타입';
    COMMENT ON COLUMN tb_base_report.db_type IS 'DB 타입';
    COMMENT ON COLUMN tb_base_report.enabled IS '활성화 여부';
    COMMENT ON COLUMN tb_base_report.default_params IS '기본 파라메터';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_base_report' AND constraint_type = 'PRIMARY KEY')
    THEN
        ALTER TABLE IF EXISTS ONLY tb_base_report ADD CONSTRAINT tb_base_report_pkey PRIMARY KEY (base_report_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_base_report_layout';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_base_report_layout();
    COMMENT ON TABLE tb_base_report_layout IS '기본 보고서 레이아웃';

    ALTER TABLE IF EXISTS tb_base_report_layout ADD COLUMN IF NOT EXISTS base_report_id en_base_report_id_type NOT NULL;
    ALTER TABLE IF EXISTS tb_base_report_layout ADD COLUMN IF NOT EXISTS admin_id text NOT NULL;
    ALTER TABLE IF EXISTS tb_base_report_layout ADD COLUMN IF NOT EXISTS layout text;

    COMMENT ON COLUMN tb_base_report_layout.base_report_id IS '기본 보고서 ID';
    COMMENT ON COLUMN tb_base_report_layout.admin_id IS '관리자 ID';
    COMMENT ON COLUMN tb_base_report_layout.layout IS '레이아웃';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_base_report_layout' AND constraint_type = 'PRIMARY KEY')
    THEN
        ALTER TABLE IF EXISTS ONLY tb_base_report_layout ADD CONSTRAINT tb_base_report_layout_pkey PRIMARY KEY (base_report_id, admin_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_base_report_column';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_base_report_column();
    COMMENT ON TABLE tb_base_report_column IS '기본보고서 버전별 컬럼지정';

    ALTER TABLE IF EXISTS tb_base_report_column ADD COLUMN IF NOT EXISTS base_report_id en_base_report_id_type NOT NULL;
    ALTER TABLE IF EXISTS tb_base_report_column ADD COLUMN IF NOT EXISTS version integer NOT NULL;
    ALTER TABLE IF EXISTS tb_base_report_column ADD COLUMN IF NOT EXISTS column_list text;

    COMMENT ON COLUMN tb_base_report_column.base_report_id IS '기본 보고서 ID';
    COMMENT ON COLUMN tb_base_report_column.version IS '버전';
    COMMENT ON COLUMN tb_base_report_column.column_list IS '컬럼 목록';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_base_report_column' AND constraint_type = 'PRIMARY KEY')
    THEN
        ALTER TABLE IF EXISTS ONLY tb_base_report_column ADD CONSTRAINT tb_base_report_column_pkey PRIMARY KEY (base_report_id, version);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_common_policy';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_common_policy();
    COMMENT ON TABLE tb_common_policy IS '공통 정책';

    ALTER TABLE IF EXISTS tb_common_policy ADD COLUMN IF NOT EXISTS product_feature_id en_product_feature_id_type NOT NULL;
    ALTER TABLE IF EXISTS tb_common_policy ADD COLUMN IF NOT EXISTS policy_format en_policy_format;
    ALTER TABLE IF EXISTS tb_common_policy ADD COLUMN IF NOT EXISTS online_policy_format text;
    ALTER TABLE IF EXISTS tb_common_policy ADD COLUMN IF NOT EXISTS offline_policy_format text;
    ALTER TABLE IF EXISTS tb_common_policy ADD COLUMN IF NOT EXISTS online_policy_data text;
    ALTER TABLE IF EXISTS tb_common_policy ADD COLUMN IF NOT EXISTS offline_policy_data text;
    ALTER TABLE IF EXISTS tb_common_policy ADD COLUMN IF NOT EXISTS hash_value text;
    ALTER TABLE IF EXISTS tb_common_policy ADD COLUMN IF NOT EXISTS private_policy_data text;

    COMMENT ON COLUMN tb_common_policy.product_feature_id IS '제품 기능 ID';
    COMMENT ON COLUMN tb_common_policy.policy_format IS '정책 포맷';
    COMMENT ON COLUMN tb_common_policy.online_policy_format IS '온라인 정책 포맷';
    COMMENT ON COLUMN tb_common_policy.offline_policy_format IS '오프라인 정책 포맷';
    COMMENT ON COLUMN tb_common_policy.online_policy_data IS '온라인 정책 데이터';
    COMMENT ON COLUMN tb_common_policy.offline_policy_data IS '오프라인 정책 데이터';
    COMMENT ON COLUMN tb_common_policy.hash_value IS '해시 값';
    COMMENT ON COLUMN tb_common_policy.private_policy_data IS '사설망 정책 데이터';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_common_policy' AND constraint_type = 'PRIMARY KEY')
    THEN
        ALTER TABLE IF EXISTS ONLY tb_common_policy ADD CONSTRAINT tb_common_policy_pkey PRIMARY KEY (product_feature_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_config';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_config();
    COMMENT ON TABLE tb_config IS '설정';

    ALTER TABLE IF EXISTS tb_config ADD COLUMN IF NOT EXISTS config_group en_config_group NOT NULL;
    ALTER TABLE IF EXISTS tb_config ADD COLUMN IF NOT EXISTS key text NOT NULL;
    ALTER TABLE IF EXISTS tb_config ADD COLUMN IF NOT EXISTS value text;
    ALTER TABLE IF EXISTS tb_config ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;

    COMMENT ON COLUMN tb_config.config_group IS '설정 그룹';
    COMMENT ON COLUMN tb_config.key IS '설정 키';
    COMMENT ON COLUMN tb_config.value IS '설정 값';
    COMMENT ON COLUMN tb_config.modified_time IS '변경 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_config' AND constraint_type = 'PRIMARY KEY')
    THEN
        ALTER TABLE IF EXISTS ONLY tb_config ADD CONSTRAINT tb_config_pkey PRIMARY KEY (config_group, key);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_console_upload_file';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_console_upload_file();
    COMMENT ON TABLE tb_console_upload_file IS '콘솔 업로드 파일 임시 저장';

    ALTER TABLE IF EXISTS tb_console_upload_file ADD COLUMN IF NOT EXISTS file_id text NOT NULL;
    ALTER TABLE IF EXISTS tb_console_upload_file ADD COLUMN IF NOT EXISTS server_id bigint;
    ALTER TABLE IF EXISTS tb_console_upload_file ADD COLUMN IF NOT EXISTS file_path text;

    COMMENT ON COLUMN tb_console_upload_file.file_id IS '파일 전송 식별자';
    COMMENT ON COLUMN tb_console_upload_file.server_id IS '서버 ID';
    COMMENT ON COLUMN tb_console_upload_file.file_path IS '파일 경로';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_console_upload_file' AND constraint_type = 'PRIMARY KEY')
    THEN
        ALTER TABLE IF EXISTS ONLY tb_console_upload_file ADD CONSTRAINT tb_console_upload_file_pkey PRIMARY KEY (file_id);
    END IF;

END $$ LANGUAGE 'plpgsql';
------------------------------------------------------------------------------------------
select '## tb_agent_installer_option';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_agent_installer_option();
    COMMENT ON TABLE tb_agent_installer_option IS '에이전트 설치본 옵션';

    ALTER TABLE IF EXISTS tb_agent_installer_option ADD COLUMN IF NOT EXISTS product_pkg_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_agent_installer_option ADD COLUMN IF NOT EXISTS key text NOT NULL;
    ALTER TABLE IF EXISTS tb_agent_installer_option ADD COLUMN IF NOT EXISTS value text;
    ALTER TABLE IF EXISTS tb_agent_installer_option ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;

    COMMENT ON COLUMN tb_agent_installer_option.product_pkg_id IS '에이전트 설치본 ID';
    COMMENT ON COLUMN tb_agent_installer_option.key IS '옵션 키';
    COMMENT ON COLUMN tb_agent_installer_option.value IS '옵션 값';
    COMMENT ON COLUMN tb_agent_installer_option.modified_time IS '변경 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_agent_installer_option' AND constraint_type = 'PRIMARY KEY')
    THEN
        ALTER TABLE IF EXISTS ONLY tb_agent_installer_option ADD CONSTRAINT tb_agent_installer_option_pkey PRIMARY KEY (product_pkg_id, key);
    END IF;

END $$ LANGUAGE 'plpgsql';
------------------------------------------------------------------------------------------
select '## tb_correlation_condition';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_correlation_condition();
    COMMENT ON TABLE tb_correlation_condition IS '연계 규칙 조건 매핑';

    ALTER TABLE IF EXISTS tb_correlation_condition ADD COLUMN IF NOT EXISTS correlation_type en_correlation_type;
    ALTER TABLE IF EXISTS tb_correlation_condition ADD COLUMN IF NOT EXISTS collection text;
    ALTER TABLE IF EXISTS tb_correlation_condition ADD COLUMN IF NOT EXISTS comparison_candidate text;
    ALTER TABLE IF EXISTS tb_correlation_condition ADD COLUMN IF NOT EXISTS macro_candidate text;
    ALTER TABLE IF EXISTS tb_correlation_condition ADD COLUMN IF NOT EXISTS procedure text;
    ALTER TABLE IF EXISTS tb_correlation_condition ADD COLUMN IF NOT EXISTS product_group en_product_group_type;
    ALTER TABLE IF EXISTS tb_correlation_condition ADD COLUMN IF NOT EXISTS db_type en_db_type;
    ALTER TABLE IF EXISTS tb_correlation_condition ADD COLUMN IF NOT EXISTS correlation_condition_id en_correlation_condition_id_type NOT NULL;

    COMMENT ON COLUMN tb_correlation_condition.correlation_type IS '연계 규칙 타입';
    COMMENT ON COLUMN tb_correlation_condition.collection IS '테이블 명';
    COMMENT ON COLUMN tb_correlation_condition.comparison_candidate IS '비교 연산자 후보들';
    COMMENT ON COLUMN tb_correlation_condition.macro_candidate IS '매크로 후보들';
    COMMENT ON COLUMN tb_correlation_condition.procedure IS '프로시저 / 실행 구문';
    COMMENT ON COLUMN tb_correlation_condition.product_group IS '제품 그룹';
    COMMENT ON COLUMN tb_correlation_condition.db_type IS 'DB 타입';
    COMMENT ON COLUMN tb_correlation_condition.correlation_condition_id IS '연계 규칙 조건 ID';


    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_correlation_condition' AND constraint_type = 'PRIMARY KEY')
    THEN
        ALTER TABLE IF EXISTS ONLY tb_correlation_condition ADD CONSTRAINT tb_correlation_condition_pkey PRIMARY KEY (correlation_condition_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_correlation_exclude';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_correlation_exclude();
    COMMENT ON TABLE tb_correlation_exclude IS '연계 규칙 예외 대상';

    ALTER TABLE IF EXISTS tb_correlation_exclude ADD COLUMN IF NOT EXISTS correlation_rule_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_correlation_exclude ADD COLUMN IF NOT EXISTS target_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_correlation_exclude ADD COLUMN IF NOT EXISTS exclude_type en_correlation_exclude_type NOT NULL;

    COMMENT ON COLUMN tb_correlation_exclude.correlation_rule_id IS '연계 규칙 ID';
    COMMENT ON COLUMN tb_correlation_exclude.target_id IS '제외 대상';
    COMMENT ON COLUMN tb_correlation_exclude.exclude_type IS '제외 타입';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_correlation_exclude' AND constraint_type = 'PRIMARY KEY')
    THEN
        ALTER TABLE IF EXISTS ONLY tb_correlation_exclude ADD CONSTRAINT tb_correlation_exclude_pkey PRIMARY KEY (correlation_rule_id, exclude_type, target_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_correlation_rule';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_correlation_rule();
    COMMENT ON TABLE tb_correlation_rule IS '연계 규칙';

    ALTER TABLE IF EXISTS tb_correlation_rule ADD COLUMN IF NOT EXISTS correlation_rule_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_correlation_rule ADD COLUMN IF NOT EXISTS correlation_type en_correlation_type;
    ALTER TABLE IF EXISTS tb_correlation_rule ADD COLUMN IF NOT EXISTS name text;
    ALTER TABLE IF EXISTS tb_correlation_rule ADD COLUMN IF NOT EXISTS is_enabled boolean;
    ALTER TABLE IF EXISTS tb_correlation_rule ADD COLUMN IF NOT EXISTS schedule text;
    ALTER TABLE IF EXISTS tb_correlation_rule ADD COLUMN IF NOT EXISTS alarm_threshold integer;
    ALTER TABLE IF EXISTS tb_correlation_rule ADD COLUMN IF NOT EXISTS condition_text text;
    ALTER TABLE IF EXISTS tb_correlation_rule ADD COLUMN IF NOT EXISTS exclude_text text;
    ALTER TABLE IF EXISTS tb_correlation_rule ADD COLUMN IF NOT EXISTS send_notice boolean;
    ALTER TABLE IF EXISTS tb_correlation_rule ADD COLUMN IF NOT EXISTS base_report_id en_base_report_id_type;
    ALTER TABLE IF EXISTS tb_correlation_rule ADD COLUMN IF NOT EXISTS alert_template_id bigint;
    ALTER TABLE IF EXISTS tb_correlation_rule ADD COLUMN IF NOT EXISTS send_mail boolean;
    ALTER TABLE IF EXISTS tb_correlation_rule ADD COLUMN IF NOT EXISTS send_mail_to_target boolean;
    ALTER TABLE IF EXISTS tb_correlation_rule ADD COLUMN IF NOT EXISTS custom_email text;
    ALTER TABLE IF EXISTS tb_correlation_rule ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;
    ALTER TABLE IF EXISTS tb_correlation_rule ADD COLUMN IF NOT EXISTS admin_id text;
    ALTER TABLE IF EXISTS tb_correlation_rule ADD COLUMN IF NOT EXISTS last_alert_time timestamp;
    ALTER TABLE IF EXISTS tb_correlation_rule ADD COLUMN IF NOT EXISTS last_execute_time timestamp;
    ALTER TABLE IF EXISTS tb_correlation_rule ADD COLUMN IF NOT EXISTS send_mail_to_target_agent bool NULL;
    ALTER TABLE IF EXISTS tb_correlation_rule ADD COLUMN IF NOT EXISTS send_log bool NULL;

    COMMENT ON COLUMN tb_correlation_rule.correlation_rule_id IS '연계 규칙 ID';
    COMMENT ON COLUMN tb_correlation_rule.correlation_type IS '연계 규칙 타입';
    COMMENT ON COLUMN tb_correlation_rule.name IS '연계 규칙 명';
    COMMENT ON COLUMN tb_correlation_rule.is_enabled IS '활성화 여부';
    COMMENT ON COLUMN tb_correlation_rule.schedule IS '스캐줄 정보(JSON포맷)';
    COMMENT ON COLUMN tb_correlation_rule.alarm_threshold IS '재알림 방지 기간';
    COMMENT ON COLUMN tb_correlation_rule.condition_text IS '조건 내용';
    COMMENT ON COLUMN tb_correlation_rule.exclude_text IS '예외 내용';
    COMMENT ON COLUMN tb_correlation_rule.send_notice IS '공지사항 전송 여부';
    COMMENT ON COLUMN tb_correlation_rule.base_report_id IS '기본 보고서 ID';
    COMMENT ON COLUMN tb_correlation_rule.alert_template_id IS '알림 템플릿 ID';
    COMMENT ON COLUMN tb_correlation_rule.send_mail IS '메일 전송 여부';
    COMMENT ON COLUMN tb_correlation_rule.send_mail_to_target IS '대상에 메일 전송 여부';
    COMMENT ON COLUMN tb_correlation_rule.custom_email IS '사용자 정의 Email';
    COMMENT ON COLUMN tb_correlation_rule.modified_time IS '변경 시각';
    COMMENT ON COLUMN tb_correlation_rule.admin_id IS '관리자 ID';
    COMMENT ON COLUMN tb_correlation_rule.last_alert_time IS '마지막 알림 시각';
    COMMENT ON COLUMN tb_correlation_rule.last_execute_time IS '마지막 실행 시각';
    COMMENT ON COLUMN tb_correlation_rule.send_mail_to_target_agent IS '대상에 메일 전송 여부 / 발생 에이전트';
    COMMENT ON COLUMN tb_correlation_rule.send_log IS '이벤트로그 전송여부(서버>서비스)';

    CREATE SEQUENCE IF NOT EXISTS tb_correlation_rule_correlation_rule_id_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;
    ALTER SEQUENCE IF EXISTS tb_correlation_rule_correlation_rule_id_seq OWNED BY tb_correlation_rule.correlation_rule_id;

    ALTER TABLE IF EXISTS ONLY tb_correlation_rule ALTER COLUMN correlation_rule_id SET DEFAULT nextval('tb_correlation_rule_correlation_rule_id_seq'::regclass);
    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_correlation_rule' AND constraint_type = 'PRIMARY KEY')
    THEN
        ALTER TABLE IF EXISTS ONLY tb_correlation_rule ADD CONSTRAINT tb_correlation_rule_pkey PRIMARY KEY (correlation_rule_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_correlation_rule_item';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_correlation_rule_item();
    COMMENT ON TABLE tb_correlation_rule_item IS '연계 규칙 항목';

    ALTER TABLE IF EXISTS tb_correlation_rule_item ADD COLUMN IF NOT EXISTS correlation_rule_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_correlation_rule_item ADD COLUMN IF NOT EXISTS intersect_set integer NOT NULL;
    ALTER TABLE IF EXISTS tb_correlation_rule_item ADD COLUMN IF NOT EXISTS correlation_condition_id en_correlation_condition_id_type;
    ALTER TABLE IF EXISTS tb_correlation_rule_item ADD COLUMN IF NOT EXISTS comparison_operator en_comparison_operator;
    ALTER TABLE IF EXISTS tb_correlation_rule_item ADD COLUMN IF NOT EXISTS "values" text;

    COMMENT ON COLUMN tb_correlation_rule_item.correlation_rule_id IS '연계 규칙 ID';
    COMMENT ON COLUMN tb_correlation_rule_item.intersect_set IS '교집합';
    COMMENT ON COLUMN tb_correlation_rule_item.correlation_condition_id IS '연계 규칙 조건 ID';
    COMMENT ON COLUMN tb_correlation_rule_item.comparison_operator IS '비교 연산자';
    COMMENT ON COLUMN tb_correlation_rule_item."values" IS '값';

    -- CWPP-2765 : 동일 연계규칙 중복 허용 관련 기존 PK 있을 경우 drop
    IF EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_correlation_rule_item' AND constraint_type = 'PRIMARY KEY' AND constraint_name = 'tb_correlation_rule_item_pkey') THEN
        ALTER TABLE IF EXISTS tb_correlation_rule_item DROP CONSTRAINT IF EXISTS tb_correlation_rule_item_pkey;
    END IF;
    
    -- CWPP-2765 : 동일 연계규칙 중복 허용 관련 신규 PK 생성
    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_correlation_rule_item' AND constraint_type = 'PRIMARY KEY') THEN
        -- CWPP-3856
        UPDATE tb_correlation_rule_item SET values = '{50}' WHERE correlation_rule_id = (SELECT correlation_rule_id FROM tb_correlation_rule WHERE correlation_type = 'SYSTEM_ALERT' AND name = 'DB_SIZE') AND values IS NULL;
        UPDATE tb_correlation_rule_item SET values = '{50}' WHERE correlation_rule_id = (SELECT correlation_rule_id FROM tb_correlation_rule WHERE correlation_type = 'SYSTEM_ALERT' AND name = 'FILE_SERVER_DISK_SIZE') AND values IS NULL;

        ALTER TABLE tb_correlation_rule_item ADD CONSTRAINT tb_correlation_rule_item_rule_id_condition_id_comparison_values_pkey PRIMARY KEY (correlation_rule_id, correlation_condition_id, comparison_operator, "values");
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_correlation_task';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_correlation_task();
    COMMENT ON TABLE tb_correlation_task IS '연계 규칙 대응';

    ALTER TABLE IF EXISTS tb_correlation_task ADD COLUMN IF NOT EXISTS correlation_rule_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_correlation_task ADD COLUMN IF NOT EXISTS task_type en_task_type NOT NULL;
    ALTER TABLE IF EXISTS tb_correlation_task ADD COLUMN IF NOT EXISTS task_order bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_correlation_task ADD COLUMN IF NOT EXISTS payload_params text;

    COMMENT ON COLUMN tb_correlation_task.correlation_rule_id IS '연계 규칙 ID';
    COMMENT ON COLUMN tb_correlation_task.task_type IS '작업 타입';
    COMMENT ON COLUMN tb_correlation_task.task_order IS '작업 순서';
    COMMENT ON COLUMN tb_correlation_task.payload_params IS '명령 파라메터';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_correlation_task' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_correlation_task ADD CONSTRAINT tb_correlation_task_pkey PRIMARY KEY (correlation_rule_id, task_order);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_db_mgmt';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_db_mgmt();
    COMMENT ON TABLE tb_db_mgmt IS 'DB 관리';

    ALTER TABLE IF EXISTS tb_db_mgmt ADD COLUMN IF NOT EXISTS db_mgmt_type en_db_mgmt_type NOT NULL;
    ALTER TABLE IF EXISTS tb_db_mgmt ADD COLUMN IF NOT EXISTS mgmt_time timestamp without time zone NOT NULL;
    ALTER TABLE IF EXISTS tb_db_mgmt ADD COLUMN IF NOT EXISTS server_id bigint;
    ALTER TABLE IF EXISTS tb_db_mgmt ADD COLUMN IF NOT EXISTS file_path text;
    ALTER TABLE IF EXISTS tb_db_mgmt ADD COLUMN IF NOT EXISTS db_type en_db_type;

    COMMENT ON COLUMN tb_db_mgmt.db_mgmt_type IS 'DB 관리 타입';
    COMMENT ON COLUMN tb_db_mgmt.mgmt_time IS '수행 시각';
    COMMENT ON COLUMN tb_db_mgmt.server_id IS '서버 ID';
    COMMENT ON COLUMN tb_db_mgmt.file_path IS '파일 경로';
    COMMENT ON COLUMN tb_db_mgmt.db_type IS 'DB 타입';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_db_mgmt' AND constraint_type = 'PRIMARY KEY') THEN
         ALTER TABLE IF EXISTS ONLY tb_db_mgmt ADD CONSTRAINT tb_db_mgmt_pkey PRIMARY KEY (db_mgmt_type, mgmt_time);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_dist_range_config';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_dist_range_config();
     COMMENT ON TABLE tb_dist_range_config IS '배포 대역 설정';

    ALTER TABLE IF EXISTS tb_dist_range_config ADD COLUMN IF NOT EXISTS ip text;
    ALTER TABLE IF EXISTS tb_dist_range_config ADD COLUMN IF NOT EXISTS permit boolean;

    COMMENT ON COLUMN tb_dist_range_config.ip IS '시작 IP';
    COMMENT ON COLUMN tb_dist_range_config.permit IS '배포 허용/차단 여부';
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_file_update_server';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_file_update_server ();
    COMMENT ON TABLE tb_file_update_server IS '배포 업데이트 서버 관리';

    ALTER TABLE IF EXISTS tb_file_update_server ADD COLUMN IF NOT EXISTS target_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_file_update_server ADD COLUMN IF NOT EXISTS target_type en_file_update_target_type NOT NULL;
    ALTER TABLE IF EXISTS tb_file_update_server ADD COLUMN IF NOT EXISTS server_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_file_update_server ADD COLUMN IF NOT EXISTS specified boolean DEFAULT false;

    COMMENT ON COLUMN tb_file_update_server.target_id IS '대상 ID';
    COMMENT ON COLUMN tb_file_update_server.target_type IS '대상 유형(에이전트/그룹)';
    COMMENT ON COLUMN tb_file_update_server.server_id IS '지정된 배포 업데이트 서버 ID';
    COMMENT ON COLUMN tb_file_update_server.specified IS '에이전트 업데이트 서버 지정 여부';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_file_update_server' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_file_update_server ADD CONSTRAINT tb_file_update_server_pkey PRIMARY KEY (target_id, target_type, server_id);
    END IF;
END $$ LANGUAGE 'plpgsql';


------------------------------------------------------------------------------------------
select '## tb_extra_policy';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_extra_policy();
    COMMENT ON TABLE tb_extra_policy IS '특정 노드에 별개의 정책을 적용하기 위한 추가 정책';

    ALTER TABLE IF EXISTS tb_extra_policy ADD COLUMN IF NOT EXISTS product_feature_id en_product_feature_id_type NOT NULL;
    ALTER TABLE IF EXISTS tb_extra_policy ADD COLUMN IF NOT EXISTS policy_format en_policy_format;
    ALTER TABLE IF EXISTS tb_extra_policy ADD COLUMN IF NOT EXISTS online_policy_data text;
    ALTER TABLE IF EXISTS tb_extra_policy ADD COLUMN IF NOT EXISTS offline_policy_data text;
    ALTER TABLE IF EXISTS tb_extra_policy ADD COLUMN IF NOT EXISTS hash_value text;
    ALTER TABLE IF EXISTS tb_extra_policy ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;

    COMMENT ON COLUMN tb_extra_policy.product_feature_id IS '제품 기능 ID';
    COMMENT ON COLUMN tb_extra_policy.policy_format IS '정책 포맷';
    COMMENT ON COLUMN tb_extra_policy.online_policy_data IS '온라인 정책 데이터';
    COMMENT ON COLUMN tb_extra_policy.offline_policy_data IS '오프라인 정책 데이터';
    COMMENT ON COLUMN tb_extra_policy.hash_value IS '해시 값';
    COMMENT ON COLUMN tb_extra_policy.node_id IS '노드 ID';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_extra_policy' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_extra_policy ADD CONSTRAINT tb_extra_policy_pkey PRIMARY KEY (product_feature_id, node_id);
    END IF;
END $$ LANGUAGE 'plpgsql';



------------------------------------------------------------------------------------------
select '## tb_extra_policy_format';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_extra_policy_format();
    COMMENT ON TABLE tb_extra_policy_format IS '추가 정책 포맷';

    ALTER TABLE IF EXISTS tb_extra_policy_format ADD COLUMN IF NOT EXISTS product_feature_id en_product_feature_id_type NOT NULL;
    ALTER TABLE IF EXISTS tb_extra_policy_format ADD COLUMN IF NOT EXISTS policy_format en_policy_format;
    ALTER TABLE IF EXISTS tb_extra_policy_format ADD COLUMN IF NOT EXISTS online_policy_format text;
    ALTER TABLE IF EXISTS tb_extra_policy_format ADD COLUMN IF NOT EXISTS offline_policy_format text;

    COMMENT ON COLUMN tb_extra_policy_format.product_feature_id IS '제품 기능 ID';
    COMMENT ON COLUMN tb_extra_policy_format.policy_format IS '정책 포맷';
    COMMENT ON COLUMN tb_extra_policy_format.online_policy_format IS '온라인 정책 포맷';
    COMMENT ON COLUMN tb_extra_policy_format.offline_policy_format IS '오프라인 정책 포맷';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_extra_policy_format' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_extra_policy_format ADD CONSTRAINT tb_extra_policy_format_pkey PRIMARY KEY (product_feature_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_group';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_group();
    COMMENT ON TABLE tb_group IS '그룹';

    ALTER TABLE IF EXISTS tb_group ADD COLUMN IF NOT EXISTS group_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_group ADD COLUMN IF NOT EXISTS name text;
    ALTER TABLE IF EXISTS tb_group ADD COLUMN IF NOT EXISTS path text;
    ALTER TABLE IF EXISTS tb_group ADD COLUMN IF NOT EXISTS name_path text;
    ALTER TABLE IF EXISTS tb_group ADD COLUMN IF NOT EXISTS pgroup_id bigint;
    ALTER TABLE IF EXISTS tb_group ADD COLUMN IF NOT EXISTS group_type en_group_type;
    ALTER TABLE IF EXISTS tb_group ADD COLUMN IF NOT EXISTS is_removed boolean;
    ALTER TABLE IF EXISTS tb_group ADD COLUMN IF NOT EXISTS group_order bigint DEFAULT 0;

    COMMENT ON COLUMN tb_group.group_id IS '그룹 ID';
    COMMENT ON COLUMN tb_group.name IS '그룹명';
    COMMENT ON COLUMN tb_group.path IS '그룹 ID 경로';
    COMMENT ON COLUMN tb_group.name_path IS '그룹명 경로';
    COMMENT ON COLUMN tb_group.pgroup_id IS '상위 그룹 ID';
    COMMENT ON COLUMN tb_group.group_type IS '그룹 타입';
    COMMENT ON COLUMN tb_group.is_removed IS '삭제 여부';
    COMMENT ON COLUMN tb_group.group_order IS '그룹 순서';

    CREATE SEQUENCE IF NOT EXISTS tb_group_group_id_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;

    ALTER SEQUENCE IF EXISTS tb_group_group_id_seq OWNED BY tb_group.group_id;

    ALTER TABLE IF EXISTS ONLY tb_group ALTER COLUMN group_id SET DEFAULT nextval('tb_group_group_id_seq'::regclass);

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_group' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_group ADD CONSTRAINT tb_group_pkey PRIMARY KEY (group_id);
    END IF;
END $$ LANGUAGE 'plpgsql';
------------------------------------------------------------------------------------------
select '## tb_group_license';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_group_license();
    COMMENT ON TABLE tb_group_license IS '그룹의 제품별 라이선스';

    ALTER TABLE IF EXISTS tb_group_license ADD COLUMN IF NOT EXISTS license_id bigserial;
    ALTER TABLE IF EXISTS tb_group_license ADD COLUMN IF NOT EXISTS group_id bigint;
    ALTER TABLE IF EXISTS tb_group_license ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;

    COMMENT ON COLUMN tb_group_license.license_id IS 'tb_multi_license 의 시퀀스';
    COMMENT ON COLUMN tb_group_license.group_id IS '그룹 ID';
    COMMENT ON COLUMN tb_group_license.modified_time IS '변경 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_group_license' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_group_license ADD CONSTRAINT tb_group_license_pkey PRIMARY KEY (license_id, group_id);
    END IF;
END $$ LANGUAGE 'plpgsql';
------------------------------------------------------------------------------------------
select '## tb_manager_group';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_manager_group();
    COMMENT ON TABLE tb_manager_group IS '관리자 그룹';

    ALTER TABLE IF EXISTS tb_manager_group ADD COLUMN IF NOT EXISTS group_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_manager_group ADD COLUMN IF NOT EXISTS "name" text;
    ALTER TABLE IF EXISTS tb_manager_group ADD COLUMN IF NOT EXISTS description text;
    ALTER TABLE IF EXISTS tb_manager_group ADD COLUMN IF NOT EXISTS node_group text;
    ALTER TABLE IF EXISTS tb_manager_group ADD COLUMN IF NOT EXISTS cnapp_k8s_info text;
    ALTER TABLE IF EXISTS tb_manager_group ADD COLUMN IF NOT EXISTS view_able boolean DEFAULT true;
    ALTER TABLE IF EXISTS tb_manager_group ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;

    COMMENT ON COLUMN tb_manager_group.group_id IS '그룹 ID';
    COMMENT ON COLUMN tb_manager_group."name" IS '그룹명';
    COMMENT ON COLUMN tb_manager_group.description IS '설명';
    COMMENT ON COLUMN tb_manager_group.node_group IS '노드에 설정될 그룹 아이디 리스트';
    COMMENT ON COLUMN tb_manager_group.cnapp_k8s_info IS 'CNAPP의 클러스터, 네임스페이스 json 정보';
    COMMENT ON COLUMN tb_manager_group.view_able IS '화면 노출여부';
    COMMENT ON COLUMN tb_manager_group.modified_time IS '변경 시각';    

    CREATE SEQUENCE IF NOT EXISTS tb_manager_group_group_id_seq
        START WITH 2
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;

    ALTER SEQUENCE IF EXISTS tb_manager_group_group_id_seq OWNED BY tb_manager_group.group_id;

    ALTER TABLE IF EXISTS ONLY tb_manager_group ALTER COLUMN group_id SET DEFAULT nextval('tb_manager_group_group_id_seq'::regclass);

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_manager_group' AND constraint_type = 'PRIMARY KEY')
    THEN
        ALTER TABLE IF EXISTS ONLY tb_manager_group ADD CONSTRAINT tb_manager_group_pkey PRIMARY KEY (group_id);
    END IF;
END $$ LANGUAGE 'plpgsql';
------------------------------------------------------------------------------------------
select '## tb_group_policy';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_group_policy();
    COMMENT ON TABLE tb_group_policy IS '그룹 정책';

    ALTER TABLE IF EXISTS tb_group_policy ADD COLUMN IF NOT EXISTS group_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_group_policy ADD COLUMN IF NOT EXISTS product_feature_id en_product_feature_id_type NOT NULL;
    ALTER TABLE IF EXISTS tb_group_policy ADD COLUMN IF NOT EXISTS policy_id bigint;
    ALTER TABLE IF EXISTS tb_group_policy ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;

    COMMENT ON COLUMN tb_group_policy.group_id IS '그룹 ID';
    COMMENT ON COLUMN tb_group_policy.product_feature_id IS '제품 기능 ID';
    COMMENT ON COLUMN tb_group_policy.policy_id IS '정책 ID';
    COMMENT ON COLUMN tb_group_policy.modified_time IS '변경 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_group_policy' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_group_policy ADD CONSTRAINT tb_group_policy_pkey PRIMARY KEY (group_id, product_feature_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_internal_task_type';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_internal_task_type();
    COMMENT ON TABLE tb_internal_task_type IS '내부 작업 타입';

    ALTER TABLE IF EXISTS tb_internal_task_type ADD COLUMN IF NOT EXISTS task_type en_task_type NOT NULL;
    ALTER TABLE IF EXISTS tb_internal_task_type ADD COLUMN IF NOT EXISTS request_name text;
    ALTER TABLE IF EXISTS tb_internal_task_type ADD COLUMN IF NOT EXISTS interface_id text;
    ALTER TABLE IF EXISTS tb_internal_task_type ADD COLUMN IF NOT EXISTS payload_format text;
    ALTER TABLE IF EXISTS tb_internal_task_type ADD COLUMN IF NOT EXISTS task_target_product_id text;
    ALTER TABLE IF EXISTS tb_internal_task_type ADD COLUMN IF NOT EXISTS request_format_version text;
    ALTER TABLE IF EXISTS tb_internal_task_type ADD COLUMN IF NOT EXISTS request_from text;
    ALTER TABLE IF EXISTS tb_internal_task_type ADD COLUMN IF NOT EXISTS agent_task_type en_task_type;
    ALTER TABLE IF EXISTS tb_internal_task_type ADD COLUMN IF NOT EXISTS update_task_result text;
    ALTER TABLE IF EXISTS tb_internal_task_type ADD COLUMN IF NOT EXISTS is_correlation_task boolean;
    ALTER TABLE IF EXISTS tb_internal_task_type ADD COLUMN IF NOT EXISTS task_encoding en_task_encoding;

    COMMENT ON COLUMN tb_internal_task_type.task_type IS '작업 타입';
    COMMENT ON COLUMN tb_internal_task_type.request_name IS '요청 명';
    COMMENT ON COLUMN tb_internal_task_type.interface_id IS '에이전트용 인터페이스 ID';
    COMMENT ON COLUMN tb_internal_task_type.payload_format IS '명령 포맷';
    COMMENT ON COLUMN tb_internal_task_type.task_target_product_id IS '작업 대상 제품 ID';
    COMMENT ON COLUMN tb_internal_task_type.request_format_version IS '포맷 버전';
    COMMENT ON COLUMN tb_internal_task_type.request_from IS '요청 소스';
    COMMENT ON COLUMN tb_internal_task_type.agent_task_type IS '에이전트용 작업 타입';
    COMMENT ON COLUMN tb_internal_task_type.update_task_result IS '작업 결과 전송 여부';
    COMMENT ON COLUMN tb_internal_task_type.is_correlation_task IS '연계 규칙 대응 여부';
    COMMENT ON COLUMN tb_internal_task_type.task_encoding IS '작업 데이터 인코딩';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_internal_task_type' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_internal_task_type ADD CONSTRAINT tb_internal_task_type_pkey PRIMARY KEY (task_type);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_job';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_job();
    COMMENT ON TABLE tb_job IS '잡';

    ALTER TABLE IF EXISTS tb_job ADD COLUMN IF NOT EXISTS job_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_job ADD COLUMN IF NOT EXISTS is_schedule boolean;
    ALTER TABLE IF EXISTS tb_job ADD COLUMN IF NOT EXISTS schedule_detail text;
    ALTER TABLE IF EXISTS tb_job ADD COLUMN IF NOT EXISTS admin_id text;
    ALTER TABLE IF EXISTS tb_job ADD COLUMN IF NOT EXISTS logical_target text;
    ALTER TABLE IF EXISTS tb_job ADD COLUMN IF NOT EXISTS correlation_rule_id bigint;
    ALTER TABLE IF EXISTS tb_job ADD COLUMN IF NOT EXISTS onoff boolean;
    ALTER TABLE IF EXISTS tb_job ADD COLUMN IF NOT EXISTS visible boolean;
    ALTER TABLE IF EXISTS tb_job ADD COLUMN IF NOT EXISTS create_time timestamp without time zone;
    ALTER TABLE IF EXISTS tb_job ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;
    ALTER TABLE IF EXISTS tb_job ADD COLUMN IF NOT EXISTS target_filter text;

    COMMENT ON COLUMN tb_job.job_id IS '잡 ID';
    COMMENT ON COLUMN tb_job.is_schedule IS '예약 작업 여부';
    COMMENT ON COLUMN tb_job.schedule_detail IS '예약 상세';
    COMMENT ON COLUMN tb_job.admin_id IS '관리자 ID';
    COMMENT ON COLUMN tb_job.logical_target IS '논리 대상';
    COMMENT ON COLUMN tb_job.correlation_rule_id IS '연계 규칙 ID';
    COMMENT ON COLUMN tb_job.onoff IS '사용 여부';
    COMMENT ON COLUMN tb_job.visible IS '표시 여부';
    COMMENT ON COLUMN tb_job.create_time IS '생성 시각';
    COMMENT ON COLUMN tb_job.modified_time IS '변경 시각';
    COMMENT ON COLUMN tb_job.target_filter IS '대상 필터';

    CREATE SEQUENCE IF NOT EXISTS tb_job_job_id_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;

    ALTER SEQUENCE IF EXISTS tb_job_job_id_seq OWNED BY tb_job.job_id;
    ALTER TABLE IF EXISTS ONLY tb_job ALTER COLUMN job_id SET DEFAULT nextval('tb_job_job_id_seq'::regclass);

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_job' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_job ADD CONSTRAINT tb_job_pkey PRIMARY KEY (job_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_log_config';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_log_config();

    ALTER TABLE IF EXISTS tb_log_config ADD COLUMN IF NOT EXISTS log_type en_log_type NOT NULL;
    ALTER TABLE IF EXISTS tb_log_config ADD COLUMN IF NOT EXISTS send boolean;
    ALTER TABLE IF EXISTS tb_log_config ADD COLUMN IF NOT EXISTS product_group_type en_product_group_type;

    COMMENT ON TABLE tb_log_config IS '로그 전달 설정';
    COMMENT ON COLUMN tb_log_config.log_type IS '로그 타입';
    COMMENT ON COLUMN tb_log_config.send IS '로그 전달 여부';
    COMMENT ON COLUMN tb_log_config.product_group_type IS '제품 그룹';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_log_config' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_log_config ADD CONSTRAINT tb_log_config_pkey PRIMARY KEY (log_type);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
SELECT '## tb_login_fail_status';
DO $$
BEGIN
    -- ip 컬럼 존재 시 테이블 삭제 CWPP-9964
    IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'tb_login_fail_status' AND column_name = 'ip') THEN
        DROP TABLE IF EXISTS tb_login_fail_status;
    END IF;

    CREATE TABLE IF NOT EXISTS tb_login_fail_status();
    COMMENT ON TABLE tb_login_fail_status IS '로그인 실패 상태';

    ALTER TABLE IF EXISTS tb_login_fail_status ADD COLUMN IF NOT EXISTS admin_id text NOT NULL;
    ALTER TABLE IF EXISTS tb_login_fail_status ADD COLUMN IF NOT EXISTS name text;
    ALTER TABLE IF EXISTS tb_login_fail_status ADD COLUMN IF NOT EXISTS computer_name text;
    ALTER TABLE IF EXISTS tb_login_fail_status ADD COLUMN IF NOT EXISTS fail_count integer;
    ALTER TABLE IF EXISTS tb_login_fail_status ADD COLUMN IF NOT EXISTS login_time timestamp without time zone;

    COMMENT ON COLUMN tb_login_fail_status.admin_id IS '관리자 ID';
    COMMENT ON COLUMN tb_login_fail_status.name IS '관리자 명';
    COMMENT ON COLUMN tb_login_fail_status.computer_name IS '컴퓨터 이름';
    COMMENT ON COLUMN tb_login_fail_status.fail_count IS '실패 횟수';
    COMMENT ON COLUMN tb_login_fail_status.login_time IS '로그인 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_login_fail_status' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_login_fail_status ADD CONSTRAINT tb_login_fail_status_pkey PRIMARY KEY (admin_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_login_status';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_login_status();
    COMMENT ON TABLE tb_login_status IS '로그인 상태';

    ALTER TABLE IF EXISTS tb_login_status ADD COLUMN IF NOT EXISTS admin_id text;
    ALTER TABLE IF EXISTS tb_login_status ADD COLUMN IF NOT EXISTS ip inet;
    ALTER TABLE IF EXISTS tb_login_status ADD COLUMN IF NOT EXISTS name text;
    ALTER TABLE IF EXISTS tb_login_status ADD COLUMN IF NOT EXISTS computer_name text;
    ALTER TABLE IF EXISTS tb_login_status ADD COLUMN IF NOT EXISTS privilege_profile_id bigint;
    ALTER TABLE IF EXISTS tb_login_status ADD COLUMN IF NOT EXISTS login_time timestamp without time zone;
    ALTER TABLE IF EXISTS tb_login_status ADD COLUMN IF NOT EXISTS token text;

    COMMENT ON COLUMN tb_login_status.admin_id IS '관리자 ID';
    COMMENT ON COLUMN tb_login_status.ip IS 'IP 주소';
    COMMENT ON COLUMN tb_login_status.name IS '관리자 명';
    COMMENT ON COLUMN tb_login_status.computer_name IS '컴퓨터 이름';
    COMMENT ON COLUMN tb_login_status.privilege_profile_id IS '관리자 권한 프로필 ID';
    COMMENT ON COLUMN tb_login_status.login_time IS '로그인 시각';
    COMMENT ON COLUMN tb_login_status.token IS '토큰';
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_node';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_node();
    COMMENT ON TABLE tb_node IS '노드';

    ALTER TABLE IF EXISTS tb_node ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_node ADD COLUMN IF NOT EXISTS group_id bigint;
    ALTER TABLE IF EXISTS tb_node ADD COLUMN IF NOT EXISTS machine_uuid text;
    ALTER TABLE IF EXISTS tb_node ADD COLUMN IF NOT EXISTS ambass_cid text;
    ALTER TABLE IF EXISTS tb_node ADD COLUMN IF NOT EXISTS is_removed boolean;
    ALTER TABLE IF EXISTS tb_node ADD COLUMN IF NOT EXISTS path text;
    ALTER TABLE IF EXISTS tb_node ADD COLUMN IF NOT EXISTS ip inet;
    ALTER TABLE IF EXISTS tb_node ADD COLUMN IF NOT EXISTS ip_connected inet;
    ALTER TABLE IF EXISTS tb_node ADD COLUMN IF NOT EXISTS mac text;
    ALTER TABLE IF EXISTS tb_node ADD COLUMN IF NOT EXISTS nt_domain text;
    ALTER TABLE IF EXISTS tb_node ADD COLUMN IF NOT EXISTS login_id text;
    ALTER TABLE IF EXISTS tb_node ADD COLUMN IF NOT EXISTS computer_name text;
    ALTER TABLE IF EXISTS tb_node ADD COLUMN IF NOT EXISTS install_time timestamp with time zone;
    ALTER TABLE IF EXISTS tb_node ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;
    ALTER TABLE IF EXISTS tb_node ADD COLUMN IF NOT EXISTS removed_time timestamp without time zone;
    ALTER TABLE IF EXISTS tb_node ADD COLUMN IF NOT EXISTS machine_type en_machine_type;
    ALTER TABLE IF EXISTS tb_node ADD COLUMN IF NOT EXISTS container_service_type text;
    ALTER TABLE IF EXISTS tb_node ADD COLUMN IF NOT EXISTS container_env text;
    ALTER TABLE IF EXISTS tb_node ADD COLUMN IF NOT EXISTS container_id text;
    ALTER TABLE IF EXISTS tb_node ADD COLUMN IF NOT EXISTS platform_id en_platform_id_type;
    ALTER TABLE IF EXISTS tb_node ADD COLUMN IF NOT EXISTS agent_version text;
    ALTER TABLE IF EXISTS tb_node ADD COLUMN IF NOT EXISTS os_language en_language;
    ALTER TABLE IF EXISTS tb_node ADD COLUMN IF NOT EXISTS agent_port integer;
    ALTER TABLE IF EXISTS tb_node ADD COLUMN IF NOT EXISTS tz_offset integer;
    ALTER TABLE IF EXISTS tb_node ADD COLUMN IF NOT EXISTS agent_install_time timestamp with time zone;
    ALTER TABLE IF EXISTS tb_node ADD COLUMN IF NOT EXISTS risk_group_moved_time timestamp with time zone;
    ALTER TABLE IF EXISTS tb_node ADD COLUMN IF NOT EXISTS k8s_host_os text;
    ALTER TABLE IF EXISTS tb_node ADD COLUMN IF NOT EXISTS remove_data_check boolean;

    COMMENT ON COLUMN tb_node.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_node.group_id IS '그룹 ID';
    COMMENT ON COLUMN tb_node.machine_uuid IS '에이전트 하드웨어 시리얼';
    COMMENT ON COLUMN tb_node.ambass_cid IS 'ambass cid';
    COMMENT ON COLUMN tb_node.is_removed IS '삭제 여부';
    COMMENT ON COLUMN tb_node.path IS '경로';
    COMMENT ON COLUMN tb_node.ip IS 'IP 주소';
    COMMENT ON COLUMN tb_node.ip_connected IS '연결 IP 주소';
    COMMENT ON COLUMN tb_node.mac IS 'MAC 주소';
    COMMENT ON COLUMN tb_node.nt_domain IS 'NT 도메인';
    COMMENT ON COLUMN tb_node.login_id IS '로그인 ID';
    COMMENT ON COLUMN tb_node.computer_name IS '컴퓨터 이름';
    COMMENT ON COLUMN tb_node.install_time IS '설치 시각';
    COMMENT ON COLUMN tb_node.modified_time IS '변경 시각';
    COMMENT ON COLUMN tb_node.removed_time IS '삭제 시각';
    COMMENT ON COLUMN tb_node.machine_type IS '머신 타입';
    COMMENT ON COLUMN tb_node.container_service_type IS '컨테이너 서비스 타입';
    COMMENT ON COLUMN tb_node.container_env IS '컨테이너 환경';
    COMMENT ON COLUMN tb_node.container_id IS '컨테이너 ID';
    COMMENT ON COLUMN tb_node.platform_id IS '운영체제 ID';
    COMMENT ON COLUMN tb_node.agent_version IS '에이전트 버전';
    COMMENT ON COLUMN tb_node.os_language IS 'OS 언어';
    COMMENT ON COLUMN tb_node.agent_port IS '에이전트 포트';
    COMMENT ON COLUMN tb_node.tz_offset IS '시간대';
    COMMENT ON COLUMN tb_node.agent_install_time IS '에이전트에서 전달한 설치 시각';
    COMMENT ON COLUMN tb_node.risk_group_moved_time IS '미접속 에이전트 그룹 이동 시각';
    COMMENT ON COLUMN tb_node.k8s_host_os IS '컨테이너가 구동중인 호스트 OS 정보';
    COMMENT ON COLUMN tb_node.remove_data_check IS 'node 데이터 삭제 여부';

    CREATE SEQUENCE IF NOT EXISTS tb_node_node_id_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;

    ALTER SEQUENCE IF EXISTS tb_node_node_id_seq OWNED BY tb_node.node_id;
    ALTER TABLE IF EXISTS ONLY tb_node ALTER COLUMN node_id SET DEFAULT nextval('tb_node_node_id_seq'::regclass);
    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_node' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_node ADD CONSTRAINT tb_node_pkey PRIMARY KEY (node_id);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_node' and constraint_name = 'tb_node_machine_uuid_key' AND constraint_type = 'UNIQUE') THEN
        ALTER TABLE IF EXISTS ONLY tb_node ADD CONSTRAINT tb_node_machine_uuid_key UNIQUE (machine_uuid);
    END IF; -- CWPP-2916 : machine_type constraint 제거
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_node_hash';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_node_hash();
    COMMENT ON TABLE tb_node_hash IS '노드 해시';

    ALTER TABLE IF EXISTS tb_node_hash ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_node_hash ADD COLUMN IF NOT EXISTS node_hash_type en_node_hash_type NOT NULL;
    ALTER TABLE IF EXISTS tb_node_hash ADD COLUMN IF NOT EXISTS hash_value text;
    ALTER TABLE IF EXISTS tb_node_hash ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;

    COMMENT ON COLUMN tb_node_hash.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_node_hash.node_hash_type IS '노드 해시 타입';
    COMMENT ON COLUMN tb_node_hash.hash_value IS '해시 값';
    COMMENT ON COLUMN tb_node_hash.modified_time IS '변경 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_node_hash' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_node_hash ADD CONSTRAINT tb_node_hash_pkey PRIMARY KEY (node_id, node_hash_type);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_node_nic';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_node_nic();
    COMMENT ON TABLE tb_node_nic IS '노드 multi NIC';

    ALTER TABLE IF EXISTS tb_node_nic ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_node_nic ADD COLUMN IF NOT EXISTS mac text NOT NULL;
    ALTER TABLE IF EXISTS tb_node_nic ADD COLUMN IF NOT EXISTS ip inet NOT NULL;
    ALTER TABLE IF EXISTS tb_node_nic ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;

    COMMENT ON COLUMN tb_node_nic.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_node_nic.mac IS 'MAC 주소';
    COMMENT ON COLUMN tb_node_nic.ip IS 'IP 주소';
    COMMENT ON COLUMN tb_node_nic.modified_time IS '변경 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_node_nic' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_node_nic ADD CONSTRAINT tb_node_nic_pkey PRIMARY KEY (node_id, mac, ip);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_node_policy';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_node_policy();
    COMMENT ON TABLE tb_node_policy IS '노드 정책';

    ALTER TABLE IF EXISTS tb_node_policy ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_node_policy ADD COLUMN IF NOT EXISTS product_feature_id en_product_feature_id_type NOT NULL;
    ALTER TABLE IF EXISTS tb_node_policy ADD COLUMN IF NOT EXISTS policy_id bigint;
    ALTER TABLE IF EXISTS tb_node_policy ADD COLUMN IF NOT EXISTS keep_agent_policy boolean;
    ALTER TABLE IF EXISTS tb_node_policy ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;

    COMMENT ON COLUMN tb_node_policy.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_node_policy.product_feature_id IS '제품 기능 ID';
    COMMENT ON COLUMN tb_node_policy.policy_id IS '정책 ID';
    COMMENT ON COLUMN tb_node_policy.keep_agent_policy IS '에이전트 정책 유지 여부';
    COMMENT ON COLUMN tb_node_policy.modified_time IS '변경 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_node_policy' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_node_policy ADD CONSTRAINT tb_node_policy_pkey PRIMARY KEY (node_id, product_feature_id);
    END IF;

    CREATE INDEX IF NOT EXISTS tb_node_policy_keep_agent_policy_idx ON tb_node_policy(keep_agent_policy);
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_node_status';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_node_status ();
    COMMENT ON TABLE tb_node_status IS '노드 상태';

    ALTER TABLE IF EXISTS tb_node_status ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_node_status ADD COLUMN IF NOT EXISTS connection_status en_connection_status DEFAULT 'CONNECTED'::en_connection_status;
    ALTER TABLE IF EXISTS tb_node_status ADD COLUMN IF NOT EXISTS server_time timestamp with time zone DEFAULT now();
    ALTER TABLE IF EXISTS tb_node_status ADD COLUMN IF NOT EXISTS integrity_status en_integrity_status;
    ALTER TABLE IF EXISTS tb_node_status ADD COLUMN IF NOT EXISTS tz_offset integer;
    ALTER TABLE IF EXISTS tb_node_status ADD COLUMN IF NOT EXISTS client_time timestamp with time zone;
    ALTER TABLE IF EXISTS tb_node_status ADD COLUMN IF NOT EXISTS license_no text;
    ALTER TABLE IF EXISTS tb_node_status ADD COLUMN IF NOT EXISTS license_user text;
    ALTER TABLE IF EXISTS tb_node_status ADD COLUMN IF NOT EXISTS license_org text;
    ALTER TABLE IF EXISTS tb_node_status ADD COLUMN IF NOT EXISTS activation_code text;

    COMMENT ON COLUMN tb_node_status.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_node_status.connection_status IS '노드 연결 상태';
    COMMENT ON COLUMN tb_node_status.server_time IS '변경 시각';
    COMMENT ON COLUMN tb_node_status.integrity_status IS '무결성 검사 결과';
    COMMENT ON COLUMN tb_node_status.tz_offset IS '시간대';
    COMMENT ON COLUMN tb_node_status.client_time IS '클라이언트 시각';
    COMMENT ON COLUMN tb_node_status.license_no IS '라이선스 번호';
    COMMENT ON COLUMN tb_node_status.license_user IS '라이선스 사용자';
    COMMENT ON COLUMN tb_node_status.license_org IS '라이선스 조직';
    COMMENT ON COLUMN tb_node_status.activation_code IS '액티베이션 코드';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_node_status' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_node_status ADD CONSTRAINT tb_node_status_pkey PRIMARY KEY (node_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_node_alive_daily_history';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_node_alive_daily_history ();
    COMMENT ON TABLE tb_node_alive_daily_history IS '에이전트 일별 연결 유지 기록';

    ALTER TABLE IF EXISTS tb_node_alive_daily_history ADD COLUMN IF NOT EXISTS server_date date DEFAULT now();
    ALTER TABLE IF EXISTS tb_node_alive_daily_history ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;

    COMMENT ON COLUMN tb_node_alive_daily_history.server_date IS '접속일';
    COMMENT ON COLUMN tb_node_alive_daily_history.node_id IS '노드 ID';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_node_alive_daily_history' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_node_alive_daily_history ADD CONSTRAINT tb_node_alive_daily_history_pkey PRIMARY KEY (server_date, node_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_notification_center';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_notification_center();
    COMMENT ON TABLE tb_notification_center IS '알림 센터';

    ALTER TABLE IF EXISTS tb_notification_center ADD COLUMN IF NOT EXISTS notification_type en_notification_type NOT NULL;
    ALTER TABLE IF EXISTS tb_notification_center ADD COLUMN IF NOT EXISTS notification_id text NOT NULL;
    ALTER TABLE IF EXISTS tb_notification_center ADD COLUMN IF NOT EXISTS notification_sub_type en_notification_sub_type;
    ALTER TABLE IF EXISTS tb_notification_center ADD COLUMN IF NOT EXISTS notification_status en_notification_status_type;
    ALTER TABLE IF EXISTS tb_notification_center ADD COLUMN IF NOT EXISTS message text;
    ALTER TABLE IF EXISTS tb_notification_center ADD COLUMN IF NOT EXISTS admin_id text;
    ALTER TABLE IF EXISTS tb_notification_center ADD COLUMN IF NOT EXISTS admin_ip inet;
    ALTER TABLE IF EXISTS tb_notification_center ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;

    COMMENT ON COLUMN tb_notification_center.notification_type IS '알림 타입';
    COMMENT ON COLUMN tb_notification_center.notification_id IS '알림 ID';
    COMMENT ON COLUMN tb_notification_center.notification_sub_type IS '알림 상세 타입';
    COMMENT ON COLUMN tb_notification_center.notification_status IS '알림 상태';
    COMMENT ON COLUMN tb_notification_center.message IS '메세지';
    COMMENT ON COLUMN tb_notification_center.admin_id IS '관리자 ID';
    COMMENT ON COLUMN tb_notification_center.admin_ip IS '관리자 IP';
    COMMENT ON COLUMN tb_notification_center.modified_time IS '변경 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_notification_center' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_notification_center ADD CONSTRAINT tb_notification_center_pkey PRIMARY KEY (notification_type, notification_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_open_source';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_open_source();
    COMMENT ON TABLE tb_open_source IS '오픈 소스';
    ALTER TABLE IF EXISTS tb_open_source ADD COLUMN IF NOT EXISTS name text NOT NULL;
    ALTER TABLE IF EXISTS tb_open_source ADD COLUMN IF NOT EXISTS home_page text;
    ALTER TABLE IF EXISTS tb_open_source ADD COLUMN IF NOT EXISTS license_type text;

    COMMENT ON COLUMN tb_open_source.name IS '오픈소스명';
    COMMENT ON COLUMN tb_open_source.home_page IS '홈페이지';
    COMMENT ON COLUMN tb_open_source.license_type IS '라이선스 타입';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_open_source' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_open_source ADD CONSTRAINT tb_open_source_pkey PRIMARY KEY (name);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_pkg_platform';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_pkg_platform();
    COMMENT ON TABLE tb_pkg_platform IS '패키지 플랫폼';

    ALTER TABLE IF EXISTS tb_pkg_platform ADD COLUMN IF NOT EXISTS product_pkg_id integer NOT NULL;
    ALTER TABLE IF EXISTS tb_pkg_platform ADD COLUMN IF NOT EXISTS platform_id en_platform_id_type NOT NULL;
    ALTER TABLE IF EXISTS tb_pkg_platform ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;

    COMMENT ON COLUMN tb_pkg_platform.product_pkg_id IS '제품 패키지 ID';
    COMMENT ON COLUMN tb_pkg_platform.platform_id IS '운영체제 ID';
    COMMENT ON COLUMN tb_pkg_platform.modified_time IS '변경 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_pkg_platform' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_pkg_platform ADD CONSTRAINT tb_pkg_platform_pkey PRIMARY KEY (product_pkg_id, platform_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_pkg_server';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_pkg_server();
    COMMENT ON TABLE tb_pkg_server IS '패키지가 업로드 된 서버 정보';

    ALTER TABLE IF EXISTS tb_pkg_server ADD COLUMN IF NOT EXISTS product_pkg_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_pkg_server ADD COLUMN IF NOT EXISTS server_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_pkg_server ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;

    COMMENT ON COLUMN tb_pkg_server.product_pkg_id IS '제품 패키지 ID';
    COMMENT ON COLUMN tb_pkg_server.server_id IS '서버 ID';
    COMMENT ON COLUMN tb_pkg_server.modified_time IS '변경 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_pkg_server' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_pkg_server ADD CONSTRAINT tb_pkg_server_pkey PRIMARY KEY (product_pkg_id, server_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_platform';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_platform();
    COMMENT ON TABLE tb_platform IS 'OS 정보 및 지원 여부';

    ALTER TABLE IF EXISTS tb_platform ADD COLUMN IF NOT EXISTS platform_id en_platform_id_type NOT NULL;
    ALTER TABLE IF EXISTS tb_platform ADD COLUMN IF NOT EXISTS name text;
    ALTER TABLE IF EXISTS tb_platform ADD COLUMN IF NOT EXISTS is_server boolean;
    ALTER TABLE IF EXISTS tb_platform ADD COLUMN IF NOT EXISTS description text;
    ALTER TABLE IF EXISTS tb_platform ADD COLUMN IF NOT EXISTS major integer;
    ALTER TABLE IF EXISTS tb_platform ADD COLUMN IF NOT EXISTS minor integer;
    ALTER TABLE IF EXISTS tb_platform ADD COLUMN IF NOT EXISTS "bit" integer;
    ALTER TABLE IF EXISTS tb_platform ADD COLUMN IF NOT EXISTS platform_type en_platform_type;
    ALTER TABLE IF EXISTS tb_platform ADD COLUMN IF NOT EXISTS platform_group en_platform_id_type;
    ALTER TABLE IF EXISTS tb_platform ADD COLUMN IF NOT EXISTS is_supported boolean;
    ALTER TABLE IF EXISTS tb_platform ADD COLUMN IF NOT EXISTS platform_pkg_group en_platform_id_type;
    ALTER TABLE IF EXISTS tb_platform ADD COLUMN IF NOT EXISTS release_id integer;

    COMMENT ON COLUMN tb_platform.platform_id IS '운영체제 ID';
    COMMENT ON COLUMN tb_platform.name IS '이름';
    COMMENT ON COLUMN tb_platform.is_server IS '서버 여부';
    COMMENT ON COLUMN tb_platform.description IS '설명';
    COMMENT ON COLUMN tb_platform.major IS '주 버전';
    COMMENT ON COLUMN tb_platform.minor IS '부 버전';
    COMMENT ON COLUMN tb_platform."bit" IS '비트';
    COMMENT ON COLUMN tb_platform.platform_type IS '운영체제 타입';
    COMMENT ON COLUMN tb_platform.platform_group IS '운영체제 그룹';
    COMMENT ON COLUMN tb_platform.is_supported IS '지원 여부';
    COMMENT ON COLUMN tb_platform.platform_pkg_group IS '배포 패키지 그룹';
    COMMENT ON COLUMN tb_platform.release_id IS '릴리즈 ID';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_platform' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_platform ADD CONSTRAINT tb_platform_pkey PRIMARY KEY (platform_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_container_platform';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_container_platform();
    COMMENT ON TABLE tb_container_platform IS 'Container 제품 지원 정보';

    ALTER TABLE IF EXISTS tb_container_platform ADD COLUMN IF NOT EXISTS container_service_type text NOT NULL;
    ALTER TABLE IF EXISTS tb_container_platform ADD COLUMN IF NOT EXISTS is_amc_supported boolean;
    ALTER TABLE IF EXISTS tb_container_platform ADD COLUMN IF NOT EXISTS is_hips_supported boolean;
    ALTER TABLE IF EXISTS tb_container_platform ADD COLUMN IF NOT EXISTS is_ac_supported boolean;

    COMMENT ON COLUMN tb_container_platform.container_service_type IS '컨테이너 서비스 타입';
    COMMENT ON COLUMN tb_container_platform.is_amc_supported IS 'AMC 지원 여부';
    COMMENT ON COLUMN tb_container_platform.is_hips_supported IS 'HIPS 지원 여부';
    COMMENT ON COLUMN tb_container_platform.is_ac_supported IS 'AC 지원 여부';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_container_platform' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_container_platform ADD CONSTRAINT tb_container_platform_pkey PRIMARY KEY (container_service_type);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_policy';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_policy();
    COMMENT ON TABLE tb_policy IS '정책';

    ALTER TABLE IF EXISTS tb_policy ADD COLUMN IF NOT EXISTS policy_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_policy ADD COLUMN IF NOT EXISTS name text;
    ALTER TABLE IF EXISTS tb_policy ADD COLUMN IF NOT EXISTS product_feature_id en_product_feature_id_type;
    ALTER TABLE IF EXISTS tb_policy ADD COLUMN IF NOT EXISTS description text;
    ALTER TABLE IF EXISTS tb_policy ADD COLUMN IF NOT EXISTS online_policy_body text;
    ALTER TABLE IF EXISTS tb_policy ADD COLUMN IF NOT EXISTS policy_type en_policy_type;
    ALTER TABLE IF EXISTS tb_policy ADD COLUMN IF NOT EXISTS hash text;
    ALTER TABLE IF EXISTS tb_policy ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;
    ALTER TABLE IF EXISTS tb_policy ADD COLUMN IF NOT EXISTS offline_policy_body text;
    ALTER TABLE IF EXISTS tb_policy ADD COLUMN IF NOT EXISTS use_offline_policy boolean;
    ALTER TABLE IF EXISTS tb_policy ADD COLUMN IF NOT EXISTS ppolicy_id bigint;
    ALTER TABLE IF EXISTS tb_policy ADD COLUMN IF NOT EXISTS is_updated boolean;
    ALTER TABLE IF EXISTS tb_policy ADD COLUMN IF NOT EXISTS manager_group_id bigint;

    COMMENT ON COLUMN tb_policy.policy_id IS '정책 ID';
    COMMENT ON COLUMN tb_policy.name IS '정책 명';
    COMMENT ON COLUMN tb_policy.product_feature_id IS '제품 기능 ID';
    COMMENT ON COLUMN tb_policy.description IS '설명';
    COMMENT ON COLUMN tb_policy.online_policy_body IS '온라인 정책 내용';
    COMMENT ON COLUMN tb_policy.policy_type IS '기본 정책 여부';
    COMMENT ON COLUMN tb_policy.hash IS '해시';
    COMMENT ON COLUMN tb_policy.modified_time IS '변경 시각';
    COMMENT ON COLUMN tb_policy.offline_policy_body IS '오프라인 정책 내용';
    COMMENT ON COLUMN tb_policy.use_offline_policy IS '오프라인 정책 사용 여부';
    COMMENT ON COLUMN tb_policy.ppolicy_id IS '상위 정책 ID';
    COMMENT ON COLUMN tb_policy.is_updated IS '업데이트 여부';
    COMMENT ON COLUMN tb_policy.manager_group_id IS 'tb_manager_group 의 group_id';

    CREATE SEQUENCE IF NOT EXISTS tb_policy_policy_id_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;

    ALTER SEQUENCE IF EXISTS tb_policy_policy_id_seq OWNED BY tb_policy.policy_id;
    ALTER TABLE IF EXISTS ONLY tb_policy ALTER COLUMN policy_id SET DEFAULT nextval('tb_policy_policy_id_seq'::regclass);

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_policy' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_policy ADD CONSTRAINT tb_policy_pkey PRIMARY KEY (policy_id);
    END IF;
END $$ LANGUAGE 'plpgsql';


------------------------------------------------------------------------------------------
select '## tb_predefined_policy_data';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_predefined_policy_data();
    COMMENT ON TABLE tb_predefined_policy_data IS '미리 정의된 정책 데이터';

    ALTER TABLE IF EXISTS tb_predefined_policy_data ADD COLUMN IF NOT EXISTS data_type en_predefined_policy_data_type NOT NULL;
    ALTER TABLE IF EXISTS tb_predefined_policy_data ADD COLUMN IF NOT EXISTS data text;

    COMMENT ON COLUMN tb_predefined_policy_data.data_type IS '데이터 타입';
    COMMENT ON COLUMN tb_predefined_policy_data.data IS '데이터';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_predefined_policy_data' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_predefined_policy_data ADD CONSTRAINT tb_predefined_policy_data_pkey PRIMARY KEY (data_type);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_privilege_profile';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_privilege_profile();
    COMMENT ON TABLE tb_privilege_profile IS '권한 프로필';

    ALTER TABLE IF EXISTS tb_privilege_profile ADD COLUMN IF NOT EXISTS privilege_profile_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_privilege_profile ADD COLUMN IF NOT EXISTS profile_name text;
    ALTER TABLE IF EXISTS tb_privilege_profile ADD COLUMN IF NOT EXISTS profile_body text;
    ALTER TABLE IF EXISTS tb_privilege_profile ADD COLUMN IF NOT EXISTS profile_type en_privilege_profile_type;
    ALTER TABLE IF EXISTS tb_privilege_profile ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;
    ALTER TABLE IF EXISTS tb_privilege_profile ADD COLUMN IF NOT EXISTS description text;

    COMMENT ON COLUMN tb_privilege_profile.privilege_profile_id IS '관리자 권한 프로필 ID';
    COMMENT ON COLUMN tb_privilege_profile.profile_name IS '프로필 명';
    COMMENT ON COLUMN tb_privilege_profile.profile_body IS '권한 상세';
    COMMENT ON COLUMN tb_privilege_profile.profile_type IS '프로필 타입';
    COMMENT ON COLUMN tb_privilege_profile.modified_time IS '변경 시각';
    COMMENT ON COLUMN tb_privilege_profile.description IS '설명';

    CREATE SEQUENCE IF NOT EXISTS tb_privilege_profile_privilege_profile_id_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;

    ALTER SEQUENCE IF EXISTS tb_privilege_profile_privilege_profile_id_seq OWNED BY tb_privilege_profile.privilege_profile_id;
    ALTER TABLE IF EXISTS ONLY tb_privilege_profile ALTER COLUMN privilege_profile_id SET DEFAULT nextval('tb_privilege_profile_privilege_profile_id_seq'::regclass);

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_privilege_profile' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_privilege_profile ADD CONSTRAINT tb_privilege_profile_pkey PRIMARY KEY (privilege_profile_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_product';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_product();
    COMMENT ON TABLE tb_product IS '제품';

    ALTER TABLE IF EXISTS tb_product ADD COLUMN IF NOT EXISTS product_id en_product_id_type NOT NULL;
    ALTER TABLE IF EXISTS tb_product ADD COLUMN IF NOT EXISTS name text;
    ALTER TABLE IF EXISTS tb_product ADD COLUMN IF NOT EXISTS description text;
    ALTER TABLE IF EXISTS tb_product ADD COLUMN IF NOT EXISTS product_group en_product_group_type;
    ALTER TABLE IF EXISTS tb_product ADD COLUMN IF NOT EXISTS is_server_product boolean;
    ALTER TABLE IF EXISTS tb_product ADD COLUMN IF NOT EXISTS is_client_product boolean;
    ALTER TABLE IF EXISTS tb_product ADD COLUMN IF NOT EXISTS managed boolean;
    ALTER TABLE IF EXISTS tb_product ADD COLUMN IF NOT EXISTS is_manageable boolean;
    ALTER TABLE IF EXISTS tb_product ADD COLUMN IF NOT EXISTS is_default boolean;
    ALTER TABLE IF EXISTS tb_product ADD COLUMN IF NOT EXISTS product_code integer;
    ALTER TABLE IF EXISTS tb_product ADD COLUMN IF NOT EXISTS license_id text;
    ALTER TABLE IF EXISTS tb_product ADD COLUMN IF NOT EXISTS is_upload_event_log boolean;
    ALTER TABLE IF EXISTS tb_product ADD COLUMN IF NOT EXISTS platform_support en_platform_type[] DEFAULT '{}';

    COMMENT ON COLUMN tb_product.product_id IS '제품 ID';
    COMMENT ON COLUMN tb_product.name IS '제품 명';
    COMMENT ON COLUMN tb_product.description IS '설명';
    COMMENT ON COLUMN tb_product.product_group IS '제품 그룹';
    COMMENT ON COLUMN tb_product.is_server_product IS '서버 제품 여부';
    COMMENT ON COLUMN tb_product.is_client_product IS '클라이언트 제품 여부';
    COMMENT ON COLUMN tb_product.managed IS '관리 대상 여부';
    COMMENT ON COLUMN tb_product.is_manageable IS '관리 가능 여부';
    COMMENT ON COLUMN tb_product.is_default IS '기본 제품 여부';
    COMMENT ON COLUMN tb_product.product_code IS '제품 업데이트 코드';
    COMMENT ON COLUMN tb_product.license_id IS '라이선스 ID';
    COMMENT ON COLUMN tb_product.is_upload_event_log IS '이벤트 로그 업로드 여부';
    COMMENT ON COLUMN tb_product.platform_support IS '지원 운영체제';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_product' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_product ADD CONSTRAINT tb_product_pkey PRIMARY KEY (product_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_product_feature';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_product_feature();
    COMMENT ON TABLE tb_product_feature IS '제품 기능';

    ALTER TABLE IF EXISTS tb_product_feature ADD COLUMN IF NOT EXISTS product_feature_id en_product_feature_id_type NOT NULL;
    ALTER TABLE IF EXISTS tb_product_feature ADD COLUMN IF NOT EXISTS name text;

    COMMENT ON COLUMN tb_product_feature.product_feature_id IS '제품 기능 ID';
    COMMENT ON COLUMN tb_product_feature.name IS '제품 기능명';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_product_feature' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_product_feature ADD CONSTRAINT tb_product_feature_pkey PRIMARY KEY (product_feature_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_product_feature_map';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_product_feature_map();
    COMMENT ON TABLE tb_product_feature_map IS '제품/제품기능 매핑';

    ALTER TABLE IF EXISTS tb_product_feature_map ADD COLUMN IF NOT EXISTS product_feature_id en_product_feature_id_type NOT NULL;
    ALTER TABLE IF EXISTS tb_product_feature_map ADD COLUMN IF NOT EXISTS product_id en_product_id_type NOT NULL;

    COMMENT ON COLUMN tb_product_feature_map.product_feature_id IS '제품 기능 ID';
    COMMENT ON COLUMN tb_product_feature_map.product_id IS '제품 ID';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_product_feature_map' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_product_feature_map ADD CONSTRAINT tb_product_feature_map_pkey PRIMARY KEY (product_feature_id, product_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_product_license';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_product_license();
    COMMENT ON TABLE tb_product_license IS '제품 라이선스';

    ALTER TABLE IF EXISTS tb_product_license ADD COLUMN IF NOT EXISTS product_id en_product_id_type NOT NULL;
    ALTER TABLE IF EXISTS tb_product_license ADD COLUMN IF NOT EXISTS is_manageable_license boolean;
    ALTER TABLE IF EXISTS tb_product_license ADD COLUMN IF NOT EXISTS is_apply_license boolean;
    ALTER TABLE IF EXISTS tb_product_license ADD COLUMN IF NOT EXISTS is_master_license boolean;
    ALTER TABLE IF EXISTS tb_product_license ADD COLUMN IF NOT EXISTS license_no text NOT NULL;
    ALTER TABLE IF EXISTS tb_product_license ADD COLUMN IF NOT EXISTS service_date timestamp without time zone;
    ALTER TABLE IF EXISTS tb_product_license ADD COLUMN IF NOT EXISTS expire_date timestamp without time zone;
    ALTER TABLE IF EXISTS tb_product_license ADD COLUMN IF NOT EXISTS sub_type en_license_sub_type;
    ALTER TABLE IF EXISTS tb_product_license ADD COLUMN IF NOT EXISTS correlation_alret_sent boolean DEFAULT FALSE;
    ALTER TABLE IF EXISTS tb_product_license ADD COLUMN IF NOT EXISTS expire_update_status text;
    ALTER TABLE IF EXISTS tb_product_license ADD COLUMN IF NOT EXISTS "version" text;
    ALTER TABLE IF EXISTS tb_product_license ADD COLUMN IF NOT EXISTS total_quantity integer;
    ALTER TABLE IF EXISTS tb_product_license ADD COLUMN IF NOT EXISTS next_license_start_date timestamp without time zone;
    ALTER TABLE IF EXISTS tb_product_license ADD COLUMN IF NOT EXISTS next_license_expire_date timestamp without time zone;
    ALTER TABLE IF EXISTS tb_product_license ADD COLUMN IF NOT EXISTS next_license_issue_quantity bigint;

    COMMENT ON COLUMN tb_product_license.product_id IS '제품 ID';
    COMMENT ON COLUMN tb_product_license.is_manageable_license IS '라이선스 관리 가능 여부';
    COMMENT ON COLUMN tb_product_license.is_apply_license IS '라이선스 적용 여부';
    COMMENT ON COLUMN tb_product_license.is_master_license IS '마스터 라이선스 여부';
    COMMENT ON COLUMN tb_product_license.license_no IS '라이선스 번호';
    COMMENT ON COLUMN tb_product_license.service_date IS '서비스 날짜';
    COMMENT ON COLUMN tb_product_license.expire_date IS '제품 라이선스 만료일';
    COMMENT ON COLUMN tb_product_license.sub_type IS '상세 플랫폼 타입';
    COMMENT ON COLUMN tb_product_license.correlation_alret_sent IS '경보 발송 여부';
    COMMENT ON COLUMN tb_product_license.expire_update_status IS '만료일 처리 상태(READY/UPDATING/DONE/FINISH)';
    COMMENT ON COLUMN tb_product_license."version" IS '라이선스 버전 정보';
    COMMENT ON COLUMN tb_product_license.total_quantity IS '구매 수량';
    COMMENT ON COLUMN tb_product_license.next_license_start_date IS '대기 라이선스 시작 일자';
    COMMENT ON COLUMN tb_product_license.next_license_expire_date IS '대기 라이선스 만료 일자';
    COMMENT ON COLUMN tb_product_license.next_license_issue_quantity IS '대기 라이선스 발급 수량';
    

    IF EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_product_license' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_product_license DROP CONSTRAINT tb_product_license_pkey;
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_product_license' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_product_license ADD CONSTRAINT tb_product_license_pkey PRIMARY KEY (product_id);
    END IF;

END $$ LANGUAGE 'plpgsql';
------------------------------------------------------------------------------------------
select '## tb_multi_license';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_multi_license ();
    COMMENT ON TABLE public.tb_multi_license IS '다중 라이선스';

    ALTER TABLE IF EXISTS tb_multi_license ADD COLUMN IF NOT EXISTS license_id bigserial;
    ALTER TABLE IF EXISTS tb_multi_license ADD COLUMN IF NOT EXISTS product_id en_product_id_type NOT NULL;
    ALTER TABLE IF EXISTS tb_multi_license ADD COLUMN IF NOT EXISTS license_no text NOT NULL;
    ALTER TABLE IF EXISTS tb_multi_license ADD COLUMN IF NOT EXISTS issue_quantity bigint;
    ALTER TABLE IF EXISTS tb_multi_license ADD COLUMN IF NOT EXISTS version text NOT NULL;
    ALTER TABLE IF EXISTS tb_multi_license ADD COLUMN IF NOT EXISTS description text;
    ALTER TABLE IF EXISTS tb_multi_license ADD COLUMN IF NOT EXISTS is_main_license boolean DEFAULT FALSE;
    ALTER TABLE IF EXISTS tb_multi_license ADD COLUMN IF NOT EXISTS expire_update_status text;
    ALTER TABLE IF EXISTS tb_multi_license ADD COLUMN IF NOT EXISTS register_date timestamp without time zone;
    ALTER TABLE IF EXISTS tb_multi_license ADD COLUMN IF NOT EXISTS expire_date timestamp without time zone;
    ALTER TABLE IF EXISTS tb_multi_license ADD COLUMN IF NOT EXISTS eula_agree_date timestamp without time zone;
    ALTER TABLE IF EXISTS tb_multi_license ADD COLUMN IF NOT EXISTS next_license_start_date timestamp without time zone;
    ALTER TABLE IF EXISTS tb_multi_license ADD COLUMN IF NOT EXISTS next_license_expire_date timestamp without time zone;
    ALTER TABLE IF EXISTS tb_multi_license ADD COLUMN IF NOT EXISTS next_license_issue_quantity bigint;
    
    COMMENT ON COLUMN tb_multi_license.license_id IS '라이선스 시퀀스';
    COMMENT ON COLUMN tb_multi_license.product_id IS '제품 ID';
    COMMENT ON COLUMN tb_multi_license.license_no IS '라이선스 번호';
    COMMENT ON COLUMN tb_multi_license.issue_quantity IS '발급 수량';
    COMMENT ON COLUMN tb_multi_license.version IS '라이선스 버전';
    COMMENT ON COLUMN tb_multi_license.description IS '설명';
    COMMENT ON COLUMN tb_multi_license.is_main_license IS '대표 라이선스 여부';
    COMMENT ON COLUMN tb_multi_license.expire_update_status IS '만료일 처리 상태(READY/UPDATING/DONE/FINISH)';
    COMMENT ON COLUMN tb_multi_license.register_date IS '제품 라이선스 등록일';
    COMMENT ON COLUMN tb_multi_license.expire_date IS '제품 라이선스 만료일';
    COMMENT ON COLUMN tb_multi_license.eula_agree_date IS 'Eula 동의시각'; 
    COMMENT ON COLUMN tb_multi_license.next_license_start_date IS '대기 라이선스 시작 일자';
    COMMENT ON COLUMN tb_multi_license.next_license_expire_date IS '대기 라이선스 만료 일자';
    COMMENT ON COLUMN tb_multi_license.next_license_issue_quantity IS '대기 라이선스 발급 수량';
    

    CREATE SEQUENCE IF NOT EXISTS tb_multi_license_license_id_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;

    ALTER SEQUENCE IF EXISTS tb_multi_license_license_id_seq OWNED BY tb_multi_license.license_id;
    ALTER TABLE IF EXISTS ONLY tb_multi_license ALTER COLUMN license_id SET DEFAULT nextval('tb_multi_license_license_id_seq'::regclass);

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_multi_license' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_multi_license ADD CONSTRAINT tb_multi_license_pk PRIMARY KEY (license_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_product_pkg';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_product_pkg();
    COMMENT ON TABLE tb_product_pkg IS '제품 패키지';

    ALTER TABLE IF EXISTS tb_product_pkg ADD COLUMN IF NOT EXISTS product_pkg_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_product_pkg ADD COLUMN IF NOT EXISTS name text;
    ALTER TABLE IF EXISTS tb_product_pkg ADD COLUMN IF NOT EXISTS pkg_type en_pkg_type;
    ALTER TABLE IF EXISTS tb_product_pkg ADD COLUMN IF NOT EXISTS version text;
    ALTER TABLE IF EXISTS tb_product_pkg ADD COLUMN IF NOT EXISTS path text;
    ALTER TABLE IF EXISTS tb_product_pkg ADD COLUMN IF NOT EXISTS pkg_status en_pkg_status;
    ALTER TABLE IF EXISTS tb_product_pkg ADD COLUMN IF NOT EXISTS product_id en_product_id_type;
    ALTER TABLE IF EXISTS tb_product_pkg ADD COLUMN IF NOT EXISTS description text;
    ALTER TABLE IF EXISTS tb_product_pkg ADD COLUMN IF NOT EXISTS mpsetup_hash text;
    ALTER TABLE IF EXISTS tb_product_pkg ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;
    ALTER TABLE IF EXISTS tb_product_pkg ADD COLUMN IF NOT EXISTS delta_update boolean;
    ALTER TABLE IF EXISTS tb_product_pkg ADD COLUMN IF NOT EXISTS apply_engine boolean;
    ALTER TABLE IF EXISTS tb_product_pkg ADD COLUMN IF NOT EXISTS apply_patch boolean;
    ALTER TABLE IF EXISTS tb_product_pkg ADD COLUMN IF NOT EXISTS install_ip text;
    ALTER TABLE IF EXISTS tb_product_pkg ADD COLUMN IF NOT EXISTS size bigint;
    ALTER TABLE IF EXISTS tb_product_pkg ADD COLUMN IF NOT EXISTS platform_type en_platform_type;
    ALTER TABLE IF EXISTS tb_product_pkg ADD COLUMN IF NOT EXISTS hash_algorithm en_hash_algorithm;
    ALTER TABLE IF EXISTS tb_product_pkg ADD COLUMN IF NOT EXISTS is_removed boolean DEFAULT false NOT NULL;
    ALTER TABLE IF EXISTS tb_product_pkg ADD COLUMN IF NOT EXISTS detail text;
    ALTER TABLE IF EXISTS tb_product_pkg ADD COLUMN IF NOT EXISTS content_hash_algorithm en_hash_algorithm DEFAULT NULL;
    ALTER TABLE IF EXISTS tb_product_pkg ADD COLUMN IF NOT EXISTS content_hash_value TEXT DEFAULT NULL;
    ALTER TABLE IF EXISTS tb_product_pkg ADD COLUMN IF NOT EXISTS enc_algorithm en_enc_algorithm DEFAULT 'NONE';
    ALTER TABLE IF EXISTS tb_product_pkg ADD COLUMN IF NOT EXISTS enc_key TEXT;

    COMMENT ON COLUMN tb_product_pkg.product_pkg_id IS '제품 패키지 ID';
    COMMENT ON COLUMN tb_product_pkg.name IS '패키지 명';
    COMMENT ON COLUMN tb_product_pkg.pkg_type IS '패키지 타입';
    COMMENT ON COLUMN tb_product_pkg.version IS '버전';
    COMMENT ON COLUMN tb_product_pkg.path IS '패키지 경로';
    COMMENT ON COLUMN tb_product_pkg.pkg_status IS '패키지 상태';
    COMMENT ON COLUMN tb_product_pkg.product_id IS '제품 ID';
    COMMENT ON COLUMN tb_product_pkg.description IS '설명';
    COMMENT ON COLUMN tb_product_pkg.mpsetup_hash IS 'mpsetup 해시';
    COMMENT ON COLUMN tb_product_pkg.modified_time IS '변경 시각';
    COMMENT ON COLUMN tb_product_pkg.delta_update IS '델타업데이트 사용 여부';
    COMMENT ON COLUMN tb_product_pkg.apply_engine IS '엔진셋 적용 여부';
    COMMENT ON COLUMN tb_product_pkg.apply_patch IS '패치셋 적용 여부';
    COMMENT ON COLUMN tb_product_pkg.install_ip IS '설치 IP';
    COMMENT ON COLUMN tb_product_pkg.size IS '사이즈';
    COMMENT ON COLUMN tb_product_pkg.platform_type IS '운영체제 타입';
    COMMENT ON COLUMN tb_product_pkg.hash_algorithm IS '해시 알고리즘';
    COMMENT ON COLUMN tb_product_pkg.is_removed IS '삭제 여부';
    COMMENT ON COLUMN tb_product_pkg.detail IS 'CUSTOM 패키지 등록 정보';
    COMMENT ON COLUMN tb_product_pkg.content_hash_algorithm IS 'Content Hash 알고리즘';
    COMMENT ON COLUMN tb_product_pkg.content_hash_value IS 'Content Hash 값';
    COMMENT ON COLUMN tb_product_pkg.enc_algorithm IS '대칭키 암호화 알고리즘';
    COMMENT ON COLUMN tb_product_pkg.enc_key IS '암호화 키';

    CREATE SEQUENCE IF NOT EXISTS tb_product_pkg_product_pkg_id_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;

    ALTER SEQUENCE IF EXISTS tb_product_pkg_product_pkg_id_seq OWNED BY tb_product_pkg.product_pkg_id;
    ALTER TABLE IF EXISTS ONLY tb_product_pkg ALTER COLUMN product_pkg_id SET DEFAULT nextval('tb_product_pkg_product_pkg_id_seq'::regclass);

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_product_pkg' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_product_pkg ADD CONSTRAINT tb_product_pkg_pkey PRIMARY KEY (product_pkg_id);
    END IF;
END $$ LANGUAGE 'plpgsql';
------------------------------------------------------------------------------------------
select '## tb_document_info';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_document_info();
    COMMENT ON TABLE tb_document_info IS '업로드 문서 정보';

    ALTER TABLE IF EXISTS tb_document_info ADD COLUMN IF NOT EXISTS document_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_document_info ADD COLUMN IF NOT EXISTS file_name text;
    ALTER TABLE IF EXISTS tb_document_info ADD COLUMN IF NOT EXISTS file_type en_upload_file_type;
    ALTER TABLE IF EXISTS tb_document_info ADD COLUMN IF NOT EXISTS path text;
    ALTER TABLE IF EXISTS tb_document_info ADD COLUMN IF NOT EXISTS file_location_server_id text;
    ALTER TABLE IF EXISTS tb_document_info ADD COLUMN IF NOT EXISTS size bigint;
    ALTER TABLE IF EXISTS tb_document_info ADD COLUMN IF NOT EXISTS content_hash_value TEXT DEFAULT NULL;
    ALTER TABLE IF EXISTS tb_document_info ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;

    COMMENT ON COLUMN tb_document_info.document_id IS '문서 ID';
    COMMENT ON COLUMN tb_document_info.file_name IS '문서명';
    COMMENT ON COLUMN tb_document_info.file_type IS '파일 타입';
    COMMENT ON COLUMN tb_document_info.path IS '문서 경로';
    COMMENT ON COLUMN tb_document_info.file_location_server_id IS '파일 위치 IP';
    COMMENT ON COLUMN tb_document_info.size IS '사이즈';
    COMMENT ON COLUMN tb_document_info.content_hash_value IS 'Content Hash 값';
    COMMENT ON COLUMN tb_document_info.modified_time IS '변경 시각';

    CREATE SEQUENCE IF NOT EXISTS tb_document_info_document_id_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;

    ALTER SEQUENCE IF EXISTS tb_document_info_document_id_seq OWNED BY tb_document_info.document_id;
    ALTER TABLE IF EXISTS ONLY tb_document_info ALTER COLUMN document_id SET DEFAULT nextval('tb_document_info_document_id_seq'::regclass);

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_document_info' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_document_info ADD CONSTRAINT tb_document_info_pkey PRIMARY KEY (document_id);
    END IF;
END $$ LANGUAGE 'plpgsql';
------------------------------------------------------------------------------------------
select '## tb_search_file_info';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_search_file_info();
    COMMENT ON TABLE tb_search_file_info IS '통합검색 CSV 파일정보';

    ALTER TABLE IF EXISTS tb_search_file_info ADD COLUMN IF NOT EXISTS file_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_search_file_info ADD COLUMN IF NOT EXISTS file_name text;
    ALTER TABLE IF EXISTS tb_search_file_info ADD COLUMN IF NOT EXISTS path text;
    ALTER TABLE IF EXISTS tb_search_file_info ADD COLUMN IF NOT EXISTS file_location_server_id text;
    ALTER TABLE IF EXISTS tb_search_file_info ADD COLUMN IF NOT EXISTS size bigint;
    ALTER TABLE IF EXISTS tb_search_file_info ADD COLUMN IF NOT EXISTS status text;
    ALTER TABLE IF EXISTS tb_search_file_info ADD COLUMN IF NOT EXISTS is_removed boolean DEFAULT FALSE;
    ALTER TABLE IF EXISTS tb_search_file_info ADD COLUMN IF NOT EXISTS admin_id text;
    ALTER TABLE IF EXISTS tb_search_file_info ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;

    COMMENT ON COLUMN tb_search_file_info.file_id IS '파일 ID';
    COMMENT ON COLUMN tb_search_file_info.file_name IS '문서명';
    COMMENT ON COLUMN tb_search_file_info.path IS '문서 경로';
    COMMENT ON COLUMN tb_search_file_info.file_location_server_id IS '파일 위치 IP';
    COMMENT ON COLUMN tb_search_file_info.size IS '사이즈';
    COMMENT ON COLUMN tb_search_file_info.status IS '상태';
    COMMENT ON COLUMN tb_search_file_info.is_removed IS '삭제여부';
    COMMENT ON COLUMN tb_search_file_info.admin_id IS '관리자 ID';
    COMMENT ON COLUMN tb_search_file_info.modified_time IS '변경 시각';

    CREATE SEQUENCE IF NOT EXISTS tb_search_file_info_file_id_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;

    ALTER SEQUENCE IF EXISTS tb_search_file_info_file_id_seq OWNED BY tb_search_file_info.file_id;
    ALTER TABLE IF EXISTS ONLY tb_search_file_info ALTER COLUMN file_id SET DEFAULT nextval('tb_search_file_info_file_id_seq'::regclass);

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_search_file_info' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_search_file_info ADD CONSTRAINT tb_search_file_info_pkey PRIMARY KEY (file_id);
    END IF;
END $$ LANGUAGE 'plpgsql';
------------------------------------------------------------------------------------------
select '## tb_query_report';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_query_report();
    COMMENT ON TABLE tb_query_report IS '사용자 정의 보고서_쿼리 보고서';

    ALTER TABLE IF EXISTS tb_query_report ADD COLUMN IF NOT EXISTS query_report_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_query_report ADD COLUMN IF NOT EXISTS name text;
    ALTER TABLE IF EXISTS tb_query_report ADD COLUMN IF NOT EXISTS description text;
    ALTER TABLE IF EXISTS tb_query_report ADD COLUMN IF NOT EXISTS admin_id text;
    ALTER TABLE IF EXISTS tb_query_report ADD COLUMN IF NOT EXISTS create_time timestamp without time zone;

    COMMENT ON COLUMN tb_query_report.query_report_id IS '사용자 정의 보고서 ID';
    COMMENT ON COLUMN tb_query_report.name IS '사용자 정의 보고서명';
    COMMENT ON COLUMN tb_query_report.description IS '설명';
    COMMENT ON COLUMN tb_query_report.admin_id IS '관리자 ID';
    COMMENT ON COLUMN tb_query_report.create_time IS '생성 시각';

    CREATE SEQUENCE IF NOT EXISTS tb_user_report_user_report_id_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;

    ALTER SEQUENCE IF EXISTS tb_user_report_user_report_id_seq OWNED BY tb_query_report.query_report_id;

    ALTER TABLE IF EXISTS ONLY tb_query_report ALTER COLUMN query_report_id SET DEFAULT nextval('tb_user_report_user_report_id_seq'::regclass);

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_query_report' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_query_report ADD CONSTRAINT tb_user_report_pkey PRIMARY KEY (query_report_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_query_report_item';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_query_report_item();
    COMMENT ON TABLE tb_query_report_item IS '사용자 정의 보고서 항목_쿼리 보고서';

    ALTER TABLE IF EXISTS tb_query_report_item ADD COLUMN IF NOT EXISTS query_report_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_query_report_item ADD COLUMN IF NOT EXISTS item_order integer NOT NULL;
    ALTER TABLE IF EXISTS tb_query_report_item ADD COLUMN IF NOT EXISTS report_item_type en_report_item_type;
    ALTER TABLE IF EXISTS tb_query_report_item ADD COLUMN IF NOT EXISTS report_graph_type en_report_graph_type;
    ALTER TABLE IF EXISTS tb_query_report_item ADD COLUMN IF NOT EXISTS query text;
    ALTER TABLE IF EXISTS tb_query_report_item ADD COLUMN IF NOT EXISTS db_type en_db_type;
    ALTER TABLE IF EXISTS tb_query_report_item ADD COLUMN IF NOT EXISTS graph_title text;
    ALTER TABLE IF EXISTS tb_query_report_item ADD COLUMN IF NOT EXISTS graph_color text;

    COMMENT ON COLUMN tb_query_report_item.query_report_id IS '사용자 정의 보고서 ID';
    COMMENT ON COLUMN tb_query_report_item.item_order IS '항목 순서';
    COMMENT ON COLUMN tb_query_report_item.report_item_type IS '보고서 항목 타입';
    COMMENT ON COLUMN tb_query_report_item.report_graph_type IS '보고서 그래프 타입';
    COMMENT ON COLUMN tb_query_report_item.query IS '쿼리';
    COMMENT ON COLUMN tb_query_report_item.db_type IS 'DB 타입';
    COMMENT ON COLUMN tb_query_report_item.graph_title IS '그래프 제목';
    COMMENT ON COLUMN tb_query_report_item.graph_color IS '그래프 컬러';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_query_report_item' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_query_report_item ADD CONSTRAINT tb_user_report_item_pkey PRIMARY KEY (query_report_id, item_order);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_report_schedule';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_report_schedule();
    COMMENT ON TABLE tb_report_schedule IS '보고서 예약 스케줄 정보';

    ALTER TABLE IF EXISTS tb_report_schedule ADD COLUMN IF NOT EXISTS report_schedule_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_report_schedule ADD COLUMN IF NOT EXISTS report_type en_report_type;
    ALTER TABLE IF EXISTS tb_report_schedule ADD COLUMN IF NOT EXISTS base_report_id en_base_report_id_type;
    ALTER TABLE IF EXISTS tb_report_schedule ADD COLUMN IF NOT EXISTS query_report_id bigint;
    ALTER TABLE IF EXISTS tb_report_schedule ADD COLUMN IF NOT EXISTS admin_id text;
    ALTER TABLE IF EXISTS tb_report_schedule ADD COLUMN IF NOT EXISTS params text;
    ALTER TABLE IF EXISTS tb_report_schedule ADD COLUMN IF NOT EXISTS schedule text;
    ALTER TABLE IF EXISTS tb_report_schedule ADD COLUMN IF NOT EXISTS mail_alarm boolean;
    ALTER TABLE IF EXISTS tb_report_schedule ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;
    ALTER TABLE IF EXISTS tb_report_schedule ADD COLUMN IF NOT EXISTS target text;
    ALTER TABLE IF EXISTS tb_report_schedule ADD COLUMN IF NOT EXISTS correlation_rule_id bigint;
    ALTER TABLE IF EXISTS tb_report_schedule ADD COLUMN IF NOT EXISTS name text;
    ALTER TABLE IF EXISTS tb_report_schedule ADD COLUMN IF NOT EXISTS description text;
    ALTER TABLE IF EXISTS tb_report_schedule ADD COLUMN IF NOT EXISTS is_removed boolean;
    ALTER TABLE IF EXISTS tb_report_schedule ADD COLUMN IF NOT EXISTS period_type en_schedule_period_type;
    ALTER TABLE IF EXISTS tb_report_schedule ADD COLUMN IF NOT EXISTS period_start timestamp without time zone;
    ALTER TABLE IF EXISTS tb_report_schedule ADD COLUMN IF NOT EXISTS period_end timestamp without time zone;
    ALTER TABLE IF EXISTS tb_report_schedule ADD COLUMN IF NOT EXISTS schedule_type en_schedule_type;
    ALTER TABLE IF EXISTS tb_report_schedule ADD COLUMN IF NOT EXISTS execute_server_id bigint;
    ALTER TABLE IF EXISTS tb_report_schedule ADD COLUMN IF NOT EXISTS user_mail text;
    ALTER TABLE IF EXISTS tb_report_schedule ADD COLUMN IF NOT EXISTS is_admin_mail boolean;
    ALTER TABLE IF EXISTS tb_report_schedule ADD COLUMN IF NOT EXISTS is_user_mail boolean;

    COMMENT ON COLUMN tb_report_schedule.report_schedule_id IS '보고서 예약 ID';
    COMMENT ON COLUMN tb_report_schedule.report_type IS '보고서 타입';
    COMMENT ON COLUMN tb_report_schedule.base_report_id IS '기본 보고서 ID';
    COMMENT ON COLUMN tb_report_schedule.query_report_id IS '사용자 정의 보고서 ID';
    COMMENT ON COLUMN tb_report_schedule.admin_id IS '관리자 ID';
    COMMENT ON COLUMN tb_report_schedule.params IS '파라메터';
    COMMENT ON COLUMN tb_report_schedule.schedule IS '스캐줄 정보(JSON포맷)';
    COMMENT ON COLUMN tb_report_schedule.mail_alarm IS '메일 알람 여부';
    COMMENT ON COLUMN tb_report_schedule.modified_time IS '변경 시각';
    COMMENT ON COLUMN tb_report_schedule.target IS '대상';
    COMMENT ON COLUMN tb_report_schedule.correlation_rule_id IS '연계 규칙 ID';
    COMMENT ON COLUMN tb_report_schedule.name IS '보고서 예약 명';
    COMMENT ON COLUMN tb_report_schedule.description IS '설명';
    COMMENT ON COLUMN tb_report_schedule.is_removed IS '삭제 여부';
    COMMENT ON COLUMN tb_report_schedule.period_type IS '조회 기간 타입';
    COMMENT ON COLUMN tb_report_schedule.period_start IS '조회 기간 시작';
    COMMENT ON COLUMN tb_report_schedule.period_end IS '조회 기간 종료';
    COMMENT ON COLUMN tb_report_schedule.schedule_type IS '예약 타입';
    COMMENT ON COLUMN tb_report_schedule.execute_server_id IS '예약 실행 서버';

    CREATE SEQUENCE IF NOT EXISTS tb_report_schedule_report_schedule_id_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;

    ALTER SEQUENCE IF EXISTS tb_report_schedule_report_schedule_id_seq OWNED BY tb_report_schedule.report_schedule_id;
    ALTER TABLE IF EXISTS ONLY tb_report_schedule ALTER COLUMN report_schedule_id SET DEFAULT nextval('tb_report_schedule_report_schedule_id_seq'::regclass);

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_report_schedule' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_report_schedule ADD CONSTRAINT tb_report_schedule_pkey PRIMARY KEY (report_schedule_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_report_template';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_report_template();
    COMMENT ON TABLE tb_report_template IS '보고서 템플릿';

    ALTER TABLE IF EXISTS tb_report_template ADD COLUMN IF NOT EXISTS report_template_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_report_template ADD COLUMN IF NOT EXISTS name text;
    ALTER TABLE IF EXISTS tb_report_template ADD COLUMN IF NOT EXISTS description text;
    ALTER TABLE IF EXISTS tb_report_template ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;

    COMMENT ON COLUMN tb_report_template.report_template_id IS '보고서 템플릿 ID';
    COMMENT ON COLUMN tb_report_template.name IS '템플릿 명';
    COMMENT ON COLUMN tb_report_template.description IS '설명';
    COMMENT ON COLUMN tb_report_template.modified_time IS '변경 시각';

    CREATE SEQUENCE IF NOT EXISTS tb_report_template_report_template_id_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;

    ALTER SEQUENCE IF EXISTS tb_report_template_report_template_id_seq OWNED BY tb_report_template.report_template_id;
    ALTER TABLE IF EXISTS ONLY tb_report_template ALTER COLUMN report_template_id SET DEFAULT nextval('tb_report_template_report_template_id_seq'::regclass);

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_report_template' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_report_template ADD CONSTRAINT tb_report_template_pkey PRIMARY KEY (report_template_id);
    END IF;
END $$ LANGUAGE 'plpgsql';



------------------------------------------------------------------------------------------
select '## tb_report_template_item';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_report_template_item();
    COMMENT ON TABLE tb_report_template_item IS '보고서 템플릿 항목';
    ALTER TABLE IF EXISTS tb_report_template_item ADD COLUMN IF NOT EXISTS report_template_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_report_template_item ADD COLUMN IF NOT EXISTS item_order integer NOT NULL;
    ALTER TABLE IF EXISTS tb_report_template_item ADD COLUMN IF NOT EXISTS report_item_type en_report_item_type;
    ALTER TABLE IF EXISTS tb_report_template_item ADD COLUMN IF NOT EXISTS report_graph_type en_report_graph_type;
    ALTER TABLE IF EXISTS tb_report_template_item ADD COLUMN IF NOT EXISTS query text;
    ALTER TABLE IF EXISTS tb_report_template_item ADD COLUMN IF NOT EXISTS db_type en_db_type;
    ALTER TABLE IF EXISTS tb_report_template_item ADD COLUMN IF NOT EXISTS graph_title text;
    ALTER TABLE IF EXISTS tb_report_template_item ADD COLUMN IF NOT EXISTS graph_color text;

    COMMENT ON COLUMN tb_report_template_item.report_template_id IS '보고서 템플릿 ID';
    COMMENT ON COLUMN tb_report_template_item.item_order IS '항목 순서';
    COMMENT ON COLUMN tb_report_template_item.report_item_type IS '보고서 항목 타입';
    COMMENT ON COLUMN tb_report_template_item.report_graph_type IS '보고서 그래프 타입';
    COMMENT ON COLUMN tb_report_template_item.query IS '쿼리';
    COMMENT ON COLUMN tb_report_template_item.db_type IS 'DB 타입';
    COMMENT ON COLUMN tb_report_template_item.graph_title IS '그래프 제목';
    COMMENT ON COLUMN tb_report_template_item.graph_color IS '그래프 컬러';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_report_template_item' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_report_template_item ADD CONSTRAINT tb_report_template_item_pkey PRIMARY KEY (report_template_id, item_order);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------

select '## tb_schedule';
DO $$
BEGIN
    CREATE SEQUENCE IF NOT EXISTS tb_schedule_schedule_id_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;

    CREATE TABLE IF NOT EXISTS tb_schedule();
    COMMENT ON TABLE tb_schedule IS '스케줄 정보';

    ALTER TABLE IF EXISTS tb_schedule ADD COLUMN IF NOT EXISTS schedule_id bigint DEFAULT nextval('tb_schedule_schedule_id_seq'::regclass) NOT NULL;
    ALTER TABLE IF EXISTS tb_schedule ADD COLUMN IF NOT EXISTS schedule text NOT NULL;
    ALTER TABLE IF EXISTS tb_schedule ADD COLUMN IF NOT EXISTS work_all boolean DEFAULT false NOT NULL;
    ALTER TABLE IF EXISTS tb_schedule ADD COLUMN IF NOT EXISTS execute_uri text;
    ALTER TABLE IF EXISTS tb_schedule ADD COLUMN IF NOT EXISTS reference_value text;
    ALTER TABLE IF EXISTS tb_schedule ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone DEFAULT now() NOT NULL;
    ALTER TABLE IF EXISTS tb_schedule ADD COLUMN IF NOT EXISTS enabled boolean DEFAULT true;
    ALTER TABLE IF EXISTS tb_schedule ADD COLUMN IF NOT EXISTS description text;
    ALTER TABLE IF EXISTS tb_schedule ADD COLUMN IF NOT EXISTS schedule_code en_schedule_code;
    ALTER TABLE IF EXISTS tb_schedule ADD COLUMN IF NOT EXISTS schedule_code_index integer DEFAULT 1 NOT NULL;
    ALTER TABLE IF EXISTS tb_schedule ADD COLUMN IF NOT EXISTS product_group en_product_group_type;

    COMMENT ON COLUMN tb_schedule.schedule_id IS '스캐줄 ID';
    COMMENT ON COLUMN tb_schedule.schedule IS '스캐줄 정보(JSON포맷)';
    COMMENT ON COLUMN tb_schedule.work_all IS 'trigger 동작 false:특정서버만, true:모든서버';
    COMMENT ON COLUMN tb_schedule.execute_uri IS 'trigger발생 시 호출되는 URI';
    COMMENT ON COLUMN tb_schedule.reference_value IS 'trigger 동작 이후 수행 시 참조 정보';
    COMMENT ON COLUMN tb_schedule.modified_time IS '변경 시각';
    COMMENT ON COLUMN tb_schedule.enabled IS '활성화 여부';
    COMMENT ON COLUMN tb_schedule.description IS '설명';
    COMMENT ON COLUMN tb_schedule.schedule_code IS '스캐줄 유형';
    COMMENT ON COLUMN tb_schedule.schedule_code_index IS '스캐줄 유형 구분 index';
    COMMENT ON COLUMN tb_schedule.product_group IS '제품 그룹';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_schedule' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_schedule ADD CONSTRAINT tb_schedule_schedule_pkey PRIMARY KEY (schedule_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_schedule' and constraint_name = 'tb_schedule_schedule_code_ukey' AND constraint_type = 'UNIQUE') THEN
        ALTER TABLE IF EXISTS ONLY tb_schedule ADD CONSTRAINT tb_schedule_schedule_code_ukey UNIQUE (schedule_code, schedule_code_index);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_schedule_trigger';
DO $$
BEGIN
    CREATE SEQUENCE IF NOT EXISTS tb_schedule_trigger_trigger_id_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;

    CREATE TABLE IF NOT EXISTS tb_schedule_trigger();
    COMMENT ON TABLE tb_schedule_trigger IS '스캐줄 Trigger 수행 이력';

    ALTER TABLE IF EXISTS tb_schedule_trigger ADD COLUMN IF NOT EXISTS trigger_id bigint DEFAULT nextval('tb_schedule_trigger_trigger_id_seq'::regclass) NOT NULL;
    ALTER TABLE IF EXISTS tb_schedule_trigger ADD COLUMN IF NOT EXISTS trigger_time text NOT NULL;
    ALTER TABLE IF EXISTS tb_schedule_trigger ADD COLUMN IF NOT EXISTS job_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_schedule_trigger ADD COLUMN IF NOT EXISTS job_type en_schedule_job_type NOT NULL;
    ALTER TABLE IF EXISTS tb_schedule_trigger ADD COLUMN IF NOT EXISTS tenant_server bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_schedule_trigger ADD COLUMN IF NOT EXISTS reserved_tenant text;
    ALTER TABLE IF EXISTS tb_schedule_trigger ADD COLUMN IF NOT EXISTS execute_status en_execute_status DEFAULT 'READY'::en_execute_status NOT NULL;
    ALTER TABLE IF EXISTS tb_schedule_trigger ADD COLUMN IF NOT EXISTS reference_value text NOT NULL;
    ALTER TABLE IF EXISTS tb_schedule_trigger ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone DEFAULT now() NOT NULL;
    ALTER TABLE IF EXISTS tb_schedule_trigger ADD COLUMN IF NOT EXISTS created_time timestamp without time zone DEFAULT now() NOT NULL;

    COMMENT ON COLUMN tb_schedule_trigger.trigger_id IS '트리거 이력 ID';
    COMMENT ON COLUMN tb_schedule_trigger.trigger_time IS '트리거 발생 시간';
    COMMENT ON COLUMN tb_schedule_trigger.job_id IS '스캐줄 작업 ID';
    COMMENT ON COLUMN tb_schedule_trigger.job_type IS '스캐줄 작업 유형';
    COMMENT ON COLUMN tb_schedule_trigger.tenant_server IS '수행 예약 작업 서버 ID';
    COMMENT ON COLUMN tb_schedule_trigger.reserved_tenant IS '예비 점유자';
    COMMENT ON COLUMN tb_schedule_trigger.execute_status IS '실행 상태';
    COMMENT ON COLUMN tb_schedule_trigger.reference_value IS '레퍼런스 값';
    COMMENT ON COLUMN tb_schedule_trigger.modified_time IS '변경 시각';
    COMMENT ON COLUMN tb_schedule_trigger.created_time IS '생성 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_schedule_trigger' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_schedule_trigger ADD CONSTRAINT tb_schedule_trigger_pkey PRIMARY KEY (trigger_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_schedule_trigger' and constraint_name = 'tb_schedule_trigger_ukey' AND constraint_type = 'UNIQUE') THEN
    ALTER TABLE IF EXISTS ONLY tb_schedule_trigger ADD CONSTRAINT tb_schedule_trigger_ukey UNIQUE (trigger_time, job_id, job_type);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_server';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_server();
    COMMENT ON TABLE tb_server IS '서버';
   
       -- ip/public_ip 타입 변경으로 인해 view 삭제 처리 후 재생성
       DROP VIEW IF EXISTS vw_server;

    ALTER TABLE IF EXISTS tb_server ADD COLUMN IF NOT EXISTS server_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_server ADD COLUMN IF NOT EXISTS name text;
   
       ALTER TABLE IF EXISTS tb_server ADD COLUMN IF NOT EXISTS ip inet;
       ALTER TABLE IF EXISTS tb_server ALTER COLUMN ip TYPE TEXT;  -- CWPP-4408 처리
    
       ALTER TABLE IF EXISTS tb_server ADD COLUMN IF NOT EXISTS server_key text;
    ALTER TABLE IF EXISTS tb_server ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;
    ALTER TABLE IF EXISTS tb_server ADD COLUMN IF NOT EXISTS server_status en_server_status;
    ALTER TABLE IF EXISTS tb_server ADD COLUMN IF NOT EXISTS patch_version text;
    ALTER TABLE IF EXISTS tb_server ADD COLUMN IF NOT EXISTS current_version text;
    
       ALTER TABLE IF EXISTS tb_server ADD COLUMN IF NOT EXISTS public_ip inet;
       ALTER TABLE IF EXISTS tb_server ALTER COLUMN public_ip TYPE TEXT;  -- CWPP-4408 처리
    
       ALTER TABLE IF EXISTS tb_server ADD COLUMN IF NOT EXISTS shard_uuid text;
    ALTER TABLE IF EXISTS tb_server ADD COLUMN IF NOT EXISTS integrity_status en_integrity_status;
    ALTER TABLE IF EXISTS tb_server ADD COLUMN IF NOT EXISTS role_status en_role_status_type;
    ALTER TABLE IF EXISTS tb_server ADD COLUMN IF NOT EXISTS update_status en_server_update_status;
    ALTER TABLE IF EXISTS tb_server ADD COLUMN IF NOT EXISTS hash text;
    ALTER TABLE IF EXISTS tb_server ADD COLUMN IF NOT EXISTS need_correlation_refresh boolean DEFAULT true;
    ALTER TABLE IF EXISTS tb_server ADD COLUMN IF NOT EXISTS cpu_desc text;
    ALTER TABLE IF EXISTS tb_server ADD COLUMN IF NOT EXISTS model_no text;
    ALTER TABLE IF EXISTS tb_server ADD COLUMN IF NOT EXISTS instance_type text;
    ALTER TABLE IF EXISTS tb_server ADD COLUMN IF NOT EXISTS ambass_cid text;

    COMMENT ON COLUMN tb_server.server_id IS '서버 ID';
    COMMENT ON COLUMN tb_server.name IS '서버 명';
    COMMENT ON COLUMN tb_server.ip IS '서버 IP 주소';
    COMMENT ON COLUMN tb_server.server_key IS '서버 키';
    COMMENT ON COLUMN tb_server.modified_time IS '변경 시각';
    COMMENT ON COLUMN tb_server.server_status IS '서버 상태';
    COMMENT ON COLUMN tb_server.patch_version IS '패치 버전';
    COMMENT ON COLUMN tb_server.current_version IS '현재 버전';
    COMMENT ON COLUMN tb_server.public_ip IS 'NAT 외부 IP';
    COMMENT ON COLUMN tb_server.shard_uuid IS '배치 샤드 UUID';
    COMMENT ON COLUMN tb_server.integrity_status IS '정합성 상태';
    COMMENT ON COLUMN tb_server.role_status IS '롤 부여 동작 상태';
    COMMENT ON COLUMN tb_server.update_status IS '업데이트 상태';
    COMMENT ON COLUMN tb_server.hash IS 'ETL 용 해시값';
    COMMENT ON COLUMN tb_server.need_correlation_refresh IS '연계규칙 설정 재로딩 필요 여부';
    COMMENT ON COLUMN tb_server.cpu_desc IS 'CPU 설명';
    COMMENT ON COLUMN tb_server.model_no IS '모델명';
    COMMENT ON COLUMN tb_server.instance_type IS '인스턴스 유형';
    COMMENT ON COLUMN tb_server.ambass_cid IS '서버 ambass cid';

    CREATE SEQUENCE IF NOT EXISTS tb_server_server_id_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;

    ALTER SEQUENCE IF EXISTS tb_server_server_id_seq OWNED BY tb_server.server_id;
    ALTER TABLE IF EXISTS ONLY tb_server ALTER COLUMN server_id SET DEFAULT nextval('tb_server_server_id_seq'::regclass);

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_server' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_server ADD CONSTRAINT tb_server_pkey PRIMARY KEY (server_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_server_report';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_server_report();
    COMMENT ON TABLE tb_server_report IS '서버 리포트';

    ALTER TABLE IF EXISTS tb_server_report ADD COLUMN IF NOT EXISTS server_report_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_server_report ADD COLUMN IF NOT EXISTS server_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_server_report ADD COLUMN IF NOT EXISTS report_path text NOT NULL;
    ALTER TABLE IF EXISTS tb_server_report ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;
    ALTER TABLE IF EXISTS tb_server_report ADD COLUMN IF NOT EXISTS report_status en_report_status_type DEFAULT 'DONE'::en_report_status_type;

    COMMENT ON COLUMN tb_server_report.server_report_id IS '서버 보고서 ID';
    COMMENT ON COLUMN tb_server_report.server_id IS '서버 ID';
    COMMENT ON COLUMN tb_server_report.report_path IS '보고서 경로';
    COMMENT ON COLUMN tb_server_report.modified_time IS '변경 시각';
    COMMENT ON COLUMN tb_server_report.report_status IS '서버리포트 수집 상태';

    CREATE SEQUENCE IF NOT EXISTS tb_server_report_server_report_id_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;

    ALTER SEQUENCE IF EXISTS tb_server_report_server_report_id_seq OWNED BY tb_server_report.server_report_id;
    ALTER TABLE IF EXISTS ONLY tb_server_report ALTER COLUMN server_report_id SET DEFAULT nextval('tb_server_report_server_report_id_seq'::regclass);

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_server_report' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_server_report ADD CONSTRAINT tb_server_report_pkey PRIMARY KEY (server_report_id);
    END IF;
END $$ LANGUAGE 'plpgsql';




------------------------------------------------------------------------------------------
select '## tb_service';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_service();
    COMMENT ON TABLE tb_service IS '서비스';

    ALTER TABLE IF EXISTS tb_service ADD COLUMN IF NOT EXISTS server_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_service ADD COLUMN IF NOT EXISTS service_type en_service_type NOT NULL;
    ALTER TABLE IF EXISTS tb_service ADD COLUMN IF NOT EXISTS enabled boolean;
    ALTER TABLE IF EXISTS tb_service ADD COLUMN IF NOT EXISTS static boolean;
    ALTER TABLE IF EXISTS tb_service ADD COLUMN IF NOT EXISTS service_status en_service_status;
    ALTER TABLE IF EXISTS tb_service ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;

    COMMENT ON COLUMN tb_service.server_id IS '서버 ID';
    COMMENT ON COLUMN tb_service.service_type IS '서비스 타입';
    COMMENT ON COLUMN tb_service.enabled IS '활성화 여부';
    COMMENT ON COLUMN tb_service.static IS '정적 서비스 여부';
    COMMENT ON COLUMN tb_service.service_status IS '서비스 상태';
    COMMENT ON COLUMN tb_service.modified_time IS '변경 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_service' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_service ADD CONSTRAINT tb_service_pkey PRIMARY KEY (server_id, service_type);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_service_port';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_service_port();
    COMMENT ON TABLE tb_service_port IS '서비스 포트';

    ALTER TABLE IF EXISTS tb_service_port ADD COLUMN IF NOT EXISTS service_type en_service_type NOT NULL;
    ALTER TABLE IF EXISTS tb_service_port ADD COLUMN IF NOT EXISTS port integer;
    ALTER TABLE IF EXISTS tb_service_port ADD COLUMN IF NOT EXISTS count_type en_service_count_type;
    ALTER TABLE IF EXISTS tb_service_port ADD COLUMN IF NOT EXISTS dep_service_type en_service_type;
    ALTER TABLE IF EXISTS tb_service_port ADD COLUMN IF NOT EXISTS always_static boolean;
    ALTER TABLE IF EXISTS tb_service_port ADD COLUMN IF NOT EXISTS init_static boolean;
    ALTER TABLE IF EXISTS tb_service_port ADD COLUMN IF NOT EXISTS param_enabled boolean;

    COMMENT ON COLUMN tb_service_port.service_type IS '서비스 타입';
    COMMENT ON COLUMN tb_service_port.port IS '서버 포트';
    COMMENT ON COLUMN tb_service_port.count_type IS '카운팅 타입';
    COMMENT ON COLUMN tb_service_port.dep_service_type IS '의존 서비스';
    COMMENT ON COLUMN tb_service_port.always_static IS '항상 활성화 서비스 여부';
    COMMENT ON COLUMN tb_service_port.init_static IS '최초 설치 서비스의 항상 활성화 여부';
    COMMENT ON COLUMN tb_service_port.param_enabled IS 'front 에서 파타메터 전달 여부';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_service_port' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_service_port ADD CONSTRAINT tb_service_port_pkey PRIMARY KEY (service_type);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_table_clean_config';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_table_clean_config();
    COMMENT ON TABLE tb_table_clean_config IS '데이터베이스 테이블 정리 설정';

    ALTER TABLE IF EXISTS tb_table_clean_config ADD COLUMN IF NOT EXISTS clean_table en_clean_table_type NOT NULL;
    ALTER TABLE IF EXISTS tb_table_clean_config ADD COLUMN IF NOT EXISTS clean boolean;
    ALTER TABLE IF EXISTS tb_table_clean_config ADD COLUMN IF NOT EXISTS display boolean DEFAULT TRUE;
    ALTER TABLE IF EXISTS tb_table_clean_config ADD COLUMN IF NOT EXISTS product_group en_product_group_type;
    ALTER TABLE IF EXISTS tb_table_clean_config ADD COLUMN IF NOT EXISTS storage_limit_date bigint;
    ALTER TABLE IF EXISTS tb_table_clean_config ADD COLUMN IF NOT EXISTS column_order bigint;

    COMMENT ON COLUMN tb_table_clean_config.clean_table IS '정리 대상 테이블';
    COMMENT ON COLUMN tb_table_clean_config.clean IS '정리 여부';
    COMMENT ON COLUMN tb_table_clean_config.display IS '화면 표기 여부';
    COMMENT ON COLUMN tb_table_clean_config.product_group IS '제품 그룹';
    COMMENT ON COLUMN tb_table_clean_config.storage_limit_date IS '보존 날짜 임계치';
    COMMENT ON COLUMN tb_table_clean_config.storage_limit_date IS '화면상 컬럼 정렬순서';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_table_clean_config' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_table_clean_config ADD CONSTRAINT tb_table_clean_config_pkey PRIMARY KEY (clean_table);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_task';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_task();
    COMMENT ON TABLE tb_task IS '작업';

    ALTER TABLE IF EXISTS tb_task ADD COLUMN IF NOT EXISTS task_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_task ADD COLUMN IF NOT EXISTS job_id bigint;
    ALTER TABLE IF EXISTS tb_task ADD COLUMN IF NOT EXISTS task_type en_task_type;
    ALTER TABLE IF EXISTS tb_task ADD COLUMN IF NOT EXISTS logical_payload text;
    ALTER TABLE IF EXISTS tb_task ADD COLUMN IF NOT EXISTS task_order integer;
    ALTER TABLE IF EXISTS tb_task ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;
    ALTER TABLE IF EXISTS tb_task ADD COLUMN IF NOT EXISTS internal_payload text;
    ALTER TABLE IF EXISTS tb_task ADD COLUMN IF NOT EXISTS create_time timestamp without time zone;
    ALTER TABLE IF EXISTS tb_task ADD COLUMN IF NOT EXISTS push_data text;
    ALTER TABLE IF EXISTS tb_task ADD COLUMN IF NOT EXISTS server_context_payload text;
    ALTER TABLE IF EXISTS tb_task ADD COLUMN IF NOT EXISTS console_context_payload text;

    COMMENT ON COLUMN tb_task.task_id IS '작업 ID';
    COMMENT ON COLUMN tb_task.job_id IS '잡 ID';
    COMMENT ON COLUMN tb_task.task_type IS '작업 타입';
    COMMENT ON COLUMN tb_task.logical_payload IS '논리 작업 명세';
    COMMENT ON COLUMN tb_task.task_order IS '작업 순서';
    COMMENT ON COLUMN tb_task.modified_time IS '마지막 실행 시각';
    COMMENT ON COLUMN tb_task.internal_payload IS '내부 작업 명세';
    COMMENT ON COLUMN tb_task.create_time IS '생성 시각';
    COMMENT ON COLUMN tb_task.push_data IS '푸쉬 데이터';
    COMMENT ON COLUMN tb_task.server_context_payload IS '서버 작업 명세';
    COMMENT ON COLUMN tb_task.console_context_payload IS 'console 작업 명세';

    CREATE SEQUENCE IF NOT EXISTS tb_task_task_id_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;

    ALTER SEQUENCE IF EXISTS tb_task_task_id_seq OWNED BY tb_task.task_id;
    ALTER TABLE IF EXISTS ONLY tb_task ALTER COLUMN task_id SET DEFAULT nextval('tb_task_task_id_seq'::regclass);

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_task' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_task ADD CONSTRAINT tb_task_pkey PRIMARY KEY (task_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_task_instance';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_task_instance();
    COMMENT ON TABLE tb_task_instance IS '작업 인스턴스';

    ALTER TABLE IF EXISTS tb_task_instance ADD COLUMN IF NOT EXISTS instance_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_task_instance ADD COLUMN IF NOT EXISTS task_id bigint;
    ALTER TABLE IF EXISTS tb_task_instance ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;

    COMMENT ON COLUMN tb_task_instance.instance_id IS '작업 인스턴스 ID';
    COMMENT ON COLUMN tb_task_instance.task_id IS '작업 ID';
    COMMENT ON COLUMN tb_task_instance.modified_time IS '변경 시각';

    CREATE SEQUENCE IF NOT EXISTS tb_task_instance_instance_id_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;
    ALTER SEQUENCE IF EXISTS tb_task_instance_instance_id_seq OWNED BY tb_task_instance.instance_id;
    ALTER TABLE IF EXISTS ONLY tb_task_instance ALTER COLUMN instance_id SET DEFAULT nextval('tb_task_instance_instance_id_seq'::regclass);

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_task_instance' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_task_instance ADD CONSTRAINT tb_task_instance_pkey PRIMARY KEY (instance_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_task_target';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_task_target();
    COMMENT ON TABLE tb_task_target IS '작업 대상';

    ALTER TABLE IF EXISTS tb_task_target ADD COLUMN IF NOT EXISTS task_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_task_target ADD COLUMN IF NOT EXISTS payload text;
    ALTER TABLE IF EXISTS tb_task_target ADD COLUMN IF NOT EXISTS target_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_task_target ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;
    ALTER TABLE IF EXISTS tb_task_target ADD COLUMN IF NOT EXISTS server_context_payload text;

    COMMENT ON COLUMN tb_task_target.task_id IS '작업 ID';
    COMMENT ON COLUMN tb_task_target.payload IS '물리 작업 명세';
    COMMENT ON COLUMN tb_task_target.target_id IS '대상 ID';
    COMMENT ON COLUMN tb_task_target.modified_time IS '변경 시각';
    COMMENT ON COLUMN tb_task_target.server_context_payload IS '서버 작업 명세';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_task_target' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_task_target ADD CONSTRAINT tb_task_target_pkey PRIMARY KEY (task_id, target_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_task_type';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_task_type();
    COMMENT ON TABLE tb_task_type IS '작업 타입';

    ALTER TABLE IF EXISTS tb_task_type ADD COLUMN IF NOT EXISTS task_type en_task_type NOT NULL;
    ALTER TABLE IF EXISTS tb_task_type ADD COLUMN IF NOT EXISTS task_target_type en_task_target_type;
    ALTER TABLE IF EXISTS tb_task_type ADD COLUMN IF NOT EXISTS request_name text;
    ALTER TABLE IF EXISTS tb_task_type ADD COLUMN IF NOT EXISTS interface_id text;
    ALTER TABLE IF EXISTS tb_task_type ADD COLUMN IF NOT EXISTS payload_format text;
    ALTER TABLE IF EXISTS tb_task_type ADD COLUMN IF NOT EXISTS task_target_product_id text;
    ALTER TABLE IF EXISTS tb_task_type ADD COLUMN IF NOT EXISTS request_format_version text;
    ALTER TABLE IF EXISTS tb_task_type ADD COLUMN IF NOT EXISTS request_from text;
    ALTER TABLE IF EXISTS tb_task_type ADD COLUMN IF NOT EXISTS agent_task_type text;
    ALTER TABLE IF EXISTS tb_task_type ADD COLUMN IF NOT EXISTS update_task_result text;
    ALTER TABLE IF EXISTS tb_task_type ADD COLUMN IF NOT EXISTS is_correlation_task boolean;
    ALTER TABLE IF EXISTS tb_task_type ADD COLUMN IF NOT EXISTS task_encoding en_task_encoding;
    ALTER TABLE IF EXISTS tb_task_type ADD COLUMN IF NOT EXISTS push_format text;
    ALTER TABLE IF EXISTS tb_task_type ADD COLUMN IF NOT EXISTS server_context text;
    ALTER TABLE IF EXISTS tb_task_type ADD COLUMN IF NOT EXISTS send_product_log boolean;

    COMMENT ON COLUMN tb_task_type.task_type IS '작업 타입';
    COMMENT ON COLUMN tb_task_type.task_target_type IS '작업 대상 타입';
    COMMENT ON COLUMN tb_task_type.request_name IS '요청 명';
    COMMENT ON COLUMN tb_task_type.interface_id IS '에이전트용 인터페이스 ID';
    COMMENT ON COLUMN tb_task_type.payload_format IS '명령 포맷';
    COMMENT ON COLUMN tb_task_type.task_target_product_id IS '작업 대상 제품 ID';
    COMMENT ON COLUMN tb_task_type.request_format_version IS '포맷 버전';
    COMMENT ON COLUMN tb_task_type.request_from IS '요청 소스';
    COMMENT ON COLUMN tb_task_type.agent_task_type IS '에이전트용 작업 타입';
    COMMENT ON COLUMN tb_task_type.update_task_result IS '작업 결과 전송 여부';
    COMMENT ON COLUMN tb_task_type.is_correlation_task IS '연계 규칙 대응 여부';
    COMMENT ON COLUMN tb_task_type.task_encoding IS '작업 데이터 인코딩';
    COMMENT ON COLUMN tb_task_type.push_format IS '알림 센터 푸시 포맷';
    COMMENT ON COLUMN tb_task_type.server_context IS '서버 작업';
    COMMENT ON COLUMN tb_task_type.send_product_log IS '연동제품 로그 전송여부';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_task_type' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_task_type ADD CONSTRAINT tb_task_type_pkey PRIMARY KEY (task_type);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_temp_admin';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_temp_admin();
    COMMENT ON TABLE tb_temp_admin IS '다수사용자 등록시 사용하는 테이블';

    ALTER TABLE IF EXISTS tb_temp_admin ADD COLUMN IF NOT EXISTS admin_id text NOT NULL;
    ALTER TABLE IF EXISTS tb_temp_admin ADD COLUMN IF NOT EXISTS name text;
    ALTER TABLE IF EXISTS tb_temp_admin ADD COLUMN IF NOT EXISTS password text;
    ALTER TABLE IF EXISTS tb_temp_admin ADD COLUMN IF NOT EXISTS admin_pwd text;
    ALTER TABLE IF EXISTS tb_temp_admin ADD COLUMN IF NOT EXISTS current_pwd text;
    ALTER TABLE IF EXISTS tb_temp_admin ADD COLUMN IF NOT EXISTS pw_due integer;
    ALTER TABLE IF EXISTS tb_temp_admin ADD COLUMN IF NOT EXISTS connect_ip_range text;
    ALTER TABLE IF EXISTS tb_temp_admin ADD COLUMN IF NOT EXISTS connect_dofw text;
    ALTER TABLE IF EXISTS tb_temp_admin ADD COLUMN IF NOT EXISTS connect_time_start text;
    ALTER TABLE IF EXISTS tb_temp_admin ADD COLUMN IF NOT EXISTS connect_time_end text;
    ALTER TABLE IF EXISTS tb_temp_admin ADD COLUMN IF NOT EXISTS timeout_value integer;
    ALTER TABLE IF EXISTS tb_temp_admin ADD COLUMN IF NOT EXISTS auth_wait_time integer;
    ALTER TABLE IF EXISTS tb_temp_admin ADD COLUMN IF NOT EXISTS privilege_profile_id bigint;
    ALTER TABLE IF EXISTS tb_temp_admin ADD COLUMN IF NOT EXISTS computer_name text;
    ALTER TABLE IF EXISTS tb_temp_admin ADD COLUMN IF NOT EXISTS admin_group text;
    ALTER TABLE IF EXISTS tb_temp_admin ADD COLUMN IF NOT EXISTS email text;
    ALTER TABLE IF EXISTS tb_temp_admin ADD COLUMN IF NOT EXISTS phone text;
    ALTER TABLE IF EXISTS tb_temp_admin ADD COLUMN IF NOT EXISTS description text;
    ALTER TABLE IF EXISTS tb_temp_admin ADD COLUMN IF NOT EXISTS use_otp boolean;
    ALTER TABLE IF EXISTS tb_temp_admin ADD COLUMN IF NOT EXISTS product_auth text;
    ALTER TABLE IF EXISTS tb_temp_admin ADD COLUMN IF NOT EXISTS error_message text;

    COMMENT ON COLUMN tb_temp_admin.admin_id IS '관리자 ID';
    COMMENT ON COLUMN tb_temp_admin.name IS '관리자 명';
    COMMENT ON COLUMN tb_temp_admin.password IS '관리자 패스워드';
    COMMENT ON COLUMN tb_temp_admin.admin_pwd IS '암호화된 관리자 패스워드';
    COMMENT ON COLUMN tb_temp_admin.current_pwd IS '현재 사용중인 패스워드';
    COMMENT ON COLUMN tb_temp_admin.pw_due IS '패스워드 만료 기간';
    COMMENT ON COLUMN tb_temp_admin.connect_ip_range IS '접속 가능 IP 주소 범위';
    COMMENT ON COLUMN tb_temp_admin.connect_dofw IS '접속 가능 요일';
    COMMENT ON COLUMN tb_temp_admin.connect_time_start IS '접속 가능 시작 시간';
    COMMENT ON COLUMN tb_temp_admin.connect_time_end IS '접속 가능 종료 시간';
    COMMENT ON COLUMN tb_temp_admin.timeout_value IS '접속 Timeout 시간';
    COMMENT ON COLUMN tb_temp_admin.auth_wait_time IS '로그인 인증 보류 시간';
    COMMENT ON COLUMN tb_temp_admin.privilege_profile_id IS '관리자 권한 프로필 ID';
    COMMENT ON COLUMN tb_temp_admin.computer_name IS '컴퓨터 이름';
    COMMENT ON COLUMN tb_temp_admin.admin_group IS '관리 대상 그룹';
    COMMENT ON COLUMN tb_temp_admin.email IS 'Email';
    COMMENT ON COLUMN tb_temp_admin.phone IS '관리자 핸드폰';
    COMMENT ON COLUMN tb_temp_admin.description IS '설명';
    COMMENT ON COLUMN tb_temp_admin.use_otp IS 'OTP 사용여부';
    COMMENT ON COLUMN tb_temp_admin.product_auth IS '제품 권한';
    COMMENT ON COLUMN tb_temp_admin.error_message IS '등록전에 관리자 체크후 발생된 에러';
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_upload_file';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_upload_file();
    COMMENT ON TABLE tb_upload_file IS '업로드 파일';

    ALTER TABLE IF EXISTS tb_upload_file ADD COLUMN IF NOT EXISTS file_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_upload_file ADD COLUMN IF NOT EXISTS file_name text;
    ALTER TABLE IF EXISTS tb_upload_file ADD COLUMN IF NOT EXISTS file_uri text;
    ALTER TABLE IF EXISTS tb_upload_file ADD COLUMN IF NOT EXISTS file_size bigint;
    ALTER TABLE IF EXISTS tb_upload_file ADD COLUMN IF NOT EXISTS file_type en_upload_file_type;
    ALTER TABLE IF EXISTS tb_upload_file ADD COLUMN IF NOT EXISTS file_hash text;
    ALTER TABLE IF EXISTS tb_upload_file ADD COLUMN IF NOT EXISTS admin_id text;
    ALTER TABLE IF EXISTS tb_upload_file ADD COLUMN IF NOT EXISTS node_id bigint;
    ALTER TABLE IF EXISTS tb_upload_file ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;
    ALTER TABLE IF EXISTS tb_upload_file ADD COLUMN IF NOT EXISTS task_id bigint;
    ALTER TABLE IF EXISTS tb_upload_file ADD COLUMN IF NOT EXISTS instance_id bigint;
    ALTER TABLE IF EXISTS tb_upload_file ADD COLUMN IF NOT EXISTS collect_time timestamp with time zone;
    ALTER TABLE IF EXISTS tb_upload_file ADD COLUMN IF NOT EXISTS file_create_time timestamp with time zone;
    ALTER TABLE IF EXISTS tb_upload_file ADD COLUMN IF NOT EXISTS file_modify_time timestamp with time zone;
    ALTER TABLE IF EXISTS tb_upload_file ADD COLUMN IF NOT EXISTS file_path text;
    ALTER TABLE IF EXISTS tb_upload_file ADD COLUMN IF NOT EXISTS tz_offset integer;
    ALTER TABLE IF EXISTS tb_upload_file ADD COLUMN IF NOT EXISTS server_id bigint;
    ALTER TABLE IF EXISTS tb_upload_file ADD COLUMN IF NOT EXISTS ahnreport_file_url text;
    ALTER TABLE IF EXISTS tb_upload_file ADD COLUMN IF NOT EXISTS is_removed boolean DEFAULT false;

    COMMENT ON COLUMN tb_upload_file.file_id IS '파일 ID';
    COMMENT ON COLUMN tb_upload_file.file_name IS '파일명';
    COMMENT ON COLUMN tb_upload_file.file_uri IS '파일 URI';
    COMMENT ON COLUMN tb_upload_file.file_size IS '파일 사이즈';
    COMMENT ON COLUMN tb_upload_file.file_type IS '파일 타입';
    COMMENT ON COLUMN tb_upload_file.file_hash IS '파일 해시 값';
    COMMENT ON COLUMN tb_upload_file.admin_id IS '관리자 ID';
    COMMENT ON COLUMN tb_upload_file.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_upload_file.modified_time IS '변경 시각';
    COMMENT ON COLUMN tb_upload_file.task_id IS '작업 ID';
    COMMENT ON COLUMN tb_upload_file.instance_id IS '작업 인스턴스 ID';
    COMMENT ON COLUMN tb_upload_file.collect_time IS '수집 시각';
    COMMENT ON COLUMN tb_upload_file.file_create_time IS '파일 생성 시각';
    COMMENT ON COLUMN tb_upload_file.file_modify_time IS '파일 변경 시각';
    COMMENT ON COLUMN tb_upload_file.file_path IS '파일 경로';
    COMMENT ON COLUMN tb_upload_file.tz_offset IS '시간대';
    COMMENT ON COLUMN tb_upload_file.server_id IS '서버 ID';
    COMMENT ON COLUMN tb_upload_file.ahnreport_file_url IS '안리포트 파일 경로';
    COMMENT ON COLUMN tb_upload_file.is_removed IS '삭제 여부';

    CREATE SEQUENCE IF NOT EXISTS tb_upload_file_file_id_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;

    ALTER SEQUENCE IF EXISTS tb_upload_file_file_id_seq OWNED BY tb_upload_file.file_id;
    ALTER TABLE IF EXISTS ONLY tb_upload_file ALTER COLUMN file_id SET DEFAULT nextval('tb_upload_file_file_id_seq'::regclass);

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_upload_file' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_upload_file ADD CONSTRAINT tb_upload_file_pkey PRIMARY KEY (file_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_user';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_user();
    COMMENT ON TABLE tb_user IS '사용자';

    ALTER TABLE IF EXISTS tb_user ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_user ADD COLUMN IF NOT EXISTS name text;
    ALTER TABLE IF EXISTS tb_user ADD COLUMN IF NOT EXISTS department text;
    ALTER TABLE IF EXISTS tb_user ADD COLUMN IF NOT EXISTS phone text;
    ALTER TABLE IF EXISTS tb_user ADD COLUMN IF NOT EXISTS email text;
    ALTER TABLE IF EXISTS tb_user ADD COLUMN IF NOT EXISTS empno text;
    ALTER TABLE IF EXISTS tb_user ADD COLUMN IF NOT EXISTS description text;
    ALTER TABLE IF EXISTS tb_user ADD COLUMN IF NOT EXISTS modified_by_admin boolean DEFAULT false;

    COMMENT ON COLUMN tb_user.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_user.name IS '사용자 명';
    COMMENT ON COLUMN tb_user.department IS '부서';
    COMMENT ON COLUMN tb_user.phone IS '전화번호';
    COMMENT ON COLUMN tb_user.email IS 'Email';
    COMMENT ON COLUMN tb_user.empno IS '사번';
    COMMENT ON COLUMN tb_user.description IS '설명';
    COMMENT ON COLUMN tb_user.modified_by_admin IS '관리자에 의한 변경 여부';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_user' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_user ADD CONSTRAINT tb_user_pkey PRIMARY KEY (node_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_view_layout';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_view_layout();
    COMMENT ON TABLE tb_view_layout IS '웹 화면 레이아웃';

    ALTER TABLE IF EXISTS tb_view_layout ADD COLUMN IF NOT EXISTS view en_view_type NOT NULL;
    ALTER TABLE IF EXISTS tb_view_layout ADD COLUMN IF NOT EXISTS admin_id text NOT NULL;
    ALTER TABLE IF EXISTS tb_view_layout ADD COLUMN IF NOT EXISTS layout text;

    COMMENT ON COLUMN tb_view_layout.view IS '웹 화면 타입';
    COMMENT ON COLUMN tb_view_layout.admin_id IS '관리자 ID';
    COMMENT ON COLUMN tb_view_layout.layout IS '레이아웃';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_view_layout' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_view_layout ADD CONSTRAINT tb_view_layout_pkey PRIMARY KEY (view, admin_id);
    END IF;
END $$ LANGUAGE 'plpgsql';
------------------------------------------------------------------------------------------
select '## tb_search_field';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_search_field();
    COMMENT ON TABLE tb_search_field IS '검색용 필드';

    ALTER TABLE IF EXISTS tb_search_field ADD COLUMN IF NOT EXISTS document_log_type text NOT NULL;
    ALTER TABLE IF EXISTS tb_search_field ADD COLUMN IF NOT EXISTS field text NOT NULL;
    ALTER TABLE IF EXISTS tb_search_field ADD COLUMN IF NOT EXISTS data_type text NOT NULL;

    COMMENT ON COLUMN tb_search_field.document_log_type IS '로그종류';
    COMMENT ON COLUMN tb_search_field.field IS '필드명';
    COMMENT ON COLUMN tb_search_field.data_type IS '데이터타입';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_search_field' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_search_field ADD CONSTRAINT tb_search_field_pkey PRIMARY KEY (document_log_type, field);
    END IF;
END $$ LANGUAGE 'plpgsql';
------------------------------------------------------------------------------------------
select '## tb_widget';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_widget();
    COMMENT ON TABLE tb_widget IS '사용자 정의 위젯';

    ALTER TABLE IF EXISTS tb_widget ADD COLUMN IF NOT EXISTS widget_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_widget ADD COLUMN IF NOT EXISTS name text;
    ALTER TABLE IF EXISTS tb_widget ADD COLUMN IF NOT EXISTS group_id bigint;
    ALTER TABLE IF EXISTS tb_widget ADD COLUMN IF NOT EXISTS layout text;
    ALTER TABLE IF EXISTS tb_widget ADD COLUMN IF NOT EXISTS correlation_rule_id bigint;
    ALTER TABLE IF EXISTS tb_widget ADD COLUMN IF NOT EXISTS admin_id text;

    COMMENT ON COLUMN tb_widget.widget_id IS '위젯 ID';
    COMMENT ON COLUMN tb_widget.name IS '위젯 명';
    COMMENT ON COLUMN tb_widget.group_id IS '그룹 ID';
    COMMENT ON COLUMN tb_widget.layout IS '레이아웃';
    COMMENT ON COLUMN tb_widget.correlation_rule_id IS '연계 규칙 ID';
    COMMENT ON COLUMN tb_widget.admin_id IS '관리자 ID';

    CREATE SEQUENCE IF NOT EXISTS tb_widget_widget_id_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;

    ALTER SEQUENCE IF EXISTS tb_widget_widget_id_seq OWNED BY tb_widget.widget_id;

    ALTER TABLE IF EXISTS ONLY tb_widget ALTER COLUMN widget_id SET DEFAULT nextval('tb_widget_widget_id_seq'::regclass);

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_widget' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_widget ADD CONSTRAINT tb_widget_pkey PRIMARY KEY (widget_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_widget_item';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_widget_item();
    COMMENT ON TABLE tb_widget_item IS '사용자 정의 위젯 항목';

    ALTER TABLE IF EXISTS tb_widget_item ADD COLUMN IF NOT EXISTS item_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_widget_item ADD COLUMN IF NOT EXISTS widget_item_type en_widget_item_type;
    ALTER TABLE IF EXISTS tb_widget_item ADD COLUMN IF NOT EXISTS widget_id bigint;
    ALTER TABLE IF EXISTS tb_widget_item ADD COLUMN IF NOT EXISTS layout text;
    ALTER TABLE IF EXISTS tb_widget_item ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;

    COMMENT ON COLUMN tb_widget_item.item_id IS '위젯 항목 ID';
    COMMENT ON COLUMN tb_widget_item.widget_item_type IS '위젯 항목 타입';
    COMMENT ON COLUMN tb_widget_item.widget_id IS '위젯 ID';
    COMMENT ON COLUMN tb_widget_item.layout IS '레이아웃';
    COMMENT ON COLUMN tb_widget_item.modified_time IS '변경 시각';

    CREATE SEQUENCE IF NOT EXISTS tb_widget_item_item_id_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;

    ALTER SEQUENCE IF EXISTS tb_widget_item_item_id_seq OWNED BY tb_widget_item.item_id;
    ALTER TABLE IF EXISTS ONLY tb_widget_item ALTER COLUMN item_id SET DEFAULT nextval('tb_widget_item_item_id_seq'::regclass);

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_widget_item' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_widget_item ADD CONSTRAINT tb_widget_item_pkey PRIMARY KEY (item_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_pg_server';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_pg_server();
    COMMENT ON TABLE tb_pg_server IS 'PG 서버';

    ALTER TABLE IF EXISTS tb_pg_server ADD COLUMN IF NOT EXISTS pg_server_id bigint NOT NULL;
    
    ALTER TABLE IF EXISTS tb_pg_server ADD COLUMN IF NOT EXISTS ip inet;
    ALTER TABLE IF EXISTS tb_pg_server ALTER COLUMN ip TYPE TEXT;   -- CWPP-4408 처리

    ALTER TABLE IF EXISTS tb_pg_server ADD COLUMN IF NOT EXISTS port integer;
    ALTER TABLE IF EXISTS tb_pg_server ADD COLUMN IF NOT EXISTS pg_service_status en_pg_service_status;
    ALTER TABLE IF EXISTS tb_pg_server ADD COLUMN IF NOT EXISTS processed_packet integer;
    ALTER TABLE IF EXISTS tb_pg_server ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;


    COMMENT ON COLUMN tb_pg_server.pg_server_id IS 'PG 서버 ID';
    COMMENT ON COLUMN tb_pg_server.ip IS '서버 IP 주소';
    COMMENT ON COLUMN tb_pg_server.port IS '서버 포트';
    COMMENT ON COLUMN tb_pg_server.pg_service_status IS '서비스 상태';
    COMMENT ON COLUMN tb_pg_server.processed_packet IS '처리된 패킷 수';
    COMMENT ON COLUMN tb_pg_server.modified_time IS '변경 시각';

    CREATE SEQUENCE IF NOT EXISTS tb_pg_server_server_id_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;

    ALTER SEQUENCE IF EXISTS tb_pg_server_server_id_seq OWNED BY tb_pg_server.pg_server_id;
    ALTER TABLE IF EXISTS ONLY tb_pg_server ALTER COLUMN pg_server_id SET DEFAULT nextval('tb_pg_server_server_id_seq'::regclass);

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_pg_server' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_pg_server ADD CONSTRAINT tb_pg_server_pkey PRIMARY KEY (pg_server_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_product_info';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_product_info();
    COMMENT ON TABLE tb_product_info IS '노드별 제품 설치 상태';

    ALTER TABLE IF EXISTS tb_product_info ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_product_info ADD COLUMN IF NOT EXISTS product_id en_product_id_type NOT NULL;
    ALTER TABLE IF EXISTS tb_product_info ADD COLUMN IF NOT EXISTS is_managed boolean;
    ALTER TABLE IF EXISTS tb_product_info ADD COLUMN IF NOT EXISTS manager_ip text;
    ALTER TABLE IF EXISTS tb_product_info ADD COLUMN IF NOT EXISTS register_time timestamp with time zone;
    ALTER TABLE IF EXISTS tb_product_info ADD COLUMN IF NOT EXISTS modified_time timestamp with time zone;

    COMMENT ON COLUMN tb_product_info.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_product_info.product_id IS '제품 ID';
    COMMENT ON COLUMN tb_product_info.is_managed IS '관리 여부(true:관리/false:미관리)';
    COMMENT ON COLUMN tb_product_info.manager_ip IS 'CPPM에서 제품 미관리시 해당 제품을 관리하고 있는 다른 서버 아이피';
    COMMENT ON COLUMN tb_product_info.register_time IS '등록 시각';
    COMMENT ON COLUMN tb_product_info.modified_time IS '수정 일시';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_product_info' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_product_info ADD CONSTRAINT tb_product_info_pkey PRIMARY KEY (node_id, product_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_am_file_io_info';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_am_file_io_info();
    COMMENT ON TABLE tb_am_file_io_info IS '파일 I/O 검사 예외 설정';

    ALTER TABLE IF EXISTS tb_am_file_io_info ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_am_file_io_info ADD COLUMN IF NOT EXISTS auto_exclude boolean DEFAULT false;
    ALTER TABLE IF EXISTS tb_am_file_io_info ADD COLUMN IF NOT EXISTS send_time timestamp with time zone;
    ALTER TABLE IF EXISTS tb_am_file_io_info ADD COLUMN IF NOT EXISTS register_time timestamp with time zone;
    ALTER TABLE IF EXISTS tb_am_file_io_info ADD COLUMN IF NOT EXISTS modified_time timestamp with time zone DEFAULT now();

    COMMENT ON COLUMN tb_am_file_io_info.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_am_file_io_info.auto_exclude IS '파일 I/O 분석 검사 예외 자동 등록 여부';
    COMMENT ON COLUMN tb_am_file_io_info.send_time IS '파일 I/O 분석 검사 예외 전달 날짜 (UTC)';
    COMMENT ON COLUMN tb_am_file_io_info.register_time IS '검사 예외 등록 시간 (UTC, 등록 해제되면 NULL)';
    COMMENT ON COLUMN tb_am_file_io_info.modified_time IS '변경 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_am_file_io_info' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_am_file_io_info ADD CONSTRAINT tb_am_file_io_info_pkey PRIMARY KEY (node_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_am_file_io_exclude_item';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_am_file_io_exclude_item();
    COMMENT ON TABLE tb_am_file_io_exclude_item IS '파일 I/O 실시간 검사 예외 항목';

    ALTER TABLE IF EXISTS tb_am_file_io_exclude_item ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_am_file_io_exclude_item ADD COLUMN IF NOT EXISTS rank integer NOT NULL;
    ALTER TABLE IF EXISTS tb_am_file_io_exclude_item ADD COLUMN IF NOT EXISTS item_type text;
    ALTER TABLE IF EXISTS tb_am_file_io_exclude_item ADD COLUMN IF NOT EXISTS path text;
    ALTER TABLE IF EXISTS tb_am_file_io_exclude_item ADD COLUMN IF NOT EXISTS io_count bigint DEFAULT 0;
    ALTER TABLE IF EXISTS tb_am_file_io_exclude_item ADD COLUMN IF NOT EXISTS modified_time timestamp with time zone DEFAULT now();

    COMMENT ON COLUMN tb_am_file_io_exclude_item.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_am_file_io_exclude_item.rank IS '순위';
    COMMENT ON COLUMN tb_am_file_io_exclude_item.item_type IS '항목 유형 (dir/process)';
    COMMENT ON COLUMN tb_am_file_io_exclude_item.path IS '경로';
    COMMENT ON COLUMN tb_am_file_io_exclude_item.io_count IS 'I/O 횟수';
    COMMENT ON COLUMN tb_am_file_io_exclude_item.modified_time IS '변경 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_am_file_io_exclude_item' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_am_file_io_exclude_item ADD CONSTRAINT tb_am_file_io_exclude_item_pkey PRIMARY KEY (node_id, rank);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_product_server';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_product_server();
    COMMENT ON TABLE tb_product_server IS '제품별 서버';

    ALTER TABLE IF EXISTS tb_product_server ADD COLUMN IF NOT EXISTS product_group en_product_group_type NOT NULL;

    ALTER TABLE IF EXISTS tb_product_server ADD COLUMN IF NOT EXISTS ip inet;
    ALTER TABLE IF EXISTS tb_product_server ALTER COLUMN ip TYPE TEXT;   -- CWPP-4408 처리

    ALTER TABLE IF EXISTS tb_product_server ADD COLUMN IF NOT EXISTS port integer;
    ALTER TABLE IF EXISTS tb_product_server ADD COLUMN IF NOT EXISTS is_used boolean;
    ALTER TABLE IF EXISTS tb_product_server ADD COLUMN IF NOT EXISTS admin_id text;
    ALTER TABLE IF EXISTS tb_product_server ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;

    COMMENT ON COLUMN tb_product_server.product_group IS '제품 그룹';
    COMMENT ON COLUMN tb_product_server.ip IS '서버 IP 주소';
    COMMENT ON COLUMN tb_product_server.port IS '서버 포트';
    COMMENT ON COLUMN tb_product_server.is_used IS '사용 여부';
    COMMENT ON COLUMN tb_product_server.admin_id IS '관리자 ID';
    COMMENT ON COLUMN tb_product_server.modified_time IS '변경 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_product_server' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_product_server ADD CONSTRAINT tb_product_server_pkey PRIMARY KEY (product_group);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_extra_policy_detail_format';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_extra_policy_detail_format();
    COMMENT ON TABLE tb_extra_policy_detail_format IS '추가 정책 상세 포맷';

    ALTER TABLE IF EXISTS tb_extra_policy_detail_format ADD COLUMN IF NOT EXISTS product_feature_id en_product_feature_id_type NOT NULL;
    ALTER TABLE IF EXISTS tb_extra_policy_detail_format ADD COLUMN IF NOT EXISTS extra_policy_detail en_extra_policy_detail_type NOT NULL;
    ALTER TABLE IF EXISTS tb_extra_policy_detail_format ADD COLUMN IF NOT EXISTS policy_format en_policy_format;
    ALTER TABLE IF EXISTS tb_extra_policy_detail_format ADD COLUMN IF NOT EXISTS online_policy_format text;
    ALTER TABLE IF EXISTS tb_extra_policy_detail_format ADD COLUMN IF NOT EXISTS offline_policy_format text;

    COMMENT ON COLUMN tb_extra_policy_detail_format.product_feature_id IS '제품 기능 ID';
    COMMENT ON COLUMN tb_extra_policy_detail_format.extra_policy_detail IS '상세 타입';
    COMMENT ON COLUMN tb_extra_policy_detail_format.policy_format IS '정책 포맷';
    COMMENT ON COLUMN tb_extra_policy_detail_format.online_policy_format IS '온라인 정책 포맷';
    COMMENT ON COLUMN tb_extra_policy_detail_format.offline_policy_format IS '오프라인 정책 포맷';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_extra_policy_detail_format' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_extra_policy_detail_format ADD CONSTRAINT tb_extra_policy_detail_format_pkey PRIMARY KEY (product_feature_id, extra_policy_detail);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_product_group_info';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_product_group_info();
    COMMENT ON TABLE tb_product_group_info IS '제품 그룹 인증 정보';

    ALTER TABLE IF EXISTS tb_product_group_info ADD COLUMN IF NOT EXISTS  product_group en_product_group_type;
    ALTER TABLE IF EXISTS tb_product_group_info ADD COLUMN IF NOT EXISTS  watch_info boolean DEFAULT false;

    COMMENT ON COLUMN tb_product_group_info.product_group IS '제품 그룹';
    COMMENT ON COLUMN tb_product_group_info.watch_info IS '인증 정보';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_product_group_info' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_product_group_info ADD CONSTRAINT tb_product_group_info_pkey PRIMARY KEY (product_group);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_product_group_exclude_platform';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_product_group_exclude_platform();
    COMMENT ON TABLE tb_product_group_exclude_platform IS '제품 그룹 제외 플랫폼 정보';

    ALTER TABLE IF EXISTS tb_product_group_exclude_platform ADD COLUMN IF NOT EXISTS product_group en_product_group_type;
    ALTER TABLE IF EXISTS tb_product_group_exclude_platform ADD COLUMN IF NOT EXISTS platform_group en_platform_id_type;

    COMMENT ON COLUMN tb_product_group_exclude_platform.product_group IS '제품 그룹';
    COMMENT ON COLUMN tb_product_group_exclude_platform.platform_group IS '운영체제 그룹';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_product_group_exclude_platform' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_product_group_exclude_platform ADD CONSTRAINT tb_product_group_exclude_platform_pkey PRIMARY KEY (product_group, platform_group);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_base_report_status';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_base_report_status();
    COMMENT ON TABLE tb_base_report_status IS '기본보고서 생성결과 버전관리';

    ALTER TABLE IF EXISTS tb_base_report_status ADD COLUMN IF NOT EXISTS base_report_id en_base_report_id_type NOT NULL;
    ALTER TABLE IF EXISTS tb_base_report_status ADD COLUMN IF NOT EXISTS version integer NOT NULL;

    COMMENT ON COLUMN tb_base_report_status.base_report_id IS '기본 보고서 ID';
    COMMENT ON COLUMN tb_base_report_status.version IS '버전';
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_policy_backup_backup_id_seq';
DO $$
BEGIN
    CREATE SEQUENCE IF NOT EXISTS tb_policy_backup_backup_id_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;

    CREATE TABLE IF NOT EXISTS tb_policy_backup();
    COMMENT ON TABLE tb_policy_backup IS '정책 백업';

    ALTER TABLE IF EXISTS tb_policy_backup ADD COLUMN IF NOT EXISTS backup_id bigint DEFAULT nextval('tb_policy_backup_backup_id_seq'::regclass) NOT NULL;
    ALTER TABLE IF EXISTS tb_policy_backup ADD COLUMN IF NOT EXISTS policy_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_policy_backup ADD COLUMN IF NOT EXISTS product_feature_id en_product_feature_id_type;
    ALTER TABLE IF EXISTS tb_policy_backup ADD COLUMN IF NOT EXISTS policy_type en_policy_type;
    ALTER TABLE IF EXISTS tb_policy_backup ADD COLUMN IF NOT EXISTS ppolicy_id bigint;
    ALTER TABLE IF EXISTS tb_policy_backup ADD COLUMN IF NOT EXISTS name text;
    ALTER TABLE IF EXISTS tb_policy_backup ADD COLUMN IF NOT EXISTS description text;
    ALTER TABLE IF EXISTS tb_policy_backup ADD COLUMN IF NOT EXISTS online_policy_body text;
    ALTER TABLE IF EXISTS tb_policy_backup ADD COLUMN IF NOT EXISTS offline_policy_body text;
    ALTER TABLE IF EXISTS tb_policy_backup ADD COLUMN IF NOT EXISTS use_offline_policy boolean;
    ALTER TABLE IF EXISTS tb_policy_backup ADD COLUMN IF NOT EXISTS hash text;
    ALTER TABLE IF EXISTS tb_policy_backup ADD COLUMN IF NOT EXISTS modified_time timestamp;
    ALTER TABLE IF EXISTS tb_policy_backup ADD COLUMN IF NOT EXISTS backup_time timestamp;

    COMMENT ON COLUMN tb_policy_backup.backup_id IS '백업 ID';
    COMMENT ON COLUMN tb_policy_backup.policy_id IS '정책 ID';
    COMMENT ON COLUMN tb_policy_backup.product_feature_id IS '제품 기능 ID';
    COMMENT ON COLUMN tb_policy_backup.policy_type IS '기본 정책 여부';
    COMMENT ON COLUMN tb_policy_backup.ppolicy_id IS '상위 정책 ID';
    COMMENT ON COLUMN tb_policy_backup.name IS '정책 명';
    COMMENT ON COLUMN tb_policy_backup.description IS '설명';
    COMMENT ON COLUMN tb_policy_backup.online_policy_body IS '온라인 정책 내용';
    COMMENT ON COLUMN tb_policy_backup.offline_policy_body IS '오프라인 정책 내용';
    COMMENT ON COLUMN tb_policy_backup.use_offline_policy IS '오프라인 정책 사용 여부';
    COMMENT ON COLUMN tb_policy_backup.hash IS '해시';
    COMMENT ON COLUMN tb_policy_backup.modified_time IS '변경 시각';
    COMMENT ON COLUMN tb_policy_backup.backup_time IS '백업 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_policy_backup' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_policy_backup ADD CONSTRAINT tb_policy_backup_pkey PRIMARY KEY (backup_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_atip_config';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_atip_config();
    COMMENT ON TABLE tb_atip_config IS 'ATI 서버 정보';

    ALTER TABLE IF EXISTS tb_atip_config ADD COLUMN IF NOT EXISTS server_type text NOT NULL;
    ALTER TABLE IF EXISTS tb_atip_config ADD COLUMN IF NOT EXISTS access_key text NULL;
    ALTER TABLE IF EXISTS tb_atip_config ADD COLUMN IF NOT EXISTS conceal_key text NULL;
    ALTER TABLE IF EXISTS tb_atip_config ADD COLUMN IF NOT EXISTS is_use bool NOT NULL DEFAULT false;
    ALTER TABLE IF EXISTS tb_atip_config ADD COLUMN IF NOT EXISTS modified_time timestamptz NOT NULL;

    COMMENT ON COLUMN tb_atip_config.server_type IS 'Server Type';
    COMMENT ON COLUMN tb_atip_config.access_key IS 'Access Key';
    COMMENT ON COLUMN tb_atip_config.conceal_key IS 'Conceal Key';
    COMMENT ON COLUMN tb_atip_config.is_use IS 'TI 연동 사용 여부';
    COMMENT ON COLUMN tb_atip_config.modified_time IS '변경 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_atip_config' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS tb_atip_config ADD CONSTRAINT tb_atip_config_pk PRIMARY KEY (server_type);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_cloud_account_aws';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_cloud_account_aws();
    COMMENT ON TABLE tb_cloud_account_aws IS 'AWS 계정';

    ALTER TABLE IF EXISTS tb_cloud_account_aws ADD COLUMN IF NOT EXISTS aws_id bigserial NOT NULL; -- AWS ID
    ALTER TABLE IF EXISTS tb_cloud_account_aws ADD COLUMN IF NOT EXISTS account_id int8 NOT NULL; -- Account ID
    ALTER TABLE IF EXISTS tb_cloud_account_aws ADD COLUMN IF NOT EXISTS conceal_key text NULL; -- conceal Key
    ALTER TABLE IF EXISTS tb_cloud_account_aws ADD COLUMN IF NOT EXISTS access_key text NULL; -- Access Key
    ALTER TABLE IF EXISTS tb_cloud_account_aws ADD COLUMN IF NOT EXISTS secret_key text NULL; -- Secret Key
    ALTER TABLE IF EXISTS tb_cloud_account_aws ADD COLUMN IF NOT EXISTS description text NULL; -- 설명
    ALTER TABLE IF EXISTS tb_cloud_account_aws ADD COLUMN IF NOT EXISTS connection_status bool NULL DEFAULT false; -- 연결 상태
    ALTER TABLE IF EXISTS tb_cloud_account_aws ADD COLUMN IF NOT EXISTS modified_time timestamp NULL; -- 변경 시각

    COMMENT ON COLUMN tb_cloud_account_aws.aws_id IS 'AWS ID';
    COMMENT ON COLUMN tb_cloud_account_aws.account_id IS 'Account ID';
    COMMENT ON COLUMN tb_cloud_account_aws.conceal_key IS 'Conceal Key';
    COMMENT ON COLUMN tb_cloud_account_aws.access_key IS 'Access Key';
    COMMENT ON COLUMN tb_cloud_account_aws.secret_key IS 'Secret Key';
    COMMENT ON COLUMN tb_cloud_account_aws.description IS '설명';
    COMMENT ON COLUMN tb_cloud_account_aws.connection_status IS '연결 상태';
    COMMENT ON COLUMN tb_cloud_account_aws.modified_time IS '변경 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_cloud_account_aws' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS tb_cloud_account_aws ADD CONSTRAINT tb_cloud_account_aws_pk PRIMARY KEY (aws_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_cloud_account_aws' and constraint_name = 'tb_cloud_account_aws_un' AND constraint_type = 'UNIQUE') THEN
        ALTER TABLE IF EXISTS tb_cloud_account_aws ADD CONSTRAINT tb_cloud_account_aws_un UNIQUE (account_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_cloud_account_azure';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_cloud_account_azure();
    COMMENT ON TABLE tb_cloud_account_azure IS 'Azure 계정';

    ALTER TABLE IF EXISTS tb_cloud_account_azure ADD COLUMN IF NOT EXISTS azure_id bigserial NOT NULL; -- Azure ID
    ALTER TABLE IF EXISTS tb_cloud_account_azure ADD COLUMN IF NOT EXISTS subscription_id text NOT NULL; -- Subscription ID
    ALTER TABLE IF EXISTS tb_cloud_account_azure ADD COLUMN IF NOT EXISTS active_directory_id text NULL; -- Active Directory ID(Tenant ID)
    ALTER TABLE IF EXISTS tb_cloud_account_azure ADD COLUMN IF NOT EXISTS application_id text NULL; -- Application ID(Client ID)
    ALTER TABLE IF EXISTS tb_cloud_account_azure ADD COLUMN IF NOT EXISTS conceal_key text NULL; -- Conceal Key(Conceal Key)
    ALTER TABLE IF EXISTS tb_cloud_account_azure ADD COLUMN IF NOT EXISTS application_password text NULL; -- Application Password(Client Secret)
    ALTER TABLE IF EXISTS tb_cloud_account_azure ADD COLUMN IF NOT EXISTS description text NULL; -- 설명
    ALTER TABLE IF EXISTS tb_cloud_account_azure ADD COLUMN IF NOT EXISTS connection_status bool NULL DEFAULT false; -- 연결 상태
    ALTER TABLE IF EXISTS tb_cloud_account_azure ADD COLUMN IF NOT EXISTS modified_time timestamp NULL DEFAULT now(); -- 변경 시각

    COMMENT ON COLUMN tb_cloud_account_azure.azure_id IS 'Azure ID';
    COMMENT ON COLUMN tb_cloud_account_azure.subscription_id IS 'Subscription ID';
    COMMENT ON COLUMN tb_cloud_account_azure.active_directory_id IS 'Active Directory ID(Tenant ID)';
    COMMENT ON COLUMN tb_cloud_account_azure.application_id IS 'Application ID(Client ID)';
    COMMENT ON COLUMN tb_cloud_account_azure.conceal_key IS 'Conceal Key(Conceal Key)';
    COMMENT ON COLUMN tb_cloud_account_azure.application_password IS 'Application Password(Client Secret)';
    COMMENT ON COLUMN tb_cloud_account_azure.description IS '설명';
    COMMENT ON COLUMN tb_cloud_account_azure.connection_status IS '연결 상태';
    COMMENT ON COLUMN tb_cloud_account_azure.modified_time IS '변경 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_cloud_account_azure' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS tb_cloud_account_azure ADD CONSTRAINT tb_cloud_account_azure_pk PRIMARY KEY (azure_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_cloud_account_azure' and constraint_name = 'tb_cloud_account_azure_un' AND constraint_type = 'UNIQUE') THEN
        ALTER TABLE IF EXISTS tb_cloud_account_azure ADD CONSTRAINT tb_cloud_account_azure_un UNIQUE (subscription_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_cloud_account_alibaba';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_cloud_account_alibaba();
    COMMENT ON TABLE tb_cloud_account_alibaba IS 'alibaba 계정';

    ALTER TABLE IF EXISTS tb_cloud_account_alibaba ADD COLUMN IF NOT EXISTS alibaba_id bigserial NOT NULL; -- alibaba ID
    ALTER TABLE IF EXISTS tb_cloud_account_alibaba ADD COLUMN IF NOT EXISTS account_id text NULL; -- Access Key Id
    ALTER TABLE IF EXISTS tb_cloud_account_alibaba ADD COLUMN IF NOT EXISTS access_key_id text NULL; -- Access Key Id
    ALTER TABLE IF EXISTS tb_cloud_account_alibaba ADD COLUMN IF NOT EXISTS conceal_key text NULL; -- conceal_key
    ALTER TABLE IF EXISTS tb_cloud_account_alibaba ADD COLUMN IF NOT EXISTS access_key_secret text NULL; -- Access Key Secret
    ALTER TABLE IF EXISTS tb_cloud_account_alibaba ADD COLUMN IF NOT EXISTS description text NULL; -- 설명
    ALTER TABLE IF EXISTS tb_cloud_account_alibaba ADD COLUMN IF NOT EXISTS connection_status bool NULL DEFAULT false; -- 연결 상태
    ALTER TABLE IF EXISTS tb_cloud_account_alibaba ADD COLUMN IF NOT EXISTS modified_time timestamp NULL; -- 변경 시각

    COMMENT ON COLUMN tb_cloud_account_alibaba.alibaba_id IS 'Alibaba ID';
    COMMENT ON COLUMN tb_cloud_account_alibaba.account_id IS 'Account Id';
    COMMENT ON COLUMN tb_cloud_account_alibaba.access_key_id IS 'Access Key Id';
    COMMENT ON COLUMN tb_cloud_account_alibaba.conceal_key IS 'Conceal_key';
    COMMENT ON COLUMN tb_cloud_account_alibaba.access_key_secret IS 'Access Key Secret';
    COMMENT ON COLUMN tb_cloud_account_alibaba.description IS '설명';
    COMMENT ON COLUMN tb_cloud_account_alibaba.connection_status IS '연결 상태';
    COMMENT ON COLUMN tb_cloud_account_alibaba.modified_time IS '변경 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_cloud_account_alibaba' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS tb_cloud_account_alibaba ADD CONSTRAINT tb_cloud_account_alibaba_pk PRIMARY KEY (alibaba_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_cloud_account_alibaba' and constraint_name = 'tb_cloud_account_alibaba_un' AND constraint_type = 'UNIQUE') THEN
        ALTER TABLE IF EXISTS tb_cloud_account_alibaba ADD CONSTRAINT tb_cloud_account_alibaba_un UNIQUE (account_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

-------------------------------------------------
select '## tb_cloud_aws_instance';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_cloud_aws_instance();
    COMMENT ON TABLE tb_cloud_aws_instance IS 'AWS 인스턴스 정보 수집';

    ALTER TABLE IF EXISTS tb_cloud_aws_instance ADD COLUMN IF NOT EXISTS aws_ec2_id bigserial NOT NULL; -- AWS EC2 정보 수집 ID
    ALTER TABLE IF EXISTS tb_cloud_aws_instance ADD COLUMN IF NOT EXISTS aws_id int8 NOT NULL; -- AWS ID
    ALTER TABLE IF EXISTS tb_cloud_aws_instance ADD COLUMN IF NOT EXISTS account_id int8 NOT NULL; -- Account ID
    ALTER TABLE IF EXISTS tb_cloud_aws_instance ADD COLUMN IF NOT EXISTS region_name text NULL; -- Region Name
    ALTER TABLE IF EXISTS tb_cloud_aws_instance ADD COLUMN IF NOT EXISTS region_description text NULL; -- Region Description
    ALTER TABLE IF EXISTS tb_cloud_aws_instance ADD COLUMN IF NOT EXISTS name text NULL; -- Instance Name
    ALTER TABLE IF EXISTS tb_cloud_aws_instance ADD COLUMN IF NOT EXISTS instance_id text NULL; -- Instance ID
    ALTER TABLE IF EXISTS tb_cloud_aws_instance ADD COLUMN IF NOT EXISTS ami_id text NULL; -- AMI ID
    ALTER TABLE IF EXISTS tb_cloud_aws_instance ADD COLUMN IF NOT EXISTS platform text NULL; -- Platform
    ALTER TABLE IF EXISTS tb_cloud_aws_instance ADD COLUMN IF NOT EXISTS private_ip inet NULL; -- Private IP
    ALTER TABLE IF EXISTS tb_cloud_aws_instance ADD COLUMN IF NOT EXISTS public_ip inet NULL; -- Public IP
    ALTER TABLE IF EXISTS tb_cloud_aws_instance ADD COLUMN IF NOT EXISTS private_dns text NULL; -- Private DNS
    ALTER TABLE IF EXISTS tb_cloud_aws_instance ADD COLUMN IF NOT EXISTS public_dns text NULL; -- Public DNS
    ALTER TABLE IF EXISTS tb_cloud_aws_instance ADD COLUMN IF NOT EXISTS availability_zone text NULL; -- Availability Zone
    ALTER TABLE IF EXISTS tb_cloud_aws_instance ADD COLUMN IF NOT EXISTS security_group json NULL; -- Security Group
    ALTER TABLE IF EXISTS tb_cloud_aws_instance ADD COLUMN IF NOT EXISTS vpc_id text NULL; -- VPC ID
    ALTER TABLE IF EXISTS tb_cloud_aws_instance ADD COLUMN IF NOT EXISTS vpc_name_tag text NULL; -- VPC Name Tag
    ALTER TABLE IF EXISTS tb_cloud_aws_instance ADD COLUMN IF NOT EXISTS subnet_id text NULL; -- Subnet ID
    ALTER TABLE IF EXISTS tb_cloud_aws_instance ADD COLUMN IF NOT EXISTS subnet_name_tag text NULL; -- Subnet Name Tag
    ALTER TABLE IF EXISTS tb_cloud_aws_instance ADD COLUMN IF NOT EXISTS type text NULL; -- Instance Type
    ALTER TABLE IF EXISTS tb_cloud_aws_instance ADD COLUMN IF NOT EXISTS state text NULL; -- State
    ALTER TABLE IF EXISTS tb_cloud_aws_instance ADD COLUMN IF NOT EXISTS virtualization_type text NULL; -- Virtualization Type
    ALTER TABLE IF EXISTS tb_cloud_aws_instance ADD COLUMN IF NOT EXISTS key_name text NULL; -- Key Name
    ALTER TABLE IF EXISTS tb_cloud_aws_instance ADD COLUMN IF NOT EXISTS monitoring text NULL; -- Monitoring
    ALTER TABLE IF EXISTS tb_cloud_aws_instance ADD COLUMN IF NOT EXISTS modified_time timestamp NULL; -- 변경 시각

    COMMENT ON COLUMN tb_cloud_aws_instance.aws_ec2_id IS 'AWS EC2 정보 수집 ID';
    COMMENT ON COLUMN tb_cloud_aws_instance.aws_id IS 'AWS ID';
    COMMENT ON COLUMN tb_cloud_aws_instance.account_id IS 'Account ID';
    COMMENT ON COLUMN tb_cloud_aws_instance.region_name IS 'Region Name';
    COMMENT ON COLUMN tb_cloud_aws_instance.region_description IS 'Region Description';
    COMMENT ON COLUMN tb_cloud_aws_instance.name IS 'Instance Name';
    COMMENT ON COLUMN tb_cloud_aws_instance.instance_id IS 'Instance ID';
    COMMENT ON COLUMN tb_cloud_aws_instance.ami_id IS 'AMI ID';
    COMMENT ON COLUMN tb_cloud_aws_instance.platform IS 'Platform';
    COMMENT ON COLUMN tb_cloud_aws_instance.private_ip IS 'Private IP';
    COMMENT ON COLUMN tb_cloud_aws_instance.public_ip IS 'Public IP';
    COMMENT ON COLUMN tb_cloud_aws_instance.private_dns IS 'Private DNS';
    COMMENT ON COLUMN tb_cloud_aws_instance.public_dns IS 'Public DNS';
    COMMENT ON COLUMN tb_cloud_aws_instance.availability_zone IS 'Availability Zone';
    COMMENT ON COLUMN tb_cloud_aws_instance.security_group IS 'Security Group';
    COMMENT ON COLUMN tb_cloud_aws_instance.vpc_id IS 'VPC ID';
    COMMENT ON COLUMN tb_cloud_aws_instance.vpc_name_tag IS 'VPC Name Tag';
    COMMENT ON COLUMN tb_cloud_aws_instance.subnet_id IS 'Subnet ID';
    COMMENT ON COLUMN tb_cloud_aws_instance.subnet_name_tag IS 'Subnet Name Tag';
    COMMENT ON COLUMN tb_cloud_aws_instance.type IS 'Instance Type';
    COMMENT ON COLUMN tb_cloud_aws_instance.state IS 'State';
    COMMENT ON COLUMN tb_cloud_aws_instance.virtualization_type IS 'Virtualization Type';
    COMMENT ON COLUMN tb_cloud_aws_instance.key_name IS 'Key Name';
    COMMENT ON COLUMN tb_cloud_aws_instance.monitoring IS 'Monitoring';
    COMMENT ON COLUMN tb_cloud_aws_instance.modified_time IS '변경 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_cloud_aws_instance' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS tb_cloud_aws_instance ADD CONSTRAINT tb_cloud_aws_instance_pk PRIMARY KEY (aws_ec2_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_cloud_azure_vm';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_cloud_azure_vm();
    COMMENT ON TABLE tb_cloud_azure_vm IS 'Azure VM 정보 수집';

    ALTER TABLE IF EXISTS tb_cloud_azure_vm ADD COLUMN IF NOT EXISTS azure_vm_id bigserial NOT NULL; -- Azure VM 정보 수집 ID
    ALTER TABLE IF EXISTS tb_cloud_azure_vm ADD COLUMN IF NOT EXISTS azure_id int8 NOT NULL; -- Azure ID
    ALTER TABLE IF EXISTS tb_cloud_azure_vm ADD COLUMN IF NOT EXISTS subscription_id text NOT NULL; -- Subscription Id
    ALTER TABLE IF EXISTS tb_cloud_azure_vm ADD COLUMN IF NOT EXISTS subscription_name text NULL; -- Subscription Name
    ALTER TABLE IF EXISTS tb_cloud_azure_vm ADD COLUMN IF NOT EXISTS resource_group_name text NOT NULL; -- Resource Group Name
    ALTER TABLE IF EXISTS tb_cloud_azure_vm ADD COLUMN IF NOT EXISTS region text NOT NULL; -- Region
    ALTER TABLE IF EXISTS tb_cloud_azure_vm ADD COLUMN IF NOT EXISTS vm_id text NOT NULL; -- VM ID
    ALTER TABLE IF EXISTS tb_cloud_azure_vm ADD COLUMN IF NOT EXISTS vm_name text NULL; -- VM Name
    ALTER TABLE IF EXISTS tb_cloud_azure_vm ADD COLUMN IF NOT EXISTS "key" text NULL; -- Key
    ALTER TABLE IF EXISTS tb_cloud_azure_vm ADD COLUMN IF NOT EXISTS power_status text NULL; -- Power Status
    ALTER TABLE IF EXISTS tb_cloud_azure_vm ADD COLUMN IF NOT EXISTS provisioning_status text NULL; -- Provisioning Status
    ALTER TABLE IF EXISTS tb_cloud_azure_vm ADD COLUMN IF NOT EXISTS os_type text NULL; -- OS Type
    ALTER TABLE IF EXISTS tb_cloud_azure_vm ADD COLUMN IF NOT EXISTS os_name text NULL; -- OS Name
    ALTER TABLE IF EXISTS tb_cloud_azure_vm ADD COLUMN IF NOT EXISTS disk_size int4 NULL; -- disk size(GB)
    ALTER TABLE IF EXISTS tb_cloud_azure_vm ADD COLUMN IF NOT EXISTS vm_size_type text NULL; -- vm size type
    ALTER TABLE IF EXISTS tb_cloud_azure_vm ADD COLUMN IF NOT EXISTS subnet_name text NULL; -- Subnet
    ALTER TABLE IF EXISTS tb_cloud_azure_vm ADD COLUMN IF NOT EXISTS network_security_group_name text NULL; -- Network Security Group
    ALTER TABLE IF EXISTS tb_cloud_azure_vm ADD COLUMN IF NOT EXISTS public_ip inet NULL; -- Public IP
    ALTER TABLE IF EXISTS tb_cloud_azure_vm ADD COLUMN IF NOT EXISTS private_ip inet NULL; -- Private IP
    ALTER TABLE IF EXISTS tb_cloud_azure_vm ADD COLUMN IF NOT EXISTS modified_time timestamp NOT NULL; -- 변경 시각

    COMMENT ON COLUMN tb_cloud_azure_vm.azure_vm_id IS 'Azure VM 정보 수집 ID';
    COMMENT ON COLUMN tb_cloud_azure_vm.azure_id IS 'Azure ID';
    COMMENT ON COLUMN tb_cloud_azure_vm.subscription_id IS 'Subscription Id';
    COMMENT ON COLUMN tb_cloud_azure_vm.subscription_name IS 'Subscription Name';
    COMMENT ON COLUMN tb_cloud_azure_vm.resource_group_name IS 'Resource Group Name';
    COMMENT ON COLUMN tb_cloud_azure_vm.region IS 'Region';
    COMMENT ON COLUMN tb_cloud_azure_vm.vm_id IS 'VM ID';
    COMMENT ON COLUMN tb_cloud_azure_vm.vm_name IS 'VM Name';
    COMMENT ON COLUMN tb_cloud_azure_vm."key" IS 'Key';
    COMMENT ON COLUMN tb_cloud_azure_vm.power_status IS 'Power Status';
    COMMENT ON COLUMN tb_cloud_azure_vm.provisioning_status IS 'Provisioning Status';
    COMMENT ON COLUMN tb_cloud_azure_vm.os_type IS 'OS Type';
    COMMENT ON COLUMN tb_cloud_azure_vm.os_name IS 'OS Name';
    COMMENT ON COLUMN tb_cloud_azure_vm.disk_size IS 'disk size(GB)';
    COMMENT ON COLUMN tb_cloud_azure_vm.vm_size_type IS 'vm size type';
    COMMENT ON COLUMN tb_cloud_azure_vm.subnet_name IS 'Subnet';
    COMMENT ON COLUMN tb_cloud_azure_vm.network_security_group_name IS 'Network Security Group';
    COMMENT ON COLUMN tb_cloud_azure_vm.public_ip IS 'Public IP';
    COMMENT ON COLUMN tb_cloud_azure_vm.private_ip IS 'Private IP';
    COMMENT ON COLUMN tb_cloud_azure_vm.modified_time IS '변경 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_cloud_azure_vm' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS tb_cloud_azure_vm ADD CONSTRAINT tb_cloud_azure_vm_pk PRIMARY KEY (azure_vm_id);
    END IF;

END $$ LANGUAGE 'plpgsql';
------------------------------------------------------------------------------------------
select '## tb_cloud_alibaba_instance';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_cloud_alibaba_instance();
    COMMENT ON TABLE tb_cloud_alibaba_instance IS 'alibaba 인스턴스 정보 수집';

    ALTER TABLE IF EXISTS tb_cloud_alibaba_instance ADD COLUMN IF NOT EXISTS alibaba_ecs_id bigserial NOT NULL; -- alibaba ecs 정보 수집 ID
    ALTER TABLE IF EXISTS tb_cloud_alibaba_instance ADD COLUMN IF NOT EXISTS alibaba_id bigserial NOT NULL; -- alibaba ID
    ALTER TABLE IF EXISTS tb_cloud_alibaba_instance ADD COLUMN IF NOT EXISTS account_id text NOT NULL; -- Account ID
    ALTER TABLE IF EXISTS tb_cloud_alibaba_instance ADD COLUMN IF NOT EXISTS region_id text NULL; -- Region id
    ALTER TABLE IF EXISTS tb_cloud_alibaba_instance ADD COLUMN IF NOT EXISTS region_description text NULL; -- Region Description
    ALTER TABLE IF EXISTS tb_cloud_alibaba_instance ADD COLUMN IF NOT EXISTS zone_id text NULL; -- Zone id
    ALTER TABLE IF EXISTS tb_cloud_alibaba_instance ADD COLUMN IF NOT EXISTS instance_name text NULL; -- Instance Name
    ALTER TABLE IF EXISTS tb_cloud_alibaba_instance ADD COLUMN IF NOT EXISTS instance_id text NULL; -- Instance ID
    ALTER TABLE IF EXISTS tb_cloud_alibaba_instance ADD COLUMN IF NOT EXISTS instance_type text NULL; -- Instance Type
    ALTER TABLE IF EXISTS tb_cloud_alibaba_instance ADD COLUMN IF NOT EXISTS image_id text NULL; -- Image Id
    ALTER TABLE IF EXISTS tb_cloud_alibaba_instance ADD COLUMN IF NOT EXISTS os_type text NULL; -- OS Type
    ALTER TABLE IF EXISTS tb_cloud_alibaba_instance ADD COLUMN IF NOT EXISTS private_ip text NULL; -- Private IP
    ALTER TABLE IF EXISTS tb_cloud_alibaba_instance ADD COLUMN IF NOT EXISTS public_ip text NULL; -- Public IP
    ALTER TABLE IF EXISTS tb_cloud_alibaba_instance ADD COLUMN IF NOT EXISTS security_group_info text NULL; -- Security GROUP INFO
    ALTER TABLE IF EXISTS tb_cloud_alibaba_instance ADD COLUMN IF NOT EXISTS vpc_id text NULL; -- VPC ID
    ALTER TABLE IF EXISTS tb_cloud_alibaba_instance ADD COLUMN IF NOT EXISTS v_switch_id text NULL; -- V Switch Id
    ALTER TABLE IF EXISTS tb_cloud_alibaba_instance ADD COLUMN IF NOT EXISTS nat_ip_address text NULL; -- Nat Ip Address
    ALTER TABLE IF EXISTS tb_cloud_alibaba_instance ADD COLUMN IF NOT EXISTS status text NULL; -- Status
    ALTER TABLE IF EXISTS tb_cloud_alibaba_instance ADD COLUMN IF NOT EXISTS modified_time timestamp NULL; -- 변경 시각

    COMMENT ON COLUMN tb_cloud_alibaba_instance.alibaba_ecs_id IS 'alibaba ecs 정보 수집 ID';
    COMMENT ON COLUMN tb_cloud_alibaba_instance.alibaba_id IS 'alibaba ID';
    COMMENT ON COLUMN tb_cloud_alibaba_instance.account_id IS 'Account ID';
    COMMENT ON COLUMN tb_cloud_alibaba_instance.region_id IS 'Region Id';
    COMMENT ON COLUMN tb_cloud_alibaba_instance.region_description IS 'Region Description';
    COMMENT ON COLUMN tb_cloud_alibaba_instance.zone_id IS 'Zone Id';
    COMMENT ON COLUMN tb_cloud_alibaba_instance.instance_name IS 'Instance Name';
    COMMENT ON COLUMN tb_cloud_alibaba_instance.instance_id IS 'Instance ID';
    COMMENT ON COLUMN tb_cloud_alibaba_instance.instance_type IS 'Instance Type';
    COMMENT ON COLUMN tb_cloud_alibaba_instance.image_id IS 'Image Id';
    COMMENT ON COLUMN tb_cloud_alibaba_instance.os_type IS 'OS Type';
    COMMENT ON COLUMN tb_cloud_alibaba_instance.private_ip IS 'Private IP';
    COMMENT ON COLUMN tb_cloud_alibaba_instance.public_ip IS 'Public IP';
    COMMENT ON COLUMN tb_cloud_alibaba_instance.security_group_info IS 'Security Group Info';
    COMMENT ON COLUMN tb_cloud_alibaba_instance.vpc_id IS 'VPC ID';
    COMMENT ON COLUMN tb_cloud_alibaba_instance.v_switch_id IS 'V Switch Id';
    COMMENT ON COLUMN tb_cloud_alibaba_instance.nat_ip_address IS 'Nat Ip Address';
    COMMENT ON COLUMN tb_cloud_alibaba_instance.status IS 'Status';
    COMMENT ON COLUMN tb_cloud_alibaba_instance.modified_time IS '변경 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_cloud_alibaba_instance' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS tb_cloud_alibaba_instance ADD CONSTRAINT tb_cloud_alibaba_instance_pk PRIMARY KEY (alibaba_ecs_id);
    END IF;

END $$ LANGUAGE 'plpgsql';
------------------------------------------------------------------------------------------
select '## tb_user_country_settings';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_user_country_settings();
    COMMENT ON TABLE tb_user_country_settings IS '사용자 정의 국가 IP 설정';

    ALTER TABLE IF EXISTS tb_user_country_settings ADD COLUMN IF NOT EXISTS idx serial NOT NULL;
    ALTER TABLE IF EXISTS tb_user_country_settings ADD COLUMN IF NOT EXISTS country_code en_country_code_type NOT NULL DEFAULT 'KR'; -- 국가코드
    ALTER TABLE IF EXISTS tb_user_country_settings ADD COLUMN IF NOT EXISTS access_ip json NOT NULL; -- 접근 IP

    COMMENT ON COLUMN tb_user_country_settings.country_code IS '국가코드';
    COMMENT ON COLUMN tb_user_country_settings.access_ip IS '접근 IP';

    CREATE SEQUENCE IF NOT EXISTS tb_user_country_settings_id_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;

    ALTER SEQUENCE IF EXISTS tb_user_country_settings_id_seq OWNED BY tb_user_country_settings.idx;
    ALTER TABLE IF EXISTS ONLY tb_user_country_settings ALTER COLUMN idx SET DEFAULT nextval('tb_user_country_settings_id_seq'::regclass);

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_user_country_settings' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_user_country_settings ADD CONSTRAINT tb_user_country_settings_pk PRIMARY KEY (idx);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_ac_auto_allow_inventory';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_ac_auto_allow_inventory();
    COMMENT ON TABLE tb_ac_auto_allow_inventory IS 'AC 자동 허용 목록';

    ALTER TABLE IF EXISTS tb_ac_auto_allow_inventory ADD COLUMN IF NOT EXISTS idx bigserial NOT NULL;
    ALTER TABLE IF EXISTS tb_ac_auto_allow_inventory ADD COLUMN IF NOT EXISTS hash text NOT NULL DEFAULT 'no set'; -- 파일 해시(SHA256)
    ALTER TABLE IF EXISTS tb_ac_auto_allow_inventory ADD COLUMN IF NOT EXISTS file_name text NOT NULL DEFAULT 'no set'; -- 파일 이름
    ALTER TABLE IF EXISTS tb_ac_auto_allow_inventory ADD COLUMN IF NOT EXISTS admin_id text NOT NULL DEFAULT 'no set'; -- 자동 허용 요청한 관리자 계정
    ALTER TABLE IF EXISTS tb_ac_auto_allow_inventory ADD COLUMN IF NOT EXISTS modified_time timestamp NOT NULL DEFAULT now(); -- 변경 시각

    COMMENT ON COLUMN tb_ac_auto_allow_inventory.hash IS '파일 해시(SHA256)';
    COMMENT ON COLUMN tb_ac_auto_allow_inventory.file_name IS '파일 이름';
    COMMENT ON COLUMN tb_ac_auto_allow_inventory.admin_id IS '자동 허용 요청한 관리자 계정';
    COMMENT ON COLUMN tb_ac_auto_allow_inventory.modified_time IS '변경 시각';

    CREATE SEQUENCE IF NOT EXISTS tb_ac_auto_allow_inventory_id_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;

    ALTER SEQUENCE IF EXISTS tb_ac_auto_allow_inventory_id_seq OWNED BY tb_ac_auto_allow_inventory.idx;

    ALTER TABLE IF EXISTS ONLY tb_ac_auto_allow_inventory ALTER COLUMN idx SET DEFAULT nextval('tb_ac_auto_allow_inventory_id_seq'::regclass);

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_ac_auto_allow_inventory' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_ac_auto_allow_inventory ADD CONSTRAINT tb_ac_auto_allow_inventory_pk PRIMARY KEY (idx);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_ac_auto_allow_inventory' and constraint_name = 'tb_ac_auto_allow_inventory_un' AND constraint_type = 'UNIQUE') THEN
        ALTER TABLE IF EXISTS ONLY tb_ac_auto_allow_inventory ADD CONSTRAINT tb_ac_auto_allow_inventory_un UNIQUE (hash);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_hips_signature_factory';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_signature_factory();
    COMMENT ON TABLE tb_hips_signature_factory IS '시그니처 기본 팩토리 정보';

    ALTER TABLE IF EXISTS tb_hips_signature_factory ADD COLUMN IF NOT EXISTS sid int8 NOT NULL; -- 시그니처 아이디(1~999;999; 인프라에서 정함)
    ALTER TABLE IF EXISTS tb_hips_signature_factory ADD COLUMN IF NOT EXISTS "name" text NOT NULL; -- 시그니처 이름
    ALTER TABLE IF EXISTS tb_hips_signature_factory ADD COLUMN IF NOT EXISTS vulnerability_id int8 NULL; -- 취약점 ID
    ALTER TABLE IF EXISTS tb_hips_signature_factory ADD COLUMN IF NOT EXISTS vulnerability_code text NULL; -- 취약점 코드(CVE)
    ALTER TABLE IF EXISTS tb_hips_signature_factory ADD COLUMN IF NOT EXISTS application_type text NOT NULL; -- 어플리케이션 타입
    ALTER TABLE IF EXISTS tb_hips_signature_factory ADD COLUMN IF NOT EXISTS protection_area text NOT NULL; -- 보호 영역(TODO : Enum 정의 필요)
    ALTER TABLE IF EXISTS tb_hips_signature_factory ADD COLUMN IF NOT EXISTS recommendation bool NOT NULL DEFAULT false; -- 시그니처 추천 여부(0: false; 1: true)
    ALTER TABLE IF EXISTS tb_hips_signature_factory ADD COLUMN IF NOT EXISTS application text NULL; -- 응용프로그램 정보(name; version을 가지고 있는 map의 리스트 형태임)
    ALTER TABLE IF EXISTS tb_hips_signature_factory ADD COLUMN IF NOT EXISTS os_info text NULL; -- 운영체제 정보(name; version을 가지고 있는 map의 리스트 형태임)
    ALTER TABLE IF EXISTS tb_hips_signature_factory ADD COLUMN IF NOT EXISTS protocol_info text NULL; -- 프로토콜 정보(protocol; port 가지고 있는 map의 리스트 형태임)
    ALTER TABLE IF EXISTS tb_hips_signature_factory ADD COLUMN IF NOT EXISTS flowbits_name text NULL; -- 시그니처 그룹명(snort rule option : flowbits의 name 정보)
    ALTER TABLE IF EXISTS tb_hips_signature_factory ADD COLUMN IF NOT EXISTS severity en_signature_severity_type NOT NULL DEFAULT 'medium'::en_signature_severity_type; -- 위험도(매우높음:critical; 높음:high; 보통:medium; 낮음:low; 매우낮음:information)
    ALTER TABLE IF EXISTS tb_hips_signature_factory ADD COLUMN IF NOT EXISTS accuracy en_signature_accuracy_type NOT NULL DEFAULT 'possibility'::en_signature_accuracy_type; -- 정확도(rarity; possibility; often; never)
    ALTER TABLE IF EXISTS tb_hips_signature_factory ADD COLUMN IF NOT EXISTS "enable" bool NOT NULL; -- 인프라 권장
    ALTER TABLE IF EXISTS tb_hips_signature_factory ADD COLUMN IF NOT EXISTS "action" en_signature_action_type NOT NULL DEFAULT 'detect'::en_signature_action_type; -- 대응방법(탐지:detect; 차단:block)
    ALTER TABLE IF EXISTS tb_hips_signature_factory ADD COLUMN IF NOT EXISTS block_action en_signature_block_action_type NOT NULL DEFAULT 'packetblock'::en_signature_block_action_type; -- 차단 방법(패킷 차단:packetblock; 출발지:sip; 출발지/목적지:sipdip; 출발지/목적지/서비스:sipdipdportproto; 목적지:dip)
    ALTER TABLE IF EXISTS tb_hips_signature_factory ADD COLUMN IF NOT EXISTS direction text NOT NULL DEFAULT 'ei;ie;ii'::text; -- 탐지 방향(외부->내부;내부->외부;내부->내부)
    ALTER TABLE IF EXISTS tb_hips_signature_factory ADD COLUMN IF NOT EXISTS threshold int4 NOT NULL DEFAULT 1; -- 공격 인정 횟수
    ALTER TABLE IF EXISTS tb_hips_signature_factory ADD COLUMN IF NOT EXISTS "period" int4 NOT NULL DEFAULT 1; -- 공격 인정 시간
    ALTER TABLE IF EXISTS tb_hips_signature_factory ADD COLUMN IF NOT EXISTS block_time int4 NOT NULL DEFAULT 1; -- 차단 시간
    ALTER TABLE IF EXISTS tb_hips_signature_factory ADD COLUMN IF NOT EXISTS packet_capture bool NOT NULL; -- 패킷 저장 여부
    ALTER TABLE IF EXISTS tb_hips_signature_factory ADD COLUMN IF NOT EXISTS create_time timestamp NOT NULL; -- 생성 날짜
    ALTER TABLE IF EXISTS tb_hips_signature_factory ADD COLUMN IF NOT EXISTS last_modified_time timestamp NOT NULL; -- 수정 날짜

    COMMENT ON COLUMN tb_hips_signature_factory.sid IS '시그니처 아이디(1~999;999; 인프라에서 정함)';
    COMMENT ON COLUMN tb_hips_signature_factory."name" IS '시그니처 이름';
    COMMENT ON COLUMN tb_hips_signature_factory.vulnerability_id IS '취약점 ID';
    COMMENT ON COLUMN tb_hips_signature_factory.vulnerability_code IS '취약점 코드(CVE)';
    COMMENT ON COLUMN tb_hips_signature_factory.application_type IS '어플리케이션 타입';
    COMMENT ON COLUMN tb_hips_signature_factory.protection_area IS '보호 영역(TODO : Enum 정의 필요)';
    COMMENT ON COLUMN tb_hips_signature_factory.recommendation IS '시그니처 추천 여부(0: false; 1: true)';
    COMMENT ON COLUMN tb_hips_signature_factory.application IS '응용프로그램 정보(name; version을 가지고 있는 map의 리스트 형태임)';
    COMMENT ON COLUMN tb_hips_signature_factory.os_info IS '운영체제 정보(name; version을 가지고 있는 map의 리스트 형태임)';
    COMMENT ON COLUMN tb_hips_signature_factory.protocol_info IS '프로토콜 정보(protocol; port 가지고 있는 map의 리스트 형태임)';
    COMMENT ON COLUMN tb_hips_signature_factory.flowbits_name IS '시그니처 그룹명(snort rule option : flowbits의 name 정보)';
    COMMENT ON COLUMN tb_hips_signature_factory.severity IS '위험도(매우높음; 높음; 보통; 낮음; 매우낮음)';
    COMMENT ON COLUMN tb_hips_signature_factory.accuracy IS '정확도(rarity; possibility; often; never)';
    COMMENT ON COLUMN tb_hips_signature_factory."enable" IS '인프라 권장';
    COMMENT ON COLUMN tb_hips_signature_factory."action" IS '대응방법(탐지 : detect; 차단: block)';
    COMMENT ON COLUMN tb_hips_signature_factory.block_action IS '차단 방법(패킷 차단; 출발지; 출발지/목적지; 출발지/목적지/서비스; 목적지)';
    COMMENT ON COLUMN tb_hips_signature_factory.direction IS '탐지 방향(외부->내부;내부->외부;내부->내부)';
    COMMENT ON COLUMN tb_hips_signature_factory.threshold IS '공격 인정 횟수';
    COMMENT ON COLUMN tb_hips_signature_factory."period" IS '공격 인정 시간';
    COMMENT ON COLUMN tb_hips_signature_factory.block_time IS '차단 시간';
    COMMENT ON COLUMN tb_hips_signature_factory.packet_capture IS '패킷 저장 여부';
    COMMENT ON COLUMN tb_hips_signature_factory.create_time IS '생성 날짜';
    COMMENT ON COLUMN tb_hips_signature_factory.last_modified_time IS '수정 날짜';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_signature_factory' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS tb_hips_signature_factory ADD CONSTRAINT tb_hips_signature_factory_pk PRIMARY KEY (sid);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_hips_signature';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_signature();
    COMMENT ON TABLE tb_hips_signature IS '시그니처 기본 정보';

    ALTER TABLE IF EXISTS tb_hips_signature ADD COLUMN IF NOT EXISTS sid int8 NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_signature ADD COLUMN IF NOT EXISTS "name" text NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_signature ADD COLUMN IF NOT EXISTS vulnerability_id int8 NULL;
    ALTER TABLE IF EXISTS tb_hips_signature ADD COLUMN IF NOT EXISTS cve text NULL;
    ALTER TABLE IF EXISTS tb_hips_signature ADD COLUMN IF NOT EXISTS application_type text NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_signature ADD COLUMN IF NOT EXISTS protection_area text NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_signature ADD COLUMN IF NOT EXISTS recommendation bool NOT NULL DEFAULT false;
    ALTER TABLE IF EXISTS tb_hips_signature ADD COLUMN IF NOT EXISTS "enable" bool NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_signature ADD COLUMN IF NOT EXISTS "action" en_signature_action_type NOT NULL DEFAULT 'detect'::en_signature_action_type;
    ALTER TABLE IF EXISTS tb_hips_signature ADD COLUMN IF NOT EXISTS block_action en_signature_block_action_type NOT NULL DEFAULT 'packetblock'::en_signature_block_action_type;
    ALTER TABLE IF EXISTS tb_hips_signature ADD COLUMN IF NOT EXISTS severity en_signature_severity_type NOT NULL DEFAULT 'medium'::en_signature_severity_type;
    ALTER TABLE IF EXISTS tb_hips_signature ADD COLUMN IF NOT EXISTS direction text NOT NULL DEFAULT 'ei;ie;ii'::text;
    ALTER TABLE IF EXISTS tb_hips_signature ADD COLUMN IF NOT EXISTS threshold int4 NOT NULL DEFAULT 1;
    ALTER TABLE IF EXISTS tb_hips_signature ADD COLUMN IF NOT EXISTS period int4 NOT NULL DEFAULT 1;
    ALTER TABLE IF EXISTS tb_hips_signature ADD COLUMN IF NOT EXISTS block_time int4 NOT NULL DEFAULT 1;
    ALTER TABLE IF EXISTS tb_hips_signature ADD COLUMN IF NOT EXISTS raw bool NOT NULL DEFAULT false;
    ALTER TABLE IF EXISTS tb_hips_signature ADD COLUMN IF NOT EXISTS alarm bool NOT NULL DEFAULT false;
    ALTER TABLE IF EXISTS tb_hips_signature ADD COLUMN IF NOT EXISTS assign_all_agent bool DEFAULT false;
    ALTER TABLE IF EXISTS tb_hips_signature ADD COLUMN IF NOT EXISTS admin_id text;
    ALTER TABLE IF EXISTS tb_hips_signature ADD COLUMN IF NOT EXISTS create_time timestamp NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_signature ADD COLUMN IF NOT EXISTS last_modified timestamp NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_signature ADD COLUMN IF NOT EXISTS server_time timestamp;

    COMMENT ON COLUMN tb_hips_signature.sid IS '시그니처 아이디(기본 : 1~19;999;999; 사용자정의: 20;000;000 ~ )';
    COMMENT ON COLUMN tb_hips_signature."name" IS '시그니처 이름';
    COMMENT ON COLUMN tb_hips_signature.vulnerability_id IS '취약점 ID';
    COMMENT ON COLUMN tb_hips_signature.cve IS '취약점 코드(CVE)';
    COMMENT ON COLUMN tb_hips_signature.application_type IS '어플리케이션 타입';
    COMMENT ON COLUMN tb_hips_signature.protection_area IS '보호 영역';
    COMMENT ON COLUMN tb_hips_signature.recommendation IS '시그니처 추천 여부';
    COMMENT ON COLUMN tb_hips_signature."enable" IS '인프라 권장';
    COMMENT ON COLUMN tb_hips_signature."action" IS '대응방법(탐지:detect; 차단:block)';
    COMMENT ON COLUMN tb_hips_signature.block_action IS '차단 방법(패킷 차단:packetblock; 출발지:sip; 출발지/목적지:sipdip; 출발지/목적지/서비스:sipdipdportproto; 목적지:dip)';
    COMMENT ON COLUMN tb_hips_signature.severity IS '위험도(매우높음:critical; 높음:high; 보통:medium; 낮음:low; 매우낮음:information)';
    COMMENT ON COLUMN tb_hips_signature.direction IS '탐지 방향(외부->내부:ei;내부->외부:ie;내부->내부:ii)';
    COMMENT ON COLUMN tb_hips_signature.threshold IS '공격 인정 횟수';
    COMMENT ON COLUMN tb_hips_signature.period IS '공격 인정 시간';
    COMMENT ON COLUMN tb_hips_signature.block_time IS '차단 시간';
    COMMENT ON COLUMN tb_hips_signature.raw IS '패킷 저장 여부';
    COMMENT ON COLUMN tb_hips_signature.alarm IS '경보 메일 사용 여부';
    COMMENT ON COLUMN tb_hips_signature.assign_all_agent IS '모든 에이전트 할당 여부';
    COMMENT ON COLUMN tb_hips_signature.admin_id IS '관리자 ID';
    COMMENT ON COLUMN tb_hips_signature.create_time IS '생성 날짜';
    COMMENT ON COLUMN tb_hips_signature.last_modified IS '수정 날짜';
    COMMENT ON COLUMN tb_hips_signature.server_time IS '서버 시간';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_signature' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS tb_hips_signature ADD CONSTRAINT tb_hips_signature_pk PRIMARY KEY (sid);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_hips_signature_custom';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_signature_custom();
    COMMENT ON TABLE tb_hips_signature_custom IS '시그니처 사용자 정의 정보';

    ALTER TABLE IF EXISTS tb_hips_signature_custom ADD COLUMN IF NOT EXISTS sid int8 NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_custom ADD COLUMN IF NOT EXISTS "name" text NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_custom ADD COLUMN IF NOT EXISTS application_type text NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_custom ADD COLUMN IF NOT EXISTS protection_area text NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_custom ADD COLUMN IF NOT EXISTS "action" en_signature_action_type NOT NULL DEFAULT 'detect'::en_signature_action_type;
    ALTER TABLE IF EXISTS tb_hips_signature_custom ADD COLUMN IF NOT EXISTS block_action en_signature_block_action_type NOT NULL DEFAULT 'packetblock'::en_signature_block_action_type;
    ALTER TABLE IF EXISTS tb_hips_signature_custom ADD COLUMN IF NOT EXISTS severity en_signature_severity_type NOT NULL DEFAULT 'medium'::en_signature_severity_type;
    ALTER TABLE IF EXISTS tb_hips_signature_custom ADD COLUMN IF NOT EXISTS direction text NOT NULL DEFAULT 'ei;ie;ii'::text;
    ALTER TABLE IF EXISTS tb_hips_signature_custom ADD COLUMN IF NOT EXISTS threshold int4 NOT NULL DEFAULT 1;
    ALTER TABLE IF EXISTS tb_hips_signature_custom ADD COLUMN IF NOT EXISTS period int4 NOT NULL DEFAULT 1;
    ALTER TABLE IF EXISTS tb_hips_signature_custom ADD COLUMN IF NOT EXISTS block_time int4 NULL DEFAULT 1;
    ALTER TABLE IF EXISTS tb_hips_signature_custom ADD COLUMN IF NOT EXISTS raw bool NOT NULL DEFAULT false;
    ALTER TABLE IF EXISTS tb_hips_signature_custom ADD COLUMN IF NOT EXISTS alarm bool NULL DEFAULT false;
    ALTER TABLE IF EXISTS tb_hips_signature_custom ADD COLUMN IF NOT EXISTS packet_direction en_signature_packet_direction_type NOT NULL DEFAULT 'all'::en_signature_packet_direction_type;
    ALTER TABLE IF EXISTS tb_hips_signature_custom ADD COLUMN IF NOT EXISTS protocol en_signature_protocol_type NOT NULL DEFAULT 'tcp'::en_signature_protocol_type;
    ALTER TABLE IF EXISTS tb_hips_signature_custom ADD COLUMN IF NOT EXISTS saddr text NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_custom ADD COLUMN IF NOT EXISTS sport text NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_custom ADD COLUMN IF NOT EXISTS daddr text NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_custom ADD COLUMN IF NOT EXISTS dport text NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_custom ADD COLUMN IF NOT EXISTS pattern_type en_signature_detect_pattern_type NOT NULL DEFAULT 'manual'::en_signature_detect_pattern_type;
    ALTER TABLE IF EXISTS tb_hips_signature_custom ADD COLUMN IF NOT EXISTS pattern text NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_custom ADD COLUMN IF NOT EXISTS "offset" int4 NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_custom ADD COLUMN IF NOT EXISTS "depth" int4 NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_custom ADD COLUMN IF NOT EXISTS nocase bool NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_custom ADD COLUMN IF NOT EXISTS description text NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_custom ADD COLUMN IF NOT EXISTS admin_id text;
    ALTER TABLE IF EXISTS tb_hips_signature_custom ADD COLUMN IF NOT EXISTS create_time timestamp NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_custom ADD COLUMN IF NOT EXISTS last_modified timestamp NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_custom ADD COLUMN IF NOT EXISTS is_removed bool NOT NULL DEFAULT false;
    ALTER TABLE IF EXISTS tb_hips_signature_custom ADD COLUMN IF NOT EXISTS assign_all_agent bool DEFAULT false;

    COMMENT ON COLUMN tb_hips_signature_custom.sid IS '시그니처 아이디(기본 : 1~19;999;999; 사용자정의: 20;000;000 ~ )';
    COMMENT ON COLUMN tb_hips_signature_custom."name" IS '시그니처 이름';
    COMMENT ON COLUMN tb_hips_signature_custom.application_type IS '어플리케이션 타입';
    COMMENT ON COLUMN tb_hips_signature_custom.protection_area IS '보호 영역';
    COMMENT ON COLUMN tb_hips_signature_custom."action" IS '대응방법(탐지:detect; 차단:block)';
    COMMENT ON COLUMN tb_hips_signature_custom.block_action IS '차단 방법(패킷 차단:packetblock; 출발지:sip; 출발지/목적지:sipdip; 출발지/목적지/목적지 포트/서비스:sipdipdportproto; 출발지/목적지 포트/서비스:sipdportproto; 목적지:dip)';
    COMMENT ON COLUMN tb_hips_signature_custom.severity IS '위험도(매우높음:critical; 높음:high; 보통:medium; 낮음:low; 매우낮음:information)';
    COMMENT ON COLUMN tb_hips_signature_custom.direction IS '탐지 방향(외부->내부:ei;내부->외부:ie;내부->내부:ii)';
    COMMENT ON COLUMN tb_hips_signature_custom.threshold IS '공격 인정 횟수';
    COMMENT ON COLUMN tb_hips_signature_custom.period IS '공격 인정 시간';
    COMMENT ON COLUMN tb_hips_signature_custom.block_time IS '차단 시간';
    COMMENT ON COLUMN tb_hips_signature_custom.raw IS '패킷 저장 여부';
    COMMENT ON COLUMN tb_hips_signature_custom.alarm IS '경보 메일 사용 여부';
    COMMENT ON COLUMN tb_hips_signature_custom.packet_direction IS '패킷방향';
    COMMENT ON COLUMN tb_hips_signature_custom.protocol IS '프로토콜 타입(tcp; udp; icmp; ip)';
    COMMENT ON COLUMN tb_hips_signature_custom.saddr IS '출발지 아이피';
    COMMENT ON COLUMN tb_hips_signature_custom.sport IS '출발지 포트';
    COMMENT ON COLUMN tb_hips_signature_custom.daddr IS '목적지 아이피';
    COMMENT ON COLUMN tb_hips_signature_custom.dport IS '목적지 포트';
    COMMENT ON COLUMN tb_hips_signature_custom.pattern_type IS '패턴 타입(기본설정:manual; 고급설정:content/pcre)';
    COMMENT ON COLUMN tb_hips_signature_custom.pattern IS '탐지 패턴';
    COMMENT ON COLUMN tb_hips_signature_custom."offset" IS 'Offset';
    COMMENT ON COLUMN tb_hips_signature_custom."depth" IS 'Depth';
    COMMENT ON COLUMN tb_hips_signature_custom.nocase IS 'nocase';
    COMMENT ON COLUMN tb_hips_signature_custom.description IS '설명';
    COMMENT ON COLUMN tb_hips_signature_custom.admin_id IS '관리자 ID';
    COMMENT ON COLUMN tb_hips_signature_custom.create_time IS '생성 날짜';
    COMMENT ON COLUMN tb_hips_signature_custom.last_modified IS '수정 날짜';
    COMMENT ON COLUMN tb_hips_signature_custom.is_removed IS '삭제여부';
    COMMENT ON COLUMN tb_hips_signature_custom.assign_all_agent IS '모든 에이전트 할당 여부';

    CREATE SEQUENCE IF NOT EXISTS tb_hips_signature_custom_sid_seq
        INCREMENT BY 1
        MINVALUE 20000000
        MAXVALUE 9223372036854775807
        CACHE 1
        NO CYCLE;
    ALTER SEQUENCE IF EXISTS tb_hips_signature_custom_sid_seq OWNED BY tb_hips_signature_custom.sid;
    ALTER TABLE IF EXISTS ONLY tb_hips_signature_custom ALTER COLUMN sid SET DEFAULT nextval('tb_hips_signature_custom_sid_seq'::regclass);

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_signature_custom' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS tb_hips_signature_custom ADD CONSTRAINT tb_hips_signature_custom_pk PRIMARY KEY (sid);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_policy_hips_signature';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_policy_hips_signature();
    COMMENT ON TABLE tb_policy_hips_signature IS '정책별 시그니처 정보';

    ALTER TABLE IF EXISTS tb_policy_hips_signature ADD COLUMN IF NOT EXISTS policy_id int8 NOT NULL;
    ALTER TABLE IF EXISTS tb_policy_hips_signature ADD COLUMN IF NOT EXISTS sid int8 NOT NULL;
    ALTER TABLE IF EXISTS tb_policy_hips_signature ADD COLUMN IF NOT EXISTS "action" en_signature_action_type NOT NULL DEFAULT 'detect'::en_signature_action_type;
    ALTER TABLE IF EXISTS tb_policy_hips_signature ADD COLUMN IF NOT EXISTS block_action en_signature_block_action_type NOT NULL DEFAULT 'packetblock'::en_signature_block_action_type;
    ALTER TABLE IF EXISTS tb_policy_hips_signature ADD COLUMN IF NOT EXISTS severity en_signature_severity_type NOT NULL DEFAULT 'medium'::en_signature_severity_type;
    ALTER TABLE IF EXISTS tb_policy_hips_signature ADD COLUMN IF NOT EXISTS direction text NOT NULL DEFAULT 'ei;ie;ii'::text;
    ALTER TABLE IF EXISTS tb_policy_hips_signature ADD COLUMN IF NOT EXISTS threshold int4 NOT NULL DEFAULT 1;
    ALTER TABLE IF EXISTS tb_policy_hips_signature ADD COLUMN IF NOT EXISTS period int4 NOT NULL DEFAULT 1;
    ALTER TABLE IF EXISTS tb_policy_hips_signature ADD COLUMN IF NOT EXISTS block_time int4 NOT NULL DEFAULT 0;
    ALTER TABLE IF EXISTS tb_policy_hips_signature ADD COLUMN IF NOT EXISTS raw bool NOT NULL DEFAULT false;
    ALTER TABLE IF EXISTS tb_policy_hips_signature ADD COLUMN IF NOT EXISTS recommendation bool NOT NULL DEFAULT false;
    ALTER TABLE IF EXISTS tb_policy_hips_signature ADD COLUMN IF NOT EXISTS alarm bool NOT NULL;
    ALTER TABLE IF EXISTS tb_policy_hips_signature ADD COLUMN IF NOT EXISTS description text NULL;

    COMMENT ON COLUMN tb_policy_hips_signature.policy_id IS '정책 ID';
    COMMENT ON COLUMN tb_policy_hips_signature.sid IS '시그니처 아이디(기본 : 1~19;999;999; 사용자정의: 20;000;000 ~ )';
    COMMENT ON COLUMN tb_policy_hips_signature."action" IS '대응방법(탐지:detect; 차단:block)';
    COMMENT ON COLUMN tb_policy_hips_signature.block_action IS '차단 방법(패킷 차단:packetblock; 출발지:sip; 출발지/목적지:sipdip; 출발지/목적지/목적지 포트/서비스:sipdipdportproto; 출발지/목적지 포트/서비스:sipdportproto; 목적지:dip)';
    COMMENT ON COLUMN tb_policy_hips_signature.severity IS '위험도(매우높음:critical; 높음:high; 보통:medium; 낮음:low; 매우낮음:information)';
    COMMENT ON COLUMN tb_policy_hips_signature.direction IS '탐지 방향(외부->내부:ei;내부->외부:ie;내부->내부:ii)';
    COMMENT ON COLUMN tb_policy_hips_signature.threshold IS '공격 인정 횟수';
    COMMENT ON COLUMN tb_policy_hips_signature.period IS '공격 인정 시간';
    COMMENT ON COLUMN tb_policy_hips_signature.block_time IS '차단 시간';
    COMMENT ON COLUMN tb_policy_hips_signature.raw IS '패킷 저장 여부';
    COMMENT ON COLUMN tb_policy_hips_signature.recommendation IS '시그니처 추천 여부';
    COMMENT ON COLUMN tb_policy_hips_signature.alarm IS '경보 메일 사용 여부';
    COMMENT ON COLUMN tb_policy_hips_signature.description IS '설명';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_policy_hips_signature' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS tb_policy_hips_signature ADD CONSTRAINT tb_policy_hips_signature_pk PRIMARY KEY (policy_id, sid);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_node_hips_signature';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_node_hips_signature();
    COMMENT ON TABLE tb_node_hips_signature IS '개별 시그니처 정보';

    ALTER TABLE IF EXISTS tb_node_hips_signature ADD COLUMN IF NOT EXISTS node_id int8 NOT NULL;
    ALTER TABLE IF EXISTS tb_node_hips_signature ADD COLUMN IF NOT EXISTS sid int8 NOT NULL;
    ALTER TABLE IF EXISTS tb_node_hips_signature ADD COLUMN IF NOT EXISTS recommendation_type en_node_signature_recommendation_type NOT NULL DEFAULT 'NONE'::en_node_signature_recommendation_type;
    ALTER TABLE IF EXISTS tb_node_hips_signature ADD COLUMN IF NOT EXISTS "action" en_signature_action_type NOT NULL DEFAULT 'detect'::en_signature_action_type;
    ALTER TABLE IF EXISTS tb_node_hips_signature ADD COLUMN IF NOT EXISTS block_action en_signature_block_action_type NOT NULL DEFAULT 'packetblock'::en_signature_block_action_type;
    ALTER TABLE IF EXISTS tb_node_hips_signature ADD COLUMN IF NOT EXISTS severity en_signature_severity_type NOT NULL DEFAULT 'medium'::en_signature_severity_type;
    ALTER TABLE IF EXISTS tb_node_hips_signature ADD COLUMN IF NOT EXISTS direction text NOT NULL DEFAULT 'ei;ie;ii'::text;
    ALTER TABLE IF EXISTS tb_node_hips_signature ADD COLUMN IF NOT EXISTS threshold int4 NOT NULL DEFAULT 1;
    ALTER TABLE IF EXISTS tb_node_hips_signature ADD COLUMN IF NOT EXISTS period int4 NOT NULL DEFAULT 1;
    ALTER TABLE IF EXISTS tb_node_hips_signature ADD COLUMN IF NOT EXISTS block_time int4 NOT NULL DEFAULT 0;
    ALTER TABLE IF EXISTS tb_node_hips_signature ADD COLUMN IF NOT EXISTS raw bool NOT NULL;
    ALTER TABLE IF EXISTS tb_node_hips_signature ADD COLUMN IF NOT EXISTS recommendation bool NULL DEFAULT false;
    ALTER TABLE IF EXISTS tb_node_hips_signature ADD COLUMN IF NOT EXISTS alarm bool NULL DEFAULT false;
    ALTER TABLE IF EXISTS tb_node_hips_signature ADD COLUMN IF NOT EXISTS description text NULL;

    COMMENT ON COLUMN tb_node_hips_signature.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_node_hips_signature.sid IS '시그니처 아이디(기본 : 1~19;999;999; 사용자정의: 20;000;000 ~ )';
    COMMENT ON COLUMN tb_node_hips_signature.recommendation_type IS '추천 타입(개별저장 : NONE, 수동 추천 저장 : MANUAL, 자동 추천 저장 : AUTO)';
    COMMENT ON COLUMN tb_node_hips_signature."action" IS '대응방법(탐지:detect; 차단:block)';
    COMMENT ON COLUMN tb_node_hips_signature.block_action IS '차단 방법(패킷 차단:packetblock; 출발지:sip; 출발지/목적지:sipdip; 출발지/목적지/목적지 포트/서비스:sipdipdportproto; 출발지/목적지 포트/서비스:sipdportproto; 목적지:dip)';
    COMMENT ON COLUMN tb_node_hips_signature.severity IS '위험도(매우높음:critical; 높음:high; 보통:medium; 낮음:low; 매우낮음:information)';
    COMMENT ON COLUMN tb_node_hips_signature.direction IS '탐지 방향(외부->내부:ei;내부->외부:ie;내부->내부:ii)';
    COMMENT ON COLUMN tb_node_hips_signature.threshold IS '공격 인정 횟수';
    COMMENT ON COLUMN tb_node_hips_signature.period IS '공격 인정 시간';
    COMMENT ON COLUMN tb_node_hips_signature.block_time IS '차단 시간';
    COMMENT ON COLUMN tb_node_hips_signature.raw IS '패킷 저장 여부';
    COMMENT ON COLUMN tb_node_hips_signature.recommendation IS '시그니처 추천 여부';
    COMMENT ON COLUMN tb_node_hips_signature.alarm IS '경보 메일 사용 여부';
    COMMENT ON COLUMN tb_node_hips_signature.description IS '설명';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_node_hips_signature' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS tb_node_hips_signature ADD CONSTRAINT tb_node_hips_signature_pk PRIMARY KEY (node_id, sid);
    END IF;


END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_node_ac_inventory_list';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_node_ac_inventory_list();
    COMMENT ON TABLE tb_node_ac_inventory_list IS '노드별 AC 인벤토리 적용 정보';

    ALTER TABLE IF EXISTS tb_node_ac_inventory_list ADD COLUMN IF NOT EXISTS node_id int8 NOT NULL; -- 노드 ID
    ALTER TABLE IF EXISTS tb_node_ac_inventory_list ADD COLUMN IF NOT EXISTS apply_status text NULL; -- 적용 상태
    ALTER TABLE IF EXISTS tb_node_ac_inventory_list ADD COLUMN IF NOT EXISTS file_hash text NULL; -- 파일 hash 값
    ALTER TABLE IF EXISTS tb_node_ac_inventory_list ADD COLUMN IF NOT EXISTS file_name text NULL; -- 파일 이름
    ALTER TABLE IF EXISTS tb_node_ac_inventory_list ADD COLUMN IF NOT EXISTS file_path text NULL; -- 파일 경로
    ALTER TABLE IF EXISTS tb_node_ac_inventory_list ADD COLUMN IF NOT EXISTS create_time timestamp NOT NULL DEFAULT now(); -- 생성 날짜
    ALTER TABLE IF EXISTS tb_node_ac_inventory_list ADD COLUMN IF NOT EXISTS modified_time timestamp NOT NULL DEFAULT now(); -- 수정 날짜

    COMMENT ON COLUMN tb_node_ac_inventory_list.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_node_ac_inventory_list.apply_status IS '적용 상태(허용/30일간 보지 않기)';
    COMMENT ON COLUMN tb_node_ac_inventory_list.file_hash IS '파일 hash 값';
    COMMENT ON COLUMN tb_node_ac_inventory_list.file_name IS '파일 이름';
    COMMENT ON COLUMN tb_node_ac_inventory_list.file_path IS '파일 경로';
    COMMENT ON COLUMN tb_node_ac_inventory_list.create_time IS '생성 날짜';
    COMMENT ON COLUMN tb_node_ac_inventory_list.modified_time IS '수정 날짜';

    -- 버전 RC1, primary key(node_id, file_hash) 삭제하기로 함.
    IF EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_node_ac_inventory_list' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_node_ac_inventory_list DROP CONSTRAINT tb_node_ac_inventory_list_pk;
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_node_signature_recommendation';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_node_signature_recommendation();
    COMMENT ON TABLE tb_node_signature_recommendation IS '노드별 시그니처 추천';

    ALTER TABLE IF EXISTS tb_node_signature_recommendation ADD COLUMN IF NOT EXISTS node_id BIGINT NOT NULL;
    ALTER TABLE IF EXISTS tb_node_signature_recommendation ADD COLUMN IF NOT EXISTS sid BIGINT NOT NULL;
    ALTER TABLE IF EXISTS tb_node_signature_recommendation ADD COLUMN IF NOT EXISTS recommendation_type en_signature_recommendation_type NOT NULL;
    ALTER TABLE IF EXISTS tb_node_signature_recommendation ADD COLUMN IF NOT EXISTS create_time timestamp NOT NULL DEFAULT now(); -- 생성 날짜
    ALTER TABLE IF EXISTS tb_node_signature_recommendation ADD COLUMN IF NOT EXISTS modified_time timestamp NOT NULL DEFAULT now(); -- 수정 날짜

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_node_signature_recommendation' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS tb_node_signature_recommendation ADD CONSTRAINT tb_node_signature_recommendation_pk PRIMARY KEY (node_id, sid);
    END IF;

    UPDATE tb_node_signature_recommendation
    SET create_time = modified_time
    WHERE create_time > modified_time;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_hips_signature_recommendation_status';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_signature_recommendation_status();
    COMMENT ON TABLE tb_hips_signature_recommendation_status IS 'HIPS signature 취약점 분석 단위 상태 작업 관리 정보';

    ALTER TABLE IF EXISTS tb_hips_signature_recommendation_status ADD COLUMN IF NOT EXISTS status_id bigserial NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_recommendation_status ADD COLUMN IF NOT EXISTS status_type en_hips_signature_recommendation_status_type NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_recommendation_status ADD COLUMN IF NOT EXISTS node_id int8 NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_recommendation_status ADD COLUMN IF NOT EXISTS task_id bigint NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_recommendation_status ADD COLUMN IF NOT EXISTS hash varchar(128) NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_recommendation_status ADD COLUMN IF NOT EXISTS target_file_server_id bigint NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_recommendation_status ADD COLUMN IF NOT EXISTS target_file text NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_recommendation_status ADD COLUMN IF NOT EXISTS platform_type en_platform_type NOT NULL DEFAULT 'LINUX_UNIX'::en_platform_type;
    ALTER TABLE IF EXISTS tb_hips_signature_recommendation_status ADD COLUMN IF NOT EXISTS create_time timestamp NOT NULL DEFAULT NOW();
    ALTER TABLE IF EXISTS tb_hips_signature_recommendation_status ADD COLUMN IF NOT EXISTS modify_time timestamp NULL;

    COMMENT ON COLUMN tb_hips_signature_recommendation_status.status_id IS '상태 ID';
    COMMENT ON COLUMN tb_hips_signature_recommendation_status.status_type IS '상태 타입';
    COMMENT ON COLUMN tb_hips_signature_recommendation_status.node_id IS '에이전트ID';
    COMMENT ON COLUMN tb_hips_signature_recommendation_status.task_id IS '명령(실시간/예약)에 의한 처리일 경우 명령 아이디';
    COMMENT ON COLUMN tb_hips_signature_recommendation_status.hash IS '에이전트 분석 요청 단위 hash 정보';
    COMMENT ON COLUMN tb_hips_signature_recommendation_status.target_file_server_id IS '에이전트 분석 요청 파일이 존재하는 서버 아이디';
    COMMENT ON COLUMN tb_hips_signature_recommendation_status.target_file IS '에이전트 분석 요청 파일(압축 파일)';
    COMMENT ON COLUMN tb_hips_signature_recommendation_status.platform_type IS '운영체제 종류';
    COMMENT ON COLUMN tb_hips_signature_recommendation_status.create_time IS '생성 날짜';
    COMMENT ON COLUMN tb_hips_signature_recommendation_status.modify_time IS '수정 날짜';
    
    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_signature_recommendation_status' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS tb_hips_signature_recommendation_status ADD CONSTRAINT tb_hips_signature_recommendation_status_pk PRIMARY KEY (status_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_hips_signature_recommendation_status_signature';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_signature_recommendation_status_signature();
    COMMENT ON TABLE tb_hips_signature_recommendation_status_signature IS 'HIPS signature 취약점 분석 단위 상태 작업 별 추가 추천 대상 시그니처 정보';

    ALTER TABLE IF EXISTS tb_hips_signature_recommendation_status_signature ADD COLUMN IF NOT EXISTS status_id int8 NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_recommendation_status_signature ADD COLUMN IF NOT EXISTS sids text;
    ALTER TABLE IF EXISTS tb_hips_signature_recommendation_status_signature ADD COLUMN IF NOT EXISTS create_time timestamp NOT NULL DEFAULT NOW();
    ALTER TABLE IF EXISTS tb_hips_signature_recommendation_status_signature ADD COLUMN IF NOT EXISTS modify_time timestamp NULL;

    COMMENT ON COLUMN tb_hips_signature_recommendation_status_signature.status_id IS '상태 ID';
    COMMENT ON COLUMN tb_hips_signature_recommendation_status_signature.sids IS '시그니처SIDs';
    COMMENT ON COLUMN tb_hips_signature_recommendation_status_signature.create_time IS '생성 날짜';
    COMMENT ON COLUMN tb_hips_signature_recommendation_status_signature.modify_time IS '수정 날짜';
    
    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_signature_recommendation_status_signature' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS tb_hips_signature_recommendation_status_signature ADD CONSTRAINT tb_hips_signature_recommendation_status_signature_pk PRIMARY KEY (status_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_hips_signature_recommendation_scan';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_signature_recommendation_scan();
    COMMENT ON TABLE tb_hips_signature_recommendation_scan IS 'HIPS signature 취약점 분석 스캔 작업 관리 정보';

    ALTER TABLE IF EXISTS tb_hips_signature_recommendation_scan ADD COLUMN IF NOT EXISTS scan_id bigserial NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_recommendation_scan ADD COLUMN IF NOT EXISTS status_id int8 NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_recommendation_scan ADD COLUMN IF NOT EXISTS scan_type en_hips_signature_recommendation_scan_type NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_recommendation_scan ADD COLUMN IF NOT EXISTS node_id int8 NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_recommendation_scan ADD COLUMN IF NOT EXISTS layer_name varchar(128) NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_recommendation_scan ADD COLUMN IF NOT EXISTS layer_file text NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_recommendation_scan ADD COLUMN IF NOT EXISTS platform_type en_platform_type NOT NULL DEFAULT 'LINUX_UNIX'::en_platform_type;
    ALTER TABLE IF EXISTS tb_hips_signature_recommendation_scan ADD COLUMN IF NOT EXISTS is_host boolean NOT NULL DEFAULT TRUE;
    ALTER TABLE IF EXISTS tb_hips_signature_recommendation_scan ADD COLUMN IF NOT EXISTS create_time timestamp NOT NULL DEFAULT NOW();
    ALTER TABLE IF EXISTS tb_hips_signature_recommendation_scan ADD COLUMN IF NOT EXISTS modify_time timestamp NULL;

    COMMENT ON COLUMN tb_hips_signature_recommendation_scan.scan_id IS '스캔 ID';
    COMMENT ON COLUMN tb_hips_signature_recommendation_scan.status_id IS '상태 ID';
    COMMENT ON COLUMN tb_hips_signature_recommendation_scan.scan_type IS '스캔 타입';
    COMMENT ON COLUMN tb_hips_signature_recommendation_scan.node_id IS '에이전트ID';
    COMMENT ON COLUMN tb_hips_signature_recommendation_scan.layer_name IS '에이전트 분석 요청 파일 hash 정보(layer name)';
    COMMENT ON COLUMN tb_hips_signature_recommendation_scan.layer_file IS '업로드 파일 경로 및 파일명';
    COMMENT ON COLUMN tb_hips_signature_recommendation_scan.platform_type IS '운영체제 종류';
    COMMENT ON COLUMN tb_hips_signature_recommendation_scan.is_host IS '호스트 여부';
    COMMENT ON COLUMN tb_hips_signature_recommendation_scan.create_time IS '생성 날짜';
    COMMENT ON COLUMN tb_hips_signature_recommendation_scan.modify_time IS '수정 날짜';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_signature_recommendation_scan' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS tb_hips_signature_recommendation_scan ADD CONSTRAINT tb_hips_signature_recommendation_scan_pk PRIMARY KEY (scan_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
-- (CWPP-6806) 에이전트별 signature 추천 분석 작업 실행 정보
select '## tb_node_signature_recommendation_execution_info';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_node_signature_recommendation_execution_info();
    COMMENT ON TABLE tb_node_signature_recommendation_execution_info IS '에이전트별 HIPS signature 추천 분석 작업 실행 정보';
    
    ALTER TABLE IF EXISTS tb_node_signature_recommendation_execution_info ADD COLUMN IF NOT EXISTS node_id int8 NOT NULL;
    ALTER TABLE IF EXISTS tb_node_signature_recommendation_execution_info ADD COLUMN IF NOT EXISTS admin_id text NULL;
    ALTER TABLE IF EXISTS tb_node_signature_recommendation_execution_info ADD COLUMN IF NOT EXISTS last_status_id int8 NULL;
    ALTER TABLE IF EXISTS tb_node_signature_recommendation_execution_info ADD COLUMN IF NOT EXISTS created_time timestamp NULL DEFAULT CURRENT_TIMESTAMP;
    ALTER TABLE IF EXISTS tb_node_signature_recommendation_execution_info ADD COLUMN IF NOT EXISTS modified_time timestamp NULL;
    ALTER TABLE IF EXISTS tb_node_signature_recommendation_execution_info ADD COLUMN IF NOT EXISTS last_analyze_time timestamp NULL;
    ALTER TABLE IF EXISTS tb_node_signature_recommendation_execution_info ADD COLUMN IF NOT EXISTS last_apply_time timestamp NULL;

    COMMENT ON COLUMN tb_node_signature_recommendation_execution_info.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_node_signature_recommendation_execution_info.admin_id IS '관리자 ID';
    COMMENT ON COLUMN tb_node_signature_recommendation_execution_info.last_status_id IS '마지막 취약점 분석 정보 아이디 - tb_hips_signature_recommendation_status 테이블 연관';
    COMMENT ON COLUMN tb_node_signature_recommendation_execution_info.created_time IS '생성 일시';
    COMMENT ON COLUMN tb_node_signature_recommendation_execution_info.modified_time IS '수정 일시';
    COMMENT ON COLUMN tb_node_signature_recommendation_execution_info.last_analyze_time IS '마지막 추천 분석 일시';
    COMMENT ON COLUMN tb_node_signature_recommendation_execution_info.last_apply_time IS '마지막 추천 적용 일시';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_node_signature_recommendation_execution_info' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS tb_node_signature_recommendation_execution_info ADD CONSTRAINT tb_node_signature_recommendation_execution_info_pk PRIMARY KEY (node_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_hips_signature_cve_mapping_alas2';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_signature_cve_mapping_alas2();
    COMMENT ON TABLE tb_hips_signature_cve_mapping_alas2 IS 'HIPS signature CVE-ALAS2 맵핑 정보';

    ALTER TABLE IF EXISTS tb_hips_signature_cve_mapping_alas2 ADD COLUMN IF NOT EXISTS alas2 text NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_cve_mapping_alas2 ADD COLUMN IF NOT EXISTS cve text NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_cve_mapping_alas2 ADD COLUMN IF NOT EXISTS create_time timestamp NOT NULL DEFAULT now();

    COMMENT ON COLUMN tb_hips_signature_cve_mapping_alas2.alas2 IS 'ALAS2';
    COMMENT ON COLUMN tb_hips_signature_cve_mapping_alas2.cve IS 'CVE';
    COMMENT ON COLUMN tb_hips_signature_cve_mapping_alas2.create_time IS '생성 일시';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_signature_cve_mapping_alas2' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS tb_hips_signature_cve_mapping_alas2 ADD CONSTRAINT tb_hips_signature_cve_mapping_alas2_pk PRIMARY KEY (alas2, cve);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_hips_signature_cve_mapping_rhsa';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_signature_cve_mapping_rhsa();
    COMMENT ON TABLE tb_hips_signature_cve_mapping_rhsa IS 'HIPS signature CVE-RHSA 맵핑 정보';

    ALTER TABLE IF EXISTS tb_hips_signature_cve_mapping_rhsa ADD COLUMN IF NOT EXISTS rhsa text NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_cve_mapping_rhsa ADD COLUMN IF NOT EXISTS cve text NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_cve_mapping_rhsa ADD COLUMN IF NOT EXISTS create_time timestamp NOT NULL DEFAULT now();

    COMMENT ON COLUMN tb_hips_signature_cve_mapping_rhsa.rhsa IS 'RHSA';
    COMMENT ON COLUMN tb_hips_signature_cve_mapping_rhsa.cve IS 'CVE';
    COMMENT ON COLUMN tb_hips_signature_cve_mapping_rhsa.create_time IS '생성 일시';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_signature_cve_mapping_rhsa' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS tb_hips_signature_cve_mapping_rhsa ADD CONSTRAINT tb_hips_signature_cve_mapping_rhsa_pk PRIMARY KEY (rhsa, cve);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_hips_signature_cve_mapping_elsa';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_signature_cve_mapping_elsa();
    COMMENT ON TABLE tb_hips_signature_cve_mapping_elsa IS 'HIPS signature CVE-ELSA 맵핑 정보';

    ALTER TABLE IF EXISTS tb_hips_signature_cve_mapping_elsa ADD COLUMN IF NOT EXISTS elsa text NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_cve_mapping_elsa ADD COLUMN IF NOT EXISTS cve text NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_signature_cve_mapping_elsa ADD COLUMN IF NOT EXISTS create_time timestamp NULL DEFAULT now();

    COMMENT ON COLUMN tb_hips_signature_cve_mapping_elsa.elsa IS 'ELSA';
    COMMENT ON COLUMN tb_hips_signature_cve_mapping_elsa.cve IS 'CVE';
    COMMENT ON COLUMN tb_hips_signature_cve_mapping_elsa.create_time IS '생성 일시';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_signature_cve_mapping_elsa' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS tb_hips_signature_cve_mapping_elsa ADD CONSTRAINT tb_hips_signature_cve_mapping_elsa_pk PRIMARY KEY (elsa, cve);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_node_hips_cve';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_node_hips_cve();
    COMMENT ON TABLE tb_node_hips_cve IS 'HIPS 노드별 취약점 코드(CVE) 목록 for Windows';

    ALTER TABLE IF EXISTS tb_node_hips_cve ADD COLUMN IF NOT EXISTS node_id BIGINT NOT NULL;
    ALTER TABLE IF EXISTS tb_node_hips_cve ADD COLUMN IF NOT EXISTS cve TEXT NOT NULL;
    ALTER TABLE IF EXISTS tb_node_hips_cve ADD COLUMN IF NOT EXISTS create_time timestamp NOT NULL DEFAULT now();

    COMMENT ON column tb_node_hips_cve.node_id IS '노드 ID';
    COMMENT ON column tb_node_hips_cve.cve IS 'CVE';
    COMMENT ON column tb_node_hips_cve.create_time IS '생성 일시';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_node_hips_cve' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS tb_node_hips_cve ADD CONSTRAINT tb_node_hips_cve_pk PRIMARY KEY (node_id, cve);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_hips_vulnerability';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_vulnerability();
    COMMENT ON TABLE tb_hips_vulnerability IS '취약점 메타 정보';

    ALTER TABLE IF EXISTS tb_hips_vulnerability ADD COLUMN IF NOT EXISTS vulnerability_id int8 NOT NULL; -- 취약점 ID
    ALTER TABLE IF EXISTS tb_hips_vulnerability ADD COLUMN IF NOT EXISTS "name" text NOT NULL; -- 취약점명
    ALTER TABLE IF EXISTS tb_hips_vulnerability ADD COLUMN IF NOT EXISTS vulnerability_code text NULL; -- 취약점 코드(CVE)
    ALTER TABLE IF EXISTS tb_hips_vulnerability ADD COLUMN IF NOT EXISTS published_date text NULL; -- 취약점 공개날짜(YYYY-MM-DD)
    ALTER TABLE IF EXISTS tb_hips_vulnerability ADD COLUMN IF NOT EXISTS cvss text NULL; -- 취약점 점수(0.0~100.0)
    ALTER TABLE IF EXISTS tb_hips_vulnerability ADD COLUMN IF NOT EXISTS cpe_info json NULL; -- 응용프로그램 정보
    ALTER TABLE IF EXISTS tb_hips_vulnerability ADD COLUMN IF NOT EXISTS severity en_signature_severity_type NOT NULL DEFAULT 'medium'::en_signature_severity_type; -- 위험도(매우높음:critical; 높음:high; 보통:medium; 낮음:low; 매우낮음:information)
    ALTER TABLE IF EXISTS tb_hips_vulnerability ADD COLUMN IF NOT EXISTS modified_time timestamp DEFAULT now() NOT NULL; -- 서버 수정 시간

    COMMENT ON COLUMN tb_hips_vulnerability.vulnerability_id IS '취약점 ID';
    COMMENT ON COLUMN tb_hips_vulnerability."name" IS '취약점명';
    COMMENT ON COLUMN tb_hips_vulnerability.vulnerability_code IS '취약점 코드(CVE...)';
    COMMENT ON COLUMN tb_hips_vulnerability.published_date IS '취약점 공개날짜(YYYY-MM-DD)';
    COMMENT ON COLUMN tb_hips_vulnerability.cvss IS '취약점 점수(0.0~100.0)';
    COMMENT ON COLUMN tb_hips_vulnerability.cpe_info IS '응용프로그램 정보';
    COMMENT ON COLUMN tb_hips_vulnerability.severity IS '위험도(매우높음:critical; 높음:high; 보통:medium; 낮음:low; 매우낮음:information)';
    COMMENT ON COLUMN tb_hips_vulnerability.modified_time IS '서버 수정 시간';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_vulnerability' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS tb_hips_vulnerability ADD CONSTRAINT tb_hips_vulnerability_pk PRIMARY KEY (vulnerability_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_timeline_oltp';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_timeline_oltp ();
    COMMENT ON TABLE tb_timeline_oltp IS '에이전트별 V3 엔진 정보 타임라인';

    ALTER TABLE IF EXISTS tb_timeline_oltp ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_timeline_oltp ADD COLUMN IF NOT EXISTS reg_date text NOT NULL;
    ALTER TABLE IF EXISTS tb_timeline_oltp ADD COLUMN IF NOT EXISTS group_id bigint;
    ALTER TABLE IF EXISTS tb_timeline_oltp ADD COLUMN IF NOT EXISTS ip inet;
    ALTER TABLE IF EXISTS tb_timeline_oltp ADD COLUMN IF NOT EXISTS nt_domain text;
    ALTER TABLE IF EXISTS tb_timeline_oltp ADD COLUMN IF NOT EXISTS department text;
    ALTER TABLE IF EXISTS tb_timeline_oltp ADD COLUMN IF NOT EXISTS product_id en_product_id_type;
    ALTER TABLE IF EXISTS tb_timeline_oltp ADD COLUMN IF NOT EXISTS engine_version text;
    ALTER TABLE IF EXISTS tb_timeline_oltp ADD COLUMN IF NOT EXISTS engine_update_past_days integer;
    ALTER TABLE IF EXISTS tb_timeline_oltp ADD COLUMN IF NOT EXISTS last_scan_time timestamp without time zone;
    ALTER TABLE IF EXISTS tb_timeline_oltp ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;

    COMMENT ON COLUMN tb_timeline_oltp.node_id IS '노드';
    COMMENT ON COLUMN tb_timeline_oltp.reg_date IS '등록 일자';
    COMMENT ON COLUMN tb_timeline_oltp.group_id IS '그룹 ID';
    COMMENT ON COLUMN tb_timeline_oltp.ip IS 'IP';
    COMMENT ON COLUMN tb_timeline_oltp.nt_domain IS '윈도우 워크그룹';
    COMMENT ON COLUMN tb_timeline_oltp.department IS '부서';
    COMMENT ON COLUMN tb_timeline_oltp.product_id IS '제품 ID';
    COMMENT ON COLUMN tb_timeline_oltp.engine_version IS '엔진 버전';
    COMMENT ON COLUMN tb_timeline_oltp.engine_update_past_days IS '엔진 업데이트 지난 일수';
    COMMENT ON COLUMN tb_timeline_oltp.last_scan_time IS '수동 검사 시각';
    COMMENT ON COLUMN tb_timeline_oltp.modified_time IS '변경 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_timeline_oltp' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_timeline_oltp ADD CONSTRAINT tb_timeline_oltp_pkey PRIMARY KEY (node_id, reg_date);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_v3_status';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_v3_status ();
    COMMENT ON TABLE tb_v3_status IS '에이전트별 V3 제품 상태';

    ALTER TABLE IF EXISTS tb_v3_status ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_v3_status ADD COLUMN IF NOT EXISTS product_id en_product_id_type NOT NULL;
    ALTER TABLE IF EXISTS tb_v3_status ADD COLUMN IF NOT EXISTS product_version text;
    ALTER TABLE IF EXISTS tb_v3_status ADD COLUMN IF NOT EXISTS service_status en_product_service_status NULL; 
    ALTER TABLE IF EXISTS tb_v3_status ADD COLUMN IF NOT EXISTS engine_version text;
    ALTER TABLE IF EXISTS tb_v3_status ADD COLUMN IF NOT EXISTS license_no text;
    ALTER TABLE IF EXISTS tb_v3_status ADD COLUMN IF NOT EXISTS license_user text;
    ALTER TABLE IF EXISTS tb_v3_status ADD COLUMN IF NOT EXISTS license_org text;
    ALTER TABLE IF EXISTS tb_v3_status ADD COLUMN IF NOT EXISTS server_time timestamp with time zone DEFAULT now();
    ALTER TABLE IF EXISTS tb_v3_status ADD COLUMN IF NOT EXISTS realtime_status boolean;
    ALTER TABLE IF EXISTS tb_v3_status ADD COLUMN IF NOT EXISTS engine_update_time timestamp with time zone;
    ALTER TABLE IF EXISTS tb_v3_status ADD COLUMN IF NOT EXISTS last_scan_time timestamp with time zone;
    ALTER TABLE IF EXISTS tb_v3_status ADD COLUMN IF NOT EXISTS tz_offset integer;
    ALTER TABLE IF EXISTS tb_v3_status ADD COLUMN IF NOT EXISTS client_time timestamp with time zone;
    ALTER TABLE IF EXISTS tb_v3_status ADD COLUMN IF NOT EXISTS integrity_status en_integrity_status;
    ALTER TABLE IF EXISTS tb_v3_status ADD COLUMN IF NOT EXISTS engine_type en_engine_type;
    ALTER TABLE IF EXISTS tb_v3_status ADD COLUMN IF NOT EXISTS obj_id text;
    ALTER TABLE IF EXISTS tb_v3_status ADD COLUMN IF NOT EXISTS install_time timestamp with time zone;
    ALTER TABLE IF EXISTS tb_v3_status ADD COLUMN IF NOT EXISTS realtime_status_mode text;
    ALTER TABLE IF EXISTS tb_v3_status ADD COLUMN IF NOT EXISTS last_quarantine_collect_time timestamp with time zone;
    ALTER TABLE IF EXISTS tb_v3_status ADD COLUMN IF NOT EXISTS scan_status en_v3_scan_status;
    ALTER TABLE IF EXISTS tb_v3_status ADD COLUMN IF NOT EXISTS activation_code text;
    ALTER TABLE IF EXISTS tb_v3_status ADD COLUMN IF NOT EXISTS ckl_version text;
    ALTER TABLE IF EXISTS tb_v3_status ADD COLUMN IF NOT EXISTS comp_type text;
    ALTER TABLE IF EXISTS tb_v3_status ADD COLUMN IF NOT EXISTS monitor text;

    COMMENT ON COLUMN tb_v3_status.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_v3_status.product_id IS '제품 ID';
    COMMENT ON COLUMN tb_v3_status.product_version IS '제품 버전';
    COMMENT ON COLUMN tb_v3_status.service_status IS '서비스 상태 (ON/OFF)';
    COMMENT ON COLUMN tb_v3_status.engine_version IS '엔진 버전';
    COMMENT ON COLUMN tb_v3_status.license_no IS '라이선스 번호';
    COMMENT ON COLUMN tb_v3_status.license_user IS '라이선스 사용자';
    COMMENT ON COLUMN tb_v3_status.license_org IS '라이선스 조직';
    COMMENT ON COLUMN tb_v3_status.server_time IS '변경 시각';
    COMMENT ON COLUMN tb_v3_status.realtime_status IS '실시간 감시 사용 여부';
    COMMENT ON COLUMN tb_v3_status.engine_update_time IS '엔진 업데이트 시각';
    COMMENT ON COLUMN tb_v3_status.last_scan_time IS '수동 검사 시각';
    COMMENT ON COLUMN tb_v3_status.tz_offset IS '시간대';
    COMMENT ON COLUMN tb_v3_status.client_time IS '클라이언트 시각';
    COMMENT ON COLUMN tb_v3_status.integrity_status IS '정합성 상태';
    COMMENT ON COLUMN tb_v3_status.engine_type IS '엔진 타입';
    COMMENT ON COLUMN tb_v3_status.obj_id IS 'MongoDB object ID';
    COMMENT ON COLUMN tb_v3_status.install_time IS '설치 시각';
    COMMENT ON COLUMN tb_v3_status.realtime_status_mode IS '실시간 검사 모드(USER: 유저모드, KERNEL: 커널 모드, URGENT_OFF: 긴급OFF, ""(빈값): 하위 호환(일반 on/off))';
    COMMENT ON COLUMN tb_v3_status.last_quarantine_collect_time IS '마지막 검역소 정보 수집 시각';
    COMMENT ON COLUMN tb_v3_status.scan_status IS '검사진행 상태';
    COMMENT ON COLUMN tb_v3_status.activation_code IS '액티베이션 코드';
    COMMENT ON COLUMN tb_v3_status.ckl_version IS 'CKL 버전';
    COMMENT ON COLUMN tb_v3_status.comp_type IS '설치 유형';
    COMMENT ON COLUMN tb_v3_status.monitor IS '모니터링 모드';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_v3_status' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_v3_status ADD CONSTRAINT tb_v3_status_pkey PRIMARY KEY (node_id, product_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_ac_status';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_ac_status ();
    COMMENT ON TABLE tb_ac_status IS 'AC 상태';

    ALTER TABLE IF EXISTS tb_ac_status ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_ac_status ADD COLUMN IF NOT EXISTS product_id en_product_id_type NOT NULL;
    ALTER TABLE IF EXISTS tb_ac_status ADD COLUMN IF NOT EXISTS product_version text;
    ALTER TABLE IF EXISTS tb_ac_status ADD COLUMN IF NOT EXISTS service_status en_product_service_status NULL; -- 서비스 상태 (ON/OFF)
    ALTER TABLE IF EXISTS tb_ac_status ADD COLUMN IF NOT EXISTS ac_status en_ac_operation_status NULL; -- AC 동작 상태;
    ALTER TABLE IF EXISTS tb_ac_status ADD COLUMN IF NOT EXISTS engine_version text NULL; -- 엔진 버전;
    ALTER TABLE IF EXISTS tb_ac_status ADD COLUMN IF NOT EXISTS ckl_version text NULL; -- 커널패키지 버전;
    ALTER TABLE IF EXISTS tb_ac_status ADD COLUMN IF NOT EXISTS engine_update_time timestamptz NULL; -- 엔진 업데이트 시각 -- last_updat;
    ALTER TABLE IF EXISTS tb_ac_status ADD COLUMN IF NOT EXISTS engine_type en_engine_type; -- 엔진 타입 (SES-0; OES-1;
    ALTER TABLE IF EXISTS tb_ac_status ADD COLUMN IF NOT EXISTS mode_begin_time timestamptz NULL; -- 엔진 업데이트 시작 시각;
    ALTER TABLE IF EXISTS tb_ac_status ADD COLUMN IF NOT EXISTS mode_end_time timestamptz NULL; -- 엔진 업데이트 종료 시각;
    ALTER TABLE IF EXISTS tb_ac_status ADD COLUMN IF NOT EXISTS engine_date timestamptz NULL;
    ALTER TABLE IF EXISTS tb_ac_status ADD COLUMN IF NOT EXISTS execute_date timestamptz NULL;
    ALTER TABLE IF EXISTS tb_ac_status ADD COLUMN IF NOT EXISTS license_no text;
    ALTER TABLE IF EXISTS tb_ac_status ADD COLUMN IF NOT EXISTS license_user text;
    ALTER TABLE IF EXISTS tb_ac_status ADD COLUMN IF NOT EXISTS license_org text;
    ALTER TABLE IF EXISTS tb_ac_status ADD COLUMN IF NOT EXISTS integrity_status en_integrity_status;
    ALTER TABLE IF EXISTS tb_ac_status ADD COLUMN IF NOT EXISTS install_time timestamptz;
    ALTER TABLE IF EXISTS tb_ac_status ADD COLUMN IF NOT EXISTS client_time timestamptz;
    ALTER TABLE IF EXISTS tb_ac_status ADD COLUMN IF NOT EXISTS tz_offset integer;
    ALTER TABLE IF EXISTS tb_ac_status ADD COLUMN IF NOT EXISTS server_time timestamp DEFAULT now();
    ALTER TABLE IF EXISTS tb_ac_status ADD COLUMN IF NOT EXISTS engine_state en_product_service_status NULL;    -- 엔진 초기화 성공여부(ON/OFF)
    ALTER TABLE IF EXISTS tb_ac_status ADD COLUMN IF NOT EXISTS im_enable text; -- IM 사용 여부;
    ALTER TABLE IF EXISTS tb_ac_status ADD COLUMN IF NOT EXISTS im_enable_real_time text; -- IM 실시간 검사;
    ALTER TABLE IF EXISTS tb_ac_status ADD COLUMN IF NOT EXISTS im_engine_version text; -- IM 엔진 버전;
    ALTER TABLE IF EXISTS tb_ac_status ADD COLUMN IF NOT EXISTS im_manual_time timestamptz; -- IM 마지막 수동 검사 시간;
    ALTER TABLE IF EXISTS tb_ac_status ADD COLUMN IF NOT EXISTS activation_code text;

    COMMENT ON COLUMN tb_ac_status.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_ac_status.product_id IS '제품 ID';
    COMMENT ON COLUMN tb_ac_status.product_version IS '제품 버전';
    COMMENT ON COLUMN tb_ac_status.service_status IS '서비스 상태 (ON/OFF)';
    COMMENT ON COLUMN tb_ac_status.ac_status IS 'AC 동작 상태';
    COMMENT ON COLUMN tb_ac_status.engine_version is '엔진 버전';
    COMMENT ON COLUMN tb_ac_status.ckl_version is '커널패키지 버전';
    COMMENT ON COLUMN tb_ac_status.engine_update_time IS '엔진 업데이트 시각';
    COMMENT ON COLUMN tb_ac_status.engine_type IS '엔진 타입';
    COMMENT ON COLUMN tb_ac_status.mode_begin_time IS '시작 시각';
    COMMENT ON COLUMN tb_ac_status.mode_end_time IS '종료 시각';
    COMMENT ON COLUMN tb_ac_status.engine_date IS '엔진 시각';
    COMMENT ON COLUMN tb_ac_status.execute_date IS '실행 시각';
    COMMENT ON COLUMN tb_ac_status.license_no IS '라이선스 번호';
    COMMENT ON COLUMN tb_ac_status.license_user IS '라이선스 사용자';
    COMMENT ON COLUMN tb_ac_status.license_org IS '라이선스 조직';
    COMMENT ON COLUMN tb_ac_status.integrity_status IS '무결성 상태';
    COMMENT ON COLUMN tb_ac_status.install_time IS '설치 시각';
    COMMENT ON COLUMN tb_ac_status.client_time IS '클라이언트 시각';
    COMMENT ON COLUMN tb_ac_status.tz_offset IS '시간대';
    COMMENT ON COLUMN tb_ac_status.server_time IS '변경 시각';
    COMMENT ON COLUMN tb_ac_status.engine_state IS '엔진 초기화 성공여부';
    COMMENT ON COLUMN tb_ac_status.im_enable is 'IM 사용 여부';
    COMMENT ON COLUMN tb_ac_status.im_enable_real_time is 'IM 실시간 검사';
    COMMENT ON COLUMN tb_ac_status.im_engine_version is 'IM 엔진 버전';
    COMMENT ON COLUMN tb_ac_status.im_manual_time is 'IM 마지막 수동 검사 시간';
    COMMENT ON COLUMN tb_ac_status.activation_code is '액티베이션 코드';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_ac_status' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_ac_status ADD CONSTRAINT tb_ac_status_pkey PRIMARY KEY (node_id, product_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_hips_status';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_status ();
    COMMENT ON TABLE tb_hips_status IS 'HIPS 상태';


    ALTER TABLE IF EXISTS tb_hips_status ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;                                  -- 노드 ID
    ALTER TABLE IF EXISTS tb_hips_status ADD COLUMN IF NOT EXISTS product_id en_product_id_type NOT NULL;                   -- 제품 ID
    ALTER TABLE IF EXISTS tb_hips_status ADD COLUMN IF NOT EXISTS product_version text;                                     -- 제품 버전
    ALTER TABLE IF EXISTS tb_hips_status ADD COLUMN IF NOT EXISTS service_status en_product_service_status NULL;            -- 서비스 상태 (ON/OFF);
    ALTER TABLE IF EXISTS tb_hips_status ADD COLUMN IF NOT EXISTS ips_status en_hips_status NULL;                           -- IPS 상태;
    ALTER TABLE IF EXISTS tb_hips_status ADD COLUMN IF NOT EXISTS fw_status en_fw_status NULL;                              -- FW 상태;
    ALTER TABLE IF EXISTS tb_hips_status ADD COLUMN IF NOT EXISTS engine_version text NULL;                                 -- 엔진 버전;
    ALTER TABLE IF EXISTS tb_hips_status ADD COLUMN IF NOT EXISTS engine_update_time timestamptz NULL;                      -- 엔진 업데이트 시각;
    ALTER TABLE IF EXISTS tb_hips_status ADD COLUMN IF NOT EXISTS signature_version text NULL;                              -- 시그니처 버전;
    ALTER TABLE IF EXISTS tb_hips_status ADD COLUMN IF NOT EXISTS signature_count integer;                                  -- 시그니처 갯수;
    ALTER TABLE IF EXISTS tb_hips_status ADD COLUMN IF NOT EXISTS recommendation_status en_hips_recommendation_status NULL; -- IPS 추천 분석 상태;
    ALTER TABLE IF EXISTS tb_hips_status ADD COLUMN IF NOT EXISTS recommendation_date timestamptz NULL;                     -- IPS 추천 분석 시각;
    ALTER TABLE IF EXISTS tb_hips_status ADD COLUMN IF NOT EXISTS license_no text;                                          -- 라이선스 번호
    ALTER TABLE IF EXISTS tb_hips_status ADD COLUMN IF NOT EXISTS license_user text;                                        -- 라이선스 사용자
    ALTER TABLE IF EXISTS tb_hips_status ADD COLUMN IF NOT EXISTS license_org text;                                         -- 라이선스 조직
    ALTER TABLE IF EXISTS tb_hips_status ADD COLUMN IF NOT EXISTS integrity_status en_integrity_status;                     -- 무결성 상태
    ALTER TABLE IF EXISTS tb_hips_status ADD COLUMN IF NOT EXISTS install_time timestamptz;                                 -- 설치 시각
    ALTER TABLE IF EXISTS tb_hips_status ADD COLUMN IF NOT EXISTS client_time timestamptz;                                  -- 클라이언트 시각
    ALTER TABLE IF EXISTS tb_hips_status ADD COLUMN IF NOT EXISTS tz_offset integer;                                        -- 시간대
    ALTER TABLE IF EXISTS tb_hips_status ADD COLUMN IF NOT EXISTS server_time timestamp DEFAULT now();                      -- 서버 시간
    ALTER TABLE IF EXISTS tb_hips_status ADD COLUMN IF NOT EXISTS engine_state en_product_service_status NULL;              -- 엔진 초기화 성공여부(ON/OFF)
    ALTER TABLE IF EXISTS tb_hips_status ADD COLUMN IF NOT EXISTS activation_code text;                                     -- 액티베이션 코드
    ALTER TABLE IF EXISTS tb_hips_status ADD COLUMN IF NOT EXISTS fw_network_running text;                                  -- FW 네트워크 사용 여부(ON/OFF)
    ALTER TABLE IF EXISTS tb_hips_status ADD COLUMN IF NOT EXISTS fw_block_nation_running text;                             -- FW 차단 국가 사용 여부(ON/OFF)
    ALTER TABLE IF EXISTS tb_hips_status ADD COLUMN IF NOT EXISTS fw_block_ip_running text;                                 -- FW 차단 IP 사용 여부(ON/OFF)
    ALTER TABLE IF EXISTS tb_hips_status ADD COLUMN IF NOT EXISTS ssl_inspection_running text NULL;                         -- SSL 감시 동작 여부 (ON/OFF)
    ALTER TABLE IF EXISTS tb_hips_status ADD COLUMN IF NOT EXISTS ssl_inspection_init_time timestamptz NULL;                -- SSL 감시 설정 최초 시간
    ALTER TABLE IF EXISTS tb_hips_status ADD COLUMN IF NOT EXISTS ssl_inspection_modified_time timestamptz NULL;            -- SSL 감시 설정 수정 시간
    ALTER TABLE IF EXISTS tb_hips_status ADD COLUMN IF NOT EXISTS ssl_engine_mode text;                                     -- SSL 프록시 동작 모드 ("PORT" or "NS")
    ALTER TABLE IF EXISTS tb_hips_status ADD COLUMN IF NOT EXISTS ssl_engine_port BIGINT;                                   -- SSL 점유할 포트 넘버
    ALTER TABLE IF EXISTS tb_hips_status ADD COLUMN IF NOT EXISTS ssl_engine_limit_session BIGINT;                          -- SSL 처리할 세션 제한 개수

    COMMENT ON COLUMN tb_hips_status.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_hips_status.product_id IS '제품 ID';
    COMMENT ON COLUMN tb_hips_status.product_version IS '제품 버전';
    COMMENT ON COLUMN tb_hips_status.service_status IS '서비스 상태 (ON/OFF)';
    COMMENT ON COLUMN tb_hips_status.ips_status IS 'IPS 상태';
    COMMENT ON COLUMN tb_hips_status.fw_status IS 'FW 상태';
    COMMENT ON COLUMN tb_hips_status.engine_version IS '엔진 버전';
    COMMENT ON COLUMN tb_hips_status.engine_update_time IS '엔진 업데이트 시각';
    COMMENT ON COLUMN tb_hips_status.signature_version IS '시그니처 버전';
    COMMENT ON COLUMN tb_hips_status.signature_count IS '시그니처 갯수';
    COMMENT ON COLUMN tb_hips_status.recommendation_status IS 'IPS 추천 분석 상태';
    COMMENT ON COLUMN tb_hips_status.recommendation_date IS 'IPS 추천 분석 시각';
    COMMENT ON COLUMN tb_hips_status.license_no IS '라이선스 번호';
    COMMENT ON COLUMN tb_hips_status.license_user IS '라이선스 사용자';
    COMMENT ON COLUMN tb_hips_status.license_org IS '라이선스 조직';
    COMMENT ON COLUMN tb_hips_status.integrity_status IS '무결성 상태';
    COMMENT ON COLUMN tb_hips_status.install_time IS '설치 시각';
    COMMENT ON COLUMN tb_hips_status.client_time IS '클라이언트 시각';
    COMMENT ON COLUMN tb_hips_status.tz_offset IS '시간대';
    COMMENT ON COLUMN tb_hips_status.server_time IS '변경 시각';
    COMMENT ON COLUMN tb_hips_status.engine_state IS '엔진 초기화 성공 여부';
    COMMENT ON COLUMN tb_hips_status.activation_code IS '액티베이션 코드';
    COMMENT ON COLUMN tb_hips_status.fw_network_running IS 'FW 네트워크 사용 여부(ON/OFF)';
    COMMENT ON COLUMN tb_hips_status.fw_block_nation_running IS 'FW 차단 국가 사용 여부(ON/OFF)';
    COMMENT ON COLUMN tb_hips_status.fw_block_ip_running IS 'FW 차단 IP 사용 여부(ON/OFF)';
    COMMENT ON COLUMN tb_hips_status.ssl_inspection_running IS 'SSL 감시 사용 여부(ON/OFF)';
    COMMENT ON COLUMN tb_hips_status.ssl_inspection_init_time IS 'SSL 감시 최초 설정 시간';
    COMMENT ON COLUMN tb_hips_status.ssl_inspection_modified_time IS 'SSL 감시 설정 수정 시간';
    COMMENT ON COLUMN tb_hips_status.ssl_engine_mode IS 'SSL 프록시 동작 모드 ("PORT" or "NS")';
    COMMENT ON COLUMN tb_hips_status.ssl_engine_port IS 'SSL 점유할 포트 넘버';
    COMMENT ON COLUMN tb_hips_status.ssl_engine_limit_session IS 'SSL 처리할 세션 제한 개수';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_status' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_hips_status ADD CONSTRAINT tb_hips_status_pkey PRIMARY KEY (node_id, product_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_hips_fw_event_log_obj_id';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_fw_event_log_obj_id();
    COMMENT ON TABLE tb_hips_fw_event_log_obj_id IS 'HIPS 방화벽 이벤트 로그 obj_id 관리';

    ALTER TABLE IF EXISTS tb_hips_fw_event_log_obj_id ADD COLUMN IF NOT EXISTS obj_id text;
    ALTER TABLE IF EXISTS tb_hips_fw_event_log_obj_id ADD COLUMN IF NOT EXISTS row_number bigint;

    COMMENT ON COLUMN tb_hips_fw_event_log_obj_id.obj_id IS 'MongoDB object ID';
    COMMENT ON COLUMN tb_hips_fw_event_log_obj_id.row_number IS '순서';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_fw_event_log_obj_id' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_hips_fw_event_log_obj_id ADD CONSTRAINT tb_hips_fw_event_log_obj_id_pkey PRIMARY KEY (obj_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_hips_agent_event_log_obj_id';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_agent_event_log_obj_id();
    COMMENT ON TABLE tb_hips_agent_event_log_obj_id IS 'HIPS 에이전트 이벤트 로그 obj_id 관리';

    ALTER TABLE IF EXISTS tb_hips_agent_event_log_obj_id ADD COLUMN IF NOT EXISTS obj_id text;
    ALTER TABLE IF EXISTS tb_hips_agent_event_log_obj_id ADD COLUMN IF NOT EXISTS row_number bigint;

    COMMENT ON COLUMN tb_hips_agent_event_log_obj_id.obj_id IS 'MongoDB object ID';
    COMMENT ON COLUMN tb_hips_agent_event_log_obj_id.row_number IS '순서';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_agent_event_log_obj_id' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_hips_agent_event_log_obj_id ADD CONSTRAINT tb_hips_agent_event_log_obj_id_pkey PRIMARY KEY (obj_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_hips_detect_event_log_obj_id';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_detect_event_log_obj_id();
    COMMENT ON TABLE tb_hips_detect_event_log_obj_id IS 'IPS 이벤트 로그 obj_id 관리';

    ALTER TABLE IF EXISTS tb_hips_detect_event_log_obj_id ADD COLUMN IF NOT EXISTS obj_id text;
    ALTER TABLE IF EXISTS tb_hips_detect_event_log_obj_id ADD COLUMN IF NOT EXISTS row_number bigint;

    COMMENT ON COLUMN tb_hips_detect_event_log_obj_id.obj_id IS 'MongoDB object ID';
    COMMENT ON COLUMN tb_hips_detect_event_log_obj_id.row_number IS '순서';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_detect_event_log_obj_id' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_hips_detect_event_log_obj_id ADD CONSTRAINT tb_hips_detect_event_log_obj_id_pkey PRIMARY KEY (obj_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_ac_agent_event_log_obj_id';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_ac_agent_event_log_obj_id();
    COMMENT ON TABLE tb_ac_agent_event_log_obj_id IS 'AC 에이전트 이벤트 로그 obj_id 관리';

    ALTER TABLE IF EXISTS tb_ac_agent_event_log_obj_id ADD COLUMN IF NOT EXISTS obj_id text;
    ALTER TABLE IF EXISTS tb_ac_agent_event_log_obj_id ADD COLUMN IF NOT EXISTS row_number bigint;

    COMMENT ON COLUMN tb_ac_agent_event_log_obj_id.obj_id IS 'MongoDB object ID';
    COMMENT ON COLUMN tb_ac_agent_event_log_obj_id.row_number IS '순서';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_ac_agent_event_log_obj_id' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_ac_agent_event_log_obj_id ADD CONSTRAINT tb_ac_agent_event_log_obj_id_pkey PRIMARY KEY (obj_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_ac_exec_event_log_obj_id';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_ac_exec_event_log_obj_id();
    COMMENT ON TABLE tb_ac_exec_event_log_obj_id IS '실행 제어 이벤트 로그 obj_id 관리';

    ALTER TABLE IF EXISTS tb_ac_exec_event_log_obj_id ADD COLUMN IF NOT EXISTS obj_id text;
    ALTER TABLE IF EXISTS tb_ac_exec_event_log_obj_id ADD COLUMN IF NOT EXISTS row_number bigint;

    COMMENT ON COLUMN tb_ac_exec_event_log_obj_id.obj_id IS 'MongoDB object ID';
    COMMENT ON COLUMN tb_ac_exec_event_log_obj_id.row_number IS '순서';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_ac_exec_event_log_obj_id' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_ac_exec_event_log_obj_id ADD CONSTRAINT tb_ac_exec_event_log_obj_id_pkey PRIMARY KEY (obj_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_ac_access_event_log_obj_id';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_ac_access_event_log_obj_id();
    COMMENT ON TABLE tb_ac_access_event_log_obj_id IS 'AC 접근 제어 이벤트 로그 obj_id 관리';

    ALTER TABLE IF EXISTS tb_ac_access_event_log_obj_id ADD COLUMN IF NOT EXISTS obj_id text;
    ALTER TABLE IF EXISTS tb_ac_access_event_log_obj_id ADD COLUMN IF NOT EXISTS row_number bigint;

    COMMENT ON COLUMN tb_ac_access_event_log_obj_id.obj_id IS 'MongoDB object ID';
    COMMENT ON COLUMN tb_ac_access_event_log_obj_id.row_number IS '순서';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_ac_access_event_log_obj_id' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_ac_access_event_log_obj_id ADD CONSTRAINT tb_ac_access_event_log_obj_id_pkey PRIMARY KEY (obj_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_v3_alert_log_obj_id';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_v3_alert_log_obj_id ();
    COMMENT ON TABLE tb_v3_alert_log_obj_id IS '악성코드 감염정보 이벤트 로그  obj_id 관리';

    ALTER TABLE IF EXISTS tb_v3_alert_log_obj_id ADD COLUMN IF NOT EXISTS obj_id text;
    ALTER TABLE IF EXISTS tb_v3_alert_log_obj_id ADD COLUMN IF NOT EXISTS row_number bigint;

    COMMENT ON COLUMN tb_v3_alert_log_obj_id.obj_id IS 'MongoDB object ID';
    COMMENT ON COLUMN tb_v3_alert_log_obj_id.row_number IS '순서';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_v3_alert_log_obj_id' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_v3_alert_log_obj_id ADD CONSTRAINT tb_v3_alert_log_obj_id_pkey PRIMARY KEY (obj_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_v3_ss_log_obj_id';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_v3_ss_log_obj_id ();
    COMMENT ON TABLE tb_v3_ss_log_obj_id IS '실시간검사 이벤트 로그  obj_id 관리';

    ALTER TABLE IF EXISTS tb_v3_ss_log_obj_id ADD COLUMN IF NOT EXISTS obj_id text;
    ALTER TABLE IF EXISTS tb_v3_ss_log_obj_id ADD COLUMN IF NOT EXISTS row_number bigint;

    COMMENT ON COLUMN tb_v3_ss_log_obj_id.obj_id IS 'MongoDB object ID';
    COMMENT ON COLUMN tb_v3_ss_log_obj_id.row_number IS '순서';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_v3_ss_log_obj_id' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_v3_ss_log_obj_id ADD CONSTRAINT tb_v3_ss_log_obj_id_pkey PRIMARY KEY (obj_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_v3_is_log_obj_id';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_v3_is_log_obj_id ();
    COMMENT ON TABLE tb_v3_is_log_obj_id IS '인터넷보안 이벤트 로그  obj_id 관리';

    ALTER TABLE IF EXISTS tb_v3_is_log_obj_id ADD COLUMN IF NOT EXISTS obj_id text;
    ALTER TABLE IF EXISTS tb_v3_is_log_obj_id ADD COLUMN IF NOT EXISTS row_number bigint;

    COMMENT ON COLUMN tb_v3_is_log_obj_id.obj_id IS 'MongoDB object ID';
    COMMENT ON COLUMN tb_v3_is_log_obj_id.row_number IS '순서';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_v3_is_log_obj_id' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_v3_is_log_obj_id ADD CONSTRAINT tb_v3_is_log_obj_id_pkey PRIMARY KEY (obj_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_v3_sup_log_obj_id';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_v3_sup_log_obj_id ();
    COMMENT ON TABLE tb_v3_sup_log_obj_id IS 'V3업데이트 이벤트 로그  obj_id 관리';

    ALTER TABLE IF EXISTS tb_v3_sup_log_obj_id ADD COLUMN IF NOT EXISTS obj_id text;
    ALTER TABLE IF EXISTS tb_v3_sup_log_obj_id ADD COLUMN IF NOT EXISTS row_number bigint;

    COMMENT ON COLUMN tb_v3_sup_log_obj_id.obj_id IS 'MongoDB object ID';
    COMMENT ON COLUMN tb_v3_sup_log_obj_id.row_number IS '순서';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_v3_sup_log_obj_id' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_v3_sup_log_obj_id ADD CONSTRAINT tb_v3_sup_log_obj_id_pkey PRIMARY KEY (obj_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_service_log_obj_id';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_service_log_obj_id ();
    COMMENT ON TABLE tb_service_log_obj_id IS '서비스 이벤트 로그 obj_id 관리';

    ALTER TABLE IF EXISTS tb_service_log_obj_id ADD COLUMN IF NOT EXISTS obj_id text;
    ALTER TABLE IF EXISTS tb_service_log_obj_id ADD COLUMN IF NOT EXISTS row_number bigint;

    COMMENT ON COLUMN tb_service_log_obj_id.obj_id IS 'MongoDB object ID';
    COMMENT ON COLUMN tb_service_log_obj_id.row_number IS '순서';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_service_log_obj_id' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_service_log_obj_id ADD CONSTRAINT tb_service_log_obj_id_pkey PRIMARY KEY (obj_id);
    END IF;


END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_node_hw_obj_id';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_node_hw_obj_id ();
    COMMENT ON TABLE tb_node_hw_obj_id IS '하드웨어 자산변경 로그  obj_id 관리';

    ALTER TABLE IF EXISTS tb_node_hw_obj_id ADD COLUMN IF NOT EXISTS obj_id text;
    ALTER TABLE IF EXISTS tb_node_hw_obj_id ADD COLUMN IF NOT EXISTS obj_number integer;
    ALTER TABLE IF EXISTS tb_node_hw_obj_id ADD COLUMN IF NOT EXISTS row_number bigint;

    COMMENT ON COLUMN tb_node_hw_obj_id.obj_id IS 'MongoDB object ID';
    COMMENT ON COLUMN tb_node_hw_obj_id.obj_number IS 'MongoDB object ID당 순서';
    COMMENT ON COLUMN tb_node_hw_obj_id.row_number IS '순서';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_node_hw_obj_id' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_node_hw_obj_id ADD CONSTRAINT tb_node_hw_obj_id_pkey PRIMARY KEY (obj_id, obj_number);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_node_sw_obj_id';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_node_sw_obj_id ();
    COMMENT ON TABLE tb_node_sw_obj_id IS '소프트웨어 자산 변경 로그 obj_id 관리';

    ALTER TABLE IF EXISTS tb_node_sw_obj_id ADD COLUMN IF NOT EXISTS obj_id text;
    ALTER TABLE IF EXISTS tb_node_sw_obj_id ADD COLUMN IF NOT EXISTS obj_number integer;
    ALTER TABLE IF EXISTS tb_node_sw_obj_id ADD COLUMN IF NOT EXISTS row_number bigint;

    COMMENT ON COLUMN tb_node_sw_obj_id.obj_id IS 'MongoDB object ID';
    COMMENT ON COLUMN tb_node_sw_obj_id.obj_number IS 'MongoDB object ID당 순서';
    COMMENT ON COLUMN tb_node_sw_obj_id.row_number IS '순서';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_node_sw_obj_id' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_node_sw_obj_id ADD CONSTRAINT tb_node_sw_obj_id_pkey PRIMARY KEY (obj_id, obj_number);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_task_target_status';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_task_target_status ();
    COMMENT ON TABLE tb_task_target_status IS '작업 대상 상태';

    ALTER TABLE IF EXISTS tb_task_target_status ADD COLUMN IF NOT EXISTS task_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_task_target_status ADD COLUMN IF NOT EXISTS instance_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_task_target_status ADD COLUMN IF NOT EXISTS task_target_type en_task_target_type NOT NULL;
    ALTER TABLE IF EXISTS tb_task_target_status ADD COLUMN IF NOT EXISTS target_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_task_target_status ADD COLUMN IF NOT EXISTS task_status en_task_status;
    ALTER TABLE IF EXISTS tb_task_target_status ADD COLUMN IF NOT EXISTS task_error text;
    ALTER TABLE IF EXISTS tb_task_target_status ADD COLUMN IF NOT EXISTS client_time timestamp with time zone;
    ALTER TABLE IF EXISTS tb_task_target_status ADD COLUMN IF NOT EXISTS tz_offset integer;
    ALTER TABLE IF EXISTS tb_task_target_status ADD COLUMN IF NOT EXISTS server_time timestamp with time zone DEFAULT now();
    ALTER TABLE IF EXISTS tb_task_target_status ADD COLUMN IF NOT EXISTS start_time timestamp without time zone DEFAULT now();
    ALTER TABLE IF EXISTS tb_task_target_status ADD COLUMN IF NOT EXISTS task_type en_task_type;
    ALTER TABLE IF EXISTS tb_task_target_status ADD COLUMN IF NOT EXISTS product_id en_product_id_type DEFAULT 'AGENT'::en_product_id_type;

    COMMENT ON COLUMN tb_task_target_status.task_id IS '작업 ID';
    COMMENT ON COLUMN tb_task_target_status.instance_id IS '예약 작업 인스턴스 ID';
    COMMENT ON COLUMN tb_task_target_status.task_target_type IS '작업 대상 타입';
    COMMENT ON COLUMN tb_task_target_status.target_id IS '대상 ID';
    COMMENT ON COLUMN tb_task_target_status.task_status IS '작업 상태';
    COMMENT ON COLUMN tb_task_target_status.task_error IS '작업 에러';
    COMMENT ON COLUMN tb_task_target_status.client_time IS '클라이언트 시각';
    COMMENT ON COLUMN tb_task_target_status.tz_offset IS '시간대';
    COMMENT ON COLUMN tb_task_target_status.server_time IS 'MongoDB object ID';
    COMMENT ON COLUMN tb_task_target_status.start_time IS '서버 시각';
    COMMENT ON COLUMN tb_task_target_status.task_type IS '작업 타입';
    COMMENT ON COLUMN tb_task_target_status.product_id IS '제품 ID';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_task_target_status' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_task_target_status ADD CONSTRAINT tb_task_target_status_pkey PRIMARY KEY (task_id, instance_id, task_target_type, target_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_audit_log_obj_id';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_audit_log_obj_id ();
    COMMENT ON TABLE tb_audit_log_obj_id IS '관리자 이벤트 로그 obj_id 관리';

    ALTER TABLE IF EXISTS tb_audit_log_obj_id ADD COLUMN IF NOT EXISTS obj_id text;
    ALTER TABLE IF EXISTS tb_audit_log_obj_id ADD COLUMN IF NOT EXISTS row_number bigint;

    COMMENT ON COLUMN tb_audit_log_obj_id.obj_id IS 'MongoDB object ID';
    COMMENT ON COLUMN tb_audit_log_obj_id.row_number IS '순서';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_audit_log_obj_id' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_audit_log_obj_id ADD CONSTRAINT tb_audit_log_obj_id_obj_id_pkey PRIMARY KEY (obj_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_engine_update_log_obj_id';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_engine_update_log_obj_id ();
    COMMENT ON TABLE tb_engine_update_log_obj_id IS '업데이트 이벤트 로그 obj_id 관리';

    ALTER TABLE IF EXISTS tb_engine_update_log_obj_id ADD COLUMN IF NOT EXISTS obj_id text;
    ALTER TABLE IF EXISTS tb_engine_update_log_obj_id ADD COLUMN IF NOT EXISTS row_number bigint;

    COMMENT ON COLUMN tb_engine_update_log_obj_id.obj_id IS 'MongoDB object ID';
    COMMENT ON COLUMN tb_engine_update_log_obj_id.row_number IS '순서';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_engine_update_log_obj_id' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_engine_update_log_obj_id ADD CONSTRAINT tb_engine_update_log_obj_id_pkey PRIMARY KEY (obj_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_backup_log_obj_id';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_backup_log_obj_id ();
    COMMENT ON TABLE tb_backup_log_obj_id IS '백업 이벤트 로그 obj_id 관리';

    ALTER TABLE IF EXISTS tb_backup_log_obj_id ADD COLUMN IF NOT EXISTS obj_id text;
    ALTER TABLE IF EXISTS tb_backup_log_obj_id ADD COLUMN IF NOT EXISTS row_number bigint;

    COMMENT ON COLUMN tb_backup_log_obj_id.obj_id IS 'MongoDB object ID';
    COMMENT ON COLUMN tb_backup_log_obj_id.row_number IS '순서';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_backup_log_obj_id' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_backup_log_obj_id ADD CONSTRAINT tb_backup_log_obj_id_pkey PRIMARY KEY (obj_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_pkg_dist_log_obj_id';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_pkg_dist_log_obj_id ();
    COMMENT ON TABLE tb_pkg_dist_log_obj_id IS '배포 이벤트 로그 obj_id 관리';

    ALTER TABLE IF EXISTS tb_pkg_dist_log_obj_id ADD COLUMN IF NOT EXISTS obj_id text;
    ALTER TABLE IF EXISTS tb_pkg_dist_log_obj_id ADD COLUMN IF NOT EXISTS row_number bigint;

    COMMENT ON COLUMN tb_pkg_dist_log_obj_id.obj_id IS 'MongoDB object ID';
    COMMENT ON COLUMN tb_pkg_dist_log_obj_id.row_number IS '순서';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_pkg_dist_log_obj_id' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_pkg_dist_log_obj_id ADD CONSTRAINT tb_pkg_dist_log_obj_id_pkey PRIMARY KEY (obj_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_pkg_sync_log_obj_id';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_pkg_sync_log_obj_id ();
    COMMENT ON TABLE tb_pkg_sync_log_obj_id IS '파일동기화 이벤트 로그 obj_id 관리';

    ALTER TABLE IF EXISTS tb_pkg_sync_log_obj_id ADD COLUMN IF NOT EXISTS obj_id text;
    ALTER TABLE IF EXISTS tb_pkg_sync_log_obj_id ADD COLUMN IF NOT EXISTS row_number bigint;

    COMMENT ON COLUMN tb_pkg_sync_log_obj_id.obj_id IS 'MongoDB object ID';
    COMMENT ON COLUMN tb_pkg_sync_log_obj_id.row_number IS '순서';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_pkg_sync_log_obj_id' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_pkg_sync_log_obj_id ADD CONSTRAINT tb_pkg_sync_log_obj_id_pkey PRIMARY KEY (obj_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_agent_install_pkg_log_obj_id';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_agent_install_pkg_log_obj_id ();
    COMMENT ON TABLE tb_agent_install_pkg_log_obj_id IS '에이전트 설치파일 이벤트 로그 obj_id 관리';

    ALTER TABLE IF EXISTS tb_agent_install_pkg_log_obj_id ADD COLUMN IF NOT EXISTS obj_id text;
    ALTER TABLE IF EXISTS tb_agent_install_pkg_log_obj_id ADD COLUMN IF NOT EXISTS row_number bigint;

    COMMENT ON COLUMN tb_agent_install_pkg_log_obj_id.obj_id IS 'MongoDB object ID';
    COMMENT ON COLUMN tb_agent_install_pkg_log_obj_id.row_number IS '순서';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_agent_install_pkg_log_obj_id' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_agent_install_pkg_log_obj_id ADD CONSTRAINT tb_agent_install_pkg_log_obj_id_pkey PRIMARY KEY (obj_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_agent_event_log_obj_id';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_agent_event_log_obj_id ();
    COMMENT ON TABLE tb_agent_event_log_obj_id IS 'CPP 에이전트 이벤트 로그 obj_id 관리';

    ALTER TABLE IF EXISTS tb_agent_event_log_obj_id ADD COLUMN IF NOT EXISTS obj_id text;
    ALTER TABLE IF EXISTS tb_agent_event_log_obj_id ADD COLUMN IF NOT EXISTS row_number bigint;

    COMMENT ON COLUMN tb_agent_event_log_obj_id.obj_id IS 'MongoDB object ID';
    COMMENT ON COLUMN tb_agent_event_log_obj_id.row_number IS '순서';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_agent_event_log_obj_id' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_agent_event_log_obj_id ADD CONSTRAINT tb_agent_event_log_obj_id_pkey PRIMARY KEY (obj_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_task_status_log_obj_id';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_task_status_log_obj_id ();
    COMMENT ON TABLE tb_task_status_log_obj_id IS '작업이력 이벤트 로그  obj_id 관리';

    ALTER TABLE IF EXISTS tb_task_status_log_obj_id ADD COLUMN IF NOT EXISTS obj_id text;
    ALTER TABLE IF EXISTS tb_task_status_log_obj_id ADD COLUMN IF NOT EXISTS row_number bigint;

    COMMENT ON COLUMN tb_task_status_log_obj_id.obj_id IS 'MongoDB object ID';
    COMMENT ON COLUMN tb_task_status_log_obj_id.row_number IS '순서';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_task_status_log_obj_id' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_task_status_log_obj_id ADD CONSTRAINT tb_task_status_log_obj_id_pkey PRIMARY KEY (obj_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_server_alert_log_obj_id';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_server_alert_log_obj_id ();
    COMMENT ON TABLE tb_server_alert_log_obj_id IS '서버 이벤트 로그  obj_id 관리';

    ALTER TABLE IF EXISTS tb_server_alert_log_obj_id ADD COLUMN IF NOT EXISTS obj_id text;
    ALTER TABLE IF EXISTS tb_server_alert_log_obj_id ADD COLUMN IF NOT EXISTS row_number bigint;

    COMMENT ON COLUMN tb_server_alert_log_obj_id.obj_id IS 'MongoDB object ID';
    COMMENT ON COLUMN tb_server_alert_log_obj_id.row_number IS '순서';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_server_alert_log_obj_id' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_server_alert_log_obj_id ADD CONSTRAINT tb_server_alert_log_obj_id_pkey PRIMARY KEY (obj_id);
    END IF;

END $$ LANGUAGE 'plpgsql';


------------------------------------------------------------------------------------------
select '## tb_policy_status';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_policy_status ();
    COMMENT ON TABLE tb_policy_status IS '정책 적용 상태';

    ALTER TABLE IF EXISTS tb_policy_status ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_policy_status ADD COLUMN IF NOT EXISTS product_feature_id en_product_feature_id_type NOT NULL;
    ALTER TABLE IF EXISTS tb_policy_status ADD COLUMN IF NOT EXISTS policy_status en_policy_status;
    ALTER TABLE IF EXISTS tb_policy_status ADD COLUMN IF NOT EXISTS server_time timestamp with time zone DEFAULT now();
    ALTER TABLE IF EXISTS tb_policy_status ADD COLUMN IF NOT EXISTS tz_offset integer;
    ALTER TABLE IF EXISTS tb_policy_status ADD COLUMN IF NOT EXISTS apply_time timestamp with time zone;
    ALTER TABLE IF EXISTS tb_policy_status ADD COLUMN IF NOT EXISTS policy_id bigint;

    COMMENT ON COLUMN tb_policy_status.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_policy_status.product_feature_id IS '제품 기능 ID';
    COMMENT ON COLUMN tb_policy_status.policy_status IS '정책 적용 상태';
    COMMENT ON COLUMN tb_policy_status.server_time IS '변경 시각';
    COMMENT ON COLUMN tb_policy_status.tz_offset IS '시간대';
    COMMENT ON COLUMN tb_policy_status.apply_time IS '적용 시각';
    COMMENT ON COLUMN tb_policy_status.policy_id IS '정책 ID';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_policy_status' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_policy_status ADD CONSTRAINT tb_policy_status_pkey PRIMARY KEY (node_id, product_feature_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_timeline_v3';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_timeline_v3 ();
    COMMENT ON TABLE tb_timeline_v3 IS '에이전트별 V3 악성코드 치료 타임라인';

    ALTER TABLE IF EXISTS tb_timeline_v3 ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_timeline_v3 ADD COLUMN IF NOT EXISTS reg_date text NOT NULL;
    ALTER TABLE IF EXISTS tb_timeline_v3 ADD COLUMN IF NOT EXISTS malware_clean_count bigint;
    ALTER TABLE IF EXISTS tb_timeline_v3 ADD COLUMN IF NOT EXISTS malware_clean_fail_count bigint;
    ALTER TABLE IF EXISTS tb_timeline_v3 ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;

    COMMENT ON COLUMN tb_timeline_v3.node_id IS '노드';
    COMMENT ON COLUMN tb_timeline_v3.reg_date IS '등록 일자';
    COMMENT ON COLUMN tb_timeline_v3.malware_clean_count IS '악성코드 치료 개수';
    COMMENT ON COLUMN tb_timeline_v3.malware_clean_fail_count IS '악성코드 치료 실패 개수';
    COMMENT ON COLUMN tb_timeline_v3.modified_time IS '변경 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_timeline_v3' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_timeline_v3 ADD CONSTRAINT tb_timeline_v3_pkey PRIMARY KEY (node_id, reg_date);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_hourly_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hourly_timeline ();
    COMMENT ON TABLE tb_hourly_timeline IS '시간별 타임라인';

    ALTER TABLE IF EXISTS tb_hourly_timeline ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_hourly_timeline ADD COLUMN IF NOT EXISTS reg_date text NOT NULL;
    ALTER TABLE IF EXISTS tb_hourly_timeline ADD COLUMN IF NOT EXISTS malware_clean_count bigint;
    ALTER TABLE IF EXISTS tb_hourly_timeline ADD COLUMN IF NOT EXISTS malware_clean_fail_count bigint;
    ALTER TABLE IF EXISTS tb_hourly_timeline ADD COLUMN IF NOT EXISTS engine_type en_engine_type;
    ALTER TABLE IF EXISTS tb_hourly_timeline ADD COLUMN IF NOT EXISTS is_latest_engine_update boolean;

    COMMENT ON COLUMN tb_hourly_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_hourly_timeline.reg_date IS '등록 일자';
    COMMENT ON COLUMN tb_hourly_timeline.malware_clean_count IS '악성코드 치료 개수';
    COMMENT ON COLUMN tb_hourly_timeline.malware_clean_fail_count IS '악성코드 치료 실패 개수';
    COMMENT ON COLUMN tb_hourly_timeline.engine_type IS '엔진 타입';
    COMMENT ON COLUMN tb_hourly_timeline.is_latest_engine_update IS '최신 엔진 여부';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hourly_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_hourly_timeline ADD CONSTRAINT tb_hourly_timeline_pkey PRIMARY KEY (node_id, reg_date);
    END IF;
END $$ LANGUAGE 'plpgsql';
------------------------------------------------------------------------------------------
select '## tb_v3_alert_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_v3_alert_timeline ();
    COMMENT ON TABLE tb_v3_alert_timeline IS '에이전트 시간별 감염현황';

    ALTER TABLE IF EXISTS tb_v3_alert_timeline ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_v3_alert_timeline ADD COLUMN IF NOT EXISTS reg_date timestamp without time zone NOT NULL;
    ALTER TABLE IF EXISTS tb_v3_alert_timeline ADD COLUMN IF NOT EXISTS client_time timestamp without time zone NOT NULL;
    ALTER TABLE IF EXISTS tb_v3_alert_timeline ADD COLUMN IF NOT EXISTS ip text;
    ALTER TABLE IF EXISTS tb_v3_alert_timeline ADD COLUMN IF NOT EXISTS malware_name text;
    ALTER TABLE IF EXISTS tb_v3_alert_timeline ADD COLUMN IF NOT EXISTS path text;
    ALTER TABLE IF EXISTS tb_v3_alert_timeline ADD COLUMN IF NOT EXISTS status text;
    ALTER TABLE IF EXISTS tb_v3_alert_timeline ADD COLUMN IF NOT EXISTS scan_type text;
    ALTER TABLE IF EXISTS tb_v3_alert_timeline ADD COLUMN IF NOT EXISTS count bigint;
    ALTER TABLE IF EXISTS tb_v3_alert_timeline ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;

    COMMENT ON COLUMN tb_v3_alert_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_v3_alert_timeline.reg_date IS '등록 일자';
    COMMENT ON COLUMN tb_v3_alert_timeline.client_time IS '클라이언트 시각';
    COMMENT ON COLUMN tb_v3_alert_timeline.ip IS 'IP';
    COMMENT ON COLUMN tb_v3_alert_timeline.malware_name IS '악성코드 명';
    COMMENT ON COLUMN tb_v3_alert_timeline.path IS '악성코드 경로';
    COMMENT ON COLUMN tb_v3_alert_timeline.status IS '상태';
    COMMENT ON COLUMN tb_v3_alert_timeline.scan_type IS '검사유형';
    COMMENT ON COLUMN tb_v3_alert_timeline.count IS '감염/치료/삭제/기타 횟수 (status에 따라 다름)';
    COMMENT ON COLUMN tb_v3_alert_timeline.modified_time IS '변경 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_v3_alert_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_v3_alert_timeline ADD CONSTRAINT tb_v3_alert_timeline_pkey PRIMARY KEY (node_id, reg_date, ip, malware_name, path, status, scan_type);
    END IF;
END $$ LANGUAGE 'plpgsql';
------------------------------------------------------------------------------------------
select '## tb_amc_alert_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_amc_alert_timeline ();
    COMMENT ON TABLE tb_amc_alert_timeline IS 'AMC 악성코드 시간별 감염현황';

    ALTER TABLE IF EXISTS tb_amc_alert_timeline ADD COLUMN IF NOT EXISTS reg_date timestamp with time zone NOT NULL;
    ALTER TABLE IF EXISTS tb_amc_alert_timeline ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_amc_alert_timeline ADD COLUMN IF NOT EXISTS ctnr_id text;
    ALTER TABLE IF EXISTS tb_amc_alert_timeline ADD COLUMN IF NOT EXISTS ns_id text;
    ALTER TABLE IF EXISTS tb_amc_alert_timeline ADD COLUMN IF NOT EXISTS k8s_node_id text;
    ALTER TABLE IF EXISTS tb_amc_alert_timeline ADD COLUMN IF NOT EXISTS pod_id text;
    ALTER TABLE IF EXISTS tb_amc_alert_timeline ADD COLUMN IF NOT EXISTS count bigint;
    ALTER TABLE IF EXISTS tb_amc_alert_timeline ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;

    COMMENT ON COLUMN tb_amc_alert_timeline.reg_date IS '등록 일자';
    COMMENT ON COLUMN tb_amc_alert_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_amc_alert_timeline.ctnr_id IS '컨테이너 id';
    COMMENT ON COLUMN tb_amc_alert_timeline.ns_id IS 'name space id';
    COMMENT ON COLUMN tb_amc_alert_timeline.k8s_node_id IS 'k8s 노드 id';
    COMMENT ON COLUMN tb_amc_alert_timeline.pod_id IS 'pod id';
    COMMENT ON COLUMN tb_amc_alert_timeline.count IS '통합 카운트 (탐지, 치료, 등등 모두 포함)';
    COMMENT ON COLUMN tb_amc_alert_timeline.modified_time IS '변경 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_amc_alert_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_amc_alert_timeline ADD CONSTRAINT tb_amc_alert_timeline_pkey PRIMARY KEY (reg_date, node_id, ctnr_id, ns_id, k8s_node_id, pod_id);
    END IF;
END $$ LANGUAGE 'plpgsql';
------------------------------------------------------------------------------------------
select '## tb_hips_runtime_ips_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_runtime_ips_timeline ();
    COMMENT ON TABLE tb_hips_runtime_ips_timeline IS 'HIPS runtime ips 시간별 탐지/차단 ';

    ALTER TABLE IF EXISTS tb_hips_runtime_ips_timeline ADD COLUMN IF NOT EXISTS reg_date timestamp with time zone NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_runtime_ips_timeline ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_runtime_ips_timeline ADD COLUMN IF NOT EXISTS container_id text;
    ALTER TABLE IF EXISTS tb_hips_runtime_ips_timeline ADD COLUMN IF NOT EXISTS ns_id text;
    ALTER TABLE IF EXISTS tb_hips_runtime_ips_timeline ADD COLUMN IF NOT EXISTS k8s_node_id text;
    ALTER TABLE IF EXISTS tb_hips_runtime_ips_timeline ADD COLUMN IF NOT EXISTS pod_id text;
    ALTER TABLE IF EXISTS tb_hips_runtime_ips_timeline ADD COLUMN IF NOT EXISTS count bigint;
    ALTER TABLE IF EXISTS tb_hips_runtime_ips_timeline ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;

    COMMENT ON COLUMN tb_hips_runtime_ips_timeline.reg_date IS '등록 일자';
    COMMENT ON COLUMN tb_hips_runtime_ips_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_hips_runtime_ips_timeline.container_id IS '컨테이너 id';
    COMMENT ON COLUMN tb_hips_runtime_ips_timeline.ns_id IS 'name space id';
    COMMENT ON COLUMN tb_hips_runtime_ips_timeline.k8s_node_id IS 'k8s 노드 id';
    COMMENT ON COLUMN tb_hips_runtime_ips_timeline.pod_id IS 'pod id';
    COMMENT ON COLUMN tb_hips_runtime_ips_timeline.count IS '카운트';
    COMMENT ON COLUMN tb_hips_runtime_ips_timeline.modified_time IS '변경 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_runtime_ips_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_hips_runtime_ips_timeline ADD CONSTRAINT tb_hips_runtime_ips_timeline_pkey PRIMARY KEY (reg_date, node_id, container_id, ns_id, k8s_node_id, pod_id);
    END IF;
END $$ LANGUAGE 'plpgsql';
------------------------------------------------------------------------------------------
select '## tb_hips_runtime_fw_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_runtime_fw_timeline ();
    COMMENT ON TABLE tb_hips_runtime_fw_timeline IS 'Hips runtime fw 시간별 차단 ';

    ALTER TABLE IF EXISTS tb_hips_runtime_fw_timeline ADD COLUMN IF NOT EXISTS reg_date timestamp with time zone NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_runtime_fw_timeline ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_runtime_fw_timeline ADD COLUMN IF NOT EXISTS container_id text;
    ALTER TABLE IF EXISTS tb_hips_runtime_fw_timeline ADD COLUMN IF NOT EXISTS ns_id text;
    ALTER TABLE IF EXISTS tb_hips_runtime_fw_timeline ADD COLUMN IF NOT EXISTS k8s_node_id text;
    ALTER TABLE IF EXISTS tb_hips_runtime_fw_timeline ADD COLUMN IF NOT EXISTS pod_id text;
    ALTER TABLE IF EXISTS tb_hips_runtime_fw_timeline ADD COLUMN IF NOT EXISTS count bigint;
    ALTER TABLE IF EXISTS tb_hips_runtime_fw_timeline ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;

    COMMENT ON COLUMN tb_hips_runtime_fw_timeline.reg_date IS '등록 일자';
    COMMENT ON COLUMN tb_hips_runtime_fw_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_hips_runtime_fw_timeline.container_id IS '컨테이너 id';
    COMMENT ON COLUMN tb_hips_runtime_fw_timeline.ns_id IS 'name space id';
    COMMENT ON COLUMN tb_hips_runtime_fw_timeline.k8s_node_id IS 'k8s 노드 id';
    COMMENT ON COLUMN tb_hips_runtime_fw_timeline.pod_id IS 'pod id';
    COMMENT ON COLUMN tb_hips_runtime_fw_timeline.count IS '카운트';
    COMMENT ON COLUMN tb_hips_runtime_fw_timeline.modified_time IS '변경 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_runtime_fw_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_hips_runtime_fw_timeline ADD CONSTRAINT tb_hips_runtime_fw_timeline_pkey PRIMARY KEY (reg_date, node_id, container_id, ns_id, k8s_node_id, pod_id);
    END IF;
END $$ LANGUAGE 'plpgsql';
------------------------------------------------------------------------------------------
select '## tb_widget_item_type';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_widget_item_type ();
    COMMENT ON TABLE tb_widget_item_type IS '위젯 제품 그룹';

    ALTER TABLE IF EXISTS tb_widget_item_type ADD COLUMN IF NOT EXISTS widget_item_type en_widget_item_type;
    ALTER TABLE IF EXISTS tb_widget_item_type ADD COLUMN IF NOT EXISTS widget_item_sub_type text;
    ALTER TABLE IF EXISTS tb_widget_item_type ADD COLUMN IF NOT EXISTS product_group en_product_group_type;
    ALTER TABLE IF EXISTS tb_widget_item_type ADD COLUMN IF NOT EXISTS description text;

    COMMENT ON COLUMN tb_widget_item_type.widget_item_type IS '위젯 항목 타입';
    COMMENT ON COLUMN tb_widget_item_type.widget_item_sub_type IS '위젯 항목 Sub 타입';
    COMMENT ON COLUMN tb_widget_item_type.product_group IS '제품 그룹';
    COMMENT ON COLUMN tb_widget_item_type.description IS '설명';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_widget_item_type' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_widget_item_type ADD CONSTRAINT tb_widget_item_type_pkey PRIMARY KEY (widget_item_type, widget_item_sub_type, product_group);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_widget_item_type' AND constraint_name = 'tb_widget_item_type_ukey' AND constraint_type = 'UNIQUE') THEN
        ALTER TABLE tb_widget_item_type ADD CONSTRAINT tb_widget_item_type_ukey UNIQUE (widget_item_sub_type);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_correlation_result';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_correlation_result ();
    COMMENT ON TABLE tb_correlation_result IS '연계규칙 결과';

    ALTER TABLE IF EXISTS tb_correlation_result ADD COLUMN IF NOT EXISTS correlation_rule_id bigint;
    ALTER TABLE IF EXISTS tb_correlation_result ADD COLUMN IF NOT EXISTS target_id bigint;
    ALTER TABLE IF EXISTS tb_correlation_result ADD COLUMN IF NOT EXISTS phase bigint DEFAULT 0;
    ALTER TABLE IF EXISTS tb_correlation_result ADD COLUMN IF NOT EXISTS macro_type en_correlation_condition_id_type;
    ALTER TABLE IF EXISTS tb_correlation_result ADD COLUMN IF NOT EXISTS macro_data text;
    ALTER TABLE IF EXISTS tb_correlation_result ADD COLUMN IF NOT EXISTS modified_time timestamp;

    COMMENT ON COLUMN tb_correlation_result.correlation_rule_id IS '연계규칙 ID';
    COMMENT ON COLUMN tb_correlation_result.target_id IS '대상 ID';
    COMMENT ON COLUMN tb_correlation_result.phase IS '단계';
    COMMENT ON COLUMN tb_correlation_result.macro_type IS '매크로 타입';
    COMMENT ON COLUMN tb_correlation_result.macro_data IS '매크로 데이터';
    COMMENT ON COLUMN tb_correlation_result.modified_time IS '변경 시각';
END $$ LANGUAGE 'plpgsql';


------------------------------------------------------------------------------------------
select '## tb_correlation_interim_data';
DO $$
BEGIN

    CREATE TABLE IF NOT EXISTS tb_correlation_interim_data ();
    COMMENT ON TABLE tb_correlation_interim_data IS '연계규칙 임시 정보';

    ALTER TABLE IF EXISTS tb_correlation_interim_data ADD COLUMN IF NOT EXISTS correlation_rule_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_correlation_interim_data ADD COLUMN IF NOT EXISTS data text;

    COMMENT ON COLUMN tb_correlation_interim_data.correlation_rule_id IS '연계규칙 ID';
    COMMENT ON COLUMN tb_correlation_interim_data.data IS '연계규칙 데이터';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_correlation_interim_data' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_correlation_interim_data ADD CONSTRAINT tb_correlation_interim_data_pkey PRIMARY KEY (correlation_rule_id);
    END IF;
END $$ LANGUAGE 'plpgsql';



------------------------------------------------------------------------------------------
select '## tb_olap_correlation_phase';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_olap_correlation_phase ();
    COMMENT ON TABLE tb_olap_correlation_phase IS '연계규칙 단계 관리';

    ALTER TABLE IF EXISTS tb_olap_correlation_phase ADD COLUMN IF NOT EXISTS correlation_rule_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_olap_correlation_phase ADD COLUMN IF NOT EXISTS phase bigint DEFAULT 0;
    ALTER TABLE IF EXISTS tb_olap_correlation_phase ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;

    COMMENT ON COLUMN tb_olap_correlation_phase.correlation_rule_id IS '연계규칙 ID';
    COMMENT ON COLUMN tb_olap_correlation_phase.phase IS '단계';
    COMMENT ON COLUMN tb_olap_correlation_phase.modified_time IS '변경 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_olap_correlation_phase' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_olap_correlation_phase ADD CONSTRAINT tb_olap_correlation_phase_pkey PRIMARY KEY (correlation_rule_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_server_resource';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_server_resource ();
    COMMENT ON TABLE tb_server_resource IS '서버 리소스 정보';

    ALTER TABLE IF EXISTS tb_server_resource ADD COLUMN IF NOT EXISTS log_time timestamp without time zone DEFAULT now() NOT NULL;
    ALTER TABLE IF EXISTS tb_server_resource ADD COLUMN IF NOT EXISTS server_id bigint;
    ALTER TABLE IF EXISTS tb_server_resource ADD COLUMN IF NOT EXISTS used_mem bigint;
    ALTER TABLE IF EXISTS tb_server_resource ADD COLUMN IF NOT EXISTS avail_mem bigint;
    ALTER TABLE IF EXISTS tb_server_resource ADD COLUMN IF NOT EXISTS used_hdd bigint;
    ALTER TABLE IF EXISTS tb_server_resource ADD COLUMN IF NOT EXISTS avail_hdd bigint;
    ALTER TABLE IF EXISTS tb_server_resource ADD COLUMN IF NOT EXISTS used_cpu bigint;
    ALTER TABLE IF EXISTS tb_server_resource ADD COLUMN IF NOT EXISTS avail_cpu bigint;
    ALTER TABLE IF EXISTS tb_server_resource ADD COLUMN IF NOT EXISTS used_traffic bigint;
    ALTER TABLE IF EXISTS tb_server_resource ADD COLUMN IF NOT EXISTS hdd_partition text;
    ALTER TABLE IF EXISTS tb_server_resource ADD COLUMN IF NOT EXISTS smart_info text;
    ALTER TABLE IF EXISTS tb_server_resource ADD COLUMN IF NOT EXISTS raid_state text;
    ALTER TABLE IF EXISTS tb_server_resource ADD COLUMN IF NOT EXISTS oltp_db_size bigint;
    ALTER TABLE IF EXISTS tb_server_resource ADD COLUMN IF NOT EXISTS log_db_size bigint;

    COMMENT ON COLUMN tb_server_resource.log_time IS '기록 시간';
    COMMENT ON COLUMN tb_server_resource.server_id IS '서버ID';
    COMMENT ON COLUMN tb_server_resource.used_mem IS '사용 메모리 용량';
    COMMENT ON COLUMN tb_server_resource.avail_mem IS '가용 메모리 용량';
    COMMENT ON COLUMN tb_server_resource.used_hdd IS '사용 디스크 크기';
    COMMENT ON COLUMN tb_server_resource.avail_hdd IS '가용 디스크 크기';
    COMMENT ON COLUMN tb_server_resource.used_cpu IS '사용 CPU';
    COMMENT ON COLUMN tb_server_resource.avail_cpu IS '가용 CPU';
    COMMENT ON COLUMN tb_server_resource.used_traffic IS '네트워크 사용량';
    COMMENT ON COLUMN tb_server_resource.hdd_partition IS '하드 파티션';
    COMMENT ON COLUMN tb_server_resource.smart_info IS 'S.M.A.R.T 정보';
    COMMENT ON COLUMN tb_server_resource.raid_state IS 'Raid상태 정보';
    COMMENT ON COLUMN tb_server_resource.oltp_db_size IS 'EPPOLTP DB 크기';
    COMMENT ON COLUMN tb_server_resource.log_db_size IS 'MongoDB 크기';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_server_resource' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_server_resource ADD CONSTRAINT tb_server_resource_pkey PRIMARY KEY (log_time);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_node_hw';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_node_hw ();
    COMMENT ON TABLE tb_node_hw IS '노드별 하드웨어';

    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS cpu_name text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS cpu_version text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS cpu_speed text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS memory_physical text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS memory_virtual text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS bios_date text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS bios_name text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS bios_vendor text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS bios_version text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS vga_resolution text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS vga_type text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS vga_chipset text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS vga_mem text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS hdd1_file_system text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS hdd1_size text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS hdd1_free text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS hdd2_file_system text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS hdd2_size text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS hdd2_free text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS hdd3_file_system text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS hdd3_size text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS hdd3_free text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS hdd4_file_system text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS hdd4_size text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS hdd4_free text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS hdd5_file_system text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS hdd5_size text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS hdd5_free text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS host text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS iexplorer text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS winsock text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS nic1_mac text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS nic1_gw text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS nic1_ip text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS nic1_dhcp_use text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS nic1_dhcp_server text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS nic1_virtual text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS nic2_mac text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS nic2_gw text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS nic2_ip text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS nic2_dhcp_use text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS nic2_dhcp_server text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS nic2_virtual text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS nic3_mac text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS nic3_gw text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS nic3_ip text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS nic3_dhcp_use text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS nic3_dhcp_server text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS nic3_virtual text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS nic4_mac text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS nic4_gw text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS nic4_ip text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS nic4_dhcp_use text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS nic4_dhcp_server text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS nic4_virtual text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS nic5_mac text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS nic5_gw text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS nic5_ip text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS nic5_dhcp_use text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS nic5_dhcp_server text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS nic5_virtual text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS os_name text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS os_name_detail text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS os_install_time text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS os_version text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS os_platform text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS os_product_id text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS os_kernel_version text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS client_time timestamp with time zone;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS tz_offset integer;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS server_time timestamp with time zone DEFAULT now();
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS cpu_detail text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS agent_install_path text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS agent_hdd_usage text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS antimalware_install_path text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS antimalware_hdd_usage text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS ac_client_install_path text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS ac_client_hdd_usage text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS hips_client_install_path text;
    ALTER TABLE IF EXISTS tb_node_hw ADD COLUMN IF NOT EXISTS hips_client_hdd_usage text;

    COMMENT ON COLUMN tb_node_hw.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_node_hw.cpu_name IS 'CPU 명';
    COMMENT ON COLUMN tb_node_hw.cpu_version IS 'CPU 버전';
    COMMENT ON COLUMN tb_node_hw.cpu_speed IS 'CPU 속도';
    COMMENT ON COLUMN tb_node_hw.memory_physical IS '물리 메모리 크기';
    COMMENT ON COLUMN tb_node_hw.memory_virtual IS '가상 메모리 크기';
    COMMENT ON COLUMN tb_node_hw.bios_date IS '바이오스 날짜';
    COMMENT ON COLUMN tb_node_hw.bios_name IS '바이오스명';
    COMMENT ON COLUMN tb_node_hw.bios_vendor IS '바이오스 제조사';
    COMMENT ON COLUMN tb_node_hw.bios_version IS '바이오스 버전';
    COMMENT ON COLUMN tb_node_hw.vga_resolution IS '그래픽카드 해상도';
    COMMENT ON COLUMN tb_node_hw.vga_type IS '그래픽카드 타입';
    COMMENT ON COLUMN tb_node_hw.vga_chipset IS '그래픽카드 칩셋';
    COMMENT ON COLUMN tb_node_hw.vga_mem IS '그래픽카드 메모리 크기';
    COMMENT ON COLUMN tb_node_hw.hdd1_file_system IS 'HDD1 파일 시스템';
    COMMENT ON COLUMN tb_node_hw.hdd1_size IS 'HDD1 크기';
    COMMENT ON COLUMN tb_node_hw.hdd1_free IS 'HDD1 여유 공간';
    COMMENT ON COLUMN tb_node_hw.hdd2_file_system IS 'HDD2 파일 시스템';
    COMMENT ON COLUMN tb_node_hw.hdd2_size IS 'HDD2 크기';
    COMMENT ON COLUMN tb_node_hw.hdd2_free IS 'HDD2 여유 공간';
    COMMENT ON COLUMN tb_node_hw.hdd3_file_system IS 'HDD3 파일 시스템';
    COMMENT ON COLUMN tb_node_hw.hdd3_size IS 'HDD3 크기';
    COMMENT ON COLUMN tb_node_hw.hdd3_free IS 'HDD3 여유 공간';
    COMMENT ON COLUMN tb_node_hw.hdd4_file_system IS 'HDD4 파일 시스템';
    COMMENT ON COLUMN tb_node_hw.hdd4_size IS 'HDD4 크기';
    COMMENT ON COLUMN tb_node_hw.hdd4_free IS 'HDD4 여유 공간';
    COMMENT ON COLUMN tb_node_hw.hdd5_file_system IS 'HDD5 파일 시스템';
    COMMENT ON COLUMN tb_node_hw.hdd5_size IS 'HDD5 크기';
    COMMENT ON COLUMN tb_node_hw.hdd5_free IS 'HDD5 여유 공간';
    COMMENT ON COLUMN tb_node_hw.host IS '호스트명';
    COMMENT ON COLUMN tb_node_hw.iexplorer IS '인터넷 익스플로러 정보';
    COMMENT ON COLUMN tb_node_hw.winsock IS 'winsock 정보';
    COMMENT ON COLUMN tb_node_hw.nic1_mac IS 'NIC1 mac 주소';
    COMMENT ON COLUMN tb_node_hw.nic1_gw IS 'NIC1 게이트웨어';
    COMMENT ON COLUMN tb_node_hw.nic1_ip IS 'NIC1 IP';
    COMMENT ON COLUMN tb_node_hw.nic1_dhcp_use IS 'NIC1 DHCP 사용여부';
    COMMENT ON COLUMN tb_node_hw.nic1_dhcp_server IS 'NIC1 DHCP 서버';
    COMMENT ON COLUMN tb_node_hw.nic1_virtual IS 'NIC1 가상 여부';
    COMMENT ON COLUMN tb_node_hw.nic2_mac IS 'NIC2 mac 주소';
    COMMENT ON COLUMN tb_node_hw.nic2_gw IS 'NIC2 게이트웨어';
    COMMENT ON COLUMN tb_node_hw.nic2_ip IS 'NIC2 IP';
    COMMENT ON COLUMN tb_node_hw.nic2_dhcp_use IS 'NIC2 DHCP 사용여부';
    COMMENT ON COLUMN tb_node_hw.nic2_dhcp_server IS 'NIC2 DHCP 서버';
    COMMENT ON COLUMN tb_node_hw.nic2_virtual IS 'NIC2 가상 여부';
    COMMENT ON COLUMN tb_node_hw.nic3_mac IS 'NIC3 mac 주소';
    COMMENT ON COLUMN tb_node_hw.nic3_gw IS 'NIC3 게이트웨어';
    COMMENT ON COLUMN tb_node_hw.nic3_ip IS 'NIC3 IP';
    COMMENT ON COLUMN tb_node_hw.nic3_dhcp_use IS 'NIC3 DHCP 사용여부';
    COMMENT ON COLUMN tb_node_hw.nic3_dhcp_server IS 'NIC3 DHCP 서버';
    COMMENT ON COLUMN tb_node_hw.nic3_virtual IS 'NIC3 가상 여부';
    COMMENT ON COLUMN tb_node_hw.nic4_mac IS 'NIC4 mac 주소';
    COMMENT ON COLUMN tb_node_hw.nic4_gw IS 'NIC4 게이트웨어';
    COMMENT ON COLUMN tb_node_hw.nic4_ip IS 'NIC4 IP';
    COMMENT ON COLUMN tb_node_hw.nic4_dhcp_use IS 'NIC4 DHCP 사용여부';
    COMMENT ON COLUMN tb_node_hw.nic4_dhcp_server IS 'NIC4 DHCP 서버';
    COMMENT ON COLUMN tb_node_hw.nic4_virtual IS 'NIC4 가상 여부';
    COMMENT ON COLUMN tb_node_hw.nic5_mac IS 'NIC5 mac 주소';
    COMMENT ON COLUMN tb_node_hw.nic5_gw IS 'NIC5 게이트웨어';
    COMMENT ON COLUMN tb_node_hw.nic5_ip IS 'NIC5 IP';
    COMMENT ON COLUMN tb_node_hw.nic5_dhcp_use IS 'NIC5 DHCP 사용여부';
    COMMENT ON COLUMN tb_node_hw.nic5_dhcp_server IS 'NIC5 DHCP 서버';
    COMMENT ON COLUMN tb_node_hw.nic5_virtual IS 'NIC5 가상 여부';
    COMMENT ON COLUMN tb_node_hw.os_name IS '운영체제 명';
    COMMENT ON COLUMN tb_node_hw.os_name_detail IS '운영체제 상세';
    COMMENT ON COLUMN tb_node_hw.os_install_time IS '운영체제 설치 시각';
    COMMENT ON COLUMN tb_node_hw.os_version IS '운영체제 버전';
    COMMENT ON COLUMN tb_node_hw.os_platform IS '운영체제 플랫폼';
    COMMENT ON COLUMN tb_node_hw.os_product_id IS '운영체제 제품 ID';
    COMMENT ON COLUMN tb_node_hw.os_kernel_version IS '운영체제 커널 버전';
    COMMENT ON COLUMN tb_node_hw.client_time IS '클라이언트 시각';
    COMMENT ON COLUMN tb_node_hw.tz_offset IS '시간대';
    COMMENT ON COLUMN tb_node_hw.server_time IS '서버시각';
    COMMENT ON COLUMN tb_node_hw.cpu_detail IS 'CPU 상세';
    COMMENT ON COLUMN tb_node_hw.agent_install_path IS '에이전트 설치 경로';
    COMMENT ON COLUMN tb_node_hw.agent_hdd_usage IS '에이전트 HDD 사용량';
    COMMENT ON COLUMN tb_node_hw.antimalware_install_path IS 'Antimalware 설치 경로';
    COMMENT ON COLUMN tb_node_hw.antimalware_hdd_usage IS 'Antimalware HDD 사용량';
    COMMENT ON COLUMN tb_node_hw.ac_client_install_path IS 'AC 설치 경로';
    COMMENT ON COLUMN tb_node_hw.ac_client_hdd_usage IS 'AC HDD 사용량';
    COMMENT ON COLUMN tb_node_hw.hips_client_install_path IS 'HIPS 설치 경로';
    COMMENT ON COLUMN tb_node_hw.hips_client_hdd_usage IS 'HIPS HDD 사용량';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_node_hw' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_node_hw ADD CONSTRAINT tb_node_hw_pkey PRIMARY KEY (node_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_node_sw';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_node_sw ();
    COMMENT ON TABLE tb_node_sw IS '노드별 소프트웨어';

    ALTER TABLE IF EXISTS tb_node_sw ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_node_sw ADD COLUMN IF NOT EXISTS sw_name text NOT NULL;
    ALTER TABLE IF EXISTS tb_node_sw ADD COLUMN IF NOT EXISTS publisher text;
    ALTER TABLE IF EXISTS tb_node_sw ADD COLUMN IF NOT EXISTS version text;
    ALTER TABLE IF EXISTS tb_node_sw ADD COLUMN IF NOT EXISTS size text;
    ALTER TABLE IF EXISTS tb_node_sw ADD COLUMN IF NOT EXISTS install_time timestamp with time zone;
    ALTER TABLE IF EXISTS tb_node_sw ADD COLUMN IF NOT EXISTS server_time timestamp with time zone;
    ALTER TABLE IF EXISTS tb_node_sw ADD COLUMN IF NOT EXISTS tz_offset integer;
    ALTER TABLE IF EXISTS tb_node_sw ADD COLUMN IF NOT EXISTS client_time timestamp with time zone;
    ALTER TABLE IF EXISTS tb_node_sw ADD COLUMN IF NOT EXISTS sw_guid text NOT NULL;

    COMMENT ON COLUMN tb_node_sw.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_node_sw.sw_name IS '소프트웨어 명';
    COMMENT ON COLUMN tb_node_sw.publisher IS '게시자';
    COMMENT ON COLUMN tb_node_sw.version IS '버전';
    COMMENT ON COLUMN tb_node_sw.size IS '크기';
    COMMENT ON COLUMN tb_node_sw.install_time IS '설치 시각';
    COMMENT ON COLUMN tb_node_sw.server_time IS '서버시각';
    COMMENT ON COLUMN tb_node_sw.tz_offset IS '시간대';
    COMMENT ON COLUMN tb_node_sw.client_time IS '클라이언트 시각';
    COMMENT ON COLUMN tb_node_sw.sw_guid IS '소프트웨어 식별자';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_node_sw' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_node_sw ADD CONSTRAINT tb_node_sw_pkey PRIMARY KEY (node_id, sw_guid);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_engine_update';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_engine_update ();
    COMMENT ON TABLE tb_engine_update IS '엔진 업데이트';

    ALTER TABLE IF EXISTS tb_engine_update ADD COLUMN IF NOT EXISTS engine_date text NOT NULL;
    ALTER TABLE IF EXISTS tb_engine_update ADD COLUMN IF NOT EXISTS engine_type en_engine_type NOT NULL;
    ALTER TABLE IF EXISTS tb_engine_update ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;

    COMMENT ON COLUMN tb_engine_update.engine_date IS '엔진 날짜';
    COMMENT ON COLUMN tb_engine_update.engine_type IS '엔진 타입';
    COMMENT ON COLUMN tb_engine_update.modified_time IS '변경 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_engine_update' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_engine_update ADD CONSTRAINT tb_engine_update_pkey PRIMARY KEY (engine_date, engine_type);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------------------------------------------------------------
select '## tb_node_distribution_status';
DO $$
DECLARE
BEGIN
    CREATE TABLE IF NOT EXISTS tb_node_distribution_status ();
    COMMENT ON TABLE tb_node_distribution_status IS '노드별 배포 정보';

    ALTER TABLE IF EXISTS tb_node_distribution_status ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_node_distribution_status ADD COLUMN IF NOT EXISTS product_pkg_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_node_distribution_status ADD COLUMN IF NOT EXISTS task_id bigint;
    ALTER TABLE IF EXISTS tb_node_distribution_status ADD COLUMN IF NOT EXISTS instance_id bigint;
    ALTER TABLE IF EXISTS tb_node_distribution_status ADD COLUMN IF NOT EXISTS is_distributed boolean;
    ALTER TABLE IF EXISTS tb_node_distribution_status ADD COLUMN IF NOT EXISTS result_code text;
    ALTER TABLE IF EXISTS tb_node_distribution_status ADD COLUMN IF NOT EXISTS client_time timestamp with time zone;
    ALTER TABLE IF EXISTS tb_node_distribution_status ADD COLUMN IF NOT EXISTS tz_offset integer;
    ALTER TABLE IF EXISTS tb_node_distribution_status ADD COLUMN IF NOT EXISTS server_time timestamp without time zone;

    COMMENT ON COLUMN tb_node_distribution_status.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_node_distribution_status.product_pkg_id IS '제품 패키지 타입';
    COMMENT ON COLUMN tb_node_distribution_status.task_id IS '작업 ID';
    COMMENT ON COLUMN tb_node_distribution_status.instance_id IS '예약 작업 인스턴스 ID';
    COMMENT ON COLUMN tb_node_distribution_status.is_distributed IS '배포유무';
    COMMENT ON COLUMN tb_node_distribution_status.result_code IS '에러 코드';
    COMMENT ON COLUMN tb_node_distribution_status.client_time IS '클라이언트 시각';
    COMMENT ON COLUMN tb_node_distribution_status.tz_offset IS '시간대';
    COMMENT ON COLUMN tb_node_distribution_status.server_time IS '서버시각';

    IF NOT EXISTS(SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_node_distribution_status' AND constraint_type = 'PRIMARY KEY')
    THEN
        ALTER TABLE IF EXISTS tb_node_distribution_status ADD CONSTRAINT tb_node_distribution_status_pkey PRIMARY KEY (node_id, product_pkg_id);
    END IF;
END
$$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
--                                        CREATE TABLE IN cpp_olap TABLESPACE                                         --
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
select '## tb_hips_detect_hourly_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_detect_hourly_timeline() TABLESPACE cpp_olap;
    COMMENT ON TABLE tb_hips_detect_hourly_timeline IS '시간별 HIPS 탐지/차단 타임라인';

    ALTER TABLE IF EXISTS tb_hips_detect_hourly_timeline ADD COLUMN IF NOT EXISTS node_id int8 NOT NULL; -- 노드 ID
    ALTER TABLE IF EXISTS tb_hips_detect_hourly_timeline ADD COLUMN IF NOT EXISTS reg_date int4 NOT NULL; -- 등록 일자
    ALTER TABLE IF EXISTS tb_hips_detect_hourly_timeline ADD COLUMN IF NOT EXISTS detect_count int4 NULL; -- HIPS 탐지 카운트
    ALTER TABLE IF EXISTS tb_hips_detect_hourly_timeline ADD COLUMN IF NOT EXISTS block_count int4 NULL; -- HIPS 차단 카운트
    ALTER TABLE IF EXISTS tb_hips_detect_hourly_timeline ADD COLUMN IF NOT EXISTS critical_count int4 NULL; -- 위험도-critical 카운트
    ALTER TABLE IF EXISTS tb_hips_detect_hourly_timeline ADD COLUMN IF NOT EXISTS high_count int4 NULL; -- 위험도-high 카운트
    ALTER TABLE IF EXISTS tb_hips_detect_hourly_timeline ADD COLUMN IF NOT EXISTS medium_count int4 NULL; -- 위험도-medium 카운트
    ALTER TABLE IF EXISTS tb_hips_detect_hourly_timeline ADD COLUMN IF NOT EXISTS low_count int4 NULL; -- 위험도-low 카운트
    ALTER TABLE IF EXISTS tb_hips_detect_hourly_timeline ADD COLUMN IF NOT EXISTS information_count int4 NULL; -- 위험도-information 카운트

    COMMENT ON COLUMN tb_hips_detect_hourly_timeline.node_id IS '노드 ID';
        COMMENT ON COLUMN tb_hips_detect_hourly_timeline.reg_date IS '등록 일자';
        COMMENT ON COLUMN tb_hips_detect_hourly_timeline.detect_count IS 'HIPS 탐지 카운트';
        COMMENT ON COLUMN tb_hips_detect_hourly_timeline.block_count IS 'HIPS 차단 카운트';
        COMMENT ON COLUMN tb_hips_detect_hourly_timeline.critical_count IS '위험도-critical 카운트';
        COMMENT ON COLUMN tb_hips_detect_hourly_timeline.high_count IS '위험도-high 카운트';
        COMMENT ON COLUMN tb_hips_detect_hourly_timeline.medium_count IS '위험도-medium 카운트';
        COMMENT ON COLUMN tb_hips_detect_hourly_timeline.low_count IS '위험도-low 카운트';
        COMMENT ON COLUMN tb_hips_detect_hourly_timeline.information_count IS '위험도-information 카운트';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_detect_hourly_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_hips_detect_hourly_timeline ADD CONSTRAINT tb_hips_detect_hourly_timeline_pkey PRIMARY KEY (node_id, reg_date) USING INDEX TABLESPACE cpp_olap;
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_hips_detect_event_log_hourly';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_detect_event_log_hourly() TABLESPACE cpp_olap;
    COMMENT ON TABLE tb_hips_detect_event_log_hourly IS '시간별 HIPS 탐지/차단 로그';

    ALTER TABLE IF EXISTS tb_hips_detect_event_log_hourly ADD COLUMN IF NOT EXISTS obj_id text NOT NULL; -- MongoDB object ID
    ALTER TABLE IF EXISTS tb_hips_detect_event_log_hourly ADD COLUMN IF NOT EXISTS "collect" bool NOT NULL DEFAULT false; -- 수집여부
    ALTER TABLE IF EXISTS tb_hips_detect_event_log_hourly ADD COLUMN IF NOT EXISTS reg_date int4 NOT NULL; -- 등록날짜
    ALTER TABLE IF EXISTS tb_hips_detect_event_log_hourly ADD COLUMN IF NOT EXISTS node_id int8 NOT NULL; -- 노드ID
    ALTER TABLE IF EXISTS tb_hips_detect_event_log_hourly ADD COLUMN IF NOT EXISTS "action" text NOT NULL; -- 대응 방법
    ALTER TABLE IF EXISTS tb_hips_detect_event_log_hourly ADD COLUMN IF NOT EXISTS min_sec text NOT NULL; -- 분초
    ALTER TABLE IF EXISTS tb_hips_detect_event_log_hourly ADD COLUMN IF NOT EXISTS ip text NULL; -- Agent IP
    ALTER TABLE IF EXISTS tb_hips_detect_event_log_hourly ADD COLUMN IF NOT EXISTS computer_name text NULL; -- Agent 컴퓨터명
    ALTER TABLE IF EXISTS tb_hips_detect_event_log_hourly ADD COLUMN IF NOT EXISTS application_type text NULL; -- 시그니처-application type
    ALTER TABLE IF EXISTS tb_hips_detect_event_log_hourly ADD COLUMN IF NOT EXISTS sid int8 NULL; -- 시그니처 sid(공격ID)
    ALTER TABLE IF EXISTS tb_hips_detect_event_log_hourly ADD COLUMN IF NOT EXISTS "name" text NULL; -- 시그니처 이름(공격명)
    ALTER TABLE IF EXISTS tb_hips_detect_event_log_hourly ADD COLUMN IF NOT EXISTS severity text NULL; -- 시그니처 위험도
    ALTER TABLE IF EXISTS tb_hips_detect_event_log_hourly ADD COLUMN IF NOT EXISTS scountry text NULL; -- 시그니처 출발지국가(공격국가)
    ALTER TABLE IF EXISTS tb_hips_detect_event_log_hourly ADD COLUMN IF NOT EXISTS saddr text NULL; -- 시그니처 출발지IP(공격자)
    ALTER TABLE IF EXISTS tb_hips_detect_event_log_hourly ADD COLUMN IF NOT EXISTS daddr text NULL; -- 시그니처 목적지IP(공격대상)
    ALTER TABLE IF EXISTS tb_hips_detect_event_log_hourly ADD COLUMN IF NOT EXISTS detect_bytes int4 NULL; -- 패킷크기

    COMMENT ON COLUMN tb_hips_detect_event_log_hourly.obj_id IS 'MongoDB object ID';
    COMMENT ON COLUMN tb_hips_detect_event_log_hourly."collect" IS '수집여부';
    COMMENT ON COLUMN tb_hips_detect_event_log_hourly.reg_date IS '등록일시';
    COMMENT ON COLUMN tb_hips_detect_event_log_hourly.node_id IS '노드ID';
    COMMENT ON COLUMN tb_hips_detect_event_log_hourly."action" IS '대응 방법';
    COMMENT ON COLUMN tb_hips_detect_event_log_hourly.min_sec IS '분초';
    COMMENT ON COLUMN tb_hips_detect_event_log_hourly.ip IS 'Agent IP';
    COMMENT ON COLUMN tb_hips_detect_event_log_hourly.computer_name IS 'Agent 컴퓨터명';
    COMMENT ON COLUMN tb_hips_detect_event_log_hourly.application_type IS '시그니처-application type';
    COMMENT ON COLUMN tb_hips_detect_event_log_hourly.sid IS '시그니처 sid(공격ID)';
    COMMENT ON COLUMN tb_hips_detect_event_log_hourly."name" IS '시그니처 이름(공격명)';
    COMMENT ON COLUMN tb_hips_detect_event_log_hourly.severity IS '시그니처 위험도';
    COMMENT ON COLUMN tb_hips_detect_event_log_hourly.scountry IS '시그니처 출발지국가(공격국가)';
    COMMENT ON COLUMN tb_hips_detect_event_log_hourly.saddr IS '시그니처 출발지IP(공격자)';
    COMMENT ON COLUMN tb_hips_detect_event_log_hourly.daddr IS '시그니처 목적지IP(공격대상)';
    COMMENT ON COLUMN tb_hips_detect_event_log_hourly.detect_bytes IS '패킷크기';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_detect_event_log_hourly' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_hips_detect_event_log_hourly ADD CONSTRAINT tb_hips_detect_event_log_hourly_pkey PRIMARY KEY (obj_id) USING INDEX TABLESPACE cpp_olap;
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_hips_detect_attacker_hourly_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_detect_attacker_hourly_timeline() TABLESPACE cpp_olap;
    COMMENT ON TABLE tb_hips_detect_attacker_hourly_timeline IS '시간별 HIPS 탐지/차단 공격자 타임라인';

    ALTER TABLE IF EXISTS tb_hips_detect_attacker_hourly_timeline ADD COLUMN IF NOT EXISTS node_id int8 NOT NULL; -- 노드 ID
    ALTER TABLE IF EXISTS tb_hips_detect_attacker_hourly_timeline ADD COLUMN IF NOT EXISTS reg_date int4 NOT NULL; -- 등록 일시
    ALTER TABLE IF EXISTS tb_hips_detect_attacker_hourly_timeline ADD COLUMN IF NOT EXISTS saddr text NOT NULL; -- 공격자IP(출발지IP)
    ALTER TABLE IF EXISTS tb_hips_detect_attacker_hourly_timeline ADD COLUMN IF NOT EXISTS saddr_count int4 NOT NULL; -- 공격자IP 건수(출발지IP 건수)

    COMMENT ON COLUMN tb_hips_detect_attacker_hourly_timeline.node_id IS '노드 ID';
        COMMENT ON COLUMN tb_hips_detect_attacker_hourly_timeline.reg_date IS '등록 일시';
        COMMENT ON COLUMN tb_hips_detect_attacker_hourly_timeline.saddr IS '공격자IP(출발지IP)';
        COMMENT ON COLUMN tb_hips_detect_attacker_hourly_timeline.saddr_count IS '공격자IP 건수(출발지IP 건수)';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_detect_attacker_hourly_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_hips_detect_attacker_hourly_timeline ADD CONSTRAINT tb_hips_detect_attacker_hourly_timeline_pk PRIMARY KEY (node_id, reg_date, saddr) USING INDEX TABLESPACE cpp_olap;
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_hips_detect_agent_hourly_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_detect_agent_hourly_timeline() TABLESPACE cpp_olap;
    COMMENT ON TABLE tb_hips_detect_agent_hourly_timeline IS '시간별 HIPS 탐지/차단 에이전트 타임라인';

    ALTER TABLE IF EXISTS tb_hips_detect_agent_hourly_timeline ADD COLUMN IF NOT EXISTS node_id int8 NOT NULL; -- 노드 ID
    ALTER TABLE IF EXISTS tb_hips_detect_agent_hourly_timeline ADD COLUMN IF NOT EXISTS reg_date int4 NOT NULL; -- 등록 일시
    ALTER TABLE IF EXISTS tb_hips_detect_agent_hourly_timeline ADD COLUMN IF NOT EXISTS ip text NOT NULL; -- 에이전트 IP
    ALTER TABLE IF EXISTS tb_hips_detect_agent_hourly_timeline ADD COLUMN IF NOT EXISTS computer_name text NOT NULL; -- 컴퓨터 이름
    ALTER TABLE IF EXISTS tb_hips_detect_agent_hourly_timeline ADD COLUMN IF NOT EXISTS ip_count int4 NOT NULL; -- 에이전트IP 건수
    ALTER TABLE IF EXISTS tb_hips_detect_agent_hourly_timeline ADD COLUMN IF NOT EXISTS "name" text NOT NULL; -- 시그니처 이름(공격명)

    COMMENT ON COLUMN tb_hips_detect_agent_hourly_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_hips_detect_agent_hourly_timeline.reg_date IS '등록 일시';
    COMMENT ON COLUMN tb_hips_detect_agent_hourly_timeline.ip IS '에이전트 IP';
    COMMENT ON COLUMN tb_hips_detect_agent_hourly_timeline.computer_name IS '컴퓨터 이름';
    COMMENT ON COLUMN tb_hips_detect_agent_hourly_timeline.ip_count IS '에이전트IP 건수';
    COMMENT ON COLUMN tb_hips_detect_agent_hourly_timeline."name" IS '시그니처 이름(공격명)';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_detect_agent_hourly_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_hips_detect_agent_hourly_timeline ADD CONSTRAINT tb_hips_detect_agent_hourly_timeline_pk PRIMARY KEY (node_id, reg_date, ip) USING INDEX TABLESPACE cpp_olap;
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_hips_detect_signature_name_hourly_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_detect_signature_name_hourly_timeline() TABLESPACE cpp_olap;
    COMMENT ON TABLE tb_hips_detect_signature_name_hourly_timeline IS '시간별 HIPS 탐지/차단 공격명 타임라인';

    ALTER TABLE IF EXISTS tb_hips_detect_signature_name_hourly_timeline ADD COLUMN IF NOT EXISTS node_id int8 NOT NULL; -- 노드 ID
    ALTER TABLE IF EXISTS tb_hips_detect_signature_name_hourly_timeline ADD COLUMN IF NOT EXISTS reg_date int4 NOT NULL; -- 등록 일시
    ALTER TABLE IF EXISTS tb_hips_detect_signature_name_hourly_timeline ADD COLUMN IF NOT EXISTS "name" text NOT NULL; -- 시그니처 이름(공격명)
    ALTER TABLE IF EXISTS tb_hips_detect_signature_name_hourly_timeline ADD COLUMN IF NOT EXISTS name_count int4 NOT NULL; -- 시그니처 이름 건수(공격명 건수)
    ALTER TABLE IF EXISTS tb_hips_detect_signature_name_hourly_timeline ADD COLUMN IF NOT EXISTS modified_time timestamp DEFAULT NOW(); -- 수정일시

    COMMENT ON COLUMN tb_hips_detect_signature_name_hourly_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_hips_detect_signature_name_hourly_timeline.reg_date IS '등록 일시';
    COMMENT ON COLUMN tb_hips_detect_signature_name_hourly_timeline."name" IS '시그니처 이름(공격명)';
    COMMENT ON COLUMN tb_hips_detect_signature_name_hourly_timeline.name_count IS '시그니처 이름 건수(공격명 건수)';
    COMMENT ON COLUMN tb_hips_detect_signature_name_hourly_timeline.modified_time IS '수정일시';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_detect_signature_name_hourly_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_hips_detect_signature_name_hourly_timeline ADD CONSTRAINT tb_hips_detect_signature_name_hourly_timeline_pk PRIMARY KEY (node_id, reg_date, name) USING INDEX TABLESPACE cpp_olap;
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_hips_detect_application_type_hourly_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_detect_application_type_hourly_timeline() TABLESPACE cpp_olap;
    COMMENT ON TABLE tb_hips_detect_application_type_hourly_timeline IS '시간별 HIPS 탐지/차단 application type 타임라인';

    ALTER TABLE IF EXISTS tb_hips_detect_application_type_hourly_timeline ADD COLUMN IF NOT EXISTS node_id int8 NOT NULL; -- 노드 ID
    ALTER TABLE IF EXISTS tb_hips_detect_application_type_hourly_timeline ADD COLUMN IF NOT EXISTS reg_date int4 NOT NULL; -- 등록 일시
    ALTER TABLE IF EXISTS tb_hips_detect_application_type_hourly_timeline ADD COLUMN IF NOT EXISTS application_type text NOT NULL; -- 어플리케이션 타입
    ALTER TABLE IF EXISTS tb_hips_detect_application_type_hourly_timeline ADD COLUMN IF NOT EXISTS application_type_count int4 NOT NULL; -- 어플리케이션 타입 카운트

    COMMENT ON COLUMN tb_hips_detect_application_type_hourly_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_hips_detect_application_type_hourly_timeline.reg_date IS '등록 일시';
    COMMENT ON COLUMN tb_hips_detect_application_type_hourly_timeline.application_type IS '어플리케이션 타입';
    COMMENT ON COLUMN tb_hips_detect_application_type_hourly_timeline.application_type_count IS '어플리케이션 타입 카운트';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_detect_application_type_hourly_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_hips_detect_application_type_hourly_timeline ADD CONSTRAINT tb_hips_detect_application_type_hourly_timeline_pk PRIMARY KEY (node_id, reg_date, application_type) USING INDEX TABLESPACE cpp_olap;
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_hips_detect_attack_nation_hourly_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_detect_attack_nation_hourly_timeline() TABLESPACE cpp_olap;
    COMMENT ON TABLE tb_hips_detect_attack_nation_hourly_timeline IS '시간별 HIPS 탐지/차단 공격 국가 타임라인';

    ALTER TABLE IF EXISTS tb_hips_detect_attack_nation_hourly_timeline ADD COLUMN IF NOT EXISTS node_id int8 NOT NULL; -- 노드 ID
    ALTER TABLE IF EXISTS tb_hips_detect_attack_nation_hourly_timeline ADD COLUMN IF NOT EXISTS reg_date int4 NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_detect_attack_nation_hourly_timeline ADD COLUMN IF NOT EXISTS scountry text NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_detect_attack_nation_hourly_timeline ADD COLUMN IF NOT EXISTS scountry_count int4 NOT NULL;

    COMMENT ON COLUMN tb_hips_detect_attack_nation_hourly_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_hips_detect_attack_nation_hourly_timeline.reg_date IS '등록 일시';
    COMMENT ON COLUMN tb_hips_detect_attack_nation_hourly_timeline.scountry IS '공격 국가(출발지국가)';
    COMMENT ON COLUMN tb_hips_detect_attack_nation_hourly_timeline.scountry_count IS '공격 국가 건수(출발지 국가 건수)';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_detect_attack_nation_hourly_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_hips_detect_attack_nation_hourly_timeline ADD CONSTRAINT tb_hips_detect_attack_nation_hourly_timeline_pk PRIMARY KEY (node_id, reg_date, scountry) USING INDEX TABLESPACE cpp_olap;
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_hips_detect_daily_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_detect_daily_timeline() TABLESPACE cpp_olap;
    COMMENT ON TABLE tb_hips_detect_daily_timeline IS '일자별 HIPS 탐지/차단 타임라인';

    ALTER TABLE IF EXISTS tb_hips_detect_daily_timeline ADD COLUMN IF NOT EXISTS node_id int8 NOT NULL; -- 노드 ID
    ALTER TABLE IF EXISTS tb_hips_detect_daily_timeline ADD COLUMN IF NOT EXISTS reg_date int4 NOT NULL; -- 등록 일자
    ALTER TABLE IF EXISTS tb_hips_detect_daily_timeline ADD COLUMN IF NOT EXISTS detect_count int4 NULL; -- HIPS 탐지 카운트
    ALTER TABLE IF EXISTS tb_hips_detect_daily_timeline ADD COLUMN IF NOT EXISTS block_count int4 NULL; -- HIPS 차단 카운트
    ALTER TABLE IF EXISTS tb_hips_detect_daily_timeline ADD COLUMN IF NOT EXISTS critical_count int4 NULL; -- 위험도-critical 카운트
    ALTER TABLE IF EXISTS tb_hips_detect_daily_timeline ADD COLUMN IF NOT EXISTS high_count int4 NULL; -- 위험도-high 카운트
    ALTER TABLE IF EXISTS tb_hips_detect_daily_timeline ADD COLUMN IF NOT EXISTS medium_count int4 NULL; -- 위험도-medium 카운트
    ALTER TABLE IF EXISTS tb_hips_detect_daily_timeline ADD COLUMN IF NOT EXISTS low_count int4 NULL; -- 위험도-low 카운트
    ALTER TABLE IF EXISTS tb_hips_detect_daily_timeline ADD COLUMN IF NOT EXISTS information_count int4 NULL; -- 위험도-information 카운트

    COMMENT ON COLUMN tb_hips_detect_daily_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_hips_detect_daily_timeline.reg_date IS '등록 일자';
    COMMENT ON COLUMN tb_hips_detect_daily_timeline.detect_count IS 'HIPS 탐지 카운트';
    COMMENT ON COLUMN tb_hips_detect_daily_timeline.block_count IS 'HIPS 차단 카운트';
    COMMENT ON COLUMN tb_hips_detect_daily_timeline.critical_count IS '위험도-critical 카운트';
    COMMENT ON COLUMN tb_hips_detect_daily_timeline.high_count IS '위험도-high 카운트';
    COMMENT ON COLUMN tb_hips_detect_daily_timeline.medium_count IS '위험도-medium 카운트';
    COMMENT ON COLUMN tb_hips_detect_daily_timeline.low_count IS '위험도-low 카운트';
    COMMENT ON COLUMN tb_hips_detect_daily_timeline.information_count IS '위험도-information 카운트';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_detect_daily_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_hips_detect_daily_timeline ADD CONSTRAINT tb_hips_detect_daily_timeline_pkey PRIMARY KEY (node_id, reg_date) USING INDEX TABLESPACE cpp_olap;
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_hips_detect_attacker_daily_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_detect_attacker_daily_timeline() TABLESPACE cpp_olap;
    COMMENT ON TABLE tb_hips_detect_attacker_daily_timeline IS '일자별 HIPS 탐지/차단 공격자 타임라인';

    ALTER TABLE IF EXISTS tb_hips_detect_attacker_daily_timeline ADD COLUMN IF NOT EXISTS node_id int8 NOT NULL; -- 노드 ID
    ALTER TABLE IF EXISTS tb_hips_detect_attacker_daily_timeline ADD COLUMN IF NOT EXISTS reg_date int4 NOT NULL; -- 등록 일자
    ALTER TABLE IF EXISTS tb_hips_detect_attacker_daily_timeline ADD COLUMN IF NOT EXISTS saddr text NOT NULL; -- 공격자IP(출발지IP)
    ALTER TABLE IF EXISTS tb_hips_detect_attacker_daily_timeline ADD COLUMN IF NOT EXISTS saddr_count int4 NOT NULL; -- 공격자IP 건수(출발지IP 건수)

    COMMENT ON COLUMN tb_hips_detect_attacker_daily_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_hips_detect_attacker_daily_timeline.reg_date IS '등록 일자';
    COMMENT ON COLUMN tb_hips_detect_attacker_daily_timeline.saddr IS '공격자IP(출발지IP)';
    COMMENT ON COLUMN tb_hips_detect_attacker_daily_timeline.saddr_count IS '공격자IP 건수(출발지IP 건수)';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_detect_attacker_daily_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_hips_detect_attacker_daily_timeline ADD CONSTRAINT tb_hips_detect_attacker_daily_timeline_pk PRIMARY KEY (node_id, reg_date, saddr) USING INDEX TABLESPACE cpp_olap;
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_hips_detect_agent_daily_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_detect_agent_daily_timeline() TABLESPACE cpp_olap;
    COMMENT ON TABLE tb_hips_detect_agent_daily_timeline IS '일자별 HIPS 탐지/차단 에이전트';

    ALTER TABLE IF EXISTS tb_hips_detect_agent_daily_timeline ADD COLUMN IF NOT EXISTS node_id int8 NOT NULL; -- 노드 ID
    ALTER TABLE IF EXISTS tb_hips_detect_agent_daily_timeline ADD COLUMN IF NOT EXISTS reg_date int4 NOT NULL; -- 등록 일자
    ALTER TABLE IF EXISTS tb_hips_detect_agent_daily_timeline ADD COLUMN IF NOT EXISTS ip text NOT NULL; -- 에이전트 IP
    ALTER TABLE IF EXISTS tb_hips_detect_agent_daily_timeline ADD COLUMN IF NOT EXISTS computer_name text NOT NULL; -- 컴퓨터 이름
    ALTER TABLE IF EXISTS tb_hips_detect_agent_daily_timeline ADD COLUMN IF NOT EXISTS ip_count int4 NOT NULL; -- 에이전트IP 건수
    ALTER TABLE IF EXISTS tb_hips_detect_agent_daily_timeline ADD COLUMN IF NOT EXISTS "name" text NOT NULL; -- 시그니처 이름(공격명)

    COMMENT ON COLUMN tb_hips_detect_agent_daily_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_hips_detect_agent_daily_timeline.reg_date IS '등록 일자';
    COMMENT ON COLUMN tb_hips_detect_agent_daily_timeline.ip IS '에이전트 IP';
    COMMENT ON COLUMN tb_hips_detect_agent_daily_timeline.computer_name IS '컴퓨터 이름';
    COMMENT ON COLUMN tb_hips_detect_agent_daily_timeline.ip_count IS '에이전트IP 건수';
    COMMENT ON COLUMN tb_hips_detect_agent_daily_timeline."name" IS '시그니처 이름(공격명)';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_detect_agent_daily_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_hips_detect_agent_daily_timeline ADD CONSTRAINT tb_hips_detect_agent_daily_timeline_pk PRIMARY KEY (node_id, reg_date, ip) USING INDEX TABLESPACE cpp_olap;
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_hips_detect_signature_name_daily_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_detect_signature_name_daily_timeline() TABLESPACE cpp_olap;
    COMMENT ON TABLE tb_hips_detect_signature_name_daily_timeline IS '일자별 HIPS 탐지/차단 공격명 타임라인';

    ALTER TABLE IF EXISTS tb_hips_detect_signature_name_daily_timeline ADD COLUMN IF NOT EXISTS node_id int8 NOT NULL; -- 노드 ID
    ALTER TABLE IF EXISTS tb_hips_detect_signature_name_daily_timeline ADD COLUMN IF NOT EXISTS reg_date int4 NOT NULL; -- 등록 일자
    ALTER TABLE IF EXISTS tb_hips_detect_signature_name_daily_timeline ADD COLUMN IF NOT EXISTS "name" text NOT NULL; -- 시그니처 이름(공격명)
    ALTER TABLE IF EXISTS tb_hips_detect_signature_name_daily_timeline ADD COLUMN IF NOT EXISTS name_count int4 NOT NULL; -- 시그니처 이름 건수(공격명 건수)
    ALTER TABLE IF EXISTS tb_hips_detect_signature_name_daily_timeline ADD COLUMN IF NOT EXISTS modified_time timestamp DEFAULT NOW();

    COMMENT ON COLUMN tb_hips_detect_signature_name_daily_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_hips_detect_signature_name_daily_timeline.reg_date IS '등록 일자';
    COMMENT ON COLUMN tb_hips_detect_signature_name_daily_timeline."name" IS '시그니처 이름(공격명)';
    COMMENT ON COLUMN tb_hips_detect_signature_name_daily_timeline.name_count IS '시그니처 이름 건수(공격명 건수)';
    COMMENT ON COLUMN tb_hips_detect_signature_name_daily_timeline.modified_time IS '수정일시';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_detect_signature_name_daily_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_hips_detect_signature_name_daily_timeline ADD CONSTRAINT tb_hips_detect_signature_name_daily_timeline_pk PRIMARY KEY (node_id, reg_date, name) USING INDEX TABLESPACE cpp_olap;
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_hips_detect_application_type_daily_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_detect_application_type_daily_timeline() TABLESPACE cpp_olap;
    COMMENT ON TABLE tb_hips_detect_application_type_daily_timeline IS '일자별 HIPS 탐지/차단 application type 타임라인';

    ALTER TABLE IF EXISTS tb_hips_detect_application_type_daily_timeline ADD COLUMN IF NOT EXISTS node_id int8 NOT NULL; -- 노드 ID
    ALTER TABLE IF EXISTS tb_hips_detect_application_type_daily_timeline ADD COLUMN IF NOT EXISTS reg_date int4 NOT NULL; -- 등록 일자
    ALTER TABLE IF EXISTS tb_hips_detect_application_type_daily_timeline ADD COLUMN IF NOT EXISTS application_type text NOT NULL; -- 어플리케이션 타입
    ALTER TABLE IF EXISTS tb_hips_detect_application_type_daily_timeline ADD COLUMN IF NOT EXISTS application_type_count int4 NOT NULL; -- 어플리케이션 타입 카운트

    COMMENT ON COLUMN tb_hips_detect_application_type_daily_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_hips_detect_application_type_daily_timeline.reg_date IS '등록 일자';
    COMMENT ON COLUMN tb_hips_detect_application_type_daily_timeline.application_type IS '어플리케이션 타입';
    COMMENT ON COLUMN tb_hips_detect_application_type_daily_timeline.application_type_count IS '어플리케이션 타입 카운트';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_detect_application_type_daily_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_hips_detect_application_type_daily_timeline ADD CONSTRAINT tb_hips_detect_application_type_daily_timeline_pk PRIMARY KEY (node_id, reg_date, application_type) USING INDEX TABLESPACE cpp_olap;
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_hips_detect_attack_nation_daily_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_detect_attack_nation_daily_timeline() TABLESPACE cpp_olap;
    COMMENT ON TABLE tb_hips_detect_attack_nation_daily_timeline IS '일자별 HIPS 탐지/차단 공격 국가 타임라인';

    ALTER TABLE IF EXISTS tb_hips_detect_attack_nation_daily_timeline ADD COLUMN IF NOT EXISTS node_id int8 NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_detect_attack_nation_daily_timeline ADD COLUMN IF NOT EXISTS reg_date int4 NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_detect_attack_nation_daily_timeline ADD COLUMN IF NOT EXISTS scountry text NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_detect_attack_nation_daily_timeline ADD COLUMN IF NOT EXISTS scountry_count int4 NOT NULL;

    COMMENT ON COLUMN tb_hips_detect_attack_nation_daily_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_hips_detect_attack_nation_daily_timeline.reg_date IS '등록 일자';
    COMMENT ON COLUMN tb_hips_detect_attack_nation_daily_timeline.scountry IS '공격 국가(출발지국가)';
    COMMENT ON COLUMN tb_hips_detect_attack_nation_daily_timeline.scountry_count IS '공격 국가 건수(출발지 국가 건수)';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_detect_attack_nation_daily_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_hips_detect_attack_nation_daily_timeline ADD CONSTRAINT tb_hips_detect_attack_nation_daily_timeline_pk PRIMARY KEY (node_id, reg_date, scountry) USING INDEX TABLESPACE cpp_olap;
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_hips_fw_daily_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_fw_daily_timeline() TABLESPACE cpp_olap;
    COMMENT ON TABLE tb_hips_fw_daily_timeline IS '일자별 HIPS FW(방화벽) 차단 타임라인';

    ALTER TABLE IF EXISTS tb_hips_fw_daily_timeline ADD COLUMN IF NOT EXISTS node_id int8 NOT NULL; -- 노드 ID
    ALTER TABLE IF EXISTS tb_hips_fw_daily_timeline ADD COLUMN IF NOT EXISTS reg_date int4 NOT NULL; -- 등록일자
    ALTER TABLE IF EXISTS tb_hips_fw_daily_timeline ADD COLUMN IF NOT EXISTS block_count int4 NULL; -- FW 차단 카운트

    COMMENT ON COLUMN tb_hips_fw_daily_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_hips_fw_daily_timeline.reg_date IS '등록일자';
    COMMENT ON COLUMN tb_hips_fw_daily_timeline.block_count IS 'FW 차단 카운트';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_fw_daily_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_hips_fw_daily_timeline ADD CONSTRAINT tb_hips_fw_daily_timeline_pkey PRIMARY KEY (node_id, reg_date) USING INDEX TABLESPACE cpp_olap;
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_hips_fw_block_ip_daily_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_fw_block_ip_daily_timeline() TABLESPACE cpp_olap;
    COMMENT ON TABLE tb_hips_fw_block_ip_daily_timeline IS '일자별 HIPS FW(방화벽) 차단 IP 순위 타임라인';

    ALTER TABLE IF EXISTS tb_hips_fw_block_ip_daily_timeline ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_fw_block_ip_daily_timeline ADD COLUMN IF NOT EXISTS reg_date int4 NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_fw_block_ip_daily_timeline ADD COLUMN IF NOT EXISTS src_ip text NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_fw_block_ip_daily_timeline ADD COLUMN IF NOT EXISTS src_ip_count int4 NOT NULL;

    COMMENT ON COLUMN tb_hips_fw_block_ip_daily_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_hips_fw_block_ip_daily_timeline.reg_date IS '등록일자';
    COMMENT ON COLUMN tb_hips_fw_block_ip_daily_timeline.src_ip IS '출발지 IP';
    COMMENT ON COLUMN tb_hips_fw_block_ip_daily_timeline.src_ip_count IS '출발지 IP 카운트';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_fw_block_ip_daily_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_hips_fw_block_ip_daily_timeline ADD CONSTRAINT tb_hips_fw_block_ip_daily_timeline_pk PRIMARY KEY (node_id, reg_date, src_ip) USING INDEX TABLESPACE cpp_olap;
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_hips_fw_block_agent_daily_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_fw_block_agent_daily_timeline() TABLESPACE cpp_olap;
    COMMENT ON TABLE tb_hips_fw_block_agent_daily_timeline IS '일자별 HIPS FW(방화벽) 차단 에이전트 Top 타임라인';

    ALTER TABLE IF EXISTS tb_hips_fw_block_agent_daily_timeline ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_fw_block_agent_daily_timeline ADD COLUMN IF NOT EXISTS reg_date int4 NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_fw_block_agent_daily_timeline ADD COLUMN IF NOT EXISTS ip text NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_fw_block_agent_daily_timeline ADD COLUMN IF NOT EXISTS computer_name text NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_fw_block_agent_daily_timeline ADD COLUMN IF NOT EXISTS ip_count int4 NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_fw_block_agent_daily_timeline ADD COLUMN IF NOT EXISTS src_ip text NOT NULL;

    COMMENT ON COLUMN tb_hips_fw_block_agent_daily_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_hips_fw_block_agent_daily_timeline.reg_date IS '등록일자';
    COMMENT ON COLUMN tb_hips_fw_block_agent_daily_timeline.ip IS '에이전트 IP';
    COMMENT ON COLUMN tb_hips_fw_block_agent_daily_timeline.computer_name IS '컴퓨터 이름';
    COMMENT ON COLUMN tb_hips_fw_block_agent_daily_timeline.ip_count IS '에이전트 IP 카운트';
    COMMENT ON COLUMN tb_hips_fw_block_agent_daily_timeline.src_ip IS '출발지 IP';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_fw_block_agent_daily_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_hips_fw_block_agent_daily_timeline ADD CONSTRAINT tb_hips_fw_block_agent_daily_timeline_pk PRIMARY KEY (node_id, reg_date, ip) USING INDEX TABLESPACE cpp_olap;
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_hips_fw_block_port_daily_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_fw_block_port_daily_timeline() TABLESPACE cpp_olap;
    COMMENT ON TABLE tb_hips_fw_block_port_daily_timeline IS '일자별 HIPS FW(방화벽) 차단 포트 순위 타임라인';

    ALTER TABLE IF EXISTS tb_hips_fw_block_port_daily_timeline ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_fw_block_port_daily_timeline ADD COLUMN IF NOT EXISTS reg_date int4 NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_fw_block_port_daily_timeline ADD COLUMN IF NOT EXISTS dst_port int4 NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_fw_block_port_daily_timeline ADD COLUMN IF NOT EXISTS dst_port_count int4 NOT NULL;

    COMMENT ON COLUMN tb_hips_fw_block_port_daily_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_hips_fw_block_port_daily_timeline.reg_date IS '등록일자';
    COMMENT ON COLUMN tb_hips_fw_block_port_daily_timeline.dst_port IS '목적지 포트';
    COMMENT ON COLUMN tb_hips_fw_block_port_daily_timeline.dst_port_count IS '목적지 포트 카운트';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_fw_block_port_daily_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_hips_fw_block_port_daily_timeline ADD CONSTRAINT tb_hips_fw_block_port_daily_timeline_pk PRIMARY KEY (node_id, reg_date, dst_port) USING INDEX TABLESPACE cpp_olap;
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_hips_fw_block_rule_daily_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_fw_block_rule_daily_timeline() TABLESPACE cpp_olap;
    COMMENT ON TABLE tb_hips_fw_block_rule_daily_timeline IS '일자별 HIPS FW(방화벽) 차단 규칙 순위 타임라인';

    ALTER TABLE IF EXISTS tb_hips_fw_block_rule_daily_timeline ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_fw_block_rule_daily_timeline ADD COLUMN IF NOT EXISTS reg_date int4 NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_fw_block_rule_daily_timeline ADD COLUMN IF NOT EXISTS rule_name text NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_fw_block_rule_daily_timeline ADD COLUMN IF NOT EXISTS rule_name_count int4 NOT NULL;

    COMMENT ON COLUMN tb_hips_fw_block_rule_daily_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_hips_fw_block_rule_daily_timeline.reg_date IS '등록일자';
    COMMENT ON COLUMN tb_hips_fw_block_rule_daily_timeline.rule_name IS '규칙';
    COMMENT ON COLUMN tb_hips_fw_block_rule_daily_timeline.rule_name_count IS '규칙 카운트';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_fw_block_rule_daily_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_hips_fw_block_rule_daily_timeline ADD CONSTRAINT tb_hips_fw_block_rule_daily_timeline_pk PRIMARY KEY (node_id, reg_date, rule_name) USING INDEX TABLESPACE cpp_olap;
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_hips_fw_hourly_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_fw_hourly_timeline() TABLESPACE cpp_olap;
    COMMENT ON TABLE tb_hips_fw_hourly_timeline IS '시간별 HIPS FW(방화벽) 차단 타임라인';

    ALTER TABLE IF EXISTS tb_hips_fw_hourly_timeline ADD COLUMN IF NOT EXISTS node_id int8 NOT NULL; -- 노드 ID
    ALTER TABLE IF EXISTS tb_hips_fw_hourly_timeline ADD COLUMN IF NOT EXISTS reg_date int4 NOT NULL; -- 등록일시
    ALTER TABLE IF EXISTS tb_hips_fw_hourly_timeline ADD COLUMN IF NOT EXISTS block_count int4 NULL; -- FW 차단 카운트

    COMMENT ON COLUMN tb_hips_fw_hourly_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_hips_fw_hourly_timeline.reg_date IS '등록일시';
    COMMENT ON COLUMN tb_hips_fw_hourly_timeline.block_count IS 'FW 차단 카운트';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_fw_hourly_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_hips_fw_hourly_timeline ADD CONSTRAINT tb_hips_fw_hourly_timeline_pkey PRIMARY KEY (node_id, reg_date) USING INDEX TABLESPACE cpp_olap;
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_hips_fw_event_log_hourly';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_fw_event_log_hourly() TABLESPACE cpp_olap;
    COMMENT ON TABLE tb_hips_fw_event_log_hourly IS '시간별 HIPS 방화벽 로그 관리';

    ALTER TABLE IF EXISTS tb_hips_fw_event_log_hourly ADD COLUMN IF NOT EXISTS obj_id text NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_fw_event_log_hourly ADD COLUMN IF NOT EXISTS "collect" bool NOT NULL DEFAULT false; -- 수집 여부
    ALTER TABLE IF EXISTS tb_hips_fw_event_log_hourly ADD COLUMN IF NOT EXISTS node_id int8 NOT NULL; -- 노드 ID
    ALTER TABLE IF EXISTS tb_hips_fw_event_log_hourly ADD COLUMN IF NOT EXISTS "type" text NULL; -- 차단 타입
    ALTER TABLE IF EXISTS tb_hips_fw_event_log_hourly ADD COLUMN IF NOT EXISTS reg_date int4 NOT NULL; -- 등록일시
    ALTER TABLE IF EXISTS tb_hips_fw_event_log_hourly ADD COLUMN IF NOT EXISTS ip text NULL; -- 에이전트 IP
    ALTER TABLE IF EXISTS tb_hips_fw_event_log_hourly ADD COLUMN IF NOT EXISTS computer_name text NULL; -- 에이전트 컴퓨터 이름
    ALTER TABLE IF EXISTS tb_hips_fw_event_log_hourly ADD COLUMN IF NOT EXISTS src_ip text NULL; -- 출발지 IP
    ALTER TABLE IF EXISTS tb_hips_fw_event_log_hourly ADD COLUMN IF NOT EXISTS dst_port int4 NULL; -- 목적지 포트
    ALTER TABLE IF EXISTS tb_hips_fw_event_log_hourly ADD COLUMN IF NOT EXISTS rule_name text NULL; -- 규칙

    COMMENT ON COLUMN tb_hips_fw_event_log_hourly.obj_id IS 'MongoDB object ID';
    COMMENT ON COLUMN tb_hips_fw_event_log_hourly."collect" IS '수집 여부';
    COMMENT ON COLUMN tb_hips_fw_event_log_hourly.node_id IS '노드ID';
    COMMENT ON COLUMN tb_hips_fw_event_log_hourly."type" IS '차단 타입';
    COMMENT ON COLUMN tb_hips_fw_event_log_hourly.reg_date IS '등록일시';
    COMMENT ON COLUMN tb_hips_fw_event_log_hourly.ip IS '에이전트 IP';
    COMMENT ON COLUMN tb_hips_fw_event_log_hourly.computer_name IS '에이전트 컴퓨터 이름';
    COMMENT ON COLUMN tb_hips_fw_event_log_hourly.src_ip IS '출발지 IP';
    COMMENT ON COLUMN tb_hips_fw_event_log_hourly.dst_port IS '목적지 포트';
    COMMENT ON COLUMN tb_hips_fw_event_log_hourly.rule_name IS '규칙';


    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_fw_event_log_hourly' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_hips_fw_event_log_hourly ADD CONSTRAINT tb_hips_fw_event_log_hourly_pkey PRIMARY KEY (obj_id) USING INDEX TABLESPACE cpp_olap;
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_hips_fw_block_ip_hourly_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_fw_block_ip_hourly_timeline() TABLESPACE cpp_olap;
    COMMENT ON TABLE tb_hips_fw_block_ip_hourly_timeline IS '시간별 HIPS FW(방화벽) 차단 IP 순위 타임라인';

    ALTER TABLE IF EXISTS tb_hips_fw_block_ip_hourly_timeline ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_fw_block_ip_hourly_timeline ADD COLUMN IF NOT EXISTS reg_date int4 NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_fw_block_ip_hourly_timeline ADD COLUMN IF NOT EXISTS src_ip text NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_fw_block_ip_hourly_timeline ADD COLUMN IF NOT EXISTS src_ip_count int4 NOT NULL;

    COMMENT ON COLUMN tb_hips_fw_block_ip_hourly_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_hips_fw_block_ip_hourly_timeline.reg_date IS '등록일시';
    COMMENT ON COLUMN tb_hips_fw_block_ip_hourly_timeline.src_ip IS '출발지 IP';
    COMMENT ON COLUMN tb_hips_fw_block_ip_hourly_timeline.src_ip_count IS '출발지 IP 카운트';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_fw_block_ip_hourly_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_hips_fw_block_ip_hourly_timeline ADD CONSTRAINT tb_hips_fw_block_ip_hourly_timeline_pk PRIMARY KEY (node_id, reg_date, src_ip) USING INDEX TABLESPACE cpp_olap;
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_hips_fw_block_agent_hourly_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_fw_block_agent_hourly_timeline() TABLESPACE cpp_olap;
    COMMENT ON TABLE tb_hips_fw_block_agent_hourly_timeline IS '시간별 HIPS FW(방화벽) 차단 에이전트 Top 타임라인';

    ALTER TABLE IF EXISTS tb_hips_fw_block_agent_hourly_timeline ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_fw_block_agent_hourly_timeline ADD COLUMN IF NOT EXISTS reg_date int4 NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_fw_block_agent_hourly_timeline ADD COLUMN IF NOT EXISTS ip text NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_fw_block_agent_hourly_timeline ADD COLUMN IF NOT EXISTS computer_name text NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_fw_block_agent_hourly_timeline ADD COLUMN IF NOT EXISTS ip_count int4 NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_fw_block_agent_hourly_timeline ADD COLUMN IF NOT EXISTS src_ip text NOT NULL;

    COMMENT ON COLUMN tb_hips_fw_block_agent_hourly_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_hips_fw_block_agent_hourly_timeline.reg_date IS '등록일시';
    COMMENT ON COLUMN tb_hips_fw_block_agent_hourly_timeline.ip IS '에이전트 IP';
    COMMENT ON COLUMN tb_hips_fw_block_agent_hourly_timeline.computer_name IS '컴퓨터 이름';
    COMMENT ON COLUMN tb_hips_fw_block_agent_hourly_timeline.ip_count IS '에이전트 IP 카운트';
    COMMENT ON COLUMN tb_hips_fw_block_agent_hourly_timeline.src_ip IS '출발지 IP';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_fw_block_agent_hourly_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_hips_fw_block_agent_hourly_timeline ADD CONSTRAINT tb_hips_fw_block_agent_hourly_timeline_pk PRIMARY KEY (node_id, reg_date, ip) USING INDEX TABLESPACE cpp_olap;
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_hips_fw_block_port_hourly_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_fw_block_port_hourly_timeline() TABLESPACE cpp_olap;
    COMMENT ON TABLE tb_hips_fw_block_port_hourly_timeline IS '시간별 HIPS FW(방화벽) 차단 포트 순위 타임라인';

    ALTER TABLE IF EXISTS tb_hips_fw_block_port_hourly_timeline ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_fw_block_port_hourly_timeline ADD COLUMN IF NOT EXISTS reg_date int4 NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_fw_block_port_hourly_timeline ADD COLUMN IF NOT EXISTS dst_port int4 NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_fw_block_port_hourly_timeline ADD COLUMN IF NOT EXISTS dst_port_count int4 NOT NULL;

    COMMENT ON COLUMN tb_hips_fw_block_port_hourly_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_hips_fw_block_port_hourly_timeline.reg_date IS '등록일시';
    COMMENT ON COLUMN tb_hips_fw_block_port_hourly_timeline.dst_port IS '목적지 포트';
    COMMENT ON COLUMN tb_hips_fw_block_port_hourly_timeline.dst_port_count IS '목적지 포트 카운트';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_fw_block_port_hourly_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_hips_fw_block_port_hourly_timeline ADD CONSTRAINT tb_hips_fw_block_port_hourly_timeline_pk PRIMARY KEY (node_id, reg_date, dst_port) USING INDEX TABLESPACE cpp_olap;
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_hips_fw_block_rule_hourly_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_fw_block_rule_hourly_timeline() TABLESPACE cpp_olap;
    COMMENT ON TABLE tb_hips_fw_block_rule_hourly_timeline IS '시간별 HIPS FW(방화벽) 차단 규칙 순위 타임라인';

    ALTER TABLE IF EXISTS tb_hips_fw_block_rule_hourly_timeline ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_fw_block_rule_hourly_timeline ADD COLUMN IF NOT EXISTS reg_date int4 NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_fw_block_rule_hourly_timeline ADD COLUMN IF NOT EXISTS rule_name text NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_fw_block_rule_hourly_timeline ADD COLUMN IF NOT EXISTS rule_name_count int4 NOT NULL;

    COMMENT ON COLUMN tb_hips_fw_block_rule_hourly_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_hips_fw_block_rule_hourly_timeline.reg_date IS '등록일시';
    COMMENT ON COLUMN tb_hips_fw_block_rule_hourly_timeline.rule_name IS '규칙';
    COMMENT ON COLUMN tb_hips_fw_block_rule_hourly_timeline.rule_name_count IS '규칙 카운트';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_fw_block_rule_hourly_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_hips_fw_block_rule_hourly_timeline ADD CONSTRAINT tb_hips_fw_block_rule_hourly_timeline_pk PRIMARY KEY (node_id, reg_date, rule_name) USING INDEX TABLESPACE cpp_olap;
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_issue_agent_daily_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_issue_agent_daily_timeline () TABLESPACE cpp_olap;
    COMMENT ON TABLE tb_issue_agent_daily_timeline IS '일자별 이슈 에이전트 타임라인';

    ALTER TABLE IF EXISTS tb_issue_agent_daily_timeline ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_issue_agent_daily_timeline ADD COLUMN IF NOT EXISTS reg_date text NOT NULL;
    ALTER TABLE IF EXISTS tb_issue_agent_daily_timeline ADD COLUMN IF NOT EXISTS v3_not_install_server boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_daily_timeline ADD COLUMN IF NOT EXISTS v3_not_install_desktop boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_daily_timeline ADD COLUMN IF NOT EXISTS v3_not_new_engine boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_daily_timeline ADD COLUMN IF NOT EXISTS not_manual_scan boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_daily_timeline ADD COLUMN IF NOT EXISTS realtime_scan_off boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_daily_timeline ADD COLUMN IF NOT EXISTS v3_policy_not_applied boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_daily_timeline ADD COLUMN IF NOT EXISTS malware_scan_30_days boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_daily_timeline ADD COLUMN IF NOT EXISTS v3_license_expired boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_daily_timeline ADD COLUMN IF NOT EXISTS v3_abnormal_integrity boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_daily_timeline ADD COLUMN IF NOT EXISTS ac_not_install boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_daily_timeline ADD COLUMN IF NOT EXISTS ac_license_expired boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_daily_timeline ADD COLUMN IF NOT EXISTS ac_abnormal_integrity boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_daily_timeline ADD COLUMN IF NOT EXISTS ac_policy_not_applied boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_daily_timeline ADD COLUMN IF NOT EXISTS im_policy_not_applied boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_daily_timeline ADD COLUMN IF NOT EXISTS im_manual_rulecheck_not_execute boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_daily_timeline ADD COLUMN IF NOT EXISTS hips_not_install boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_daily_timeline ADD COLUMN IF NOT EXISTS hips_license_expired boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_daily_timeline ADD COLUMN IF NOT EXISTS hips_abnormal_integrity boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_daily_timeline ADD COLUMN IF NOT EXISTS hips_policy_not_applied boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_daily_timeline ADD COLUMN IF NOT EXISTS scm_not_install boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_daily_timeline ADD COLUMN IF NOT EXISTS scm_license_expired boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_daily_timeline ADD COLUMN IF NOT EXISTS scm_abnormal_integrity boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_daily_timeline ADD COLUMN IF NOT EXISTS scm_policy_not_applied boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_daily_timeline ADD COLUMN IF NOT EXISTS scm_manual_scan_not_execute boolean;

    COMMENT ON COLUMN tb_issue_agent_daily_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_issue_agent_daily_timeline.reg_date IS '등록 일자';
    COMMENT ON COLUMN tb_issue_agent_daily_timeline.v3_not_install_server IS 'v3 미설치 서버';
    COMMENT ON COLUMN tb_issue_agent_daily_timeline.v3_not_install_desktop IS 'v3 미설치 데스크탑';
    COMMENT ON COLUMN tb_issue_agent_daily_timeline.v3_not_new_engine IS '최신 엔진 미설치';
    COMMENT ON COLUMN tb_issue_agent_daily_timeline.not_manual_scan IS '최근 수동 검사 미실행';
    COMMENT ON COLUMN tb_issue_agent_daily_timeline.realtime_scan_off IS '실시간 검사 off';
    COMMENT ON COLUMN tb_issue_agent_daily_timeline.v3_policy_not_applied IS 'v3 정책 미적용';
    COMMENT ON COLUMN tb_issue_agent_daily_timeline.malware_scan_30_days IS '악성코드 탐지 (최근 30일)';
    COMMENT ON COLUMN tb_issue_agent_daily_timeline.v3_license_expired IS 'v3 라이선스 만료';
    COMMENT ON COLUMN tb_issue_agent_daily_timeline.v3_abnormal_integrity IS 'v3 무결성 손상';
    COMMENT ON COLUMN tb_issue_agent_daily_timeline.ac_not_install IS 'ac 미설치';
    COMMENT ON COLUMN tb_issue_agent_daily_timeline.ac_license_expired IS 'ac 라이선스 만료';
    COMMENT ON COLUMN tb_issue_agent_daily_timeline.ac_abnormal_integrity IS 'ac 무결성 손상';
    COMMENT ON COLUMN tb_issue_agent_daily_timeline.ac_policy_not_applied IS 'ac 정책 미적용';
    COMMENT ON COLUMN tb_issue_agent_daily_timeline.im_policy_not_applied IS 'im 정책 미적용';
    COMMENT ON COLUMN tb_issue_agent_daily_timeline.im_manual_rulecheck_not_execute IS 'IM 무결성모니터링 수동검사 미실행';
    COMMENT ON COLUMN tb_issue_agent_daily_timeline.hips_not_install IS 'hips 미설치';
    COMMENT ON COLUMN tb_issue_agent_daily_timeline.hips_license_expired IS 'hips 라이선스 만료';
    COMMENT ON COLUMN tb_issue_agent_daily_timeline.hips_abnormal_integrity IS 'hips 무결성 손상';
    COMMENT ON COLUMN tb_issue_agent_daily_timeline.hips_policy_not_applied IS 'hips 정책 미적용';
    COMMENT ON COLUMN tb_issue_agent_daily_timeline.scm_not_install IS 'scm 미설치';
    COMMENT ON COLUMN tb_issue_agent_daily_timeline.scm_license_expired IS 'scm 라이선스 만료';
    COMMENT ON COLUMN tb_issue_agent_daily_timeline.scm_abnormal_integrity IS 'scm 무결성 손상';
    COMMENT ON COLUMN tb_issue_agent_daily_timeline.scm_policy_not_applied IS 'scm 정책 미적용';
    COMMENT ON COLUMN tb_issue_agent_daily_timeline.scm_manual_scan_not_execute IS 'scm 수동검사 미수행';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_issue_agent_daily_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_issue_agent_daily_timeline ADD CONSTRAINT tb_issue_agent_daily_timeline_pkey PRIMARY KEY (node_id, reg_date) USING INDEX TABLESPACE cpp_olap;
    END IF;


END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_issue_agent_hourly_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_issue_agent_hourly_timeline () TABLESPACE cpp_olap;
    COMMENT ON TABLE tb_issue_agent_hourly_timeline IS '시간별 이슈 에이전트 타임라인';

    ALTER TABLE IF EXISTS tb_issue_agent_hourly_timeline ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_issue_agent_hourly_timeline ADD COLUMN IF NOT EXISTS reg_date text NOT NULL;
    ALTER TABLE IF EXISTS tb_issue_agent_hourly_timeline ADD COLUMN IF NOT EXISTS v3_not_install_server boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_hourly_timeline ADD COLUMN IF NOT EXISTS v3_not_install_desktop boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_hourly_timeline ADD COLUMN IF NOT EXISTS v3_not_new_engine boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_hourly_timeline ADD COLUMN IF NOT EXISTS not_manual_scan boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_hourly_timeline ADD COLUMN IF NOT EXISTS realtime_scan_off boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_hourly_timeline ADD COLUMN IF NOT EXISTS v3_policy_not_applied boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_hourly_timeline ADD COLUMN IF NOT EXISTS malware_scan_30_days boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_hourly_timeline ADD COLUMN IF NOT EXISTS v3_license_expired boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_hourly_timeline ADD COLUMN IF NOT EXISTS v3_abnormal_integrity boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_hourly_timeline ADD COLUMN IF NOT EXISTS ac_not_install boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_hourly_timeline ADD COLUMN IF NOT EXISTS ac_license_expired boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_hourly_timeline ADD COLUMN IF NOT EXISTS ac_abnormal_integrity boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_hourly_timeline ADD COLUMN IF NOT EXISTS ac_policy_not_applied boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_hourly_timeline ADD COLUMN IF NOT EXISTS im_policy_not_applied boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_hourly_timeline ADD COLUMN IF NOT EXISTS im_manual_rulecheck_not_execute boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_hourly_timeline ADD COLUMN IF NOT EXISTS hips_not_install boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_hourly_timeline ADD COLUMN IF NOT EXISTS hips_license_expired boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_hourly_timeline ADD COLUMN IF NOT EXISTS hips_abnormal_integrity boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_hourly_timeline ADD COLUMN IF NOT EXISTS hips_policy_not_applied boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_hourly_timeline ADD COLUMN IF NOT EXISTS scm_not_install boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_hourly_timeline ADD COLUMN IF NOT EXISTS scm_license_expired boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_hourly_timeline ADD COLUMN IF NOT EXISTS scm_abnormal_integrity boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_hourly_timeline ADD COLUMN IF NOT EXISTS scm_policy_not_applied boolean;
    ALTER TABLE IF EXISTS tb_issue_agent_hourly_timeline ADD COLUMN IF NOT EXISTS scm_manual_scan_not_execute boolean;

    COMMENT ON COLUMN tb_issue_agent_hourly_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_issue_agent_hourly_timeline.reg_date IS '등록 일자';
    COMMENT ON COLUMN tb_issue_agent_hourly_timeline.v3_not_install_server IS 'v3 미설치 서버';
    COMMENT ON COLUMN tb_issue_agent_hourly_timeline.v3_not_install_desktop IS 'v3 미설치 데스크탑';
    COMMENT ON COLUMN tb_issue_agent_hourly_timeline.v3_not_new_engine IS '최신 엔진 미설치';
    COMMENT ON COLUMN tb_issue_agent_hourly_timeline.not_manual_scan IS '최근 수동 검사 미실행';
    COMMENT ON COLUMN tb_issue_agent_hourly_timeline.realtime_scan_off IS '실시간 검사 off';
    COMMENT ON COLUMN tb_issue_agent_hourly_timeline.v3_policy_not_applied IS 'v3 정책 미적용';
    COMMENT ON COLUMN tb_issue_agent_hourly_timeline.malware_scan_30_days IS '악성코드 탐지 (최근 30일)';
    COMMENT ON COLUMN tb_issue_agent_hourly_timeline.v3_license_expired IS 'v3 라이선스 만료';
    COMMENT ON COLUMN tb_issue_agent_hourly_timeline.v3_abnormal_integrity IS 'v3 무결성 손상';
    COMMENT ON COLUMN tb_issue_agent_hourly_timeline.ac_not_install IS 'ac 미설치';
    COMMENT ON COLUMN tb_issue_agent_hourly_timeline.ac_license_expired IS 'ac 라이선스 만료';
    COMMENT ON COLUMN tb_issue_agent_hourly_timeline.ac_abnormal_integrity IS 'ac 무결성 손상';
    COMMENT ON COLUMN tb_issue_agent_hourly_timeline.ac_policy_not_applied IS 'ac 정책 미적용';
    COMMENT ON COLUMN tb_issue_agent_hourly_timeline.im_policy_not_applied IS 'im 정책 미적용';
    COMMENT ON COLUMN tb_issue_agent_hourly_timeline.im_manual_rulecheck_not_execute IS 'IM 무결성모니터링 수동검사 미실행';
    COMMENT ON COLUMN tb_issue_agent_hourly_timeline.hips_not_install IS 'hips 미설치';
    COMMENT ON COLUMN tb_issue_agent_hourly_timeline.hips_license_expired IS 'hips 라이선스 만료';
    COMMENT ON COLUMN tb_issue_agent_hourly_timeline.hips_abnormal_integrity IS 'hips 무결성 손상';
    COMMENT ON COLUMN tb_issue_agent_hourly_timeline.hips_policy_not_applied IS 'hips 정책 미적용';
    COMMENT ON COLUMN tb_issue_agent_hourly_timeline.scm_not_install IS 'scm 미설치';
    COMMENT ON COLUMN tb_issue_agent_hourly_timeline.scm_license_expired IS 'scm 라이선스 만료';
    COMMENT ON COLUMN tb_issue_agent_hourly_timeline.scm_abnormal_integrity IS 'scm 무결성 손상';
    COMMENT ON COLUMN tb_issue_agent_hourly_timeline.scm_policy_not_applied IS 'scm 정책 미적용';
    COMMENT ON COLUMN tb_issue_agent_hourly_timeline.scm_manual_scan_not_execute IS 'scm 수동검사 미수행';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_issue_agent_hourly_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_issue_agent_hourly_timeline ADD CONSTRAINT tb_issue_agent_hourly_timeline_pkey PRIMARY KEY (node_id, reg_date) USING INDEX TABLESPACE cpp_olap;
    END IF;


END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_node_status_daily_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_node_status_daily_timeline () TABLESPACE cpp_olap;
    COMMENT ON TABLE tb_node_status_daily_timeline IS '에이전트 현황 일별 타임라인';

    ALTER TABLE IF EXISTS tb_node_status_daily_timeline ADD COLUMN IF NOT EXISTS node_id bigint;
    ALTER TABLE IF EXISTS tb_node_status_daily_timeline ADD COLUMN IF NOT EXISTS reg_date text;
    ALTER TABLE IF EXISTS tb_node_status_daily_timeline ADD COLUMN IF NOT EXISTS connection_status en_connection_status;
    ALTER TABLE IF EXISTS tb_node_status_daily_timeline ADD COLUMN IF NOT EXISTS is_dangerous boolean;

    COMMENT ON COLUMN tb_node_status_daily_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_node_status_daily_timeline.reg_date IS '등록 일자';
    COMMENT ON COLUMN tb_node_status_daily_timeline.connection_status IS '노드 연결 상태';
    COMMENT ON COLUMN tb_node_status_daily_timeline.is_dangerous IS '위험 여부';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_node_status_daily_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_node_status_daily_timeline ADD CONSTRAINT tb_node_status_daily_timeline_pkey PRIMARY KEY (node_id, reg_date) USING INDEX TABLESPACE cpp_olap;
    END IF;


END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_node_status_hourly_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_node_status_hourly_timeline () TABLESPACE cpp_olap;
    COMMENT ON TABLE tb_node_status_hourly_timeline IS '에이전트 현황 시간별 타임라인';

    ALTER TABLE IF EXISTS tb_node_status_hourly_timeline ADD COLUMN IF NOT EXISTS node_id bigint;
    ALTER TABLE IF EXISTS tb_node_status_hourly_timeline ADD COLUMN IF NOT EXISTS reg_date text;
    ALTER TABLE IF EXISTS tb_node_status_hourly_timeline ADD COLUMN IF NOT EXISTS connection_status en_connection_status;
    ALTER TABLE IF EXISTS tb_node_status_hourly_timeline ADD COLUMN IF NOT EXISTS is_dangerous boolean;

    COMMENT ON COLUMN tb_node_status_hourly_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_node_status_hourly_timeline.reg_date IS '등록 일자';
    COMMENT ON COLUMN tb_node_status_hourly_timeline.connection_status IS '노드 연결 상태';
    COMMENT ON COLUMN tb_node_status_hourly_timeline.is_dangerous IS '위험 여부';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_node_status_hourly_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_node_status_hourly_timeline ADD CONSTRAINT tb_node_status_hourly_timeline_pkey PRIMARY KEY (node_id, reg_date) USING INDEX TABLESPACE cpp_olap;
    END IF;


END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_node_failure_history';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_node_failure_history();
    COMMENT ON TABLE tb_node_failure_history IS '에이전트/제품의 실패 히스토리';

    ALTER TABLE IF EXISTS tb_node_failure_history ADD COLUMN IF NOT EXISTS history_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_node_failure_history ADD COLUMN IF NOT EXISTS occurred_at timestamp NOT NULL;
    ALTER TABLE IF EXISTS tb_node_failure_history ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_node_failure_history ADD COLUMN IF NOT EXISTS product_group en_product_group_type NOT NULL;
    ALTER TABLE IF EXISTS tb_node_failure_history ADD COLUMN IF NOT EXISTS product_id en_product_id_type NOT NULL;
    ALTER TABLE IF EXISTS tb_node_failure_history ADD COLUMN IF NOT EXISTS log_type text NOT NULL;
    ALTER TABLE IF EXISTS tb_node_failure_history ADD COLUMN IF NOT EXISTS log_string_id text NOT NULL;
    ALTER TABLE IF EXISTS tb_node_failure_history ADD COLUMN IF NOT EXISTS department text;
    

    COMMENT ON COLUMN tb_node_failure_history.history_id IS 'HISTORY ID';
    COMMENT ON COLUMN tb_node_failure_history.occurred_at IS '발생 시각';
    COMMENT ON COLUMN tb_node_failure_history.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_node_failure_history.product_group IS '제품 그룹';
    COMMENT ON COLUMN tb_node_failure_history.product_id IS '제품 ID';
    COMMENT ON COLUMN tb_node_failure_history.log_type IS '로그 유형';
    COMMENT ON COLUMN tb_node_failure_history.log_string_id IS '로그 ID';
    COMMENT ON COLUMN tb_node_failure_history.department IS '부서';
    
    CREATE SEQUENCE IF NOT EXISTS tb_node_failure_history_history_id_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;
    ALTER SEQUENCE IF EXISTS tb_node_failure_history_history_id_seq OWNED BY tb_node_failure_history.history_id;

    ALTER TABLE IF EXISTS ONLY tb_node_failure_history ALTER COLUMN history_id SET DEFAULT nextval('tb_node_failure_history_history_id_seq'::regclass);

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_node_failure_history' AND constraint_type = 'PRIMARY KEY')
    THEN
        ALTER TABLE IF EXISTS ONLY tb_node_failure_history ADD CONSTRAINT tb_node_failure_history_pkey PRIMARY KEY (history_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_ac_execution_control_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_ac_execution_control_timeline() TABLESPACE cpp_olap;
    COMMENT ON TABLE tb_ac_execution_control_timeline IS 'AC 실행 제어 이벤트 로그 타임라인';

    ALTER TABLE IF EXISTS tb_ac_execution_control_timeline ADD COLUMN IF NOT EXISTS yyyy text DEFAULT TO_CHAR(CURRENT_TIMESTAMP,'YYYY');
    ALTER TABLE IF EXISTS tb_ac_execution_control_timeline ADD COLUMN IF NOT EXISTS mm text DEFAULT TO_CHAR(CURRENT_TIMESTAMP,'MM');
    ALTER TABLE IF EXISTS tb_ac_execution_control_timeline ADD COLUMN IF NOT EXISTS dd text DEFAULT TO_CHAR(CURRENT_TIMESTAMP,'DD');
    ALTER TABLE IF EXISTS tb_ac_execution_control_timeline ADD COLUMN IF NOT EXISTS hh text DEFAULT TO_CHAR(CURRENT_TIMESTAMP,'HH24');
    ALTER TABLE IF EXISTS tb_ac_execution_control_timeline ADD COLUMN IF NOT EXISTS node_id int8 NOT NULL;
    ALTER TABLE IF EXISTS tb_ac_execution_control_timeline ADD COLUMN IF NOT EXISTS action text NOT NULL;
    ALTER TABLE IF EXISTS tb_ac_execution_control_timeline ADD COLUMN IF NOT EXISTS mode en_ac_operation_status NOT NULL;
    ALTER TABLE IF EXISTS tb_ac_execution_control_timeline ADD COLUMN IF NOT EXISTS file_hash text NOT NULL;
    ALTER TABLE IF EXISTS tb_ac_execution_control_timeline ADD COLUMN IF NOT EXISTS file_name text NOT NULL;
    ALTER TABLE IF EXISTS tb_ac_execution_control_timeline ADD COLUMN IF NOT EXISTS file_path text NOT NULL;
    ALTER TABLE IF EXISTS tb_ac_execution_control_timeline ADD COLUMN IF NOT EXISTS log_count int4 DEFAULT 0;
    ALTER TABLE IF EXISTS tb_ac_execution_control_timeline ADD COLUMN IF NOT EXISTS last_client_time timestamp NOT NULL;
    ALTER TABLE IF EXISTS tb_ac_execution_control_timeline ADD COLUMN IF NOT EXISTS create_time timestamp DEFAULT CURRENT_TIMESTAMP;
    ALTER TABLE IF EXISTS tb_ac_execution_control_timeline ADD COLUMN IF NOT EXISTS last_modified_time timestamp DEFAULT CURRENT_TIMESTAMP;

    COMMENT ON COLUMN tb_ac_execution_control_timeline.yyyy IS '년';
    COMMENT ON COLUMN tb_ac_execution_control_timeline.mm IS '월';
    COMMENT ON COLUMN tb_ac_execution_control_timeline.dd IS '일';
    COMMENT ON COLUMN tb_ac_execution_control_timeline.hh IS '시';
    COMMENT ON COLUMN tb_ac_execution_control_timeline.node_id IS '에이전트 아이디';
    COMMENT ON COLUMN tb_ac_execution_control_timeline.action IS '대응 종류(ALLOW/BLOCK/DETECT)';
    COMMENT ON COLUMN tb_ac_execution_control_timeline.mode IS 'AC 상태(LOCKDOWN/MAINTENANCE/SIMULATION/COLLECTING/OFF)';
    COMMENT ON COLUMN tb_ac_execution_control_timeline.file_hash IS '파일 hash';
    COMMENT ON COLUMN tb_ac_execution_control_timeline.file_name IS '파일 이름';
    COMMENT ON COLUMN tb_ac_execution_control_timeline.file_path IS '파일 경로';
    COMMENT ON COLUMN tb_ac_execution_control_timeline.log_count IS '시간별 건수';
    COMMENT ON COLUMN tb_ac_execution_control_timeline.last_client_time IS '마지막 발생일시';
    COMMENT ON COLUMN tb_ac_execution_control_timeline.create_time IS '생성일시';
    COMMENT ON COLUMN tb_ac_execution_control_timeline.last_modified_time IS '수정일시';

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_ac_daily_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_ac_daily_timeline() TABLESPACE cpp_olap;
    COMMENT ON TABLE tb_ac_daily_timeline IS '일자별 AC 타임라인';

    ALTER TABLE IF EXISTS tb_ac_daily_timeline ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_ac_daily_timeline ADD COLUMN IF NOT EXISTS reg_date text NOT NULL;
    ALTER TABLE IF EXISTS tb_ac_daily_timeline ADD COLUMN IF NOT EXISTS exec_detect_count int4 NULL;           -- 실행제어 탐지 카운트
    ALTER TABLE IF EXISTS tb_ac_daily_timeline ADD COLUMN IF NOT EXISTS exec_block_count int4 NULL;            -- 실행제어 차단 카운트
    ALTER TABLE IF EXISTS tb_ac_daily_timeline ADD COLUMN IF NOT EXISTS access_block_count int4 NULL;          -- 접근제어 차단 카운트
    ALTER TABLE IF EXISTS tb_ac_daily_timeline ADD COLUMN IF NOT EXISTS is_removed boolean NULL;               -- 제품 삭제 여부
    ALTER TABLE IF EXISTS tb_ac_daily_timeline ADD COLUMN IF NOT EXISTS removed_time timestamp NULL;           -- 제품 삭제 업데이트 시간

    COMMENT ON COLUMN tb_ac_daily_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_ac_daily_timeline.reg_date IS '등록 일자';
    COMMENT ON COLUMN tb_ac_daily_timeline.exec_detect_count IS '실행제어 탐지 카운트';
    COMMENT ON COLUMN tb_ac_daily_timeline.exec_block_count IS '실행제어 차단 카운트';
    COMMENT ON COLUMN tb_ac_daily_timeline.access_block_count IS '접근제어 차단 카운트';
    COMMENT ON COLUMN tb_ac_daily_timeline.is_removed IS '제품 삭제 여부';
    COMMENT ON COLUMN tb_ac_daily_timeline.removed_time IS '제품 삭제 업데이트 시간';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_ac_daily_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_ac_daily_timeline ADD CONSTRAINT tb_ac_daily_timeline_pkey PRIMARY KEY (node_id, reg_date);
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_hips_daily_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_daily_timeline() TABLESPACE cpp_olap;
    COMMENT ON TABLE tb_hips_daily_timeline IS '일자별 HIPS 타임라인';

    ALTER TABLE IF EXISTS tb_hips_daily_timeline ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_daily_timeline ADD COLUMN IF NOT EXISTS reg_date text NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_daily_timeline ADD COLUMN IF NOT EXISTS hips_detect_count int4 NULL;            -- IPS 탐지 카운트
    ALTER TABLE IF EXISTS tb_hips_daily_timeline ADD COLUMN IF NOT EXISTS hips_block_count int4 NULL;             -- IPS 차단 카운트
    ALTER TABLE IF EXISTS tb_hips_daily_timeline ADD COLUMN IF NOT EXISTS fw_block_count int4 NULL;               -- 방화벽 차단 카운트
    ALTER TABLE IF EXISTS tb_hips_daily_timeline ADD COLUMN IF NOT EXISTS is_removed boolean NULL;                -- 제품 삭제 여부
    ALTER TABLE IF EXISTS tb_hips_daily_timeline ADD COLUMN IF NOT EXISTS removed_time timestamp NULL;            -- 제품 삭제 업데이트 시간

    COMMENT ON COLUMN tb_hips_daily_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_hips_daily_timeline.reg_date IS '등록 일자';
    COMMENT ON COLUMN tb_hips_daily_timeline.hips_detect_count IS 'IPS 탐지 카운트';
    COMMENT ON COLUMN tb_hips_daily_timeline.hips_block_count IS 'IPS 차단 카운트';
    COMMENT ON COLUMN tb_hips_daily_timeline.fw_block_count IS '방화벽 차단 카운트';
    COMMENT ON COLUMN tb_hips_daily_timeline.is_removed IS '제품 삭제 여부';
    COMMENT ON COLUMN tb_hips_daily_timeline.removed_time IS '제품 삭제 업데이트 시간';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_daily_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_hips_daily_timeline ADD CONSTRAINT tb_hips_daily_timeline_pkey PRIMARY KEY (node_id, reg_date) USING INDEX TABLESPACE cpp_olap;
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_action_count';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_action_count ();
    COMMENT ON TABLE tb_action_count IS 'Insight portal 용 액션 호출 수 집계';

    ALTER TABLE IF EXISTS tb_action_count ADD COLUMN IF NOT EXISTS action_name text NOT NULL;
    ALTER TABLE IF EXISTS tb_action_count ADD COLUMN IF NOT EXISTS hit_count bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_action_count ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;

    COMMENT ON COLUMN tb_action_count.action_name IS '기능명';
    COMMENT ON COLUMN tb_action_count.hit_count IS '처리 횟수';
    COMMENT ON COLUMN tb_action_count.modified_time IS '변경 시각';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_action_count' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_action_count ADD CONSTRAINT tb_action_count_pkey PRIMARY KEY (action_name);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_syslog';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_syslog ();
    COMMENT ON TABLE tb_syslog IS 'SYSLOG 테이블';

    ALTER TABLE IF EXISTS tb_syslog ADD COLUMN IF NOT EXISTS idx bigserial NOT NULL;
    ALTER TABLE IF EXISTS tb_syslog ADD COLUMN IF NOT EXISTS host text NOT NULL;
    ALTER TABLE IF EXISTS tb_syslog ADD COLUMN IF NOT EXISTS port int4 NOT NULL;
    ALTER TABLE IF EXISTS tb_syslog ADD COLUMN IF NOT EXISTS protocol en_protocol_type NOT NULL;
    ALTER TABLE IF EXISTS tb_syslog ADD COLUMN IF NOT EXISTS mask boolean NOT NULL DEFAULT false;
    ALTER TABLE IF EXISTS tb_syslog ADD COLUMN IF NOT EXISTS format text NOT NULL;
    ALTER TABLE IF EXISTS tb_syslog ADD COLUMN IF NOT EXISTS encode text NULL;
    ALTER TABLE IF EXISTS tb_syslog ADD COLUMN IF NOT EXISTS message_filter_criteria text NOT NULL DEFAULT 'NONE';
    ALTER TABLE IF EXISTS tb_syslog ADD COLUMN IF NOT EXISTS message_filter_node_group jsonb NOT NULL DEFAULT '[]'::jsonb;
    ALTER TABLE IF EXISTS tb_syslog ADD COLUMN IF NOT EXISTS message_filter_node_ip jsonb NOT NULL DEFAULT '[]'::jsonb;
    ALTER TABLE IF EXISTS tb_syslog ADD COLUMN IF NOT EXISTS server_log json NOT NULL;
    ALTER TABLE IF EXISTS tb_syslog ADD COLUMN IF NOT EXISTS agent_log json NOT NULL;
    ALTER TABLE IF EXISTS tb_syslog ADD COLUMN IF NOT EXISTS total_log json NOT NULL;

    COMMENT ON COLUMN tb_syslog.mask IS '비활성화 여부';
    COMMENT ON COLUMN tb_syslog.format IS 'CEF, JSON';
    COMMENT ON COLUMN tb_syslog.encode IS 'IPS 탐지 이벤트 로그 선택 시, payload 인코딩 설정 선택(base64, ASCII)';
    COMMENT ON COLUMN tb_syslog.message_filter_criteria IS '메시지 필터 기준 항목';
    COMMENT ON COLUMN tb_syslog.message_filter_node_group IS 'group path 목록';
    COMMENT ON COLUMN tb_syslog.message_filter_node_ip IS 'ip4 range 목록';
    COMMENT ON COLUMN tb_syslog.server_log IS '서버 로그 목록';
    COMMENT ON COLUMN tb_syslog.agent_log IS '에이전트 로그 목록';
    COMMENT ON COLUMN tb_syslog.total_log IS '전체 로그 목록';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_syslog' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_syslog ADD CONSTRAINT tb_syslog_pkey PRIMARY KEY (idx);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_batch_job_last_execution';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_batch_job_last_execution ();
    COMMENT ON TABLE tb_batch_job_last_execution IS '배치 job별 마지막 처리 object id 정보 테이블';

    ALTER TABLE IF EXISTS tb_batch_job_last_execution ADD COLUMN IF NOT EXISTS job_name text NOT NULL;
    ALTER TABLE IF EXISTS tb_batch_job_last_execution ADD COLUMN IF NOT EXISTS last_obj_id text NOT NULL;
    ALTER TABLE IF EXISTS tb_batch_job_last_execution ADD COLUMN IF NOT EXISTS modified_time timestamp NOT NULL;

    COMMENT ON COLUMN tb_batch_job_last_execution.job_name IS 'job 이름';
    COMMENT ON COLUMN tb_batch_job_last_execution.last_obj_id IS '마지막 처리 object id';
    COMMENT ON COLUMN tb_batch_job_last_execution.modified_time IS '수정일시';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_batch_job_last_execution' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_batch_job_last_execution ADD CONSTRAINT tb_batch_job_last_execution_pkey PRIMARY KEY (job_name);
    END IF;
END $$ LANGUAGE 'plpgsql';
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
select '## tb_hips_signature_release';
DO $$
BEGIN
CREATE TABLE IF NOT EXISTS tb_hips_signature_release ();
COMMENT ON TABLE tb_hips_signature_release IS 'HIPS 시그니처 릴리즈 history 테이블';

ALTER TABLE IF EXISTS tb_hips_signature_release ADD COLUMN IF NOT EXISTS version text NOT NULL;
ALTER TABLE IF EXISTS tb_hips_signature_release ADD COLUMN IF NOT EXISTS path text NOT NULL;
ALTER TABLE IF EXISTS tb_hips_signature_release ADD COLUMN IF NOT EXISTS created_time timestamp NOT NULL;
ALTER TABLE IF EXISTS tb_hips_signature_release ADD COLUMN IF NOT EXISTS modified_time timestamp NOT NULL;

COMMENT ON COLUMN tb_hips_signature_release.version IS '시그니처 버전 정보';
COMMENT ON COLUMN tb_hips_signature_release.path IS 'release 파일 경로 주소';
COMMENT ON COLUMN tb_hips_signature_release.created_time IS '생성일시';
COMMENT ON COLUMN tb_hips_signature_release.modified_time IS '수정일시';

IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_signature_release' AND constraint_type = 'PRIMARY KEY') THEN
    ALTER TABLE tb_hips_signature_release ADD CONSTRAINT tb_hips_signature_release_pkey PRIMARY KEY (version);
END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_hips_agent_policy_ip_except_additional';
DO $$
BEGIN
CREATE TABLE IF NOT EXISTS tb_hips_agent_policy_ip_except_additional ();
COMMENT ON TABLE tb_hips_agent_policy_ip_except_additional IS 'HIPS 에이전트 정책 IP 예외 테이블';

ALTER TABLE IF EXISTS tb_hips_agent_policy_ip_except_additional ADD COLUMN IF NOT EXISTS node_id int8 NOT NULL;
ALTER TABLE IF EXISTS tb_hips_agent_policy_ip_except_additional ADD COLUMN IF NOT EXISTS ip_except_additional_body text NOT NULL;

COMMENT ON COLUMN tb_hips_agent_policy_ip_except_additional.node_id IS 'node ID';
COMMENT ON COLUMN tb_hips_agent_policy_ip_except_additional.ip_except_additional_body IS 'except_ip_additional';

IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_agent_policy_ip_except_additional' AND constraint_type = 'PRIMARY KEY') THEN
    ALTER TABLE tb_hips_agent_policy_ip_except_additional ADD CONSTRAINT tb_hips_agent_policy_ip_except_additional_pkey PRIMARY KEY (node_id);
END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_v3_quarantine';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_v3_quarantine ();
    COMMENT ON TABLE tb_v3_quarantine IS 'V3 검역소 정보 테이블';

    ALTER TABLE IF EXISTS tb_v3_quarantine ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_v3_quarantine ADD COLUMN IF NOT EXISTS node_ip inet;
    ALTER TABLE IF EXISTS tb_v3_quarantine ADD COLUMN IF NOT EXISTS task_id bigint;
    ALTER TABLE IF EXISTS tb_v3_quarantine ADD COLUMN IF NOT EXISTS instance_id bigint;
    ALTER TABLE IF EXISTS tb_v3_quarantine ADD COLUMN IF NOT EXISTS server_context text;
    ALTER TABLE IF EXISTS tb_v3_quarantine ADD COLUMN IF NOT EXISTS client_time timestamp with time zone;
    ALTER TABLE IF EXISTS tb_v3_quarantine ADD COLUMN IF NOT EXISTS tz_offset integer;
    ALTER TABLE IF EXISTS tb_v3_quarantine ADD COLUMN IF NOT EXISTS file_id bigint;
    ALTER TABLE IF EXISTS tb_v3_quarantine ADD COLUMN IF NOT EXISTS file_name text;
    ALTER TABLE IF EXISTS tb_v3_quarantine ADD COLUMN IF NOT EXISTS file_size bigint;
    ALTER TABLE IF EXISTS tb_v3_quarantine ADD COLUMN IF NOT EXISTS file_path text;
    ALTER TABLE IF EXISTS tb_v3_quarantine ADD COLUMN IF NOT EXISTS malware_name text;
    ALTER TABLE IF EXISTS tb_v3_quarantine ADD COLUMN IF NOT EXISTS quarantine_store_time timestamp with time zone;
    ALTER TABLE IF EXISTS tb_v3_quarantine ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone DEFAULT NOW();

    COMMENT ON COLUMN tb_v3_quarantine.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_v3_quarantine.node_ip IS '에이전트 IP';
    COMMENT ON COLUMN tb_v3_quarantine.task_id IS '작업 ID';
    COMMENT ON COLUMN tb_v3_quarantine.instance_id IS '예약 작업 인스턴스 ID';
    COMMENT ON COLUMN tb_v3_quarantine.server_context IS '서버 작업';
    COMMENT ON COLUMN tb_v3_quarantine.client_time IS '클라이언트 시각';
    COMMENT ON COLUMN tb_v3_quarantine.tz_offset IS '시간대';
    COMMENT ON COLUMN tb_v3_quarantine.file_id IS '파일 식별값';
    COMMENT ON COLUMN tb_v3_quarantine.file_name IS '파일 이름';
    COMMENT ON COLUMN tb_v3_quarantine.file_size IS '파일 크기(byte)';
    COMMENT ON COLUMN tb_v3_quarantine.file_path IS '파일 경로';
    COMMENT ON COLUMN tb_v3_quarantine.malware_name IS '진단명';
    COMMENT ON COLUMN tb_v3_quarantine.quarantine_store_time IS '검역소 보관 시간';
    COMMENT ON COLUMN tb_v3_quarantine.modified_time IS '수정일시';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_v3_quarantine' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_v3_quarantine ADD CONSTRAINT tb_v3_quarantine_pkey PRIMARY KEY (node_id, file_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_v3_quarantine_result';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_v3_quarantine_result ();
    COMMENT ON TABLE tb_v3_quarantine_result IS 'V3 검역소 파일 복원 결과 테이블';

    ALTER TABLE IF EXISTS tb_v3_quarantine_result ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_v3_quarantine_result ADD COLUMN IF NOT EXISTS node_ip inet;
    ALTER TABLE IF EXISTS tb_v3_quarantine_result ADD COLUMN IF NOT EXISTS task_id bigint;
    ALTER TABLE IF EXISTS tb_v3_quarantine_result ADD COLUMN IF NOT EXISTS instance_id bigint;
    ALTER TABLE IF EXISTS tb_v3_quarantine_result ADD COLUMN IF NOT EXISTS server_context text;
    ALTER TABLE IF EXISTS tb_v3_quarantine_result ADD COLUMN IF NOT EXISTS client_time timestamp with time zone;
    ALTER TABLE IF EXISTS tb_v3_quarantine_result ADD COLUMN IF NOT EXISTS tz_offset integer;
    ALTER TABLE IF EXISTS tb_v3_quarantine_result ADD COLUMN IF NOT EXISTS file_id bigint;
    ALTER TABLE IF EXISTS tb_v3_quarantine_result ADD COLUMN IF NOT EXISTS restore_result integer;
    ALTER TABLE IF EXISTS tb_v3_quarantine_result ADD COLUMN IF NOT EXISTS restore_error_code text;
    ALTER TABLE IF EXISTS tb_v3_quarantine_result ADD COLUMN IF NOT EXISTS file_restore_time timestamp with time zone;
    ALTER TABLE IF EXISTS tb_v3_quarantine_result ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone DEFAULT NOW();

    COMMENT ON COLUMN tb_v3_quarantine_result.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_v3_quarantine_result.node_ip IS '에이전트 IP';
    COMMENT ON COLUMN tb_v3_quarantine_result.task_id IS '작업 ID';
    COMMENT ON COLUMN tb_v3_quarantine_result.instance_id IS '예약 작업 인스턴스 ID';
    COMMENT ON COLUMN tb_v3_quarantine_result.server_context IS '서버 작업';
    COMMENT ON COLUMN tb_v3_quarantine_result.client_time IS '클라이언트 시각';
    COMMENT ON COLUMN tb_v3_quarantine_result.tz_offset IS '시간대';
    COMMENT ON COLUMN tb_v3_quarantine_result.file_id IS '파일 식별값';
    COMMENT ON COLUMN tb_v3_quarantine_result.restore_result IS '복원 여부';
    COMMENT ON COLUMN tb_v3_quarantine_result.restore_error_code IS '복원 결과 코드';
    COMMENT ON COLUMN tb_v3_quarantine_result.file_restore_time IS '복원 시간';
    COMMENT ON COLUMN tb_v3_quarantine_result.modified_time IS '수정일시';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_v3_quarantine_result' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_v3_quarantine_result ADD CONSTRAINT tb_v3_quarantine_result_pkey PRIMARY KEY (node_id, file_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

---------------------------------------------------------------------------------------------------------------------------------------------------------
select '## tb_v3_quar_info_obj_id';
DROP TABLE IF EXISTS tb_v3_quar_info_obj_id;

------------------------------------------------------------------------------------------
select '## tb_v3_cmd_quar_info_obj_id';
DROP TABLE IF EXISTS tb_v3_cmd_quar_info_obj_id;

------------------------------------------------------------------------------------------
select '## tb_v3_cmd_quar_result_obj_id';
DROP TABLE IF EXISTS tb_v3_cmd_quar_result_obj_id;

------------------------------------------------------------------------------------------
select '## tb_v3_quar_log_obj_id';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_v3_quar_log_obj_id ();
    COMMENT ON TABLE tb_v3_quar_log_obj_id IS '검역소 이벤트 로그  obj_id 관리';

    ALTER TABLE IF EXISTS tb_v3_quar_log_obj_id ADD COLUMN IF NOT EXISTS obj_id text;
    ALTER TABLE IF EXISTS tb_v3_quar_log_obj_id ADD COLUMN IF NOT EXISTS row_number bigint;

    COMMENT ON COLUMN tb_v3_quar_log_obj_id.obj_id IS 'MongoDB object ID';
    COMMENT ON COLUMN tb_v3_quar_log_obj_id.row_number IS '순서';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_v3_quar_log_obj_id' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_v3_quar_log_obj_id ADD CONSTRAINT tb_v3_quar_log_obj_id_pkey PRIMARY KEY (obj_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_im_detect_watchlist_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_im_detect_watchlist_timeline ();
    COMMENT ON TABLE tb_im_detect_watchlist_timeline IS 'IM 탐지 Watchlist 타임라인';

    ALTER TABLE IF EXISTS tb_im_detect_watchlist_timeline ADD COLUMN IF NOT EXISTS reg_date text;
    ALTER TABLE IF EXISTS tb_im_detect_watchlist_timeline ADD COLUMN IF NOT EXISTS hour text;
    ALTER TABLE IF EXISTS tb_im_detect_watchlist_timeline ADD COLUMN IF NOT EXISTS watchlist_id text;
    ALTER TABLE IF EXISTS tb_im_detect_watchlist_timeline ADD COLUMN IF NOT EXISTS watchlist_name text;
    ALTER TABLE IF EXISTS tb_im_detect_watchlist_timeline ADD COLUMN IF NOT EXISTS node_id int8;
    ALTER TABLE IF EXISTS tb_im_detect_watchlist_timeline ADD COLUMN IF NOT EXISTS ip text;
    ALTER TABLE IF EXISTS tb_im_detect_watchlist_timeline ADD COLUMN IF NOT EXISTS computer_name text;
    ALTER TABLE IF EXISTS tb_im_detect_watchlist_timeline ADD COLUMN IF NOT EXISTS detect_count int4;
    ALTER TABLE IF EXISTS tb_im_detect_watchlist_timeline ADD COLUMN IF NOT EXISTS create_time timestamp DEFAULT CURRENT_TIMESTAMP;
    ALTER TABLE IF EXISTS tb_im_detect_watchlist_timeline ADD COLUMN IF NOT EXISTS last_modified_time timestamp DEFAULT CURRENT_TIMESTAMP;

    COMMENT ON COLUMN public.tb_im_detect_watchlist_timeline.reg_date IS '등록 일시(yyyymmdd)';
    COMMENT ON COLUMN public.tb_im_detect_watchlist_timeline.hour IS '등록 시간(hh)';
    COMMENT ON COLUMN public.tb_im_detect_watchlist_timeline.watchlist_id IS 'Watchlist 아이디';
    COMMENT ON COLUMN public.tb_im_detect_watchlist_timeline.watchlist_name IS 'Watchlist 이름';
    COMMENT ON COLUMN public.tb_im_detect_watchlist_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN public.tb_im_detect_watchlist_timeline.ip IS '에이전트 IP';
    COMMENT ON COLUMN public.tb_im_detect_watchlist_timeline.computer_name IS '컴퓨터 이름';
    COMMENT ON COLUMN public.tb_im_detect_watchlist_timeline.detect_count IS 'Watchlist 탐지 횟수';
    COMMENT ON COLUMN public.tb_im_detect_watchlist_timeline.create_time IS '생성일시';
    COMMENT ON COLUMN public.tb_im_detect_watchlist_timeline.last_modified_time IS '수정일시';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_im_detect_watchlist_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_im_detect_watchlist_timeline ADD CONSTRAINT tb_im_detect_watchlist_timeline_pk PRIMARY KEY (reg_date, hour, watchlist_id, node_id);
    END IF;

    ALTER TABLE public.tb_im_detect_watchlist_timeline ALTER COLUMN reg_date TYPE text USING reg_date::text;
    ALTER TABLE public.tb_im_detect_watchlist_timeline ALTER COLUMN "hour" TYPE text USING "hour"::text;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_im_detect_rule_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_im_detect_rule_timeline ();
    COMMENT ON TABLE public.tb_im_detect_rule_timeline IS 'IM 탐지 규칙 타임라인';

    ALTER TABLE IF EXISTS tb_im_detect_rule_timeline ADD COLUMN IF NOT EXISTS reg_date text;
    ALTER TABLE IF EXISTS tb_im_detect_rule_timeline ADD COLUMN IF NOT EXISTS hour text;
    ALTER TABLE IF EXISTS tb_im_detect_rule_timeline ADD COLUMN IF NOT EXISTS rule_id text;
    ALTER TABLE IF EXISTS tb_im_detect_rule_timeline ADD COLUMN IF NOT EXISTS rule_name text;
    ALTER TABLE IF EXISTS tb_im_detect_rule_timeline ADD COLUMN IF NOT EXISTS detect_target text;
    ALTER TABLE IF EXISTS tb_im_detect_rule_timeline ADD COLUMN IF NOT EXISTS except_detect_target text;
    ALTER TABLE IF EXISTS tb_im_detect_rule_timeline ADD COLUMN IF NOT EXISTS node_id int8;
    ALTER TABLE IF EXISTS tb_im_detect_rule_timeline ADD COLUMN IF NOT EXISTS ip text;
    ALTER TABLE IF EXISTS tb_im_detect_rule_timeline ADD COLUMN IF NOT EXISTS computer_name text;
    ALTER TABLE IF EXISTS tb_im_detect_rule_timeline ADD COLUMN IF NOT EXISTS detect_count int4;
    ALTER TABLE IF EXISTS tb_im_detect_rule_timeline ADD COLUMN IF NOT EXISTS create_time timestamp DEFAULT CURRENT_TIMESTAMP;
    ALTER TABLE IF EXISTS tb_im_detect_rule_timeline ADD COLUMN IF NOT EXISTS last_modified_time timestamp DEFAULT CURRENT_TIMESTAMP;

    COMMENT ON COLUMN public.tb_im_detect_rule_timeline.reg_date IS '등록 일시(yyyymmdd)';
    COMMENT ON COLUMN public.tb_im_detect_rule_timeline.hour IS '등록 시간(hh)';
    COMMENT ON COLUMN public.tb_im_detect_rule_timeline.rule_id IS '규칙 아이디';
    COMMENT ON COLUMN public.tb_im_detect_rule_timeline.rule_name IS '규칙 이름';
    COMMENT ON COLUMN public.tb_im_detect_rule_timeline.detect_target IS '감시 대상';
    COMMENT ON COLUMN public.tb_im_detect_rule_timeline.except_detect_target IS '감시 대상 예외';
    COMMENT ON COLUMN public.tb_im_detect_rule_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN public.tb_im_detect_rule_timeline.ip IS '에이전트 IP';
    COMMENT ON COLUMN public.tb_im_detect_rule_timeline.computer_name IS '컴퓨터 이름';
    COMMENT ON COLUMN public.tb_im_detect_rule_timeline.detect_count IS '규칙 탐지 횟수';
    COMMENT ON COLUMN public.tb_im_detect_rule_timeline.create_time IS '생성일시';
    COMMENT ON COLUMN public.tb_im_detect_rule_timeline.last_modified_time IS '수정일시';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_im_detect_rule_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_im_detect_rule_timeline ADD CONSTRAINT tb_im_detect_rule_timeline_pk PRIMARY KEY (reg_date, hour, rule_id, node_id);
    END IF;

    ALTER TABLE public.tb_im_detect_rule_timeline ALTER COLUMN reg_date TYPE text USING reg_date::text;
    ALTER TABLE public.tb_im_detect_rule_timeline ALTER COLUMN "hour" TYPE text USING "hour"::text;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_im_detect_node_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_im_detect_node_timeline ();
    COMMENT ON TABLE public.tb_im_detect_node_timeline IS 'IM 탐지 에이전트 타임라인';

    ALTER TABLE IF EXISTS tb_im_detect_node_timeline ADD COLUMN IF NOT EXISTS reg_date text;
    ALTER TABLE IF EXISTS tb_im_detect_node_timeline ADD COLUMN IF NOT EXISTS hour text;
    ALTER TABLE IF EXISTS tb_im_detect_node_timeline ADD COLUMN IF NOT EXISTS node_id int8;
    ALTER TABLE IF EXISTS tb_im_detect_node_timeline ADD COLUMN IF NOT EXISTS ip text;
    ALTER TABLE IF EXISTS tb_im_detect_node_timeline ADD COLUMN IF NOT EXISTS computer_name text;
    ALTER TABLE IF EXISTS tb_im_detect_node_timeline ADD COLUMN IF NOT EXISTS last_detect_path text;
    ALTER TABLE IF EXISTS tb_im_detect_node_timeline ADD COLUMN IF NOT EXISTS detect_count int4;
    ALTER TABLE IF EXISTS tb_im_detect_node_timeline ADD COLUMN IF NOT EXISTS create_time timestamp DEFAULT CURRENT_TIMESTAMP;
    ALTER TABLE IF EXISTS tb_im_detect_node_timeline ADD COLUMN IF NOT EXISTS last_modified_time timestamp DEFAULT CURRENT_TIMESTAMP;

    COMMENT ON COLUMN public.tb_im_detect_node_timeline.reg_date IS '등록 일시(yyyymmdd)';
    COMMENT ON COLUMN public.tb_im_detect_node_timeline.hour IS '등록 시간(hh)';
    COMMENT ON COLUMN public.tb_im_detect_node_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN public.tb_im_detect_node_timeline.ip IS '에이전트 IP';
    COMMENT ON COLUMN public.tb_im_detect_node_timeline.computer_name IS '컴퓨터 이름';
    COMMENT ON COLUMN public.tb_im_detect_node_timeline.last_detect_path IS '마지막 감지된 대상의 경로';
    COMMENT ON COLUMN public.tb_im_detect_node_timeline.detect_count IS '규칙 탐지 횟수';
    COMMENT ON COLUMN public.tb_im_detect_node_timeline.create_time IS '생성일시';
    COMMENT ON COLUMN public.tb_im_detect_node_timeline.last_modified_time IS '수정일시';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_im_detect_node_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_im_detect_node_timeline ADD CONSTRAINT tb_im_detect_node_timeline_pk PRIMARY KEY (reg_date, hour, node_id);
    END IF;

    ALTER TABLE public.tb_im_detect_node_timeline ALTER COLUMN reg_date TYPE text USING reg_date::text;
    ALTER TABLE public.tb_im_detect_node_timeline ALTER COLUMN "hour" TYPE text USING "hour"::text;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_im_detect_target_type_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_im_detect_target_type_timeline ();
    COMMENT ON TABLE public.tb_im_detect_target_type_timeline IS 'IM 탐지 대상 타임라인';

    ALTER TABLE IF EXISTS tb_im_detect_target_type_timeline ADD COLUMN IF NOT EXISTS reg_date text;
    ALTER TABLE IF EXISTS tb_im_detect_target_type_timeline ADD COLUMN IF NOT EXISTS hour text;
    ALTER TABLE IF EXISTS tb_im_detect_target_type_timeline ADD COLUMN IF NOT EXISTS node_id int8;
    ALTER TABLE IF EXISTS tb_im_detect_target_type_timeline ADD COLUMN IF NOT EXISTS detect_path text;
    ALTER TABLE IF EXISTS tb_im_detect_target_type_timeline ADD COLUMN IF NOT EXISTS detect_count int4;
    ALTER TABLE IF EXISTS tb_im_detect_target_type_timeline ADD COLUMN IF NOT EXISTS create_time timestamp DEFAULT CURRENT_TIMESTAMP;
    ALTER TABLE IF EXISTS tb_im_detect_target_type_timeline ADD COLUMN IF NOT EXISTS last_modified_time timestamp DEFAULT CURRENT_TIMESTAMP;

    COMMENT ON COLUMN public.tb_im_detect_target_type_timeline.reg_date IS '등록 일시(yyyymmdd)';
    COMMENT ON COLUMN public.tb_im_detect_target_type_timeline.hour IS '등록 시간(hh)';
    COMMENT ON COLUMN public.tb_im_detect_target_type_timeline.node_id IS '에이전트 아이디';
    COMMENT ON COLUMN public.tb_im_detect_target_type_timeline.detect_path IS '감지된 대상의 경로';
    COMMENT ON COLUMN public.tb_im_detect_target_type_timeline.detect_count IS '대상 탐지 횟수';
    COMMENT ON COLUMN public.tb_im_detect_target_type_timeline.create_time IS '생성일시';
    COMMENT ON COLUMN public.tb_im_detect_target_type_timeline.last_modified_time IS '수정일시';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_im_detect_target_type_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_im_detect_target_type_timeline ADD CONSTRAINT tb_im_detect_target_type_timeline_pk PRIMARY KEY (reg_date, hour, node_id, detect_path);
    END IF;

    ALTER TABLE public.tb_im_detect_target_type_timeline ALTER COLUMN reg_date TYPE text USING reg_date::text;
    ALTER TABLE public.tb_im_detect_target_type_timeline ALTER COLUMN "hour" TYPE text USING "hour"::text;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_im_detect_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_im_detect_timeline ();
    COMMENT ON TABLE public.tb_im_detect_timeline IS 'IM 탐지 타임라인';

    ALTER TABLE IF EXISTS tb_im_detect_timeline ADD COLUMN IF NOT EXISTS reg_date text;
    ALTER TABLE IF EXISTS tb_im_detect_timeline ADD COLUMN IF NOT EXISTS hour text;
    ALTER TABLE IF EXISTS tb_im_detect_timeline ADD COLUMN IF NOT EXISTS node_id int8;
    ALTER TABLE IF EXISTS tb_im_detect_timeline ADD COLUMN IF NOT EXISTS ip text;
    ALTER TABLE IF EXISTS tb_im_detect_timeline ADD COLUMN IF NOT EXISTS computer_name text;
    ALTER TABLE IF EXISTS tb_im_detect_timeline ADD COLUMN IF NOT EXISTS detect_count int4;
    ALTER TABLE IF EXISTS tb_im_detect_timeline ADD COLUMN IF NOT EXISTS create_time timestamp DEFAULT CURRENT_TIMESTAMP;
    ALTER TABLE IF EXISTS tb_im_detect_timeline ADD COLUMN IF NOT EXISTS last_modified_time timestamp DEFAULT CURRENT_TIMESTAMP;

    COMMENT ON COLUMN public.tb_im_detect_timeline.reg_date IS '등록 일시(yyyymmdd)';
    COMMENT ON COLUMN public.tb_im_detect_timeline.hour IS '등록 시간(hh)';
    COMMENT ON COLUMN public.tb_im_detect_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN public.tb_im_detect_timeline.ip IS '에이전트 IP';
    COMMENT ON COLUMN public.tb_im_detect_timeline.computer_name IS '컴퓨터 이름';
    COMMENT ON COLUMN public.tb_im_detect_timeline.detect_count IS '규칙 탐지 횟수';
    COMMENT ON COLUMN public.tb_im_detect_timeline.create_time IS '생성일시';
    COMMENT ON COLUMN public.tb_im_detect_timeline.last_modified_time IS '수정일시';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_im_detect_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_im_detect_timeline ADD CONSTRAINT tb_im_detect_timeline_pk PRIMARY KEY (reg_date, hour, node_id);
    END IF;

    ALTER TABLE public.tb_im_detect_timeline ALTER COLUMN reg_date TYPE text USING reg_date::text;
    ALTER TABLE public.tb_im_detect_timeline ALTER COLUMN "hour" TYPE text USING "hour"::text;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_im_ondemand_log';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_im_ondemand_log ();
    COMMENT ON TABLE public.tb_im_ondemand_log IS 'IM 무결성 감시 로컬 로그 테이블';

    ALTER TABLE IF EXISTS tb_im_ondemand_log ADD COLUMN IF NOT EXISTS seq bigserial;
    ALTER TABLE IF EXISTS tb_im_ondemand_log ADD COLUMN IF NOT EXISTS task_id int8;
    ALTER TABLE IF EXISTS tb_im_ondemand_log ADD COLUMN IF NOT EXISTS instance_id int8;
    ALTER TABLE IF EXISTS tb_im_ondemand_log ADD COLUMN IF NOT EXISTS node_id int8;
    ALTER TABLE IF EXISTS tb_im_ondemand_log ADD COLUMN IF NOT EXISTS ip text;
    ALTER TABLE IF EXISTS tb_im_ondemand_log ADD COLUMN IF NOT EXISTS admin_id text;
    ALTER TABLE IF EXISTS tb_im_ondemand_log ADD COLUMN IF NOT EXISTS admin_ip text;
    ALTER TABLE IF EXISTS tb_im_ondemand_log ADD COLUMN IF NOT EXISTS collection_start_time text;
    ALTER TABLE IF EXISTS tb_im_ondemand_log ADD COLUMN IF NOT EXISTS collection_end_time text;
    ALTER TABLE IF EXISTS tb_im_ondemand_log ADD COLUMN IF NOT EXISTS collection_status text;
    ALTER TABLE IF EXISTS tb_im_ondemand_log ADD COLUMN IF NOT EXISTS collection_command_time timestamp;
    ALTER TABLE IF EXISTS tb_im_ondemand_log ADD COLUMN IF NOT EXISTS collection_completion_time timestamp;
    ALTER TABLE IF EXISTS tb_im_ondemand_log ADD COLUMN IF NOT EXISTS created_time timestamp;
    ALTER TABLE IF EXISTS tb_im_ondemand_log ADD COLUMN IF NOT EXISTS modified_time timestamp;
    ALTER TABLE IF EXISTS tb_im_ondemand_log ADD COLUMN IF NOT EXISTS saving_status text;
    ALTER TABLE IF EXISTS tb_im_ondemand_log ADD COLUMN IF NOT EXISTS log_file_path text;
    ALTER TABLE IF EXISTS tb_im_ondemand_log ADD COLUMN IF NOT EXISTS server_id bigint;

    COMMENT ON COLUMN public.tb_im_ondemand_log.seq IS '시퀀스';
    COMMENT ON COLUMN public.tb_im_ondemand_log.task_id IS '작업 ID';
    COMMENT ON COLUMN public.tb_im_ondemand_log.instance_id IS '작업 인스턴스 ID';
    COMMENT ON COLUMN public.tb_im_ondemand_log.node_id IS '에이전트 아이디';
    COMMENT ON COLUMN public.tb_im_ondemand_log.ip IS '에이전트 아이피';
    COMMENT ON COLUMN public.tb_im_ondemand_log.admin_id IS '관리자 아이디';
    COMMENT ON COLUMN public.tb_im_ondemand_log.admin_ip IS '관리자 아이피';
    COMMENT ON COLUMN public.tb_im_ondemand_log.collection_start_time IS '수집 요청 시작 일자';
    COMMENT ON COLUMN public.tb_im_ondemand_log.collection_end_time IS '수집 요청 종료 일자';
    COMMENT ON COLUMN public.tb_im_ondemand_log.collection_status IS '수집상태';
    COMMENT ON COLUMN public.tb_im_ondemand_log.collection_command_time IS '수집 명령 시간';
    COMMENT ON COLUMN public.tb_im_ondemand_log.collection_completion_time IS '수집 완료 시간';
    COMMENT ON COLUMN public.tb_im_ondemand_log.created_time IS '생성일시';
    COMMENT ON COLUMN public.tb_im_ondemand_log.modified_time IS '수정일시';
    COMMENT ON COLUMN public.tb_im_ondemand_log.saving_status IS '로그 내용 저장 상태(STARTED/UPLOADED/FINISH)';
    COMMENT ON COLUMN public.tb_im_ondemand_log.log_file_path IS '로그 파일 경로';
    COMMENT ON COLUMN public.tb_im_ondemand_log.server_id IS '파일 저장 서버ID';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_im_ondemand_log' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_im_ondemand_log ADD CONSTRAINT tb_im_ondemand_log_pk PRIMARY KEY (seq);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_im_ondemand_log_detect';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_im_ondemand_log_detect ();
    COMMENT ON TABLE public.tb_im_ondemand_log_detect IS 'IM 무결성 감시 로컬 로그 상세 탐지 정보 테이블';

    ALTER TABLE IF EXISTS tb_im_ondemand_log_detect ADD COLUMN IF NOT EXISTS seq bigserial;
    ALTER TABLE IF EXISTS tb_im_ondemand_log_detect ADD COLUMN IF NOT EXISTS log_id int8;
    ALTER TABLE IF EXISTS tb_im_ondemand_log_detect ADD COLUMN IF NOT EXISTS target_type text;
    ALTER TABLE IF EXISTS tb_im_ondemand_log_detect ADD COLUMN IF NOT EXISTS action text;
    ALTER TABLE IF EXISTS tb_im_ondemand_log_detect ADD COLUMN IF NOT EXISTS action_time timestamp;
    ALTER TABLE IF EXISTS tb_im_ondemand_log_detect ADD COLUMN IF NOT EXISTS event_type text;
    ALTER TABLE IF EXISTS tb_im_ondemand_log_detect ADD COLUMN IF NOT EXISTS modified_attribute_list text;
    ALTER TABLE IF EXISTS tb_im_ondemand_log_detect ADD COLUMN IF NOT EXISTS tag text;
    ALTER TABLE IF EXISTS tb_im_ondemand_log_detect ADD COLUMN IF NOT EXISTS watchlist_info text;
    ALTER TABLE IF EXISTS tb_im_ondemand_log_detect ADD COLUMN IF NOT EXISTS compliance text;
    ALTER TABLE IF EXISTS tb_im_ondemand_log_detect ADD COLUMN IF NOT EXISTS created_time timestamp;

    COMMENT ON COLUMN public.tb_im_ondemand_log_detect.seq IS '시퀀스';
    COMMENT ON COLUMN public.tb_im_ondemand_log_detect.log_id IS '무결성 감시 로컬로그 아이디(tb_im_ondemand_log)';
    COMMENT ON COLUMN public.tb_im_ondemand_log_detect.target_type IS '대상 타입';
    COMMENT ON COLUMN public.tb_im_ondemand_log_detect.action IS '감시 항목';
    COMMENT ON COLUMN public.tb_im_ondemand_log_detect.action_time IS '감시 발생 일시';
    COMMENT ON COLUMN public.tb_im_ondemand_log_detect.event_type IS '이벤트 타입(CREATED,MODIFIED,REMOVED)';
    COMMENT ON COLUMN public.tb_im_ondemand_log_detect.modified_attribute_list IS '변경 내용';
    COMMENT ON COLUMN public.tb_im_ondemand_log_detect.tag IS '태그';
    COMMENT ON COLUMN public.tb_im_ondemand_log_detect.watchlist_info IS '관련 Watchlist';
    COMMENT ON COLUMN public.tb_im_ondemand_log_detect.compliance IS 'Compliance';
    COMMENT ON COLUMN public.tb_im_ondemand_log_detect.created_time IS '생성일시';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_im_ondemand_log' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_im_ondemand_log ADD CONSTRAINT tb_im_ondemand_log_detect_pk PRIMARY KEY (seq);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_im_watchlist';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_im_watchlist ();
    COMMENT ON TABLE public.tb_im_watchlist IS 'IM watchlist 테이블';

    ALTER TABLE IF EXISTS tb_im_watchlist ADD COLUMN IF NOT EXISTS watchlist_id text;
    ALTER TABLE IF EXISTS tb_im_watchlist ADD COLUMN IF NOT EXISTS watchlist_name text;
    ALTER TABLE IF EXISTS tb_im_watchlist ADD COLUMN IF NOT EXISTS type text;
    ALTER TABLE IF EXISTS tb_im_watchlist ADD COLUMN IF NOT EXISTS compliance text;
    ALTER TABLE IF EXISTS tb_im_watchlist ADD COLUMN IF NOT EXISTS description text;
    ALTER TABLE IF EXISTS tb_im_watchlist ADD COLUMN IF NOT EXISTS is_use boolean;
    ALTER TABLE IF EXISTS tb_im_watchlist ADD COLUMN IF NOT EXISTS is_compress_log boolean;
    ALTER TABLE IF EXISTS tb_im_watchlist ADD COLUMN IF NOT EXISTS is_remain_local_log boolean;
    ALTER TABLE IF EXISTS tb_im_watchlist ADD COLUMN IF NOT EXISTS is_except_log boolean;
    ALTER TABLE IF EXISTS tb_im_watchlist ADD COLUMN IF NOT EXISTS is_except_signature boolean;
    ALTER TABLE IF EXISTS tb_im_watchlist ADD COLUMN IF NOT EXISTS created_time timestamp;
    ALTER TABLE IF EXISTS tb_im_watchlist ADD COLUMN IF NOT EXISTS modified_time timestamp;

    COMMENT ON COLUMN public.tb_im_watchlist.watchlist_id IS 'watchlist 아이디';
    COMMENT ON COLUMN public.tb_im_watchlist.watchlist_name IS 'watchlist 이름';
    COMMENT ON COLUMN public.tb_im_watchlist.type IS '구분(Predefined/Custom)';
    COMMENT ON COLUMN public.tb_im_watchlist.compliance IS 'Compliance';
    COMMENT ON COLUMN public.tb_im_watchlist.description IS '설명';
    COMMENT ON COLUMN public.tb_im_watchlist.is_use IS '사용여부';
    COMMENT ON COLUMN public.tb_im_watchlist.is_compress_log IS '로그 압축';
    COMMENT ON COLUMN public.tb_im_watchlist.is_remain_local_log IS '로컬 로그 남김';
    COMMENT ON COLUMN public.tb_im_watchlist.is_except_log IS '로그 파일 예외';
    COMMENT ON COLUMN public.tb_im_watchlist.is_except_signature IS '전자서명 파일 예외(Windows Only)';
    COMMENT ON COLUMN public.tb_im_watchlist.created_time IS '생성일시';
    COMMENT ON COLUMN public.tb_im_watchlist.modified_time IS '수정일시';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_im_watchlist' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_im_watchlist ADD CONSTRAINT tb_im_watchlist_pk PRIMARY KEY (watchlist_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_im_compliance';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_im_compliance();
    COMMENT ON TABLE tb_im_compliance IS 'IM compliance 기본 정보 테이블';

    ALTER TABLE IF EXISTS tb_im_compliance ADD COLUMN IF NOT EXISTS id text;
    ALTER TABLE IF EXISTS tb_im_compliance ADD COLUMN IF NOT EXISTS display_lang text;
    ALTER TABLE IF EXISTS tb_im_compliance ADD COLUMN IF NOT EXISTS title text;
    ALTER TABLE IF EXISTS tb_im_compliance ADD COLUMN IF NOT EXISTS description text;
    ALTER TABLE IF EXISTS tb_im_compliance ADD COLUMN IF NOT EXISTS created_time timestamp;
    ALTER TABLE IF EXISTS tb_im_compliance ADD COLUMN IF NOT EXISTS modified_time timestamp;

    COMMENT ON COLUMN tb_im_compliance.id IS 'compliance 아이디';
    COMMENT ON COLUMN tb_im_compliance.display_lang IS '지원언어';
    COMMENT ON COLUMN tb_im_compliance.title IS 'compliance 이름';
    COMMENT ON COLUMN tb_im_compliance.description IS 'compliance 설명';
    COMMENT ON COLUMN tb_im_compliance.created_time IS '생성일시';
    COMMENT ON COLUMN tb_im_compliance.modified_time IS '수정일시';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_im_compliance' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_im_compliance ADD CONSTRAINT tb_im_compliance_pkey PRIMARY KEY (id);
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_im_compliance_requirement';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_im_compliance_requirement();
    COMMENT ON TABLE tb_im_compliance_requirement IS 'IM compliance 항목 정보 테이블';

    ALTER TABLE IF EXISTS tb_im_compliance_requirement ADD COLUMN IF NOT EXISTS id text;
    ALTER TABLE IF EXISTS tb_im_compliance_requirement ADD COLUMN IF NOT EXISTS compliance_id text;
    ALTER TABLE IF EXISTS tb_im_compliance_requirement ADD COLUMN IF NOT EXISTS index text;
    ALTER TABLE IF EXISTS tb_im_compliance_requirement ADD COLUMN IF NOT EXISTS title text;
    ALTER TABLE IF EXISTS tb_im_compliance_requirement ADD COLUMN IF NOT EXISTS description text;
    ALTER TABLE IF EXISTS tb_im_compliance_requirement ADD COLUMN IF NOT EXISTS notes text;
    ALTER TABLE IF EXISTS tb_im_compliance_requirement ADD COLUMN IF NOT EXISTS created_time timestamp;
    ALTER TABLE IF EXISTS tb_im_compliance_requirement ADD COLUMN IF NOT EXISTS modified_time timestamp;

    COMMENT ON COLUMN tb_im_compliance_requirement.id IS 'compliance 항목 아이디';
    COMMENT ON COLUMN tb_im_compliance_requirement.compliance_id IS 'compliance 아이디';
    COMMENT ON COLUMN tb_im_compliance_requirement.index IS '항목 번호';
    COMMENT ON COLUMN tb_im_compliance_requirement.title IS '항목 이름';
    COMMENT ON COLUMN tb_im_compliance_requirement.description IS '항목 설명';
    COMMENT ON COLUMN tb_im_compliance_requirement.notes IS '항목 추가 설명';
    COMMENT ON COLUMN tb_im_compliance_requirement.created_time IS '생성일시';
    COMMENT ON COLUMN tb_im_compliance_requirement.modified_time IS '수정일시';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_im_compliance_requirement' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_im_compliance_requirement ADD CONSTRAINT tb_im_compliance_requirement_pkey PRIMARY KEY (id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_im_rule';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_im_rule ();
    COMMENT ON TABLE public.tb_im_rule IS 'IM 규칙 테이블';

    ALTER TABLE IF EXISTS tb_im_rule ADD COLUMN IF NOT EXISTS rule_id text;
    ALTER TABLE IF EXISTS tb_im_rule ADD COLUMN IF NOT EXISTS rule_name text;
    ALTER TABLE IF EXISTS tb_im_rule ADD COLUMN IF NOT EXISTS description text;
    ALTER TABLE IF EXISTS tb_im_rule ADD COLUMN IF NOT EXISTS type text;
    ALTER TABLE IF EXISTS tb_im_rule ADD COLUMN IF NOT EXISTS support_platform text;
    ALTER TABLE IF EXISTS tb_im_rule ADD COLUMN IF NOT EXISTS target_type text;
    ALTER TABLE IF EXISTS tb_im_rule ADD COLUMN IF NOT EXISTS detect_target text;
    ALTER TABLE IF EXISTS tb_im_rule ADD COLUMN IF NOT EXISTS detect_target_detail text;
    ALTER TABLE IF EXISTS tb_im_rule ADD COLUMN IF NOT EXISTS except_detect_target text;
    ALTER TABLE IF EXISTS tb_im_rule ADD COLUMN IF NOT EXISTS detect_target_depth int8;
    ALTER TABLE IF EXISTS tb_im_rule ADD COLUMN IF NOT EXISTS option json;
    ALTER TABLE IF EXISTS tb_im_rule ADD COLUMN IF NOT EXISTS on_change boolean DEFAULT false;
    ALTER TABLE IF EXISTS tb_im_rule ADD COLUMN IF NOT EXISTS follow_links boolean DEFAULT false;
    ALTER TABLE IF EXISTS tb_im_rule ADD COLUMN IF NOT EXISTS case_sensitive text DEFAULT 'OS';
    ALTER TABLE IF EXISTS tb_im_rule ADD COLUMN IF NOT EXISTS executable boolean DEFAULT false;
    ALTER TABLE IF EXISTS tb_im_rule ADD COLUMN IF NOT EXISTS created_time timestamp;
    ALTER TABLE IF EXISTS tb_im_rule ADD COLUMN IF NOT EXISTS modified_time timestamp;
    ALTER TABLE IF EXISTS tb_im_rule ADD COLUMN IF NOT EXISTS is_modified boolean DEFAULT false;

    COMMENT ON COLUMN public.tb_im_rule.rule_id IS '규칙 아이디';
    COMMENT ON COLUMN public.tb_im_rule.rule_name IS '규칙 이름';
    COMMENT ON COLUMN public.tb_im_rule.description IS '설명';
    COMMENT ON COLUMN public.tb_im_rule.type IS '구분(Predefined/Custom)';
    COMMENT ON COLUMN public.tb_im_rule.support_platform IS '대상 플랫폼';
    COMMENT ON COLUMN public.tb_im_rule.target_type IS '유형';
    COMMENT ON COLUMN public.tb_im_rule.detect_target IS '감시 대상';
    COMMENT ON COLUMN public.tb_im_rule.detect_target_detail IS '감시 대상-상세 설정(디렉토리/파일/레지스트리키/레지스트리값 유형)';
    COMMENT ON COLUMN public.tb_im_rule.except_detect_target IS '감시 대상 예외';
    COMMENT ON COLUMN public.tb_im_rule.detect_target_depth IS '감시 Depth(디렉토리/파일/레지스트리키/레지스트리값 유형)';
    COMMENT ON COLUMN public.tb_im_rule.option IS '감시 유형';
    COMMENT ON COLUMN public.tb_im_rule.on_change IS '실시간 감시 사용(디렉토리/파일/프로세스 유형)';
    COMMENT ON COLUMN public.tb_im_rule.follow_links IS 'Symbolic link 허용(디렉토리/파일 유형)';
    COMMENT ON COLUMN public.tb_im_rule.case_sensitive IS '대소문자 구분 옵션(디렉토리/파일 유형)';
    COMMENT ON COLUMN public.tb_im_rule.executable IS '실행파일 대상 적용(파일 유형)';
    COMMENT ON COLUMN public.tb_im_rule.created_time IS '생성일시';
    COMMENT ON COLUMN public.tb_im_rule.modified_time IS '수정일시';
    COMMENT ON COLUMN public.tb_im_rule.is_modified IS '수정여부';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_im_rule' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_im_rule ADD CONSTRAINT tb_im_rule_pk PRIMARY KEY (rule_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_im_rule_compliance_requirement';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_im_rule_compliance_requirement ();
    COMMENT ON TABLE public.tb_im_rule_compliance_requirement IS 'IM 규칙 - Compliance 항목 연관 테이블';

    ALTER TABLE IF EXISTS tb_im_rule_compliance_requirement ADD COLUMN IF NOT EXISTS rule_id text;
    ALTER TABLE IF EXISTS tb_im_rule_compliance_requirement ADD COLUMN IF NOT EXISTS compliance_requirement_id text;

    COMMENT ON COLUMN public.tb_im_rule_compliance_requirement.rule_id IS '규칙 아이디';
    COMMENT ON COLUMN public.tb_im_rule_compliance_requirement.compliance_requirement_id IS 'compliance 항목 아이디';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_im_rule_compliance_requirement' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_im_rule_compliance_requirement ADD CONSTRAINT tb_im_rule_compliance_requirement_pk PRIMARY KEY (rule_id, compliance_requirement_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_im_watchlist_rule';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_im_watchlist_rule ();
    COMMENT ON TABLE public.tb_im_watchlist_rule IS 'IM watchlist 규칙 연관 테이블';

    ALTER TABLE IF EXISTS tb_im_watchlist_rule ADD COLUMN IF NOT EXISTS watchlist_id text;
    ALTER TABLE IF EXISTS tb_im_watchlist_rule ADD COLUMN IF NOT EXISTS rule_id text;

    COMMENT ON COLUMN public.tb_im_watchlist_rule.watchlist_id IS 'watchlist 아이디';
    COMMENT ON COLUMN public.tb_im_watchlist_rule.rule_id IS '규칙 아이디';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_im_watchlist_rule' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_im_watchlist_rule ADD CONSTRAINT tb_im_watchlist_rule_pk PRIMARY KEY (watchlist_id,rule_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_im_node_watchlist';
DROP TABLE IF EXISTS tb_im_node_watchlist;

------------------------------------------------------------------------------------------
select '## tb_im_node_rule';
DROP TABLE IF EXISTS tb_im_node_rule;

------------------------------------------------------------------------------------------
select '## tb_im_watchlist_tag';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_im_watchlist_tag ();
    COMMENT ON TABLE public.tb_im_watchlist_tag IS 'IM watchlist별 태그 관련 정보';

    ALTER TABLE IF EXISTS tb_im_watchlist_tag ADD COLUMN IF NOT EXISTS watchlist_id text;
    ALTER TABLE IF EXISTS tb_im_watchlist_tag ADD COLUMN IF NOT EXISTS tag_id int8;
    ALTER TABLE IF EXISTS tb_im_watchlist_tag ADD COLUMN IF NOT EXISTS created_time timestamp;

    COMMENT ON COLUMN public.tb_im_watchlist_tag.watchlist_id IS 'watchlist 아이디';
    COMMENT ON COLUMN public.tb_im_watchlist_tag.tag_id IS '태그 아이디';
    COMMENT ON COLUMN public.tb_im_watchlist_tag.created_time IS '생성일시';

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_im_detect_event_log_obj_id';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_im_detect_event_log_obj_id();
    COMMENT ON TABLE tb_im_detect_event_log_obj_id IS 'IM 탐지 이벤트 로그 obj_id 관리';

    ALTER TABLE IF EXISTS tb_im_detect_event_log_obj_id ADD COLUMN IF NOT EXISTS obj_id text;
    ALTER TABLE IF EXISTS tb_im_detect_event_log_obj_id ADD COLUMN IF NOT EXISTS row_number bigint;

    COMMENT ON COLUMN tb_im_detect_event_log_obj_id.obj_id IS 'MongoDB object ID';
    COMMENT ON COLUMN tb_im_detect_event_log_obj_id.row_number IS '순서';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_im_detect_event_log_obj_id' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_im_detect_event_log_obj_id ADD CONSTRAINT tb_im_detect_event_log_obj_id_pkey PRIMARY KEY (obj_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## ';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_report_scm_compliance_scan_result_failed_agent_timeline();
    COMMENT ON TABLE tb_report_scm_compliance_scan_result_failed_agent_timeline IS 'SCM 보안 수준 취약 에이전트 순위';

    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS data_datetime text;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS node_id bigint;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS computer_name text;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS login_id text;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS platform_id en_platform_id_type;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS platform_name text;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS platform_type en_platform_type;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS ip inet;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS ip_connected inet;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS mac text;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS nt_domain text;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS os_language en_language;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS group_id bigint;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS group_name text;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS user_name text;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS department text;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS phone text;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS email text;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS empno text;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS connection_status en_connection_status;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS detect_count bigint;

    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_agent_timeline.data_datetime IS '일시';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_agent_timeline.node_id IS '에이전트 아이디';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_agent_timeline.computer_name IS '컴퓨터 이름';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_agent_timeline.login_id IS '로그인한 사용자';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_agent_timeline.platform_id IS '운영체제 아이디';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_agent_timeline.platform_name IS '운영체제 이름';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_agent_timeline.platform_type IS '운영체제 구분';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_agent_timeline.ip IS 'IP 주소';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_agent_timeline.ip_connected IS '연결된 IP 주소';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_agent_timeline.mac IS 'MAC 주소';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_agent_timeline.nt_domain IS 'Windows작업 그룹';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_agent_timeline.os_language IS '운영체제 언어';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_agent_timeline.group_id IS '그룹 아이디';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_agent_timeline.group_name IS '그룹명';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_agent_timeline.user_name IS '사용자 이름';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_agent_timeline.department IS '부서';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_agent_timeline.phone IS '전화 번호';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_agent_timeline.email IS '메일 주소';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_agent_timeline.empno IS '사원 번호';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_agent_timeline.connection_status IS '네트워크 상태';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_agent_timeline.detect_count IS '보안 수준 취약 탐지 횟수';

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## ';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_report_scm_compliance_scan_result_failed_item_timeline();
    COMMENT ON TABLE tb_report_scm_compliance_scan_result_failed_item_timeline IS 'SCM 보안 수준 취약 항목 순위';

    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_item_timeline ADD COLUMN IF NOT EXISTS data_datetime text;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_item_timeline ADD COLUMN IF NOT EXISTS node_id bigint;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_item_timeline ADD COLUMN IF NOT EXISTS computer_name text;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_item_timeline ADD COLUMN IF NOT EXISTS login_id text;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_item_timeline ADD COLUMN IF NOT EXISTS platform_id en_platform_id_type;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_item_timeline ADD COLUMN IF NOT EXISTS platform_name text;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_item_timeline ADD COLUMN IF NOT EXISTS platform_type en_platform_type;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_item_timeline ADD COLUMN IF NOT EXISTS ip inet;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_item_timeline ADD COLUMN IF NOT EXISTS ip_connected inet;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_item_timeline ADD COLUMN IF NOT EXISTS mac text;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_item_timeline ADD COLUMN IF NOT EXISTS nt_domain text;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_item_timeline ADD COLUMN IF NOT EXISTS os_language en_language;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_item_timeline ADD COLUMN IF NOT EXISTS group_id bigint;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_item_timeline ADD COLUMN IF NOT EXISTS group_name text;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_item_timeline ADD COLUMN IF NOT EXISTS user_name text;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_item_timeline ADD COLUMN IF NOT EXISTS department text;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_item_timeline ADD COLUMN IF NOT EXISTS phone text;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_item_timeline ADD COLUMN IF NOT EXISTS email text;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_item_timeline ADD COLUMN IF NOT EXISTS empno text;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_item_timeline ADD COLUMN IF NOT EXISTS connection_status en_connection_status;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_item_timeline ADD COLUMN IF NOT EXISTS compliance_policy_id text;
    ALTER TABLE IF EXISTS tb_report_scm_compliance_scan_result_failed_item_timeline ADD COLUMN IF NOT EXISTS detect_node_count bigint;

    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_item_timeline.data_datetime IS '일시';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_item_timeline.node_id IS '에이전트 아이디';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_item_timeline.computer_name IS '컴퓨터 이름';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_item_timeline.login_id IS '로그인한 사용자';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_item_timeline.platform_id IS '운영체제 아이디';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_item_timeline.platform_name IS '운영체제 이름';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_item_timeline.platform_type IS '운영체제 구분';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_item_timeline.ip IS 'IP 주소';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_item_timeline.ip_connected IS '연결된 IP 주소';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_item_timeline.mac IS 'MAC 주소';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_item_timeline.nt_domain IS 'Windows작업 그룹';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_item_timeline.os_language IS '운영체제 언어';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_item_timeline.group_id IS '그룹 아이디';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_item_timeline.group_name IS '그룹명';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_item_timeline.user_name IS '사용자 이름';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_item_timeline.department IS '부서';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_item_timeline.phone IS '전화 번호';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_item_timeline.email IS '메일 주소';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_item_timeline.empno IS '사원 번호';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_item_timeline.connection_status IS '네트워크 상태';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_item_timeline.compliance_policy_id IS 'compliance_policy_id';
    COMMENT ON COLUMN tb_report_scm_compliance_scan_result_failed_item_timeline.detect_node_count IS '탐지된 에이전트 수';

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## ';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_report_scm_secret_scan_result_failed_agent_timeline();
    COMMENT ON TABLE tb_report_scm_secret_scan_result_failed_agent_timeline IS 'SCM 민감정보 취약 에이전트 순위';

    ALTER TABLE IF EXISTS tb_report_scm_secret_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS data_datetime text;
    ALTER TABLE IF EXISTS tb_report_scm_secret_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS node_id bigint;
    ALTER TABLE IF EXISTS tb_report_scm_secret_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS computer_name text;
    ALTER TABLE IF EXISTS tb_report_scm_secret_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS login_id text;
    ALTER TABLE IF EXISTS tb_report_scm_secret_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS platform_id en_platform_id_type;
    ALTER TABLE IF EXISTS tb_report_scm_secret_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS platform_name text;
    ALTER TABLE IF EXISTS tb_report_scm_secret_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS platform_type en_platform_type;
    ALTER TABLE IF EXISTS tb_report_scm_secret_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS ip inet;
    ALTER TABLE IF EXISTS tb_report_scm_secret_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS ip_connected inet;
    ALTER TABLE IF EXISTS tb_report_scm_secret_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS mac text;
    ALTER TABLE IF EXISTS tb_report_scm_secret_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS nt_domain text;
    ALTER TABLE IF EXISTS tb_report_scm_secret_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS os_language en_language;
    ALTER TABLE IF EXISTS tb_report_scm_secret_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS group_id bigint;
    ALTER TABLE IF EXISTS tb_report_scm_secret_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS group_name text;
    ALTER TABLE IF EXISTS tb_report_scm_secret_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS user_name text;
    ALTER TABLE IF EXISTS tb_report_scm_secret_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS department text;
    ALTER TABLE IF EXISTS tb_report_scm_secret_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS phone text;
    ALTER TABLE IF EXISTS tb_report_scm_secret_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS email text;
    ALTER TABLE IF EXISTS tb_report_scm_secret_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS empno text;
    ALTER TABLE IF EXISTS tb_report_scm_secret_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS connection_status en_connection_status;
    ALTER TABLE IF EXISTS tb_report_scm_secret_scan_result_failed_agent_timeline ADD COLUMN IF NOT EXISTS detect_count bigint;

    COMMENT ON COLUMN tb_report_scm_secret_scan_result_failed_agent_timeline.data_datetime IS '일시';
    COMMENT ON COLUMN tb_report_scm_secret_scan_result_failed_agent_timeline.node_id IS '에이전트 아이디';
    COMMENT ON COLUMN tb_report_scm_secret_scan_result_failed_agent_timeline.computer_name IS '컴퓨터 이름';
    COMMENT ON COLUMN tb_report_scm_secret_scan_result_failed_agent_timeline.login_id IS '로그인한 사용자';
    COMMENT ON COLUMN tb_report_scm_secret_scan_result_failed_agent_timeline.platform_id IS '운영체제 아이디';
    COMMENT ON COLUMN tb_report_scm_secret_scan_result_failed_agent_timeline.platform_name IS '운영체제 이름';
    COMMENT ON COLUMN tb_report_scm_secret_scan_result_failed_agent_timeline.platform_type IS '운영체제 구분';
    COMMENT ON COLUMN tb_report_scm_secret_scan_result_failed_agent_timeline.ip IS 'IP 주소';
    COMMENT ON COLUMN tb_report_scm_secret_scan_result_failed_agent_timeline.ip_connected IS '연결된 IP 주소';
    COMMENT ON COLUMN tb_report_scm_secret_scan_result_failed_agent_timeline.mac IS 'MAC 주소';
    COMMENT ON COLUMN tb_report_scm_secret_scan_result_failed_agent_timeline.nt_domain IS 'Windows작업 그룹';
    COMMENT ON COLUMN tb_report_scm_secret_scan_result_failed_agent_timeline.os_language IS '운영체제 언어';
    COMMENT ON COLUMN tb_report_scm_secret_scan_result_failed_agent_timeline.group_id IS '그룹 아이디';
    COMMENT ON COLUMN tb_report_scm_secret_scan_result_failed_agent_timeline.group_name IS '그룹명';
    COMMENT ON COLUMN tb_report_scm_secret_scan_result_failed_agent_timeline.user_name IS '사용자 이름';
    COMMENT ON COLUMN tb_report_scm_secret_scan_result_failed_agent_timeline.department IS '부서';
    COMMENT ON COLUMN tb_report_scm_secret_scan_result_failed_agent_timeline.phone IS '전화 번호';
    COMMENT ON COLUMN tb_report_scm_secret_scan_result_failed_agent_timeline.email IS '메일 주소';
    COMMENT ON COLUMN tb_report_scm_secret_scan_result_failed_agent_timeline.empno IS '사원 번호';
    COMMENT ON COLUMN tb_report_scm_secret_scan_result_failed_agent_timeline.connection_status IS '네트워크 상태';
    COMMENT ON COLUMN tb_report_scm_secret_scan_result_failed_agent_timeline.detect_count IS '민감정보 취약 탐지 횟수';


END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_policy_im_watchlist';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_policy_im_watchlist();
    COMMENT ON TABLE public.tb_policy_im_watchlist IS '정책별 IM watchlist 정보';

    ALTER TABLE IF EXISTS tb_policy_im_watchlist ADD COLUMN IF NOT EXISTS policy_id int8;
    ALTER TABLE IF EXISTS tb_policy_im_watchlist ADD COLUMN IF NOT EXISTS watchlist_id text;
    ALTER TABLE IF EXISTS tb_policy_im_watchlist ADD COLUMN IF NOT EXISTS created_time timestamp;
    
    COMMENT ON COLUMN public.tb_policy_im_watchlist.policy_id IS '정책 아이디';
    COMMENT ON COLUMN public.tb_policy_im_watchlist.watchlist_id IS 'watchlist 아이디';
    COMMENT ON COLUMN public.tb_policy_im_watchlist.created_time IS '생성일시';
    
    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_policy_im_watchlist' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_policy_im_watchlist ADD CONSTRAINT tb_policy_im_watchlist_pkey PRIMARY KEY (policy_id, watchlist_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_im_tag';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_im_tag();
    COMMENT ON TABLE public.tb_im_tag IS 'IM 태그 정보';

    ALTER TABLE IF EXISTS tb_im_tag ADD COLUMN IF NOT EXISTS tag_id bigserial NOT NULL;
    ALTER TABLE IF EXISTS tb_im_tag ADD COLUMN IF NOT EXISTS tag_name text NULL;
    ALTER TABLE IF EXISTS tb_im_tag ADD COLUMN IF NOT EXISTS tag_color text NULL;
    ALTER TABLE IF EXISTS tb_im_tag ADD COLUMN IF NOT EXISTS created_time timestamp;
    ALTER TABLE IF EXISTS tb_im_tag ADD COLUMN IF NOT EXISTS modified_time timestamp;
    
    COMMENT ON COLUMN public.tb_im_tag.tag_id IS '태그 아이디';
    COMMENT ON COLUMN public.tb_im_tag.tag_name IS '태그 이름';
    COMMENT ON COLUMN public.tb_im_tag.tag_color IS '태그 색상';
    COMMENT ON COLUMN public.tb_im_tag.created_time IS '생성일시';
    COMMENT ON COLUMN public.tb_im_tag.modified_time IS '수정일시';
    
    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_im_tag' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_im_tag ADD CONSTRAINT tb_im_tag_pkey PRIMARY KEY (tag_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_im_tag' and constraint_name = 'tb_im_tag_un' AND constraint_type = 'UNIQUE') THEN
        ALTER TABLE IF EXISTS ONLY tb_im_tag ADD CONSTRAINT tb_im_tag_un UNIQUE (tag_name);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_scm_status';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_scm_status ();
    COMMENT ON TABLE tb_scm_status IS '에이전트별 SCM 제품 상태 정보';

    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS product_id en_product_id_type NOT NULL;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS ready_to_managed boolean;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS product_version text;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS service_status en_product_service_status NULL;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS hardening_status en_product_service_status NULL;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS integrity_status en_integrity_status NULL;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS integrity_scan_time timestamptz NULL;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS execute_date timestamptz NULL;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS last_update_time timestamptz NULL;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS scanner_version text NULL;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS rule_version text NULL;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS user_rule_version text NULL;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS scan_status en_scm_scan_status NULL;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS scan_time timestamptz NULL;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS compliance_scan_pass_count integer default 0;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS compliance_scan_fail_count integer default 0;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS compliance_scan_error_count integer default 0;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS compliance_scan_user_pass_count integer default 0;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS compliance_scan_user_fail_count integer default 0;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS compliance_scan_user_error_count integer default 0;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS secret_scan_pass_count integer default 0;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS secret_scan_fail_count integer default 0;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS secret_scan_error_count integer default 0;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS secret_scan_user_pass_count integer default 0;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS secret_scan_user_fail_count integer default 0;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS secret_scan_user_error_count integer default 0;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS license_no text;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS license_user text;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS license_org text;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS tz_offset integer;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS client_time timestamptz;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS install_time timestamptz;
    ALTER TABLE IF EXISTS tb_scm_status ADD COLUMN IF NOT EXISTS server_time timestamptz;

    COMMENT ON COLUMN tb_scm_status.node_id IS '에이전트 아이디';
    COMMENT ON COLUMN tb_scm_status.product_id IS '제품 아이디';
    COMMENT ON COLUMN tb_scm_status.ready_to_managed IS '제품 상태';
    COMMENT ON COLUMN tb_scm_status.product_version IS '제품 버전';
    COMMENT ON COLUMN tb_scm_status.service_status IS '서비스 동작 여부';
    COMMENT ON COLUMN tb_scm_status.hardening_status IS 'Hardening 동작 상태';
    COMMENT ON COLUMN tb_scm_status.integrity_status IS '무결성 상태';
    COMMENT ON COLUMN tb_scm_status.integrity_scan_time IS '마지막 무결성 검사 시간';
    COMMENT ON COLUMN tb_scm_status.execute_date IS '제품 실행 시간';
    COMMENT ON COLUMN tb_scm_status.last_update_time IS '마지막 업데이트 시간';
    COMMENT ON COLUMN tb_scm_status.scanner_version IS '스캐너 버전';
    COMMENT ON COLUMN tb_scm_status.rule_version IS 'Pre-defined rule 버전';
    COMMENT ON COLUMN tb_scm_status.user_rule_version IS 'User-define rule 버전';
    COMMENT ON COLUMN tb_scm_status.scan_status IS 'Scanner 호출 현재 상태';
    COMMENT ON COLUMN tb_scm_status.scan_time IS '최근 scan 날짜';
    COMMENT ON COLUMN tb_scm_status.compliance_scan_pass_count IS 'compliance 스캔 성공 건수';
    COMMENT ON COLUMN tb_scm_status.compliance_scan_fail_count IS 'compliance 스캔 실패 건수';
    COMMENT ON COLUMN tb_scm_status.compliance_scan_error_count IS 'compliance 스캔 에러 건수';
    COMMENT ON COLUMN tb_scm_status.compliance_scan_user_pass_count IS 'user defined compliance 스캔 성공 건수';
    COMMENT ON COLUMN tb_scm_status.compliance_scan_user_fail_count IS 'user defined compliance 스캔 실패 건수';
    COMMENT ON COLUMN tb_scm_status.compliance_scan_user_error_count IS 'user defined compliance 스캔 에러 건수';
    COMMENT ON COLUMN tb_scm_status.secret_scan_pass_count IS 'secret 스캔 성공 건수';
    COMMENT ON COLUMN tb_scm_status.secret_scan_fail_count IS 'secret 스캔 실패 건수';
    COMMENT ON COLUMN tb_scm_status.secret_scan_error_count IS 'secret 스캔 에러 건수';
    COMMENT ON COLUMN tb_scm_status.secret_scan_user_pass_count IS 'user defined secret 스캔 성공 건수';
    COMMENT ON COLUMN tb_scm_status.secret_scan_user_fail_count IS 'user defined secret 스캔 실패 건수';
    COMMENT ON COLUMN tb_scm_status.secret_scan_user_error_count IS 'user defined secret 스캔 에러 건수';
    COMMENT ON COLUMN tb_scm_status.license_no IS '라이선스 번호';
    COMMENT ON COLUMN tb_scm_status.license_user IS '라이선스 사용자';
    COMMENT ON COLUMN tb_scm_status.license_org IS '라이선스 조직';
    COMMENT ON COLUMN tb_scm_status.tz_offset IS '에이전트 시간대';
    COMMENT ON COLUMN tb_scm_status.client_time IS '상태 전송 시간';
    COMMENT ON COLUMN tb_scm_status.install_time IS '제품 설치 시간';
    COMMENT ON COLUMN tb_scm_status.server_time IS '데이터 처리 시간';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_scm_status' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_scm_status ADD CONSTRAINT tb_scm_status_pkey PRIMARY KEY (node_id, product_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_scm_status_daily_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_scm_status_daily_timeline ();
    COMMENT ON TABLE tb_scm_status_daily_timeline IS '에이전트별 SCM 제품 상태 정보 일자별 타임라인';

    ALTER TABLE IF EXISTS tb_scm_status_daily_timeline ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_scm_status_daily_timeline ADD COLUMN IF NOT EXISTS reg_date varchar(8) NOT NULL;
    ALTER TABLE IF EXISTS tb_scm_status_daily_timeline ADD COLUMN IF NOT EXISTS compliance_scan_pass_count integer default 0;
    ALTER TABLE IF EXISTS tb_scm_status_daily_timeline ADD COLUMN IF NOT EXISTS compliance_scan_fail_count integer default 0;
    ALTER TABLE IF EXISTS tb_scm_status_daily_timeline ADD COLUMN IF NOT EXISTS compliance_scan_error_count integer default 0;
    ALTER TABLE IF EXISTS tb_scm_status_daily_timeline ADD COLUMN IF NOT EXISTS compliance_scan_user_pass_count integer default 0;
    ALTER TABLE IF EXISTS tb_scm_status_daily_timeline ADD COLUMN IF NOT EXISTS compliance_scan_user_fail_count integer default 0;
    ALTER TABLE IF EXISTS tb_scm_status_daily_timeline ADD COLUMN IF NOT EXISTS compliance_scan_user_error_count integer default 0;
    ALTER TABLE IF EXISTS tb_scm_status_daily_timeline ADD COLUMN IF NOT EXISTS secret_scan_pass_count integer default 0;
    ALTER TABLE IF EXISTS tb_scm_status_daily_timeline ADD COLUMN IF NOT EXISTS secret_scan_fail_count integer default 0;
    ALTER TABLE IF EXISTS tb_scm_status_daily_timeline ADD COLUMN IF NOT EXISTS secret_scan_error_count integer default 0;
    ALTER TABLE IF EXISTS tb_scm_status_daily_timeline ADD COLUMN IF NOT EXISTS secret_scan_user_pass_count integer default 0;
    ALTER TABLE IF EXISTS tb_scm_status_daily_timeline ADD COLUMN IF NOT EXISTS secret_scan_user_fail_count integer default 0;
    ALTER TABLE IF EXISTS tb_scm_status_daily_timeline ADD COLUMN IF NOT EXISTS secret_scan_user_error_count integer default 0;
    ALTER TABLE IF EXISTS tb_scm_status_daily_timeline ADD COLUMN IF NOT EXISTS server_time timestamptz NULL;

    COMMENT ON COLUMN tb_scm_status_daily_timeline.node_id IS '에이전트 아이디';
    COMMENT ON COLUMN tb_scm_status_daily_timeline.reg_date IS '일자';
    COMMENT ON COLUMN tb_scm_status_daily_timeline.compliance_scan_pass_count IS 'compliance 스캔 성공 건수';
    COMMENT ON COLUMN tb_scm_status_daily_timeline.compliance_scan_fail_count IS 'compliance 스캔 실패 건수';
    COMMENT ON COLUMN tb_scm_status_daily_timeline.compliance_scan_error_count IS 'compliance 스캔 에러 건수';
    COMMENT ON COLUMN tb_scm_status_daily_timeline.compliance_scan_user_pass_count IS 'user defined compliance 스캔 성공 건수';
    COMMENT ON COLUMN tb_scm_status_daily_timeline.compliance_scan_user_fail_count IS 'user defined compliance 스캔 실패 건수';
    COMMENT ON COLUMN tb_scm_status_daily_timeline.compliance_scan_user_error_count IS 'user defined compliance 스캔 에러 건수';
    COMMENT ON COLUMN tb_scm_status_daily_timeline.secret_scan_pass_count IS 'secret 스캔 성공 건수';
    COMMENT ON COLUMN tb_scm_status_daily_timeline.secret_scan_fail_count IS 'secret 스캔 실패 건수';
    COMMENT ON COLUMN tb_scm_status_daily_timeline.secret_scan_error_count IS 'secret 스캔 에러 건수';
    COMMENT ON COLUMN tb_scm_status_daily_timeline.secret_scan_user_pass_count IS 'user defined secret 스캔 성공 건수';
    COMMENT ON COLUMN tb_scm_status_daily_timeline.secret_scan_user_fail_count IS 'user defined secret 스캔 실패 건수';
    COMMENT ON COLUMN tb_scm_status_daily_timeline.secret_scan_user_error_count IS 'user defined secret 스캔 에러 건수';
    COMMENT ON COLUMN tb_scm_status_daily_timeline.server_time IS '에이전트별 SCM 제품 상태 정보 마지막 데이터 처리 시간';
    
    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_scm_status_daily_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_scm_status_daily_timeline ADD CONSTRAINT tb_scm_status_daily_timeline_pkey PRIMARY KEY (node_id, reg_date);
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_scm_agent_log_obj_id';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_scm_agent_log_obj_id();
    COMMENT ON TABLE tb_scm_agent_log_obj_id IS 'SCM 에이전트 로그 obj_id 관리';

    ALTER TABLE IF EXISTS tb_scm_agent_log_obj_id ADD COLUMN IF NOT EXISTS obj_id text;
    ALTER TABLE IF EXISTS tb_scm_agent_log_obj_id ADD COLUMN IF NOT EXISTS row_number bigint;

    COMMENT ON COLUMN tb_scm_agent_log_obj_id.obj_id IS 'MongoDB object ID';
    COMMENT ON COLUMN tb_scm_agent_log_obj_id.row_number IS '순서';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_scm_agent_log_obj_id' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_scm_agent_log_obj_id ADD CONSTRAINT tb_scm_agent_log_obj_id_pkey PRIMARY KEY (obj_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_scm_scan_log_obj_id';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_scm_scan_log_obj_id();
    COMMENT ON TABLE tb_scm_scan_log_obj_id IS '하드닝 점검 로그 obj_id 관리';

    ALTER TABLE IF EXISTS tb_scm_scan_log_obj_id ADD COLUMN IF NOT EXISTS obj_id text;
    ALTER TABLE IF EXISTS tb_scm_scan_log_obj_id ADD COLUMN IF NOT EXISTS row_number bigint;

    COMMENT ON COLUMN tb_scm_scan_log_obj_id.obj_id IS 'MongoDB object ID';
    COMMENT ON COLUMN tb_scm_scan_log_obj_id.row_number IS '순서';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_scm_scan_log_obj_id' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_scm_scan_log_obj_id ADD CONSTRAINT tb_scm_scan_log_obj_id_pkey PRIMARY KEY (obj_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_scm_scan_result_info';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_scm_scan_result_info ();
    COMMENT ON TABLE public.tb_scm_scan_result_info IS 'scm 스캔 결과 정보';

    ALTER TABLE IF EXISTS tb_scm_scan_result_info ADD COLUMN IF NOT EXISTS seq bigserial;
    ALTER TABLE IF EXISTS tb_scm_scan_result_info ADD COLUMN IF NOT EXISTS type text;
    ALTER TABLE IF EXISTS tb_scm_scan_result_info ADD COLUMN IF NOT EXISTS task_id int8;
    ALTER TABLE IF EXISTS tb_scm_scan_result_info ADD COLUMN IF NOT EXISTS instance_id int8;
    ALTER TABLE IF EXISTS tb_scm_scan_result_info ADD COLUMN IF NOT EXISTS node_id int8;
    ALTER TABLE IF EXISTS tb_scm_scan_result_info ADD COLUMN IF NOT EXISTS ip text;
    ALTER TABLE IF EXISTS tb_scm_scan_result_info ADD COLUMN IF NOT EXISTS admin_id text;
    ALTER TABLE IF EXISTS tb_scm_scan_result_info ADD COLUMN IF NOT EXISTS admin_ip text;
    ALTER TABLE IF EXISTS tb_scm_scan_result_info ADD COLUMN IF NOT EXISTS scan_command_status text;
    ALTER TABLE IF EXISTS tb_scm_scan_result_info ADD COLUMN IF NOT EXISTS scan_command_time timestamp;
    ALTER TABLE IF EXISTS tb_scm_scan_result_info ADD COLUMN IF NOT EXISTS scan_result_status text;
    ALTER TABLE IF EXISTS tb_scm_scan_result_info ADD COLUMN IF NOT EXISTS scan_result_file_name text;
    ALTER TABLE IF EXISTS tb_scm_scan_result_info ADD COLUMN IF NOT EXISTS scan_result_file_path text;
    ALTER TABLE IF EXISTS tb_scm_scan_result_info ADD COLUMN IF NOT EXISTS scan_completion_time timestamp;
    ALTER TABLE IF EXISTS tb_scm_scan_result_info ADD COLUMN IF NOT EXISTS created_time timestamp;
    ALTER TABLE IF EXISTS tb_scm_scan_result_info ADD COLUMN IF NOT EXISTS modified_time timestamp;

    COMMENT ON COLUMN public.tb_scm_scan_result_info.seq IS '시퀀스';
    COMMENT ON COLUMN public.tb_scm_scan_result_info.type IS '스캔 결과 파일 타입(명령/정책)';
    COMMENT ON COLUMN public.tb_scm_scan_result_info.task_id IS '작업 ID';
    COMMENT ON COLUMN public.tb_scm_scan_result_info.instance_id IS '작업 인스턴스 ID';
    COMMENT ON COLUMN public.tb_scm_scan_result_info.node_id IS '에이전트 아이디';
    COMMENT ON COLUMN public.tb_scm_scan_result_info.ip IS '에이전트 아이피';
    COMMENT ON COLUMN public.tb_scm_scan_result_info.admin_id IS '관리자 아이디';
    COMMENT ON COLUMN public.tb_scm_scan_result_info.admin_ip IS '관리자 아이피';
    COMMENT ON COLUMN public.tb_scm_scan_result_info.scan_command_status IS '수동 검사 상태';
    COMMENT ON COLUMN public.tb_scm_scan_result_info.scan_command_time IS '수동 검사 명령 시간';
    COMMENT ON COLUMN public.tb_scm_scan_result_info.scan_result_status IS '스캔 결과 저장 상태(STARTED/UPLOADED/FINISH)';
    COMMENT ON COLUMN public.tb_scm_scan_result_info.scan_result_file_name IS '스캔 결과 파일명';
    COMMENT ON COLUMN public.tb_scm_scan_result_info.scan_result_file_path IS '스캔 결과 파일 경로';
    COMMENT ON COLUMN public.tb_scm_scan_result_info.scan_completion_time IS '수동 검사 완료 시간';
    COMMENT ON COLUMN public.tb_scm_scan_result_info.created_time IS '생성일시';
    COMMENT ON COLUMN public.tb_scm_scan_result_info.modified_time IS '수정일시';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_scm_scan_result_info' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_scm_scan_result_info ADD CONSTRAINT tb_scm_scan_result_info_pk PRIMARY KEY (seq);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_scm_scan_result_detail';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_scm_scan_result_detail ();
    COMMENT ON TABLE public.tb_scm_scan_result_detail IS 'SCM 스캔 결과 상세 정보';

    ALTER TABLE IF EXISTS tb_scm_scan_result_detail ADD COLUMN IF NOT EXISTS seq bigserial;
    ALTER TABLE IF EXISTS tb_scm_scan_result_detail ADD COLUMN IF NOT EXISTS category text NOT NULL;
    ALTER TABLE IF EXISTS tb_scm_scan_result_detail ADD COLUMN IF NOT EXISTS "type" text NOT NULL;
    ALTER TABLE IF EXISTS tb_scm_scan_result_detail ADD COLUMN IF NOT EXISTS scan_id int8 NOT NULL;
       ALTER TABLE IF EXISTS tb_scm_scan_result_detail ADD COLUMN IF NOT EXISTS compliance_policy_id text NOT NULL;
       ALTER TABLE IF EXISTS tb_scm_scan_result_detail ADD COLUMN IF NOT EXISTS result text NOT NULL;
       ALTER TABLE IF EXISTS tb_scm_scan_result_detail ADD COLUMN IF NOT EXISTS error_reason text;
       ALTER TABLE IF EXISTS tb_scm_scan_result_detail ADD COLUMN IF NOT EXISTS created_time timestamp DEFAULT CURRENT_TIMESTAMP;

    COMMENT ON COLUMN public.tb_scm_scan_result_detail.seq IS '시퀀스';
    COMMENT ON COLUMN public.tb_scm_scan_result_detail.category IS '정보 구분(COMPLIANCE/SECRET)';
    COMMENT ON COLUMN public.tb_scm_scan_result_detail.type IS '기본/사용자정의 구분(PREDEFINED/USERDEFINED)';
    COMMENT ON COLUMN public.tb_scm_scan_result_detail.scan_id IS '스캔 결과 정보 아이디';
    COMMENT ON COLUMN public.tb_scm_scan_result_detail.compliance_policy_id IS 'compliance policy id';
    COMMENT ON COLUMN public.tb_scm_scan_result_detail.result IS '스캔 결과';
    COMMENT ON COLUMN public.tb_scm_scan_result_detail.error_reason IS '스캔 결과 error시 reason';
       COMMENT ON COLUMN public.tb_scm_scan_result_detail.created_time IS '생성일시';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_scm_scan_result_detail' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_scm_scan_result_detail ADD CONSTRAINT tb_scm_scan_result_detail_pk PRIMARY KEY (seq);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_scm_compliance_scan_result_failed_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_scm_compliance_scan_result_failed_timeline ();
    COMMENT ON TABLE public.tb_scm_compliance_scan_result_failed_timeline IS 'SCM 보안 수준 취약 결과 타임라인';

    ALTER TABLE IF EXISTS tb_scm_compliance_scan_result_failed_timeline ADD COLUMN IF NOT EXISTS reg_date char(8);
    ALTER TABLE IF EXISTS tb_scm_compliance_scan_result_failed_timeline ADD COLUMN IF NOT EXISTS hour char(2);
    ALTER TABLE IF EXISTS tb_scm_compliance_scan_result_failed_timeline ADD COLUMN IF NOT EXISTS node_id int8;
    ALTER TABLE IF EXISTS tb_scm_compliance_scan_result_failed_timeline ADD COLUMN IF NOT EXISTS compliance_policy_id text;
    ALTER TABLE IF EXISTS tb_scm_compliance_scan_result_failed_timeline ADD COLUMN IF NOT EXISTS detect_count int4;
    ALTER TABLE IF EXISTS tb_scm_compliance_scan_result_failed_timeline ADD COLUMN IF NOT EXISTS created_time timestamp DEFAULT CURRENT_TIMESTAMP;
    ALTER TABLE IF EXISTS tb_scm_compliance_scan_result_failed_timeline ADD COLUMN IF NOT EXISTS last_modified_time timestamp DEFAULT CURRENT_TIMESTAMP;

    COMMENT ON COLUMN public.tb_scm_compliance_scan_result_failed_timeline.reg_date IS '등록 일시(yyyymmdd)';
    COMMENT ON COLUMN public.tb_scm_compliance_scan_result_failed_timeline.hour IS '등록 시간(hh)';
    COMMENT ON COLUMN public.tb_scm_compliance_scan_result_failed_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN public.tb_scm_compliance_scan_result_failed_timeline.compliance_policy_id IS 'compliance policy id';
    COMMENT ON COLUMN public.tb_scm_compliance_scan_result_failed_timeline.detect_count IS '탐지 횟수';
    COMMENT ON COLUMN public.tb_scm_compliance_scan_result_failed_timeline.created_time IS '생성일시';
    COMMENT ON COLUMN public.tb_scm_compliance_scan_result_failed_timeline.last_modified_time IS '수정일시';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_scm_compliance_scan_result_failed_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_scm_compliance_scan_result_failed_timeline ADD CONSTRAINT tb_scm_compliance_scan_result_failed_timeline_pk PRIMARY KEY (reg_date, hour, node_id, compliance_policy_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_scm_group_info';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_scm_group_info ();
    COMMENT ON TABLE public.tb_scm_group_info IS 'scm group 정보';
       
    ALTER TABLE IF EXISTS tb_scm_group_info ADD COLUMN IF NOT EXISTS "group" text;
    ALTER TABLE IF EXISTS tb_scm_group_info ADD COLUMN IF NOT EXISTS title text;
    ALTER TABLE IF EXISTS tb_scm_group_info ADD COLUMN IF NOT EXISTS created_time timestamp;
    ALTER TABLE IF EXISTS tb_scm_group_info ADD COLUMN IF NOT EXISTS modified_time timestamp;
       
    COMMENT ON COLUMN public.tb_scm_group_info.group IS 'group 종류';
    COMMENT ON COLUMN public.tb_scm_group_info.title IS 'group 이름';
    COMMENT ON COLUMN public.tb_scm_group_info.created_time IS '생성일시';
    COMMENT ON COLUMN public.tb_scm_group_info.modified_time IS '수정일시';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_scm_group_info' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_scm_group_info ADD CONSTRAINT tb_scm_group_info_pk PRIMARY KEY ("group");
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_scm_rule_set_info';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_scm_rule_set_info ();
    COMMENT ON TABLE public.tb_scm_rule_set_info IS 'scm rule set 기본 정보';
       
    ALTER TABLE IF EXISTS tb_scm_rule_set_info ADD COLUMN IF NOT EXISTS "type" text;
    ALTER TABLE IF EXISTS tb_scm_rule_set_info ADD COLUMN IF NOT EXISTS "group" text;
    ALTER TABLE IF EXISTS tb_scm_rule_set_info ADD COLUMN IF NOT EXISTS compliance_id text;
    ALTER TABLE IF EXISTS tb_scm_rule_set_info ADD COLUMN IF NOT EXISTS "language" text;
    ALTER TABLE IF EXISTS tb_scm_rule_set_info ADD COLUMN IF NOT EXISTS title text;
    ALTER TABLE IF EXISTS tb_scm_rule_set_info ADD COLUMN IF NOT EXISTS description text;
    ALTER TABLE IF EXISTS tb_scm_rule_set_info ADD COLUMN IF NOT EXISTS created_time timestamp;
    ALTER TABLE IF EXISTS tb_scm_rule_set_info ADD COLUMN IF NOT EXISTS modified_time timestamp;
       
    COMMENT ON COLUMN public.tb_scm_rule_set_info.type IS '보안수준/민감정보 구분';
    COMMENT ON COLUMN public.tb_scm_rule_set_info.group IS 'compliance 종류';
    COMMENT ON COLUMN public.tb_scm_rule_set_info.compliance_id IS 'compliance 세부 종류';
    COMMENT ON COLUMN public.tb_scm_rule_set_info.language IS '지원언어';
    COMMENT ON COLUMN public.tb_scm_rule_set_info.title IS 'compliance 이름';
    COMMENT ON COLUMN public.tb_scm_rule_set_info.description IS 'compliance 설명';
    COMMENT ON COLUMN public.tb_scm_rule_set_info.created_time IS '생성일시';
    COMMENT ON COLUMN public.tb_scm_rule_set_info.modified_time IS '수정일시';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_scm_rule_set_info' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_scm_rule_set_info ADD CONSTRAINT tb_scm_rule_set_info_pk PRIMARY KEY ("type","group",compliance_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_scm_rule_set_audit';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_scm_rule_set_audit ();
    COMMENT ON TABLE public.tb_scm_rule_set_audit IS 'scm rule set audit 정보';
       
    ALTER TABLE IF EXISTS tb_scm_rule_set_audit ADD COLUMN IF NOT EXISTS "type" text;
    ALTER TABLE IF EXISTS tb_scm_rule_set_audit ADD COLUMN IF NOT EXISTS "group" text;
       ALTER TABLE IF EXISTS tb_scm_rule_set_audit ADD COLUMN IF NOT EXISTS compliance_id text;
    ALTER TABLE IF EXISTS tb_scm_rule_set_audit ADD COLUMN IF NOT EXISTS parent_audit_id text;
    ALTER TABLE IF EXISTS tb_scm_rule_set_audit ADD COLUMN IF NOT EXISTS audit_id text;
    ALTER TABLE IF EXISTS tb_scm_rule_set_audit ADD COLUMN IF NOT EXISTS ablescan boolean;
    ALTER TABLE IF EXISTS tb_scm_rule_set_audit ADD COLUMN IF NOT EXISTS title text;
    ALTER TABLE IF EXISTS tb_scm_rule_set_audit ADD COLUMN IF NOT EXISTS description text;
       ALTER TABLE IF EXISTS tb_scm_rule_set_audit ADD COLUMN IF NOT EXISTS remediation text;
       ALTER TABLE IF EXISTS tb_scm_rule_set_audit ADD COLUMN IF NOT EXISTS score int4;
      ALTER TABLE IF EXISTS tb_scm_rule_set_audit ADD COLUMN IF NOT EXISTS "level" int4;
    ALTER TABLE IF EXISTS tb_scm_rule_set_audit ADD COLUMN IF NOT EXISTS pass_count integer default 0;
    ALTER TABLE IF EXISTS tb_scm_rule_set_audit ADD COLUMN IF NOT EXISTS fail_count integer default 0;
    ALTER TABLE IF EXISTS tb_scm_rule_set_audit ADD COLUMN IF NOT EXISTS error_count integer default 0;
    ALTER TABLE IF EXISTS tb_scm_rule_set_audit ADD COLUMN IF NOT EXISTS created_time timestamp;
    ALTER TABLE IF EXISTS tb_scm_rule_set_audit ADD COLUMN IF NOT EXISTS modified_time timestamp;
       
    COMMENT ON COLUMN public.tb_scm_rule_set_audit.type IS '보안수준/민감정보 구분';
    COMMENT ON COLUMN public.tb_scm_rule_set_audit.group IS 'compliance 종류';
    COMMENT ON COLUMN public.tb_scm_rule_set_audit.compliance_id IS 'compliance 세부 종류';
    COMMENT ON COLUMN public.tb_scm_rule_set_audit.parent_audit_id IS '부모 policy id';
       COMMENT ON COLUMN public.tb_scm_rule_set_audit.audit_id IS 'policy id';
    COMMENT ON COLUMN public.tb_scm_rule_set_audit.ablescan IS '노출 여부';
    COMMENT ON COLUMN public.tb_scm_rule_set_audit.title IS '이름';
    COMMENT ON COLUMN public.tb_scm_rule_set_audit.description IS '설명';
       COMMENT ON COLUMN public.tb_scm_rule_set_audit.remediation IS '개선 설명';
       COMMENT ON COLUMN public.tb_scm_rule_set_audit.score IS 'score';
      COMMENT ON COLUMN public.tb_scm_rule_set_audit.level IS 'level';
    COMMENT ON COLUMN public.tb_scm_rule_set_audit.pass_count IS '통계(안전 건수)';
      COMMENT ON COLUMN public.tb_scm_rule_set_audit.fail_count IS '통계(취약 건수)';
    COMMENT ON COLUMN public.tb_scm_rule_set_audit.error_count IS '통계(Unknown 건수)';
    COMMENT ON COLUMN public.tb_scm_rule_set_audit.created_time IS '생성일시';
    COMMENT ON COLUMN public.tb_scm_rule_set_audit.modified_time IS '수정일시';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_scm_rule_set_audit' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_scm_rule_set_audit ADD CONSTRAINT tb_scm_rule_set_audit_pk PRIMARY KEY ("type","group",compliance_id,audit_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_scm_rule_set_audit_standard';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_scm_rule_set_audit_standard ();
    COMMENT ON TABLE public.tb_scm_rule_set_audit_standard IS 'scm rule set audit standard 정보';
       
    ALTER TABLE IF EXISTS tb_scm_rule_set_audit_standard ADD COLUMN IF NOT EXISTS audit_id text;
    ALTER TABLE IF EXISTS tb_scm_rule_set_audit_standard ADD COLUMN IF NOT EXISTS standard_id text;
    ALTER TABLE IF EXISTS tb_scm_rule_set_audit_standard ADD COLUMN IF NOT EXISTS "index" text;
    ALTER TABLE IF EXISTS tb_scm_rule_set_audit_standard ADD COLUMN IF NOT EXISTS created_time timestamp;
    ALTER TABLE IF EXISTS tb_scm_rule_set_audit_standard ADD COLUMN IF NOT EXISTS modified_time timestamp;
       
       COMMENT ON COLUMN public.tb_scm_rule_set_audit_standard.audit_id IS 'policy id';
    COMMENT ON COLUMN public.tb_scm_rule_set_audit_standard.standard_id IS '컴플라이언스 표준';
    COMMENT ON COLUMN public.tb_scm_rule_set_audit_standard.index IS '컴플라이언스 항목 색인';
    COMMENT ON COLUMN public.tb_scm_rule_set_audit_standard.created_time IS '생성일시';
    COMMENT ON COLUMN public.tb_scm_rule_set_audit_standard.modified_time IS '수정일시';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_scm_rule_set_audit_standard' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_scm_rule_set_audit_standard ADD CONSTRAINT tb_scm_rule_set_audit_standard_pk PRIMARY KEY (audit_id,standard_id,"index");
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_scm_secret_scan_result_failed_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_scm_secret_scan_result_failed_timeline ();
    COMMENT ON TABLE public.tb_scm_secret_scan_result_failed_timeline IS 'SCM 민감 정보 취약 결과 타임라인';

    ALTER TABLE IF EXISTS tb_scm_secret_scan_result_failed_timeline ADD COLUMN IF NOT EXISTS reg_date char(8);
    ALTER TABLE IF EXISTS tb_scm_secret_scan_result_failed_timeline ADD COLUMN IF NOT EXISTS hour char(2);
    ALTER TABLE IF EXISTS tb_scm_secret_scan_result_failed_timeline ADD COLUMN IF NOT EXISTS node_id int8;
    ALTER TABLE IF EXISTS tb_scm_secret_scan_result_failed_timeline ADD COLUMN IF NOT EXISTS compliance_policy_id text;
    ALTER TABLE IF EXISTS tb_scm_secret_scan_result_failed_timeline ADD COLUMN IF NOT EXISTS detect_count int4;
    ALTER TABLE IF EXISTS tb_scm_secret_scan_result_failed_timeline ADD COLUMN IF NOT EXISTS created_time timestamp DEFAULT CURRENT_TIMESTAMP;
    ALTER TABLE IF EXISTS tb_scm_secret_scan_result_failed_timeline ADD COLUMN IF NOT EXISTS last_modified_time timestamp DEFAULT CURRENT_TIMESTAMP;

    COMMENT ON COLUMN public.tb_scm_secret_scan_result_failed_timeline.reg_date IS '등록 일시(yyyymmdd)';
    COMMENT ON COLUMN public.tb_scm_secret_scan_result_failed_timeline.hour IS '등록 시간(hh)';
    COMMENT ON COLUMN public.tb_scm_secret_scan_result_failed_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN public.tb_scm_secret_scan_result_failed_timeline.compliance_policy_id IS 'compliance policy id';
    COMMENT ON COLUMN public.tb_scm_secret_scan_result_failed_timeline.detect_count IS '탐지 횟수';
    COMMENT ON COLUMN public.tb_scm_secret_scan_result_failed_timeline.created_time IS '생성일시';
    COMMENT ON COLUMN public.tb_scm_secret_scan_result_failed_timeline.last_modified_time IS '수정일시';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_scm_secret_scan_result_failed_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_scm_secret_scan_result_failed_timeline ADD CONSTRAINT tb_scm_secret_scan_result_failed_timeline_pk PRIMARY KEY (reg_date, hour, node_id, compliance_policy_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_policy_scm_rule_set';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_policy_scm_rule_set();
    COMMENT ON TABLE public.tb_policy_scm_rule_set IS '정책별 Scm rule set 정보';

    ALTER TABLE IF EXISTS tb_policy_scm_rule_set ADD COLUMN IF NOT EXISTS policy_id int8;
    ALTER TABLE IF EXISTS tb_policy_scm_rule_set ADD COLUMN IF NOT EXISTS audit_id text;
    ALTER TABLE IF EXISTS tb_policy_scm_rule_set ADD COLUMN IF NOT EXISTS created_time timestamp;
    
    COMMENT ON COLUMN public.tb_policy_scm_rule_set.policy_id IS '정책 아이디';
    COMMENT ON COLUMN public.tb_policy_scm_rule_set.audit_id IS 'audit 아이디';
    COMMENT ON COLUMN public.tb_policy_scm_rule_set.created_time IS '생성일시';
    
    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_policy_scm_rule_set' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_policy_scm_rule_set ADD CONSTRAINT tb_policy_scm_rule_set_pkey PRIMARY KEY (policy_id, audit_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_scm_rule_set_info_userdefined';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_scm_rule_set_info_userdefined ();
    COMMENT ON TABLE public.tb_scm_rule_set_info_userdefined IS 'scm rule set 사용자 정의 정보';
       
       ALTER TABLE IF EXISTS tb_scm_rule_set_info_userdefined ADD COLUMN IF NOT EXISTS rule_id text NOT NULL;
    ALTER TABLE IF EXISTS tb_scm_rule_set_info_userdefined ADD COLUMN IF NOT EXISTS ablescan boolean DEFAULT TRUE;
    ALTER TABLE IF EXISTS tb_scm_rule_set_info_userdefined ADD COLUMN IF NOT EXISTS "type" text NOT NULL;
    ALTER TABLE IF EXISTS tb_scm_rule_set_info_userdefined ADD COLUMN IF NOT EXISTS "group" text NOT NULL;
    ALTER TABLE IF EXISTS tb_scm_rule_set_info_userdefined ADD COLUMN IF NOT EXISTS target_type text NOT NULL;
    ALTER TABLE IF EXISTS tb_scm_rule_set_info_userdefined ADD COLUMN IF NOT EXISTS target_os text NOT NULL;
    ALTER TABLE IF EXISTS tb_scm_rule_set_info_userdefined ADD COLUMN IF NOT EXISTS "name" text;
    ALTER TABLE IF EXISTS tb_scm_rule_set_info_userdefined ADD COLUMN IF NOT EXISTS "description" text;
    ALTER TABLE IF EXISTS tb_scm_rule_set_info_userdefined ADD COLUMN IF NOT EXISTS rule_content text NOT NULL;
    ALTER TABLE IF EXISTS tb_scm_rule_set_info_userdefined ADD COLUMN IF NOT EXISTS pass_count integer DEFAULT 0;
    ALTER TABLE IF EXISTS tb_scm_rule_set_info_userdefined ADD COLUMN IF NOT EXISTS fail_count integer DEFAULT 0;
    ALTER TABLE IF EXISTS tb_scm_rule_set_info_userdefined ADD COLUMN IF NOT EXISTS error_count integer DEFAULT 0;
    ALTER TABLE IF EXISTS tb_scm_rule_set_info_userdefined ADD COLUMN IF NOT EXISTS created_time timestamp DEFAULT CURRENT_TIMESTAMP;
    ALTER TABLE IF EXISTS tb_scm_rule_set_info_userdefined ADD COLUMN IF NOT EXISTS modified_time timestamp;
       
       COMMENT ON COLUMN public.tb_scm_rule_set_info_userdefined.rule_id IS '규칙 아이디';
    COMMENT ON COLUMN public.tb_scm_rule_set_info_userdefined.ablescan IS '사용 가능 여부';
    COMMENT ON COLUMN public.tb_scm_rule_set_info_userdefined.type IS '보안수준/민감정보 구분';
    COMMENT ON COLUMN public.tb_scm_rule_set_info_userdefined.group IS 'compliance 종류';
    COMMENT ON COLUMN public.tb_scm_rule_set_info_userdefined.target_type IS '지원 운영체제';
    COMMENT ON COLUMN public.tb_scm_rule_set_info_userdefined.target_os IS '지원 운영체제 상세 정보';
    COMMENT ON COLUMN public.tb_scm_rule_set_info_userdefined.name IS '이름';
    COMMENT ON COLUMN public.tb_scm_rule_set_info_userdefined.description IS '설명';
    COMMENT ON COLUMN public.tb_scm_rule_set_info_userdefined.rule_content IS '상세 규칙';
    COMMENT ON COLUMN public.tb_scm_rule_set_info_userdefined.pass_count IS '안전 건수';
    COMMENT ON COLUMN public.tb_scm_rule_set_info_userdefined.fail_count IS '취약 건수';
    COMMENT ON COLUMN public.tb_scm_rule_set_info_userdefined.error_count IS 'Unknown 건수';
    COMMENT ON COLUMN public.tb_scm_rule_set_info_userdefined.created_time IS '생성일시';
    COMMENT ON COLUMN public.tb_scm_rule_set_info_userdefined.modified_time IS '수정일시';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_scm_rule_set_info_userdefined' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_scm_rule_set_info_userdefined ADD CONSTRAINT tb_scm_rule_set_info_userdefined_pk PRIMARY KEY (rule_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_scm_scan_result_node_last';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_scm_scan_result_node_last ();
    COMMENT ON TABLE public.tb_scm_scan_result_node_last IS '에이전트별 마지막 SCM 스캔 결과 상세 정보';

    ALTER TABLE IF EXISTS tb_scm_scan_result_node_last ADD COLUMN IF NOT EXISTS node_id bigint;
       ALTER TABLE IF EXISTS tb_scm_scan_result_node_last ADD COLUMN IF NOT EXISTS last_scan_id bigint;
    ALTER TABLE IF EXISTS tb_scm_scan_result_node_last ADD COLUMN IF NOT EXISTS category text NOT NULL;
    ALTER TABLE IF EXISTS tb_scm_scan_result_node_last ADD COLUMN IF NOT EXISTS "type" text NOT NULL;
       ALTER TABLE IF EXISTS tb_scm_scan_result_node_last ADD COLUMN IF NOT EXISTS compliance_policy_id text NOT NULL;
       ALTER TABLE IF EXISTS tb_scm_scan_result_node_last ADD COLUMN IF NOT EXISTS result text NOT NULL;
       ALTER TABLE IF EXISTS tb_scm_scan_result_node_last ADD COLUMN IF NOT EXISTS error_reason text;
       ALTER TABLE IF EXISTS tb_scm_scan_result_node_last ADD COLUMN IF NOT EXISTS created_time timestamp DEFAULT CURRENT_TIMESTAMP;
    ALTER TABLE IF EXISTS tb_scm_scan_result_node_last ADD COLUMN IF NOT EXISTS modified_time timestamp;

    COMMENT ON COLUMN public.tb_scm_scan_result_node_last.node_id IS '에이전트아이디';
       COMMENT ON COLUMN public.tb_scm_scan_result_node_last.last_scan_id IS '마지막 스캔 결과 정보 아이디';
    COMMENT ON COLUMN public.tb_scm_scan_result_node_last.category IS '정보 구분(COMPLIANCE/SECRET)';
    COMMENT ON COLUMN public.tb_scm_scan_result_node_last.type IS '기본/사용자정의 구분(PREDEFINED/USERDEFINED)';
    COMMENT ON COLUMN public.tb_scm_scan_result_node_last.compliance_policy_id IS 'compliance policy id';
    COMMENT ON COLUMN public.tb_scm_scan_result_node_last.result IS '스캔 결과';
    COMMENT ON COLUMN public.tb_scm_scan_result_node_last.error_reason IS '스캔 결과 error시 reason';
       COMMENT ON COLUMN public.tb_scm_scan_result_node_last.created_time IS '생성일시';
    COMMENT ON COLUMN public.tb_scm_scan_result_node_last.modified_time IS '수정일시';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_scm_scan_result_node_last' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_scm_scan_result_node_last ADD CONSTRAINT tb_scm_scan_result_node_last_pk PRIMARY KEY (node_id,category,"type",compliance_policy_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_upload_file_status';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_upload_file_status();
    COMMENT ON TABLE tb_upload_file_status IS '업로드 파일 처리 상태';
   
    ALTER TABLE IF EXISTS tb_upload_file_status ADD COLUMN IF NOT EXISTS file_type text NOT NULL;
    ALTER TABLE IF EXISTS tb_upload_file_status ADD COLUMN IF NOT EXISTS upload_id text NOT NULL;
    ALTER TABLE IF EXISTS tb_upload_file_status ADD COLUMN IF NOT EXISTS status text NOT NULL;
    ALTER TABLE IF EXISTS tb_upload_file_status ADD COLUMN IF NOT EXISTS admin_id text;
    ALTER TABLE IF EXISTS tb_upload_file_status ADD COLUMN IF NOT EXISTS created_time TIMESTAMP DEFAULT NOW();
    ALTER TABLE IF EXISTS tb_upload_file_status ADD COLUMN IF NOT EXISTS modified_time TIMESTAMP;
    
    COMMENT ON COLUMN tb_upload_file_status.file_type IS '업로드 파일 타입';
    COMMENT ON COLUMN tb_upload_file_status.upload_id IS '업로드 식별자';
    COMMENT ON COLUMN tb_upload_file_status.status IS '파일 처리 상태';
    COMMENT ON COLUMN tb_upload_file_status.admin_id IS '파일 업로드한 관리자 아이디';
    COMMENT ON COLUMN tb_upload_file_status.created_time IS '생성일시';
    COMMENT ON COLUMN tb_upload_file_status.modified_time IS '수정일시';
    
    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_upload_file_status' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_upload_file_status ADD CONSTRAINT tb_upload_file_status_pkey PRIMARY KEY (file_type);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_product_patch_base';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_product_patch_base();
    COMMENT ON TABLE tb_product_patch_base IS '패치 제품 목록 및 배포 설정';
   
    ALTER TABLE IF EXISTS tb_product_patch_base ADD COLUMN IF NOT EXISTS product_id en_product_id_type NOT NULL;
    ALTER TABLE IF EXISTS tb_product_patch_base ADD COLUMN IF NOT EXISTS platform_type en_platform_type NOT NULL;
    ALTER TABLE IF EXISTS tb_product_patch_base ADD COLUMN IF NOT EXISTS product_code text;
    ALTER TABLE IF EXISTS tb_product_patch_base ADD COLUMN IF NOT EXISTS available boolean DEFAULT TRUE;
    ALTER TABLE IF EXISTS tb_product_patch_base ADD COLUMN IF NOT EXISTS deploy boolean DEFAULT TRUE;
   
    COMMENT ON COLUMN tb_product_patch_base.product_id IS '제품 아이디';
    COMMENT ON COLUMN tb_product_patch_base.platform_type IS '플랫폼 타입';
    COMMENT ON COLUMN tb_product_patch_base.product_code IS '업데이트 제품 코드';
    COMMENT ON COLUMN tb_product_patch_base.available IS '업데이트 활성화 여부';
    COMMENT ON COLUMN tb_product_patch_base.deploy IS '배포 활성화 여부';
    
    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_product_patch_base' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_product_patch_base ADD CONSTRAINT tb_product_patch_base_pkey PRIMARY KEY (product_id, platform_type, product_code);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_product_patch_info';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_product_patch_info();
    COMMENT ON TABLE tb_product_patch_info IS '제품별 패치 정보';
   
    ALTER TABLE IF EXISTS tb_product_patch_info ADD COLUMN IF NOT EXISTS product_id en_product_id_type NOT NULL;
    ALTER TABLE IF EXISTS tb_product_patch_info ADD COLUMN IF NOT EXISTS platform_type en_platform_type NOT NULL;
    ALTER TABLE IF EXISTS tb_product_patch_info ADD COLUMN IF NOT EXISTS product_code text;
    ALTER TABLE IF EXISTS tb_product_patch_info ADD COLUMN IF NOT EXISTS server_id bigint;
    ALTER TABLE IF EXISTS tb_product_patch_info ADD COLUMN IF NOT EXISTS oes_product_pkg_id bigint;
    ALTER TABLE IF EXISTS tb_product_patch_info ADD COLUMN IF NOT EXISTS oes_build_date text;
    ALTER TABLE IF EXISTS tb_product_patch_info ADD COLUMN IF NOT EXISTS oes_version text;
    ALTER TABLE IF EXISTS tb_product_patch_info ADD COLUMN IF NOT EXISTS oes_modified_time TIMESTAMP;
    ALTER TABLE IF EXISTS tb_product_patch_info ADD COLUMN IF NOT EXISTS ses_product_pkg_id bigint;
    ALTER TABLE IF EXISTS tb_product_patch_info ADD COLUMN IF NOT EXISTS ses_build_date text;
    ALTER TABLE IF EXISTS tb_product_patch_info ADD COLUMN IF NOT EXISTS ses_version text;
    ALTER TABLE IF EXISTS tb_product_patch_info ADD COLUMN IF NOT EXISTS ses_modified_time TIMESTAMP;
    
    COMMENT ON COLUMN tb_product_patch_info.product_id IS '제품 아이디';
    COMMENT ON COLUMN tb_product_patch_info.platform_type IS '플랫폼 타입';
    COMMENT ON COLUMN tb_product_patch_info.product_code IS '업데이트 제품 코드';
    COMMENT ON COLUMN tb_product_patch_info.server_id IS '서버 아이디';
    COMMENT ON COLUMN tb_product_patch_info.oes_product_pkg_id IS 'OES 패키지 아이디';
    COMMENT ON COLUMN tb_product_patch_info.oes_build_date IS 'OES내 제품 빌드 정보';
    COMMENT ON COLUMN tb_product_patch_info.oes_version IS 'OES내 패치 버전 정보';
    COMMENT ON COLUMN tb_product_patch_info.oes_modified_time IS 'OES 패치 정보 수정일시';
    COMMENT ON COLUMN tb_product_patch_info.ses_product_pkg_id IS 'SES 패키지 아이디';
    COMMENT ON COLUMN tb_product_patch_info.ses_build_date IS 'SES내 제품 빌드 정보';
    COMMENT ON COLUMN tb_product_patch_info.ses_version IS 'SES내 패치 버전 정보';
    COMMENT ON COLUMN tb_product_patch_info.ses_modified_time IS 'SES 패치 정보 수정일시';
    
    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_product_patch_info' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_product_patch_info ADD CONSTRAINT tb_product_patch_info_pkey PRIMARY KEY (product_id, platform_type, product_code, server_id);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_hips_fw_block_ip_rule';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_fw_block_ip_rule ();
    COMMENT ON TABLE public.tb_hips_fw_block_ip_rule IS 'HIPS FW 차단 IP 규칙 테이블';

    ALTER TABLE IF EXISTS tb_hips_fw_block_ip_rule ADD COLUMN IF NOT EXISTS rule_id bigserial;
    ALTER TABLE IF EXISTS tb_hips_fw_block_ip_rule ADD COLUMN IF NOT EXISTS rule_name text;
    ALTER TABLE IF EXISTS tb_hips_fw_block_ip_rule ADD COLUMN IF NOT EXISTS description text;
    ALTER TABLE IF EXISTS tb_hips_fw_block_ip_rule ADD COLUMN IF NOT EXISTS action en_block_ip_rule_action;
    ALTER TABLE IF EXISTS tb_hips_fw_block_ip_rule ADD COLUMN IF NOT EXISTS auto_expiration boolean DEFAULT false;
    ALTER TABLE IF EXISTS tb_hips_fw_block_ip_rule ADD COLUMN IF NOT EXISTS expiration_time timestamp;
    ALTER TABLE IF EXISTS tb_hips_fw_block_ip_rule ADD COLUMN IF NOT EXISTS auto_remove boolean DEFAULT false;
    ALTER TABLE IF EXISTS tb_hips_fw_block_ip_rule ADD COLUMN IF NOT EXISTS admin_id text;
    ALTER TABLE IF EXISTS tb_hips_fw_block_ip_rule ADD COLUMN IF NOT EXISTS is_use boolean;
    ALTER TABLE IF EXISTS tb_hips_fw_block_ip_rule ADD COLUMN IF NOT EXISTS expiration_status boolean DEFAULT false;
    ALTER TABLE IF EXISTS tb_hips_fw_block_ip_rule ADD COLUMN IF NOT EXISTS is_removed boolean DEFAULT false;
    ALTER TABLE IF EXISTS tb_hips_fw_block_ip_rule ADD COLUMN IF NOT EXISTS created_time timestamp;
    ALTER TABLE IF EXISTS tb_hips_fw_block_ip_rule ADD COLUMN IF NOT EXISTS modified_time timestamp;
    ALTER TABLE IF EXISTS tb_hips_fw_block_ip_rule ADD COLUMN IF NOT EXISTS is_atip_block_ip_rule boolean DEFAULT false;

    COMMENT ON COLUMN public.tb_hips_fw_block_ip_rule.rule_id IS '규칙 ID';
    COMMENT ON COLUMN public.tb_hips_fw_block_ip_rule.rule_name IS '규칙 이름';
    COMMENT ON COLUMN public.tb_hips_fw_block_ip_rule.description IS '설명';
    COMMENT ON COLUMN public.tb_hips_fw_block_ip_rule.action IS '대응 방법(탐지:detect; 차단:block)';
    COMMENT ON COLUMN public.tb_hips_fw_block_ip_rule.auto_expiration IS '자동 만료 여부';
    COMMENT ON COLUMN public.tb_hips_fw_block_ip_rule.expiration_time IS '만료일';
    COMMENT ON COLUMN public.tb_hips_fw_block_ip_rule.auto_remove IS '만료 시 자동 삭제 여부';
    COMMENT ON COLUMN public.tb_hips_fw_block_ip_rule.admin_id IS '수정 관리자 ID';
    COMMENT ON COLUMN public.tb_hips_fw_block_ip_rule.is_use IS '사용 여부';
    COMMENT ON COLUMN public.tb_hips_fw_block_ip_rule.expiration_status IS '만료 여부';
    COMMENT ON COLUMN public.tb_hips_fw_block_ip_rule.is_removed IS '삭제 여부';
    COMMENT ON COLUMN public.tb_hips_fw_block_ip_rule.created_time IS '생성 날짜';
    COMMENT ON COLUMN public.tb_hips_fw_block_ip_rule.modified_time IS '수정 날짜';
    COMMENT ON COLUMN public.tb_hips_fw_block_ip_rule.is_atip_block_ip_rule IS 'ATIP 차단 IP 규칙 여부';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_fw_block_ip_rule' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_hips_fw_block_ip_rule ADD CONSTRAINT tb_hips_fw_block_ip_rule_pk PRIMARY KEY (rule_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_hips_fw_block_ip_rule_detail';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_fw_block_ip_rule_detail ();
    COMMENT ON TABLE public.tb_hips_fw_block_ip_rule_detail IS ' HIPS FW 차단 IP 규칙 상세 테이블';

    ALTER TABLE IF EXISTS tb_hips_fw_block_ip_rule_detail ADD COLUMN IF NOT EXISTS rule_id int8 NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_fw_block_ip_rule_detail ADD COLUMN IF NOT EXISTS ruleset json;
    ALTER TABLE IF EXISTS tb_hips_fw_block_ip_rule_detail ADD COLUMN IF NOT EXISTS modified_time timestamp;

    COMMENT ON COLUMN public.tb_hips_fw_block_ip_rule_detail.rule_id IS '규칙 ID';
    COMMENT ON COLUMN public.tb_hips_fw_block_ip_rule_detail.ruleset IS '차단 IP(IP;IP Range;CIDR)/탐지 방향(in,out,all)';
    COMMENT ON COLUMN public.tb_hips_fw_block_ip_rule_detail.modified_time IS '수정 날짜';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_fw_block_ip_rule_detail' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_hips_fw_block_ip_rule_detail ADD CONSTRAINT tb_hips_fw_block_ip_rule_detail_pk PRIMARY KEY (rule_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_policy_hips_fw_block_ip_rule';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_policy_hips_fw_block_ip_rule();
    COMMENT ON TABLE tb_policy_hips_fw_block_ip_rule IS '정책 HIPS FW 차단 IP 규칙 연관 테이블';

    ALTER TABLE IF EXISTS tb_policy_hips_fw_block_ip_rule ADD COLUMN IF NOT EXISTS policy_id int8 NOT NULL;
    ALTER TABLE IF EXISTS tb_policy_hips_fw_block_ip_rule ADD COLUMN IF NOT EXISTS rule_id int8 NOT NULL;

    COMMENT ON COLUMN tb_policy_hips_fw_block_ip_rule.policy_id IS '정책 ID';
    COMMENT ON COLUMN tb_policy_hips_fw_block_ip_rule.rule_id IS 'HIPS FW 차단 IP 규칙 ID';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_policy_hips_fw_block_ip_rule' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS tb_policy_hips_fw_block_ip_rule ADD CONSTRAINT tb_policy_hips_fw_block_ip_rule_pk PRIMARY KEY (policy_id, rule_id);
    END IF;
END $$ LANGUAGE 'plpgsql'; 

------------------------------------------------------------------------------------------
select '## tb_policy_hips_fw_block_ip_rule_apply_option';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_policy_hips_fw_block_ip_rule_apply_option();
    COMMENT ON TABLE tb_policy_hips_fw_block_ip_rule_apply_option IS '정책 HIPS FW 차단 IP 규칙/적용 규칙 옵션 연관 테이블';

    ALTER TABLE IF EXISTS tb_policy_hips_fw_block_ip_rule_apply_option ADD COLUMN IF NOT EXISTS policy_id int8 NOT NULL;
    ALTER TABLE IF EXISTS tb_policy_hips_fw_block_ip_rule_apply_option ADD COLUMN IF NOT EXISTS all_rule_apply boolean DEFAULT false;
    ALTER TABLE IF EXISTS tb_policy_hips_fw_block_ip_rule_apply_option ADD COLUMN IF NOT EXISTS enable boolean DEFAULT false;

    COMMENT ON COLUMN tb_policy_hips_fw_block_ip_rule_apply_option.policy_id IS '정책 ID';
    COMMENT ON COLUMN tb_policy_hips_fw_block_ip_rule_apply_option.all_rule_apply IS '모든 규칙 사용 여부';
    COMMENT ON COLUMN tb_policy_hips_fw_block_ip_rule_apply_option.enable IS '차단 IP 규칙 사용 여부';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_policy_hips_fw_block_ip_rule_apply_option' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS tb_policy_hips_fw_block_ip_rule_apply_option ADD CONSTRAINT tb_policy_hips_fw_block_ip_rule_apply_option_pk PRIMARY KEY (policy_id);
    END IF;
END $$ LANGUAGE 'plpgsql'; 

------------------------------------------------------------------------------------------
SELECT '## tb_external_asset_list';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_external_asset_list();
    COMMENT ON TABLE tb_external_asset_list IS '자산 연동 정보 리스트 테이블';

    ALTER TABLE IF EXISTS tb_external_asset_list ADD COLUMN IF NOT EXISTS ip text NULL;
    ALTER TABLE IF EXISTS tb_external_asset_list ADD COLUMN IF NOT EXISTS mac text;
    ALTER TABLE IF EXISTS tb_external_asset_list ADD COLUMN IF NOT EXISTS hostname text;
    ALTER TABLE IF EXISTS tb_external_asset_list ADD COLUMN IF NOT EXISTS connected_ip text;
    ALTER TABLE IF EXISTS tb_external_asset_list ADD COLUMN IF NOT EXISTS department text;
    ALTER TABLE IF EXISTS tb_external_asset_list ADD COLUMN IF NOT EXISTS description text;
    ALTER TABLE IF EXISTS tb_external_asset_list ADD COLUMN IF NOT EXISTS name text;
    ALTER TABLE IF EXISTS tb_external_asset_list ADD COLUMN IF NOT EXISTS phone text;
    ALTER TABLE IF EXISTS tb_external_asset_list ADD COLUMN IF NOT EXISTS email text;
    ALTER TABLE IF EXISTS tb_external_asset_list ADD COLUMN IF NOT EXISTS created_time timestamp DEFAULT NOW();

    COMMENT ON COLUMN tb_external_asset_list.ip IS '기준 IP';
    COMMENT ON COLUMN tb_external_asset_list.mac IS '기준 MAC';
    COMMENT ON COLUMN tb_external_asset_list.hostname IS '기준 hostname';
    COMMENT ON COLUMN tb_external_asset_list.connected_ip IS '에이전트 연결 아이디';
    COMMENT ON COLUMN tb_external_asset_list.department IS '부서 정보';
    COMMENT ON COLUMN tb_external_asset_list.description IS '설명';
    COMMENT ON COLUMN tb_external_asset_list.name IS '이름';
    COMMENT ON COLUMN tb_external_asset_list.phone IS '전화번호';
    COMMENT ON COLUMN tb_external_asset_list.email IS '이메일';
    COMMENT ON COLUMN tb_external_asset_list.created_time IS '생성일시';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_external_asset_list' and constraint_name = 'tb_external_asset_list_unique_key' AND constraint_type = 'UNIQUE') THEN
        ALTER TABLE IF EXISTS ONLY tb_external_asset_list ADD CONSTRAINT tb_external_asset_list_unique_key UNIQUE (ip, mac, hostname, connected_ip);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
SELECT '## tb_private_ip_range';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_private_ip_range();
    COMMENT ON TABLE tb_private_ip_range IS '사설 IP 통신 대역';

    ALTER TABLE IF EXISTS tb_private_ip_range ADD COLUMN IF NOT EXISTS range_origin text NOT NULL;
    ALTER TABLE IF EXISTS tb_private_ip_range ADD COLUMN IF NOT EXISTS range_from inet NOT NULL;
    ALTER TABLE IF EXISTS tb_private_ip_range ADD COLUMN IF NOT EXISTS range_to inet NOT NULL;
    ALTER TABLE IF EXISTS tb_private_ip_range ADD COLUMN IF NOT EXISTS description text NULL;
    ALTER TABLE IF EXISTS tb_private_ip_range ADD COLUMN IF NOT EXISTS created_time TIMESTAMP DEFAULT NOW();
   
    COMMENT ON COLUMN tb_private_ip_range.range_origin IS '입력된 IP 원본';
    COMMENT ON COLUMN tb_private_ip_range.range_from IS 'IP 범위 시작';
    COMMENT ON COLUMN tb_private_ip_range.range_to IS 'IP 범위 끝';
    COMMENT ON COLUMN tb_private_ip_range.description IS '설명';
    COMMENT ON COLUMN tb_private_ip_range.created_time IS '생성 시간';
  
    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_private_ip_range' and constraint_name = 'tb_private_ip_range_unique_key' AND constraint_type = 'UNIQUE') THEN
        ALTER TABLE IF EXISTS ONLY tb_private_ip_range ADD CONSTRAINT tb_private_ip_range_unique_key UNIQUE (range_origin);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
SELECT '## tb_hips_ssl_inspection_target';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_hips_ssl_inspection_target();
    COMMENT ON TABLE tb_hips_ssl_inspection_target IS 'HIPS SSL 감시 대상';

    ALTER TABLE IF EXISTS tb_hips_ssl_inspection_target ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_hips_ssl_inspection_target ADD COLUMN IF NOT EXISTS ip text NULL;
    ALTER TABLE IF EXISTS tb_hips_ssl_inspection_target ADD COLUMN IF NOT EXISTS port text NULL;
    ALTER TABLE IF EXISTS tb_hips_ssl_inspection_target ADD COLUMN IF NOT EXISTS certfile text NULL;

    COMMENT ON COLUMN tb_hips_ssl_inspection_target.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_hips_ssl_inspection_target.ip IS '감시 대상 IP';
    COMMENT ON COLUMN tb_hips_ssl_inspection_target.port IS '감시 대상 port';
    COMMENT ON COLUMN tb_hips_ssl_inspection_target.certfile IS '인증서 파일 위치';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_hips_ssl_inspection_target' and constraint_name = 'tb_hips_ssl_inspection_target_unique_key' AND constraint_type = 'UNIQUE') THEN
        ALTER TABLE IF EXISTS ONLY tb_hips_ssl_inspection_target ADD CONSTRAINT tb_hips_ssl_inspection_target_unique_key UNIQUE (node_id, ip, port, certfile);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_cnapp_event_log_obj_id';
DO $$
    BEGIN
        CREATE TABLE IF NOT EXISTS tb_cnapp_event_log_obj_id();
        COMMENT ON TABLE tb_cnapp_event_log_obj_id IS 'CNAPP 이벤트 로그 obj_id 관리';
    
        ALTER TABLE IF EXISTS tb_cnapp_event_log_obj_id ADD COLUMN IF NOT EXISTS obj_id text;
        ALTER TABLE IF EXISTS tb_cnapp_event_log_obj_id ADD COLUMN IF NOT EXISTS row_number int8;
    
        COMMENT ON COLUMN tb_cnapp_event_log_obj_id.obj_id IS 'MongoDB object ID';
        COMMENT ON COLUMN tb_cnapp_event_log_obj_id.row_number IS '순서';
    
        IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_cnapp_event_log_obj_id' AND constraint_type = 'PRIMARY KEY') THEN
            ALTER TABLE tb_cnapp_event_log_obj_id ADD CONSTRAINT tb_cnapp_event_log_obj_id_pkey PRIMARY KEY (obj_id);
        END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_cnapp_vulnerability_scan_event_log_obj_id';
DO $$
    BEGIN
        CREATE TABLE IF NOT EXISTS tb_cnapp_vulnerability_scan_event_log_obj_id();
        COMMENT ON TABLE tb_cnapp_vulnerability_scan_event_log_obj_id IS 'CNAPP 이미지 스캔 취약점 이벤트 로그 obj_id 관리';
    
        ALTER TABLE IF EXISTS tb_cnapp_vulnerability_scan_event_log_obj_id ADD COLUMN IF NOT EXISTS obj_id text;
        ALTER TABLE IF EXISTS tb_cnapp_vulnerability_scan_event_log_obj_id ADD COLUMN IF NOT EXISTS row_number int8;
    
        COMMENT ON COLUMN tb_cnapp_vulnerability_scan_event_log_obj_id.obj_id IS 'MongoDB object ID';
        COMMENT ON COLUMN tb_cnapp_vulnerability_scan_event_log_obj_id.row_number IS '순서';
    
        IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_cnapp_vulnerability_scan_event_log_obj_id' AND constraint_type = 'PRIMARY KEY') THEN
            ALTER TABLE tb_cnapp_vulnerability_scan_event_log_obj_id ADD CONSTRAINT tb_cnapp_vulnerability_scan_event_log_obj_id_pkey PRIMARY KEY (obj_id);
        END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_cnapp_malware_scan_event_log_obj_id';
DO $$
    BEGIN
        CREATE TABLE IF NOT EXISTS tb_cnapp_malware_scan_event_log_obj_id();
        COMMENT ON TABLE tb_cnapp_malware_scan_event_log_obj_id IS 'CNAPP 이미지 스캔 malware 이벤트 로그 obj_id 관리';
    
        ALTER TABLE IF EXISTS tb_cnapp_malware_scan_event_log_obj_id ADD COLUMN IF NOT EXISTS obj_id text;
        ALTER TABLE IF EXISTS tb_cnapp_malware_scan_event_log_obj_id ADD COLUMN IF NOT EXISTS row_number int8;
    
        COMMENT ON COLUMN tb_cnapp_malware_scan_event_log_obj_id.obj_id IS 'MongoDB object ID';
        COMMENT ON COLUMN tb_cnapp_malware_scan_event_log_obj_id.row_number IS '순서';
    
        IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_cnapp_malware_scan_event_log_obj_id' AND constraint_type = 'PRIMARY KEY') THEN
            ALTER TABLE tb_cnapp_malware_scan_event_log_obj_id ADD CONSTRAINT tb_cnapp_malware_scan_event_log_obj_id_pkey PRIMARY KEY (obj_id);
        END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_cloud_sync_status';
DO $$
    BEGIN
        CREATE TABLE IF NOT EXISTS tb_cloud_sync_status();
        COMMENT ON TABLE tb_cloud_sync_status IS '클라우드 동기화 진행 상태';
    
        ALTER TABLE IF EXISTS tb_cloud_sync_status ADD COLUMN IF NOT EXISTS cloud_provider_type en_machine_type;
        ALTER TABLE IF EXISTS tb_cloud_sync_status ADD COLUMN IF NOT EXISTS sync_status boolean;
    
        COMMENT ON COLUMN tb_cloud_sync_status.cloud_provider_type IS '클라우드 종류';
        COMMENT ON COLUMN tb_cloud_sync_status.sync_status IS '동기화 진행 여부';
    
        IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_cloud_sync_status' AND constraint_type = 'PRIMARY KEY') THEN
            ALTER TABLE tb_cloud_sync_status ADD CONSTRAINT tb_cloud_sync_status_pkey PRIMARY KEY (cloud_provider_type);
        END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_agent_uuid_blacklist';
DO $$
    BEGIN
        CREATE TABLE IF NOT EXISTS tb_agent_uuid_blacklist();
        COMMENT ON TABLE tb_agent_uuid_blacklist IS '에이전트 UUID 블랙리스트';

        ALTER TABLE IF EXISTS tb_agent_uuid_blacklist ADD COLUMN IF NOT EXISTS uuid text UNIQUE;
        ALTER TABLE IF EXISTS tb_agent_uuid_blacklist ADD COLUMN IF NOT EXISTS node_id bigserial NOT NULL;  
        ALTER TABLE IF EXISTS tb_agent_uuid_blacklist ADD COLUMN IF NOT EXISTS machine_type en_machine_type;
        ALTER TABLE IF EXISTS tb_agent_uuid_blacklist ADD COLUMN IF NOT EXISTS used bigint DEFAULT 0;
        ALTER TABLE IF EXISTS tb_agent_uuid_blacklist ADD COLUMN IF NOT EXISTS created_time timestamp DEFAULT NOW();
        ALTER TABLE IF EXISTS tb_agent_uuid_blacklist ADD COLUMN IF NOT EXISTS modified_time timestamp;

        COMMENT ON COLUMN tb_agent_uuid_blacklist.uuid IS 'UUID';
        COMMENT ON COLUMN tb_agent_uuid_blacklist.node_id IS '노드 ID';
        COMMENT ON COLUMN tb_agent_uuid_blacklist.machine_type IS '머신 타입';
        COMMENT ON COLUMN tb_agent_uuid_blacklist.used IS '중복 횟수';
        COMMENT ON COLUMN tb_agent_uuid_blacklist.created_time IS '등록 시각';
        COMMENT ON COLUMN tb_agent_uuid_blacklist.modified_time IS '수정 시각';

        IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_agent_uuid_blacklist' AND constraint_type = 'PRIMARY KEY') THEN
            ALTER TABLE tb_agent_uuid_blacklist ADD CONSTRAINT tb_agent_uuid_blacklist_pkey PRIMARY KEY (uuid);
        END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_meter_hips_signature_count_daily_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_meter_hips_signature_count_daily_timeline () TABLESPACE cpp_olap;
    COMMENT ON TABLE tb_meter_hips_signature_count_daily_timeline IS '일별 에이전트당 HIPS 시그니처 최대 추천/적용 수 타임라인 테이블';

    ALTER TABLE IF EXISTS tb_meter_hips_signature_count_daily_timeline ADD COLUMN IF NOT EXISTS reg_date date;
    ALTER TABLE IF EXISTS tb_meter_hips_signature_count_daily_timeline ADD COLUMN IF NOT EXISTS node_id bigint;
    ALTER TABLE IF EXISTS tb_meter_hips_signature_count_daily_timeline ADD COLUMN IF NOT EXISTS is_hips_enabled boolean;
    ALTER TABLE IF EXISTS tb_meter_hips_signature_count_daily_timeline ADD COLUMN IF NOT EXISTS max_recommended_signature_count integer;
    ALTER TABLE IF EXISTS tb_meter_hips_signature_count_daily_timeline ADD COLUMN IF NOT EXISTS max_applied_signature_count integer;

    COMMENT ON COLUMN tb_meter_hips_signature_count_daily_timeline.reg_date IS '측정 날짜';
    COMMENT ON COLUMN tb_meter_hips_signature_count_daily_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_meter_hips_signature_count_daily_timeline.is_hips_enabled IS 'HIPS 사용 여부';
    COMMENT ON COLUMN tb_meter_hips_signature_count_daily_timeline.max_recommended_signature_count IS '최대 추천 시그니처 수';
    COMMENT ON COLUMN tb_meter_hips_signature_count_daily_timeline.max_applied_signature_count IS '최대 적용 시그니처 수';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_meter_hips_signature_count_daily_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_meter_hips_signature_count_daily_timeline ADD CONSTRAINT tb_meter_hips_signature_count_daily_timeline_pkey PRIMARY KEY (node_id, reg_date);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_meter_product_usage_hourly_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_meter_product_usage_hourly_timeline ();
    COMMENT ON TABLE tb_meter_product_usage_hourly_timeline IS '시간별 제품 사용량 타임라인';

    ALTER TABLE IF EXISTS tb_meter_product_usage_hourly_timeline ADD COLUMN IF NOT EXISTS reg_timestamp timestamptz NOT NULL;
    ALTER TABLE IF EXISTS tb_meter_product_usage_hourly_timeline ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_meter_product_usage_hourly_timeline ADD COLUMN IF NOT EXISTS product_id en_product_id_type NOT NULL;
    ALTER TABLE IF EXISTS tb_meter_product_usage_hourly_timeline ADD COLUMN IF NOT EXISTS modified_time timestamp NOT NULL DEFAULT now();

    COMMENT ON COLUMN tb_meter_product_usage_hourly_timeline.reg_timestamp IS '등록 시간';
    COMMENT ON COLUMN tb_meter_product_usage_hourly_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_meter_product_usage_hourly_timeline.product_id IS '관리 제품 ID';
    COMMENT ON COLUMN tb_meter_product_usage_hourly_timeline.modified_time IS '수정 날짜';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_meter_product_usage_hourly_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_meter_product_usage_hourly_timeline ADD CONSTRAINT tb_meter_product_usage_hourly_timeline_pkey PRIMARY KEY (reg_timestamp, node_id, product_id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_meter_product_license_usage_hourly_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_meter_product_license_usage_hourly_timeline ();
    COMMENT ON TABLE tb_meter_product_license_usage_hourly_timeline IS '시간별 제품 라이선스 사용량 타임라인'; -- 라이선스 2.0 only

    ALTER TABLE IF EXISTS tb_meter_product_license_usage_hourly_timeline ADD COLUMN IF NOT EXISTS measuring_time timestamp NOT NULL DEFAULT (now() AT TIME ZONE 'UTC');
    ALTER TABLE IF EXISTS tb_meter_product_license_usage_hourly_timeline ADD COLUMN IF NOT EXISTS license_no text NOT NULL;
    ALTER TABLE IF EXISTS tb_meter_product_license_usage_hourly_timeline ADD COLUMN IF NOT EXISTS version text NOT NULL;
    ALTER TABLE IF EXISTS tb_meter_product_license_usage_hourly_timeline ADD COLUMN IF NOT EXISTS product_id en_product_id_type NOT NULL;
    ALTER TABLE IF EXISTS tb_meter_product_license_usage_hourly_timeline ADD COLUMN IF NOT EXISTS is_main_license boolean DEFAULT FALSE;
    ALTER TABLE IF EXISTS tb_meter_product_license_usage_hourly_timeline ADD COLUMN IF NOT EXISTS expire_update_status text;
    ALTER TABLE IF EXISTS tb_meter_product_license_usage_hourly_timeline ADD COLUMN IF NOT EXISTS register_time timestamp without time zone;
    ALTER TABLE IF EXISTS tb_meter_product_license_usage_hourly_timeline ADD COLUMN IF NOT EXISTS expire_time timestamp without time zone;
    ALTER TABLE IF EXISTS tb_meter_product_license_usage_hourly_timeline ADD COLUMN IF NOT EXISTS issue_quantity bigint;
    ALTER TABLE IF EXISTS tb_meter_product_license_usage_hourly_timeline ADD COLUMN IF NOT EXISTS used_quantity bigint;
    ALTER TABLE IF EXISTS tb_meter_product_license_usage_hourly_timeline ADD COLUMN IF NOT EXISTS available_quantity bigint;

    COMMENT ON COLUMN public.tb_meter_product_license_usage_hourly_timeline.measuring_time IS '측정 시간'; -- UTC
    COMMENT ON COLUMN public.tb_meter_product_license_usage_hourly_timeline.license_no IS '라이선스 번호';
    COMMENT ON COLUMN public.tb_meter_product_license_usage_hourly_timeline.version IS '라이선스 버전';
    COMMENT ON COLUMN public.tb_meter_product_license_usage_hourly_timeline.product_id IS '제품 ID';
    COMMENT ON COLUMN public.tb_meter_product_license_usage_hourly_timeline.is_main_license IS '대표 라이선스 여부';
    -- 만료일 처리 상태 = 각 모듈에서 라이선스의 인증/갱신 과정의 단계별 상태 기록
    -- READY : 등록, console
    -- UPDATING : 갱신버튼, console
    -- DONE : ambass (license 2.0 only)
    -- FINISH : uppost
    COMMENT ON COLUMN public.tb_meter_product_license_usage_hourly_timeline.expire_update_status IS '만료일 처리 상태';
    COMMENT ON COLUMN public.tb_meter_product_license_usage_hourly_timeline.register_time IS '제품 라이선스 등록일';
    COMMENT ON COLUMN public.tb_meter_product_license_usage_hourly_timeline.expire_time IS '제품 라이선스 만료일';
    COMMENT ON COLUMN public.tb_meter_product_license_usage_hourly_timeline.issue_quantity IS '발급 수량';
    COMMENT ON COLUMN public.tb_meter_product_license_usage_hourly_timeline.used_quantity IS '사용된 수량';
    COMMENT ON COLUMN public.tb_meter_product_license_usage_hourly_timeline.available_quantity IS '잔여 수량';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_meter_product_license_usage_hourly_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_meter_product_license_usage_hourly_timeline ADD CONSTRAINT tb_meter_product_license_usage_hourly_timeline_pkey PRIMARY KEY (measuring_time, license_no, product_id);
    END IF;

END
$$ LANGUAGE 'plpgsql';


------------------------------------------------------------------------------------------
select '## tb_v3_update_hourly_timeline';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_v3_update_hourly_timeline ();
    COMMENT ON TABLE tb_v3_update_hourly_timeline IS '에이전트별 V3 엔진 정보 시간별 타임라인';
    
    ALTER TABLE IF EXISTS tb_v3_update_hourly_timeline ADD COLUMN IF NOT EXISTS node_id bigint NOT NULL;
    ALTER TABLE IF EXISTS tb_v3_update_hourly_timeline ADD COLUMN IF NOT EXISTS reg_date text NOT NULL;
    ALTER TABLE IF EXISTS tb_v3_update_hourly_timeline ADD COLUMN IF NOT EXISTS engine_version text;
    ALTER TABLE IF EXISTS tb_v3_update_hourly_timeline ADD COLUMN IF NOT EXISTS engine_update_past_days int;
    ALTER TABLE IF EXISTS tb_v3_update_hourly_timeline ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;
    
    COMMENT ON COLUMN tb_v3_update_hourly_timeline.node_id IS '노드 ID';
    COMMENT ON COLUMN tb_v3_update_hourly_timeline.reg_date IS '등록 시간';
    COMMENT ON COLUMN tb_v3_update_hourly_timeline.engine_version IS '엔진 버전';
    COMMENT ON COLUMN tb_v3_update_hourly_timeline.engine_update_past_days IS '엔진 업데이트 지난 일수';
    COMMENT ON COLUMN tb_v3_update_hourly_timeline.modified_time IS '수정 시간';
    
    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_v3_update_hourly_timeline' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_v3_update_hourly_timeline ADD CONSTRAINT tb_v3_update_hourly_timeline_pkey PRIMARY KEY (node_id, reg_date);
    END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_cloud_aws_ec2_instance';
DO $$ BEGIN
    CREATE TABLE IF NOT EXISTS tb_cloud_aws_ec2_instance();
    COMMENT ON TABLE tb_cloud_aws_ec2_instance IS '클라우드 인스턴스 통합 정보 (AWS EC2)';

    ALTER TABLE IF EXISTS tb_cloud_aws_ec2_instance ADD COLUMN IF NOT EXISTS container_group_id TEXT NOT NULL;
    ALTER TABLE IF EXISTS tb_cloud_aws_ec2_instance ADD COLUMN IF NOT EXISTS container_id TEXT NOT NULL;
    ALTER TABLE IF EXISTS tb_cloud_aws_ec2_instance ADD COLUMN IF NOT EXISTS image TEXT NOT NULL;
    ALTER TABLE IF EXISTS tb_cloud_aws_ec2_instance ADD COLUMN IF NOT EXISTS image_id TEXT NOT NULL;
    ALTER TABLE IF EXISTS tb_cloud_aws_ec2_instance ADD COLUMN IF NOT EXISTS created_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;
    ALTER TABLE IF EXISTS tb_cloud_aws_ec2_instance ADD COLUMN IF NOT EXISTS modified_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

    ALTER TABLE tb_cloud_aws_ec2_instance ADD CONSTRAINT uq_cloud_aws_ec2_instance_group_container UNIQUE (container_group_id, container_id);

    COMMENT ON COLUMN tb_cloud_aws_ec2_instance.container_group_id IS '컨테이너 그룹 ID';
    COMMENT ON COLUMN tb_cloud_aws_ec2_instance.container_id IS '컨테이너 ID';
    COMMENT ON COLUMN tb_cloud_aws_ec2_instance.image IS '이미지명';
    COMMENT ON COLUMN tb_cloud_aws_ec2_instance.image_id IS '이미지 URL';
    COMMENT ON COLUMN tb_cloud_aws_ec2_instance.created_time IS '생성일시';
    COMMENT ON COLUMN tb_cloud_aws_ec2_instance.modified_time IS '수정일시';
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## tb_cloud_alibaba_ecs_instance';
DO $$ BEGIN
    CREATE TABLE IF NOT EXISTS tb_cloud_alibaba_ecs_instance();
    COMMENT ON TABLE tb_cloud_alibaba_ecs_instance IS '클라우드 인스턴스 통합 정보 (Alibaba ECI/ECS)';

    ALTER TABLE IF EXISTS tb_cloud_alibaba_ecs_instance ADD COLUMN IF NOT EXISTS container_group_id TEXT NOT NULL;
    ALTER TABLE IF EXISTS tb_cloud_alibaba_ecs_instance ADD COLUMN IF NOT EXISTS container_id TEXT NOT NULL;
    ALTER TABLE IF EXISTS tb_cloud_alibaba_ecs_instance ADD COLUMN IF NOT EXISTS image TEXT NOT NULL;
    ALTER TABLE IF EXISTS tb_cloud_alibaba_ecs_instance ADD COLUMN IF NOT EXISTS image_id TEXT NOT NULL;
    ALTER TABLE IF EXISTS tb_cloud_alibaba_ecs_instance ADD COLUMN IF NOT EXISTS created_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;
    ALTER TABLE IF EXISTS tb_cloud_alibaba_ecs_instance ADD COLUMN IF NOT EXISTS modified_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

    ALTER TABLE tb_cloud_alibaba_ecs_instance ADD CONSTRAINT uq_cloud_alibaba_ecs_instance_group_container UNIQUE (container_group_id, container_id);

    COMMENT ON COLUMN tb_cloud_alibaba_ecs_instance.container_group_id IS '컨테이너 그룹 ID';
    COMMENT ON COLUMN tb_cloud_alibaba_ecs_instance.container_id IS '컨테이너 ID';
    COMMENT ON COLUMN tb_cloud_alibaba_ecs_instance.image IS '이미지명';
    COMMENT ON COLUMN tb_cloud_alibaba_ecs_instance.image_id IS '이미지 URL';
    COMMENT ON COLUMN tb_cloud_alibaba_ecs_instance.created_time IS '생성일시';
    COMMENT ON COLUMN tb_cloud_alibaba_ecs_instance.modified_time IS '수정일시';
END $$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------
select '## tb_open_customer_dept_info';
DO $$
BEGIN
    CREATE TABLE IF NOT EXISTS tb_open_customer_dept_info();
    COMMENT ON TABLE tb_open_customer_dept_info IS '고객사 부서 정보';

    ALTER TABLE IF EXISTS tb_open_customer_dept_info ADD COLUMN IF NOT EXISTS id bigserial NOT NULL;
    ALTER TABLE IF EXISTS tb_open_customer_dept_info ADD COLUMN IF NOT EXISTS host_name text NOT NULL;
    ALTER TABLE IF EXISTS tb_open_customer_dept_info ADD COLUMN IF NOT EXISTS manager_id text NULL;
    ALTER TABLE IF EXISTS tb_open_customer_dept_info ADD COLUMN IF NOT EXISTS manager_name text NULL;
    ALTER TABLE IF EXISTS tb_open_customer_dept_info ADD COLUMN IF NOT EXISTS developer_id text NULL;
    ALTER TABLE IF EXISTS tb_open_customer_dept_info ADD COLUMN IF NOT EXISTS developer_name text NULL;
    ALTER TABLE IF EXISTS tb_open_customer_dept_info ADD COLUMN IF NOT EXISTS service_name text NULL;
    ALTER TABLE IF EXISTS tb_open_customer_dept_info ADD COLUMN IF NOT EXISTS modified_time timestamp without time zone;

    COMMENT ON COLUMN tb_open_customer_dept_info.id IS 'id';
    COMMENT ON COLUMN tb_open_customer_dept_info.host_name IS '호스트 이름';
    COMMENT ON COLUMN tb_open_customer_dept_info.manager_id IS '관리자 아이디';
    COMMENT ON COLUMN tb_open_customer_dept_info.manager_name IS '관리자 이름';
    COMMENT ON COLUMN tb_open_customer_dept_info.developer_id IS '개발자 아이디';
    COMMENT ON COLUMN tb_open_customer_dept_info.developer_name IS '개발자 이름';
    COMMENT ON COLUMN tb_open_customer_dept_info.service_name IS '서비스 이름';
    COMMENT ON COLUMN tb_open_customer_dept_info.modified_time IS '수정 시간';

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_open_customer_dept_info' AND constraint_type = 'PRIMARY KEY') THEN
        ALTER TABLE tb_open_customer_dept_info ADD CONSTRAINT tb_open_customer_dept_info_pkey PRIMARY KEY (id);
    END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
--                                    FOREIGN KEY                                       --
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_correlation_exclude' AND constraint_name = 'fk_tb_alert_exclude_correlation_rule_id' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_correlation_exclude ADD CONSTRAINT fk_tb_alert_exclude_correlation_rule_id FOREIGN KEY (correlation_rule_id) REFERENCES tb_correlation_rule(correlation_rule_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_group_policy' AND constraint_name = 'fk_tb_group_policy_group_id' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_group_policy ADD CONSTRAINT fk_tb_group_policy_group_id FOREIGN KEY (group_id) REFERENCES tb_group(group_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_group_policy' AND constraint_name = 'fk_tb_group_policy_policy_id' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_group_policy ADD CONSTRAINT fk_tb_group_policy_policy_id FOREIGN KEY (policy_id) REFERENCES tb_policy(policy_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_group_license' AND constraint_name = 'tb_group_license_license_id_fkey' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_group_license ADD CONSTRAINT tb_group_license_license_id_fkey FOREIGN KEY (license_id) REFERENCES tb_multi_license(license_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_job' AND constraint_name = 'fk_tb_job_correlation_rule_id' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_job ADD CONSTRAINT fk_tb_job_correlation_rule_id FOREIGN KEY (correlation_rule_id) REFERENCES tb_correlation_rule(correlation_rule_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_node' AND constraint_name = 'fk_tb_node_group_id' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_node ADD CONSTRAINT fk_tb_node_group_id FOREIGN KEY (group_id) REFERENCES tb_group(group_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_node_hash' AND constraint_name = 'fk_tb_node_hash_node_id' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_node_hash ADD CONSTRAINT fk_tb_node_hash_node_id FOREIGN KEY (node_id) REFERENCES tb_node(node_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_node_nic' AND constraint_name = 'fk_tb_node_nic_node_id' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_node_nic ADD CONSTRAINT fk_tb_node_nic_node_id FOREIGN KEY (node_id) REFERENCES tb_node(node_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_node_policy' AND constraint_name = 'fk_tb_node_policy_tb_node' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_node_policy ADD CONSTRAINT fk_tb_node_policy_tb_node FOREIGN KEY (node_id) REFERENCES tb_node(node_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_node_policy' AND constraint_name = 'fk_tb_node_policy_tb_policy' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_node_policy ADD CONSTRAINT fk_tb_node_policy_tb_policy FOREIGN KEY (policy_id) REFERENCES tb_policy(policy_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_pkg_platform' AND constraint_name = 'fk_tb_pkg_platform_tb_product_pkg' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_pkg_platform ADD CONSTRAINT fk_tb_pkg_platform_tb_product_pkg FOREIGN KEY (product_pkg_id) REFERENCES tb_product_pkg(product_pkg_id);END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_policy' AND constraint_name = 'fk_tb_policy_tb_product_feature' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_policy ADD CONSTRAINT fk_tb_policy_tb_product_feature FOREIGN KEY (product_feature_id) REFERENCES tb_product_feature(product_feature_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_product_pkg' AND constraint_name = 'fk_tb_product_pkg_tb_product' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_product_pkg ADD CONSTRAINT fk_tb_product_pkg_tb_product FOREIGN KEY (product_id) REFERENCES tb_product(product_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_report_schedule' AND constraint_name = 'fk_tb_report_schedule_tb_base_report_1' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_report_schedule ADD CONSTRAINT fk_tb_report_schedule_tb_base_report_1 FOREIGN KEY (base_report_id) REFERENCES tb_base_report(base_report_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_task' AND constraint_name = 'fk_tb_task_tb_job' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_task ADD CONSTRAINT fk_tb_task_tb_job FOREIGN KEY (job_id) REFERENCES tb_job(job_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_task_target' AND constraint_name = 'fk_tb_task_target_status_tb_task' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_task_target ADD CONSTRAINT fk_tb_task_target_status_tb_task FOREIGN KEY (task_id) REFERENCES tb_task(task_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_user' AND constraint_name = 'fk_tb_user_tb_node_1' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_user ADD CONSTRAINT fk_tb_user_tb_node_1 FOREIGN KEY (node_id) REFERENCES tb_node(node_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_widget_item' AND constraint_name = 'fk_tb_widget_item_tb_widget' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_widget_item ADD CONSTRAINT fk_tb_widget_item_tb_widget FOREIGN KEY (widget_id) REFERENCES tb_widget(widget_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_action_map_feature' AND constraint_name = 'tb_action_map_feature_action_name_fkey' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_action_map_feature ADD CONSTRAINT tb_action_map_feature_action_name_fkey FOREIGN KEY (action_name, revision) REFERENCES tb_action_map(action_name, revision);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_admin' AND constraint_name = 'tb_admin_privilege_profile_id_fkey' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_admin ADD CONSTRAINT tb_admin_privilege_profile_id_fkey FOREIGN KEY (privilege_profile_id) REFERENCES tb_privilege_profile(privilege_profile_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_correlation_rule' AND constraint_name = 'tb_correlation_rule_alert_template_id_fkey' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_correlation_rule ADD CONSTRAINT tb_correlation_rule_alert_template_id_fkey FOREIGN KEY (alert_template_id) REFERENCES tb_alert_template(alert_template_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_correlation_rule_item' AND constraint_name = 'fk_tb_correlation_rule_item_correlation_condition_id' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_correlation_rule_item ADD CONSTRAINT fk_tb_correlation_rule_item_correlation_condition_id FOREIGN KEY (correlation_condition_id) REFERENCES tb_correlation_condition(correlation_condition_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_correlation_rule_item' AND constraint_name = 'fk_tb_correlation_rule_item_correlation_rule_id' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_correlation_rule_item ADD CONSTRAINT fk_tb_correlation_rule_item_correlation_rule_id FOREIGN KEY (correlation_rule_id) REFERENCES tb_correlation_rule(correlation_rule_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_correlation_task' AND constraint_name = 'tb_correlation_task_correlation_rule_id_fkey' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_correlation_task ADD CONSTRAINT tb_correlation_task_correlation_rule_id_fkey FOREIGN KEY (correlation_rule_id) REFERENCES tb_correlation_rule(correlation_rule_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_group' AND constraint_name = 'tb_group_pgroup_id_fkey' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_group ADD CONSTRAINT tb_group_pgroup_id_fkey FOREIGN KEY (pgroup_id) REFERENCES tb_group(group_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_pkg_platform' AND constraint_name = 'tb_pkg_platform_platform_id_fkey' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_pkg_platform ADD CONSTRAINT tb_pkg_platform_platform_id_fkey FOREIGN KEY (platform_id) REFERENCES tb_platform(platform_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_pkg_server' AND constraint_name = 'tb_pkg_server_product_pkg_id_fkey' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_pkg_server ADD CONSTRAINT tb_pkg_server_product_pkg_id_fkey FOREIGN KEY (product_pkg_id) REFERENCES tb_product_pkg(product_pkg_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_product_feature_map' AND constraint_name = 'tb_product_feature_map_product_feature_id_fkey' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_product_feature_map ADD CONSTRAINT tb_product_feature_map_product_feature_id_fkey FOREIGN KEY (product_feature_id) REFERENCES tb_product_feature(product_feature_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_product_feature_map' AND constraint_name = 'tb_product_feature_map_product_id_fkey' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_product_feature_map ADD CONSTRAINT tb_product_feature_map_product_id_fkey FOREIGN KEY (product_id) REFERENCES tb_product(product_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_report_template_item' AND constraint_name = 'tb_report_template_item_report_template_id_fkey' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_report_template_item ADD CONSTRAINT tb_report_template_item_report_template_id_fkey FOREIGN KEY (report_template_id) REFERENCES tb_report_template(report_template_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_service' AND constraint_name = 'tb_service_server_id_fkey' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_service ADD CONSTRAINT tb_service_server_id_fkey FOREIGN KEY (server_id) REFERENCES tb_server(server_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_task_instance' AND constraint_name = 'tb_task_instance_task_id_fkey' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_task_instance ADD CONSTRAINT tb_task_instance_task_id_fkey FOREIGN KEY (task_id) REFERENCES tb_task(task_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_query_report_item' AND constraint_name = 'tb_user_report_item_user_report_id_fkey' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_query_report_item ADD CONSTRAINT tb_user_report_item_user_report_id_fkey FOREIGN KEY (query_report_id) REFERENCES tb_query_report(query_report_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.table_constraints WHERE table_name = 'tb_file_update_server' AND constraint_name = 'tb_file_update_server_server_id_fkey' AND constraint_type = 'FOREIGN KEY') THEN
        ALTER TABLE IF EXISTS ONLY tb_file_update_server ADD CONSTRAINT tb_file_update_server_server_id_fkey FOREIGN KEY (server_id) REFERENCES tb_server(server_id);
    END IF;

    

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
--                                     SEQUENCE                                         --
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
CREATE SEQUENCE IF NOT EXISTS tb_im_rule_custom_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;

CREATE SEQUENCE IF NOT EXISTS tb_scm_rule_set_info_userdefined_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
--                                        INDEX                                         --
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
CREATE INDEX IF NOT EXISTS tb_correlation_rule_item_dev_correlation_rule_id_idx ON tb_correlation_rule_item USING btree (correlation_rule_id);
CREATE INDEX IF NOT EXISTS tb_node_ip_idx ON tb_node USING btree (ip);
CREATE INDEX IF NOT EXISTS tb_node_platform_type_idx ON tb_node USING btree (platform_id);
CREATE INDEX IF NOT EXISTS tb_report_schedule_query_report_id_idx ON tb_report_schedule USING btree (query_report_id);
CREATE INDEX IF NOT EXISTS tb_task_instance_modified_time_idx ON tb_task_instance USING btree (modified_time);
CREATE INDEX IF NOT EXISTS tb_task_modified_time_idx ON tb_task USING btree (modified_time);
CREATE INDEX IF NOT EXISTS tb_action_map_service_target_idx ON tb_action_map USING btree (service_target);
CREATE INDEX IF NOT EXISTS tb_upload_file_task_id_instance_id_node_id_idx ON tb_upload_file USING btree (task_id, instance_id, node_id);
CREATE INDEX IF NOT EXISTS tb_cloud_azure_vm_azure_vm_id_idx ON tb_cloud_azure_vm USING btree (azure_vm_id, azure_id);


CREATE INDEX IF NOT EXISTS tb_correlation_result_correlation_rule_id_phase_idx ON tb_correlation_result USING btree (correlation_rule_id, phase);
CREATE INDEX IF NOT EXISTS tb_node_group_id_idx ON tb_node USING btree (group_id);
CREATE INDEX IF NOT EXISTS tb_policy_status_node_id_idx ON tb_policy_status USING btree (node_id);
CREATE INDEX IF NOT EXISTS tb_v3_status_node_id_idx ON tb_v3_status USING btree (node_id);
CREATE INDEX IF NOT EXISTS tb_hourly_timeline_node_id_reg_date_is_latest_engine_update_idx ON tb_hourly_timeline USING btree (node_id, reg_date, is_latest_engine_update);
CREATE INDEX IF NOT EXISTS tb_task_target_status_target_id_task_status_idx ON tb_task_target_status USING btree (target_id, task_status);
CREATE INDEX IF NOT EXISTS tb_task_target_status_task_type_task_target_type_start_time_idx ON tb_task_target_status USING btree (task_type, task_target_type, start_time);
CREATE INDEX IF NOT EXISTS tb_correlation_rule_item_correlation_rule_id_idx ON tb_correlation_rule_item USING btree (correlation_rule_id);
CREATE INDEX IF NOT EXISTS tb_server_resource_server_id_log_time_idx ON tb_server_resource USING btree (server_id, log_time DESC);
CREATE INDEX IF NOT EXISTS tb_service_log_obj_id_row_number_idx ON tb_service_log_obj_id USING btree (row_number);
CREATE INDEX IF NOT EXISTS tb_audit_log_obj_id_obj_id_row_number_idx ON tb_audit_log_obj_id USING btree (row_number);
CREATE INDEX IF NOT EXISTS tb_engine_update_log_obj_id_row_number_idx ON tb_engine_update_log_obj_id USING btree (row_number);
CREATE INDEX IF NOT EXISTS tb_backup_log_obj_id_row_number_idx ON tb_backup_log_obj_id USING btree (row_number);
CREATE INDEX IF NOT EXISTS tb_pkg_dist_log_obj_id_row_number_idx ON tb_pkg_dist_log_obj_id USING btree (row_number);
CREATE INDEX IF NOT EXISTS tb_pkg_sync_log_obj_id_row_number_idx ON tb_pkg_sync_log_obj_id USING btree (row_number);
CREATE INDEX IF NOT EXISTS tb_agent_install_pkg_log_obj_id_row_number_idx ON tb_agent_install_pkg_log_obj_id USING btree (row_number);
CREATE INDEX IF NOT EXISTS tb_agent_event_log_obj_id_row_number_idx ON tb_agent_event_log_obj_id USING btree (row_number);
CREATE INDEX IF NOT EXISTS tb_task_status_log_obj_id_row_number_idx ON tb_task_status_log_obj_id USING btree (row_number);
CREATE INDEX IF NOT EXISTS tb_server_alert_log_obj_id_row_number_idx ON tb_server_alert_log_obj_id USING btree (row_number);
CREATE INDEX IF NOT EXISTS tb_v3_alert_log_obj_id_row_number_idx ON tb_v3_alert_log_obj_id USING btree (row_number);
CREATE INDEX IF NOT EXISTS tb_v3_ss_log_obj_id_row_number_idx ON tb_v3_ss_log_obj_id USING btree (row_number);
CREATE INDEX IF NOT EXISTS tb_v3_is_log_obj_id_row_number_idx ON tb_v3_is_log_obj_id USING btree (row_number);
CREATE INDEX IF NOT EXISTS tb_v3_sup_log_obj_id_row_number_idx ON tb_v3_sup_log_obj_id USING btree (row_number);
CREATE INDEX IF NOT EXISTS tb_v3_quar_log_obj_id_row_number_idx ON tb_v3_quar_log_obj_id USING btree (row_number);
CREATE INDEX IF NOT EXISTS tb_node_hw_obj_id_row_number_idx ON tb_node_hw_obj_id USING btree (row_number);
CREATE INDEX IF NOT EXISTS tb_node_sw_obj_id_row_number_idx ON tb_node_sw_obj_id USING btree (row_number);
CREATE INDEX IF NOT EXISTS tb_hips_fw_event_log_obj_id_row_number_idx ON tb_hips_fw_event_log_obj_id USING btree (row_number);
CREATE INDEX IF NOT EXISTS tb_hips_agent_event_log_obj_id_row_number_idx ON tb_hips_agent_event_log_obj_id USING btree (row_number);
CREATE INDEX IF NOT EXISTS tb_hips_detect_event_log_obj_id_row_number_idx ON tb_hips_detect_event_log_obj_id USING btree (row_number);
CREATE INDEX IF NOT EXISTS tb_ac_agent_event_log_obj_id_row_number_idx ON tb_ac_agent_event_log_obj_id USING btree (row_number);
CREATE INDEX IF NOT EXISTS tb_ac_exec_event_log_obj_id_row_number_idx ON tb_ac_exec_event_log_obj_id USING btree (row_number);
CREATE INDEX IF NOT EXISTS tb_ac_access_event_log_obj_id_row_number_idx ON tb_ac_access_event_log_obj_id USING btree (row_number);

CREATE INDEX IF NOT EXISTS tb_im_ondemand_log_detect_log_id_idx ON tb_im_ondemand_log_detect USING btree (log_id);
CREATE INDEX IF NOT EXISTS tb_scm_scan_result_detail_scan_id_idx ON tb_scm_scan_result_detail USING btree (scan_id);

CREATE INDEX IF NOT EXISTS tb_cnapp_event_log_obj_id_idx ON tb_cnapp_event_log_obj_id USING btree (row_number);
CREATE INDEX IF NOT EXISTS tb_cnapp_vulnerability_scan_event_log_obj_id_idx ON tb_cnapp_vulnerability_scan_event_log_obj_id USING btree (row_number);
CREATE INDEX IF NOT EXISTS tb_cnapp_malware_scan_event_log_obj_id_idx ON tb_cnapp_malware_scan_event_log_obj_id USING btree (row_number);

--- USING TABLESPACE IN cpp_olap
CREATE INDEX IF NOT EXISTS tb_hips_detect_event_log_hourly_collect_idx ON tb_hips_detect_event_log_hourly USING btree (collect) TABLESPACE cpp_olap;
CREATE INDEX IF NOT EXISTS tb_hips_fw_event_log_hourly_idx ON tb_hips_fw_event_log_hourly USING btree (collect) TABLESPACE cpp_olap;
CREATE UNIQUE INDEX IF NOT EXISTS tb_ac_execution_control_timeline_idx_1 ON tb_ac_execution_control_timeline (yyyy, mm, dd, hh, node_id, file_hash, file_name, file_path, action, mode) TABLESPACE cpp_olap;

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
--                                     ALTER TABLE                                      --
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
ALTER TABLE IF EXISTS tb_node_hips_signature ALTER COLUMN alarm DROP NOT NULL;
ALTER TABLE IF EXISTS tb_node_hips_signature ALTER COLUMN alarm SET DEFAULT false;
ALTER TABLE IF EXISTS tb_node DROP CONSTRAINT IF EXISTS tb_node_machine_uuid_machine_type_key; -- CWPP-2916 : machine_uuid, machine_type constraint 제거

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
--                                     DROP TABLE                                      --
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tb_product_usage_timeline;
DROP TABLE IF EXISTS tb_product_usage_daily_timeline;

------------------------------------------------------------------------------------------
-- 기존 etl 사용 테이블 제거                                                             --
------------------------------------------------------------------------------------------
select '## Drop table for etl(batch-processor) start';

DROP TABLE IF EXISTS tb_etl_map;
DROP TABLE IF EXISTS tb_shard_map;
DROP TABLE IF EXISTS tb_olap_table;
DROP TABLE IF EXISTS tb_pre_node_status;
DROP TABLE IF EXISTS tb_pre_node_sw;
DROP TABLE IF EXISTS tb_pre_node_hw;
DROP TABLE IF EXISTS tb_pre_policy_status;
DROP TABLE IF EXISTS tb_pre_task_target_status;
DROP TABLE IF EXISTS tb_pre_v3_status;
DROP TABLE IF EXISTS tb_pre_service_log_obj_id;
DROP TABLE IF EXISTS tb_pre_audit_log_obj_id;
DROP TABLE IF EXISTS tb_pre_engine_update_log_obj_id;
DROP TABLE IF EXISTS tb_pre_backup_log_obj_id;
DROP TABLE IF EXISTS tb_pre_pkg_dist_log_obj_id;
DROP TABLE IF EXISTS tb_pre_pkg_sync_log_obj_id;
DROP TABLE IF EXISTS tb_pre_agent_install_pkg_log_obj_id;
DROP TABLE IF EXISTS tb_pre_agent_event_log_obj_id;
DROP TABLE IF EXISTS tb_pre_task_status_log_obj_id;
DROP TABLE IF EXISTS tb_pre_v3_alert_log_obj_id;
DROP TABLE IF EXISTS tb_pre_v3_ss_log_obj_id;
DROP TABLE IF EXISTS tb_pre_v3_is_log_obj_id;
DROP TABLE IF EXISTS tb_pre_v3_sup_log_obj_id;
DROP TABLE IF EXISTS tb_pre_node_hw_obj_id;
DROP TABLE IF EXISTS tb_pre_node_sw_obj_id;
DROP TABLE IF EXISTS tb_pre_hips_fw_event_log_obj_id;
DROP TABLE IF EXISTS tb_pre_ac_agent_event_log_obj_id;
DROP TABLE IF EXISTS tb_pre_ac_exec_event_log_obj_id;
DROP TABLE IF EXISTS tb_pre_ac_access_event_log_obj_id;
DROP TABLE IF EXISTS tb_pre_hips_agent_event_log_obj_id;
DROP TABLE IF EXISTS tb_pre_hips_detect_event_log_obj_id;
DROP TABLE IF EXISTS tb_pre_ac_status;
DROP TABLE IF EXISTS tb_pre_hips_status;
DROP TABLE IF EXISTS tb_pre_hips_detect_event_log_hourly;
DROP TABLE IF EXISTS tb_pre_hips_fw_event_log_hourly;
DROP TABLE IF EXISTS tb_pre_ac_execution_control_timeline;
DROP TABLE IF EXISTS tb_scm_scan_result_daily_timeline;
DROP TABLE IF EXISTS tb_report_hips_detect_application_type;
DROP TABLE IF EXISTS tb_report_hips_detect_attacker;
DROP TABLE IF EXISTS tb_report_hips_detect_signature_name;
DROP TABLE IF EXISTS tb_report_malware_detect_history;
DROP TABLE IF EXISTS tb_report_product_status;
DROP TABLE IF EXISTS tb_report_hw_status;
DROP TABLE IF EXISTS tb_report_v3_install_status;
DROP TABLE IF EXISTS tb_report_v3_policy_status;
DROP TABLE IF EXISTS tb_report_sw_status;
DROP TABLE IF EXISTS tb_report_malware_name_top;
DROP TABLE IF EXISTS tb_report_os_status;
DROP TABLE IF EXISTS tb_report_base_summary;
DROP TABLE IF EXISTS tb_report_agent_install_status;
DROP TABLE IF EXISTS tb_report_malware_agent_top;
DROP TABLE IF EXISTS tb_report_v3_install_history;
DROP TABLE IF EXISTS tb_report_hips_detect_attack_nation;
DROP TABLE IF EXISTS tb_report_hips_detect_agent;
DROP TABLE IF EXISTS tb_report_hips_detect_history;
DROP TABLE IF EXISTS tb_report_hips_fw_block_ip;
DROP TABLE IF EXISTS tb_report_hips_fw_block_port;
DROP TABLE IF EXISTS tb_report_hips_fw_block_rule;
DROP TABLE IF EXISTS tb_report_hips_fw_block_history;
DROP TABLE IF EXISTS tb_report_hips_fw_block_agent;
DROP TABLE IF EXISTS tb_report_ac_block_history;
DROP TABLE IF EXISTS tb_report_ac_block_file_history;
DROP TABLE IF EXISTS tb_report_ac_agent_history;
DROP TABLE IF EXISTS tb_report_agent_install_history;
DROP TABLE IF EXISTS tb_report_malware_summary;
DROP TABLE IF EXISTS tb_report_malware_nosql_data;
DROP TABLE IF EXISTS tb_report_im_node_timeline;
DROP TABLE IF EXISTS tb_report_im_history_timeline;
DROP TABLE IF EXISTS tb_report_im_detect_rule_timeline;
DROP TABLE IF EXISTS tb_report_im_detect_watchlist_timeline;
DROP TABLE IF EXISTS tb_report_im_target_type_timeline;
DROP TABLE IF EXISTS tb_malware_stat_by_ip;
DROP TABLE IF EXISTS tb_malware_stat_by_name;
DROP TABLE IF EXISTS tb_license_update_info;

select '## Drop table for etl(batch-processor) end';
------------------------------------------------------------------------------------------

