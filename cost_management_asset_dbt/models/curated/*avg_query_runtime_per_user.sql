SELECT 
    user_name,
    avg_duration_seconds
FROM {{ ref('int_avg_query_runtime_per_user') }}
WHERE start_time >= DATEADD(day, -90, CURRENT_TIMESTAMP())
GROUP BY user_name

-- start_time is not in the int_avg_query_runtime_per_user model