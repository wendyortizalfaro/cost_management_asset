{{
    config(
        materialized='incremental'
    )
}}

SELECT 
    warehouse_name,
    usage_day,
    daily_credits,
    running_time,
    avg_concurrent_queries
FROM {{ ref('int_warehouse_usage_summary') }}
WHERE 
    {% if is_incremental() %}
        usage_day > (SELECT MAX(usage_day) FROM {{ this }})
    {% else %}
        usage_day >= DATEADD(day, -90, CURRENT_DATE)
    {% endif %}

