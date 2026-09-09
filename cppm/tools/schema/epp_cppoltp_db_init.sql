--------------------------------------------------------------
-- 1. kill all connection excepted by me
SELECT pg_terminate_backend(pid) FROM pg_stat_activity
WHERE
-- don't kill my own connection!
pid <> pg_backend_pid()
-- don't kill the connections to other databases
AND datname = 'cppoltp';
--------------------------------------------------------------

--------------------------------------------------------------
-- DROP USER <username>
-- -> to explicit command
-- REASSIGN OWNED BY <olduser> TO <newuser>
reassign owned by eppoltpuser to postgres;
DROP OWNED BY eppoltpuser;
--------------------------------------------------------------

--------------------------------------------------------------
-- 2. user and database drop
REVOKE ALL PRIVILEGES ON DATABASE cppoltp FROM eppoltpuser;
drop user eppoltpuser;
drop database cppoltp;
--------------------------------------------------------------

--------------------------------------------------------------
-- 3. create user and database - postgresql 에서는 비밀번호의 기본 암호화 방식이 SCRAM-SHA-256이므로 md5로 변경 후 계정 생성
-- CWPP-8815 에 의한 md5 변경 쿼리 제거
-- ALTER SYSTEM SET password_encryption = 'md5';
SELECT pg_reload_conf();
create user eppoltpuser;
alter user eppoltpuser with password 'qweQWE123!@#';
ALTER USER eppoltpuser WITH SUPERUSER;
CREATE DATABASE cppoltp ENCODING='UTF-8' LC_COLLATE='C' LC_CTYPE='C' template=template0; 
ALTER DATABASE cppoltp OWNER TO eppoltpuser;
GRANT ALL PRIVILEGES ON DATABASE cppoltp TO eppoltpuser;
--------------------------------------------------------------

--------------------------------------------------------------
-- 4. remove all public privilege
REVOKE ALL ON SCHEMA public FROM PUBLIC;
--------------------------------------------------------------

--------------------------------------------------------------
-- 5. create tablespace for cpp olap
CREATE TABLESPACE cpp_olap LOCATION '/database/15/eppolapdata';
--------------------------------------------------------------
