# Data Analytics Project (SQL)

## Project Overview
This project demonstrates the end-to-end process of building a data analytics environment using **SQL (MySQL)**. It involves setting up a relational schema (Star Schema), optimizing bulk data loading, cleaning data, and performing advanced analytical queries to derive business insights.

<img width="652" height="743" alt="image" src="https://github.com/user-attachments/assets/f1c820b3-31d3-4351-89e8-46db509ecfc9" />

<img width="1603" height="742" alt="image" src="https://github.com/user-attachments/assets/7112ad60-de25-492e-b691-bd2e4df2ee58" />

The project answers critical business questions regarding sales trends, customer behavior, and product performance using advanced SQL techniques like **Window Functions**, **CTEs**, and **Segmentation Logic**.

## Repository Structure

### 1. Database Setup
* **`schema.sql`**: Defines the database `datawarehouse_analytics_db` and creates the Star Schema tables:
    * **`fact_sales`**: Transactional data (orders, dates, amounts).
    * **`dim_customers`**: Customer demographics and details.
    * **`dim_products`**: Product attributes, categories, and costs.
* **`uploading file.sql`**: A high-performance bulk data loading script.
    * *Key Feature:* Disables autocommit and key checks to speed up `LOAD DATA LOCAL INFILE` operations for large datasets.

### 2. Analytical Scripts
These scripts focus on extracting specific insights:

* **`1.changes over time year.sql`**: Aggregates sales, customer counts, and quantities by year. Includes data cleaning steps to handle invalid dates.
* **`2.changes over month.sql`**: Drills down into seasonal trends by aggregating sales, customers, and quantity on a monthly basis using `DATE_FORMAT`.
* **`3.cumulative analysis.sql`**: Calculates **running totals** and **moving averages** for sales and prices over time using Window Functions.
* **`4.performace analysis.sql`**: Detailed product analysis comparing current sales against:
    * The average performance of that product (Above/Below Avg).
    * The previous year's sales (Growth/Decline) using `LAG()`.
* **`5.proportional analysis.sql`**: Calculates the percentage contribution of each product category to the overall global sales.
* **`6.data segmentation1.sql`**: Segments products into cost buckets (e.g., "Below 100", "100-500") to analyze inventory distribution.
* **`7.data segmentation2.sql`**: Segments customers into **VIP, Regular, and New** groups based on spending history (> $5000) and relationship lifespan (> 12 months).

### 3. Comprehensive Reporting
* **`8.customer metric.sql`**: A master customer report using CTEs (`WITH` clauses) to calculate KPIs:
    * **Recency:** Months since the last order.
    * **AOV:** Average Order Value.
    * **Lifespan:** Duration of customer relationship.
* **`9.product_metric.sql`**: A master product report using CTEs to consolidate metrics and identify product health:
    * **Segmentation:** Flags products as High-Performer (>$50k), Mid-Range, or Low-Performer.
    * **Revenue KPIs:** Calculates Average Order Revenue (AOR) and Average Monthly Revenue.
    * **Recency:** Tracks months since the last sale to identify stale inventory.

## Key SQL Skills Demonstrated
* **Window Functions:** `OVER()`, `PARTITION BY`, `LAG()`, `SUM() OVER()`, `AVG() OVER()`.
* **Common Table Expressions (CTEs):** Used heavily in reports (e.g., `base_data`, `product_metric`) for readability and modularity.
* **Data Aggregation:** `GROUP BY` with multi-level summaries and `DATE_FORMAT` for time-series analysis.
* **Logic & Control Flow:** `CASE WHEN` statements for dynamic customer and product segmentation.
* **Date Manipulation:** `TIMESTAMPDIFF` for calculating lifespans and recency.
* **Performance Optimization:** Bulk loading configurations (`local_infile`, `foreign_key_checks`).

## Tableau Visualizations
The SQL outputs are further visualized using **Tableau** to communicate insights effectively.
📂 See the **`/Tableau`** folder for:
- Category-wise total sales dashboards  
- Sales contribution (%) visualizations  
- Product and customer performance reports  

---

## Insights
* **Customer Segmentation:** Customers are automatically tagged as 'VIP' if they have a history >12 months and spend >$5000.
* **Sales Trends:** The cumulative analysis tracks how sales momentum builds month-over-month.
* **Product Performance:** Products are flagged as "High-Performer" if total revenue exceeds $50,000.
