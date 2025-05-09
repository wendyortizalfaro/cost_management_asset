SELECT 
    qh.role_name,
    SUM(wm.credits_used_compute + wm.credits_used_cloud_services) AS total_credits
FROM {{ ref('stg_query_history') }} AS qh
JOIN {{ ref('stg_warehouse_metering_history') }} AS wm
    ON qh.warehouse_name = wm.warehouse_name
GROUP BY qh.role_name
ORDER BY total_credits DESC;