SELECT 
    warehouse_name,
    DATE_TRUNC('hour', start_time) AS hour,
    MAX(avg_running) AS max_concurrent_queries
FROM {{ ref('int_warehouse_concurrency') }}
GROUP BY 1, 2
