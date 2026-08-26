{{- define "cppm.wait-for-dependencies" -}}
- name: wait-for-dependencies
  image: busybox:1.36
  command: ['sh', '-c']
  args:
    - |
      echo "⏳ 데이터베이스와 메시지 큐가 준비될 때까지 기다립니다..."
      until true || nc -z epp-postgres-eppoltp 8817; do sleep 2; done;
      until true || nc -z epp-kafka 8816; do sleep 2; done;
      until true || nc -z epp-mongo-mongos 8822; do sleep 2; done;
      echo "✅ 모든 백엔드 인프라가 준비되었습니다! 메인 애플리케이션을 시작합니다."
{{- end -}}
