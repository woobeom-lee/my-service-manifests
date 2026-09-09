SET client_encoding = 'UTF8';


------------------------------------------------------------------------
-- SPECIAL FUNCTION
------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION ssp_view_all_drop()
RETURNS VOID AS
$$
DECLARE
r RECORD;
BEGIN
  FOR r IN
   select viewname from pg_views where viewname LIKE 'vw_%'
  LOOP
    EXECUTE 'DROP VIEW ' || r.viewname;
  END LOOP;

END;
$$
LANGUAGE plpgsql;

------------------------------------------------------------------------
-- GENERAL FUNCTION
select * from ssp_view_all_drop();
------------------------------------------------------------------------


------------------------------------------------------------------------------------------
select '## vw_config';
------------------------------------------------------------------------------------------
DO $$
BEGIN
    CREATE OR REPLACE VIEW vw_config AS
    SELECT *
    FROM tb_config;

    COMMENT ON VIEW vw_config IS '설정 뷰';
    COMMENT ON COLUMN vw_config.config_group IS '설정 그룹';
    COMMENT ON COLUMN vw_config.key IS '설정 키';
    COMMENT ON COLUMN vw_config.value IS '설정 값';
    COMMENT ON COLUMN vw_config.modified_time IS '변경 시각';

END $$ LANGUAGE 'plpgsql';


------------------------------------------------------------------------------------------
select '## vw_correlation_result';
------------------------------------------------------------------------------------------
DO $$
BEGIN
    CREATE OR REPLACE VIEW vw_correlation_result AS
    SELECT cr.correlation_rule_id,
        cr.target_id,
        cr.phase,
        cr.macro_type,
        cr.macro_data
    FROM tb_correlation_result AS cr
        JOIN tb_olap_correlation_phase AS oc ON cr.correlation_rule_id = oc.correlation_rule_id AND cr.phase = oc.phase;

    COMMENT ON VIEW vw_correlation_result IS '연계규칙 결과 뷰';
    COMMENT ON COLUMN vw_correlation_result.correlation_rule_id IS '연계규칙 ID';
    COMMENT ON COLUMN vw_correlation_result.target_id IS '대상 ID';
    COMMENT ON COLUMN vw_correlation_result.phase IS '단계';
    COMMENT ON COLUMN vw_correlation_result.macro_type IS '매크로 타입';
    COMMENT ON COLUMN vw_correlation_result.macro_data IS '매크로 데이터';
    END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## vw_group';
------------------------------------------------------------------------------------------
DO $$
BEGIN
    CREATE OR REPLACE VIEW vw_group AS
    SELECT *
    FROM tb_group;

    COMMENT ON VIEW vw_group IS '그룹 뷰';
    COMMENT ON COLUMN vw_group.group_id IS '그룹 ID';
    COMMENT ON COLUMN vw_group.name IS '그룹명';
    COMMENT ON COLUMN vw_group.path IS '그룹 ID 경로';
    COMMENT ON COLUMN vw_group.name_path IS '그룹명 경로';
    COMMENT ON COLUMN vw_group.pgroup_id IS '상위 그룹 ID';
    COMMENT ON COLUMN vw_group.group_type IS '그룹 타입';
    COMMENT ON COLUMN vw_group.is_removed IS '삭제 여부';
    COMMENT ON COLUMN vw_group.group_order IS '그룹 순서';

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## vw_node';
------------------------------------------------------------------------------------------
DO $$
BEGIN
    CREATE OR REPLACE VIEW vw_node AS
    SELECT *
    FROM tb_node;

    COMMENT ON VIEW vw_node IS '노드 뷰';
    COMMENT ON COLUMN vw_node.node_id IS '노드 ID';
    COMMENT ON COLUMN vw_node.group_id IS '그룹 ID';
    COMMENT ON COLUMN vw_node.machine_uuid IS '에이전트 하드웨어 시리얼';
    COMMENT ON COLUMN vw_node.is_removed IS '삭제 여부';
    COMMENT ON COLUMN vw_node.path IS '경로';
    COMMENT ON COLUMN vw_node.ip IS 'IP 주소';
    COMMENT ON COLUMN vw_node.ip_connected IS '연결된 IP 주소';
    COMMENT ON COLUMN vw_node.mac IS 'MAC 주소';
    COMMENT ON COLUMN vw_node.nt_domain IS 'NT 도메인';
    COMMENT ON COLUMN vw_node.login_id IS '로그인 ID';
    COMMENT ON COLUMN vw_node.computer_name IS '컴퓨터 이름';
    COMMENT ON COLUMN vw_node.install_time IS '설치 시각';
    COMMENT ON COLUMN vw_node.modified_time IS '변경 시각';
    COMMENT ON COLUMN vw_node.removed_time IS '삭제 시각';
    COMMENT ON COLUMN vw_node.machine_type IS '머신 타입';
    COMMENT ON COLUMN vw_node.platform_id IS '운영체제 ID';
    COMMENT ON COLUMN vw_node.agent_version IS '에이전트 버전';
    COMMENT ON COLUMN vw_node.os_language IS 'OS 언어';
    COMMENT ON COLUMN vw_node.agent_port IS '에이전트 포트';
    COMMENT ON COLUMN vw_node.tz_offset IS '시간대';
    COMMENT ON COLUMN vw_node.agent_install_time IS '에이전트에서 전달한 설치 시각';
        
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## vw_node_hw';
------------------------------------------------------------------------------------------
DO $$
BEGIN
    CREATE OR REPLACE VIEW vw_node_hw AS
    SELECT *
    FROM tb_node_hw;

    COMMENT ON VIEW vw_node_hw IS '노드 하드웨어 뷰';
    COMMENT ON COLUMN vw_node_hw.node_id IS '노드 ID';
    COMMENT ON COLUMN vw_node_hw.cpu_name IS 'CPU 명';
    COMMENT ON COLUMN vw_node_hw.cpu_version IS 'CPU 버전';
    COMMENT ON COLUMN vw_node_hw.cpu_speed IS 'CPU 속도';
    COMMENT ON COLUMN vw_node_hw.memory_physical IS '물리 메모리 크기';
    COMMENT ON COLUMN vw_node_hw.memory_virtual IS '가상 메모리 크기';
    COMMENT ON COLUMN vw_node_hw.bios_date IS '바이오스 날짜';
    COMMENT ON COLUMN vw_node_hw.bios_name IS '바이오스명';
    COMMENT ON COLUMN vw_node_hw.bios_vendor IS '바이오스 제조사';
    COMMENT ON COLUMN vw_node_hw.bios_version IS '바이오스 버전';
    COMMENT ON COLUMN vw_node_hw.vga_resolution IS '그래픽카드 해상도';
    COMMENT ON COLUMN vw_node_hw.vga_type IS '그래픽카드 타입';
    COMMENT ON COLUMN vw_node_hw.vga_chipset IS '그래픽카드 칩셋';
    COMMENT ON COLUMN vw_node_hw.vga_mem IS '그래픽카드 메모리 크기';
    COMMENT ON COLUMN vw_node_hw.hdd1_file_system IS 'HDD1 파일 시스템';
    COMMENT ON COLUMN vw_node_hw.hdd1_size IS 'HDD1 크기';
    COMMENT ON COLUMN vw_node_hw.hdd1_free IS 'HDD1 여유 공간';
    COMMENT ON COLUMN vw_node_hw.hdd2_file_system IS 'HDD2 파일 시스템';
    COMMENT ON COLUMN vw_node_hw.hdd2_size IS 'HDD2 크기';
    COMMENT ON COLUMN vw_node_hw.hdd2_free IS 'HDD2 여유 공간';
    COMMENT ON COLUMN vw_node_hw.hdd3_file_system IS 'HDD3 파일 시스템';
    COMMENT ON COLUMN vw_node_hw.hdd3_size IS 'HDD3 크기';
    COMMENT ON COLUMN vw_node_hw.hdd3_free IS 'HDD3 여유 공간';
    COMMENT ON COLUMN vw_node_hw.hdd4_file_system IS 'HDD4 파일 시스템';
    COMMENT ON COLUMN vw_node_hw.hdd4_size IS 'HDD4 크기';
    COMMENT ON COLUMN vw_node_hw.hdd4_free IS 'HDD4 여유 공간';
    COMMENT ON COLUMN vw_node_hw.hdd5_file_system IS 'HDD5 파일 시스템';
    COMMENT ON COLUMN vw_node_hw.hdd5_size IS 'HDD5 크기';
    COMMENT ON COLUMN vw_node_hw.hdd5_free IS 'HDD5 여유 공간';
    COMMENT ON COLUMN vw_node_hw.host IS '호스트명';
    COMMENT ON COLUMN vw_node_hw.iexplorer IS '인터넷 익스플로러 정보';
    COMMENT ON COLUMN vw_node_hw.winsock IS 'winsock 정보';
    COMMENT ON COLUMN vw_node_hw.nic1_mac IS 'NIC1 mac 주소';
    COMMENT ON COLUMN vw_node_hw.nic1_gw IS 'NIC1 게이트웨어';
    COMMENT ON COLUMN vw_node_hw.nic1_ip IS 'NIC1 IP';
    COMMENT ON COLUMN vw_node_hw.nic1_dhcp_use IS 'NIC1 DHCP 사용여부';
    COMMENT ON COLUMN vw_node_hw.nic1_dhcp_server IS 'NIC1 DHCP 서버';
    COMMENT ON COLUMN vw_node_hw.nic1_virtual IS 'NIC1 가상 여부';
    COMMENT ON COLUMN vw_node_hw.nic2_mac IS 'NIC2 mac 주소';
    COMMENT ON COLUMN vw_node_hw.nic2_gw IS 'NIC2 게이트웨어';
    COMMENT ON COLUMN vw_node_hw.nic2_ip IS 'NIC2 IP';
    COMMENT ON COLUMN vw_node_hw.nic2_dhcp_use IS 'NIC2 DHCP 사용여부';
    COMMENT ON COLUMN vw_node_hw.nic2_dhcp_server IS 'NIC2 DHCP 서버';
    COMMENT ON COLUMN vw_node_hw.nic2_virtual IS 'NIC2 가상 여부';
    COMMENT ON COLUMN vw_node_hw.nic3_mac IS 'NIC3 mac 주소';
    COMMENT ON COLUMN vw_node_hw.nic3_gw IS 'NIC3 게이트웨어';
    COMMENT ON COLUMN vw_node_hw.nic3_ip IS 'NIC3 IP';
    COMMENT ON COLUMN vw_node_hw.nic3_dhcp_use IS 'NIC3 DHCP 사용여부';
    COMMENT ON COLUMN vw_node_hw.nic3_dhcp_server IS 'NIC3 DHCP 서버';
    COMMENT ON COLUMN vw_node_hw.nic3_virtual IS 'NIC3 가상 여부';
    COMMENT ON COLUMN vw_node_hw.nic4_mac IS 'NIC4 mac 주소';
    COMMENT ON COLUMN vw_node_hw.nic4_gw IS 'NIC4 게이트웨어';
    COMMENT ON COLUMN vw_node_hw.nic4_ip IS 'NIC4 IP';
    COMMENT ON COLUMN vw_node_hw.nic4_dhcp_use IS 'NIC4 DHCP 사용여부';
    COMMENT ON COLUMN vw_node_hw.nic4_dhcp_server IS 'NIC4 DHCP 서버';
    COMMENT ON COLUMN vw_node_hw.nic4_virtual IS 'NIC4 가상 여부';
    COMMENT ON COLUMN vw_node_hw.nic5_mac IS 'NIC5 mac 주소';
    COMMENT ON COLUMN vw_node_hw.nic5_gw IS 'NIC5 게이트웨어';
    COMMENT ON COLUMN vw_node_hw.nic5_ip IS 'NIC5 IP';
    COMMENT ON COLUMN vw_node_hw.nic5_dhcp_use IS 'NIC5 DHCP 사용여부';
    COMMENT ON COLUMN vw_node_hw.nic5_dhcp_server IS 'NIC5 DHCP 서버';
    COMMENT ON COLUMN vw_node_hw.nic5_virtual IS 'NIC5 가상 여부';
    COMMENT ON COLUMN vw_node_hw.os_name IS '운영체제 명';
    COMMENT ON COLUMN vw_node_hw.os_name_detail IS '운영체제 상세';
    COMMENT ON COLUMN vw_node_hw.os_install_time IS '운영체제 설치 시각';
    COMMENT ON COLUMN vw_node_hw.os_version IS '운영체제 버전';
    COMMENT ON COLUMN vw_node_hw.os_platform IS '운영체제 플랫폼';
    COMMENT ON COLUMN vw_node_hw.os_product_id IS '운영체제 제품 ID';
    COMMENT ON COLUMN vw_node_hw.os_kernel_version IS '운영체제 커널 버전';
    COMMENT ON COLUMN vw_node_hw.client_time IS '클라이언트 시각';
    COMMENT ON COLUMN vw_node_hw.tz_offset IS '시간대';
    COMMENT ON COLUMN vw_node_hw.server_time IS '서버시각';
    COMMENT ON COLUMN vw_node_hw.cpu_detail IS 'CPU 상세';
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## vw_node_status';
------------------------------------------------------------------------------------------
DO $$
BEGIN
    CREATE OR REPLACE VIEW vw_node_status AS
    SELECT *
    FROM tb_node_status;

    COMMENT ON VIEW vw_node_status IS '노드 상태 뷰';
    COMMENT ON COLUMN vw_node_status.node_id IS '노드 ID';
    COMMENT ON COLUMN vw_node_status.connection_status IS '노드 연결 상태';
    COMMENT ON COLUMN vw_node_status.server_time IS '변경 시각';
    COMMENT ON COLUMN vw_node_status.integrity_status IS '정합성 상태';
    COMMENT ON COLUMN vw_node_status.tz_offset IS '시간대';
    COMMENT ON COLUMN vw_node_status.client_time IS '클라이언트 시각';
    COMMENT ON COLUMN vw_node_status.license_no IS '라이선스 번호';
    COMMENT ON COLUMN vw_node_status.license_user IS '라이선스 사용자';
    COMMENT ON COLUMN vw_node_status.license_org IS '라이선스 조직';
END $$ LANGUAGE 'plpgsql';
------------------------------------------------------------------------------------------
select '## vw_node_sw';
------------------------------------------------------------------------------------------
DO $$
BEGIN
    CREATE OR REPLACE VIEW vw_node_sw AS
    SELECT *
    FROM tb_node_sw;

    COMMENT ON VIEW vw_node_sw IS '노드 소프트웨어 뷰';
    COMMENT ON COLUMN vw_node_sw.node_id IS '노드 ID';
    COMMENT ON COLUMN vw_node_sw.sw_name IS '소프트웨어 명';
    COMMENT ON COLUMN vw_node_sw.publisher IS '게시자';
    COMMENT ON COLUMN vw_node_sw.version IS '버전';
    COMMENT ON COLUMN vw_node_sw.size IS '크기';
    COMMENT ON COLUMN vw_node_sw.install_time IS '설치 시각';
    COMMENT ON COLUMN vw_node_sw.server_time IS '서버시각';
    COMMENT ON COLUMN vw_node_sw.tz_offset IS '시간대';
    COMMENT ON COLUMN vw_node_sw.client_time IS '클라이언트 시각';
    COMMENT ON COLUMN vw_node_sw.sw_guid IS '소프트웨어 식별자';

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## vw_policy_status';
------------------------------------------------------------------------------------------
DO $$
BEGIN
    CREATE OR REPLACE VIEW vw_policy_status AS
    SELECT ps.node_id,
        ps.product_feature_id,
        ps.policy_status,
        ps.server_time,
        ps.tz_offset,
        ps.apply_time,
        ps.policy_id,
        pf.product_id
    FROM tb_policy_status AS ps
        JOIN tb_product_feature_map AS pf ON ps.product_feature_id = pf.product_feature_id
        JOIN tb_product_info AS pi ON ps.node_id = pi.node_id AND pf.product_id = pi.product_id
    WHERE pf.product_id <> 'AGENT'::en_product_id_type
    UNION ALL
    SELECT ps.node_id,
        ps.product_feature_id,
        ps.policy_status,
        ps.server_time,
        ps.tz_offset,
        ps.apply_time,
        ps.policy_id,
        pf.product_id
    FROM tb_policy_status AS ps
        JOIN tb_product_feature_map AS pf ON ps.product_feature_id = pf.product_feature_id
    WHERE pf.product_id = 'AGENT'::en_product_id_type;

    COMMENT ON VIEW vw_policy_status IS '정책 상태 뷰';
    COMMENT ON COLUMN vw_policy_status.node_id IS '노드 ID';
    COMMENT ON COLUMN vw_policy_status.product_feature_id IS '제품 기능 ID';
    COMMENT ON COLUMN vw_policy_status.policy_status IS '정책 적용 상태';
    COMMENT ON COLUMN vw_policy_status.server_time IS '변경 시각';
    COMMENT ON COLUMN vw_policy_status.tz_offset IS '시간대';
    COMMENT ON COLUMN vw_policy_status.apply_time IS '적용 시각';
    COMMENT ON COLUMN vw_policy_status.policy_id IS '정책 ID';
    COMMENT ON COLUMN vw_policy_status.product_id IS '제품 ID';
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## vw_server';
------------------------------------------------------------------------------------------
DO $$
BEGIN
    CREATE OR REPLACE VIEW vw_server AS
    SELECT s.server_id,
        s.name,
        s.ip,
        s.server_key,
        s.modified_time,
        s.server_status,
        s.patch_version,
        s.current_version,
        s.public_ip
    FROM tb_server s;
    COMMENT ON VIEW vw_server IS '서버 뷰';
    COMMENT ON COLUMN vw_server.server_id IS '서버 ID';
    COMMENT ON COLUMN vw_server.name IS '이름';
    COMMENT ON COLUMN vw_server.ip IS 'IP';
    COMMENT ON COLUMN vw_server.server_key IS '서버 키';
    COMMENT ON COLUMN vw_server.modified_time IS '변경 시각';
    COMMENT ON COLUMN vw_server.server_status IS '서버 상태';
    COMMENT ON COLUMN vw_server.patch_version IS '패치 버전';
    COMMENT ON COLUMN vw_server.current_version IS '현재 버전';
    COMMENT ON COLUMN vw_server.public_ip IS 'NAT 외부 IP';
END $$ LANGUAGE 'plpgsql';
------------------------------------------------------------------------------------------
select '## vw_service';
------------------------------------------------------------------------------------------
DO $$
BEGIN
    CREATE OR REPLACE VIEW vw_service AS
    SELECT s.server_id,
        s.service_type,
        s.enabled,
        s.static,
        s.service_status,
        s.modified_time
    FROM tb_service s;
    COMMENT ON VIEW vw_service IS '서비스 뷰';
    COMMENT ON COLUMN vw_service.server_id IS '서버 ID';
    COMMENT ON COLUMN vw_service.service_type IS '서비스 타입';
    COMMENT ON COLUMN vw_service.enabled IS '활성화 여부';
    COMMENT ON COLUMN vw_service.static IS '서비스 롤 고정 여부';
    COMMENT ON COLUMN vw_service.service_status IS '서비스 상태';
    COMMENT ON COLUMN vw_service.modified_time IS '변경 시각';
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## vw_task_target_status';
------------------------------------------------------------------------------------------
DO $$
BEGIN
    CREATE OR REPLACE VIEW vw_task_target_status AS
    SELECT *
    FROM tb_task_target_status;

    COMMENT ON VIEW vw_task_target_status IS '작업 대상 상태 뷰';
    COMMENT ON COLUMN vw_task_target_status.task_id IS '작업 ID';
    COMMENT ON COLUMN vw_task_target_status.instance_id IS '예약 작업 인스턴스 ID';
    COMMENT ON COLUMN vw_task_target_status.task_target_type IS '작업 대상 타입';
    COMMENT ON COLUMN vw_task_target_status.target_id IS '대상 ID';
    COMMENT ON COLUMN vw_task_target_status.task_status IS '작업 상태';
    COMMENT ON COLUMN vw_task_target_status.task_error IS '작업 에러';
    COMMENT ON COLUMN vw_task_target_status.client_time IS '클라이언트 시각';
    COMMENT ON COLUMN vw_task_target_status.tz_offset IS '시간대';
    COMMENT ON COLUMN vw_task_target_status.server_time IS '서버 시각';
    COMMENT ON COLUMN vw_task_target_status.start_time IS '작업 시작 시각';
    COMMENT ON COLUMN vw_task_target_status.task_type IS '작업 타입';
    COMMENT ON COLUMN vw_task_target_status.task_type IS '제품 ID';

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## vw_timeline';
------------------------------------------------------------------------------------------
DO $$
BEGIN
    CREATE OR REPLACE VIEW vw_timeline AS
    SELECT oltp.node_id,
        oltp.reg_date,
        oltp.group_id,
        oltp.ip,
        oltp.nt_domain,
        oltp.department,
        oltp.product_id,
        oltp.engine_version,
        oltp.engine_update_past_days,
        oltp.last_scan_time,
        v3.malware_clean_count,
        v3.malware_clean_fail_count
    FROM tb_timeline_oltp oltp
        LEFT JOIN tb_timeline_v3 v3 ON oltp.node_id = v3.node_id AND oltp.reg_date = v3.reg_date;
    COMMENT ON VIEW vw_timeline IS '타임라인';
    COMMENT ON COLUMN vw_timeline.node_id IS '노드';
    COMMENT ON COLUMN vw_timeline.reg_date IS '등록 일자';
    COMMENT ON COLUMN vw_timeline.group_id IS '그룹 ID';
    COMMENT ON COLUMN vw_timeline.ip IS 'IP';
    COMMENT ON COLUMN vw_timeline.nt_domain IS '윈도우 워크그룹';
    COMMENT ON COLUMN vw_timeline.department IS '부서';
    COMMENT ON COLUMN vw_timeline.product_id IS '제품 ID';
    COMMENT ON COLUMN vw_timeline.engine_version IS '엔진 버전';
    COMMENT ON COLUMN vw_timeline.engine_update_past_days IS '엔진 업데이트 지난 일수';
    COMMENT ON COLUMN vw_timeline.last_scan_time IS '수동 검사 시각';
    COMMENT ON COLUMN vw_timeline.malware_clean_count IS '악성코드 치료 개수';
    COMMENT ON COLUMN vw_timeline.malware_clean_fail_count IS '악성코드 치료 실패 개수';
END $$ LANGUAGE 'plpgsql';


------------------------------------------------------------------------------------------
select '## vw_user';
------------------------------------------------------------------------------------------
DO $$
BEGIN
    CREATE OR REPLACE VIEW vw_user AS
    SELECT *
    FROM tb_user;

    COMMENT ON VIEW vw_user IS '사용자 뷰';
    COMMENT ON COLUMN vw_user.node_id IS '노드 ID';
    COMMENT ON COLUMN vw_user.name IS '사용자명';
    COMMENT ON COLUMN vw_user.department IS '부서';
    COMMENT ON COLUMN vw_user.phone IS '전화번호';
    COMMENT ON COLUMN vw_user.email IS '이메일';
    COMMENT ON COLUMN vw_user.empno IS '사번';
    COMMENT ON COLUMN vw_user.modified_by_admin IS '관리자에 의한 변경 여부';
END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## vw_v3_status';
------------------------------------------------------------------------------------------
DO $$
BEGIN
    CREATE OR REPLACE VIEW vw_v3_status AS
    SELECT v3.*
    FROM tb_v3_status AS v3
    JOIN tb_product_info AS pi ON v3.node_id = pi.node_id AND v3.product_id = pi.product_id;

    COMMENT ON VIEW vw_v3_status IS 'V3 상태 뷰';
    COMMENT ON COLUMN vw_v3_status.node_id IS '노드 ID';
    COMMENT ON COLUMN vw_v3_status.product_id IS '제품 ID';
    COMMENT ON COLUMN vw_v3_status.product_version IS '제품 버전';
    COMMENT ON COLUMN vw_v3_status.engine_version IS '엔진 버전';
    COMMENT ON COLUMN vw_v3_status.license_no IS '라이선스 번호';
    COMMENT ON COLUMN vw_v3_status.license_user IS '라이선스 사용자';
    COMMENT ON COLUMN vw_v3_status.license_org IS '라이선스 조직';
    COMMENT ON COLUMN vw_v3_status.server_time IS '변경 시각';
    COMMENT ON COLUMN vw_v3_status.realtime_status IS '실시간 감시 사용 여부';
    COMMENT ON COLUMN vw_v3_status.engine_update_time IS '엔진 업데이트 시각';
    COMMENT ON COLUMN vw_v3_status.last_scan_time IS '수동 검사 시각';
    COMMENT ON COLUMN vw_v3_status.tz_offset IS '시간대';
    COMMENT ON COLUMN vw_v3_status.client_time IS '클라이언트 시각';
    COMMENT ON COLUMN vw_v3_status.integrity_status IS '정합성 상태';
    COMMENT ON COLUMN vw_v3_status.engine_type IS '엔진 타입';
    COMMENT ON COLUMN vw_v3_status.obj_id IS 'MongoDB object ID';
    COMMENT ON COLUMN vw_v3_status.install_time IS '설치 시각';
END $$ LANGUAGE 'plpgsql';


------------------------------------------------------------------------------------------
select '## vw_ac_status';
------------------------------------------------------------------------------------------
DO $$
BEGIN
    CREATE OR REPLACE VIEW vw_ac_status AS
    SELECT ac.*
    FROM tb_ac_status AS ac
    JOIN tb_product_info AS pi ON ac.node_id = pi.node_id AND ac.product_id = pi.product_id;

    COMMENT ON VIEW vw_ac_status IS 'AC 상태 뷰';
    COMMENT ON COLUMN vw_ac_status.node_id IS '노드 ID';
    COMMENT ON COLUMN vw_ac_status.product_id IS '제품 ID';
    COMMENT ON COLUMN vw_ac_status.product_version IS '제품 버전';
    COMMENT ON COLUMN vw_ac_status.service_status IS '서비스 상태 (ON/OFF)';
    COMMENT ON COLUMN vw_ac_status.license_no IS '라이선스 번호';
    COMMENT ON COLUMN vw_ac_status.license_user IS '라이선스 사용자';
    COMMENT ON COLUMN vw_ac_status.license_org IS '라이선스 조직';
    COMMENT ON COLUMN vw_ac_status.integrity_status IS '정합성 상태';
    COMMENT ON COLUMN vw_ac_status.install_time IS '설치 시각';
    COMMENT ON COLUMN vw_ac_status.client_time IS '클라이언트 시각';
    COMMENT ON COLUMN vw_ac_status.tz_offset IS '시간대';
    COMMENT ON COLUMN vw_ac_status.server_time IS '변경 시각';
    COMMENT ON COLUMN vw_ac_status.engine_state IS '엔진 초기화 성공여부';
    COMMENT ON COLUMN vw_ac_status.im_enable IS 'IM 사용 여부';
    COMMENT ON COLUMN vw_ac_status.im_enable_real_time IS 'IM 실시간 검사';
    COMMENT ON COLUMN vw_ac_status.im_engine_version IS 'IM 엔진 버전';

END $$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------
select '## vw_hips_status';
------------------------------------------------------------------------------------------
DO $$
BEGIN
    CREATE OR REPLACE VIEW vw_hips_status AS
    SELECT hips.*
    FROM tb_hips_status AS hips
    JOIN tb_product_info AS pi ON hips.node_id = pi.node_id AND hips.product_id = pi.product_id;

    COMMENT ON VIEW vw_hips_status IS 'HIPS 상태 뷰';
    COMMENT ON COLUMN vw_hips_status.node_id IS '노드 ID';
    COMMENT ON COLUMN vw_hips_status.product_id IS '제품 ID';
    COMMENT ON COLUMN vw_hips_status.product_version IS '제품 버전';
    COMMENT ON COLUMN vw_hips_status.service_status IS '서비스 상태 (ON/OFF)';
    COMMENT ON COLUMN vw_hips_status.license_no IS '라이선스 번호';
    COMMENT ON COLUMN vw_hips_status.license_user IS '라이선스 사용자';
    COMMENT ON COLUMN vw_hips_status.license_org IS '라이선스 조직';
    COMMENT ON COLUMN vw_hips_status.integrity_status IS '정합성 상태';
    COMMENT ON COLUMN vw_hips_status.install_time IS '설치 시각';
    COMMENT ON COLUMN vw_hips_status.client_time IS '클라이언트 시각';
    COMMENT ON COLUMN vw_hips_status.tz_offset IS '시간대';
    COMMENT ON COLUMN vw_hips_status.server_time IS '변경 시각';

END $$ LANGUAGE 'plpgsql';