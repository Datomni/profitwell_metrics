SELECT DISTINCT 
    date, 
    value AS new_recurring_revenue
FROM {{ var('profitwell_schema') }}.{{ var('new_recurring_revenue_tbl') }}
