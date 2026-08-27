cd /home/registry/my-service-manifests
 
# 1. 지옥의 /tmp 폴더 공유 충돌 회피 (마운트 경로를 /tmp_host로 변경하여 고유 공간 확보)
sed -i 's|mountPath: /tmp|mountPath: /tmp_host|g' cppm/templates/3-core/epp-syslog-sender-deployment.yaml cppm/templates/3-core/epp-rsyslog-deployment.yaml
 
# 2. syslog-sender에게 Kafka 주소(cpp-kafka) 마저 알려주기
sed -i '/- "epp-kafka"/a \            - "cpp-kafka"' cppm/templates/3-core/epp-syslog-sender-deployment.yaml
 
# 3. 깃허브로 전송!
git add .
git commit -m "fix: isolate tmp mount to prevent file lock collision and add cpp-kafka alias"
git push origin main
