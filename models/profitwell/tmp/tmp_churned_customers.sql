SELECT DISTINCT 
    date, 
    value AS churned_customers
FROM {{ var('profitwell_schema') }}.{{ var('churned_customers_tbl') }}
