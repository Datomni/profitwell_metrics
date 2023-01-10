# Profitwell Metrics dbt Package

## What does this dbt package do?
* Creates standardised daily metrics based on the Profitwell dataset. The metrics provide an insight into active and new customers as well as recurring and churned revenue.

Refer to the table below for a detailed view of final models materialized by default within this package.

|         model	          |                 description                  | 
|:-----------------------:|:--------------------------------------------:|
|profitwell__daily_metrics|  Each record represents metrics for the day  |
|profitwell__monthly_metrics| Each record represents metrics for the month |


## Installation instructions

### Step 1: Installing the Package
Include this package in your packages.yml and run `dbt deps`

```
packages:
  - package: datomni/profitwell_metrics
    version: ">=1.0.0"
```

### (Optional) Step 2: Configure Database and Schema Variables
By default, this package looks for your data in your target database in the profitwell schema. If this is not where your data is stored, add the following variables to your dbt_project.yml file:

```
# dbt_project.yml
config-version: 2

vars:
    profitwell_schema: profitwell
    profitwell_database: your_database_name
```

### (Optional) Step 3: Configure Table Names
If your input table names don't match the standard Profitwell naming convention, you can configure the table names by adding them to your own dbt_project.yml file:

```
# dbt_project.yml
config-version: 2

vars:
    active_customers_tbl: active_customers
    average_revenue_per_user_tbl: average_revenue_per_user
    churned_customers_tbl: churned_customers
    churned_recurring_revenue_tbl: churned_recurring_revenue
    downgraded_customers_tbl: downgraded_customers
    downgraded_recurring_revenue_tbl: downgraded_recurring_revenue
    new_customers_tbl: new_customers
    new_recurring_revenue_tbl: new_recurring_revenue
    recurring_revenue_tbl: recurring_revenue
```

This package assumes that your data granularity is as follows: 
* profitwell.active_customers: daily
* profitwell.average_revenue_per_user: monthly
* profitwell.churned_customers: daily
* profitwell.churned_recurring_revenue: daily
* profitwell.downgraded_customers: daily
* profitwell.downgraded_recurring_revenue: daily
* profitwell.new_customers: daily
* profitwell.new_recurring_revenue: daily
* profitwell.recurring_revenue: daily

### (Optional) Step 4: Change the Build Schema
By default, this package will build all models in your <target_schema> with the _profitwell suffix. 
  
This behavior can be tailored to your preference by making use of custom schemas. 
If you would like to override the current naming conventions, please add the following configuration to 
your dbt_project.yml file and rename +schema configs:

```
models:  
  profitwell:
    +schema: profitwell
```

## Database support
This package has been tested on BigQuery.

