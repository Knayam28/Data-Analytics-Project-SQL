-- calculate the total sales per month
-- and the running total of sales over time


select order_month,
total_sales,
sum(total_sales) over(order by order_month) as cum_sales
from (
select date_format(order_date, '%Y-%m-01') as order_month, 
sum(sales_amount) as total_sales
from fact_sales
where order_date is not  null
group by date_format(order_date, '%Y-%m-01')
order by date_format(order_date, '%Y-%m-01')
) as a
;

select order_month,
total_sales,
sum(total_sales) over(order by order_month) as cum_sales,
avg_price,
avg(avg_price) over(order by order_month) as moving_avg_price
from (
select date_format(order_date, '%Y-%m-01') as order_month, 
sum(sales_amount) as total_sales,
avg(price) as avg_price
from fact_sales
where order_date is not  null
group by date_format(order_date, '%Y-%m-01')
order by date_format(order_date, '%Y-%m-01')
) as a
;




