select datename(DW,order_date) as order_day, count(distinct order_id) as order_count from pizza_sales
group by datename(DW,order_date) order by count(distinct order_id) desc;

select datename(MONTH,order_date) as month_name, count(distinct order_id) as order_count from pizza_sales
group by datename(MONTH,order_date) order by count(distinct order_id) desc;

select pizza_category, cast( sum(total_price)*100/ (select sum(total_price)
from pizza_sales)as decimal(10,2))as percentage_of_sales from pizza_sales group by pizza_category;


select pizza_size, cast( sum(total_price)*100/ (select sum(total_price)
from pizza_sales)as decimal(10,2))as percentage_of_sales from pizza_sales group by pizza_size;


select pizza_category, count(quantity) as total_pizzas_sold from pizza_sales 
group by pizza_category;

select top 5
pizza_name,
sum(total_price) as total_revenue, 
sum(quantity) as total_quantity, 
count(distinct order_id) as total_order 
from pizza_sales group by pizza_name order by total_order  asc;