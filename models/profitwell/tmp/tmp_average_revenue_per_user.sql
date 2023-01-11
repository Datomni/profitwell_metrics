SELECT DISTINCT 
    date,
    value AS average_revenue_per_user
FROM {{ var('average_revenue_per_user_src') }}
