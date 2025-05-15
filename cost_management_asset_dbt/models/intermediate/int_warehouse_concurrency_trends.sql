SELECT 
    warehouse_name,
    DATE_TRUNC('hour', start_time) AS hour,
    MAX(avg_running) AS max_concurrent_queries
FROM {{ source('account_usage', 'warehouse_load_history') }}
GROUP BY 1, 2
