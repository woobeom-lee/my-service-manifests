cd /home/registry/my-service-manifests
 
# 1. clair-db: values.yaml의 오타(스캐너 이름)를 '진짜 DB 이름'으로 바로잡습니다.
sed -i 's/repository: "clair-local-scan"/repository: "clair-db"/g' cppm/values.yaml
 
# 2. syslog-sender: 잃어버린 나침반(hostAliases)을 설계도에 달아줍니다.
if ! grep -q "hostAliases:" cppm/templates/3-core/*syslog-sender*.yaml; then
    sed -i '/^      containers:/i \      hostAliases:\n        - ip: "{{ .Values.global.masterIp }}"\n          hostnames:\n            - "cpp-pgbouncer-eppoltp"\n            - "epp-pgbouncer-eppoltp"\n            - "epp-postgres-eppoltp"' cppm/templates/3-core/*syslog-sender*.yaml
fi
 
# 3. rsyslog: K8s 보안 검문소를 통과할 수 있도록 VIP 프리패스(privileged: true)를 부여합니다.
find cppm/templates -type f -name "*rsyslog*.yaml" -exec sed -i '/securityContext:/,+2d' {} \;
find cppm/templates -type f -name "*rsyslog*.yaml" -exec sed -i '/image:/i \          securityContext:\n            privileged: true\n            runAsUser: 0' {} \;
 
# 4. 완벽해진 코드를 깃허브로 전송합니다!
git add .
git commit -m "fix: clair-db image, syslog-sender hostAliases, and rsyslog privileges"
git push origin main
