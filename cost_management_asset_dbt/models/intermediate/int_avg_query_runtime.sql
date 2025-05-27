SELECT 
    user_name,
    total_elapsed_time 
FROM {{ ref('stg_query_history') }}
