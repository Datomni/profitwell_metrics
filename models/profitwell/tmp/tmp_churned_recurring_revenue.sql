SELECT DISTINCT 
    date,
    (value * - 1) AS churned_recurring_revenue
FROM {{ var('profitwell_schema') }}.{{ var('churned_recurring_revenue_tbl') }}
