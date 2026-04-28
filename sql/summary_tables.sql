-- Top stores table
DROP TABLE IF EXISTS top_stores;

CREATE TABLE top_stores AS
SELECT storeid, SUM(sales) AS total_sales
FROM store_sales
GROUP BY storeid
ORDER BY total_sales DESC
LIMIT 10;

-- Create output tables/views

CREATE TABLE sales_by_day AS
SELECT dayofweek, AVG(sales) AS avg_sales
FROM store_sales
GROUP BY dayofweek;

CREATE TABLE promo_impact AS
SELECT promo, AVG(sales) AS avg_sales
FROM store_sales
GROUP BY promo;