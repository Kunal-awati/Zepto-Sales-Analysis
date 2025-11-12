create database zepto_db;
use zepto_db;

select * from zepto_v2;

rename  table  zepto_v2 to zepto ;

select * from zepto 
limit 10;

select * from zepto
where name Is null;

select distinct category
from zepto 
order by category;

select outOfStock , count(name)
from zepto 
group by  outOfStock ;

select name , count(name)ordered_numbers
from zepto 
group by name
having count(name) > 1
order by count(name) desc;

select * from zepto 
where mrp = 0 ;
SET SQL_SAFE_UPDATES = 0;
delete from zepto 
where mrp = 0 ;

update zepto
set mrp = mrp/100.0 ,
discountedSellingPrice = discountedSellingPrice/100.0 ;

select * from zepto;

-- Q1. Find the top 10 best-value products based on the discount percentage.
select distinct name , mrp, discountpercent
from zepto 
order by discountpercent desc
limit 10;

-- Q2.Calculate Estimated Revenue for each category
select  category ,
sum(availableQuantity * discountedSellingPrice) as total_revenue 
from zepto
group by category 
order by total_revenue;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
select name , mrp, discountpercent 
from zepto 
where mrp > 500 and discountpercent < 10
order by mrp desc;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
select category ,  avg( discountpercent) as avg_discountpercent 
from zepto 
group by category
order by avg_discountpercent
limit 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.
select  distinct name , weightInGms ,  discountedSellingPrice,
round(discountedSellingPrice/ weightInGms) as price_per_gram
from zeptow
where  weightInGms >= 100
order by price_per_gram ;

 
 -- What is the Total Inventory Weight Per Category 
SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;