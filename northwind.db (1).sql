SQL Workshop 1 Questions:
 
Tedarikçi ID'si 1 ile 5 arasındaki ürünler:
Tedarikçi ID'si 1, 2, 3, 4 veya 5 olan ürünleri listeleyin.
Tedarikçi ID'si 1, 2, 4 veya 5 olan ürünler:
Tedarikçi ID'si 1, 2, 4 veya 5 olan ürünleri listeleyin.
Ürün adı 'Chang' veya 'Aniseed Syrup' olan ürünler:
Ürün adı 'Chang' veya 'Aniseed Syrup' olan ürünleri listeleyin.
Tedarikçi ID'si 3 olan veya birim fiyatı 10'dan büyük ürünler:
Tedarikçi ID'si 3 olan veya birim fiyatı 10'dan büyük olan ürünleri listeleyin.
Ürün adı ve birim fiyatı ile birlikte getirme:
Ürün adı ve birim fiyatını içeren listeyi getirin.
Büyük harfe dönüştürerek 'c' harfi içeren ürünler:
Ürün adlarını büyük harfe dönüştürdükten sonra 'c' harfi içeren ürünleri listeleyin. (örneğin: 'Chai', 'Chocolate', vs.)
'n' ile başlayan ve tek karakterli bir harf içeren ürünler:
Ürün adı 'n' harfi ile başlayan ve içerisinde tek karakterli bir harf içeren ürünleri listeleyin. (örneğin: 'Naai, 'Nectar', vs.)
Stok miktarı 50'den fazla olan ürünler:
Stok miktarı 50'den fazla olan ürünleri listeleyin.
Ürünlerin en yüksek ve en düşük birim fiyatları:
En yüksek ve en düşük birim fiyatına sahip ürünleri listeleyin.
Ürün adında 'Spice' kelimesi geçen ürünler:
Ürün adında 'Spice' kelimesi geçen ürünleri listeleyin.


Answers:
 
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

