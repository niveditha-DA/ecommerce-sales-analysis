# E-Commerce Sales & Profit Analysis 

## Project Overview
This project demonstrates an end-to-end **Data Analyst workflow** using **MySQL**, **Power BI**, and **SQL-based analytics**.  
It focuses on **data cleaning, data validation, exploratory data analysis (EDA), business intelligence, and dashboard visualization** to derive actionable insights from an e-commerce sales dataset.

---

## Problem Statement
Raw e-commerce transactional data often contains **missing values, duplicates, inconsistent formats, and invalid records**, making analysis unreliable.  
The objective of this project is to **clean and validate the dataset**, perform **exploratory and business analysis**, and build an **interactive Power BI dashboard** to support data-driven decision-making.

---

## Dataset Details
- Domain: E-commerce
- Format: CSV
- Records: ~5000 rows
- Key Fields:
  - Order_Date
  - Product_Name
  - Category
  - Sales
  - Profit
  - Profit_Margin
  - Quantity
  - Discount
  - Payment_Mode
  - Customer_Name

---

## Tools & Technologies
- **MySQL** – Data cleaning, data quality checks, EDA, and business queries  
- **SQL** – Joins, aggregations, filtering, grouping, conditional logic  
- **Power BI** – Data modeling, DAX measures, dashboard development  
- **DAX** – KPIs, profit margin, AOV, trend calculations  
  

---

## 📂 Project Structure

The project follows a structured workflow for data analysis:

1. **data/**  
   Contains the raw CSV dataset used for analysis:  
   [View raw dataset](https://github.com/niveditha-DA/ecommerce-sales-analysis/blob/main/data/raw_data.csv)


2. **sql/**  
   Includes SQL scripts for:
   - Data cleaning → [data_cleaning.sql](https://github.com/niveditha-DA/ecommerce-sales-analysis/blob/main/sql/data_cleaning.sql)
   - Data quality checks → [data_cleaning_checks.sql](https://github.com/niveditha-DA/ecommerce-sales-analysis/blob/main/sql/data_cleaning_checks.sql)
   - Exploratory Data Analysis (EDA) → [eda.sql](https://github.com/niveditha-DA/ecommerce-sales-analysis/blob/main/sql/eda.sql)
   - Business analysis queries → [business_questions.sql](https://github.com/niveditha-DA/ecommerce-sales-analysis/blob/main/sql/Business_questions.sql)

3. **images/**  
   Stores dashboard screenshots used in documentation:
   - [Overview Dashboard](https://github.com/niveditha-DA/ecommerce-sales-analysis/blob/main/images/dashboard_overview.png)
   - [Risk Analysis Dashboard](https://github.com/niveditha-DA/ecommerce-sales-analysis/blob/main/images/dashboard_risk.png)
   - [Risk Analysis Dashboard (Profit)](https://github.com/niveditha-DA/ecommerce-sales-analysis/blob/main/images/dashboard_risk1.png)

4. **powerbi/**  
   Contains the Power BI dashboard file:  
   [Download Power BI dashboard](https://github.com/niveditha-DA/ecommerce-sales-analysis/blob/main/powerbi/ecommerce_sales_project.pbix)


---

## Project Workflow
1. Imported raw CSV data into MySQL  
2. Performed **data cleaning**:
   - Removed duplicate records
   - Handled missing and invalid values
   - Corrected data types
   - Standardized categorical data  
3. Conducted **data validation checks** to ensure data quality  
4. Executed **Exploratory Data Analysis (EDA)** to identify trends and patterns  
5. Answered **business-driven analytical questions** using SQL  
6. Connected MySQL to Power BI for reporting  
7. Created **DAX measures** for KPIs and calculations  
8. Built an **interactive Power BI dashboard** for insights visualization  

---



## Power BI Dashboard
The dashboard provides business insights through:
- Total Revenue, Profit, and Profit Margin KPIs  
- Monthly Sales and Profit Trend Analysis  
- Category Performance Comparison  
- Sales Distribution by Payment Method  
- Average Order Value (AOV)  
- Top & Bottom Products by Revenue and Profit  
- Discount and Profit Risk Analysis  

---

## Dashboard Preview
**Executive Summary (Overview):**
- Total revenue reached **534M** with an overall profit of **80M**, resulting in a **14.94% profit margin**
- The business processed **5,000 orders** from **4,844 customers**, indicating a strong and consistent customer base
- Monthly sales and profit trends remain stable throughout the year, showing steady demand without major fluctuations
- Home Decor and Electronics emerge as the strongest revenue-generating categories
- Average Order Value (AOV) remains balanced across categories, reflecting consistent customer spending behavior
- Overall performance indicates stable growth, diversified revenue streams, and sustainable profitability


### Overview Page
![Overview Dashboard](images/dashboard_overview.png)

**Executive Summary (Risk Analysis):**
- Moderate discount levels (**6–10% and 11–15%**) contribute positively to both sales volume and profitability.
- Higher discount ranges (**16–20%**) increase revenue but significantly reduce profit margins, indicating margin erosion risk.
- Revenue analysis shows dependency on a limited number of top-performing products, increasing concentration risk.
- Several products generate high revenue but contribute low profit margins, highlighting potential inefficiencies in pricing strategy.
- Low-revenue and low-profit-margin products represent underperforming inventory that may require repricing, promotion, or discontinuation.
- Profit-focused analysis reveals clear trade-offs between aggressive discounting and sustainable profitability.
- The risk insights support data-driven decisions around **discount optimization, product rationalization, and margin improvement strategies**.


### Risk Analysis Page
![Risk Dashboard](images/dashboard_risk.png)
![Risk Dashboard](images/dashboard_risk1.png)

---
## 📌  Recommendations
- Focus on moderate discount levels (6–15%) to achieve a balance between sales growth and sustainable profitability while avoiding margin erosion from heavy discounting.
- Review and optimize pricing or cost structures for high-revenue but low-margin products to improve overall business profitability.
- Reduce dependency on a limited set of top-performing products by strengthening mid-tier product performance and diversifying revenue sources.
- Regularly monitor profit margins, discount impact, and underperforming products through dashboards to enable proactive, data-driven decision-making.


---
## ✅ Conclusion
This project demonstrates an end-to-end e-commerce sales analysis, transforming raw data into actionable business insights through structured SQL analysis and interactive Power BI dashboards. The findings highlight the importance of balanced discount strategies, product-level profitability monitoring, and risk-aware decision-making to support sustainable business growth.
