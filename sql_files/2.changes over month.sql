
select date_format(order_date, '%Y-%m-01') as order_month,
sum(sales_amount) as total_sales,
count(distinct customer_key) as total_customers,
sum(quantity) as total_quantity
from fact_sales
where order_date is not null
group by date_format(order_date, '%Y-%m-01')
order by date_format(order_date, '%Y-%m-01');


