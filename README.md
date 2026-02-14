Global Cellphone Sales Analytics Database 📊
<h2><strong>📖 About</strong></h2>

This project is a fully relational <strong>MySQL database</strong> built to analyze global cellphone sales performance across brands, regions, and time.

It combines:

Structured relational schema design

Many-to-Many relationship modeling

Primary & foreign key enforcement

Advanced SQL analytics (CTEs, Window Functions)

Revenue, market share, and growth analysis

The objective is to simulate a real-world business intelligence workflow by transforming transactional data into actionable insights.

<h2><strong>🧱 Database Design</strong></h2>

The system consists of three core tables:

<h3><strong>1️⃣ phones</strong></h3>

phone_id (Primary Key)

brand

model

release_year

base_price_usd

storage_gb

<h3><strong>2️⃣ regions</strong></h3>

region_id (Primary Key)

country

continent

main_distributor

<h3><strong>3️⃣ sales (Junction Table)</strong></h3>

sale_id (Primary Key)

phone_id (Foreign Key → phones)

region_id (Foreign Key → regions)

sale_date

units_sold

sale_price_per_unit_usd

<h3><strong>Relationship Logic</strong></h3>

One phone → many sales

One region → many sales

Phones ↔ Regions → Many-to-Many (via sales)

To satisfy MySQL indexing requirements, ID columns were converted to VARCHAR(10) before assigning primary keys.

<h2><strong>🔑 Key Constraint Implementation</strong></h2>
ALTER TABLE phones
MODIFY phone_id VARCHAR(10) NOT NULL;
ALTER TABLE phones ADD PRIMARY KEY (phone_id);

ALTER TABLE regions
MODIFY region_id VARCHAR(10) NOT NULL;
ALTER TABLE regions ADD PRIMARY KEY (region_id);

ALTER TABLE sales
MODIFY sale_id VARCHAR(10) NOT NULL;
ALTER TABLE sales ADD PRIMARY KEY (sale_id);

ALTER TABLE sales
ADD FOREIGN KEY (phone_id) REFERENCES phones(phone_id);

ALTER TABLE sales
ADD FOREIGN KEY (region_id) REFERENCES regions(region_id);

<h2><strong>📊 Analytical Coverage</strong></h2> <h3><strong>Basic SQL</strong></h3>

Filtering and aggregation (COUNT, SUM, AVG)

Sorting and conditional logic

<h3><strong>Intermediate SQL</strong></h3>

Multi-table JOINs

Revenue calculation (units_sold * sale_price_per_unit_usd)

Brand-level and region-level performance metrics

Unsold product identification (LEFT JOIN)

<h3><strong>Advanced SQL</strong></h3>

RANK() – Revenue ranking within continents

DENSE_RANK() – Top 3 models per continent

LAG() – Month-over-month revenue growth

Rolling 7-day sales average

CTE-based revenue analysis

Market share computation

Price segmentation (Budget / Mid-range / Premium)

<h2><strong>📈 Key Business Insights</strong></h2>

<strong>Samsung</strong> sells the most units overall and has the most diverse product portfolio.

<strong>Galaxy S24</strong> is the highest revenue-generating model.

<strong>Sony</strong> maintains the highest average base price (premium positioning).

<strong>China</strong> has the highest average units sold per transaction.

<strong>UAE</strong> shows the strongest premium pricing power.

<strong>Asia</strong> generates the highest total revenue globally.

No single model is sold across every continent.

<h2><strong>⚙️ Tech Stack</strong></h2>

MySQL

SQL (DDL, DML, Window Functions, CTEs)

MySQL Workbench

CSV Data Import

<h2><strong>📂 Project Structure</strong></h2>
Global-Cellphone-Sales-Database/
│
├── phones.csv
├── regions.csv
├── sales.csv
├── Keys.sql
├── SQL.sql
└── README.md
