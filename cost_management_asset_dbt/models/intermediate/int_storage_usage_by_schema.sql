SELECT 
    table_catalog,
    table_schema,
    SUM(active_bytes + time_travel_bytes + failsafe_bytes) / POWER(1024, 3) AS total_storage_gb
FROM {{ source('account_usage', 'table_storage_metrics') }}
GROUP BY 1, 2