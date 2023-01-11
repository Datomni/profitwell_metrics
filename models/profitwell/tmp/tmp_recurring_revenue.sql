SELECT DISTINCT 
    date,
    value AS recurring_revenue
FROM {{ var('recurring_revenue_src') }}
