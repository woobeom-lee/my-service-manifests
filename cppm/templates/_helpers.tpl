{{/*
공통 Volume Mounts (수십 개의 subPath를 하나로 통합)
*/}}
{{- define "cppm.commonVolumeMounts" -}}
- name: tmpfs-ahnlab
  mountPath: /opt/ahnlab
- name: vol-ahnfs-root
  mountPath: /opt/ahnlab/cpp
  subPath: opt/ahnlab/cpp
- name: vol-ahnfs-root
  mountPath: /opt/ahnlab/ems
  subPath: opt/ahnlab/ems
- name: vol-ahnfs-root
  mountPath: /nosql
  subPath: nosql
- name: vol-ahnfs-root
  mountPath: /database
  subPath: database
- name: vol-ahnfs-root
  mountPath: /tmp
  subPath: tmp
- name: vol-ahnfs-root
  mountPath: /home
  subPath: home
- name: vol-ahnfs-root
  mountPath: /etc/fstab
  subPath: etc/fstab
- name: vol-ahnfs-root
  mountPath: /etc/sudoers
  subPath: etc/sudoers
- name: vol-ahnfs-root
  mountPath: /etc/login.defs
  subPath: etc/login.defs
- name: vol-ahnfs-root
  mountPath: /etc/cron.d
  subPath: etc/cron.d
- name: vol-ahnfs-root
  mountPath: /etc/cron.daily
  subPath: etc/cron.daily
- name: vol-ahnfs-root
  mountPath: /etc/crontab
  subPath: etc/crontab
- name: vol-ahnfs-root
  mountPath: /etc/logrotate.d
  subPath: etc/logrotate.d
- name: vol-ahnfs-root
  mountPath: /etc/rsyslog.d
  subPath: etc/rsyslog.d
- name: vol-ahnfs-root
  mountPath: /var/log
  subPath: var/log
- name: vol-ahnfs-root
  mountPath: /var/run/postgresql
  subPath: var/run/postgresql
- name: vol-ahnfs-root
  mountPath: /opt/repo
  subPath: external/repo
- name: vol-ahnfs-root
  mountPath: /opt/ahnlab/install
  subPath: external/install
- name: vol-ahnfs-root
  mountPath: /opt/ahnlab/update
  subPath: external/update
- name: vol-ahnfs-root
  mountPath: /permanent
  subPath: permanent
- name: vol-ahnfs-root
  mountPath: /new
  subPath: external/new
- name: vol-host-log
  mountPath: /var/host_log
{{- end -}}
 
{{/*
공통 Volumes (물리 서버의 경로 세팅 통합)
*/}}
{{- define "cppm.commonVolumes" -}}
- name: tmpfs-ahnlab
  emptyDir:
    medium: Memory
    sizeLimit: 16Mi
- name: vol-ahnfs-root
  hostPath:
    path: {{ .Values.global.ahnfsBasePath }}
    type: Directory
- name: vol-host-log
  hostPath:
    path: /var/log
    type: Directory
{{- end -}}
