----Total revenue 
SELECT sum(total_price)
  FROM [Pizza_Sales_Database].[dbo].[pizza_sales_file]
--817860.05083847


--average order value 
SELECT sum(total_price)/COUNT(distinct order_id) as  avg_order_value
  FROM [Pizza_Sales_Database].[dbo].[pizza_sales_file]
  --38.3072623343546


  --Total pizza sold
  select sum(quantity) as Total_pizza_sold
  FROM [Pizza_Sales_Database].[dbo].[pizza_sales_file]
  --49574

  --Total orders
  select count(distinct order_id) as Total_orders
  FROM [Pizza_Sales_Database].[dbo].[pizza_sales_file]
 -- 21350

 --Average pizza per order
select sum(quantity)/count(distinct order_id) as Avg_pizza_per_order
   FROM [Pizza_Sales_Database].[dbo].[pizza_sales_file]  
   

   select * from   [Pizza_Sales_Database].[dbo].[pizza_sales_file]  

-------------------------chart requirement------------------------------------------------
-------Daily trend for total order 
		select DATENAME(DW,order_date) as order_day,COUNT(distinct order_id) as Total_order
		from   [Pizza_Sales_Database].[dbo].[pizza_sales_file]  
		group by DATENAME(DW,order_date)

--------Montly  trend for  order 
		select DATENAME(MONTH,order_date) as Month_name,COUNT(distinct order_id) as Total_order
		from   [Pizza_Sales_Database].[dbo].[pizza_sales_file]  
		group by DATENAME(MONTH,order_date)

-------percentage of sales by pizza category 
		select pizza_category ,sum(total_price) as Total_revenue,sum(total_price)*100 /(select sum(total_price)  
		from   [Pizza_Sales_Database].[dbo].[pizza_sales_file])  as pct
		from   [Pizza_Sales_Database].[dbo].[pizza_sales_file]  
		group by(pizza_category)


 --------percentage of sales by pizza size
		select pizza_size ,sum(total_price) as Total_revenue,
		sum(total_price)*100/
		(select sum(total_price) from [Pizza_Sales_Database].[dbo].[pizza_sales_file]  ) as sales_pizza_size
		from   [Pizza_Sales_Database].[dbo].[pizza_sales_file]  
		group by(pizza_size)
 
--------Total pizza sold by pizza category 

    select pizza_category ,sum(quantity) as Total_pizza
       from   [Pizza_Sales_Database].[dbo].[pizza_sales_file]  
 	      group by(pizza_category)

--------Top 5 pizza by total price

			select top 5 pizza_name,sum(total_price) as Total_Revenue
			from   [Pizza_Sales_Database].[dbo].[pizza_sales_file]  
			group by(pizza_name)
			order by sum(total_price) desc

---------Bottom 5 pizza by total price
			select top 5 pizza_name,sum(total_price) as Total_Revenue
			from   [Pizza_Sales_Database].[dbo].[pizza_sales_file]  
 			group by(pizza_name)
			order by sum(total_price) 



---------Top 5 pizza by total quantity

			select top 5 pizza_name,sum(quantity) as Total_Quantity
				from   [Pizza_Sales_Database].[dbo].[pizza_sales_file]  
 				group by(pizza_name)
				order by sum(quantity) desc


---------bottom 5 pizza by total quantity

			select top 5 pizza_name,sum(quantity) as Total_Quantity
				from   [Pizza_Sales_Database].[dbo].[pizza_sales_file]  
 				group by(pizza_name)
				order by sum(quantity) asc


---------Top 5 pizza by total order
	select top 5 pizza_name,count(Distinct order_id) as Total_Order
				from   [Pizza_Sales_Database].[dbo].[pizza_sales_file]  
 				group by(pizza_name)
				order by count(Distinct order_id) desc

---------bottom 5 pizza by total order
	select top 5 pizza_name,count(Distinct order_id) as Total_Order
				from   [Pizza_Sales_Database].[dbo].[pizza_sales_file]  
 				group by(pizza_name)
				order by count(Distinct order_id) asc