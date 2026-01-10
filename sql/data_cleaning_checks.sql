# CHECK MISSING OR BLANK VALUES
SELECT *
FROM ecommerce_sales
WHERE Order_ID IS NULL
   OR Customer_Name IS NULL
   OR Order_Date IS NULL
   OR Sales IS NULL;
# CHECK INVALID DATE FORMATS
SELECT Order_Date
FROM ecommerce_sales
WHERE STR_TO_DATE(Order_Date, '%d-%m-%Y') IS NULL;

# CHECK NEGATIVE VALUES
SELECT *
FROM ecommerce_sales
WHERE Sales < 0 OR Quantity < 0 OR Profit < 0;

# CHECK FOR DUPLICATE ORDER ID's
SELECT Order_ID, COUNT(*)
FROM ecommerce_sales
GROUP BY Order_ID
HAVING COUNT(*) > 1;

#CHECK INVALID CATEGORY NAMES
SELECT DISTINCT Category
FROM ecommerce_sales;


SELECT Order_Date
FROM ecommerce_sales;






