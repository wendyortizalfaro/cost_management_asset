SELECT 
    query_id,
    user_name,
    start_time,
    error_code,
    error_message
FROM {{ ref('int_failed_queries') }}
WHERE start_time >= DATEADD(day, -90, CURRENT_TIMESTAMP())
