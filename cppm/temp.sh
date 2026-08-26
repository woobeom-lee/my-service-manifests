cd /home/registry/my-service-manifests/cppm/templates/
 
# 1. 임무가 끝난 정찰병(initContainers) 코드를 3-core, 4-web 전체 파일에서 싹 삭제합니다.
find 3-core 4-web -type f -name "*.yaml" -exec sed -i '/initContainers:/d' {} \;
find 3-core 4-web -type f -name "*.yaml" -exec sed -i '/cppm.wait-for-dependencies/d' {} \;
 
# 2. 옛날 버릇 못 고친 rsyslog 파일에 Root 권한(VIP)을 부여합니다.
find . -type f -name "*rsyslog*.yaml" | while read file; do
    if ! grep -q "runAsUser: 0" "$file"; then
        sed -i '/image:/i \          securityContext:\n            runAsUser: 0' "$file"
    fi
done
