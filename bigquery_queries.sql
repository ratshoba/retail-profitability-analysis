-- BigQuery version of the original SQLite analysis
-- Key syntax differences: backticks instead of double quotes,
-- and table names use the full path: project.dataset.table

-- Profit by Category
SELECT Category, ROUND(SUM(Profit), 2) AS total_profit
FROM `retail-analysis-project-509606.retail_analysis.orders`
GROUP BY Category
ORDER BY total_profit DESC;

-- Least profitable sub-categories
SELECT `Sub-Category`, ROUND(SUM(Profit), 2) AS total_profit
FROM `retail-analysis-project-509606.retail_analysis.orders`
GROUP BY `Sub-Category`
ORDER BY total_profit ASC
LIMIT 5;