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
    ,CASE
        WHEN MAX(CASE 
                 WHEN id.step_name = 'CUSTOMERINFOBYDNI.TX' AND id.step_result = 'OK' 
                 THEN 1 ELSE 0 
             END) = 1 THEN 1
        ELSE 0
    END AS info_by_dni_lg
    ,id.start_date
    ,id.phone_number
    ,CASE 
        WHEN LAG(id.start_date) OVER (PARTITION BY id.phone_number ORDER BY id.start_date) >= id.start_date - INTERVAL 1 DAY 
        THEN 1 
        ELSE 0 
        END AS repeated_phone_24H
    ,CASE
        WHEN LEAD(id.start_date) OVER (PARTITION BY id.phone_number ORDER BY id.start_date) <= id.start_date + INTERVAL 1 DAY 
        THEN 1 
        ELSE 0 
        END AS cause_recall_phone_24H
   FROM `annular-fold-436407-e0.keepcoding.ivr_detaill` AS id
   GROUP BY
        id.ivr_id
        ,id.phone_number
        ,vdn_aggregation
        ,masiva_lg
        ,id.start_date;