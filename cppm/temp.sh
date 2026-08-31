# 1. 깔끔한 새 폴더 3개 생성
mkdir -p templates/db-init templates/nfs-init templates/service
 
# 2. db-init 파일 4개 자동 생성
cat << 'EOF' > templates/db-init/configmap-env.yaml
{{- if .Values.dbInit.enabled -}}
{{ $psql_svc_name := .Values.postgresql.name | required ".Values.postgresql.name is required." }}
{{ $psql_port := .Values.postgresql.port | required ".Values.postgresql.port is required." }}
{{ $mongodb_svc_name := .Values.mongodb.name | required ".Values.mongodb.name is required." }}
{{ $mongodb_port := .Values.mongodb.port | required ".Values.mongodb.port is required." }}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Values.dbInit.name }}-env-cm
  namespace: {{ .Release.Namespace }}
  annotations:
    helm.sh/hook: pre-install
    argocd.argoproj.io/hook: PreSync
    argocd.argoproj.io/sync-wave: "-3"
    argocd.argoproj.io/hook-delete-policy: HookSucceeded
data:
  POSTGRESQL_URL: {{ printf "%s.%s.svc.cluster.local" $psql_svc_name .Release.Namespace }}
  POSTGRESQL_PORT: {{ $psql_port | quote }}
  MONGODB_URL: {{ printf "%s.%s.svc.cluster.local" $mongodb_svc_name .Release.Namespace }}
  MONGODB_PORT: {{ $mongodb_port | quote }}
{{- end }}
EOF
 
cat << 'EOF' > templates/db-init/configmap-file.yaml
{{- if .Values.dbInit.enabled -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Values.dbInit.name }}-file-cm
  namespace: {{ .Release.Namespace }}
  annotations:
    helm.sh/hook: pre-install
    argocd.argoproj.io/hook: PreSync
    argocd.argoproj.io/sync-wave: "-3"
    argocd.argoproj.io/hook-delete-policy: HookSucceeded
data:
  init.sh: |
    #!/bin/bash
    mkdir -p /permanent
    ln -s /nfs/etc /permanent/etc
    ln -s /permanent/etc /opt/ahnlab/cpp/etc
    bash /opt/ahnlab/cpp/bin/schema/update/saas/pre_datadb_local_schema_set.sh install
    bash /init/devops_init.sh
 
  devops_psql_init.sql: |
    update tb_server set public_ip = '{{ .Values.postgresql.user }}.acsp.ahnlab.com';
    update tb_config set value = true where config_group = 'NETWORK' and key = 'use_nat';
    update tb_config set value = 'https://acsp.ahnlab.com/gateway/user/login/csrfToken', modified_time = NOW() where config_group = 'SAAS_AUTH' and "key" = 'csrf_token_address';
    update tb_config set value = 'https://acsp.ahnlab.com/gateway/user/login', modified_time = NOW() where config_group = 'SAAS_AUTH' and "key" = 'jwt_token_address';
    update tb_config set value = '{"brokers":"{{ .Values.kafka.ncp.brokers }}","protocol":"{{ .Values.kafka.ncp.protocol }}","sasl":"{{ .Values.kafka.ncp.sasl }}","jaas_username":"{{ .Values.kafka.ncp.jaas_username }}","jaas_password":"{{ .Values.kafka.ncp.jaas_password }}"}', modified_time = NOW() where config_group = 'SAAS_KAFKA' and "key" = 'ahnlab';
 
  devops_init.sh: |
    #!/bin/bash
    PGPASSWORD=${POSTGRESQL_PASSWORD} psql -h ${POSTGRESQL_URL} -p ${POSTGRESQL_PORT} -U ${POSTGRESQL_USER} -d ${POSTGRESQL_DATABASE} < /init/devops_psql_init.sql
{{- end }}
EOF
 
cat << 'EOF' > templates/db-init/job.yaml
{{- if .Values.dbInit.enabled -}}
apiVersion: batch/v1
kind: Job
metadata:
  name: {{ .Values.dbInit.name }}
  namespace: {{ .Release.Namespace }}
  annotations:
    helm.sh/hook: pre-install
    argocd.argoproj.io/hook: PreSync
    argocd.argoproj.io/sync-wave: "-2"
    argocd.argoproj.io/hook-delete-policy: HookSucceeded
spec:
  template:
    spec:
      restartPolicy: {{ .Values.dbInit.restartPolicy | default "OnFailure" }}
      containers:
        - name: {{ .Values.dbInit.name }}
          image: {{ .Values.dbInit.repository }}:{{ .Values.dbInit.version }}
          imagePullPolicy: {{ .Values.dbInit.pullPolicy | default "IfNotPresent" }}
          envFrom:
          - secretRef:
              name: {{ .Values.dbInit.name }}-secret
          - configMapRef:
              name: {{ .Values.dbInit.name }}-env-cm
          volumeMounts:
          - name: nfs
            mountPath: /nfs
          - name: {{ .Values.dbInit.name }}-file-cm
            mountPath: /init
          command: [/bin/bash, /init/init.sh]
      volumes:
      - name: nfs
        persistentVolumeClaim:
          claimName: {{ .Release.Namespace }}-pvc
      - name: {{ .Values.dbInit.name }}-file-cm
        configMap:
          name: {{ .Values.dbInit.name }}-file-cm
          defaultMode: 0755
{{- end }}
EOF
 
cat << 'EOF' > templates/db-init/secret.yaml
{{- if .Values.dbInit.enabled -}}
apiVersion: v1
kind: Secret
metadata:
  name: {{ .Values.dbInit.name }}-secret
  namespace: {{ .Release.Namespace }}
  annotations:
    helm.sh/hook: pre-install
    argocd.argoproj.io/hook: PreSync
    argocd.argoproj.io/sync-wave: "-3"
    argocd.argoproj.io/hook-delete-policy: HookSucceeded
type: Opaque
data:
{{- if .Values.postgresql.enabled }}
  POSTGRESQL_DATABASE: {{ .Values.postgresql.database | b64enc }}
  POSTGRESQL_SCHEMA: {{ .Values.postgresql.schema | b64enc }}
  POSTGRESQL_USER: {{ .Values.postgresql.user | b64enc }}
  POSTGRESQL_PASSWORD: {{ .Values.postgresql.password | b64enc }}
{{- end }}
{{- if .Values.mongodb.enabled }}
  MONGODB_COLLECTION: {{ .Values.mongodb.collection | b64enc }}
  MONGODB_USER: {{ .Values.mongodb.user | b64enc }}
  MONGODB_PASSWORD: {{ .Values.mongodb.password | b64enc }}
{{- end }}
{{- end }}
EOF
 
# 3. nfs-init 파일 5개 자동 생성
cat << 'EOF' > templates/nfs-init/configmap-env.yaml
{{- if .Values.nfsInit.enabled -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Values.nfsInit.name }}-env-cm
  namespace: {{ .Release.Namespace }}
  annotations:
    helm.sh/hook: pre-install
    argocd.argoproj.io/hook: PreSync
    argocd.argoproj.io/sync-wave: "-5"
    argocd.argoproj.io/hook-delete-policy: HookSucceeded
data:
  INTERNAL_SERVICE: {{ .Values.internalService.name }}.{{ .Release.Namespace }}.svc.cluster.local
{{- end }}
EOF
 
cat << 'EOF' > templates/nfs-init/configmap-file.yaml
{{- if .Values.nfsInit.enabled -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Values.nfsInit.name }}-file-cm
  namespace: {{ .Release.Namespace }}
  annotations:
    helm.sh/hook: pre-install
    argocd.argoproj.io/hook: PreSync
    argocd.argoproj.io/sync-wave: "-5"
    argocd.argoproj.io/hook-delete-policy: HookSucceeded
data:
  {{- range $path, $_ := .Files.Glob "conf/*" }}
  {{ $path | trimPrefix "conf/" }}: |
    {{- tpl ($.Files.Get $path) $ | nindent 4 -}}
  {{ end }}
  init.sh: |
    #!/bin/bash
    tar xfp /data/nfs.tar -C /nfs
    for dest in /init/*; do
      file=${dest#/init/}
      if [ -f /init/$file ] && [ $file != "init.sh" ]; then
        cp -f /init/$file /tmp/$file
        /data/tools/encfile3 /nfs/etc/config/site.key /tmp/$file
        if [ ! -e /nfs/etc/config/$file ]; then
          cp -f /tmp/$file.enc /nfs/etc/config/$file
        fi
      fi
    done
    for dest in /secret/*; do
      file=${dest#/secret/}
      if [ ! -e /nfs/etc/cert/$file ]; then
        cp -f /secret/$file /nfs/etc/cert/$file
        chown 2500:2500 /nfs/etc/cert/$file
      fi
    done
    ln -s /nfs/log /opt/ahnlab/cpp/log
    ln -s /nfs/etc /opt/ahnlab/cpp/etc
    mkdir -p /opt/ahnlab/cpp/run
    /opt/ahnlab/cpp/bin/schema/update/saas/pre_cli_local_set.sh
{{- end }}
EOF
 
cat << 'EOF' > templates/nfs-init/job.yaml
{{- if .Values.nfsInit.enabled -}}
apiVersion: batch/v1
kind: Job
metadata:
  name: {{ .Values.nfsInit.name }}
  namespace: {{ .Release.Namespace }}
  annotations:
    helm.sh/hook: pre-install
    argocd.argoproj.io/hook: PreSync
    argocd.argoproj.io/sync-wave: "-4"
    argocd.argoproj.io/hook-delete-policy: HookSucceeded
spec:
  template:
    spec:
      restartPolicy: {{ .Values.nfsInit.restartPolicy | default "OnFailure" }}
      containers:
        - name: {{ .Values.nfsInit.name }}
          image: {{ .Values.nfsInit.repository }}:{{ .Values.nfsInit.version }}
          imagePullPolicy: {{ .Values.nfsInit.pullPolicy | default "IfNotPresent" }}
          envFrom:
          - configMapRef:
              name: {{ .Values.nfsInit.name }}-env-cm
          volumeMounts:
          - name: nfs
            mountPath: /nfs
          - name: {{ .Values.nfsInit.name }}-secret
            mountPath: /secret
          - name: {{ .Values.nfsInit.name }}-file-cm
            mountPath: /init
          command: [/bin/bash, /init/init.sh]
      volumes:
      - name: nfs
        persistentVolumeClaim:
          claimName: {{ .Release.Namespace }}-pvc
      - name: {{ .Values.nfsInit.name }}-secret
        secret:
          secretName: {{ .Values.nfsInit.name }}-secret
          defaultMode: 256
      - name: {{ .Values.nfsInit.name }}-file-cm
        configMap:
          name: {{ .Values.nfsInit.name }}-file-cm
          defaultMode: 0755
{{- end }}
EOF
 
cat << 'EOF' > templates/nfs-init/pvc.yaml
{{- if .Values.nfsInit.enabled -}}
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: {{ .Release.Namespace }}-pvc
  namespace: {{ .Release.Namespace }}
  annotations:
    helm.sh/hook: pre-install
    argocd.argoproj.io/hook: PreSync
    argocd.argoproj.io/sync-wave: "-5"
    argocd.argoproj.io/sync-options: Prune=false, Delete=false
    argocd.argoproj.io/compare-options: IgnoreExtraneous
spec:
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: {{ .Values.nfsInit.storage }}
  storageClassName: {{ .Values.nfsInit.storageClassName }}
{{- end }}
EOF
 
cat << 'EOF' > templates/nfs-init/secret.yaml
{{- if .Values.nfsInit.enabled -}}
apiVersion: v1
kind: Secret
metadata:
  name: {{ .Values.nfsInit.name }}-secret
  namespace: {{ .Release.Namespace }}
  annotations:
    helm.sh/hook: pre-install
    argocd.argoproj.io/hook: PreSync
    argocd.argoproj.io/sync-wave: "-5"
    argocd.argoproj.io/hook-delete-policy: HookSucceeded
type: Opaque
data:
  {{- range $path, $_ := .Files.Glob "cert/*" }}
  {{ $path | trimPrefix "cert/" }}: {{ $.Files.Get $path | b64enc }}
  {{ end }}
{{- end }}
EOF
 
# 4. service 파일 2개 자동 생성
cat << 'EOF' > templates/service/mongodb-service.yaml
{{- if .Values.mongodb.enabled -}}
apiVersion: v1
kind: Service
metadata:
  name: {{ .Values.mongodb.name }}
  namespace: {{ .Release.Namespace }}
  annotations:
    helm.sh/hook: pre-install
    argocd.argoproj.io/hook: PreSync
    argocd.argoproj.io/sync-wave: "-3"
    argocd.argoproj.io/hook-delete-policy: HookSucceeded
spec:
  type: ExternalName
  externalName: {{ .Values.mongodb.externalName }}
{{- end }}
EOF
 
cat << 'EOF' > templates/service/postgresql-service.yaml
{{- if .Values.postgresql.enabled -}}
apiVersion: v1
kind: Service
metadata:
  name: {{ .Values.postgresql.name }}
  namespace: {{ .Release.Namespace }}
  annotations:
    helm.sh/hook: pre-install
    argocd.argoproj.io/hook: PreSync
    argocd.argoproj.io/sync-wave: "-3"
    argocd.argoproj.io/hook-delete-policy: HookSucceeded
spec:
  type: ExternalName
  externalName: {{ .Values.postgresql.externalName }}
{{- end }}
EOF
 
# 5. Git 장바구니에 담고 깃허브로 Push!
git add .
git commit -m "feat: standard k8s init-cpp-saas templates applied"
git push origin main
