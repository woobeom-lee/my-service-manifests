#!/bin/bash
 
NAMESPACE="k8s-cppm"
MONGO_DEPLOYS="epp-mongo-configsvr1 epp-mongo-configsvr2 epp-mongo-configsvr3 epp-mongo-shardsvr epp-mongo-shardsvr2 epp-mongo-shardsvr3"
MONGOD_PORTS=(8821 8822 8823 8824 8826 8827)
 
echo "=========================================================="
echo " [1/6] 기존 MongoDB 파드 중지 및 데이터 초기화..."
echo "=========================================================="
kubectl scale deploy epp-mongo-mongos epp-mongo-configsvr2 epp-mongo-configsvr3 epp-mongo-shardsvr epp-mongo-shardsvr2 epp-mongo-shardsvr3 -n $NAMESPACE --replicas=0
 
kubectl exec -i deploy/epp-mongo-configsvr1 -n $NAMESPACE -- sh -c "
  pkill -9 mongod 2>/dev/null || true
  rm -rf /nosql/data/configsvr1/* /nosql/data/configsvr2/* /nosql/data/configsvr3/*
  rm -rf /nosql/data/shardsvr/* /nosql/data/shardsvr2/* /nosql/data/shardsvr3/*
  rm -f /nosql/run/mongo-*.pid /tmp/mongodb-*.sock
" 2>/dev/null || true
 
kubectl scale deploy epp-mongo-configsvr1 -n $NAMESPACE --replicas=0
 
echo "기존 MongoDB 파드 완전 종료 대기 중..."
while kubectl get pods -n $NAMESPACE --no-headers | grep -E "epp-mongo-(configsvr|shardsvr|mongos)" | grep -qv "hosts-init"; do
  sleep 2
done
 
echo "=========================================================="
echo " [2/6] 설정/샤드 서버 기동 및 포트(8821~8824, 8826~8827) 확인..."
echo "=========================================================="
kubectl scale deploy $MONGO_DEPLOYS -n $NAMESPACE --replicas=1
 
for deploy in $MONGO_DEPLOYS; do
  kubectl rollout status deploy/$deploy -n $NAMESPACE --timeout=120s
done
 
for port in "${MONGOD_PORTS[@]}"; do
  for i in {1..30}; do
    if ss -nlt | awk '{print $4}' | grep -q ":${port}$"; then
      echo "  -> [OK] Port $port is LISTEN"
      break
    fi
    [ $i -eq 30 ] && { echo "  -> [ERROR] Port $port 미개방"; exit 1; }
    sleep 2
  done
done
 
echo "=========================================================="
echo " [3/6] CONFIG 설정 서버 레플리카 셋 초기화 및 PRIMARY 대기..."
echo "=========================================================="
kubectl exec -i deploy/epp-mongo-configsvr1 -n $NAMESPACE -- mongosh --port 8821 --quiet --eval '
  rs.initiate({
    _id: "CONFIG",
    configsvr: true,
    members: [
      {_id: 0, host: "epp-mongo-configsvr1:8821"},
      {_id: 1, host: "epp-mongo-configsvr2:8822"},
      {_id: 2, host: "epp-mongo-configsvr3:8823"}
    ]
  });
'
 
for i in {1..30}; do
  IS_MASTER=$(kubectl exec -i deploy/epp-mongo-configsvr1 -n $NAMESPACE -- mongosh --port 8821 --quiet --eval "db.hello().isWritablePrimary" 2>/dev/null)
  if [ "$IS_MASTER" == "true" ]; then
    echo "  -> [OK] CONFIG PRIMARY 선출 완료"
    break
  fi
  sleep 2
done
 
echo "=========================================================="
echo " [4/6] SHARDS 샤드 서버(SHARD1~3) 레플리카 셋 초기화..."
echo "=========================================================="
kubectl exec -i deploy/epp-mongo-shardsvr -n $NAMESPACE -- mongosh --port 8824 --quiet --eval 'rs.initiate({_id: "SHARD1", members: [{_id: 0, host: "epp-mongo-shardsvr:8824"}]});'
kubectl exec -i deploy/epp-mongo-shardsvr2 -n $NAMESPACE -- mongosh --port 8826 --quiet --eval 'rs.initiate({_id: "SHARD2", members: [{_id: 0, host: "epp-mongo-shardsvr2:8826"}]});'
kubectl exec -i deploy/epp-mongo-shardsvr3 -n $NAMESPACE -- mongosh --port 8827 --quiet --eval 'rs.initiate({_id: "SHARD3", members: [{_id: 0, host: "epp-mongo-shardsvr3:8827"}]});'
sleep 5
 
echo "=========================================================="
echo " [5/6] mongos 기동(8825) 및 초기 계정/샤드 등록..."
echo "=========================================================="
kubectl scale deploy epp-mongo-mongos -n $NAMESPACE --replicas=1
kubectl rollout status deploy/epp-mongo-mongos -n $NAMESPACE --timeout=120s
 
for i in {1..30}; do
  ss -nlt | awk '{print $4}' | grep -q ":8825$" && { echo "  -> [OK] Port 8825 is LISTEN"; break; }
  sleep 2
done
 
kubectl exec -i deploy/epp-mongo-mongos -n $NAMESPACE -- bash -c '
  source /opt/ahnlab/cpp/bin/epp_common.sh 2>/dev/null || true
  source /opt/ahnlab/cpp/bin/install/mongo/mongo_common.sh 2>/dev/null || true
 
  ADMIN_USER="${DEFAULT_NOSQL_ADMIN_USER:-eppnosqladminuser}"
  ADMIN_PASS="${DEFAULT_NOSQL_ADMIN_PASSWD:-qweQWE123!@#}"
  ADMIN_DB="${DEFAULT_NOSQL_ADMIN_DB:-admin}"
  APP_USER="${DEFAULT_NOSQL_USER:-eppnosqluser}"
  APP_PASS="${DEFAULT_NOSQL_PASSWD:-qweQWE123!@#}"
  APP_DB="${DEFAULT_NOSQL_DB:-cppnosql}"
 
  mongosh 127.0.0.1:8825/$ADMIN_DB --quiet --eval "
    db.createUser({
      user: \"$ADMIN_USER\",
      pwd: \"$ADMIN_PASS\",
      roles: [
        { role: \"root\", db: \"admin\" },
        { role: \"userAdminAnyDatabase\", db: \"admin\" },
        { role: \"dbAdminAnyDatabase\", db: \"admin\" },
        { role: \"readWriteAnyDatabase\", db: \"admin\" },
        { role: \"clusterAdmin\", db: \"admin\" }
      ]
    });
  "
 
  mongosh 127.0.0.1:8825/$ADMIN_DB -u "$ADMIN_USER" -p "$ADMIN_PASS" --authenticationDatabase "$ADMIN_DB" --quiet --eval "
    sh.addShard(\"SHARD1/epp-mongo-shardsvr:8824\");
    sh.addShard(\"SHARD2/epp-mongo-shardsvr2:8826\");
    sh.addShard(\"SHARD3/epp-mongo-shardsvr3:8827\");
    db = db.getSiblingDB(\"$APP_DB\");
    db.createUser({
      user: \"$APP_USER\",
      pwd: \"$APP_PASS\",
      roles: [
        { role: \"readWrite\", db: \"$APP_DB\" },
        { role: \"dbAdmin\", db: \"$APP_DB\" }
      ]
    });
    sh.enableSharding(\"$APP_DB\");
  "
'
 
echo "=========================================================="
echo " [6/6] PostgreSQL(8817) 및 PgBouncer(8819) 상태 동기화..."
echo "=========================================================="
kubectl exec -i deploy/epp-postgres-eppoltp -n $NAMESPACE -- chown -R 26:26 /database /var/run/postgresql
kubectl exec -i deploy/epp-pgbouncer-eppoltp -n $NAMESPACE -- sh -c "
  sed -i 's/auth_type = .*/auth_type = trust/g' /opt/ahnlab/cpp/service/pgbouncer/conf/pgbouncer-cppoltp.cfg
  grep -q '\"eppoltpuser\"' /opt/ahnlab/cpp/service/pgbouncer/conf/userlist.txt || echo '\"eppoltpuser\" \"\"' >> /opt/ahnlab/cpp/service/pgbouncer/conf/userlist.txt
  grep -q '\"cppoltp\"' /opt/ahnlab/cpp/service/pgbouncer/conf/userlist.txt || echo '\"cppoltp\" \"\"' >> /opt/ahnlab/cpp/service/pgbouncer/conf/userlist.txt
  killall -HUP pgbouncer 2>/dev/null || true
"
 
echo "----------------------------------------------------------"
ss -nltp | grep -E ':(8817|8819|882[1-7])\b'
echo "----------------------------------------------------------"
echo "✅ 모든 DB 부트스트랩 완료! 이제 CLI에서 init을 실행해 주십시오."
