/* ========================================================================
  Project:     Supermarket Sales Analytics
   File:        01_supermarket_select_answers_SQLServer.sql
   Description: SQL practice queries covering SELECT, WHERE, GROUP BY, HAVING,
                string functions, date functions, and aggregates.
   Database:    Microsoft SQL Server (T-SQL)
   Dataset:     supermarket_sales (Kaggle)
   Author:      Tanish Mhatre
   Created On:  2025-11-20
   Version:     1.0
   ======================================================================== */


/* ========================================================================
   SECTION 1: BASIC SELECT STATEMENTS
   ======================================================================== */

/* Q1: Show first 20 records */
SELECT TOP 20 *
FROM supermarket_sales;


/* Q2: Select specific columns: invoice_id, city, total, rating */
select  invoice_id,city,total,rating
FROM supermarket_sales;


/* ========================================================================
   SECTION 2: DISTINCT VALUES
   ======================================================================== */

/* Q3: Show unique product lines */
select distinct  product_line
FROM supermarket_sales;


/* Q4: Show unique payment methods */
select distinct payment
FROM supermarket_sales;


/* ========================================================================
   SECTION 3: FILTERING USING WHERE
   ======================================================================== */

/* Q5: Get all sales from Yangon */
select *
FROM supermarket_sales
where city='yangon';


/* Q6: Get all sales where total > 100 */
select *
FROM supermarket_sales
where total>100;


/* Q7: Get sales where city = 'Yangon' OR payment = 'Cash' */
select*
FROM supermarket_sales
where city='Yangon'or payment='cash';


/* Q8: Exclude rows where product_line = 'Health and beauty' */
select*
FROM supermarket_sales
where product_line !='Health and beauty';


/* ========================================================================
   SECTION 4: LIKE • IN • BETWEEN
   ======================================================================== */

/* Q9 : Show invoice IDs starting with '3' */
select*
FROM supermarket_sales
where invoice_id like '3%';


/* Q10: Show records where rating is between 6 and 8 */
select*
FROM supermarket_sales
where rating between 6 and 8;


/* Q11: Show records where branch is in ('A', 'B') */
select*
FROM supermarket_sales
where branch in ('a','b');


/* ========================================================================
   SECTION 5: NULL CHECKS
   ======================================================================== */

/* Q12: Show rows where rating is NULL */
SELECT *
FROM supermarket_sales
WHERE rating IS NULL;


/* ========================================================================
   SECTION 6: ORDERING RESULTS
   ======================================================================== */

/* Q13: Order all sales by total amount (ascending) */
SELECT*
FROM supermarket_sales
order by total asc


/* Q14: Show top 10 highest total bills */
SELECT top 10*
FROM supermarket_sales
order by total desc


/* ========================================================================
   SECTION 7: COLUMN ALIASES
   ======================================================================== */

/* Q15: Rename total as sale_amount and product_line as category */
SELECT total AS sale_amount,
       product_line AS category
FROM supermarket_sales;


/* ========================================================================
   SECTION 8: MATHEMATICAL EXPRESSIONS
   ======================================================================== */

/* Q16: Calculate price_per_unit = total / quantity */
SELECT invoice_id,
       total / quantity AS price_per_unit
FROM supermarket_sales;


/* ========================================================================
   SECTION 9: STRING FUNCTIONS
   ======================================================================== */

/* Q17: Convert all product lines to uppercase */
SELECT UPPER(product_line) AS product_line_upper
FROM supermarket_sales;


/* Q18: Show invoice IDs along with their string length */
SELECT invoice_id,
       LEN(invoice_id) AS id_length
FROM supermarket_sales;


/* ========================================================================
   SECTION 10: DATE & TIME FUNCTIONS
   ======================================================================== */

/* Q19: Extract day, month, year from date column */
SELECT date,
       DAY(date) AS day,
       MONTH(date) AS month,
       YEAR(date) AS year
FROM supermarket_sales;


/* Q20: Extract hour from time column */
SELECT time,
       DATEPART(HOUR, time) AS hour
FROM supermarket_sales;


/* ========================================================================
   SECTION 11: AGGREGATE FUNCTIONS
   ======================================================================== */

/* Q21: Count total number of sales records */
SELECT COUNT(*) AS total_sales
FROM supermarket_sales;


/* Q22: Find average customer rating */
SELECT AVG(rating) AS avg_rating
FROM supermarket_sales;


/* Q23: Find the total sales revenue */
SELECT SUM(total) AS total_revenue
FROM supermarket_sales;


/* Q24: Find minimum and maximum sale amount */
SELECT MIN(total) AS min_sale,
       MAX(total) AS max_sale
FROM supermarket_sales;


/* ========================================================================
   SECTION 12: GROUP BY
   ======================================================================== */

/* Q25: Show total revenue per product line */
SELECT product_line,
       SUM(total) AS revenue
FROM supermarket_sales
GROUP BY product_line;


/* Q26: Show average rating per branch */
SELECT branch,
       AVG(rating) AS avg_rating
FROM supermarket_sales
GROUP BY branch;


/* Q27: Show count of customers by gender */
SELECT gender,
       COUNT(*) AS total_customers
FROM supermarket_sales
GROUP BY gender;


/* ========================================================================
   SECTION 13: HAVING CLAUSE
   ======================================================================== */

/* Q28: Show product lines with revenue greater than 10000 */
SELECT product_line,
       SUM(total) AS revenue
FROM supermarket_sales
GROUP BY product_line
HAVING SUM(total) > 10000;


/* Q29: Show branches with average rating greater than 7 */
SELECT branch,
       AVG(rating) AS avg_rating
FROM supermarket_sales
GROUP BY branch
HAVING AVG(rating) > 7;


/*extra */

/* Q1: Total tax collected per product line */
SELECT Product_Line,
       SUM(Tax) AS Total_Tax
FROM supermarket_sales
GROUP BY Product_Line
ORDER BY Total_Tax DESC;

/* Q2: Average total sale per branch */
SELECT Branch,
       AVG(Total) AS Avg_Total
FROM supermarket_sales
GROUP BY Branch;

/* Q3: Count of invoices per payment type */
SELECT Payment,
       COUNT(*) AS Total_Invoices
FROM supermarket_sales
GROUP BY Payment
ORDER BY Total_Invoices DESC;

/* Q4: Top 5 highest unit price sales */
SELECT TOP 5 *
FROM supermarket_sales
ORDER BY Unit_Price DESC;

/* Q5: Number of sales per hour */
SELECT DATEPART(HOUR, [time]) AS Sale_Hour,
       COUNT(*) AS Total_Sales
FROM supermarket_sales
GROUP BY DATEPART(HOUR, [time])
ORDER BY Sale_Hour;