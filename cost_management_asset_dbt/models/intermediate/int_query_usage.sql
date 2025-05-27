SELECT
    user_name,
    warehouse_name,
    query_id,
    execution_time,
    bytes_scanned,
    execution_status
FROM {{ ref('stg_query_history') }}