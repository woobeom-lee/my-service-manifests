1. K8s 네이티브 공장 초기화 마스터 스크립트 완성 (cluster-factory-reset.sh)
	NFS 볼륨(/data/ahnfs) 물리 데이터 삭제 및 Kubernetes 리소스(Deployment, Job) 강제 삭제 로직 구현
	ArgoCD Sync와 연동하여 찌꺼기 없는 진정한 의미의 Hard Reset(Clean State) 환경 구축
	파드 재생성 대기 및 이후 DB 부트스트랩 스크립트 자동 실행 파이프라인 완성

2. Postgres DB 방화벽 및 스키마 주입 완벽 동기화 (init_schema.sh 고도화)
	텅 빈 볼륨 기동 시 pg_hba.conf 설정 충돌(md5 vs trust) 및 비밀번호 불일치 에러 원천 차단
	DB 기동 확인 핑(Ping) 대상을 기본 postgres DB로 변경하여 깡통 상태에서도 완벽하게 방화벽(trust) 강제 개방
	방화벽 개방 -> 스키마 생성 -> 초기 데이터 주입 -> 라이선스 패치까지 100% 순차 실행 보장

3. 문지기(PgBouncer) 및 애플리케이션 파드 기동 순서 최적화
	DB 깡통 상태에서 PgBouncer가 먼저 기동되어 CrashLoopBackOff 상태로 빠지는 장애(Connection refused) 해결
	init_schema.sh 작업이 완벽히 끝난 직후, PgBouncer와 Tomcat/Batch 파드들을 일제히 재시작(delete pods)시켜 정상 연동되도록 시퀀스 수정

4. MongoDB Shard 부트스트랩 롤아웃 대기 로직 적용 (mongo-bootstrap.sh 고도화)
	공장 초기화 상태에서 Shard 1이 깡통일 때 발생하는 에러(no replset config)를 해결하기 위해 rs.initiate 로직 추가
	기존의 불안정한 sleep 대기 방식을 제거하고, K8s 순정 교체 대기 명령어(kubectl rollout status)를 적용하여 완벽하고 안전한 Auth Bypass 및 복구 달성

5. GitOps 형상 관리 최적화 및 대용량 파일 예외 처리 (.gitignore)
