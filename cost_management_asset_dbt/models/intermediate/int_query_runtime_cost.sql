SELECT 
    query_id,
    user_name,
    warehouse_name,
    warehouse_size,
    start_time,
    end_time,
    total_elapsed_time,
    bytes_scanned,
    execution_time
FROM {{ ref('stg_query_history') }}