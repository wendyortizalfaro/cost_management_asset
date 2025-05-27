SELECT 
    warehouse_name,
    start_time,
    avg_running
FROM {{ ref('stg_warehouse_load_history') }}