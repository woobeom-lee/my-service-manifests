cd /home/registry/my-service-manifests/cppm
 
sed -i "s/'SYS_LICENSE', 'apply_license_response', 'UPDATING'/'SYS_LICENSE', 'apply_license_response', 'FINISH'/g" tools/schema/update_00003_0.0.0.0_1.0.0.1_cppoltp_data.sql
sed -i "s/'UPDATING'/'FINISH'/g" $(grep -l "SYS_LICENSE" tools/schema/*.sql) 2>/dev/null || true
