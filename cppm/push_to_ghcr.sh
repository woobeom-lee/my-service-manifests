#!/bin/bash
set -e
 
# ==========================================================
# [경로 및 레지스트리 설정]
SOURCE_DIR="/home/ubuntu/cpp_installer"
AHNFS_DIR="/home/k8s/cpp_installer/ahnfs"
GHCR_PREFIX="ghcr.io/woobeom-lee"
# ==========================================================
 
echo "=========================================================="
echo "🚀 AhnLab CPPM -> GHCR 자동 푸시 스크립트 시작"
echo "=========================================================="
 
# 1. GHCR 로그인 상태 확인 (docker 명령어가 통하는지 체크)
if ! docker info > /dev/null 2>&1; then
    echo "❌ [에러] Docker 데몬이 실행 중이 아니거나 권한이 없습니다."
    exit 1
fi
 
# 이미지 처리 함수 (Load -> Tag -> Push)
process_image() {
    local img_file="$1"
    echo "📦 분석 중: $img_file"
 
    # Docker로 이미지 로드 (gzip, bzip2 자동 처리됨)
    LOAD_OUTPUT=$(docker load -i "$img_file" 2>/dev/null)
    # 로드된 이미지 이름 추출 (예: Loaded image: abis.ahnlab.com/cpp/epp-mgr:latest)
    IMAGES=$(echo "$LOAD_OUTPUT" | grep "Loaded image" | awk '{print $3}')
 
    for ORIG_IMG in $IMAGES; do
        # 복잡한 기존 이름(abis.ahnlab.com/...)에서 맨 뒤의 진짜 이름과 태그(epp-mgr:latest)만 싹둑 자르기
        CLEAN_NAME=$(echo "$ORIG_IMG" | awk -F'/' '{print $NF}')
        TARGET_IMG="${GHCR_PREFIX}/${CLEAN_NAME}"
 
        echo "  🏷️  태그 변경: $ORIG_IMG ➡️ $TARGET_IMG"
        docker tag "$ORIG_IMG" "$TARGET_IMG"
 
        echo "  🚀 GitHub로 푸시 중: $TARGET_IMG ..."
        docker push "$TARGET_IMG"
        echo "  ✅ 푸시 성공!"
    done
}
 
# 2. cpp_platform.tar 내부 이미지 처리
rm -rf /tmp/k8s_img_extract && mkdir -p /tmp/k8s_img_extract
if [ -f "${SOURCE_DIR}/cpp_platform.tar" ]; then
    echo "📂 cpp_platform.tar 압축 해제 중..."
    tar -xf "${SOURCE_DIR}/cpp_platform.tar" -C /tmp/k8s_img_extract
    for img in /tmp/k8s_img_extract/cpp_platform/image/*.tar; do 
        [ -e "$img" ] && process_image "$img"
    done
fi
 
# 3. SOURCE_DIR 내의 나머지 독립적인 tar 파일 처리
for img in "${SOURCE_DIR}"/*.tar; do 
    if [ -e "$img" ] && [[ "$img" != *"cpp_setup.tar"* && "$img" != *"cpp_platform.tar"* ]]; then
        process_image "$img"
    fi
done
 
# 4. Clair 취약점 DB 이미지 처리
for img in "${AHNFS_DIR}/permanent/clair/image/"*.tar.gz; do 
    [ -e "$img" ] && process_image "$img"
done
 
rm -rf /tmp/k8s_img_extract
 
echo "=========================================================="
echo "🎉 모든 이미지의 GHCR 업로드가 완료되었습니다!"
echo "=========================================================="
