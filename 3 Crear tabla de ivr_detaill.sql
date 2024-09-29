CREATE OR REPLACE TABLE keepcoding.ivr_detaill AS
SELECT ic.ivr_id
     , ic.phone_number
     , ic.ivr_result
     , ic.vdn_label
     , ic.start_date
     , IFNULL(ic.start_date, '9999-12-31') AS start_date_id
     , ic.end_date
     , IFNULL(ic.end_date, '9999-12-31') AS end_date_id
     , ic.total_duration
     , ic.customer_segment
     , ic.ivr_language
     , ic.steps_module
     , ic.module_aggregation
     , im.module_sequece 
     , im.module_name
     , im.module_duration
     , im.module_result
     , ist.step_sequence
     , ist.step_name
     , ist.step_result
     , ist.step_description_error
     , ist.document_type
     , ist.document_identification
     , ist.customer_phone
     , ist.billing_account_id
FROM `keepcoding.ivr_calls` AS ic
LEFT JOIN `keepcoding.ivr_modules` AS im
   ON ic.ivr_id = im.ivr_id
LEFT JOIN `keepcoding.ivr_steps` AS ist
   ON ic.ivr_id = ist.ivr_id    
ORDER BY ic.ivr_id;
    