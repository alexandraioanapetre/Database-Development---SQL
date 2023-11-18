--Retrieve the names of customers and the dates of their orders.
--Numele clientilor si datele comenzilor acestora

Select
    C.Name,
    O.OrderDate
From
    Customers C
join 
    Orders O ON C.CustomerID = O.CustomerID;

--List all customers along with their orders (including details and the name of the products(
--Toti clientii impreuna cu comenzile lor (inclusiv detalii si numele produselor (


Select
* 
From Customers C
join Orders O on C.CustomerID = O.CustomerID
join OrderDetails OD on O.OrderID = OD.OrderID
join Products P on OD.ProductID = P.ProductID

Select c.name,
o.orderdate,
od.quantity,
p.productname,
p.price
From Customers C
join Orders O
on O.CustomerID = C.CustomerID
join OrderDetails OD
on OD.OrderID = O.OrderID
join Products P
on P.ProductID = OD.ProductID
