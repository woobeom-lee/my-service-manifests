cd /home/registry/my-service-manifests
 
# 1. tomcat-console의 나침반 명단에 MongoDB, PgBouncer, Redis 등의 이름을 모두 때려 넣습니다.
sed -i '/- "host.docker.internal"/a \            - "cpp-mongo"\n            - "epp-mongo-mongos"\n            - "cpp-pgbouncer-eppoltp"\n            - "epp-pgbouncer-eppoltp"\n            - "cpp-redis"\n            - "epp-redis"' cppm/templates/3-core/*tomcat-console*.yaml
 
# 2. 깃허브로 즉시 전송!
git add .
git commit -m "fix: inject master hostAliases (mongo, redis, pgbouncer) to tomcat-console"
git push origin main
