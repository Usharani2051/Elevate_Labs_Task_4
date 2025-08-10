# Elevate_Labs_Task_4

# Internship Task – SQL for Data Analysis

##  Overview
This task was part of my Data Analyst Internship assignment.  
The objective was to practice SQL for data extraction, manipulation, and analysis using an E-commerce dataset.

## 📂 Dataset
The dataset consists of five CSV files:
- **Customers.csv** – Customer details.
- **Orders.csv** – Order details with dates and customer references.
- **OrderItems.csv** – Products and quantities for each order.
- **Payments.csv** – Payment information and amounts.
- **Products.csv** – Product details including price.

These files were imported into MySQL Workbench under the database **`ecommerce_db`**.

## 🛠 Tools Used
- **MySQL Workbench** – Query execution and database management.
- **Kaggle E-commerce Dataset** – Source data.
- **GitHub** – Version control and submission.

## 📑 Tasks Performed

### 1. **Basic Queries**
- `SELECT` with `WHERE` conditions.
- Sorting results using `ORDER BY`.
- Aggregating data using `GROUP BY`.

### 2. **Joins**
- **INNER JOIN** to match customers with their orders.
- **LEFT JOIN** to list all customers and their orders if any.
- **RIGHT JOIN** to list all orders even without matching customers.

### 3. **Subqueries**
- Identify customers with more than 2 orders.
- Find orders above the average order value.

### 4. **Aggregate Functions**
- Calculated **Total Revenue** using `SUM()`.
- Calculated **Average Product Price** using `AVG()`.

### 5. **Views**
- Created a view `top_customers` showing customers ranked by total spending.

### 6. **Optimization**
- Created indexes on frequently joined columns for faster query execution.

### 7. **Data Verification**
- Checked for NULL values in key columns.
- Counted total rows in each table to ensure data was loaded correctly.
- Viewed first and last rows to confirm import order.

## 📷 Screenshots
Screenshots of SQL query execution and results are included in the `screenshots/` folder.

## 🚀 How to Run
1. Import the provided CSV files into MySQL Workbench under a database named `ecommerce_db`.
2. Run the SQL script `task_queries.sql` included in this repository.
3. Review the output in MySQL Workbench.

## 📎 Files in This Repository
- `task_queries.sql` – Contains all queries for the task.
- `README.md` – This document.
- `screenshots/` – Screenshots of query outputs.
- `*.csv` – Dataset files.

---
**Author:** [Your Name]  
**Date:** [Submission Date]  
**Internship Task:** SQL for Data Analysis
