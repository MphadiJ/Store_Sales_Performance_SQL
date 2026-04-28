SELECT COUNT(*) AS total_rows FROM store;

SELECT * FROM store LIMIT 10;

SELECT store_type, COUNT(*) FROM store GROUP BY store_type;

SELECT assortment, COUNT(*) FROM store GROUP BY assortment;

SELECT MIN(competition_distance), MAX(competition_distance), AVG(competition_distance)
FROM store;

SELECT * FROM store WHERE competition_distance <= 0;