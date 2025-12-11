create database sample;(we need to create database)
use sample;(then use the sample use sample wt name ur give to give database)

CREATE TABLE customers (                              #creating table of customer,products,orders.....
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(150),
    city VARCHAR(100),
    signup_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(150),
    category VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    subtotal DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES(insert the values)
(1, 'Amit Sharma', 'amit@example.com', 'Mumbai', '2023-01-05'),
(2, 'Priya Patel', 'priya@example.com', 'Delhi', '2023-02-10'),
(3, 'Rohit Singh', 'rohit@example.com', 'Bangalore', '2023-03-15'),
(4, 'Neha Gupta', 'neha@example.com', 'Pune', '2023-04-20'),
(5, 'Karan Mehta', 'karan@example.com', 'Chennai', '2023-05-25'),
(6, 'Sara Khan', 'sara@example.com', 'Kolkata', '2023-06-10'),
(7, 'Mohit Kumar', 'mohit@example.com', 'Jaipur', '2023-07-30'),
(8, 'Sonali Bose', 'sonali@example.com', 'Hyderabad', '2023-08-15'),
(9, 'Deepak Rao', 'deepak@example.com', 'Ahmedabad', '2023-09-22'),
(10, 'Riya Das', 'riya@example.com', 'Surat', '2023-10-11');

INSERT INTO products VALUES
(101, 'Wireless Mouse', 'Electronics', 599.00),
(102, 'Bluetooth Headphones', 'Electronics', 1299.00),
(103, 'Office Chair', 'Furniture', 4999.00),
(104, 'Notebook Pack', 'Stationery', 199.00),
(105, 'LED Desk Lamp', 'Electronics', 799.00),
(106, 'USB-C Charger', 'Electronics', 499.00),
(107, 'Water Bottle', 'Accessories', 299.00),
(108, 'Laptop Stand', 'Electronics', 999.00);

INSERT INTO orders VALUES
(5001, 1, '2023-08-01', 1898.00),
(5002, 2, '2023-08-03', 4999.00),
(5003, 3, '2023-08-05', 1798.00),
(5004, 4, '2023-08-07', 598.00),
(5005, 5, '2023-08-09', 1198.00),
(5006, 1, '2023-08-10', 699.00),
(5007, 7, '2023-08-12', 199.00),
(5008, 8, '2023-08-13', 2298.00),
(5009, 9, '2023-08-14', 999.00),
(5010, 10, '2023-08-15', 1498.00),
(5011, 6, '2023-08-16', 599.00),
(5012, 3, '2023-08-17', 999.00);

INSERT INTO order_items VALUES
(1, 5001, 101, 1, 599.00),
(2, 5001, 102, 1, 1299.00),

(3, 5002, 103, 1, 4999.00),

(4, 5003, 101, 1, 599.00),
(5, 5003, 105, 1, 799.00),
(6, 5003, 107, 2, 400.00),

(7, 5004, 104, 3, 597.00),

(8, 5005, 108, 1, 999.00),
(9, 5005, 107, 1, 299.00),

(10, 5006, 106, 1, 499.00),
(11, 5006, 104, 1, 199.00),

(12, 5007, 104, 1, 199.00),

(13, 5008, 102, 1, 1299.00),
(14, 5008, 105, 1, 799.00),
(15, 5008, 107, 2, 400.00),

(16, 5009, 108, 1, 999.00),

(17, 5010, 105, 1, 799.00),
(18, 5010, 107, 2, 400.00),
(19, 5010, 101, 1, 299.00),

(20, 5011, 101, 1, 599.00),

(21, 5012, 108, 1, 999.00);


#Basic SELECT Query
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;


SELECT * FROM customers;

#WHERE + ORDER BY
SELECT customer_name, city, signup_date
FROM customers
WHERE city = 'Mumbai'
ORDER BY signup_date DESC;


#GROUP BY + Aggregate functiom
SELECT customer_id, SUM(order_amount) AS total_spent
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC;


#INNER JOIN
SELECT c.customer_name, o.order_id, o.order_amount
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;


#LEFT JOIN
SELECT c.customer_name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
ORDER BY c.customer_id;


#RIGHT JOIN
SELECT c.customer_name, o.order_id
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;


#Subquery Example
Find customers who spent more than ₹2000 total:

SELECT customer_id, customer_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id 
    FROM orders
    GROUP BY customer_id
    HAVING SUM(order_amount) > 2000
);

#create a view

CREATE VIEW customer_sales AS
SELECT 
    c.customer_id,
    c.customer_name,
    SUM(o.order_amount) AS total_sales
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

#Creating an Index

CREATE INDEX idx_customer_id ON orders(customer_id);


#Average Revenue Per User
SELECT AVG(total_spent) AS avg_revenue_per_user
FROM (
    SELECT customer_id, SUM(order_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
) AS t;
















CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    subtotal DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

