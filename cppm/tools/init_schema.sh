#!/bin/bash
echo "🚀 Postgres 방화벽 개방 및 오리지널 스키마 복원 시작..."
SCHEMA_DIR="/home/registry/my-service-manifests/cppm/tools/schema"
POD_NAME=$(kubectl get pod -l app=epp-postgres-eppoltp -n k8s-cppm -o jsonpath='{.items[0].metadata.name}')
 
echo "=== [0/5] 가장 확실한 방화벽 강제 개방 및 Reload ==="
kubectl exec -i $POD_NAME -n k8s-cppm -c postgres -- /bin/bash -c '
HBA_FILE="/database/15/cppoltpdata/pg_hba.conf"
sed -i "/0.0.0.0\/0/d" "$HBA_FILE"
echo "host    all             all             0.0.0.0/0               trust" >> "$HBA_FILE"
psql -h 127.0.0.1 -p 8817 -U postgres -c "SELECT pg_reload_conf();"
'
 
echo "=== [1/5] 기본 DB 및 Type 초기화 (반드시 postgres DB로 연결) ==="
kubectl exec -i $POD_NAME -n k8s-cppm -c postgres -- psql -h 127.0.0.1 -p 8817 -U postgres -d postgres < "$SCHEMA_DIR/epp_cppoltp_db_init.sql"
kubectl exec -i $POD_NAME -n k8s-cppm -c postgres -- psql -h 127.0.0.1 -p 8817 -U postgres -d cppoltp < "$SCHEMA_DIR/update_00001_0.0.0.0_1.0.0.1_cppoltp_type.sql"
 
echo "=== [2/5] Table 구조(뼈대) 생성 ==="
kubectl exec -i $POD_NAME -n k8s-cppm -c postgres -- psql -h 127.0.0.1 -p 8817 -U postgres -d cppoltp < "$SCHEMA_DIR/update_00002_0.0.0.0_1.0.0.1_cppoltp_table.sql"
kubectl exec -i $POD_NAME -n k8s-cppm -c postgres -- psql -h 127.0.0.1 -p 8817 -U postgres -d cppoltp < "$SCHEMA_DIR/spring_batch_1.0.2.1_meta_schema.sql"
 
echo "=== [3/5] 초기 필수 데이터 및 정책(Policy) 삽입 ==="
kubectl exec -i $POD_NAME -n k8s-cppm -c postgres -- psql -h 127.0.0.1 -p 8817 -U postgres -d cppoltp < "$SCHEMA_DIR/update_00003_0.0.0.0_1.0.0.1_cppoltp_data.sql"
kubectl exec -i $POD_NAME -n k8s-cppm -c postgres -- psql -h 127.0.0.1 -p 8817 -U postgres -d cppoltp < "$SCHEMA_DIR/epp_cppoltp_insert_policy.sql"
kubectl exec -i $POD_NAME -n k8s-cppm -c postgres -- psql -h 127.0.0.1 -p 8817 -U postgres -d cppoltp < "$SCHEMA_DIR/update_99997_cppoltp_cve_mapping_data.sql"
 
echo "=== [4/5] View 및 Function(고급 로직) 생성 ==="
kubectl exec -i $POD_NAME -n k8s-cppm -c postgres -- psql -h 127.0.0.1 -p 8817 -U postgres -d cppoltp < "$SCHEMA_DIR/update_99998_cppoltp_view.sql"
kubectl exec -i $POD_NAME -n k8s-cppm -c postgres -- psql -h 127.0.0.1 -p 8817 -U postgres -d cppoltp < "$SCHEMA_DIR/update_99999_cppoltp_function.sql"
 
echo "=== [5/5] 라이선스 패치 및 애플리케이션 파드 재시작 ==="
kubectl exec -i $POD_NAME -n k8s-cppm -c postgres -- psql -h 127.0.0.1 -p 8817 -U postgres -d cppoltp -c "UPDATE tb_product_license SET expire_update_status = 'FINISH' WHERE expire_update_status = 'UPDATING';"
kubectl exec -i $POD_NAME -n k8s-cppm -c postgres -- psql -h 127.0.0.1 -p 8817 -U postgres -d cppoltp -c "UPDATE tb_multi_license SET expire_update_status = 'FINISH' WHERE expire_update_status = 'UPDATING';"
 
echo "✅ 모든 복원 완료! 죽어있는 앱 파드들을 깨웁니다."
kubectl delete pods -l 'app in (epp-tomcat-auth, epp-tomcat-agent, tomcat-console, epp-batch-processor, epp-scheduler, epp-syslog-sender)' -n k8s-cppm
