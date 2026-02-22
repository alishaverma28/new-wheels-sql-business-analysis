# 🚗 New-Wheels Sales & Customer Experience Analysis (SQL)

## ⭐ Executive Summary

New-Wheels, a vehicle resale platform, experienced a steady decline in sales and customer satisfaction across recent quarters.
This project builds a **CEO-level quarterly KPI reporting layer using SQL** to identify the drivers behind revenue decline, worsening customer feedback, and operational inefficiencies.

The analysis shows that revenue dropped primarily due to decreasing order volume, increasing customer dissatisfaction, and longer shipping timelines — highlighting clear areas for business improvement.

---

## 📌 Business Problem

The company observed:

* Declining quarterly sales and revenue
* Drop in new customer acquisition
* Negative after-sales feedback impacting trust
* Potential shipping delays affecting customer experience

Leadership required a structured quarterly performance report to monitor business health and support decision-making.

---

## 🎯 Project Objectives

* Design core business KPIs using SQL
* Analyze customer satisfaction trends over time
* Identify drivers of revenue and order decline
* Evaluate brand preference and regional demand
* Investigate operational impact of shipping delays
* Deliver decision-ready business insights

---

## 🗂️ Dataset Overview

Relational database tables used:

* **customer_t** → customer demographics, state, payment method
* **product_t** → vehicle maker, vehicle details
* **order_t** → order data, revenue, discount, feedback, dates

A data dictionary was used to understand schema and relationships.

---

## 🧠 Analytical Approach (Industry Workflow)

1. Schema exploration and relationship mapping
2. KPI layer creation using SQL queries
3. Quarterly trend analysis (revenue, orders, feedback)
4. Root-cause investigation combining customer + operations data
5. Market and brand preference analysis
6. Insight generation and recommendation framework

---

## 🛠️ Tech Stack & Skills

* SQL (Advanced)
* Joins & relational analysis
* Aggregations
* CASE statements (feedback → rating score)
* CTE (QoQ revenue analysis)
* Window functions (market share)
* Subqueries
* Date functions (shipping analysis)
* KPI design & business analytics

---

## 📊 KPI Layer Built Using SQL

### 📈 Revenue KPIs

* Total Revenue by Quarter
* Quarter-over-Quarter Revenue Change (%)
* Overall Revenue Decline %

### 📦 Demand KPIs

* Total Orders by Quarter
* Order Volume Decline %

### ⭐ Customer Experience KPIs

* Average Customer Rating by Quarter
* Feedback Distribution Percentage
* Dissatisfaction Trend

### 🚚 Operational KPIs

* Average Shipping Time by Quarter
* Shipping Performance Category (Fast / Medium / Slow)

### 💳 Pricing KPIs

* Average Discount by Credit Card Type

### 🚘 Market & Product KPIs

* Top 5 Vehicle Makers
* Market Share by Vehicle Maker
* Most Preferred Brand by State
* Customer Distribution by State

---

## 🔎 Key Business Insights

* Revenue declined ~40%, mainly driven by reduced order volume
* Customer satisfaction worsened consistently across quarters
* Orders and revenue declined proportionally, indicating a demand-side issue
* Shipping time increased in later quarters, suggesting operational bottlenecks
* Slow shipping correlates with lower order value and fewer orders
* Strong customer concentration exists in specific states (retention opportunity)
* Brand preference varies by region, enabling targeted marketing strategies

---

## 💡 Business Recommendations

* Improve shipping SLAs to reduce delivery delays
* Investigate service quality decline after Q1
* Launch retention campaigns in high-customer states
* Monitor feedback KPIs quarterly as an early warning signal
* Promote top vehicle makers regionally
* Optimize discount strategy using payment behavior insights

---

## 🏗️ Production Thinking (Senior Signal)

This project applies real analytics workflow:

* KPI-first analysis approach
* Root-cause investigation (not just reporting)
* Modular SQL queries for reuse
* Insight → recommendation mapping
* Leadership-level reporting mindset

---

## 📁 Repository Structure

```
new_wheels_business_analysis.sql   → SQL queries with insights  
new_wheels_dumpfile.sql            → Database dump file  
new_wheels_sales.txt               → Data dictionary  
README.md                          → Project documentation  
```

---

## 🚀 How to Run

1. Create database

```
CREATE DATABASE new_wheels;
USE new_wheels;
```

2. Import dump file

3. Execute:

```
new_wheels_business_analysis.sql
```

---

## 🌟 Why This Project Stands Out

* Real business problem (sales decline)
* End-to-end KPI reporting workflow
* Combines customer, revenue, and operations analytics
* Demonstrates advanced SQL in business context
* Mirrors real Decision Analytics / Product Analytics work

---

## 👩‍💻 Author

**Alisha Verma**
Data Analyst | SQL | Python | Machine Learning | Tableau | GenAI
Portfolio focused on KPI design, business analytics, and decision intelligence
