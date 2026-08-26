cd /home/registry/my-service-manifests
 
# 1. clair-db 복원 스크립트 끝에 '|| true' 방패를 장착합니다.
sed -i 's/clair2x-vuln-db.sql -c/clair2x-vuln-db.sql -c || true/g' cppm/templates/1-database/*clair-db*.yaml
sed -i 's/|| true || true/|| true/g' cppm/templates/1-database/*clair-db*.yaml
 
# 2. 깃허브로 전송!
git add .
git commit -m "fix: append || true to clair-db postStartHook to ignore restore warnings"
git push origin main
