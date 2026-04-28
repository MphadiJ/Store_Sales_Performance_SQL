DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS train;

CREATE TABLE store (
    storeid INTEGER PRIMARY KEY,
    store_type TEXT,
    assortment TEXT,
    competition_distance REAL,
    competition_open_since_month INTEGER,
    competition_open_since_year INTEGER,
    promo2 INTEGER,
    promo2_since_week INTEGER,
    promo2_since_year INTEGER,
    promo_interval TEXT
);
CREATE TABLE sales_data (
    storeid INTEGER,
    dayofweek INTEGER,
    date TEXT,
    sales REAL,
    customers INTEGER,
    open INTEGER,
    promo INTEGER,
    stateholiday TEXT,
    schoolholiday INTEGER
);