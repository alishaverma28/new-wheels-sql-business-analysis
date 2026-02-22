# 🚗 New-Wheels Vehicle Sales Analysis (SQL)

## 📌 Project Overview

This project focuses on performing end-to-end SQL analysis for **New-Wheels**, a vehicle resale company experiencing declining sales and customer satisfaction.
The objective is to analyze business data and generate a **quarterly KPI report** to help leadership understand business health and make data-driven decisions.

The analysis covers customers, orders, revenue, feedback, discounts, vehicle preference, and shipping performance.

---

## 🎯 Business Problem

New-Wheels has observed:

* Declining sales over recent quarters
* Drop in new customers
* Negative after-sales feedback
* Potential operational issues impacting revenue

Leadership requires a quarterly business performance report to identify root causes and improvement areas.

---

## 📂 Dataset Description

The dataset contains multiple relational tables including:

* **Customers** — customer demographics, state, payment methods
* **Products** — vehicle make, model, year, price
* **Orders** — order details, revenue, discounts, feedback
* **Shipping** — order date, ship date, delivery timelines

A data dictionary is provided describing each column.

---

## 🛠️ Tools & Skills Used

* SQL
* Joins (INNER, LEFT)
* Aggregations
* CASE statements
* CTE (Common Table Expressions)
* Window Functions
* KPI Analysis
* Business Data Analysis
* Data Storytelling

---

## 📊 Key Analysis Performed

* Customer distribution across states
* Average customer rating by quarter
* Feedback trend and dissatisfaction analysis
* Top vehicle makers preferred by customers
* Most preferred vehicle make by state
* Order trend by quarter
* Revenue trend and QoQ revenue change
* Combined revenue and order analysis
* Discount analysis by payment method
* Shipping performance and delivery time analysis

---

## 🔎 Key Business Insights

* Customer satisfaction declined across quarters, with Q4 showing the weakest ratings
* Revenue dropped significantly (~40%), primarily driven by reduced order volume
* Order volume and revenue show a strong positive correlation
* Shipping delays increased in later quarters and may impact satisfaction
* Certain states represent strong customer markets and require retention focus
* Vehicle maker preference varies by region, indicating opportunity for targeted marketing

---

## ✅ Outcome

The project demonstrates how SQL can be used to:

* Answer leadership-level business questions
* Build KPI reports
* Identify drivers of revenue decline
* Detect operational issues impacting customer experience
* Provide actionable insights for strategic decision-making

---

## 📁 Repository Structure

```
new_wheels_business_analysis.sql   # SQL solution file
new_wheels_dumpfile.sql            # Database dump file
new_wheels_sales.txt               # Data dictionary
README.md                          # Project documentation
```

---

## 🚀 How to Run

1. Create database:

```
CREATE DATABASE new_wheels;
USE new_wheels;
```

2. Import dump file.

3. Run:

```
new_wheels_business_analysis.sql
```

---

## 👩‍💻 Author

Alisha Verma
Entry-level Data Analyst | SQL | Python | Machine Learning | Tableau | GenAI
