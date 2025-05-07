WITH raw_queries AS (
    SELECT 
        query_id, 
        user_name, 
        warehouse_name, 
        execution_status, 
        total_elapsed_time / 1000 AS execution_time_sec, 
        start_time, 
        end_time, 
        bytes_scanned / (1024 * 1024 * 1024) AS scanned_gb,
        error_message
    FROM snowflake.account_usage.query_history
    WHERE start_time >= dateadd('day', -90, current_timestamp())
)
SELECT * FROM raw_queries
