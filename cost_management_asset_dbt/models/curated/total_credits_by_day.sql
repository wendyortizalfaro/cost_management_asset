SELECT 
    usage_date,
    service_type,
    total_credits_used
FROM {{ ref('int_total_credits_by_day') }}
WHERE usage_date >= DATEADD(day, -90, CURRENT_DATE)
