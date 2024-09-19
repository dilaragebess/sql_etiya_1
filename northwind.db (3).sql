--1
SELECT Customers.CustomerID, Orders.OrderID, Orders.OrderDate from Customers
JOIN Orders ON Customers.CustomerID = orders.CustomerID

--2
select Suppliers.SupplierID, Products.ProductID, Products.ProductName from Suppliers
LEFT JOIN Products on Suppliers.SupplierID = Products.SupplierID

--3
SELECT Employees.EmployeeID, Orders.OrderID, Orders.OrderDate from Employees
RIGHT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
order by Employees.EmployeeID

--4
SELECT Customers.CustomerID, Orders.OrderID, Orders.OrderDate from Customers
FULL JOIN Orders ON Customers.CustomerID = Orders.CustomerID
order by Customers.CustomerID

--5
select Products.ProductID, Categories.CategoryID from Products
CROSS JOIN Categories ON Products.CategoryID = Categories.CategoryID
order by Categories.CategoryID

--6
--FOR 1998
select Customers.CompanyName, Orders.OrderID, orders.OrderDate, CONCAT(Employees.FirstName, ' ', Employees.LastName) AS 'Çalışan Adı Soyadı' from Orders
JOIN Customers on orders.CustomerID = customers.CustomerID 
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE STRFTIME('%Y',Orders.OrderDate) = '1998'
--FOR 2016
select Customers.CompanyName, Orders.OrderID, orders.OrderDate, CONCAT(Employees.FirstName, ' ', Employees.LastName) AS 'Çalışan Adı Soyadı' from Orders
JOIN Customers on orders.CustomerID = customers.CustomerID 
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE STRFTIME('%Y',Orders.OrderDate) = '2016'

--7
SELECT Customers.CustomerID, COUNT(Orders.orderid) as 'Total Order Amount' FROM Customers
JOIN Orders on Customers.CustomerID = Orders.CustomerID
group by Customers.CustomerID
HAVING COUNT(orderid) >= 5

--8
SELECT Products.ProductName, SUM(OrderDetails.Quantity) AS 'Satılan toplam adet', (SUM(OrderDetails.Quantity) * OrderDetails.UnitPrice) as 'Quantity * UnitPrice' from Products
join OrderDetails ON Products.ProductID = OrderDetails.ProductID
GROUP by Products.ProductID

--9
SELECT Customers.CompanyName, orders.OrderID from Customers
JOIN Orders oN Customers.CustomerID = Orders.CustomerID
WHERE Customers.CompanyName LIKE 'B%'

--10
SELECT Products.ProductName, Categories.CategoryID from Products
RIGHT JOIN Categories ON Products.CategoryID = Categories.CategoryID


--11
SELECT CONCAT(e1.FirstName, ' ',  e1.LastName) as 'Çalışan', CONCAT(e2.FirstName, ' ',  e2.LastName) as 'Yönetici' from Employees e1
JOIN Employees e2 ON e1.ReportsTo = e2.EmployeeID


--12
SELECT Products.ProductName, MAX(Products.UnitPrice) as 'Price', Categories.CategoryID FROM Products
JOIN Categories on Products.CategoryID = Categories.CategoryID
GROUP by Categories.CategoryID


--13
select * FROM Orders
FULL JOIN OrderDetails on Orders.OrderID = OrderDetails.OrderID
order by OrderDetails.OrderID ASC 


--14
SELECT Employees.EmployeeID, CONCAT(Employees.FirstName, ' ',  Employees.LastName) as 'Çalışan',COUNT(Orders.OrderID) AS 'İşlenen Sipariş Sayısı'FROM Employees
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Employees.EmployeeID


--15 
-- all categories
SELECT Products.ProductName, Products.UnitPrice as 'Price', Categories.CategoryID FROM Products
JOIN Categories on Products.CategoryID = Categories.CategoryID
order by Categories.CategoryID

--only category id 1
SELECT Products.ProductName, Products.UnitPrice as 'Price', Categories.CategoryID FROM Products
JOIN Categories on Products.CategoryID = Categories.CategoryID
WHERE Categories.CategoryID = 1

--min price for each category
SELECT Products.ProductName, Products.UnitPrice as 'Price', Categories.CategoryID FROM Products
JOIN Categories on Products.CategoryID = Categories.CategoryID
GROUP by Categories.CategoryID
having Products.UnitPrice = MIN(Products.UnitPrice)

--16
SELECT Products.ProductName, Suppliers.SupplierID from Products
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
GROUP BY Suppliers.SupplierID
HAVING Products.UnitPrice = MAX(Products.UnitPrice) 

--17
SELECT CONCAT(Employees.FirstName, ' ',  Employees.LastName) as 'Çalışan', Orders.OrderID, Orders.OrderDate FROM Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Employees.EmployeeID
HAVING Orders.OrderDate = MAX(Orders.OrderDate)


--18
select COUNT(Products.ProductID) 'Fiyatı 20 birimden fazla olan product sayısı', Categories.categoryid from Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
where Products.UnitPrice >= 20
group by Categories.categoryid
order by Categories.categoryid asc

--19
--for 1997-1998
SELECT Customers.CompanyName, orders.OrderID from Customers
JOIN Orders oN Customers.CustomerID = Orders.CustomerID
where STRFTIME('%Y',Orders.OrderDate) BETWEEN '1997' AND '1998'

--for 2016-2018
SELECT Customers.CompanyName, orders.OrderID from Customers
JOIN Orders oN Customers.CustomerID = Orders.CustomerID
where STRFTIME('%Y',Orders.OrderDate) BETWEEN '2016' AND '2018'

--20
SELECT Customers.CustomerID, orders.OrderID, orders.OrderDate from Customers
RIGHT JOIN Orders oN Customers.CustomerID = Orders.CustomerID
GROUP by Customers.CustomerID
having Customers.CustomerID IS NULL



