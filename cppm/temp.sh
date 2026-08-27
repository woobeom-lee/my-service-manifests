cd /home/registry/my-service-manifests
 
# 1. 현재 수정된 파일 상태 확인 (빨간 글씨로 수정된 파일들이 보여야 정상입니다)
git status
 
# 2. 수정한 파일들을 모두 장바구니에 담고 깃허브로 강력하게 쏴줍니다!
git add .
git commit -m "fix: apply ClusterIP and accurate ports to all cpp alias services"
git push origin main
