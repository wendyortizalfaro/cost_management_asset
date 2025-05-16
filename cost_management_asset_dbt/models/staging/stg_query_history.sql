{{ 
    config(
    materialized='incremental'
) }}

SELECT 
    query_id,
    user_name,
    warehouse_name,
    warehouse_size,
    execution_status,
    start_time,
    end_time,
    total_elapsed_time,
    execution_time,
    bytes_scanned,
    error_code,
    error_message,
    role_name
FROM {{ source('account_usage', 'query_history') }}
{% if is_incremental() %}
WHERE start_time > (SELECT MAX(start_time) FROM {{ this }})
{% endif %}
-- WHERE start_time >= DATEADD(day, -90, CURRENT_TIMESTAMP())