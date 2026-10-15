cd /home/registry/my-service-manifests/cppm
 
# 1. tomcat-console-deployment.yaml 전체 덮어쓰기 (로그 폴더 및 심볼릭 링크 보장 포함)
cat << 'EOF' > /home/registry/my-service-manifests/cppm/templates/4-web/tomcat-console-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: tomcat-console
  namespace: {{ .Release.Namespace }}
  labels:
    app: tomcat-console
spec:
  replicas: 1
  strategy:
    type: Recreate
  selector:
    matchLabels:
      app: tomcat-console
  template:
    metadata:
      labels:
        app: tomcat-console
    spec:
      hostNetwork: true
      dnsPolicy: ClusterFirstWithHostNet
      hostname: cpp-tomcat-console
      hostAliases:
        - ip: {{ .Values.global.masterIp | quote }}
          hostnames:
            - "epp-postgres-eppoltp"
            - "epp-mgr"
            - "cpp-tomcat-auth"
            - "cpp-tomcat-console"
            - "host.docker.internal"
      nodeSelector:
        kubernetes.io/hostname: {{ .Values.global.nodeName | quote }}
      tolerations:
        - operator: "Exists"
          effect: "NoSchedule"
      initContainers:
        - name: init-link
          image: "{{ .Values.global.imageRegistry }}/cpp-platform:{{ .Values.global.imageTag }}"
          imagePullPolicy: IfNotPresent
          securityContext:
            runAsUser: 0
            privileged: true
          command:
            - "/bin/bash"
            - "-c"
            - |
              echo "Starting AhnLab setup..."
              bash /opt/ahnlab/cpp/bin/setting/install_link.sh || true
              mkdir -p /permanent/log/console
              rm -rf /opt/ahnlab/cpp/log
              ln -snf /permanent/log /opt/ahnlab/cpp/log
              echo "Fixing permissions for ALL 22 mounted paths..."
              mkdir -p /opt/repo /new /permanent /nosql /database /tmp /var/log /home /var/run/postgresql
              chown -R 2500:2500 /opt/ahnlab /permanent /nosql /tmp /var/log /home /opt/repo /new || true
          volumeMounts:
            - name: vol-docker-sock
              mountPath: /var/run/docker.sock
            {{- include "cppm.commonVolumeMounts" . | nindent 12 }}
      containers:
        - name: tomcat-console
          image: "{{ .Values.global.imageRegistry }}/cpp-platform:{{ .Values.global.imageTag }}"
          imagePullPolicy: IfNotPresent
          command: ["/bin/bash", "/opt/ahnlab/cpp/cmd/epp-tomcat-console.sh"]
          securityContext:
            runAsUser: 0
            privileged: true
          resources:
            requests:
              memory: "256Mi"
            limits:
              memory: "1024Mi"
          ports:
            - containerPort: 8806
          env:
            - name: REDIS_PASSWORD
              value: "qwe123"
            - name: TZ
              value: "Asia/Seoul"
            - name: CONTAINER_NAME
              value: "cpp-tomcat-console"
            - name: DOCKER_HOST
              value: "unix:///var/run/docker.sock"
            - name: JAVA_TOOL_OPTIONS
              value: "-Xms256m -Xmx768m -Dfile.encoding=UTF-8 -Depp.storage.path=/permanent -Depp.home=/opt/ahnlab/cpp -Depp.security.key.path=/permanent/etc/config/site.key -Dahnlab.epp.security.skip=true"
          volumeMounts:
            - name: vol-docker-sock
              mountPath: /var/run/docker.sock
            {{- include "cppm.commonVolumeMounts" . | nindent 12 }}
      volumes:
        - name: vol-docker-sock
          hostPath:
            path: /var/run/docker.sock
            type: Socket
        {{- include "cppm.commonVolumes" . | nindent 8 }}
---
apiVersion: v1
kind: Service
metadata:
  name: tomcat-console
  namespace: {{ .Release.Namespace }}
spec:
  ports:
    - port: 8806
      targetPort: 8806
  selector:
    app: tomcat-console
EOF
 
# 2. tools/init_schema.sh 업데이트 (cppoltp/eppoltpuser 계정 생성 및 라이선스 DONE/FINISH 보장)
cat << 'EOF' > /home/registry/my-service-manifests/cppm/tools/init_schema.sh
#!/bin/bash
echo "🚀 Postgres 방화벽 개방 및 오리지널 스키마 복원 시작..."
SCHEMA_DIR="/home/registry/my-service-manifests/cppm/tools/schema"
POD_NAME=$(kubectl get pod -l app=epp-postgres-eppoltp -n k8s-cppm -o jsonpath='{.items[0].metadata.name}')
 
echo "=== [0/5] 방화벽 개방 및 DB 계정(eppoltpuser, cppoltp) 보장 ==="
kubectl exec -i $POD_NAME -n k8s-cppm -c postgres -- /bin/bash -c '
HBA_FILE="/database/15/cppoltpdata/pg_hba.conf"
sed -i "/0.0.0.0\/0/d" "$HBA_FILE"
echo "host    all             all             0.0.0.0/0               trust" >> "$HBA_FILE"
psql -h 127.0.0.1 -p 8817 -U postgres -c "SELECT pg_reload_conf();"
psql -h 127.0.0.1 -p 8817 -U postgres -d postgres -c "CREATE ROLE eppoltpuser WITH LOGIN SUPERUSER PASSWORD '\''qweQWE123!@#'\'';" 2>/dev/null || psql -h 127.0.0.1 -p 8817 -U postgres -d postgres -c "ALTER USER eppoltpuser WITH SUPERUSER PASSWORD '\''qweQWE123!@#'\'';"
psql -h 127.0.0.1 -p 8817 -U postgres -d postgres -c "CREATE ROLE cppoltp WITH LOGIN SUPERUSER PASSWORD '\''qweQWE123!@#'\'';" 2>/dev/null || psql -h 127.0.0.1 -p 8817 -U postgres -d postgres -c "ALTER USER cppoltp WITH SUPERUSER PASSWORD '\''qweQWE123!@#'\'';"
'
 
echo "=== [1/5] 기본 DB 및 Type 초기화 ==="
kubectl exec -i $POD_NAME -n k8s-cppm -c postgres -- psql -h 127.0.0.1 -p 8817 -U postgres -d postgres < "$SCHEMA_DIR/epp_cppoltp_db_init.sql"
kubectl exec -i $POD_NAME -n k8s-cppm -c postgres -- psql -h 127.0.0.1 -p 8817 -U postgres -d cppoltp < "$SCHEMA_DIR/update_00001_0.0.0.0_1.0.0.1_cppoltp_type.sql"
 
echo "=== [2/5] Table 구조(뼈대) 생성 ==="
kubectl exec -i $POD_NAME -n k8s-cppm -c postgres -- psql -h 127.0.0.1 -p 8817 -U postgres -d cppoltp < "$SCHEMA_DIR/update_00002_0.0.0.0_1.0.0.1_cppoltp_table.sql"
kubectl exec -i $POD_NAME -n k8s-cppm -c postgres -- psql -h 127.0.0.1 -p 8817 -U postgres -d cppoltp < "$SCHEMA_DIR/spring_batch_1.0.2.1_meta_schema.sql"
 
echo "=== [3/5] 초기 필수 데이터 및 정책(Policy) 삽입 ==="
kubectl exec -i $POD_NAME -n k8s-cppm -c postgres -- psql -h 127.0.0.1 -p 8817 -U postgres -d cppoltp < "$SCHEMA_DIR/update_00003_0.0.0.0_1.0.0.1_cppoltp_data.sql"
kubectl exec -i $POD_NAME -n k8s-cppm -c postgres -- psql -h 127.0.0.1 -p 8817 -U postgres -d cppoltp < "$SCHEMA_DIR/epp_cppoltp_insert_policy.sql"
kubectl exec -i $POD_NAME -n k8s-cppm -c postgres -- psql -h 127.0.0.1 -p 8817 -U postgres -d cppoltp < "$SCHEMA_DIR/update_99997_cppoltp_cve_mapping_data.sql"
 
echo "=== [4/5] View 및 Function(고급 로직) 생성 ==="
kubectl exec -i $POD_NAME -n k8s-cppm -c postgres -- psql -h 127.0.0.1 -p 8817 -U postgres -d cppoltp < "$SCHEMA_DIR/update_99998_cppoltp_view.sql"
kubectl exec -i $POD_NAME -n k8s-cppm -c postgres -- psql -h 127.0.0.1 -p 8817 -U postgres -d cppoltp < "$SCHEMA_DIR/update_99999_cppoltp_function.sql"
 
echo "=== [5/5] 라이선스 완료 처리 및 애플리케이션 파드 재시작 ==="
kubectl exec -i $POD_NAME -n k8s-cppm -c postgres -- psql -h 127.0.0.1 -p 8817 -U postgres -d cppoltp -c "
  UPDATE tb_config SET value = 'FINISH' WHERE config_group = 'SYS_LICENSE' AND value = 'UPDATING';
  UPDATE tb_product_license SET expire_update_status = 'DONE' WHERE expire_update_status = 'UPDATING';
  UPDATE tb_multi_license SET expire_update_status = 'DONE' WHERE expire_update_status = 'UPDATING';
"
 
echo "✅ 모든 복원 완료! 앱 파드들을 재시작합니다."
kubectl delete pods -l 'app in (epp-tomcat-auth, epp-tomcat-agent, tomcat-console, epp-batch-processor, epp-scheduler, epp-syslog-sender)' -n k8s-cppm
EOF
chmod +x /home/registry/my-service-manifests/cppm/tools/init_schema.sh
 
# 3. tools/cluster-factory-reset.sh 업데이트 (/data 전체 삭제 및 필수 초기 파일 사전 준비)
cat << 'EOF' > /home/registry/my-service-manifests/cppm/tools/cluster-factory-reset.sh
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
EOF
chmod +x /home/registry/my-service-manifests/cppm/tools/cluster-factory-reset.sh
 
# 4. Helm 템플릿 문법 검증 및 Git Push
helm template . --name-template cppm --namespace k8s-cppm > /dev/null && echo "✅ Helm Template Validation Passed!"
git add -A
git commit -m "fix: support full /data wipe, multi-node portability, db roles, and native console logging"
git push origin main
