SELECT DISTINCT 
    date, 
    value AS downgraded_customers
FROM {{ var('downgraded_customers_src') }}
