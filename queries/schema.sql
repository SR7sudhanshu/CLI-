
-- ---------------------------
-- 1. Create Tables
-- ---------------------------

CREATE TABLE Store (
    store_id INT PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(255),
    state VARCHAR(50),
    hours VARCHAR(100)
);

CREATE TABLE ProductType (
    type_id INT PRIMARY KEY,
    name VARCHAR(100),
    parent_type_id INT,
    FOREIGN KEY (parent_type_id) REFERENCES ProductType(type_id)
);

CREATE TABLE Brand (
    brand_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Vendor (
    vendor_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    UPC VARCHAR(12),
    name VARCHAR(255),
    type_id INT,
    brand_id INT,
    packaging VARCHAR(50),
    FOREIGN KEY (type_id) REFERENCES ProductType(type_id),
    FOREIGN KEY (brand_id) REFERENCES Brand(brand_id)
);

CREATE TABLE ProductVendor (
    vendor_id INT,
    product_id INT,
    PRIMARY KEY (vendor_id, product_id),
    FOREIGN KEY (vendor_id) REFERENCES Vendor(vendor_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(255),
    is_frequent BOOLEAN
);

CREATE TABLE `Order` (
    order_id INT PRIMARY KEY,
    store_id INT,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (store_id) REFERENCES Store(store_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE OrderItem (
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

CREATE TABLE Inventory (
    store_id INT,
    product_id INT,
    quantity_in_stock INT,
    reorder_level INT,
    PRIMARY KEY (store_id, product_id),
    FOREIGN KEY (store_id) REFERENCES Store(store_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

CREATE TABLE Shipment (
    shipment_id INT PRIMARY KEY,
    vendor_id INT,
    delivery_date DATE,
    FOREIGN KEY (vendor_id) REFERENCES Vendor(vendor_id)
);

CREATE TABLE ShipmentItem (
    shipment_id INT,
    product_id INT,
    store_id INT,
    quantity INT,
    PRIMARY KEY (shipment_id, product_id, store_id),
    FOREIGN KEY (shipment_id) REFERENCES Shipment(shipment_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (store_id) REFERENCES Store(store_id)
);