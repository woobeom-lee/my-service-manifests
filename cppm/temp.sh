# 1. 가장 최근에 제가 드린 '망가진 커밋'을 안전하게 롤백(Revert) 하여 코드를 원상 복구합니다.
cd /home/registry/my-service-manifests
git revert HEAD --no-edit
 
# 2. 정밀 타격! 진짜 '정찰병(wait-for-dependencies)' 코드만 삭제하고, 
# 껍데기만 남은 중복 initContainers 줄을 안전하게 지워줍니다.
find cppm/templates -type f -name "*.yaml" -exec sed -i '/cppm.wait-for-dependencies/d' {} \;
find cppm/templates -type f -name "*.yaml" -exec sed -i -z 's/[ \t]*initContainers:[ \t]*\n[ \t]*containers:/\n      containers:/g' {} \;
 
# 3. 아까 롤백되면서 날아갔던 rsyslog의 루트 권한(VIP)만 다시 살포시 얹어줍니다.
find cppm/templates -type f -name "*rsyslog*.yaml" | while read file; do
    if ! grep -q "runAsUser: 0" "$file"; then
        sed -i '/image:/i \          securityContext:\n            runAsUser: 0' "$file"
    fi
done
 
# 4. 깃허브에 다시 푸시합니다!
git add .
git commit -m "fix: precisely remove wait-for-dependencies without breaking init-link"
git push origin main
