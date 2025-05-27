SELECT 
    start_time,
    service_type,
    credits_used
FROM {{ ref('stg_metering_history') }}
