create_.epp-postgre사용의 목적은 아래 권한을 주기 위함 이다.(configmap-file.yaml은 pod의 생성시 물리적 위치에 있는 /data의 권한까지 변경 할 수없다. 그래서 수동으로 한다. 
chown -R 26:26 /data/ahnfs/database
chown -R 26:26 /data/ahnfs/var/run/postgresql

chmod -R 755 /data/ahnfs/database/cmd
chmod -R 700 /data/ahnfs/database/15

1. init_schema.sh 실행하여 data 입력 완료 후 
2. mongo-bootstrap.sh 실행

echo "tomcat-console 서비스 내부 포트 8806 로 8803 포트 연결"
kubectl port-forward svc/tomcat-console -n k8s-cppm 8803:8806 --address 0.0.0.0 &

