-- segment products into cost range and count how many products fall into each segment 

select cost_range,
count(product_key) as total_product
from
(select product_name,
product_key,
cost,
case when cost < 100 then 'Below 100'
	 when cost>=100 and cost<=500 then '100-500'
     when cost>500 and cost<=1000 then '501-1000'
     else 'Above 1000'
end cost_range     
from dim_products
order by cost) as a
group by cost_range
order by total_product desc;


-- select
-- count(product_key) as total_product,
-- case when cost < 100 then 'Below 100'
-- 	 when cost>=100 and cost<=500 then '100-500'
--      when cost>500 and cost<=1000 then '501-1000'
--      else 'Above 1000'
-- end cost_range     
-- from dim_products
-- group by cost_range
-- order by total_product;

-- Dimension table → count = entities
-- Fact table → count = events