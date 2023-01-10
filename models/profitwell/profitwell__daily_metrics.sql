SELECT 
    date,
    COALESCE(active_customers, 0) AS active_customers,
    COALESCE(churned_customers, 0) AS churned_customers,
    COALESCE(churned_recurring_revenue, 0) AS churned_recurring_revenue,
    COALESCE(downgraded_customers, 0) AS downgraded_customers,
    COALESCE(downgraded_recurring_revenue, 0) AS downgraded_recurring_revenue,
    COALESCE(new_customers, 0) AS new_customers,
    COALESCE(new_recurring_revenue, 0) AS new_recurring_revenue,
    COALESCE(recurring_revenue, 0) AS recurring_revenue,
    COALESCE((churned_recurring_revenue/recurring_revenue), 0) AS revenue_churn_rate
FROM 
    {{ ref('tmp_active_customers') }}
FULL OUTER JOIN 
    {{ ref('tmp_churned_customers') }} USING (date)
FULL OUTER JOIN 
    {{ ref('tmp_churned_recurring_revenue') }} USING (date)
FULL OUTER JOIN 
    {{ ref('tmp_downgraded_customers') }} USING (date)
FULL OUTER JOIN 
    {{ ref('tmp_downgraded_recurring_revenue') }} USING (date)
FULL OUTER JOIN 
    {{ ref('tmp_new_customers') }} USING (date)
FULL OUTER JOIN 
    {{ ref('tmp_new_recurring_revenue') }} USING (date)
FULL OUTER JOIN 
    {{ ref('tmp_recurring_revenue') }} USING (date)
