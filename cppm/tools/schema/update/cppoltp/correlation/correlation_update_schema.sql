--------------------------------------------------------------------------------------------------------
-- correlation - type, table
--------------------------------------------------------------------------------------------------------
	
------------------------------------------------------------------------------------------
-- tb_correlation_condition
DO $$
BEGIN
	IF EXISTS (select 1 from tb_correlation_condition where correlation_condition_id='AC_FILE_NAME')
	THEN
		DELETE FROM tb_correlation_condition
		WHERE correlation_condition_id='AC_FILE_NAME';
	END IF;
	
	IF EXISTS (select 1 from tb_correlation_condition where correlation_condition_id='AC_BLOCK_COUNT')
	THEN
		DELETE FROM tb_correlation_condition
		WHERE correlation_condition_id='AC_BLOCK_COUNT';
	END IF;
	
	IF EXISTS (select 1 from tb_correlation_condition where correlation_condition_id='FW_SOURCE_IP')
	THEN
		DELETE FROM tb_correlation_condition
		WHERE correlation_condition_id='FW_SOURCE_IP';
	END IF;
	
	IF EXISTS (select 1 from tb_correlation_condition where correlation_condition_id='FW_DESTINATION_IP')
	THEN
		DELETE FROM tb_correlation_condition
		WHERE correlation_condition_id='FW_DESTINATION_IP';
	END IF;
	
	IF EXISTS (select 1 from tb_correlation_condition where correlation_condition_id='FW_BLOCK_COUNT')
	THEN
		DELETE FROM tb_correlation_condition
		WHERE correlation_condition_id='FW_BLOCK_COUNT';
	END IF;
	
	IF EXISTS (select 1 from tb_correlation_condition where correlation_condition_id='HIPS_ATTACK_COUNT')
	THEN
		DELETE FROM tb_correlation_condition
		WHERE correlation_condition_id='HIPS_ATTACK_COUNT';
	END IF;
	
	IF EXISTS (select 1 from tb_correlation_condition where correlation_condition_id='HIPS_ATTACK_IP')
	THEN
		DELETE FROM tb_correlation_condition
		WHERE correlation_condition_id='HIPS_ATTACK_IP';
	END IF;
	
	IF EXISTS (select 1 from tb_correlation_condition where correlation_condition_id='HIPS_ATTACK_NAME')
	THEN
		DELETE FROM tb_correlation_condition
		WHERE correlation_condition_id='HIPS_ATTACK_NAME';
	END IF;
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
-- en_mail_template_macro_type
ALTER TYPE IF EXISTS en_mail_template_macro_type rename to en_mail_template_macro_type_old;

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
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'SW_INSTALL';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'SW_UNINSTALL';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'AC_EXEC_BLOCK_COUNT';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'AC_FILE_HASH_DETECT_COUNT';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'AC_FILE_NAME_DETECT_COUNT';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'HIPS_DETECT_COUNT';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'HIPS_SIGNATURE_NAME';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'HIPS_SEVERITY';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'HIPS_APPLYING_COUNT';
ALTER TYPE en_mail_template_macro_type ADD VALUE IF NOT EXISTS 'HIPS_LAST_SIGNATURE_UPDATE_TIME';

------------------------------------------------------------------------------------------
-- en_correlation_condition_id_type
ALTER TYPE IF EXISTS en_correlation_condition_id_type rename to en_correlation_condition_id_type_old;

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
	
------------------------------------------------------------------------------------------
-- drop constraint	
DO $$
BEGIN
	IF EXISTS (
		SELECT 1 
		FROM information_schema.table_constraints 
		WHERE 
			table_name = 'tb_correlation_rule_item' 
			AND constraint_name = 'tb_correlation_rule_item_pkey' 
			AND constraint_type = 'PRIMARY KEY'
	) THEN
        alter table tb_correlation_rule_item drop constraint tb_correlation_rule_item_pkey;
	END IF;
	
	IF EXISTS (
		SELECT 1 
		FROM information_schema.table_constraints 
		WHERE 
			table_name = 'tb_correlation_rule_item' 
			AND constraint_name = 'fk_tb_correlation_rule_item_correlation_condition_id' 
			AND constraint_type = 'FOREIGN KEY'
	) THEN
        alter table tb_correlation_rule_item drop constraint fk_tb_correlation_rule_item_correlation_condition_id;
	END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
-- alter column
ALTER TABLE IF EXISTS tb_correlation_rule_item alter column correlation_condition_id type en_correlation_condition_id_type using correlation_condition_id::text::en_correlation_condition_id_type;
ALTER TABLE IF EXISTS tb_correlation_condition alter column correlation_condition_id type en_correlation_condition_id_type using correlation_condition_id::text::en_correlation_condition_id_type;

------------------------------------------------------------------------------------------
-- add constraint	
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT 1 
		FROM information_schema.table_constraints 
		WHERE 
			table_name = 'tb_correlation_rule_item' 
			AND constraint_name = 'tb_correlation_rule_item_pkey' 
			AND constraint_type = 'PRIMARY KEY'
	) THEN
        alter table tb_correlation_rule_item add constraint tb_correlation_rule_item_pkey PRIMARY KEY  (correlation_rule_id, correlation_condition_id);
	END IF;
	
	IF NOT EXISTS (
		SELECT 1 
		FROM information_schema.table_constraints 
		WHERE 
			table_name = 'tb_correlation_rule_item' 
			AND constraint_name = 'fk_tb_correlation_rule_item_correlation_condition_id' 
			AND constraint_type = 'FOREIGN KEY'
	) THEN
        alter table tb_correlation_rule_item add constraint fk_tb_correlation_rule_item_correlation_condition_id FOREIGN KEY (correlation_condition_id) REFERENCES tb_correlation_condition(correlation_condition_id);
	END IF;

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
-- CASCADE to drop the dependent objects too.
DROP TYPE IF EXISTS en_correlation_condition_id_type_old cascade;
DROP TYPE IF EXISTS en_mail_template_macro_type_old;
