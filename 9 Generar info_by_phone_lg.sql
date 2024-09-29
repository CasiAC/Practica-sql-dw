SELECT 
    id.ivr_id,
    CASE 
        WHEN STARTS_WITH(id.vdn_label, 'ATC') THEN 'FRONT'
        WHEN STARTS_WITH(id.vdn_label, 'TECH') THEN 'TECH'
        WHEN STARTS_WITH(id.vdn_label, 'ABSORPTION') THEN 'ABSORPTION'
        ELSE 'RESTO' 
    END AS vdn_aggregation
    ,MAX(NULLIF(id.document_type,'UNKNOWN')) AS document_type
    ,MAX(NULLIF(id.document_identification,'UNKNOWN')) AS document_identification
    ,MAX(NULLIF(customer_phone, 'UNKNOWN')) AS customer_phone
    ,MAX(NULLIF(id.billing_account_id, 'UNKNOWN')) AS billing_account_id
    ,CASE 
        WHEN id.module_aggregation LIKE '%AVERIA_MASIVA%' THEN 1
        ELSE 0
    END AS masiva_lg
    ,CASE
        WHEN MAX(CASE 
                 WHEN id.step_name = 'CUSTOMERINFOBYPHONE.TX' AND id.step_result = 'OK' 
                 THEN 1 ELSE 0 
             END) = 1 THEN 1
        ELSE 0
    END AS info_by_phone_lg
   FROM `annular-fold-436407-e0.keepcoding.ivr_detaill` AS id
   GROUP BY
        id.ivr_id
        ,vdn_aggregation
        ,masiva_lg;