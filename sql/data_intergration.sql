DROP TABLE IF EXISTS store_sales;

CREATE TABLE store_sales AS
SELECT
    t.storeid,
    t.date,
    t.dayofweek,
    t.sales,
    t.customers,
    t.open,
    t.promo,
    t.stateholiday,
    t.schoolholiday,
    s.store_type,
    s.assortment,
    s.competition_distance,
    s.promo2
FROM sales_data t
LEFT JOIN store s
ON t.storeid = s.storeid;