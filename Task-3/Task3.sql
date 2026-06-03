CREATE DATABASE ecommerce_db;
USE ecommerce_db;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id)
    REFERENCES Orders(order_id),
    FOREIGN KEY (product_id)
    REFERENCES Products(product_id)
);
INSERT INTO Customers VALUES
(1,'Pujan Patel','Morbi'),
(2,'Khush Patel','Kutch'),
(3,'Deep Patel','Surat'),
(4,'Ramya Patel','Vapi');

INSERT INTO Orders VALUES
(101,1,'2024-01-10',250.00),
(102,2,'2024-01-15',180.00),
(103,1,'2024-02-01',320.00),
(104,3,'2024-02-05',150.00);

INSERT INTO Products VALUES
(1,'Laptop','Electronics',800),
(2,'Phone','Electronics',500),
(3,'Headphones','Accessories',100);

INSERT INTO Order_Items VALUES
(1,101,1,1),
(2,102,2,1),
(3,103,3,2),
(4,104,2,1);

Select * from Customers;

#SELECT+WHERE
select * from Customers where city = 'Morbi';

#ORDER BY
SELECT * from Orders
ORDER BY total_amount DESC;

#GROUP BY + SUM
SELECT customer_id, SUM(total_amount) AS total_sales
FROM Orders
GROUP BY customer_id;

#AVG Aggregate Function
SELECT AVG(total_amount) AS avg_order_value
FROM Orders;

#INNER JOIN
SELECT o.order_id,c.customer_name,o.total_amount
FROM Orders o
INNER JOIN Customers c
ON o.customer_id = c.customer_id;

#LEFT JOIN
SELECT c.customer_name,o.order_id
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id;

#RIGHT JOIN
SELECT c.customer_name,o.order_id
FROM Customers c
RIGHT JOIN Orders o
ON c.customer_id = o.customer_id;

#Subquery
SELECT customer_id,total_amount
FROM Orders
WHERE total_amount >
(
    SELECT AVG(total_amount)
    FROM Orders
);

#create index
CREATE INDEX idx_customer
ON Orders(customer_id);

SELECT *
FROM Orders
WHERE customer_id = 1;