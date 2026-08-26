cd /home/registry/my-service-manifests/cppm/templates/
 
# 3-core와 4-web 폴더 안의 yaml 파일 중 'containers:' 라는 글자 바로 위에 정찰병 코드를 끼워 넣습니다.
find 3-core 4-web -type f -name "*.yaml" | while read -r file; do
    # 이미 정찰병이 들어간 파일이 중복으로 들어가는 것을 방지
    if ! grep -q "cppm.wait-for-dependencies" "$file"; then
        # 컨테이너 시작 부분(containers:) 위에 initContainers 블록을 추가 (맥/리눅스 호환 sed)
        sed -i -e '/^ *containers:/i \      initContainers:\n        {{- include "cppm.wait-for-dependencies" . | nindent 8 }}' "$file"
        echo "✅ 정찰병 주입 완료: $file"
    else
        echo "⏩ 이미 정찰병이 존재함 패스: $file"
    fi
done
