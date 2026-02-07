SET SQL_SAFE_UPDATES = 0;

use datawarehouse_analytics_db;
UPDATE fact_sales
SET order_date = NULL
WHERE YEAR(order_date) = 0;

select year(order_date) as order_year,
sum(sales_amount) as total_sales,
count(distinct customer_key) as total_customer,
sum(quantity) as total_quantity
from fact_sales
where order_date is not null
group by year(order_date)
order by year(order_date);


