# 0. nfs-init Job 자체에 걸려있는 K8s의 '종료 락(Finalizer)' 강제 제거
kubectl patch job nfs-init -n k8s-cppm -p '{"metadata":{"finalizers":null}}' --type=merge
kubectl patch job db-init -n k8s-cppm -p '{"metadata":{"finalizers":null}}' --type=merge
kubectl delete job nfs-init -n k8s-cppm
kubectl delete job db-init -n k8s-cppm

# 1. 이전 nfs-init Job 강제 삭제 (혹시 남아있다면)
kubectl delete job nfs-init -n k8s-cppm --force --grace-period=0
 
# 2. PVC(요청서)의 보호 락 제거하여 삭제 통과시키기
kubectl patch pvc k8s-cppm-pvc -n k8s-cppm -p '{"metadata":{"finalizers":null}}' --type=merge
 
# 3. PV(물리 디스크)의 보호 락 제거하여 삭제 통과시키기
kubectl patch pv k8s-cppm-pv -p '{"metadata":{"finalizers":null}}' --type=merge
