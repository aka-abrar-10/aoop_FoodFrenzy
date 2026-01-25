-- =============================================
-- Update Bangladeshi Products to English Names
-- Run this in phpMyAdmin to update existing data
-- =============================================

USE FoodFrenzy;

-- Step 1: Delete old Bangladeshi products (with Bengali names)
DELETE FROM product_table WHERE pcategory = 'bangladeshi';

-- Step 2: Insert new Bangladeshi products with English names
INSERT INTO product_table (pname, pprice, pdescription, pimage, pcategory, prating) VALUES
('Luchi', 15.00, 'Traditional fried puffed bread', './Images/bangladeshi/luchi.png', 'bangladeshi', 4.5),
('Porota', 20.00, 'Layered fried flatbread', './Images/bangladeshi/porota.png', 'bangladeshi', 4.6),
('Fuchka', 60.00, 'Crispy shells with tangy tamarind water', './Images/bangladeshi/fuchka.png', 'bangladeshi', 4.8),
('Chotpoti', 50.00, 'Spicy chickpea street snack', './Images/bangladeshi/chotpoti.png', 'bangladeshi', 4.5),
('Haleem', 180.00, 'Slow cooked meat and lentil stew', './Images/bangladeshi/haleem.png', 'bangladeshi', 4.9),
('Pitha', 80.00, 'Steamed rice cake with molasses', './Images/bangladeshi/pitha.png', 'bangladeshi', 4.7),
('Mishti Doi', 60.00, 'Sweet caramelized yogurt dessert', './Images/bangladeshi/mishti_doi.png', 'bangladeshi', 4.8),
('Roshogolla', 40.00, 'Soft cheese balls in sugar syrup', './Images/bangladeshi/roshogolla.png', 'bangladeshi', 4.6),
('Shingara', 25.00, 'Crispy potato filled samosa', './Images/bangladeshi/shingara.png', 'bangladeshi', 4.4),
('Jhalmuri', 30.00, 'Spicy puffed rice street snack', './Images/bangladeshi/jhalmuri.png', 'bangladeshi', 4.5);

-- Verify the update
SELECT pid, pname, pprice, pcategory FROM product_table WHERE pcategory = 'bangladeshi';
SELECT '✅ Bangladeshi products updated to English!' AS Status;
