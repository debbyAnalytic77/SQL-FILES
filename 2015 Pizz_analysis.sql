

select * from pizza_sales

--Total Revenue KPI
select sum(unit_price * quantity) as Revenue
from pizza_sales


--Total Pizza Sold KPI
select sum(quantity) as Total_pizza_Sold
from Pizza_sales


--Total Order KPI
select count(distinct order_id) as Total_Order
from pizza_sales


--Average order Value KPI
select sum(unit_price * quantity)/count(distinct order_id) as Average_order_Value
from pizza_sales


--Average Pizza Sold per Order KPI
select sum(quantity)/count(distinct order_id) as Average_Pizza_Sold_per_Order
from pizza_sales


 --daily trend of total orders within a specific period
select DATENAME(DW, order_date) as Order_Day, count(distinct order_id) as Total_Orders
from pizza_sales
group by DATENAME(DW, order_date)
 


---Monthly trend of the total orders throughout the day
select DATENAME(MM, order_date) as order_month, count(distinct order_id) as Total_Orders
from pizza_sales
group by DATENAME(MM, order_date)



---distribution of Total Revenue across different pizza categories
select pizza_category, sum(unit_price * quantity) as Revenue, 
cast(count('Revenue') * 100.0 /(select count('Revenue') from pizza_sales) as decimal (11,2))as Sales_Percentage
from pizza_sales
group by pizza_category
order by sales_Percentage desc



---percentage attributed to different pizza sizes
select pizza_size, cast(sum(unit_price * quantity) as decimal (8,2)) as 'Revenue', 
cast(count('Revenue') * 100.0 /(select count('Revenue') from pizza_sales) as decimal (11,2)) as pizza_size_percentage
from pizza_sales
group by pizza_size
order by Revenue desc



---total number of pizza sold for each pizza category
select distinct pizza_category, sum(quantity) as total_pizza_sold
from pizza_sales
group by pizza_category
order by total_pizza_sold desc


---top 5 best selling pizza based on Total Revenue 
select Top 5 pizza_name as best_selling_pizzas, 
sum(unit_price * quantity) as Total_Revenue
from pizza_sales
group by pizza_name
order by Total_Revenue  desc


---top 5 best selling pizza based on total order 
select distinct Top 5 pizza_name as best_selling_pizzas,
count(distinct order_id) as total_order 
from pizza_sales
group by pizza_name
order by total_order  desc


---top 5 best selling pizza based on total quantity
select Top 5 pizza_name as best_selling_pizzas,  
sum(quantity) as total_quantity
from pizza_sales
group by pizza_name
order by total_quantity  desc


---bottom 5 selling pizza based on Total Revenue
select Top 5 pizza_name as worse_selling_pizza,
sum(unit_price * quantity) as total_Revenue 
from pizza_sales
group by pizza_name
order by total_Revenue Asc
 

 ---bottom 5 selling pizza based on Total Order 
select Top 5 pizza_name as worse_selling_pizza,  
count (distinct order_id) as total_order
from pizza_sales
group by pizza_name
order by  total_order  Asc


---bottom 5 selling pizza based on Total Quantity
select Top 5 pizza_name as worse_selling_pizza, 
sum(quantity) as total_quantity
from pizza_sales
group by pizza_name
order by total_quantity Asc









































