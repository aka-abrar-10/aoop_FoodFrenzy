-- =============================================
-- Update Chinese Products with High-Quality Images
-- Run this in phpMyAdmin to update existing data
-- =============================================

USE FoodFrenzy;

-- Step 1: Update images for Chinese items
UPDATE product_table SET pimage = '/Images/chinese/chowmein_veg.png' WHERE pname = 'Chowmein' AND pcategory = 'chinese';
UPDATE product_table SET pimage = '/Images/chinese/chowmein_chicken.png' WHERE pname = 'Chicken Chowmein' AND pcategory = 'chinese';
UPDATE product_table SET pimage = '/Images/chinese/fried_rice_veg.png' WHERE pname = 'Fried Rice' AND pcategory = 'chinese';
UPDATE product_table SET pimage = '/Images/chinese/fried_rice_chicken.png' WHERE pname = 'Chicken Fried Rice' AND pcategory = 'chinese';
UPDATE product_table SET pimage = '/Images/chinese/manchurian_veg.png' WHERE pname = 'Manchurian' AND pcategory = 'chinese';
UPDATE product_table SET pimage = '/Images/chinese/manchurian_chicken.png' WHERE pname = 'Chicken Manchurian' AND pcategory = 'chinese';
UPDATE product_table SET pimage = '/Images/chinese/spring_roll.png' WHERE pname = 'Spring Roll' AND pcategory = 'chinese';
UPDATE product_table SET pimage = '/Images/chinese/momo.webp' WHERE (pname = 'Momos' OR pname = 'Chicken Momos') AND pcategory = 'chinese';

-- Verify the update
SELECT pid, pname, pimage, pcategory FROM product_table WHERE pcategory = 'chinese';
SELECT '✅ Chinese food images updated successfully!' AS Status;
