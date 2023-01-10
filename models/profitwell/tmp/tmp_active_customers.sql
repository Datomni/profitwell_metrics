SELECT DISTINCT 
    date, 
    value AS active_customers
FROM {{ var('active_customers_src') }}
