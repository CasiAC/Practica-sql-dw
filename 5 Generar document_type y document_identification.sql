SELECT 
    id.ivr_id,
    CASE 
        WHEN STARTS_WITH(id.vdn_label, 'ATC') THEN 'FRONT'
        WHEN STARTS_WITH(id.vdn_label, 'TECH') THEN 'TECH'
        WHEN STARTS_WITH(id.vdn_label, 'ABSORPTION') THEN 'ABSORPTION'
        ELSE 'RESTO' 
    END AS vdn_aggregation,
     MAX(NULLIF(id.document_type,'UNKNOWN')) AS document_type
    ,MAX(NULLIF(id.document_identification,'UNKNOWN')) AS document_identification
   FROM `annular-fold-436407-e0.keepcoding.ivr_detaill` AS id
   GROUP BY
        id.ivr_id,
        vdn_aggregation;