#!/bin/bash
echo "🚀 Postgres 오리지널 스키마 및 초기 데이터 복원 시작..."
SCHEMA_DIR="/home/registry/my-service-manifests/cppm/tools/schema"
POD_NAME=$(kubectl get pod -l app=epp-postgres-eppoltp -n k8s-cppm -o jsonpath='{.items[0].metadata.name}')
 
kubectl exec -i $POD_NAME -n k8s-cppm -c postgres -- psql -h 127.0.0.1 -p 8817 -U postgres -d cppoltp < "$SCHEMA_DIR/epp_cppoltp_db_init.sql"
kubectl exec -i $POD_NAME -n k8s-cppm -c postgres -- psql -h 127.0.0.1 -p 8817 -U postgres -d cppoltp < "$SCHEMA_DIR/update_00001_0.0.0.0_1.0.0.1_cppoltp_type.sql"
kubectl exec -i $POD_NAME -n k8s-cppm -c postgres -- psql -h 127.0.0.1 -p 8817 -U postgres -d cppoltp < "$SCHEMA_DIR/update_00002_0.0.0.0_1.0.0.1_cppoltp_table.sql"
kubectl exec -i $POD_NAME -n k8s-cppm -c postgres -- psql -h 127.0.0.1 -p 8817 -U postgres -d cppoltp < "$SCHEMA_DIR/spring_batch_1.0.2.1_meta_schema.sql"
kubectl exec -i $POD_NAME -n k8s-cppm -c postgres -- psql -h 127.0.0.1 -p 8817 -U postgres -d cppoltp < "$SCHEMA_DIR/update_00003_0.0.0.0_1.0.0.1_cppoltp_data.sql"
kubectl exec -i $POD_NAME -n k8s-cppm -c postgres -- psql -h 127.0.0.1 -p 8817 -U postgres -d cppoltp < "$SCHEMA_DIR/epp_cppoltp_insert_policy.sql"
kubectl exec -i $POD_NAME -n k8s-cppm -c postgres -- psql -h 127.0.0.1 -p 8817 -U postgres -d cppoltp < "$SCHEMA_DIR/update_99997_cppoltp_cve_mapping_data.sql"
kubectl exec -i $POD_NAME -n k8s-cppm -c postgres -- psql -h 127.0.0.1 -p 8817 -U postgres -d cppoltp < "$SCHEMA_DIR/update_99998_cppoltp_view.sql"
kubectl exec -i $POD_NAME -n k8s-cppm -c postgres -- psql -h 127.0.0.1 -p 8817 -U postgres -d cppoltp < "$SCHEMA_DIR/update_99999_cppoltp_function.sql"
 
echo "✅ Postgres 복원 완료! 죽어있는 앱 파드들을 재시작합니다."
kubectl delete pods -l 'app in (epp-tomcat-auth, epp-tomcat-agent, tomcat-console, epp-batch-processor, epp-scheduler, epp-syslog-sender)' -n k8s-cppm
