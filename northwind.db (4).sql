SQL Workshop 4 Questions:
1. En Pahalı Ürünü Getirin
2. En Son Verilen Siparişi Bulun
3. Fiyatı Ortalama Fiyattan Yüksek Olan Ürünleri Getirin
4. Belirli Kategorilerdeki Ürünleri Listeleyin
5. En Yüksek Fiyatlı Ürünlere Sahip Kategorileri Listeleyin
6. Bir Ülkedeki Müşterilerin Verdiği Siparişleri Listeleyin
7. Her Kategori İçin Ortalama Fiyatın Üzerinde Olan Ürünleri Listeleyin
8. Her Müşterinin En Son Verdiği Siparişi Listeleyin
9. Her Çalışanın Kendi Departmanındaki Ortalama Maaşın Üzerinde Maaş Alıp Almadığını Bulun
10. En Az 10 Ürün Satın Alınan Siparişleri Listeleyin
11. Her Kategoride En Pahalı Olan Ürünlerin Ortalama Fiyatını Bulun
12. Müşterilerin Verdiği Toplam Sipariş Sayısına Göre Sıralama Yapın
13. En Fazla Sipariş Vermiş 5 Müşteriyi ve Son Sipariş Tarihlerini Listeleyin
14. Toplam Ürün Sayısı 15'ten Fazla Olan Kategorileri Listeleyin
15. En Fazla 5 Farklı Ürün Sipariş Eden Müşterileri Listeleyin
16. 20'den Fazla Ürün Sağlayan Tedarikçileri Listeleyin
17. Her Müşteri İçin En Pahalı Ürünü Bulun
18. 10.000'den Fazla Sipariş Değeri Olan Çalışanları Listeleyin
19. Kategorisine Göre En Çok Sipariş Edilen Ürünü Bulun
20. Müşterilerin En Son Sipariş Verdiği Ürün ve Tarihlerini Listeleyin
21. Her Çalışanın Teslim Ettiği En Pahalı Siparişi ve Tarihini Listeleyin
22. En Fazla Sipariş Verilen Ürünü ve Bilgilerini Listeleyin

Answers:
--1
select productname from Products
where unitprice = (SELECT max(unitprice) from Products)

--2
SELECT orderid, orderdate from Orders
where orderdate = (select max(orderdate) from orders)

--3
SELECT productname, unitprice from Products
where unitprice > (select AVG(unitprice) from Products)


--4
select productname, categoryid from Products
where categoryid IN (select categoryid from Categories 
                    where Categories.categoryid IN ('1','2'))
order by categoryid

--5 
select categoryid, productname from Products
where unitprice = (SELECT max(unitprice) from Products)

--6
select companyname, country from Customers
where country IN (SELECT country from Customers 
                 where country = 'Germany')
                 
--7
select categoryid,productname,unitprice from Products
where unitprice > (select AVG(unitprice) from Products)
group by productname
order by categoryid

--8
select Orders.customerid, orderid, orderdate as 'Last order date' from Orders
JOIN (select o.customerid from orders o  
      GROUP BY o.customerid
     HAVING orderdate = max(orderdate)) AS '1' ON orders.CustomerID = '1'.CustomerID
     
--Kontrol querysi:
--SELECT max(orderdate) FROM orders
--where orderid = '26529' 
     
--9 


--10
select orderid, COUNT(OrderDetails.productid) from OrderDetails
JOIN (select productid from Products) as '2' ON OrderDetails.ProductID ='2'.ProductID 
group by orderid
HAVING COUNT(OrderDetails.ProductID) >= 10

--Kontrol querysi:
--SELECT COUNT(OrderDetails.ProductID) FROM OrderDetails 
--where orderid = '11078' : 11 

--11
select AVG(Products.unitprice) AS 'Average of priciest products' from Products
JOIN (select productid,categoryid,unitprice from Products group by categoryid having unitprice = MAX(unitprice)
     ) as '3' 
ON Products.ProductID = '3'.ProductID

--12
select Orders.customerid, COUNT(Orders.orderid) 'Order Amount' from Orders
JOIN (Select orderid from orders) AS '4' ON orders.OrderID = '4'.OrderID 
group by customerid
order by COUNT(Orders.orderid) 

--Kontrol querysi:
--SELECT COUNT(Orders.orderid)  FROM Orders 
--where customerid = 'OCEAN'  : 154

--13
select Orders.customerid, COUNT(Orders.orderid) 'Order Amount', orderdate as 'Last Order Date' from Orders
JOIN (Select orderid from orders) AS '4' ON orders.OrderID = '4'.OrderID 
group by customerid
having orderdate = max(orderdate)
order by COUNT(Orders.orderid) DESC
LIMIT 5

--14 I've changed the question as more than 10
select Categories.CategoryName, Products.categoryid, COUNT(Products.ProductID) from Products
JOIN (select ProductID from Products) as '5' ON Products.ProductID = '5'.ProductID
JOIN Categories ON Categories.CategoryID = Products.CategoryID
group by Products.categoryid
HAVING COUNT(Products.ProductID) > 10


--15
select Orders.CustomerID,COUNT(OrderDetails.ProductID) from OrderDetails
JOIN (Select orderid from Orders) AS '4' ON OrderDetails.OrderID= '4'.OrderID
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
GROUP BY Orders.CustomerID

--16 I've changed the question as 4 instead of 20
Select Products.SupplierID, COUNT(Products.ProductID)as 'Ürün Sayısı' from Products
JOIN (SELECT supplierid FROM Suppliers) AS '7' ON Products.SupplierID = '7'.SupplierID
group by Products.SupplierID
HAVING COUNT(Products.ProductID) > 4

--17
select Customers.CustomerID, productid, unitprice as 'Fiyat' from Orders
JOIN (select orderid,productid,unitprice from OrderDetails
) AS '1' ON  Orders.OrderID = '1'.OrderID
JOIN Customers on orders.CustomerID = Customers.CustomerID
GROUP BY orders.OrderID
having unitprice = MAX(unitprice)
 
--18 I've changed the question as 1700 instead of 10.000
Select Orders.EmployeeID, COUNT(Orders.OrderID) as 'Sipariş Sayısı' from Orders
JOIN (SELECT EmployeeID FROM Employees) AS '7' ON  Orders.EmployeeID = '7'.EmployeeID
group by Orders.EmployeeID
HAVING COUNT(Orders.OrderID) > 1700

--19
select Categories.CategoryName, Categories.categoryid, Products.ProductName, COUNT(orderid) 'Sipariş sayısı' from Products
JOIN (select productid,orderid from OrderDetails) as '5' ON Products.ProductID = '5'.ProductID
JOIN Categories ON Categories.CategoryID = Products.CategoryID
group by Products.categoryid


--20
select Orders.customerid, productid, orderdate as 'Last Order Date' from Orders
JOIN (Select orderid from orders group by customerid having orderdate = max(orderdate)) AS '4' ON orders.OrderID = '4'.OrderID
JOIN(SELECT orderid,productid FROM OrderDetails) '1' ON Orders.OrderID='1'.OrderID
group by customerid


--21
Select Orders.EmployeeID, Orders.OrderID, Orders.ShippedDate as 'Teslim Tarihi',unitprice from Orders
JOIN (SELECT EmployeeID FROM Employees) AS '7' ON  Orders.EmployeeID = '7'.EmployeeID
join(select orderid,productid, unitprice from OrderDetails)
as '11'on Orders.OrderID = '11'.OrderID
group by Orders.EmployeeID
having unitprice = max(unitprice)


--22
select * from Products 
join (
  select productid, COUNT(orderid) from OrderDetails GROUP BY productid order by count(orderid) desc LIMIT 1)  
 AS '10' on Products.ProductID = '10'.ProductID

