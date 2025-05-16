SELECT 
    query_id,
    user_name,
    warehouse_name,
    warehouse_size,
    start_time,
    end_time,
    runtime_seconds,
    scanned_gb,
    warehouse_credits,
    estimated_credits
FROM {{ ref('int_query_runtime_cost') }}
WHERE start_time >= DATEADD(day, -90, CURRENT_TIMESTAMP())
