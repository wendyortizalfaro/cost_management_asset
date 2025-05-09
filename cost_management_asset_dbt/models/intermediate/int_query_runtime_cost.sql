SELECT 
    query_id,
    user_name,
    warehouse_name,
    warehouse_size,
    start_time,
    end_time,
    total_elapsed_time / 1000 AS runtime_seconds,
    bytes_scanned / POWER(1024, 3) AS scanned_gb,
    DECODE(warehouse_size, 
        'X-Small', 1, 
        'Small', 2, 
        'Medium', 4, 
        'Large', 8,
        'X-Large', 16, 
        '2X-Large', 32, 
        '3X-Large', 64, 
        '4X-Large', 128, 
        '5X-Large', 256, 
        '6X-Large', 512
    ) AS warehouse_credits,
    (execution_time / 1000) / 3600 * 
    DECODE(warehouse_size, 
        'X-Small', 1, 
        'Small', 2, 
        'Medium', 4, 
        'Large', 8,
        'X-Large', 16, 
        '2X-Large', 32, 
        '3X-Large', 64, 
        '4X-Large', 128, 
        '5X-Large', 256, 
        '6X-Large', 512
    ) AS estimated_credits
FROM {{ ref('stg_query_history') }}
WHERE start_time >= DATEADD(DAY, -30, CURRENT_DATE);