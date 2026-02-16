# Tableau Visualizations

## Overview

This folder contains **Tableau dashboards built as a continuation of the SQL-based data analytics project**.  
The visualizations are created using **aggregated outputs from SQL queries**, focusing on transforming analytical results into **business-friendly insights**.

Tableau is used here for **insight communication and reporting**, not raw data processing.

---

## Contents

### 1️ `report_product_metric.twb`  
**Product Performance Dashboard**

Based on outputs from `product_metric.sql`.

**Visualizations include:**
- Category-wise and product-level total sales
- Sales vs Quantity analysis
- Top 10 products by total sales

**Business Insights:**
- Identifies high- and low-performing products
- Highlights revenue-heavy but low-quantity products
- Helps detect underperforming or stale inventory

---

### 2️ `report_customer_metric.twb`  
**Customer Analytics Dashboard**

Built using results from `customer_metric.sql`.

**Visualizations include:**
- Customer segmentation (VIP / Regular / New)
- Customer distribution and spending behavior

**Business Insights:**
- Identifies high-value customers
- Supports customer retention and targeting strategies

---

### 3️ `CategorySalesContribution.twb`  
**Category Sales Contribution Dashboard**

Focused on category-level analysis.

**Visualizations include:**
- Category-wise total sales
- Percentage contribution of each category to overall revenue

**Business Insights:**
- Reveals dominant revenue-driving categories
- Highlights low-contribution categories

---

## Analytical Workflow

```text
Raw Data → SQL Analysis (CTEs, Window Functions, Segmentation)
        → Aggregated Reports (Customer & Product Metrics)
        → Tableau Dashboards (Insight Communication)
