SELECT 
    table_catalog,
    table_schema,
    active_bytes,
    time_travel_bytes,
    failsafe_bytes
FROM {{ ref('stg_table_storage_metrics') }}
