-- group customers into three segments based on their spending behaviour:
	-- 	-VIP: customers with atleast 12 month of history and spending more than 5000.
	-- 	-Regular: customers with atleast 12 months of history but spending 5000 or less.
	-- 	-New: customers with lifespan of less than 12 months.
-- and find the total number of customers by each group.

select 
case when lifespan >=12 and total_spending > 5000 then 'VIP'
	when lifespan >=12 and total_spending <= 5000 then 'Regular'
    else 'New'
end cust_grp,
count(customer_key) as total_customer
from 
(select c.customer_key,
sum(sales_amount) as total_spending,
min(order_date) as first_order_date,
max(order_date) as last_order_date,
timestampdiff(month, min(order_date), max(order_date)) as lifespan
from fact_sales f
left join dim_customers c
on f.customer_key = c.customer_key
group by customer_key) as a
group by cust_grp
;

