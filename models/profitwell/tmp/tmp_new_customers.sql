SELECT DISTINCT 
    date, 
    value AS new_customers
FROM {{ var('new_customers_src') }}
