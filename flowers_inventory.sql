-- USE DATABASE
USE flowersinventorydb;

-- CREATE CATEGORIES TABLE
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

-- CREATE SUPPLIERS TABLE
CREATE TABLE suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100) UNIQUE
);

-- CREATE FLOWERS TABLE
CREATE TABLE flowers (
    flower_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category_id INT,
    supplier_id INT,
    price DECIMAL(10,2) NOT NULL,
    description TEXT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

-- CREATE INVENTORY TABLE
CREATE TABLE inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    flower_id INT UNIQUE,
    quantity INT NOT NULL,
    last_updated DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (flower_id) REFERENCES flowers(flower_id)
);

-- CREATE CUSTOMERS TABLE
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(255)
);

-- CREATE ORDERS TABLE
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL
);

-- CREATE ORDER_ITEMS TABLE
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    flower_id INT NOT NULL,
    quantity INT NOT NULL,
    price_per_unit DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (flower_id) REFERENCES flowers(flower_id)
);

-- INSERT CATEGORIES
INSERT INTO categories (name) VALUES 
('Roses'), ('Lilies'), ('Tulips'), ('Orchids'), ('Daisies');

-- INSERT SUPPLIERS
INSERT INTO suppliers (name, phone, email) VALUES 
('Sassy Suppliers Ltd', '0724564753', 'contact@bloom.co.ke'),
('GreenScape Distributors', '0722674872', 'sales@greenscape.com'),
('Petal Partners', '0733456670', 'info@petalpartners.org');

-- INSERT FLOWERS
INSERT INTO flowers (name, category_id, supplier_id, price, description) VALUES 
('Red Rose', 1, 1, 100.00, 'Classic red roses, perfect for romantic occasions.'),
('White Lily', 2, 2, 120.00, 'Elegant white lilies with fragrance.'),
('Yellow Tulip', 3, 1, 90.00, 'Bright yellow tulips, symbol of cheer.'),
('Purple Orchid', 4, 3, 150.00, 'Delicate purple orchids for gifting.'),
('Pink Daisy', 5, 2, 80.00, 'Cute pink daisies suitable for all occasions.');

-- INSERT INVENTORY
INSERT INTO inventory (flower_id, quantity) VALUES 
(1, 50), (2, 30), (3, 45), (4, 20), (5, 60);

-- INSERT CUSTOMERS
INSERT INTO customers (name, email, phone, address) VALUES 
('Alice Mutua', 'alice.mwende@gmail.com', '0700145825', '156 Flower St, Mombasa'),
('Brian Otieno', 'brian.otieno@yahoo.com', '0718546985', '802 Garden Rd, Nairobi'),
('Cynthia Karanja', 'cynthia.w@gmail.com', '0724523689', '795 Blossom Ave, Kisumu');

-- INSERT ORDERS
INSERT INTO orders (customer_id, order_date, total_amount) VALUES 
(1, '2025-05-05', 300.00),
(2, '2025-05-10', 270.00),
(3, '2025-05-01', 240.00);

-- INSERT ORDER ITEMS
INSERT INTO order_items (order_id, flower_id, quantity, price_per_unit) VALUES 
(1, 1, 2, 100.00), 
(1, 5, 1, 80.00),  
(2, 2, 1, 120.00), 
(2, 3, 2, 90.00),  
(3, 4, 1, 150.00), 
(3, 5, 1, 90.00);
