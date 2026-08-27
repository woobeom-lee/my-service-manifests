d /home/registry/my-service-manifests
 
# 1. 아까 추가했던 몽고DB 이름표 바로 밑에, 앱이 진짜로 찾는 이름(cpp-mongo-mongos)을 일괄 추가합니다!
find cppm/templates -type f -name "*.yaml" -exec sed -i '/- "epp-mongo-mongos"/a \            - "cpp-mongo-mongos"' {} \;
 
# 2. 깃허브로 즉시 전송!
git add .
git commit -m "fix: add missing cpp-mongo-mongos to hostAliases for all apps"
git push origin main
