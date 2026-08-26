# 1. 차트 템플릿 폴더 최상위로 이동 (경로 확인 필수!)
cd /home/registry/my-service-manifests/cppm/templates/
 
# 2. 아래 명령어를 통째로 복사해서 실행하세요 (27개 파일 일괄 수정)
find . -type f -name "*.yaml" | while read -r file; do
    # 1. 네임스페이스 하드코딩 제거 (k8s-cppm -> {{ .Release.Namespace }})
    sed -i 's/namespace: k8s-cppm/namespace: {{ .Release.Namespace }}/g' "$file"
    # 2. 과거 이미지 하드코딩(cpp-platform, cpp-eureka 등) 제거 후 헬름 변수로 치환
    sed -i 's/image: "cpp-platform:.*"/image: "{{ .Values.global.imageRegistry }}\/cpp-platform:{{ .Values.global.imageTag }}"/g' "$file"
    sed -i 's/image: "cpp-eureka-gateway:.*"/image: "{{ .Values.global.imageRegistry }}\/cpp-eureka-gateway:{{ .Values.global.imageTag }}"/g' "$file"
    sed -i 's/image: "cpp-eureka-server:.*"/image: "{{ .Values.global.imageRegistry }}\/cpp-eureka-server:{{ .Values.global.imageTag }}"/g' "$file"
    # 3. 호스트 볼륨 경로 하드코딩 제거 (ahnfs 경로 변수화)
    sed -i 's/path: \/home\/k8s\/cpp_installer\/ahnfs/path: {{ .Values.global.hostPathBase }}/g' "$file"
    echo "✅ 헬름 표준 변환 완료: $file"
done
