# Bank Transactions SQL Project

This repository contains a complete SQL project simulating **bank customers and their transactions**.  
The goal of the project is to practice database design, data generation, and analytical SQL queries that can be used in a real banking context.

---

## Project Structure

- **`schema.sql`** – database schema creation (tables `customers`, `transactions`) with constraints and ENUMs for transaction types.  
- **`data_inserts.sql`** – sample data generation using MySQL functions (`RAND()`, predefined lists of names and countries).  
- **`procedures.sql`** – stored procedures for key analytical tasks (average balances, deposits/withdrawals, customer activity, etc.).  
- **`views.sql`** – views for aggregated client and country-level information (churn candidates, activity analysis, etc.).  
- **`final_queries.sql`** – additional ad-hoc business queries for insights (top clients, most active countries, fee analysis).  

---

## Analytical Goals

The project simulates a small-scale bank database and answers **business-related questions**, such as:

- Who are the most profitable clients (by total deposits)?  
- Which countries are most active in the last month?  
- What is the average customer balance by country?  
- What share of the bank’s turnover comes from fees?  
- Which clients show low balance and low activity (potential churn)?  

---

## Features

- **Pure SQL project** – all data is generated and analyzed directly inside MySQL, without external datasets.  
- **Use of advanced SQL constructs**:  
  - `ENUM` for transaction categories (Deposit, Withdrawal, Transfer, Payment, Fee, Refund)  
  - Stored Procedures for reusable queries  
  - Views for client- and country-level aggregations  
  - Complex filtering with `HAVING`, subqueries, and conditional aggregation  
- **Business-oriented outputs** – queries are designed as if they would be used by an analyst in a bank.

---

## Example Use Cases

- **Data science preparation** – `customers_churn` view can serve as a feature source for churn prediction models.  
- **Bank reporting** – views like `countries_activity` provide insights on transaction distribution by geography.  
- **Risk analysis** – procedures and queries highlight clients with unusual behavior (very low activity, mostly fees, etc.).

---

## Tech Stack

- **Database**: MySQL  
- **Data Types**: `ENUM`, `DECIMAL`, `DATE`, `AUTO_INCREMENT`  
- **SQL Constructs**: `JOIN`, `GROUP BY`, `HAVING`, subqueries, conditional aggregation, stored procedures, views

---

## Project Status

✅ Completed – database schema, data generation, analytical procedures, views, and final queries are implemented.  

This repository represents a **finished SQL portfolio project** suitable for showcasing skills in:  
- database design,  
- data generation inside SQL,  
- and applied analytics for business insights.  
