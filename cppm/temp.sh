cd /home/registry/my-service-manifests
 
# 1. K8s 설계도의 볼륨 경로를 실제 압축이 풀리는 'permanent' 하위 경로로 영구 수정합니다.
sed -i 's|/clair/sql/clair2x-vuln-db.sql|/permanent/clair/sql/clair2x-vuln-db.sql|g' cppm/templates/1-database/*clair-db*.yaml
 
# 2. 깃허브에 완벽해진 경로를 푸시합니다!
git add .
git commit -m "fix: correct clair-db hostPath to use permanent directory"
git push origin main
