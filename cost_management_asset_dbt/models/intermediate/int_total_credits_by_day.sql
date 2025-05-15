SELECT 
    DATE_TRUNC('day', start_time) AS usage_date,
    service_type,
    SUM(credits_used) AS total_credits_used
FROM {{ source('account_usage', 'metering_history') }}
GROUP BY 1, 2
