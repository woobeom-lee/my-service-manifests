cd /home/registry/my-service-manifests
 
# 1. clair-db 설계도에서 말썽을 일으키는 lifecycle 블록을 통째로 삭제합니다.
sed -i '/lifecycle:/,/clair2x-vuln-db.sql/d' cppm/templates/1-database/*clair-db*.yaml
 
# 2. 깃허브로 전송!
git add .
git commit -m "fix: remove clair-db postStartHook to prevent kubelet timeout killing"
git push origin main
