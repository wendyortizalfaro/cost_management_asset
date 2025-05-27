SELECT 
    warehouse_name,
    credits_used,
    start_time, 
    end_time
FROM {{ ref('stg_warehouse_metering_history') }}

