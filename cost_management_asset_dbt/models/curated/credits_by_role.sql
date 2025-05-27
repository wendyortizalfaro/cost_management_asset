SELECT 
    role_name,
    SUM(credits_used_compute + credits_used_cloud_services) AS total_credits
FROM {{ ref('int_credits') }}
GROUP BY role_name
ORDER BY total_credits DESC