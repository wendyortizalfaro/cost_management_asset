SELECT 
    user_name,
    AVG(total_elapsed_time / 1000) AS avg_duration_seconds
FROM {{ source('account_usage', 'query_history') }}
GROUP BY user_name

