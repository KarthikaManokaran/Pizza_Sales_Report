select * from pizza_sales

select sum(total_price) as Total_Revenue from pizza_sales

select sum(total_price)/ count(distinct order_id) as Avg_order_value from pizza_sales

select sum(quantity) as Total_pizza_sold from pizza_sales

select count(distinct order_id) as Total_orders from pizza_sales

select sum(quantity)/count(distinct order_id) as Avg_pizzas_per_order from pizza_sales

select CAST(sum(quantity)as decimal(10,2))/CAST(count(distinct order_id) as decimal(10,2)) as Avg_pizzas_per_order from pizza_sales

select CAST(CAST(sum(quantity)as decimal(10,2))/CAST(count(distinct order_id) as decimal(10,2))as decimal(10,2)) as Avg_pizzas_per_order 
from pizza_sales

select DATENAME(DW, order_date) as order_day, COUNT(distinct order_id) as Total_orders from pizza_sales
GROUP BY  DATENAME(DW, order_date)

select DATENAME(MONTH,order_date) as Month_Name, COUNT(distinct order_id) as Total_orders from pizza_sales
GROUP BY DATENAME(MONTH,order_date)

select DATENAME(MONTH,order_date) as Month_Name, COUNT(distinct order_id)as Total_orders from pizza_sales 
GROUP BY DATENAME(MONTH,order_date)
ORDER BY Total_orders

select pizza_category,sum(total_price)*100/(select sum (total_price)from pizza_sales) as PCT from pizza_sales GROUP BY pizza_category

select pizza_category,sum(total_price)as total_sales,sum(total_price)*100/(select sum (total_price)from pizza_sales) as PCT from pizza_sales
GROUP BY pizza_category

select pizza_category,sum(total_price)as total_sales,sum(total_price)*100/(select sum (total_price)from pizza_sales) as PCT from pizza_sales 
WHERE MONTH(order_date)=1 
GROUP BY pizza_category

select pizza_size,sum(total_price)as total_sales,sum(total_price)*100/(select sum (total_price)from pizza_sales) as PCT from pizza_sales
WHERE DATEPART(quarter,order_date)=1 
GROUP BY pizza_size 
ORDER BY PCT DESC

select pizza_name,sum(total_price) as Total_Revenue from pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

select TOP 5 pizza_name,sum(total_price) as Total_Revenue from pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC


select TOP 5 pizza_name,sum(quantity) as Total_Quantity from pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC

select TOP 5 pizza_name,COUNT(DISTINCT order_id) as Total_Orders from pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

select TOP 5 pizza_name,sum(total_price) as Total_Revenue from pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

select TOP 5 pizza_name,sum(quantity) as Total_Quantity from pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC

select TOP 5 pizza_name,COUNT(DISTINCT order_id) as Total_Orders from pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC
