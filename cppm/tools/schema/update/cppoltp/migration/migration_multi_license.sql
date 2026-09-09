-- 업데이트 수행 시에만 처리 필요.
    
-- [CWPP-6148] tb_product_license 의 라이선스는 대표라이선스이며 tb_multi_license 테이블에 is_main_license TRUE 로 넣어준다.
    UPDATE
        tb_product_license
    SET
        version = '1.0'
    WHERE
        version IS NULL;

    UPDATE
        tb_product_license
    SET
        expire_update_status = 'FINISH'
    WHERE
        expire_date IS NOT NULL;

    UPDATE
        tb_product_license
    SET
        expire_update_status = 'READY'
    WHERE
        expire_date IS NULL;

    DELETE FROM
        tb_multi_license
    WHERE
        license_id IN (
                        SELECT
                            tml.license_id
                        FROM (
                            SELECT
                                tml.product_id AS product_id
                                , tml.license_no AS license_no
                            FROM
                                tb_multi_license tml
                            WHERE
                                tml.is_main_license = TRUE
                            
                            EXCEPT
                            
                            SELECT
                                tpl.product_id AS product_id
                                , tpl.license_no 
                            FROM
                                tb_product_license tpl 
                        ) except_data
                        INNER JOIN
                            tb_multi_license tml
                        ON
                            tml.product_id = except_data.product_id
                        AND
                            tml.license_no = except_data.license_no
                    );

    INSERT INTO tb_multi_license (
        product_id
        , license_no
        , issue_quantity 
        , version
        , is_main_license
        , expire_update_status
        , register_date
        , expire_date 
    )
    (
        SELECT
            product_id
            , license_no
            , total_quantity
            , version
            , true
            , expire_update_status 
            , service_date
            , expire_date 
        FROM
            tb_product_license tpl 
        WHERE
            license_no NOT IN (SELECT tml.license_no FROM tb_multi_license tml WHERE product_id = tpl.product_id)
    );