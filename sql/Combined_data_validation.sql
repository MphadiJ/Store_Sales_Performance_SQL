SELECT COUNT(*) FROM store_sales;

SELECT * FROM store_sales WHERE sales IS NULL;

SELECT MIN(sales), MAX(sales), AVG(sales) FROM store_sales;

SELECT store_type, AVG(sales) AS avg_sales
FROM store_sales
GROUP BY store_type;