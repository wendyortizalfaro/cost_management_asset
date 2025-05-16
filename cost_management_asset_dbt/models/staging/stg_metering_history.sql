{{
    config(
        materialized='incremental'
    )
}}

SELECT 
    start_time,
    service_type,
    credits_used
FROM {{ source('account_usage', 'metering_history') }}
{% if is_incremental() %}
WHERE start_time > (SELECT MAX(start_time) FROM {{ this }})
{% endif %}
