-- =============================================
-- FoodFrenzy Complete Database Setup Script
-- For XAMPP MySQL - WITH IMAGES
-- =============================================
-- Run this in phpMyAdmin or MySQL command line

-- Step 1: Create Database
CREATE DATABASE IF NOT EXISTS FoodFrenzy;
USE FoodFrenzy;

-- =============================================
-- Step 2: Drop existing tables to recreate with new structure
-- =============================================
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS admin;
DROP TABLE IF EXISTS product_table;

-- =============================================
-- Step 3: Create Tables with updated structure
-- =============================================

-- Admin Table
CREATE TABLE admin (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    admin_name VARCHAR(255) NOT NULL,
    admin_email VARCHAR(255) NOT NULL UNIQUE,
    admin_password VARCHAR(255),
    admin_number VARCHAR(20)
);

-- User Table
CREATE TABLE user (
    u_id INT AUTO_INCREMENT PRIMARY KEY,
    uname VARCHAR(255),
    uemail VARCHAR(255) UNIQUE,
    upassword VARCHAR(255),
    unumber BIGINT
);

-- Product Table (Updated with image, category, rating)
CREATE TABLE product_table (
    pid INT AUTO_INCREMENT PRIMARY KEY,
    pname VARCHAR(255),
    pprice DOUBLE,
    pdescription TEXT,
    pimage VARCHAR(500),
    pcategory VARCHAR(50),
    prating DOUBLE DEFAULT 4.5
);

-- Orders Table (with foreign key to user)
CREATE TABLE orders (
    o_id INT AUTO_INCREMENT PRIMARY KEY,
    o_name VARCHAR(255),
    o_price DOUBLE,
    o_quantity INT,
    order_date DATETIME,
    total_ammout DOUBLE,
    user_u_id INT,
    FOREIGN KEY (user_u_id) REFERENCES user(u_id) ON DELETE CASCADE
);

-- =============================================
-- Step 4: Insert Admin Data
-- =============================================
INSERT INTO admin (admin_name, admin_email, admin_password, admin_number) VALUES
('Super Admin', 'admin@foodfrenzy.com', 'admin123', '01700000001'),
('Manager', 'manager@foodfrenzy.com', 'manager123', '01700000002'),
('Staff Admin', 'staff@foodfrenzy.com', 'staff123', '01700000003');

-- =============================================
-- Step 5: Insert User Data (Customers)
-- =============================================
INSERT INTO user (uname, uemail, upassword, unumber) VALUES
('Rahim Ahmed', 'rahim@gmail.com', 'rahim123', 1711111111),
('Karim Khan', 'karim@gmail.com', 'karim123', 1722222222),
('Jalil Uddin', 'jalil@gmail.com', 'jalil123', 1733333333),
('Fatema Begum', 'fatema@gmail.com', 'fatema123', 1744444444),
('Salma Akter', 'salma@gmail.com', 'salma123', 1755555555),
('Abrar Hossain', 'abrar@gmail.com', 'abrar123', 1766666666),
('Nadia Islam', 'nadia@gmail.com', 'nadia123', 1777777777),
('Test User', 'test@test.com', 'test123', 1788888888);

-- =============================================
-- Step 6: Insert Product Data (From Frontend with Images)
-- =============================================

-- Biryani Items
INSERT INTO product_table (pname, pprice, pdescription, pimage, pcategory, prating) VALUES
('Chicken Biryani', 410.00, 'Aromatic basmati rice with tender chicken', './Images/biryani/Biryani_of_Hyderabadi.jpg', 'biryani', 4.5),
('Mutton Biryani', 520.00, 'Premium mutton biryani with special masala', './Images/biryani/Biryani_of_Hyderabadi.jpg', 'biryani', 4.8),
('Kacchi Biryani', 480.00, 'Traditional Dhaka style kacchi biryani', './Images/biryani/Biryani_of_Hyderabadi.jpg', 'biryani', 5.0);

-- Paneer Items
INSERT INTO product_table (pname, pprice, pdescription, pimage, pcategory, prating) VALUES
('Paneer Butter Masala', 290.00, 'Creamy paneer in rich tomato gravy', './Images/paneer/paneer-butter-masala.jpg', 'paneer', 4.5),
('Paneer Do Pyaza', 270.00, 'Paneer with double onion gravy', './Images/paneer/paneer-do-pyaza.jpg', 'paneer', 5.0),
('Paneer Tikka', 250.00, 'Grilled paneer with spices', './Images/paneer/paneer-butter-masala.jpg', 'paneer', 4.3),
('Shahi Paneer', 280.00, 'Royal paneer in creamy cashew gravy', './Images/paneer/paneer-butter-masala.jpg', 'paneer', 4.7);

-- Chicken Items
INSERT INTO product_table (pname, pprice, pdescription, pimage, pcategory, prating) VALUES
('Afgani Chicken', 410.00, 'Succulent chicken in Afgani spices', './Images/chicken/Afgani-chicken-curry.jpg', 'chicken', 4.5),
('Butter Chicken', 380.00, 'Classic creamy butter chicken curry', './Images/chicken/butter-chicken.jpg', 'chicken', 5.0),
('Matka Chicken', 510.00, 'Traditional clay pot chicken curry', './Images/chicken/Matka-Chicken.jpg', 'chicken', 5.0),
('Chicken Tikka', 310.00, 'Smoky tandoori chicken chunks', './Images/chicken/Tandoori-chicken-tikka.jpg', 'chicken', 4.0),
('Tandoori Chicken', 450.00, 'Classic tandoori marinated chicken', './Images/chicken/Tandoori-chicken-tikka.jpg', 'chicken', 4.6),
('Chicken Korma', 350.00, 'Mild creamy chicken curry', './Images/chicken/butter-chicken.jpg', 'chicken', 4.4),
('Chicken Roast', 550.00, 'Whole roasted chicken with spices', './Images/chicken/Afgani-chicken-curry.jpg', 'chicken', 4.8);

-- North Indian Items
INSERT INTO product_table (pname, pprice, pdescription, pimage, pcategory, prating) VALUES
('Laccha Paratha', 30.00, 'Flaky layered Indian flatbread', './Images/north-india-food/Laccha-Paratha.jpg', 'north-indian', 4.5),
('Chilli Potato', 150.00, 'Crispy potato in spicy sauce', './Images/north-india-food/Honey-Chilli-Potato.jpg', 'north-indian', 4.5),
('Chola Bhatura', 180.00, 'Spicy chickpeas with fried bread', './Images/north-india-food/chola-bhatura.jpg', 'north-indian', 4.5),
('Gulab Jamun', 50.00, 'Sweet milk dumplings in syrup', './Images/north-india-food/Gulab Jamun.jpg', 'north-indian', 4.0),
('Naan', 25.00, 'Soft tandoor baked flatbread', './Images/north-india-food/Laccha-Paratha.jpg', 'north-indian', 4.3),
('Butter Naan', 35.00, 'Butter topped soft naan bread', './Images/north-india-food/Laccha-Paratha.jpg', 'north-indian', 4.5),
('Dal Makhani', 180.00, 'Creamy black lentils cooked overnight', './Images/north-india-food/chola-bhatura.jpg', 'north-indian', 4.7),
('Aloo Paratha', 60.00, 'Potato stuffed Indian flatbread', './Images/north-india-food/Laccha-Paratha.jpg', 'north-indian', 4.4),
('Raita', 40.00, 'Yogurt with cucumber and spices', './Images/north-india-food/chola-bhatura.jpg', 'north-indian', 4.2),
('Rasmalai', 80.00, 'Sweet cheese patties in milk', './Images/north-india-food/Gulab Jamun.jpg', 'north-indian', 4.8);

-- Chinese Items
INSERT INTO product_table (pname, pprice, pdescription, pimage, pcategory, prating) VALUES
('Chowmein', 150.00, 'Stir-fried noodles with vegetables', './Images/chinese/chowmein.jpg', 'chinese', 4.5),
('Chicken Chowmein', 200.00, 'Noodles with chicken and vegetables', './Images/chinese/chowmein.jpg', 'chinese', 4.6),
('Fried Rice', 140.00, 'Classic vegetable fried rice', './Images/chinese/chowmein.jpg', 'chinese', 4.3),
('Chicken Fried Rice', 180.00, 'Fried rice with chicken chunks', './Images/chinese/chowmein.jpg', 'chinese', 4.5),
('Manchurian', 160.00, 'Crispy veg balls in tangy sauce', './Images/chinese/chowmein.jpg', 'chinese', 4.4),
('Chicken Manchurian', 200.00, 'Chicken balls in manchurian sauce', './Images/chinese/chowmein.jpg', 'chinese', 4.6),
('Spring Roll', 80.00, 'Crispy vegetable spring rolls', './Images/chinese/chowmein.jpg', 'chinese', 4.2),
('Momos', 100.00, 'Steamed dumplings with filling', './Images/chinese/chowmein.jpg', 'chinese', 4.7),
('Chicken Momos', 120.00, 'Steamed chicken dumplings', './Images/chinese/chowmein.jpg', 'chinese', 4.8);

-- =============================================
-- Step 7: Insert Some Sample Orders
-- =============================================
INSERT INTO orders (o_name, o_price, o_quantity, order_date, total_ammout, user_u_id) VALUES
('Chicken Biryani', 410.00, 2, NOW(), 820.00, 1),
('Butter Chicken', 380.00, 1, NOW(), 380.00, 1),
('Paneer Butter Masala', 290.00, 2, NOW(), 580.00, 2),
('Chowmein', 150.00, 3, NOW(), 450.00, 3),
('Matka Chicken', 510.00, 1, NOW(), 510.00, 4),
('Gulab Jamun', 50.00, 10, NOW(), 500.00, 5),
('Afgani Chicken', 410.00, 2, NOW(), 820.00, 6),
('Laccha Paratha', 30.00, 5, NOW(), 150.00, 6);

-- =============================================
-- Verification Queries
-- =============================================
SELECT '✅ Database Setup Complete!' AS Status;

SELECT 'Admin Count:' AS Info, COUNT(*) AS Total FROM admin;
SELECT 'User Count:' AS Info, COUNT(*) AS Total FROM user;
SELECT 'Product Count:' AS Info, COUNT(*) AS Total FROM product_table;
SELECT 'Order Count:' AS Info, COUNT(*) AS Total FROM orders;

-- Show all products
SELECT pid, pname, pprice, pcategory, prating FROM product_table;

-- =============================================
-- Login Credentials for Testing
-- =============================================
-- ADMIN LOGINS:
-- Email: admin@foodfrenzy.com | Password: admin123
-- Email: manager@foodfrenzy.com | Password: manager123
--
-- CUSTOMER LOGINS:
-- Email: rahim@gmail.com | Password: rahim123
-- Email: abrar@gmail.com | Password: abrar123
-- Email: test@test.com | Password: test123
-- =============================================
