-- Top performing stores
SELECT storeid, SUM(sales) AS total_sales
FROM store_sales
GROUP BY storeid
ORDER BY total_sales DESC
LIMIT 10;

-- Sales by day of week
SELECT dayofweek, AVG(sales)
FROM store_sales
GROUP BY dayofweek;