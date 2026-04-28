SELECT COUNT(*) FROM sales_data;

SELECT * FROM sales_data LIMIT 10;

SELECT MIN(sales), MAX(sales), AVG(sales) FROM sales_data;

SELECT * FROM sales_data WHERE sales < 0;

SELECT * FROM train WHERE open = 0 AND sales > 0;