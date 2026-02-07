-- Purpose:
-- - This report consolidates key product metrics and behaviors.

-- Highlights:
--    1. Gathers essential fields such as product name, category, subcategory, and cost.
--    2. Segments products by revenue to identify High-Performers, Mid-Range, or Low-Performers.
--    3. Aggregates product-level metrics:
--       - total orders
--       - total sales
--       - total quantity sold
--       - total customers (unique)
--       - lifespan (in months)
--    4. Calculates valuable KPIs:
--       - recency (months since last sale)
--       - average order revenue (AOR)
--       - average monthly revenue


with base_data as(
	select 
	order_number,
    order_date,
	p.product_key,
	sales_amount,
    quantity,
	customer_key,
	product_id,
	product_number,
	product_name,
	category,
	subcategory,
	cost
	from fact_sales f
	left join dim_products p 
	on f.product_key = p.product_key
    where order_date is not null
),

product_metric as(
select 
product_key, product_number, product_name, category, subcategory, cost,
sum(sales_amount) as total_sales,
count(distinct order_number) as total_order,
sum(quantity) as total_quantity,
count(distinct customer_key) as total_customer,
timestampdiff(month, min(order_date), max(order_date)) as lifespan,
max(order_date) as last_order_date
from base_data
group by product_key, product_number, product_name, category, subcategory, cost
)
select
product_key, product_number, product_name, category, subcategory, cost,
total_sales, total_order, total_quantity, total_customer, lifespan, last_order_date,
timestampdiff(month, last_order_date, curdate()) as recency,  -- KPI1
case when total_sales > 50000 then 'High-Performer'
     when total_sales >= 10000 then 'Mid-Range'
     else 'Low-Performer'
end as product_segment,
case when total_order = 0 then 0
     else total_sales/total_order
end as avg_order_revenue,           -- KPI2
case when lifespan = 0 then 0
     else total_sales/lifespan
end avg_monthly_revenue            -- KPI3
from product_metric;

