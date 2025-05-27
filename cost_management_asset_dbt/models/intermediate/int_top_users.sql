SELECT 
    user_name,
    execution_time,
    warehouse_size,
    start_time
FROM {{ ref('stg_query_history') }}