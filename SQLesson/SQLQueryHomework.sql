-- Find out how much money we have made in total from each product.
select p.ProductName as [Product Name], sum((od.UnitPrice*od.Quantity)-((od.UnitPrice*od.Quantity)*od.Discount)) as [Net Winnings]
from Products p 
inner join [Order Details] od
on p.ProductID = od.ProductID
inner join Orders o
on o.OrderID = od.OrderID
group by p.ProductName