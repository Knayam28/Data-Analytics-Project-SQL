-- analyse the yearly sales of products by comparing their sales 
-- to both the average performance of the product and the previous year's sales.

select order_year,
product_name,
total_sales,
avg(total_sales) over(partition by product_name) as avg_sales,
total_sales -avg(total_sales) over(partition by product_name) as diff_avg,
case when total_sales -avg(total_sales) over(partition by product_name) > 0 then 'Above avg'
     when total_sales -avg(total_sales) over(partition by product_name) < 0 then 'Below avg'
     else 'Avg'
end avg_change,
lag(total_sales) over (partition by product_name order by order_year) as prv_sales,
case when total_sales - lag(total_sales) over (partition by product_name order by order_year) > 0 then 'Increase'
     when total_sales - lag(total_sales) over (partition by product_name order by order_year) < 0 then 'Decrease'
     else 'No Change'
 end prv_change    
from(
select year(order_date) as order_year,
 product_name,
 sum(sales_amount) as total_sales
from fact_sales f
left join dim_products p
on f.product_key = p.product_key
where order_date is not null
group by product_name, order_year
order by product_name
) as a
;