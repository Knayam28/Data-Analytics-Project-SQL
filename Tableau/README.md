## Tableau Visualizations
Overview

This folder contains Tableau dashboards built on top of SQL-derived analytical outputs from the main project.
All visualizations are a continuation of the SQL analysis, focusing on translating query results into clear, business-ready insights.

The Tableau dashboards help answer “what does this mean?” after the SQL answers “what is happening?”

Files in This Folder
1. report_product_metric.twb

Product Performance Dashboard

Visualizes insights generated from product_metric.sql, including:

Total Sales & Quantity by Product

Sales vs Quantity analysis

Top 10 Products by Total Sales

Product performance distribution

Key Insights:

Identifies high-performing vs low-performing products

Highlights products with high revenue but low quantity (premium items)

Helps detect stale or underperforming inventory

2. report_customer_metric.twb

Customer Analytics Dashboard

Built using outputs from customer_metric.sql, focusing on:

Customer segmentation (VIP / Regular / New)

Customer distribution patterns

Spending behavior analysis

Key Insights:

Identifies high-value customers

Supports customer retention and targeting strategies

3. CategorySalesContribution.twb

Category Sales Contribution Dashboard

A focused dashboard visualizing:

Category-wise total sales

Percentage contribution of each category to overall revenue

Key Insights:

Reveals dominant revenue-driving categories

Highlights categories with low contribution despite product variety

Tableau is not used for raw analysis, but for:

Insight communication

Stakeholder-friendly reporting

Visual validation of SQL results

🛠️ Tools Used

Tableau Desktop Public Edition

MySQL (data source via CSV exports from SQL queries)

Notes

All .twb files reference locally exported CSVs

Dashboards are designed for analytical clarity, not decorative visuals

Focus is on business insight delivery

Related

SQL queries powering these dashboards can be found in the root /sql_files directory.

Project overview and SQL documentation are available in the main README.md.
