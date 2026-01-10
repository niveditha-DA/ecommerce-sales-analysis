# View table structure
DESCRIBE ecommerce_sales;

#Check number of rows
SELECT COUNT(*) AS total_rows FROM ecommerce_sales;

#Check Missing Values in All Columns
SELECT 
  SUM(CASE WHEN Order_ID IS NULL THEN 1 ELSE 0 END) AS null_order_id,
  SUM(CASE WHEN Customer_Name IS NULL THEN 1 ELSE 0 END) AS null_customer_name,
  SUM(CASE WHEN Region IS NULL THEN 1 ELSE 0 END) AS null_region,
  SUM(CASE WHEN City IS NULL THEN 1 ELSE 0 END) AS null_city,
  SUM(CASE WHEN Category IS NULL THEN 1 ELSE 0 END) AS null_category,
  SUM(CASE WHEN Sub_Category IS NULL THEN 1 ELSE 0 END) AS null_sub_category,
  SUM(CASE WHEN Product_Name IS NULL THEN 1 ELSE 0 END) AS null_product_name,
  SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS null_quantity,
  SUM(CASE WHEN Unit_Price IS NULL THEN 1 ELSE 0 END) AS null_unit_price,
  SUM(CASE WHEN Discount IS NULL THEN 1 ELSE 0 END) AS null_discount,
  SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS null_sales,
  SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS null_profit,
  SUM(CASE WHEN Payment_Mode IS NULL THEN 1 ELSE 0 END) AS null_payment_mode,
  SUM(CASE WHEN days IS NULL THEN 1 ELSE 0 END) AS null_days,
  SUM(CASE WHEN month IS NULL THEN 1 ELSE 0 END) AS null_month,
  SUM(CASE WHEN Order_Date IS NULL THEN 1 ELSE 0 END) AS null_order_date
FROM ecommerce_sales;

#Check Duplicate Records
SELECT 
    Order_ID, Customer_Name, Region, City, Category, Sub_Category,
    Product_Name, Quantity, Unit_Price, Discount, Sales, Profit,
    Payment_Mode, days, month, Order_Date,
    COUNT(*) AS duplicate_count
FROM ecommerce_sales
GROUP BY 
    Order_ID, Customer_Name, Region, City, Category, Sub_Category,
    Product_Name, Quantity, Unit_Price, Discount, Sales, Profit,
    Payment_Mode, days, month, Order_Date
HAVING COUNT(*) > 1;

#count of duplicates
SELECT 
    COUNT(*) - COUNT(DISTINCT 
        CONCAT_WS('|', Order_ID, Customer_Name, Region, City, Category,
                  Sub_Category, Product_Name, Quantity, Unit_Price,
                  Discount, Sales, Profit, Payment_Mode, days, month, 
                  Order_Date)
    ) AS total_duplicate_rows
FROM ecommerce_sales;

DESCRIBE ecommerce_sales;

#Check invalid date format
SELECT *
FROM ecommerce_sales
WHERE Order_Date IS NULL;

#Clean & Standardize Text Columns
UPDATE ecommerce_sales
SET 
  Customer_Name = TRIM(Customer_Name),
  Region = TRIM(Region),
  City = TRIM(City),
  Category = TRIM(Category),
  Sub_Category = TRIM(Sub_Category),
  Product_Name = TRIM(Product_Name),
  Payment_Mode = TRIM(Payment_Mode);
  
#Categorical Value Distribution
SELECT Region, COUNT(*) AS count_region
FROM ecommerce_sales
GROUP BY Region
ORDER BY count_region DESC;

SELECT Category, COUNT(*) AS count_category
FROM ecommerce_sales
GROUP BY Category
ORDER BY count_category DESC;

SELECT Payment_Mode, COUNT(*) AS count_payment
FROM ecommerce_sales
GROUP BY Payment_Mode
ORDER BY count_payment DESC;

SELECT City, COUNT(*) AS count_city
FROM ecommerce_sales
GROUP BY City
ORDER BY count_city DESC;

#Summary Statistics
SELECT 
    MIN(Sales) AS min_sales,
    MAX(Sales) AS max_sales,
    AVG(Sales) AS avg_sales,
    SUM(Sales) AS total_sales,
    STD(Sales) AS std_sales
FROM ecommerce_sales;

SELECT 
    MIN(Profit) AS min_profit,
    MAX(Profit) AS max_profit,
    AVG(Profit) AS avg_profit,
    SUM(Profit) AS total_profit,
    STD(Profit) AS std_profit
FROM ecommerce_sales;

SELECT 
    MIN(Quantity) AS min_qty,
    MAX(Quantity) AS max_qty,
    AVG(Quantity) AS avg_qty,
    SUM(Quantity) AS total_qty,
    STD(Quantity) AS std_qty
FROM ecommerce_sales;

#Time-Based Analysis
SELECT month, SUM(Sales) AS sales_by_month
FROM ecommerce_sales
GROUP BY month
ORDER BY month;

SELECT days, SUM(Sales) AS sales_by_day
FROM ecommerce_sales
GROUP BY days
ORDER BY days;

#Outlier Check
SELECT *
FROM ecommerce_sales
WHERE Sales > (SELECT AVG(Sales) + 3 * STD(Sales) FROM ecommerce_sales)
   OR Sales < (SELECT AVG(Sales) - 3 * STD(Sales) FROM ecommerce_sales);

SELECT *
FROM ecommerce_sales
WHERE Profit > (SELECT AVG(Profit) + 3 * STD(Profit) FROM ecommerce_sales)
   OR Profit < (SELECT AVG(Profit) - 3 * STD(Profit) FROM ecommerce_sales);
   
SELECT *
FROM ecommerce_sales
WHERE Quantity > (SELECT AVG(Quantity) + 3 * STD(Quantity) FROM ecommerce_sales)
   OR Quantity < (SELECT AVG(Quantity) - 3 * STD(Quantity) FROM ecommerce_sales);
   
   #Feature Engineering
   SELECT 
    *, 
    (Profit / Sales) AS profit_margin
FROM ecommerce_sales;

SELECT 
    *, 
    (Discount / Unit_Price) * 100 AS discount_percentage
FROM ecommerce_sales;

SELECT 
    *, 
    (Sales / Quantity) AS revenue_per_item
FROM ecommerce_sales;

SELECT 
    *, 
    MONTHNAME(Order_Date) AS month_name
FROM ecommerce_sales;

SELECT 
    YEAR(Order_Date) AS Year,
    SUM(Sales) AS Total_Sales
FROM ecommerce_sales
GROUP BY YEAR(Order_Date)
ORDER BY Year;

WITH yearly_sales AS (
    SELECT 
        YEAR(Order_Date) AS Year,
        SUM(Sales) AS Total_Sales
    FROM ecommerce_sales
    GROUP BY YEAR(Order_Date)
)
SELECT 
    y1.Year,
    y1.Total_Sales,
    ROUND(
        ((y1.Total_Sales - y2.Total_Sales) / y2.Total_Sales) * 100,
        2
    ) AS YoY_Growth_Percentage
FROM yearly_sales y1
LEFT JOIN yearly_sales y2 
    ON y1.Year = y2.Year + 1
ORDER BY y1.Year;






















