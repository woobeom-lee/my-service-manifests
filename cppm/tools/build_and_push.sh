#!/bin/bash
 
# 사용자 설정
GITHUB_USER="woobeom-lee"
NFS_IMAGE="ghcr.io/${GITHUB_USER}/cpp-init:latest"
DB_IMAGE="ghcr.io/${GITHUB_USER}/cpp-init4db:latest"
 
echo "==== [1/3] 빌드 시작: nfs-init ===="
docker build -t ${NFS_IMAGE} -f Dockerfile.nfs-init .
 
echo "==== [2/3] 빌드 시작: db-init ===="
docker build -t ${DB_IMAGE} -f Dockerfile.db-init .
 
echo "==== [3/3] ghcr.io 레지스트리에 푸시 ===="
# (주의: 이 스크립트를 실행하기 전에 docker login ghcr.io 가 되어있어야 합니다)
docker push ${NFS_IMAGE}
docker push ${DB_IMAGE}
 
echo "==== 작업 완료! ===="
