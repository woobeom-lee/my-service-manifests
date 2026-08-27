cd /home/registry/my-service-manifests
 
# 1. 앱이 억지를 부려도 무조건 길을 찾을 수 있도록, 나침반(hostAliases) 명단에 'cpp-redis'를 강제로 꽂아 넣습니다.
sed -i '/- "epp-redis"/a \            - "cpp-redis"' cppm/templates/3-core/*syslog-sender*.yaml
 
# 2. 깃허브로 즉시 전송!
git add .
git commit -m "fix: force add cpp-redis to hostAliases for syslog-sender"
git push origin main
