show tables;
SELECT COUNT(*) FROM ecommerce_sales;

### Monthly Trend
SELECT
    YEAR(Order_Date) AS year,
    MONTH(Order_Date) AS month,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM ecommerce_sales
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY year, month;

### Yearly Trend
SELECT
    YEAR(Order_Date) AS year,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM ecommerce_sales
GROUP BY YEAR(Order_Date)
ORDER BY year;

### Discount Effectiveness Analysis
SELECT
    Discount,
    COUNT(Order_ID) AS total_orders,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS profit_margin_pct
FROM ecommerce_sales
GROUP BY Discount
ORDER BY Discount;

### Risk & Loss Impact Analysis
SELECT
    Category,
    Region,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM ecommerce_sales
GROUP BY Category, Region
HAVING total_profit < 0
ORDER BY total_profit;

### Category-wise Profitability
SELECT
    Category,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS profit_margin_pct
FROM ecommerce_sales
GROUP BY Category
ORDER BY profit_margin_pct DESC;

### High Sales but Low Profit Products
SELECT
    Product_Name,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM ecommerce_sales
GROUP BY Product_Name
HAVING SUM(Sales) > (
    SELECT AVG(Sales) FROM ecommerce_sales
)
AND SUM(Profit) < (
    SELECT AVG(Profit) FROM ecommerce_sales
)
ORDER BY total_sales DESC;

### Payment Mode Preference
SELECT
    Payment_Mode,
    COUNT(Order_ID) AS total_orders,
    SUM(Sales) AS total_sales
FROM ecommerce_sales
GROUP BY Payment_Mode
ORDER BY total_orders DESC;

### Regional Performance Analysis
SELECT
    Region,
    COUNT(Order_ID) AS total_orders,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM ecommerce_sales
GROUP BY Region
ORDER BY total_sales DESC;

### Customer Loyalty & Repeat Purchase Analysis
SELECT
    Customer_Name,
    COUNT(Order_ID) AS total_orders,
    SUM(Sales) AS total_sales
FROM ecommerce_sales
GROUP BY Customer_Name
HAVING total_orders > 1
ORDER BY total_orders DESC;

### Poor / Negative Impact Products
SELECT
    Product_Name,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM ecommerce_sales
GROUP BY Product_Name
HAVING total_profit < 0
ORDER BY total_profit;

### Top 5 & Bottom 5 Products (by Sales)
## Top 5
SELECT
    Product_Name,
    SUM(Sales) AS total_sales
FROM ecommerce_sales
GROUP BY Product_Name
ORDER BY total_sales DESC
LIMIT 5;
## Bottom 5 
SELECT
    Product_Name,
    SUM(Sales) AS total_sales
FROM ecommerce_sales
GROUP BY Product_Name
ORDER BY total_sales ASC
LIMIT 5;

### Average Order Value (AOV)
SELECT
    ROUND(SUM(Sales) / COUNT(DISTINCT Order_ID), 2) AS average_order_value
FROM ecommerce_sales;

### Year-over-Year Growth (Sales & Profit)
SELECT
    YEAR(Order_Date) AS year,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit,
    LAG(SUM(Sales)) OVER (ORDER BY YEAR(Order_Date)) AS prev_year_sales,
    ROUND(
        (SUM(Sales) - LAG(SUM(Sales)) OVER (ORDER BY YEAR(Order_Date)))
        / LAG(SUM(Sales)) OVER (ORDER BY YEAR(Order_Date)) * 100, 2
    ) AS yoy_sales_growth_pct
FROM ecommerce_sales
GROUP BY YEAR(Order_Date);

### Low-Selling Products
SELECT
    Product_Name,
    SUM(Sales) AS total_sales
FROM ecommerce_sales
GROUP BY Product_Name
HAVING total_sales < (
    SELECT AVG(Sales) FROM ecommerce_sales
)
ORDER BY total_sales;

### Loss-Making Products
SELECT
    Product_Name,
    SUM(Profit) AS total_loss
FROM ecommerce_sales
GROUP BY Product_Name
HAVING total_loss < 0
ORDER BY total_loss;












