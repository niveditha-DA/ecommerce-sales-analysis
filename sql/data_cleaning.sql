SELECT * FROM ecommerce_sales;
# CREATE BACKUP
CREATE TABLE ecommerce_sales_backup AS
SELECT * FROM ecommerce_sales;

#INSPECT CURRENT SCHEMA & SAMPLE ROWS
DESCRIBE ecommerce_sales;
SELECT * FROM ecommerce_sales LIMIT 10;

#CHECK FOR NULLS/MISSING VALUES
SELECT
  SUM(Order_ID IS NULL) AS missing_order_id,
  SUM(Order_Date IS NULL) AS missing_order_date,
  SUM(Customer_Name IS NULL) AS missing_customer,
  SUM(Region IS NULL) AS missing_region,
  SUM(City IS NULL) AS missing_city,
  SUM(Category IS NULL) AS missing_category,
  SUM(Quantity IS NULL) AS missing_quantity,
  SUM(Unit_Price IS NULL) AS missing_unit_price,
  SUM(Discount IS NULL) AS missing_discount,
  SUM(Sales IS NULL) AS missing_sales,
  SUM(Profit IS NULL) AS missing_profit
FROM ecommerce_sales;

#STANDARDIZE TEXT FIELD
SELECT DISTINCT TRIM(Region) AS region_trimmed FROM ecommerce_sales LIMIT 100;
UPDATE ecommerce_sales
SET Region = TRIM(Region),
    City = TRIM(City),
    Category = TRIM(Category),
    Sub_Category = TRIM(Sub_Category),
    Customer_Name = TRIM(Customer_Name);
    
# CONVERT ORDER_DATE FROM TEXT(DD-MM-YYYY)
SELECT Order_ID, Order_Date,
       STR_TO_DATE(Order_Date, '%d-%m-%Y') AS parsed_date
FROM ecommerce_sales
LIMIT 10;

# ADD NEW COLUMN
ALTER TABLE ecommerce_sales
ADD COLUMN Order_Date_parsed DATE;

# POPULATE THE NEW COLUMN
UPDATE ecommerce_sales
SET Order_Date_parsed = STR_TO_DATE(Order_Date, '%d-%m-%Y')
WHERE Order_Date IS NOT NULL;

#VERIFY SUCESS 
SELECT MIN(Order_Date_parsed), MAX(Order_Date_parsed), COUNT(*) 
FROM ecommerce_sales
WHERE Order_Date_parsed IS NULL;

#IF ALL GOOD,DROP ORIGINAL & RENAME
ALTER TABLE ecommerce_sales DROP COLUMN Order_Date;
ALTER TABLE ecommerce_sales CHANGE COLUMN Order_Date_parsed Order_Date DATE;

# ENSURE DISCOUNT
#####CHECK DISTRIBUTIONS#####
SELECT MIN(Discount) AS min_discount, MAX(Discount) AS max_discount, AVG(Discount) AS avg_discount
FROM ecommerce_sales;
#####VERIFY DOES IT CONTAIN ANY DEMICAL#####
UPDATE ecommerce_sales
SET Discount = Discount * 100
WHERE Discount < 1;

# RECALCULATE SALES USING DISCOUNT AS PERCENTAGE
SELECT Order_ID, Quantity, Unit_Price, Discount,
       Quantity * Unit_Price * (1 - Discount/100) AS recalculated_sales
FROM ecommerce_sales
LIMIT 10;

# UPDATE THE RECALCULATED TABLE
UPDATE ecommerce_sales
SET Sales = Quantity * Unit_Price * (1 - Discount/100);

# VALIDATE PROFIT 
-- Check negative profit rows
SELECT COUNT(*) AS negative_profit_count
FROM ecommerce_sales
WHERE Profit < 0;

-- Check profit greater than sales
SELECT COUNT(*) AS profit_gt_sales
FROM ecommerce_sales
WHERE Profit > Sales;

#RECOMPUTE PROFIT
SELECT Order_ID, Sales, Profit
FROM ecommerce_sales
WHERE Profit > Sales OR Profit < 0
LIMIT 100;

DESCRIBE ecommerce_sales;

#BASIC OUTLIER DETECTION
SELECT
  MIN(Quantity), MAX(Quantity), AVG(Quantity), STDDEV_POP(Quantity) AS sd_quantity,
  MIN(Unit_Price), MAX(Unit_Price), AVG(Unit_Price), STDDEV_POP(Unit_Price) AS sd_unit_price,
  MIN(Sales), MAX(Sales), AVG(Sales), STDDEV_POP(Sales) AS sd_sales,
  MIN(Profit), MAX(Profit), AVG(Profit), STDDEV_POP(Profit) AS sd_profit
FROM ecommerce_sales;

#20 LARGEST SALES
SELECT Order_ID, Customer_Name, Region, City, Category, Sales, Profit
FROM ecommerce_sales
ORDER BY Sales DESC
LIMIT 20;

#DISTRIBUTION CHECKS(category,region)
SELECT Category, COUNT(*) AS orders, SUM(Sales) AS total_sales
FROM ecommerce_sales
GROUP BY Category
ORDER BY total_sales DESC;

SELECT Region, COUNT(*) AS orders, SUM(Sales) AS total_sales
FROM ecommerce_sales
GROUP BY Region
ORDER BY total_sales DESC;

# DATE & RANGE
SELECT MIN(Order_Date) AS start_date, MAX(Order_Date) AS end_date, COUNT(*) AS total_orders
FROM ecommerce_sales;

-- Monthly sales
SELECT DATE_FORMAT(Order_Date, '%Y-%m') AS yearly_month, SUM(Sales) AS monthly_sales, COUNT(*) AS orders
FROM ecommerce_sales
GROUP BY yearly_month
ORDER BY yearly_month;

# FINAL CHECKS 
SELECT
  SUM(Order_Date IS NULL) AS missing_date,
  SUM(Sales IS NULL) AS missing_sales,
  SUM(Unit_Price IS NULL) AS missing_unit_price
FROM ecommerce_sales;

#FINAL CKECK FOR TOP 20 ROWS
SELECT * FROM ecommerce_sales LIMIT 20;

select order_date from ecommerce_sales;
 
 select * from ecommerce_sales;

































