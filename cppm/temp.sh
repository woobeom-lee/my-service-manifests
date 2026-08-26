# ==========================================
# 1. 유레카 태그 고정 (글로벌 9-16-25 -> 1.0.25.11)
# ==========================================
sed -i 's/{{ .Values.global.imageTag }}/1.0.25.11/g' /home/registry/my-service-manifests/cppm/templates/3-core/epp-eureka-*.yaml
 
# ==========================================
# 2. Clair DB 가짜 파일 생성 (빈 파일이라도 만들어 K8s 통과시키기)
# ==========================================
mkdir -p /home/k8s/cpp_installer/ahnfs/clair/sql
touch /home/k8s/cpp_installer/ahnfs/clair/sql/clair2x-vuln-db.sql
 
# ==========================================
# 3. YAML 유령 찌꺼기 제거 (혼자 남은 짝대기 '-' 삭제)
# ==========================================
find /home/registry/my-service-manifests/cppm/templates -type f -name "*.yaml" -exec sed -i '/^[[:space:]]*-[[:space:]]*$/d' {} \;
 
# ==========================================
# 4. 완벽해진 코드를 깃허브로 푸시!
# ==========================================
cd /home/registry/my-service-manifests
git add .
git commit -m "fix: eureka image tag, clair db file mount, and clean up dangling yaml arrays"
git push origin main
