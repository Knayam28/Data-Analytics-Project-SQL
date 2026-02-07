-- Purpose:
--     - This report consolidates key customer metrics and behaviors

-- Highlights:
--     1. Gathers essential fields such as names, ages, and transaction details.
-- 	   2. Segments customers into categories (VIP, Regular, New) and age groups.
--     3. Aggregates customer-level metrics:
-- 	   	- total orders
-- 	  	- total sales
-- 	   	- total quantity purchased
-- 	   	- total products
-- 	   	- lifespan (in months)
--     4. Calculates valuable KPIs:
-- 	    - recency (months since last order)
-- 		- average order value
-- 		- average monthly spend

-- create view datawarehouse_analytics_db.report_customer_metric as 
with base_data as(
	select
	c.customer_key,
	order_number,
	order_date,
	product_key,
	sales_amount,
	quantity,
	price,
	customer_id,
	customer_number,
    birthdate,
	concat(first_name, ' ', last_name) as customer_name,
	timestampdiff(year, birthdate, curdate()) as customer_age
	from fact_sales f
	left join dim_customers c
	on f.customer_key = c.customer_key
    where order_date is not null
),

customer_metrics as (
	select
    customer_key, customer_id, customer_number, customer_name, customer_age,
    sum(sales_amount) as total_sales,
    sum(quantity) as total_quantity,
    count(distinct order_number) as total_order,
    count(distinct product_key) as total_products,
    timestampdiff(month, min(order_date), max(order_date)) as lifespan,
    max(order_date) as last_order_date
    from base_data
    group by customer_key, customer_id, customer_number, customer_name, customer_age
    
)
select 
customer_key, customer_id, customer_number, customer_name, customer_age,
total_sales, total_quantity, total_order, total_products, last_order_date, lifespan,

case when lifespan > 12 and total_sales > 5000 then 'VIP'
     when lifespan >12 and total_sales <=5000 then 'Regular'
     else 'New'
end as customer_segment,

case when customer_age < 20 then 'Under 20'
     when customer_age >= 20 and customer_age < 30 then '20-29'
     when customer_age >= 30 and customer_age <40 then '30-39'
     when customer_age >= 40 and customer_age <50 then '40-49'
     else 'Above 50'
end customer_age_group,

timestampdiff(month, last_order_date, curdate()) as recency, -- KPI1
 case when total_order = 0 then '0'
	  else total_sales/total_order 
 end as avg_order_value,   -- KPI2   
case when lifespan = 0 then total_sales
     else total_sales/lifespan
end  as avg_monthly_spend   -- KPI3
from customer_metrics;



