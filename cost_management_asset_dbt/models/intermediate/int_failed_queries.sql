SELECT 
    query_id,
    user_name,
    start_time,
    error_code,
    error_message
FROM {{ ref('stg_query_history') }}
WHERE 
    error_message IS NOT NULL
