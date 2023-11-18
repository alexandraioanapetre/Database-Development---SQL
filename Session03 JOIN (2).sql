--numele fiecarei companii si cate comenzi a avut
--A list with the name of companies and the number of their orders

Select 
C.companyname,
COUNT(*) as NmbOrders,
YEAR(O.orderdate) as OrderYear
From Sales.Customers C
Join Sales.Orders O
on C.CustID = O.CustID
Group By C.CompanyName, YEAR(O.orderdate)
ORDER BY C.companyname

--numarul de comenzi pe an

Select 
YEAR(orderdate) as YearOrder,
COUNT (orderid) as NmbOfOrders
From Sales.Customers C
Join Sales.Orders O
on C.CustID = O.CustID
Group By Year (OrderDate)

--in ce zi au fost cele mai multe comenzi
--When from a date perspective there were the most orders

Select 
TOP 1
O.orderdate, COUNT(*) as NmbOrders
From Sales.Orders O
GROUP BY O.orderdate
ORDER BY NmbOrders DESC

--List top 3 companies considering the total amount spent

Select top 3		 c.companyname	   , sum((1-od.discount)*od.qty*od.unitprice) as totalamount	From Sales.Customers c    join Sales.Orders o	  on c.custid = o.custid    join Sales.OrderDetails od	  on od.orderid = o.orderid   Group by c.companyname   Order by totalamount desc
