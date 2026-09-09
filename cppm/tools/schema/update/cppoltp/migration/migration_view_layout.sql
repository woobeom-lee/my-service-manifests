-- 업데이트 수행 시에만 처리 필요.

-- CWPP-6482 제품들의 라이선스 정보를 출력하게 되면서 컬럼 명칭 변경
update tb_view_layout as A set layout = B.new_txt 
from (select "view", admin_id, replace (layout, 'LICENSE_NO','LICENSE_CODE') as new_txt from tb_view_layout where layout like '%LICENSE_NO%') as B
where A."view" = B."view" and A.admin_id = B.admin_id;