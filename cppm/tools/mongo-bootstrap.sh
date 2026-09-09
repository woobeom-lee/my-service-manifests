#!/bin/bash
echo "=========================================================="
echo " MongoDB Cluster Bootstrap & Auth Bypass Automation"
echo "=========================================================="
 
echo "[1/4] Disabling Authentication (Auth Bypass) for Shards..."
kubectl patch deploy epp-mongo-shardsvr -n k8s-cppm --type='json' -p='[{"op": "replace", "path": "/spec/template/spec/containers/0/command", "value": ["/usr/bin/mongod", "--shardsvr", "--replSet", "SHARD1", "--port", "8824", "--dbpath", "/nosql/data/shardsvr", "--bind_ip_all"]}]'
kubectl patch deploy epp-mongo-shardsvr2 -n k8s-cppm --type='json' -p='[{"op": "replace", "path": "/spec/template/spec/containers/0/command", "value": ["/usr/bin/mongod", "--shardsvr", "--replSet", "SHARD2", "--port", "8826", "--dbpath", "/nosql/data/shardsvr2", "--bind_ip_all"]}]'
kubectl patch deploy epp-mongo-shardsvr3 -n k8s-cppm --type='json' -p='[{"op": "replace", "path": "/spec/template/spec/containers/0/command", "value": ["/usr/bin/mongod", "--shardsvr", "--replSet", "SHARD3", "--port", "8827", "--dbpath", "/nosql/data/shardsvr3", "--bind_ip_all"]}]'
 
echo "Waiting 15 seconds for pods to restart in bypass mode..."
sleep 15
 
echo "[2/4] Initializing and Reconfiguring Replica Sets with K8s DNS..."
# Shard 1 (Already initiated locally, just reconfig)
kubectl exec -i deploy/epp-mongo-shardsvr -n k8s-cppm -- mongosh --port 8824 --quiet --eval 'var cfg = rs.conf(); cfg.members[0].host = "epp-mongo-shardsvr:8824"; rs.reconfig(cfg, {force: true});'
 
# Shard 2
kubectl exec -i deploy/epp-mongo-shardsvr2 -n k8s-cppm -- mongosh --port 8826 --quiet --eval 'rs.initiate({_id: "SHARD2", members: [{_id: 0, host: "localhost:8826"}]})'
sleep 5
kubectl exec -i deploy/epp-mongo-shardsvr2 -n k8s-cppm -- mongosh --port 8826 --quiet --eval 'var cfg = rs.conf(); cfg.members[0].host = "epp-mongo-shardsvr2:8826"; rs.reconfig(cfg, {force: true});'
 
# Shard 3
kubectl exec -i deploy/epp-mongo-shardsvr3 -n k8s-cppm -- mongosh --port 8827 --quiet --eval 'rs.initiate({_id: "SHARD3", members: [{_id: 0, host: "localhost:8827"}]})'
sleep 5
kubectl exec -i deploy/epp-mongo-shardsvr3 -n k8s-cppm -- mongosh --port 8827 --quiet --eval 'var cfg = rs.conf(); cfg.members[0].host = "epp-mongo-shardsvr3:8827"; rs.reconfig(cfg, {force: true});'
 
echo "[3/4] Restoring Original Security Scripts and Restarting Pods..."
kubectl patch deploy epp-mongo-shardsvr -n k8s-cppm --type='json' -p='[{"op": "replace", "path": "/spec/template/spec/containers/0/command", "value": ["/bin/bash", "/nosql/cmd/epp-mongo-shardsvr.sh"]}]'
kubectl patch deploy epp-mongo-shardsvr2 -n k8s-cppm --type='json' -p='[{"op": "replace", "path": "/spec/template/spec/containers/0/command", "value": ["/bin/bash", "/nosql/cmd/epp-mongo-shardsvr2.sh"]}]'
kubectl patch deploy epp-mongo-shardsvr3 -n k8s-cppm --type='json' -p='[{"op": "replace", "path": "/spec/template/spec/containers/0/command", "value": ["/bin/bash", "/nosql/cmd/epp-mongo-shardsvr3.sh"]}]'
 
kubectl delete pods -l 'app in (epp-mongo-shardsvr, epp-mongo-shardsvr2, epp-mongo-shardsvr3, epp-mongo-mongos)' -n k8s-cppm
 
echo "Waiting 30 seconds for cluster to fully stabilize with Auth enabled..."
sleep 30
 
echo "[4/4] Adding Shards to Router and Creating Admin Accounts..."
kubectl exec -i deploy/epp-mongo-mongos -n k8s-cppm -- mongosh --port 8825 --quiet --eval '
sh.addShard("SHARD1/epp-mongo-shardsvr:8824");
sh.addShard("SHARD2/epp-mongo-shardsvr2:8826");
sh.addShard("SHARD3/epp-mongo-shardsvr3:8827");
use admin;
db.createUser({user: "nosqladmin", pwd: "wkdsksRNfjrl99!!", roles: [{role: "root", db: "admin"}]});
db.createUser({user: "nosql", pwd: "wkdsksRNfjrl99!!", roles: [{role: "readWriteAnyDatabase", db: "admin"}]});
'
 
echo "=========================================================="
echo " SUCCESS! MongoDB is now fully operational on Kubernetes! "
echo "=========================================================="
