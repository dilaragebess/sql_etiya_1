SELECT categoryid, unitsinstock FROM Products 
group by categoryid


SELECT productname, unitprice from Products
order by unitprice DESC
LIMIT 5

SELECT supplierid, AVG(unitprice) AS 'Average Price' from Products
group by supplierid

select categoryid, AVG(unitprice) AS 'Average Price'  from Products
WHERE unitprice >= 100  
GROUP BY categoryid

select orderid, (unitprice * quantity) AS 'Total Price' from 'Order Details'
WHERE unitprice * quantity >= 1000
group by orderid

SELECT orderid, shippeddate FROM Orders 
Group by orderid
Order by shippeddate DESC
LIMIT 10

Select productid, AVG(unitprice) AS 'Average Price' From Products
Group by productid

Select productid, SUM(unitsinstock) AS 'Total Stock Amount'  from Products
where unitprice >= 50
group by productid

select orderid, orderdate from Orders
group by orderid
order by orderdate ASC
LIMIT 1

select CONCAT(firstname, ' ', lastname) AS [İsim Soyisim], (CURRENT_DATE - hiredate) AS [Employed Duration] from Employees
Group BY [İsim Soyisim]
order by [Employed Duration] DESC

SELECT orderid, ROUND(SUM(unitprice),0) AS 'Rounded Total Unit Price'FROM 'Order Details' 
Group by orderid

Select COUNT(productid) from Products
where unitsinstock != 0

select MIN(unitprice) AS 'Lowest Price', MAX(unitprice) AS 'Highest Price' from Products

select SUM(orderid) AS 'Total Orders', STRFTIME('%Y',orderdate) AS 'YEAR' from Orders
group by STRFTIME('%Y',orderdate)

select CONCAT(firstname, ' ', lastname) AS [İsim Soyisim] from Employees
Group BY [İsim Soyisim]

SELECT city, LENGTH(city) AS 'CHAR LENGTH'from Customers
WHERE city IS NOT NULL
group by city
ORDER BY LENGTH(city) 

SELECT productid, ROUND(unitprice,2) AS 'Rounded Unit Price'FROM Products
Group by productid

Select COUNT(*) AS 'Total Order Amount' from Orders 

select categoryid, AVG(unitprice) AS 'Average Price'from Products
group by categoryid

--Question 20 
--SELECT COUNT(orderid),
--CASE 
--when shippeddate IS NULL THEN ?????
--END AS 'Percantage'
--from Orders

--select COUNT(orderid) from Orders where shippeddate IS NULL --21
--select Count(*) AS 'Total Order' from Orders --16282

select unitprice as 'Max Price', 
CASE 
WHEN MAX(unitprice) THEN unitprice + (unitprice * 0.1)
END AS 'Increased Price'
from Products
   
SELECT SUBSTRING(productname, 1, 3) AS 'Product names' from Products 

select SUM(orderid) AS 'Total Orders', STRFTIME('%Y',orderdate) AS 'YEAR', from Orders
group by STRFTIME('%Y',orderdate)

select SUM(orderid) AS 'Total Orders', STRFTIME('%m',orderdate) as 'MONTH' FROM Orders
group by STRFTIME('%m',orderdate)


SELECT ROUND(unitprice*quantity,2) AS 'Price * Quantity' from 'Order Details'


select productid, SUM(unitprice) from Products
where unitsinstock = 0 
group by productid
