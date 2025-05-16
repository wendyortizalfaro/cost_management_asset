"SELECT *
FROM {{ ref('int_query_usage') }}
WHERE start_time >= DATEADD(day, -90, CURRENT_TIMESTAMP())


-- start_time not included in the select list"