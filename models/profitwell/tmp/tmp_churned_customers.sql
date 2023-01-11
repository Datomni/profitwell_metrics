SELECT DISTINCT 
    date, 
    value AS churned_customers
FROM {{ var('churned_customers_src') }}
