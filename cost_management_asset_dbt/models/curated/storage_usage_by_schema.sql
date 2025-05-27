SELECT 
    table_catalog,
    table_schema,
    SUM(active_bytes + time_travel_bytes + failsafe_bytes) / POWER(1024, 3) AS total_storage_gb
FROM {{ ref('int_storage_usage') }}
GROUP BY 1, 2