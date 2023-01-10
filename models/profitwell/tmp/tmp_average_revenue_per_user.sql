SELECT DISTINCT 
    date,
    value AS average_revenue_per_user
FROM {{ var('profitwell_schema') }}.{{ var('average_revenue_per_user_tbl') }}
