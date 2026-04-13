# online-bookstore-sql-project
📚 End-to-end PostgreSQL project solving 20 business queries on an Online Book Store database

# 📚 Online Book Store — SQL Project

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-FF6B35?style=for-the-badge&logo=database&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)
![Queries](https://img.shields.io/badge/Queries-20-orange?style=for-the-badge)

> 📖 *An end-to-end SQL project on an Online Book Store database — solving 20 real business queries from Basic to Advanced level using PostgreSQL.*

---

## 👨‍💻 About Me

Hi! I am **Manish Bisht** — an aspiring **Data Analyst** who loves building real-world SQL projects from scratch.

This project — **Online Book Store** — is my hands-on SQL practice project where I:

- 🗄️ Designed **3 relational tables** from scratch
- 🔗 Connected tables using **Primary Keys & Foreign Keys**
- 📊 Solved **20 real business questions** — Basic to Advanced
- 🧠 Applied **JOINs, GROUP BY, HAVING, Aggregations & Subqueries**

---

## 📖 What is This Project?

**Online Book Store** is a fictional book selling platform database.
This project simulates a **real business database** that manages:

```
📚 Books        — Book details, genre, price and stock
👥 Customers    — Customer profiles and locations  
🛒 Orders       — What each customer ordered and when
💰 Revenue      — Total sales and earnings analysis
```

> **Think of it like being the Data Analyst of a real online bookstore
> — your job is to answer the business questions the owner is asking every day.**

---

## 🗄️ Database Schema

### 📋 Tables Used

| Table | Description | Key Columns |
|---|---|---|
| `Books` | All book details | `Book_ID`, `Title`, `Author`, `Genre`, `Price`, `Stock` |
| `Customers` | Customer profiles | `Customer_ID`, `Name`, `Email`, `City`, `Country` |
| `Orders` | Order transactions | `Order_ID`, `Customer_ID`, `Book_ID`, `Quantity`, `Total_Amount` |

---

### 🔗 Table Relationships

```
Books                    Customers
  │                          │
  │ Book_ID (FK)             │ Customer_ID (FK)
  └──────────┐  ┌────────────┘
             ▼  ▼
            Orders
     (Central Fact Table)
```

> 📌 The `Orders` table is the central table connected to both
> `Books` and `Customers` using Foreign Keys

---

## 📁 Files in This Project

```
📁 online-bookstore-sql-project/
│
├── 📄 README.md                              ← You are here
├── 📄 End_to_End_Project_SQL_Basic_to_Advance.sql  ← All queries
└── 📄 SQL_Project_Questions_Day_30.pdf       ← Question sheet
```

---

## ❓ Business Questions Solved

### 🟢 Basic Level — 11 Queries

---

#### ✅ Q1 — Retrieve All Books in the "Fiction" Genre
```sql
SELECT * FROM Books
WHERE genre = 'Fantasy';
```
💡 **Insight:** Filters books by genre — useful for category-wise browsing.

---

#### ✅ Q2 — Find Books Published After 1950
```sql
SELECT * FROM Books
WHERE published_year > 1950;
```
💡 **Insight:** Identifies modern books in the inventory.

---

#### ✅ Q3 — List All Customers from Canada
```sql
SELECT * FROM Customers
WHERE country = 'Canada';
```
💡 **Insight:** Country-wise customer filtering — great for regional targeting.

---

#### ✅ Q4 — Show Orders Placed in 2023
```sql
SELECT * FROM Orders
WHERE order_date BETWEEN '2023-01-01' AND '2023-12-30';
```
💡 **Insight:** Date range filtering — essential for sales period analysis.

---

#### ✅ Q5 — Retrieve Total Stock of Books Available
```sql
SELECT SUM(stock) AS Total_Stock
FROM Books;
```
💡 **Insight:** Quick inventory snapshot for stock management.

---

#### ✅ Q6 — Find the Most Expensive Book
```sql
SELECT * FROM Books
ORDER BY price DESC
LIMIT 1;
```
💡 **Insight:** Identifies the premium product in the catalog.

---

#### ✅ Q7 — Customers Who Ordered More Than 1 Book
```sql
SELECT customer_id,
       COUNT(quantity) AS quantity
FROM orders
GROUP BY customer_id
HAVING COUNT(quantity) > 1;
```
💡 **Insight:** Uses `GROUP BY` + `HAVING` to find repeat buyers.

---

#### ✅ Q8 — Orders Where Total Amount Exceeds $20
```sql
SELECT * FROM orders
WHERE total_amount > 20;
```
💡 **Insight:** Filters high-value transactions for revenue tracking.

---

#### ✅ Q9 — List All Genres Available
```sql
SELECT DISTINCT genre
FROM books;
```
💡 **Insight:** `DISTINCT` removes duplicates — shows unique categories only.

---

#### ✅ Q10 — Find the Book With Lowest Stock
```sql
SELECT * FROM books
ORDER BY stock ASC
LIMIT 1;
```
💡 **Insight:** Identifies urgent restocking needs.

---

#### ✅ Q11 — Calculate Total Revenue From All Orders
```sql
SELECT SUM(total_amount) AS total_revenue
FROM orders;
```
💡 **Insight:** Core business KPI — total money earned from all sales.

---

### 🔴 Advanced Level — 9 Queries

---

#### ✅ Q1 — Total Books Sold Per Genre
```sql
SELECT b.genre,
       SUM(o.quantity) AS Total_quantity
FROM Books b
JOIN Orders o ON b.book_id = o.book_id
GROUP BY b.genre;
```
💡 **Insight:** JOIN + GROUP BY — finds which genre sells the most.

---

#### ✅ Q2 — Average Price of Fantasy Books
```sql
SELECT AVG(price) AS Avg_price
FROM books
WHERE genre = 'Fantasy';
```
💡 **Insight:** Calculates average pricing for a specific genre.

---

#### ✅ Q3 — Customers Who Placed at Least 2 Orders
```sql
SELECT c.name, c.email, c.country,
       COUNT(o.order_id) AS order_count
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING COUNT(o.order_id) >= 2;
```
💡 **Insight:** Finds loyal/repeat customers using `HAVING` clause.

---

#### ✅ Q4 — Most Frequently Ordered Book
```sql
SELECT b.book_id, b.title,
       COUNT(o.order_id) AS Order_Count
FROM Books b
JOIN Orders o ON b.book_id = o.book_id
GROUP BY b.book_id
ORDER BY Order_Count DESC
LIMIT 1;
```
💡 **Insight:** Identifies the bestselling book — key for marketing focus.

---

#### ✅ Q5 — Top 3 Most Expensive Fantasy Books
```sql
SELECT * FROM books
WHERE genre = 'Fantasy'
ORDER BY price DESC
LIMIT 3;
```
💡 **Insight:** Filtered ranking — combines WHERE + ORDER BY + LIMIT.

---

#### ✅ Q6 — Total Books Sold by Each Author
```sql
SELECT b.author,
       SUM(o.quantity) AS Total_books_sold
FROM Books b
JOIN Orders o ON b.book_id = o.book_id
GROUP BY b.author;
```
💡 **Insight:** Author-level performance report — useful for publisher deals.

---

#### ✅ Q7 — Cities Where Customers Spent Over $30
```sql
SELECT DISTINCT c.city, o.total_amount
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.total_amount > 30;
```
💡 **Insight:** Geographic analysis of high-value orders.

---

#### ✅ Q8 — Customer Who Spent the Most
```sql
SELECT c.customer_id, c.name,
       SUM(o.total_amount) AS Total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY Total_spent DESC;
```
💡 **Insight:** Finds the top spender — great for loyalty program decisions.

---

#### ✅ Q9 — Stock Remaining After Fulfilling All Orders
```sql
SELECT b.book_id, b.title, b.stock,
       COALESCE(SUM(o.quantity), 0) AS Order_quantity,
       b.stock - COALESCE(SUM(o.quantity), 0) AS Remaining_quantity
FROM Books b
LEFT JOIN orders o ON b.book_id = o.book_id
GROUP BY b.book_id;
```
💡 **Insight:** Uses `LEFT JOIN` + `COALESCE` — handles books with zero
orders and calculates live remaining inventory.

---

## 🧠 SQL Concepts Used

| Concept | Used In |
|---|---|
| `SELECT` `WHERE` `ORDER BY` `LIMIT` | Q1–Q6 Basic |
| `SUM()` `AVG()` `COUNT()` | Q5, Q7, Q11 Basic |
| `DISTINCT` | Q9 Basic |
| `BETWEEN` | Q4 Basic |
| `GROUP BY` + `HAVING` | Q7 Basic, Q3 Q4 Q6 Advanced |
| `INNER JOIN` | Q1 Q3 Q4 Q6 Q7 Q8 Advanced |
| `LEFT JOIN` | Q9 Advanced |
| `COALESCE()` | Q9 Advanced |
| `ORDER BY DESC + LIMIT` | Q6 Basic, Q4 Q5 Q8 Advanced |

---

## 💼 Real Business Insights Delivered

```
📌 Found the best-selling genre      → Focus inventory investment
📌 Identified top spending customers → Loyalty rewards strategy  
📌 Tracked remaining stock levels    → Prevent out-of-stock situations
📌 Discovered repeat buyers          → Customer retention campaigns
📌 Analysed city-wise spending       → Regional marketing decisions
📌 Found highest revenue author      → Publisher partnership priority
```

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| **PostgreSQL** | Database & Query Engine |
| **pgAdmin 4** | GUI for writing & running queries |
| **SQL** | Query Language |
| **GitHub** | Project hosting & version control |

---

## 🚀 How to Run This Project

```bash
# Step 1 — Clone this repository
git clone https://github.com/yourusername/online-bookstore-sql-project.git

# Step 2 — Open pgAdmin 4

# Step 3 — Create a new database
CREATE DATABASE bookstore_db;

# Step 4 — Run the SQL file
-- Open End_to_End_Project_SQL_Basic_to_Advance.sql
-- Run all CREATE TABLE statements first
-- Then run INSERT statements to load data
-- Then run queries one by one
```

---

## 🏁 What I Learned From This Project

```
✅ How to design a relational database from scratch
✅ How Primary Key & Foreign Key relationships work
✅ How to use JOINs to connect multiple tables
✅ Writing GROUP BY + HAVING for business aggregations
✅ Using COALESCE() to handle NULL values cleanly
✅ Building LEFT JOINs for inventory calculations
✅ How real businesses use SQL to track sales & stock
✅ Thinking like a Data Analyst — not just a query writer
```

---

## 🗣️ Project Summary — In My Own Words

> *"Online Book Store is my end-to-end SQL case study where I designed
> a complete bookstore database from scratch using PostgreSQL. I built
> 3 relational tables, connected them using Primary and Foreign Keys,
> and solved 20 real business questions — from basic SELECT queries all
> the way to advanced JOINs, HAVING filters, and inventory calculations
> using COALESCE. This project gave me real confidence to handle
> data problems like a professional Data Analyst."*

---

## 📬 Connect With Me

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/dataanalyst-manish)
[![Email](https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:alphainsights123@gmail.com)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/bisht5431-source)

---

<p align="center">
⭐ If you found this project useful — please give it a Star!
</p>

<p align="center">
📚 Made with ❤️ and lots of SQL queries by <b>[Manish Bisht]</b>
</p>
