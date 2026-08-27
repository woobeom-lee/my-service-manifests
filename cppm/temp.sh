cd /home/registry/my-service-manifests
 
find cppm/templates -type f -name "*.yaml" -exec sed -i '/- "cpp-mongo/d' {} \;
find cppm/templates -type f -name "*.yaml" -exec sed -i '/- "epp-mongo/d' {} \;
find cppm/templates -type f -name "*.yaml" -exec sed -i '/- "cpp-pgbouncer/d' {} \;
find cppm/templates -type f -name "*.yaml" -exec sed -i '/- "epp-pgbouncer/d' {} \;
find cppm/templates -type f -name "*.yaml" -exec sed -i '/- "cpp-redis/d' {} \;
find cppm/templates -type f -name "*.yaml" -exec sed -i '/- "epp-redis/d' {} \;
find cppm/templates -type f -name "*.yaml" -exec sed -i '/- "cpp-kafka/d' {} \;
find cppm/templates -type f -name "*.yaml" -exec sed -i '/- "epp-kafka/d' {} \;
 
git add .
git commit -m "fix: remove bad hostAliases preventing internal K8s DNS resolution"
git push origin main
