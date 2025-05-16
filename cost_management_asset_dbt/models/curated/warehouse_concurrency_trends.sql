SELECT 
    warehouse_name,
    hour,
    max_concurrent_queries
FROM {{ ref('int_warehouse_concurrency_trends') }}
WHERE hour >= DATEADD(day, -90, CURRENT_TIMESTAMP())
