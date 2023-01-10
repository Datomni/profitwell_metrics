SELECT DISTINCT 
    date,
    value AS recurring_revenue
FROM {{ var('profitwell_schema') }}.{{ var('recurring_revenue_tbl') }}
