cd /home/registry/my-service-manifests
 
# PgBouncer의 포트를 8817에서 8819로 정확하게 변경합니다!
find cppm/templates -type f -name "*cpp-pgbouncer-eppoltp*.yaml" -exec sed -i 's/port: 8817/port: 8819/g' {} \;
find cppm/templates -type f -name "*cpp-pgbouncer-eppoltp*.yaml" -exec sed -i 's/targetPort: 8817/targetPort: 8819/g' {} \;
 
# 깃허브로 전송!
git add .
git commit -m "fix: correct pgbouncer port to 8819"
git push origin main
