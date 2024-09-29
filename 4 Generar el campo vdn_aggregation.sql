SELECT 
    id.ivr_id,
    CASE 
        WHEN STARTS_WITH(id.vdn_label, 'ATC') THEN 'FRONT'
        WHEN STARTS_WITH(id.vdn_label, 'TECH') THEN 'TECH'
        WHEN STARTS_WITH(id.vdn_label, 'ABSORPTION') THEN 'ABSORPTION'
        ELSE 'RESTO' 
    END AS vdn_aggregation
FROM `keepcoding.ivr_detaill` AS id;