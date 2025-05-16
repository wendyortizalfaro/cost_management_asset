{{ config(
    materialized='incremental'
) }}

SELECT 
    warehouse_name,
    start_time,
    end_time,
    credits_used,
    credits_used_compute,
    credits_used_cloud_services
FROM {{ source('account_usage', 'warehouse_metering_history') }}
{% if is_incremental() %}
WHERE start_time > (SELECT MAX(start_time) FROM {{ this }})
{% endif %}
