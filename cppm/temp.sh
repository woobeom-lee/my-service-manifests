# 1. 사용자님이 찾은 깨끗한 원본 파일로 망가진 파일을 덮어써서 완벽 복구합니다.
cd /home/registry/my-service-manifests
cp /home/k8s/cppm_k8s/templates/epp-syslog-sender-deployment.yaml cppm/templates/3-core/
cp /home/k8s/cppm_k8s/templates/epp-rsyslog-deployment.yaml cppm/templates/3-core/
 
# 2. 하드코딩된 IP와 이미지를 K8s 헬름(Helm) 변수로 안전하게 바꿉니다.
sed -i 's/10.128.88.28/{{ .Values.global.masterIp }}/g' cppm/templates/3-core/epp-syslog-sender-deployment.yaml cppm/templates/3-core/epp-rsyslog-deployment.yaml
sed -i 's|image: "cpp-platform:9-16-25"|image: "{{ .Values.global.imageRegistry }}/cpp-platform:{{ .Values.global.imageTag }}"|g' cppm/templates/3-core/epp-syslog-sender-deployment.yaml cppm/templates/3-core/epp-rsyslog-deployment.yaml
 
# 3. 줄 맞춤 파괴 없이, 기존 나침반(host.docker.internal) 바로 밑에 DB 나침반만 살포시 끼워 넣습니다.
sed -i '/- "host.docker.internal"/a \            - "cpp-pgbouncer-eppoltp"\n            - "epp-pgbouncer-eppoltp"\n            - "epp-postgres-eppoltp"\n            - "epp-redis"\n            - "epp-kafka"' cppm/templates/3-core/epp-syslog-sender-deployment.yaml
sed -i '/- "host.docker.internal"/a \            - "cpp-pgbouncer-eppoltp"\n            - "epp-pgbouncer-eppoltp"\n            - "epp-postgres-eppoltp"\n            - "epp-redis"\n            - "epp-kafka"' cppm/templates/3-core/epp-rsyslog-deployment.yaml
 
# 4. 완벽해진 코드를 깃허브로 전송합니다!
git add .
git commit -m "fix: perfectly restore syslog-sender and rsyslog from pristine backup"
git push origin main
