#!/bin/bash
 
# K8s 초기화를 위해 데이터를 날리고 권한을 미리 열어주는 호스트 스크립트
 
#echo "1. 기존 데이터 및 소켓 락 파일 삭제 중..."
# ⚠️ 전체를 날리면 시작 스크립트(cmd)까지 증발하므로, 가장 문제되는 DB 데이터(15)만 날립니다.
 
# 비정상 종료 시 남아있는 유령 소켓/락 파일들을 깨끗하게 청소 (포트 충돌 방지)
 
#echo "2. 기본 폴더 생성..."
#mkdir -p /data/ahnfs/database/cmd
#mkdir -p /data/ahnfs/database/15/cppoltpdata
#mkdir -p /data/ahnfs/var/run/postgresql  # <-- chown 에러 방지를 위해 추가
 
echo "3. Postgres(26번) 호스트 권한 강제 부여..."
chown -R 26:26 /data/ahnfs/database
chown -R 26:26 /data/ahnfs/var/run/postgresql


chmod -R 777 /data/ahnfs/var/run/postgresql
chmod -R 777 /data/ahnfs/database/cmd
chmod -R 777 /data/ahnfs/database/15
kubectl delete pod -l app=epp-postgres-eppoltp -n k8s-cppm --force --grace-period=0
echo "✅ 완료! "
