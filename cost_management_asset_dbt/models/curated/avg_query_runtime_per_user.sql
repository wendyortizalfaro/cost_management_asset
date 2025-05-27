SELECT 
    user_name,
    AVG(total_elapsed_time / 1000) AS avg_duration_seconds
FROM {{ ref('int_avg_query_runtime') }}
GROUP BY user_name

