WITH queries AS (
    SELECT 
        user_name,
        warehouse_name,
        COUNT(query_id) AS total_queries,
        SUM(execution_time_sec) AS total_execution_time,
        SUM(scanned_gb) AS total_scanned_gb,
        AVG(execution_time_sec) AS avg_execution_time,
        COUNT(CASE WHEN execution_status != 'SUCCESS' THEN 1 END) AS failed_queries
    FROM {{ ref('stg_query_history') }}
    GROUP BY user_name, warehouse_name
)
SELECT * FROM queries

