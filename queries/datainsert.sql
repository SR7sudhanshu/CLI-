-- ---------------------------
-- 2. Insert Data
-- ---------------------------

-- Store
INSERT INTO Store VALUES
(1, 'Central Store', '123 Main St', 'New York', '9AM-9PM'),
(2, 'East Side', '456 East Rd', 'California', '8AM-8PM');

-- ProductType
INSERT INTO ProductType VALUES
(1, 'Snacks', NULL),
(2, 'Beverages', NULL),
(3, 'Household', NULL),
(4, 'Soda', 2),
(5, 'Cleaners', 3);

-- Brand
INSERT INTO Brand VALUES
(1, 'Pepsi'),
(2, 'Coca-Cola'),
(3, 'Lay''s'),
(4, 'Dettol');

-- Vendor
INSERT INTO Vendor VALUES
(1, 'PepsiCo'),
(2, 'Coca-Cola Inc'),
(3, 'Unilever');

-- Product
INSERT INTO Product VALUES
(1, '123456789012', 'Pepsi Can 330ml', 4, 1, 'Can'),
(2, '123456789013', 'Coke Bottle 1L', 4, 2, 'Bottle'),
(3, '123456789014', 'Lay''s Classic 100g', 1, 3, 'Packet'),
(4, '123456789015', 'Dettol Surface Cleaner 500ml', 5, 4, 'Bottle');

-- ProductVendor
INSERT INTO ProductVendor VALUES
(1, 1), (2, 2), (1, 3), (3, 4);

-- Customer
INSERT INTO Customer VALUES
(1, 'John Doe', '1234567890', 'john@example.com', '789 West St', TRUE),
(2, 'Jane Smith', '0987654321', 'jane@example.com', '456 Central Ave', FALSE);

-- Order
INSERT INTO `Order` VALUES
(1, 1, 1, '2024-04-01'),
(2, 2, 2, '2024-04-02');

-- OrderItem
INSERT INTO OrderItem VALUES
(1, 1, 2, 1.50),
(1, 3, 1, 0.99),
(2, 2, 1, 1.60);

-- Inventory
INSERT INTO Inventory VALUES
(1, 1, 50, 20),
(1, 2, 30, 15),
(2, 3, 40, 10),
(2, 4, 25, 10);

-- Shipment
INSERT INTO Shipment VALUES
(1, 1, '2024-03-30'),
(2, 3, '2024-03-31');

-- ShipmentItem
INSERT INTO ShipmentItem VALUES
(1, 1, 1, 100),
(1, 3, 1, 50),
(2, 4, 2, 75);