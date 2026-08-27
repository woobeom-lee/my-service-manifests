cd /home/registry/my-service-manifests
 
# 1. [syslog-sender] Spring Boot 기본 환경변수를 주입하여 Redis 목적지를 'epp-redis'로 강제 변경!
sed -i '/env:/a \            - name: SPRING_REDIS_HOST\n              value: "epp-redis"' cppm/templates/3-core/*syslog-sender*.yaml
 
# 2. [rsyslog] 구시대적 docker.sock 호출 스크립트를 버리고, K8s 방식의 직접 실행 명령어로 덮어쓰기!
sed -i 's|command: \["/bin/bash", "/opt/ahnlab/cpp/cmd/epp-rsyslog.sh"\]|command: \["/bin/bash", "-c", "rm -f /tmp/rsyslogd.pid \&\& /usr/sbin/rsyslogd -n"\]|g' cppm/templates/3-core/*rsyslog*.yaml
 
# 3. 깃허브로 전송!
git add .
git commit -m "fix: override redis host to epp-redis and bypass docker.sock for rsyslog"
git push origin main
