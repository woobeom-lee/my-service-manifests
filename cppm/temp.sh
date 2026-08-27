cd /home/registry/my-service-manifests
 
# 1. 클러스터에 띄워진 진짜 서비스들의 targetPort를 훔쳐와서 가짜 서비스에 덮어씌웁니다!
for svc in mongo-mongos pgbouncer-eppoltp postgres-eppoltp redis kafka; do
    TARGET=$(kubectl get svc epp-$svc -n k8s-cppm -o jsonpath='{.spec.ports[0].targetPort}')
    if [ ! -z "$TARGET" ]; then
        find cppm/templates -type f -name "*cpp-${svc}*.yaml" -exec sed -i "s/targetPort:.*/targetPort: $TARGET/g" {} \;
        echo "✅ cpp-$svc 의 targetPort를 진짜 목적지($TARGET)로 완벽하게 교정했습니다!"
    fi
done
 
# 2. 깃허브로 전송!
git add .
git commit -m "fix: dynamically map accurate targetPorts for cpp alias services"
git push origin main
