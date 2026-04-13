CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);

CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);


CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);



SELECT * FROM Books;

SELECT * FROM Customers;

SELECT * FROM Orders;


---Basic Queries

-- 1) Retrieve all books in the "Fiction" genre:

SELECT * FROM Books
WHERE genre = 'Fantasy';

---2) Find books published after the year 1950

SELECT * FROM Books
Where published_year > 1950;

---3) List all customers from the Canada

Select * From Customers
Where country = 'Canada';


---4) Show orders placed in November 2023

Select * From Orders
Where order_date Between '2023-01-01' And '2023-12-30';


---5) Retrieve the total stock of books available

Select Sum(stock) As Total_Stock
From Books;

---6) Find the details of the most expensive book

Select * From Books 
Order By price Desc
Limit 1;


--7) Show all customers who ordered more than 1 quantity of a book

Select customer_id,
		Count(quantity) As quantity
From orders 
Group By customer_id
Having count(quantity) > 1;


---8) Retrieve all orders where the total amount exceeds $20

Select * From orders
Where total_amount > 20;

---9) List all genres available in the Books table

Select Distinct genre 
From books;


----10) Find the book with the lowest stock

Select * From books
Order By stock Asc
Limit 1;


----11) Calculate the total revenue generated from all orders

Select Sum(total_amount) As total_revenue
From orders;


----Advance Queries

----1) Retrieve the total number of books sold for each genre

Select b.genre, 
	Sum(o.quantity) As Total_quantity 
From Books b 
Join Orders o 
On b.book_id = o.book_id 
Group By b.genre;

----2) Find the average price of books in the "Fantasy" genre

Select Avg(price) As Avg_price
From books 
Where genre = 'Fantasy';


---4) List customers who have placed at least 2 orders

Select c.name,
	c.email,
	c.country,
	c.customer_id,
	count(o.order_id) As order_count
From Customers c
Join Orders o
On c.customer_id = o.customer_id 
Group By c.customer_id 
Having count(o.order_id) >= 2

--------------------OR--------------------

Select customer_id,
	count(order_id) As order_count
From orders
Group By customer_id
Having Count(order_id) >= 2


----4) Find the most frequently ordered book


Select b.book_id,
	b.title,
	Count(o.order_id) As Order_Count
From Books b
Join Orders o
On b.book_id = o.book_id
Group By b.book_id
Order By Order_Count Desc
Limit 1;

----5) Show the top 3 most expensive books of 'Fantasy' Genre

Select * From books
Where genre = 'Fantasy'
Order By price Desc
Limit 3;


---6) Retrieve the total quantity of books sold by each author

Select b.author,
	Sum(o.quantity) As Total_books_sold
From Books b
Join Orders o
On b.book_id = o.book_id
Group By b.author

---7) List the cities where customers who spent over $30 are located

Select Distinct c.city,
	o.total_amount
From Customers c
Join Orders o
On c.customer_id = o.customer_id
Where o.total_amount > 30;
	
---8) Find the customer who spent the most on orders

Select c.customer_id,
	c.name,
	Sum(o.total_amount) As Total_spent
From Customers c
Join Orders o
On c.customer_id = o.customer_id
Group By c.customer_id, c.name
Order By Total_spent Desc

----9) Calculate the stock remaining after fulfilling all orders

Select b.stock,
	b.book_id,
	b.title,
	coalesce(Sum(o.quantity),0) As Order_quantity,
	b.stock-coalesce(Sum(o.quantity),0) As Remaining_quantity
From Books b
Left Join orders o
On b.book_id = o.book_id
Group By b.book_id;

	
	



