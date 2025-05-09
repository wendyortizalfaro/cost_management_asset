SELECT 
    warehouse_name,
    start_time,
    avg_running
FROM {{ source('account_usage', 'warehouse_load_history') }}