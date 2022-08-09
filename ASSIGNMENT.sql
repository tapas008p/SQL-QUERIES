CREATE DATABASE ASSIGNMENT;
-- DROP Database Assignment;
USE ASSIGNMENT;

CREATE TABLE SalesPeople (
Snum INT PRIMARY KEY,
Sname VARCHAR(100) UNIQUE,
City VARCHAR(100),
Comm INT
);

CREATE TABLE Customers (
Cnum INT PRIMARY KEY,
Cname VARCHAR(100),
City VARCHAR(100) NOT NULL,
Snum INT,
FOREIGN KEY(Snum) REFERENCES SalesPeople(Snum)
);

CREATE TABLE Orders (
Onum INT PRIMARY KEY,
Amt DECIMAL(8,2),
Odate Date,
Cnum INT,
Snum INT,
FOREIGN KEY(Cnum) REFERENCES Customers(Cnum),
FOREIGN KEY(Snum) REFERENCES SalesPeople(Snum)
);

SELECT * FROM salespeople;



INSERT INTO salespeople (Snum,Sname,City,Comm) 
VALUES (1001,"Peel","London",12),
	   (1002,"Serres","Sanjose",13),
	   (1004,"Motika","London",11),
	   (1007,"Rifkin","Barcelona",15),
       (1003,"Axelrod","Newyork",10);
       
INSERT INTO customers (Cnum,Cname,City,Snum) 
VALUES (2001,"Hoffman","London",1001),
       (2002,"Giovanni","Rome",1003),
       (2003,"Liu","Sanjose",1002),
       (2004,"Grass","Berlin",1002),
       (2006,"Clemens","London",1001),
       (2008,"Cisneros","Sanjose",1007),
	   (2007,"Pereira","Rome",1004);
       
INSERT INTO Orders(Onum,Amt,Odate,Cnum,Snum)
Values (3001,18.69,'1990-10-3',2008,1007),
(3003,767.19,'1990-10-3',2001,1001),
(3002,1900.10,'1990-10-3',2007,1004),
(3005,5160.45,'1990-10-3',2003,1002),
(3006,1098.16,'1990-10-3',2008,1007),
(3009,1713.23,'1990-10-4',2002,1003),
(3007,75.75,'1990-10-4',2004,1002),
(3008,4273.00,'1990-10-5',2006,1001),
(3010,1309.95,'1990-10-6',2004,1002),
(3011,9891.88,'1990-10-6',2006,1001);

SELECT * FROM orders;
SELECT * FROM customers;
SELECT * FROM salespeople;

-- 1. Count the number of Salesperson whose name begin with ‘a’/’A’.
SELECT 
    count(*) AS "Number of salesperson whose name starts with a or A"
FROM
    salespeople
WHERE
    Sname LIKE 'a%' OR 'A%';
    
-- 2.Display all the Salesperson whose all orders worth is more than Rs. 2000.

SELECT salespeople.Snum,Sname,SUM(Amt) AS Total_Amount
FROM salespeople
INNER JOIN orders
ON salespeople.Snum = orders.Snum
GROUP BY Snum
HAVING Total_Amount>2000;

-- 3.Count the number of Salesperson belonging to Newyork.
SELECT 
    count(*) AS "Number of salesperson belonging to Newyork"
FROM
    salespeople
WHERE
    city="NewYork";
    
-- 4.Display the number of Salespeople belonging to London and belonging to Paris.
SELECT 
    count(*) AS "Number of salesperson belonging to London and paris"
FROM
    salespeople
WHERE
    city="London" or city="Paris";
    
-- 5. Display the number of orders taken by each Salesperson and their date of orders.
SELECT salespeople.Snum,Sname,count(*) AS "Number of orders", group_concat(Odate) AS "Order_dates"
FROM salespeople
INNER JOIN orders
ON salespeople.Snum = orders.Snum
GROUP BY Snum;


