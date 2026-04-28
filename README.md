📊 Retail Sales Intelligence Pipeline (SQL End-to-End Project)

Transforming raw retail transactions into decision-ready business intelligence using SQL-driven data cleaning, integration, and analytics.

🚀 Why this project exists

Most real-world data is not “analysis-ready.”

It is:

fragmented across tables
inconsistent in structure
missing business rules
and impossible to trust without transformation

This project simulates a real retail analytics environment, where the goal is not just to query data—but to build a reliable analytical layer that business stakeholders can trust for decision-making.

🎯 Problem Statement

Given two raw datasets:

store table → store metadata (type, promotions, competition, etc.)
train table → transactional sales data

The challenge was to:

Clean and standardize messy retail data
Integrate transactional and store-level attributes
Apply real business constraints (e.g. only open stores)
Build reusable SQL analytics outputs
Convert raw data into business intelligence
🧠 My Approach (How I think as a data professional)

Instead of jumping into analysis, I built a structured pipeline:

1. Data Understanding
Inspected schema relationships
Identified missing and inconsistent fields
Validated join logic between store and sales data
2. Data Cleaning Layer
Standardized categorical variables (store_type, holiday flags)
Fixed data types (dates, numeric fields)
Handled missing values logically, not arbitrarily
Enforced business rules:
Only active stores (open = 1) used for performance analysis
3. Data Integration Layer
Built a unified analytical dataset: store_sales
Combined transactional + store attributes into a single table
Reduced complexity for downstream analysis (no repeated joins)

This mirrors real-world analytics engineering practices.

🏗️ Analytical Architecture
Raw Data → Cleaning Layer → Unified Table (store_sales) → Aggregation Layer → Business Insights

This structure ensures:

Reusability
Scalability
Consistency across analyses
📊 Key Business Output
🧾 Total Sales by Store Type
DROP TABLE IF EXISTS total_sales_by_storetype;

CREATE TABLE total_sales_by_storetype AS
SELECT
    store_type,
    SUM(sales) AS total_sales,
    COUNT(DISTINCT storeid) AS num_stores,
    AVG(sales) AS avg_sales_per_transaction
FROM store_sales
WHERE open = 1
GROUP BY store_type
ORDER BY total_sales DESC;
📈 What this analysis enables

This is not just a query—it is a business decision tool.

It answers:

Which store types generate the most revenue?
Are more stores actually driving more revenue?
Which store types are most efficient per transaction?
Where is revenue concentrated?
🔍 Advanced Insight Layer
💰 Revenue Contribution by Store Type
SELECT
    store_type,
    SUM(sales) AS total_sales,
    ROUND(100.0 * SUM(sales) / SUM(SUM(sales)) OVER (), 2) AS revenue_pct
FROM store_sales
WHERE open = 1
GROUP BY store_type;

This introduces:

Window functions
Business proportional analysis
Executive KPI reporting
📖 Data Storytelling Insight

What the data revealed goes beyond SQL outputs:

📌 1. Revenue is highly concentrated

Not all store types contribute equally—some dominate total revenue despite similar store counts.

📌 2. Store count does not equal performance

More stores ≠ more revenue. Some smaller segments outperform larger ones.

📌 3. Efficiency matters as much as scale

Average sales per transaction revealed hidden performance gaps across store types.

📌 4. The business takeaway

Retail performance is driven more by store type strategy than individual store performance.
