SELECT 
    role_name,
    total_credits
FROM {{ ref('int_credits_by_role') }}
WHERE start_time >= DATEADD(day, -90, CURRENT_TIMESTAMP())

-- no start_time in intermediate