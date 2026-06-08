CREATE DATABASE online_sales;
USE online_sales;

create table orders (
order_id int primary key,
order_date date,
product_id int,
amount decimal(10,2)
);

insert into  orders values
(1,'2025-01-05',101,500),
(2,'2025-01-15',102,800),
(3,'2025-02-03',103,1200),
(4,'2025-02-20',101,700),
(5,'2025-03-10',104,1500),
(6,'2025-03-15',105,900),
(7,'2025-04-05',102,1100),
(8,'2025-04-18',103,1300),
(9,'2025-05-12',101,1000),
(10,'2025-05-25',104,1400);

select * from orders;

SELECT
    MONTH(order_date) AS Month,
    SUM(amount) AS Total_Revenue
FROM orders
GROUP BY MONTH(order_date)
ORDER BY Month;

SELECT
    MONTH(order_date) AS Month,
    COUNT(DISTINCT order_id) AS Order_Volume
FROM orders
GROUP BY MONTH(order_date)
ORDER BY Month;

SELECT
    MONTH(order_date) AS Month,
    SUM(amount) AS Total_Revenue,
    COUNT(DISTINCT order_id) AS Order_Volume
FROM orders
GROUP BY MONTH(order_date)
ORDER BY Month;

SELECT
    MONTH(order_date) AS Month,
    SUM(amount) AS Total_Revenue
FROM orders
GROUP BY MONTH(order_date)
ORDER BY Total_Revenue DESC
LIMIT 1;