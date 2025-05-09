SELECT 
    user_name,
    AVG(total_elapsed_time / 1000) AS avg_duration_seconds
FROM {{ ref('stg_query_history') }}
WHERE start_time >= DATEADD(DAY, -30, CURRENT_DATE)
GROUP BY user_name;