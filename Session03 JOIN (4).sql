Use DemoDB

--Numele clientilor care au comandat laptop

Select 
C.Name, P.ProductName
From Customers C
join Orders O 
on C.CustomerID = O.CustomerID
join OrderDetails OD 
on O.OrderID = OD.OrderID
join Products P
on P.ProductID = OD.ProductID
Where P.ProductName = 'Laptop'

--pentru fiecare client cat a chieltuit in total

Select 
C.Name,
SUM(O.TotalAmount)
From Customers C
Join Orders O 
on C.CustomerID = O.CustomerID
Group BY C.Name
