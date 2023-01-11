SELECT DISTINCT 
    date, 
    value AS new_recurring_revenue
FROM {{ var('new_recurring_revenue_src') }}
