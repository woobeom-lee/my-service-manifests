cd /home/registry/my-service-manifests
 
# 1. clair-db 서비스의 외부 개방 포트를 8835에서 5432로 맞춰줍니다.
sed -i 's/port: 8835/port: 5432/g' cppm/templates/1-database/*clair-db*.yaml
 
# 2. 깃허브로 즉시 전송!
git add .
git commit -m "fix: change clair-db service port from 8835 to 5432 to match server config"
git push origin main
