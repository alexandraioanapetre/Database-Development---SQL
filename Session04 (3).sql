--Sa se afiseze toti clientii care au cel putin o comanda:

Select distinct 
c.companyname
FROM
    Sales.Customers c
JOIN
    Sales.Orders o ON c.custid = o.custid;

--Sa se afiseze clientii care nu au nici o comanda:

Select c.companyname
FROM
    Sales.Customers c
Left Join
    Sales.Orders o 
	ON c.custid = o.custid
Where o.orderid is null

--Sa se afiseze numele companiilor si pentru cele care au comenzi, numarul de comenzi:

SELECT
    c.companyname,
    COUNT(o.orderid) AS NumberOfOrders
FROM
    Sales.Customers c
Left Join Sales.Orders o
   ON c.custid = o.custid
GROUP BY c.CompanyName

--Obs: left aduce toti clientii. daca puneam inner ii obtineam doar pe cei care au comenzi.

--Sa se afiseze numele companiilor (toate) si unde este cazul numarul total de produse comandate:

Select
    c.companyname,
    SUM(od.qty) as TotalQty
From
    Sales.Customers c
Left Join
    Sales.Orders o on c.custid = o.custid
Left Join
    Sales.OrderDetails od on od.orderid = o.orderid
Group by
    c.CompanyName;

 --
Select
    c.companyname,
    AVG(od.qty) as TotalQty
From
    Sales.Customers c
Left Join
    Sales.Orders o on c.custid = o.custid
Left Join
    Sales.OrderDetails od on od.orderid = o.orderid
Group by
    c.CompanyName
Order by TotalQty

--Sa se afiseze categoria produsului vandut in cea mai mare cantitate:

Select top 1
	c.categoryname, SUM(od.qty) as Quantity
From Sales.OrderDetails od
Join Production.Products p
	on od.productid = p.productid
Join Production.Categories c
	on c.categoryid = p.categoryid
Group by c.categoryname, p.productid
Order by Quantity desc
