--remove invalid sales
UPDATE sales_data
SET sales = NULL
WHERE sales < 0;

-- Closed stores should have zero sales
UPDATE sales_data
SET sales = 0
WHERE open = 0;

-- Fill missing customers
UPDATE sales_data
SET customers = (
    SELECT AVG(customers) FROM sales_data WHERE customers IS NOT NULL
)
WHERE customers IS NULL;

-- Normalize holidays
UPDATE sales_data
SET stateholiday = LOWER(TRIM(stateholiday));