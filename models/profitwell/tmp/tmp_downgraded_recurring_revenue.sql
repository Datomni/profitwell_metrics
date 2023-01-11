SELECT DISTINCT 
    date,
    (value * -1) AS downgraded_recurring_revenue
FROM {{ var('downgraded_recurring_revenue_src') }} 
