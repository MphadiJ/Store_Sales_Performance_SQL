-- preview DATA
SELECT *
FROM store
LIMIT 10;

--row count
SELECT COUNT(*) AS total_rows
FROM store;

-- check null VALUES
SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN storetype IS NULL THEN 1 ELSE 0 END) AS store_type_nulls,
    SUM(CASE WHEN assortment IS NULL THEN 1 ELSE 0 END) AS assortment_nulls,
    SUM(CASE WHEN competitiondistance IS NULL THEN 1 ELSE 0 END) AS competition_distance_nulls,
    SUM(CASE WHEN competitionopensincemonth IS NULL THEN 1 ELSE 0 END) AS comp_month_nulls,
    SUM(CASE WHEN competitionopensinceyear IS NULL THEN 1 ELSE 0 END) AS comp_year_nulls,
    SUM(CASE WHEN promo2 IS NULL THEN 1 ELSE 0 END) AS promo2_nulls,
    SUM(CASE WHEN promointerval IS NULL THEN 1 ELSE 0 END) AS promo_interval_nulls
FROM store;

--check for duplicates
SELECT store, COUNT(*) AS count
FROM store
GROUP BY store
HAVING COUNT(*) > 1;

-- unique value distribution
SELECT storetype, COUNT(*) AS count
FROM store
GROUP BY storetype
ORDER BY count DESC;

SELECT assortment, COUNT(*) AS count
FROM store
GROUP BY assortment;

-- summary stats
SELECT
    MIN(competitiondistance) AS min_distance,
    MAX(competitiondistance) AS max_distance,
    AVG(competitiondistance) AS avg_distance
FROM store;

-- Negative or zero distances (invalid)
SELECT *
FROM store
WHERE competitiondistance <= 0;

-- Invalid months
SELECT *
FROM store
WHERE competitionopensincemonth NOT BETWEEN 1 AND 12;

