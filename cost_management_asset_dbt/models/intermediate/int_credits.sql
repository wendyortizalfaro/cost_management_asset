SELECT 
    qh.role_name,
    wm.credits_used_compute,
    wm.credits_used_cloud_services
FROM {{ ref('stg_query_history') }} AS qh
JOIN {{ ref('stg_warehouse_metering_history') }} AS wm
    ON qh.warehouse_name = wm.warehouse_name