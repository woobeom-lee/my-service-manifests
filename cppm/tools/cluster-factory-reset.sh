#!/bin/bash
echo "⚠️ 경고: /data 전체를 삭제하고 공장 초기화를 진행합니까? (y/n)"
read answer
if [ "$answer" != "y" ]; then exit 1; fi
 
echo "♻️ 1. K8s 자원(Deploy, Job) 삭제..."
kubectl delete deploy,job,statefulset --all -n k8s-cppm --wait=false
kubectl delete pods --all -n k8s-cppm --force --grace-period=0
 
echo "🧹 2. /data 디렉터리 완전 삭제 및 기본 마운트 뼈대 생성..."
rm -rf /data
mkdir -p /data/ahnfs/permanent/clair/sql /data/ahnfs/permanent/clair/config /data/ahnfs/permanent/log/console /data/ahnfs/etc
touch /data/ahnfs/permanent/clair/sql/clair2x-vuln-db.sql /data/ahnfs/permanent/clair/config/config.yaml
touch /data/ahnfs/etc/fstab /data/ahnfs/etc/sudoers /data/ahnfs/etc/login.defs /data/ahnfs/etc/crontab
echo "/permanent" > /data/ahnfs/.epp_storage_path
chown -R 2500:2500 /data/ahnfs
 
echo "======================================================================"
echo "🛑 [행동 필요] /data 및 모든 파드가 깔끔하게 초기화되었습니다!"
echo "👉 지금 바로 ArgoCD 화면으로 가셔서 [Sync] 버튼을 눌러주세요!"
echo "ArgoCD가 동기화를 시작하고 파드들이 생겨나는 것을 확인하신 후,"
echo "여기 터미널로 돌아와서 [Enter] 키를 누르시면 다음 단계로 넘어갑니다."
echo "======================================================================"
read -p "Sync를 누르셨다면 Enter를 쳐주세요..."
 
echo "🔍 3. DB 파드들이 완전히 기동(Ready)될 때까지 대기 (최대 5분)..."
kubectl wait --for=condition=ready pod -l app=epp-postgres-eppoltp -n k8s-cppm --timeout=300s
kubectl wait --for=condition=ready pod -l app=epp-mongo-mongos -n k8s-cppm --timeout=300s
 
echo "🚀 4. DB 기동 확인 완료! 초기 데이터 자동 주입 시작..."
cd /home/registry/my-service-manifests/cppm/tools
./mongo-bootstrap.sh
./init_schema.sh
 
echo "🎉 공장 초기화 및 자동 셋업이 완벽하게 끝났습니다!"
