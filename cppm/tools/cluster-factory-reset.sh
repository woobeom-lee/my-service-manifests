#!/bin/bash
echo "⚠️ 경고: 기존 NFS 볼륨 데이터를 모두 삭제하고 공장 초기화를 진행합니까? (y/n)"
read answer
if [ "$answer" != "y" ]; then exit 1; fi
 
echo "🧹 1. NFS 볼륨 물리 데이터 삭제 중..."
rm -rf /data/ahnfs/*
 
echo "♻️ 2. K8s 자원(Deploy, Job) 삭제 (기다리지 않고 즉시 명령만 전달)..."
kubectl delete deploy,job,statefulset --all -n k8s-cppm --wait=false
 
echo "🔥 3. 디스크를 잃고 헤매는 좀비 파드들 강제 즉결 처형..."
kubectl delete pods --all -n k8s-cppm --force --grace-period=0
 
echo "======================================================================"
echo "🛑 [행동 필요] 현장의 모든 설계도와 파드가 깔끔하게 날아갔습니다!"
echo "👉 지금 바로 ArgoCD 화면으로 가셔서 [Sync] 버튼을 꾹 눌러주세요!"
echo "ArgoCD가 동기화를 시작하고 파드들이 생겨나는 것을 눈으로 확인하신 후,"
echo "여기 터미널로 돌아와서 [Enter] 키를 누르시면 다음 단계로 넘어갑니다."
echo "======================================================================"
read -p "Sync를 누르셨다면 Enter를 쳐주세요..."
 
echo "🔍 4. DB 파드들이 완전히 기동(Ready)될 때까지 대기 (최대 5분)..."
kubectl wait --for=condition=ready pod -l app=epp-postgres-eppoltp -n k8s-cppm --timeout=300s
kubectl wait --for=condition=ready pod -l app=epp-mongo-mongos -n k8s-cppm --timeout=300s
 
echo "🚀 5. DB 기동 확인 완료! 초기 데이터 자동 주입 시작..."
cd /home/registry/my-service-manifests/cppm/tools
./mongo-bootstrap.sh
./init_schema.sh
 
echo "🎉 진정한 의미의 공장 초기화 및 자동 셋업이 완벽하게 끝났습니다!"
