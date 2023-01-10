SELECT DISTINCT 
    date, 
    value AS active_customers
FROM {{ var('profitwell_schema') }}.{{ var('active_customers_tbl') }}