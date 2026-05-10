use chocolate_sales ;

-- Chocolate Sales Analysis.

 -- 1.Total Sales.
select
sum(revenue) As TotalSales
from sales ;

-- 2.Total Profit.
select
sum(profit) As Totalprofit
from sales ;

-- 3. Total Quantity.
select
sum(quantity) As Totalquantity
from sales ;

-- 4.TotalSales Count.
select
count(distinct order_id) As TotalsalesCount
from sales ;

-- 5. Total Profit By Category.
select
p.category,
sum(s.profit) As Totalprofit
from sales s
join products p
on s.product_id = p.product_id
group by category
order by Totalprofit desc ;

-- 6.Top Store Type by Sales.
select
st.store_type,
sum(s.revenue) As TotalSales
from stores st
join sales s
on s.store_id = st.store_id
group by st.store_type
order by TotalSales desc
limit 3 ;

-- 7. Customer contribution.
select
c.gender,
sum(s.revenue) As Total_Sales
from customers c
join sales s
on c.customer_id = s.customer_id
group by c.gender
order by Total_Sales desc ;

-- 8. Highest selling product.
select
p.product_name, sum(s.revenue) As Totalsales
from products p
join sales s
on p.product_id = p.product_id
group by p.product_name
order by Totalsales desc 
limit 1 ;

-- 9. Lowest selling product.
select
p.product_name, sum(s.revenue) As Totalsales
from products p
join sales s
on p.product_id = p.product_id
group by p.product_name
order by Totalsales asc
limit 1 ;

-- 10. Monthly Sales Trend.
select
date_format(order_date, '%Y-%m') As month,
sum(revenue) As Total_Sales
from sales
group by month
order by month ;

-- 11.Total Sales & Profit.
select
sum(revenue) As Total_sales,
sum(profit) As Total_profit
from sales ;

-- 12. Sales vs Profit by Category.
select
p.category,
sum(s.revenue) As sales,
sum(s.profit) As profit
from products p
join sales s
on p.product_id = s.product_id
group by category
order by sales desc ;

-- 13.Brandwise- Profit Margin.
select
p.brand,
sum(s.revenue) As Total_revenue,
sum(s.profit) As Total_profit,
round(
sum(s.profit) * 100.0/ sum(s.revenue),2) As Profit_Margin_Percent
from sales s
join products p
on s.product_id = p.product_id
group by p.brand
order by Profit_Margin_Percent desc ;

-- 14. Top 5 Customers by Revenue.
select
c.customer_id,
sum(s.revenue) As Total_revenue
from sales s
join customers c
on s.customer_id = c.customer_id
group by c.customer_id
order by Total_revenue desc
limit 5 ;

-- 15.Sales by Country.
select
st.country,
sum(s.revenue) As Total_sales
from sales s
join stores st
on s.store_id = st.store_id
group by st.country
order by Total_sales desc ;

-- 16.Average Order Value.
select
round(sum(revenue) / count(distinct
order_id),2) As Avg_order_value
from sales ;

-- 17.Best Performing Brand.
select
p.brand,
sum(s.profit) As Total_profit
from sales s
join products p
on s.product_id = p.product_id
group by p.brand
order by Total_profit desc ;

-- 18.Loyalty Members vs Non-Members Sales.
select
c.loyalty_member,
sum(s.revenue) As Total_sales
from sales s
join customers c
on s.customer_id = c.customer_id
group by c.loyalty_member ;

-- 19.Store-wise Profit Analysis.
select
st.store_name,
sum(s.profit) As Total_profit
from sales s
join stores st
on s.store_id = st.store_id
group by st.store_name
order by Total_profit desc ;

-- 20.Discount Impact on sales.
select
round (Avg(discount),2) As Avg_Discount,
sum(revenue) As Total_Sales
from sales ;

-- 21.Category-wise Quantity Sold.
select 
p.category,
sum(s.quantity) As Total_quantity
from sales s
join products p
on s.product_id = p.product_id
group by p.category
order by Total_quantity desc ;

-- 22.Repeat Customers.
select
customer_id,
count(order_id) As Total_orders
from sales
group by customer_id
having count(order_id) > 1
order by Total_orders desc ;

-- 23.Profit Percentage.
select
round((sum(profit) / sum(revenue))* 100,2)
As Profit_percentage
from sales ;

-- 24.Daily Sales Trend.
select
order_date,
sum(revenue) As Daily_Sales
from sales
group by order_date
order by order_date ;

-- 25. Highest Revenue Generating City.
select
st.city,
sum(s.revenue) As Total_sales
from sales s
join stores st
on s.store_id = st.store_id
group by st.city
order by  Total_sales desc
limit 1 ;


























