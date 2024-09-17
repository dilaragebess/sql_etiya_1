SELECT * FROM Products where supplierid BETWEEN 1 AND 5

SELECT * FROM Products where supplierid IN (1,2,4,5)

SELECT * From Products where productname = 'Chang' OR productname = 'Aniseed Syrup' 

Select * From Products where supplierid = 3 OR unitprice >= 10

Select ( productname ||  ' ' || unitprice ) AS 'product prices' from Products
 
select UPPER(productname), * from products where productname LIKE '%C%'

Select * from Products where productname LIKE 'n%[!n]'

select * from Products where unitsinstock >= 50 

select productname,unitprice From Products where unitprice = (SELECT MIN(unitprice) FROM Products) OR unitprice = (SELECT MAX(unitprice) FROM Products)

select * from Products where productname LIKE '%Spice%'

