SELECT 
    start_time,
    service_type,
    credits_used
FROM {{ source('account_usage', 'metering_history') }}