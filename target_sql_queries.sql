-- 1. Import the dataset and do usual exploratory analysis steps like checking the structure & characteristics of the dataset:
-- 1. Data type of all columns in the "customers" table.
select * 
from `Target_sql.customers`
limit 25;

-- 2. Get the time range between which the orders were placed.

select min(order_purchase_timestamp) as first_order, max(order_purchase_timestamp)as last_order
from `Target_sql.orders`;

-- 3. Count the Cities & States of customers who ordered during the give period.
SELECT  c.customer_city, c.customer_state, count(o.order_id) as order_count
from `Target_sql.customers` as c
join `Target_sql.orders` as o
on c.customer_id=o.customer_id
group by c.customer_city,c.customer_state
order by order_count DESC;

-- 2. In-depth Exploration:
-- 1. Is there a growing trend in the no. of orders placed over the past years?
select 
EXTRACT(month from order_purchase_timestamp) as month,
count (order_id) as order_num
from `Target_sql.orders`
group by EXTRACT(month from `order_purchase_timestamp`)
order by order_num desc;



