SELECT DISTINCT 
    date, 
    value AS downgraded_customers
FROM {{ var('profitwell_schema') }}.{{ var('downgraded_customers_tbl') }}
