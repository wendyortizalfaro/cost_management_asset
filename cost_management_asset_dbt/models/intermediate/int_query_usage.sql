
WITH queries AS (
    SELECT 
        user_name,
        warehouse_name,
        COUNT(query_id) AS total_queries,
        SUM(execution_time) AS total_execution_time,
        SUM(bytes_scanned) AS total_scanned_gb,
        AVG(execution_time) AS avg_execution_time,
        COUNT(CASE WHEN execution_status != 'SUCCESS' THEN 1 END) AS failed_queries
    FROM {{ ref('stg_query_history') }}
    GROUP BY user_name, warehouse_name
)
SELECT * FROM queries