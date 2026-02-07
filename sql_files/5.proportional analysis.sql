-- which category contributes the most to the overall sale?

select category,
total_sales,
sum(total_sales) over() as overall_sales,
concat(round((total_sales / sum(total_sales) over() )* 100, 2),'%') as cont_perc
from
(select category,
sum(sales_amount) as total_sales
from fact_sales f
left join dim_products p
on f.product_key = p.product_key
group by category
order by sum(sales_amount) desc) as a
;