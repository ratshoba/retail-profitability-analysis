-- ============================================
-- Retail Profitability Analysis
-- Business question: Which product categories and regions
-- are most profitable, and where is the company losing money?
-- ============================================

-- Step 1: Preview the raw data to understand the columns available
select * from "Sample_ Superstore"
LIMIT 10;

-- Step 2: Total profit by product category
-- Goal: Identify which high-level category (Furniture, Office Supplies,
-- Technology) contributes the most to overall profit
SELECT Category, ROUND(SUM(Profit), 2) AS total_profit 
FROM "Sample_ Superstore" 
GROUP BY Category 
ORDER BY total_profit DESC; 

-- Step 3: Total profit by region
-- Goal: See which regions drive the most profit and which underperform
SELECT Region, ROUND(SUM(Profit), 2) AS total_profit 
FROM "Sample_ Superstore" 
GROUP BY Region 
ORDER BY total_profit DESC; 

-- Step 4: Least profitable sub-categories (top 5 worst)
-- Goal: Drill down below category level to find exactly which products
-- are losing the company money, since Furniture as a whole looked weak
SELECT "Sub-Category", ROUND(SUM(Profit), 2) AS total_profit 
FROM "Sample_ Superstore" 
GROUP BY "Sub-Category" 
ORDER BY total_profit ASC 
LIMIT 5;

-- Step 5: Compare discount levels across Furniture sub-categories
-- Goal: Test the hypothesis that heavy discounting explains why Tables
-- and Bookcases lose money despite having decent sales volume
SELECT "Sub-Category", 
       ROUND(AVG(Discount), 3) AS avg_discount, 
       ROUND(SUM(Sales), 2) AS total_sales, 
       ROUND(SUM(Profit), 2) AS total_profit 
FROM "Sample_ Superstore" 
WHERE "Sub-Category" IN ('Tables', 'Bookcases', 'Chairs', 'Furnishings') 
GROUP BY "Sub-Category"; 

-- Step 6: Break down Tables' losses by region
-- Goal: Pinpoint WHERE the Tables problem is worst, since this tells
-- the business where to focus a fix (e.g. cap discounts, retrain sales reps)
SELECT Region, "Sub-Category", ROUND(SUM(Profit), 2) AS total_profit 
FROM "Sample_ Superstore" 
WHERE "Sub-Category" = 'Tables' 
GROUP BY Region 
ORDER BY total_profit ASC;

-- ============================================
-- Key finding: Tables have the highest average discount (26.1%) of any
-- Furniture sub-category, nearly double Furnishings (13.8%). Despite solid
-- sales ($206,965), this discount level makes Tables the single biggest
-- driver of unprofitability (-$17,725), with the problem worst in the
-- East region (-$11,025). West is the only region where Tables are
-- barely profitable.
-- ============================================