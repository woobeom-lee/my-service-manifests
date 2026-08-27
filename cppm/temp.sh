kubectl get pod -n k8s-cppm | grep epp-rsyslog | awk '{print $1}' | while read pod
do
  kubectl delete pod "$pod" \
    -n k8s-cppm \
    --grace-period=0 \
    --force
done
