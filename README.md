# Customer Shopping Behavior Analysis
## Overview
An end-to-end analysis of customer shopping behavior — combining SQL for exploratory data analysis with a Power BI dashboard for visual reporting.
## Business Questions Explored

- Which gender segment generates more revenue?
- Which customers are spending above average and taking advantage of discounts?
- Which products have the highest average review ratings?
- Does shipping type (Express vs. Standard) affect purchase amount?
- Do subscribed customers spend more than non-subscribed customers?
- Which products are most frequently discounted?
- How does customer loyalty (based on purchase history) break down across the customer base?
- Which are the top 3 best-selling items within each category?
- How many repeat buyers (5+ previous purchases) are subscribed vs. not?
- Which age group generates the most revenue?

## SQL Analysis

All analysis was run against a `customers` table containing transaction-level shopping data. Key queries include:

- **Revenue by gender** — total purchase amount grouped by gender
- **Above-average discounted spenders** — customers who used a discount and still spent more than the overall average purchase amount
- **Top-rated products** — top 5 items by average review rating
- **Shipping type comparison** — average purchase amount for Express vs. Standard shipping
- **Subscription impact** — customer count, average spend, and total revenue by subscription status
- **Discount rate by product** — top 5 items with the highest percentage of discounted purchases
- **Customer relationship segmentation** — a `CASE`-based classification (New / Returning / Loyal customer) built on `previous_purchases`, using a CTE
- **Top products per category** — a window function (`ROW_NUMBER()` partitioned by category) to find the top 3 best-selling items within each product category
- **Repeat buyer analysis** — count of customers with more than 5 previous purchases, split by subscription status
- **Revenue by age group** — total revenue grouped by customer age bracket

## Power BI Dashboard

A single-page interactive dashboard visualizing the above insights:

**KPI Cards**
- Number of Customers
- Average Purchase Amount
- Average Review Rating

**Charts**
- **% of Customers by Subscription Status** — donut chart
- **Revenue by Category** — clustered column chart
- **Sales by Category** — clustered column chart (order volume by category)
- **Sales by Age Group** — clustered bar chart
- **Revenue by Age Group** — clustered bar chart

**Slicers (interactive filters)**
- Category
- Gender
- Subscription Status
- Shipping Type
## Tech Stack

- **SQL** — data exploration and aggregation
- **Power BI** — interactive dashboard and visualization
