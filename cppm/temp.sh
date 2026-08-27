cd /home/registry/my-service-manifests
 
# 1. tomcat-console 파일이 어느 폴더에 있든 자동으로 찾아서 나침반 명단을 꽂아 넣습니다.
find cppm/templates -type f -name "*tomcat-console*.yaml" -exec sed -i '/- "host.docker.internal"/a \            - "cpp-mongo"\n            - "epp-mongo-mongos"\n            - "cpp-pgbouncer-eppoltp"\n            - "epp-pgbouncer-eppoltp"\n            - "cpp-redis"\n            - "epp-redis"' {} \;
 
# 2. 깃허브로 다시 전송!
git add .
git commit -m "fix: inject master hostAliases to tomcat-console using find"
git push origin main
