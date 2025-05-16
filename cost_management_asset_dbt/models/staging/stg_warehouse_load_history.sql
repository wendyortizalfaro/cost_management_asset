{{ config(
    materialized='incremental'
) }}

SELECT 
    warehouse_name,
    start_time,
    avg_running
FROM {{ source('account_usage', 'warehouse_load_history') }}
{% if is_incremental() %}
WHERE start_time > (SELECT MAX(start_time) FROM {{ this }})
{% endif %}
