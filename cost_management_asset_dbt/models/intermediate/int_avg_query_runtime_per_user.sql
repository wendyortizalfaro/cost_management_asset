SELECT 
    user_name,
    AVG(total_elapsed_time / 1000) AS avg_duration_seconds
FROM {{ ref('stg_query_history') }}
GROUP BY user_name

