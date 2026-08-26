cd /home/registry/my-service-manifests
 
# 1. 삐뚤어진 initContainers: 를 찾아서 정확하게 스페이스바 6칸으로 교정합니다.
find cppm/templates -type f -name "*.yaml" -exec sed -i 's/^[ \t]*initContainers:/      initContainers:/g' {} \;
 
# 2. 교정된 결과를 깃허브에 푸시합니다!
git add .
git commit -m "fix: correct initContainers YAML indentation"
git push origin main
