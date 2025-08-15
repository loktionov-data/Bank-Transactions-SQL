# Bank-Transactions-SQL

This repository contains the **first part** of an SQL project simulating bank transactions data.  
The goal of this stage is to design the database schema and populate it with sample data generated entirely via SQL statements.  
Subsequent parts will include **data analysis** and **complex SQL queries** for insights.

---

## Current Contents

- **Database schema creation** using `CREATE TABLE`
- Use of `ENUM` type for transaction categories  
  (e.g., `deposit`, `withdrawal`, `transfer`, `payment`)
- Data generation with `INSERT` statements and MySQL functions like `RAND()`  
- Predefined lists of names and countries (prepared beforehand without importing external datasets)

---

## Data Generation Notes

- No external datasets or automated generation software were used.  
- Name and country lists were manually prepared in advance (with ChatGPT assistance for idea generation).  
- All final data insertion logic is implemented directly in MySQL.

---

## Next Steps (Upcoming Parts)

- Implement analytical SQL queries to answer business-related questions
- Perform aggregations, grouping, and filtering for transaction insights
- Create views and stored procedures for reporting
- Explore indexing strategies for performance optimization

---

## Tech Stack

- **Database**: MySQL  
- **Data Type Highlights**: `ENUM`, `DATE`, `DECIMAL`, `AUTO_INCREMENT`

---

## Project Status

**Part 1 – Database schema and sample data generation**   
**Part 2 – Data analysis and SQL queries** *(coming soon)*

---

## 🖼Example Table Structure

| Column           | Type                | Description                      |
|------------------|---------------------|----------------------------------|
| transaction_id   | INT AUTO_INCREMENT  | Unique transaction identifier   |
| account_holder   | VARCHAR(50)         | Name of the account holder      |
| country          | VARCHAR(50)         | Country of the account holder   |
| transaction_type | ENUM                | Type of transaction             |
| amount           | DECIMAL(10,2)       | Transaction amount              |
| transaction_date | DATE                | Date of transaction             |
