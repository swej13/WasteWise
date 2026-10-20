# WasteWise — Food Waste Intelligence System

## Project Overview
WasteWise is a MySQL-based database project designed to analyze food sales, inventory, and food wastage. It helps identify the most wasted food items, estimate financial losses, and understand waste patterns.

## Objectives
- Track food items, suppliers, inventory, sales, and waste records.
- Identify food items with the highest wastage.
- Estimate financial loss caused by wasted food.
- Analyze sales and waste using SQL queries.
- Demonstrate database concepts using MySQL 8.0.

## Technologies Used
- MySQL 8.0
- SQL
- MySQL Workbench or MySQL Command Line Client

## Database Tables
1. **Food_Items** — Stores food item details and prices.
2. **Suppliers** — Stores supplier information.
3. **Inventory** — Tracks quantities, suppliers, and expiry dates.
4. **Sales** — Records quantities sold and sale dates.
5. **Waste_Records** — Records wasted quantities, reasons, and dates.

## SQL Concepts Demonstrated
- Primary keys and foreign keys
- Constraints and auto-increment
- Joins and aggregate functions
- GROUP BY and HAVING
- Subqueries
- Common table expressions or derived tables
- Views
- Stored procedures
- Triggers
- Ranking functions using DENSE_RANK

## Project Structure
```text
WasteWise/
├── README.md
├── schema/
│   └── schema.sql
├── sql/
│   ├── 01_sample_data.sql
│   ├── 02_analysis_queries.sql
│   └── 03_views_procedures_triggers.sql
└── docs/
```

## How to Run
1. Install MySQL 8.0 or a compatible MySQL client and server.
2. Open MySQL Workbench or the MySQL command-line client.
3. Run `schema/schema.sql` to create the database and tables.
4. Run `sql/01_sample_data.sql` to insert sample records.
5. Run queries from `sql/02_analysis_queries.sql`.
6. Run `sql/03_views_procedures_triggers.sql` to create the view, procedure, and trigger.

Run the scripts in this order on a fresh database. Avoid inserting the sample data repeatedly into the same database.

## Example Analysis
The project can answer questions such as:
- Which food item has the highest wastage?
- What is the estimated financial loss for each food item?
- How much food is sold each day?
- Which inventory items are approaching their expiry dates?
- What percentage of recorded food quantity was wasted?

## Note on Financial Estimates
Financial loss is estimated using the listed food-item price multiplied by the wasted quantity. This is a simplified estimate, not an exact accounting of the business's actual loss.

## Future Improvements
- Add a dashboard for sales and wastage analysis.
- Add low-stock and expiry alerts.
- Connect the database to a web application.
- Use historical data to forecast food demand.

## Author
Swejal Ghodkhande
