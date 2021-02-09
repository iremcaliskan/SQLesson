-- select column(s) from table_name where condition
-- Sorgu sonucu Tablo oluşur.
-- Alias, takma isim vermektir
-- ANSII standardı, Oracle, MySql, Oracle'da da çalışır!
-- Metinler ' ' arasına yazılır : ANSII standartı
Select CustomerID Id  From Customers Where CustomerID = 'ALFKI'

select * from Customers where City = 'Berlin'

--case insensitive (harf duyarsız) SeleCT veya categoryId veya products gibi
SeLecT * from Products where categoryId = 1 or categoryId = 3

select * from products where CategoryId = 1 and UnitPrice >= 10

-- order by : sırala, A->Z, en küçük sayıdan en büyüğe
-- ilk önce CategoryId sonra ProductName'e göre sıralar
select * from products order by CategoryId, ProductName

select * from products order by UnitPrice desc  -- ascending : artan
-- default asc'dir artandır.
-- descending : azalan, düşen, desc

select * from Products where CategoryId = 1 order by UnitPrice desc
-- sitedeki filtre seçimi gibi, araba modeli ve fiyat azalan

select COUNT(ProductName) from Products -- satır sayısı, data sayısı, kaç ürün var?, tek bir kolon tek bir sayı

select count(*) from Customers -- 91 müşteri var

select COUNT(*) ADET from Products where CategoryId =2

select CategoryID from products group by CategoryID 
-- group by ile select edilen kolon group by içerisindeki ile aynı veya kümülatif datalar olabilir.
-- tekrar edilmeden listeler

select CategoryId, count(*) from products group by CategoryID
-- Her grup elemanı için count hesaplanır.
-- CategoryId'lerin herbiri bir grup ve onların sayısı count*

-- KDS : Karar Destek Sistemleri

select CategoryId, count(*) from Products group by CategoryId having count(*)<10
-- 10 taneden az ürün çeşidi olan kategorileri ver

select CategoryId, count(*) from Products where UnitPrice >=20 group by CategoryId having count(*)<10
-- önce where ve from çalışır, group by sonra
-- having kümülatiflere uygulanır

select Products.ProductID, Products.ProductName, Products.UnitPrice, Categories.CategoryName
from Products inner join Categories
on Products.CategoryID = Categories.CategoryID     -- on: durumunda, şartında
where Products.UnitPrice >=10 and Products.UnitPrice <=20
-- inner join, sadece iki tablodada eşleşenleri bir araya getirir, eşleşmeyen data varsa getirmez.

select *
from Products p left join [Order Details] od -- ürünlerde olup sipariş detayında olmayanlarıda ekler
on p.ProductID = od.OrderID

select * from Customers c left join Orders o  -- Müşterilerde olup siparişte olmayanlarıda ekler
on c.CustomerID = o.CustomerID
where o.CustomerID is null -- ürün almamış müşteriler

-- inner join null değerleri almaz.
-- left join: sol tablonun tamamını alır null dahil ve diğer tablolarla ilişkili verileri döndürür.
-- right join : sağ tablonun tamamını alır ve diğer tablo ile ilişkilerini yazdırır, ilişki bulunmazsa null yazdırır.
-- full (outher) join : her iki tablonun eşleşen ve eşleşmeyen kayıtlarını alır. left ve right join birşeimidir.
-- DTO (Data Transformation Object) : C#, Joinli yapılar için classlar yaratmak

-- çoklu join
select *
from Products p inner join [Order Details] od
on p.ProductID = od.OrderID
inner join Orders o
on o.OrderDate = od.OrderID