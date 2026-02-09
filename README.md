# Data Analytics Project (SQL)

This project demonstrates a comprehensive data analytics pipeline using MySQL. It involves building a data warehouse schema, importing raw CSV data, and performing advanced SQL analysis to derive business insights.

The goal is to analyze sales trends, customer behavior, and product performance using a structured Star Schema architecture.

Database Schema
The project uses a Star Schema with one central fact table and two dimension tables:

fact_sales: The central table containing transactional data (orders, dates, sales amounts, quantities).

dim_customers: detailed customer information (demographics, location, age).

dim_products: Product catalog details (categories, subcategories, costs).

Key Features & Analysis
This repository contains SQL scripts covering the following analytical areas:

1. Time-Series Analysis
Yearly & Monthly Trends: Analyzing how sales, customer counts, and quantities change over time.

Cumulative Analysis: Calculating running totals and moving averages to track growth momentum.

2. Product Performance
Year-over-Year Growth: Comparing current sales to previous years to identify growth or decline.

Product Segmentation: Categorizing products into "High-Performer," "Mid-Range," and "Low-Performer" based on revenue.

Pareto/Proportional Analysis: Identifying which product categories contribute the most to overall revenue.

3. Customer Segmentation (RFM & Demographics)
VIP vs. Regular: Segmenting customers into VIP, Regular, and New groups based on lifespan and spending history.

Age Demographics: Grouping customers into age buckets (Under 20, 20-29, etc.) for targeted insights.

Advanced KPIs: Calculating Recency (months since last order), Average Order Value, and Lifespan.

Tech Stack
Database: MySQL 8.0
Tool: MySQL Workbench
Techniques: Joins, Window Functions (OVER, PARTITION BY), CTEs (Common Table Expressions), Data Aggregation.
