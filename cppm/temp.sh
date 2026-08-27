cd /home/registry/my-service-manifests
 
# 1. 제가 주입했던 엉터리 hostAliases 찌꺼기 완벽 청소 (원상 복구)
for host in cpp-mongo cpp-mongo-mongos epp-mongo-mongos cpp-pgbouncer-eppoltp epp-pgbouncer-eppoltp cpp-redis epp-redis cpp-kafka epp-kafka; do
    find cppm/templates -type f -name "*.yaml" -exec sed -i "/- \"$host\"/d" {} \;
done
 
# 2. [핵심] 기존의 ExternalName 서비스를 ClusterIP(A-Record)로 영구 변환!
find cppm/templates -type f -name "*.yaml" -exec sed -i 's/type: ExternalName/type: ClusterIP/g' {} \;
find cppm/templates -type f -name "*.yaml" -exec sed -i 's/^[[:space:]]*externalName:[[:space:]]*"\?epp-\([^"]*\)"\?/  selector:\n    app: epp-\1/g' {} \;
 
# 3. 깃허브로 즉시 전송!
git add .
git commit -m "fix: remove bad hostAliases and convert ExternalName services to ClusterIP A-records"
git push origin main
