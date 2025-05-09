WITH top_users AS (
    SELECT 
        user_name,
        (execution_time / 1000) / 3600 * 
        DECODE(warehouse_size, 
            'X-Small', 1, 'Small', 2, 'Medium', 4, 'Large', 8,
            'X-Large', 16, '2X-Large', 32, '3X-Large', 64, 
            '4X-Large', 128, '5X-Large', 256, '6X-Large', 512
        ) AS estimated_credits
    FROM {{ ref('stg_query_history') }}
    WHERE start_time >= DATEADD(DAY, -30, CURRENT_DATE)
    AND warehouse_size IS NOT NULL
)

SELECT 
    user_name,
    ROUND(SUM(estimated_credits), 2) AS total_credits
FROM top_users
GROUP BY user_name
ORDER BY total_credits DESC;