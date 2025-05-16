SELECT 
    warehouse_name,
    DATE_TRUNC('day', start_time) AS usage_day,
    SUM(credits_used) AS daily_credits,
    DATEDIFF('HOUR', start_time, end_time) AS running_time,
    AVG(DATEDIFF('HOUR', start_time, end_time)) AS avg_concurrent_queries
FROM {{ ref('stg_warehouse_metering_history') }}
GROUP BY 1, 2, 4
