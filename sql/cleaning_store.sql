-- Fix invalid competition distance
UPDATE store
SET competition_distance = NULL
WHERE competition_distance <= 0;

-- Fill missing competition distance
UPDATE store
SET competition_distance = (
    SELECT AVG(competition_distance) FROM store WHERE competition_distance IS NOT NULL
)
WHERE competition_distance IS NULL;

-- Normalize text
UPDATE store
SET store_type = LOWER(TRIM(store_type)),
    assortment = LOWER(TRIM(assortment));
	
-- Fix competition dates
UPDATE store
SET competition_open_since_month = COALESCE(competition_open_since_month, 0),
    competition_open_since_year = COALESCE(competition_open_since_year, 0);

-- Promo consistency
UPDATE store
SET promo2_since_week = NULL,
    promo2_since_year = NULL,
    promo_interval = NULL
WHERE promo2 = 0;	