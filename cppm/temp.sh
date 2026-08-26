cd /home/registry/my-service-manifests
 
# 1. [clair-db] 엉뚱한 태그(9-16-25)를 찾지 않도록, 실제 존재하는 'latest' 태그로 강력하게 고정합니다.
sed -i 's|image:.*|image: "ghcr.io/woobeom-lee/clair-db:latest"|g' cppm/templates/1-database/*clair-db*.yaml
 
# 2. [syslog-sender] 나침반(hostAliases)이 무조건 들어가도록, 파일의 'containers:' 바로 윗줄에 강제로 꽂아 넣습니다.
sed -i '/hostAliases:/,+10d' cppm/templates/3-core/*syslog-sender*.yaml 2>/dev/null || true
sed -i '/^[[:space:]]*containers:/i \      hostAliases:\n        - ip: "10.128.88.28"\n          hostnames:\n            - "cpp-pgbouncer-eppoltp"\n            - "epp-pgbouncer-eppoltp"\n            - "epp-postgres-eppoltp"\n            - "epp-redis"\n            - "epp-kafka"' cppm/templates/3-core/*syslog-sender*.yaml
 
# 3. [rsyslog] 컨테이너 내부 계정이 무엇이든 파일을 쓸 수 있도록, 호스트 서버의 /tmp 폴더 권한을 모두에게 개방합니다.
chmod 777 /home/k8s/cpp_installer/ahnfs/tmp
 
# 4. 깃허브로 즉시 전송!
git add .
git commit -m "fix: clair-db tag, syslog-sender hostAliases, and tmp directory permissions"
git push origin main
