-- these are some example querires

-- ---------------------------
-- 3. Assignment Queries
-- ---------------------------

-- A: List all customers who made an order
SELECT DISTINCT c.customer_id, c.name
FROM Customer c
JOIN `Order` o ON c.customer_id = o.customer_id;

-- B: List products low in stock
SELECT p.name, i.quantity_in_stock, i.reorder_level
FROM Inventory i
JOIN Product p ON i.product_id = p.product_id
WHERE i.quantity_in_stock < i.reorder_level;

-- C: Show all orders with product names and total price
SELECT o.order_id, p.name AS product_name, oi.quantity, oi.price, (oi.quantity * oi.price) AS total_price
FROM `Order` o
JOIN OrderItem oi ON o.order_id = oi.order_id
JOIN Product p ON oi.product_id = p.product_id;

-- D: Find the frequent customers
SELECT *
FROM Customer
WHERE is_frequent = TRUE;

-- E: Show the inventory of each store
SELECT s.name AS store_name, p.name AS product_name, i.quantity_in_stock
FROM Inventory i
JOIN Store s ON i.store_id = s.store_id
JOIN Product p ON i.product_id = p.product_id;
