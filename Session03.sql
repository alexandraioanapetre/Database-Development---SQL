-- from Adventure get how many products are for each color

select Color, count(*) as NmbProducts   
from Production.Product	
where Color is not null
group by Color	
order by NmbProducts desc;    

select
	Color, 
	MIN(ListPrice) as MinListPrice,
	MAX(ListPrice) as MaxListPrice,
	cast(AVG(ListPrice) as decimal(10,2)) as AvgListPrice   
from Production.Product	
where Color is not null
group by Color;		

select count(*)
from Sales.SalesOrderHeader;

select top 10
*
from Sales.SalesOrderHeader;

-- Learn order date

-- in ce an au fost cele mai multe comenzi

select top 1
year (OrderDate), count (*) as NmbOrders
from sales.SalesOrderHeader
group by year(OrderDate)
order by NmbOrders desc; 

-- in ce zile a lunii au fost cele mai multe comenzi
select top 3
day(OrderDate) as NmbDay, count (*) as NmbOrders
from sales.SalesOrderHeader
group by day(OrderDate)
order by NmbOrders desc;

select top 1
dayorder, datename(mm,monthorder) as monthname, NmbOrders
from
(
	select 
	day(orderdate) dayorder, month(orderdate) monthorder, count(*) as NmbOrders
	from Sales.SalesOrderHeader
	group by day(orderdate), month(orderdate)
) vt
order by NmbOrders desc;