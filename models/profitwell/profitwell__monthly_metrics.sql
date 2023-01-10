-- ARPU
WITH average_revenue_per_user_tmp AS (
    SELECT date,
        average_revenue_per_user
    FROM {{ ref('tmp_average_revenue_per_user') }}
),

-- NRR
net_revenue_retention_tmp AS (
    SELECT date,
        (rr.recurring_revenue - crr.churned_recurring_revenue)/rr.recurring_revenue AS net_revenue_retention
    FROM {{ ref('tmp_recurring_revenue') }} rr
    JOIN {{ ref('tmp_churned_recurring_revenue') }} crr
    USING (date)
),

net_revenue_retention_agg AS (
    SELECT DATE_TRUNC(date, MONTH) AS date,
        AVG(net_revenue_retention) AS net_revenue_retention
    FROM net_revenue_retention_tmp
    GROUP BY date
),

-- MRR Growth
recurring_revenue_tmp AS (
    SELECT date,
        recurring_revenue,
        ROW_NUMBER() OVER (PARTITION BY DATE_TRUNC(date, MONTH) ORDER BY date DESC) AS row_num
    FROM {{ ref('tmp_recurring_revenue') }}
),

recurring_revenue_agg AS (
    SELECT DATE_TRUNC(date, MONTH) AS date,
        (recurring_revenue - LAG(recurring_revenue) OVER (ORDER BY date ASC) ) / LAG(recurring_revenue) OVER (ORDER BY date ASC) AS mrr_growth
    FROM recurring_revenue_tmp
    WHERE row_num = 1)

SELECT 
    date,
    arput.average_revenue_per_user,
    nrra.net_revenue_retention,
    rra.mrr_growth
FROM 
    average_revenue_per_user_tmp arput
FULL OUTER JOIN 
    net_revenue_retention_agg nrra USING (date)
FULL OUTER JOIN
    recurring_revenue_agg rra USING (date)
