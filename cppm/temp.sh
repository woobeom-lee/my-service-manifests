cd /home/registry/my-service-manifests
 
# 1. 뒤에서 일하는 4명의 핵심 일꾼들에게 마스터 나침반을 모두 주입합니다.
for app in "epp-batch-processor" "epp-scheduler" "epp-tomcat-agent" "epp-tomcat-auth"; do
    find cppm/templates -type f -name "*${app}*.yaml" -exec sed -i '/- "host.docker.internal"/a \            - "cpp-mongo"\n            - "epp-mongo-mongos"\n            - "cpp-pgbouncer-eppoltp"\n            - "epp-pgbouncer-eppoltp"\n            - "cpp-redis"\n            - "epp-redis"\n            - "cpp-kafka"\n            - "epp-kafka"' {} \;
done
 
# 2. 깃허브로 즉시 전송!
git add .
git commit -m "fix: inject all master hostAliases to agent and batch pods"
git push origin main
