Global Cellphone Sales Analytics Database 📊
📖 About

This project is a fully relational MySQL database built to analyze global cellphone sales performance across brands, regions, and time.

It combines:

Structured relational schema design

Many-to-Many relationship modeling

Primary & foreign key enforcement

Advanced SQL analytics (CTEs, Window Functions)

Revenue, market share, and growth analysis

The objective is to simulate a real-world business intelligence workflow by transforming transactional data into actionable insights.

🧱 Database Design

The system consists of three core tables:

1️⃣ phones

phone_id (Primary Key)

brand

model

release_year

base_price_usd

storage_gb

2️⃣ regions

region_id (Primary Key)

country

continent

main_distributor

3️⃣ sales (Junction Table)

sale_id (Primary Key)

phone_id (Foreign Key → phones)

region_id (Foreign Key → regions)

sale_date

units_sold

sale_price_per_unit_usd

Relationship Logic

One phone → many sales

One region → many sales

Phones ↔ Regions → Many-to-Many (via sales)

To satisfy MySQL indexing requirements, ID columns were converted to VARCHAR(10) before assigning primary keys.

🔑 Key Constraint Implementation
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

📊 Analytical Coverage
🟢 Basic SQL

Filtering and aggregation (COUNT, SUM, AVG)

Sorting and conditional logic

🟡 Intermediate SQL

Multi-table JOINs

Revenue calculation (units_sold * sale_price_per_unit_usd)

Brand-level and region-level performance metrics

Unsold product identification (LEFT JOIN)

🔴 Advanced SQL

RANK() – Revenue ranking within continents

DENSE_RANK() – Top 3 models per continent

LAG() – Month-over-month revenue growth

Rolling 7-day sales average

CTE-based revenue analysis

Market share computation

Price segmentation (Budget / Mid-range / Premium)

📈 Key Business Insights

Samsung sells the most units overall and has the most diverse product portfolio.

Galaxy S24 is the highest revenue-generating model.

Sony maintains the highest average base price (premium positioning).

China has the highest average units sold per transaction.

UAE shows the strongest premium pricing power.

Asia generates the highest total revenue globally.

No single model is sold across every continent.

⚙️ Tech Stack

MySQL

SQL (DDL, DML, Window Functions, CTEs)

MySQL Workbench

CSV Data Import

📂 Project Structure
Global-Cellphone-Sales-Database/
│
├── phones.csv
├── regions.csv
├── sales.csv
├── Keys.sql
├── SQL.sql
└── README.md
