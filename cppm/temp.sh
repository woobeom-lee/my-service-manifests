# 1. 진짜 PgBouncer 서비스의 정확한 Selector 확인

kubectl get svc epp-pgbouncer-eppoltp -n k8s-cppm -o yaml | grep -A 3 "selector:"
 
# 2. 진짜 Kafka 서비스의 정확한 Selector 확인

kubectl get svc epp-kafka -n k8s-cppm -o yaml | grep -A 3 "selector:"
 
# 3. 현재 가짜 서비스들의 목적지(Endpoints)가 비어있는지 팩트 체크

kubectl get endpoints -n k8s-cppm | grep cpp-
 
cd /home/registry/my-service-manifests
 
# 1. PgBouncer 포트 교정 (6432 ➡️ 8819)

find cppm/templates -type f -exec sed -i 's/port: 6432/port: 8819/g' {} \;

find cppm/templates -type f -exec sed -i 's/targetPort: 6432/targetPort: 8819/g' {} \;
 
# 2. PostgreSQL 포트 교정 (5432 ➡️ 8817)

find cppm/templates -type f -exec sed -i 's/port: 5432/port: 8817/g' {} \;

find cppm/templates -type f -exec sed -i 's/targetPort: 5432/targetPort: 8817/g' {} \;
 
# 3. 깃허브로 강력 푸시!

git add .

git commit -m "fix: globally correct database ports for jdbc connections"

git push origin main
 
