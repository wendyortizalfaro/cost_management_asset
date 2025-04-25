WITH warehouse_costs AS (
    SELECT 
        warehouse_name, 
        SUM(credits_used) AS total_credits_used
    FROM snowflake.account_usage.warehouse_metering_history
    WHERE start_time >= dateadd('day', -90, current_timestamp())
    GROUP BY warehouse_name
),
query_usage AS (
    SELECT 
        user_name, 
        warehouse_name,
        total_queries,
        total_scanned_gb
    FROM {{ ref('int_query_usage') }}
)
SELECT 
    q.user_name, 
    q.warehouse_name, 
    q.total_queries,
    q.total_scanned_gb,
    w.total_credits_used,
    w.total_credits_used * 3 AS estimated_cost -- (Example: $3 per credit)
FROM query_usage q
JOIN warehouse_costs w ON q.warehouse_name = w.warehouse_name
