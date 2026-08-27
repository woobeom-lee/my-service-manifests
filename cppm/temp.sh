cd /home/registry/my-service-manifests
 
# 1. syslog-sender (dnsPolicy 바로 아래에 나침반 완벽 주입)
F_SYS=$(find cppm/templates -name "*syslog-sender*.yaml" | head -n 1)
sed -i '/hostAliases:/,+6d' "$F_SYS" 2>/dev/null || true
sed -i '0,/dnsPolicy:.*/s//&\n      hostAliases:\n        - ip: "10.128.88.28"\n          hostnames:\n            - "cpp-pgbouncer-eppoltp"\n            - "epp-pgbouncer-eppoltp"\n            - "epp-postgres-eppoltp"/' "$F_SYS"
 
# 2. rsyslog (imagePullPolicy 바로 아래에 루트 권한 완벽 주입)
F_RSYS=$(find cppm/templates -name "*rsyslog*.yaml" -type f | grep deployment | head -n 1)
sed -i '/securityContext:/,+2d' "$F_RSYS" 2>/dev/null || true
sed -i '0,/imagePullPolicy:.*/s//&\n          securityContext:\n            runAsUser: 0\n            privileged: true/' "$F_RSYS"
 
# 3. 깃허브로 안전하게 전송!
git add .
git commit -m "fix: precise yaml injection for syslog and rsyslog"
git push origin main
