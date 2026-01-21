-- FoodFrenzy Sample Data Insert Script
-- Run this after application starts (tables created by Hibernate)

USE FoodFrenzy;

-- Clear existing data first (optional)
-- DELETE FROM orders;
-- DELETE FROM user;
-- DELETE FROM admin;
-- DELETE FROM product_table;

-- =============================================
-- Sample Data - Admin
-- =============================================
INSERT IGNORE INTO admin (admin_name, admin_email, admin_password, admin_number) VALUES
('Admin User', 'admin@foodfrenzy.com', 'admin123', '01700000000'),
('Manager', 'manager@foodfrenzy.com', 'manager123', '01800000000');

-- =============================================
-- Sample Data - Users
-- =============================================
INSERT IGNORE INTO user (uname, uemail, upassword, unumber) VALUES
('John Doe', 'john@example.com', 'password123', 1712345678),
('Jane Smith', 'jane@example.com', 'password456', 1898765432),
('Test User', 'test@example.com', 'test123', 1600000000);

-- =============================================
-- Sample Data - Products
-- =============================================
INSERT IGNORE INTO product_table (pname, pprice, pdescription) VALUES
('Burger', 150.00, 'Delicious beef burger with fresh vegetables'),
('Pizza', 450.00, 'Large cheese pizza with toppings'),
('Sushi', 550.00, 'Fresh Japanese sushi platter'),
('Pasta', 280.00, 'Italian pasta with creamy sauce'),
('Fried Rice', 180.00, 'Special fried rice with vegetables'),
('Chicken Wings', 220.00, 'Crispy fried chicken wings'),
('Biryani', 350.00, 'Aromatic chicken biryani'),
('Noodles', 160.00, 'Chinese style noodles'),
('Sandwich', 120.00, 'Grilled chicken sandwich'),
('Ice Cream', 80.00, 'Chocolate ice cream sundae');

SELECT 'Sample data inserted!' AS Status;
