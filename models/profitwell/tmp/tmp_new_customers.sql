SELECT DISTINCT 
    date, 
    value AS new_customers
FROM {{ var('profitwell_schema') }}.{{ var('new_customers_tbl') }}
