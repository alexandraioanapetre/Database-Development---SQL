use adventureworks;

--01 Get started with TSQL--
select * from SalesLT.Product; 

select Name, StandardCost, ListPrice
from SalesLT.Product; 

select Name, ListPrice - StandardCost
from SalesLT.Product;

select Name as ProductName, ListPrice - StandardCost AS Markup
from SalesLT.Product;

select ProductNumber, Color, Size, Color + ', ' + Size AS ProductDetails 
from SalesLT.Product;

select convert(varchar(5), ProductID) + ': ' + Name as ProductName
from SalesLT.Product; 

select SellStartDate,
	convert(nvarchar(30), SellStartDate) as ConvertedDate,
	convert(nvarchar(30), SellStartDate, 126) as ISO8601FormatDate
from SalesLT.Product; 

select Name, isnull(try_cast(Size as Integer),0) as NumericSize
from SalesLT.Product; 

select ProductNumber, isnull(Color, '') + ', ' + isnull(Size, '') as Product
from SalesLT.Product; 

select Name, nullif(Color, 'Multi') as SingleColor
from SalesLT.Product; 

select Name, coalesce(SellEndDate, SellStartDate) as StatusLastUpdated   --coalesce intoarce prima valoare nenull
from SalesLT.Product;

select Name,
	case
		when SellEndDate is null then 'Currently for sale'
		else 'No longer available'
	end as SalesStatus
from SalesLT.Product;

select Name,
	case Size	
		when 'S' then 'Small'
		when 'M' then 'Medium'
		when 'L' then 'Large'
		when 'XL' then 'Extra-Large'
		else isnull(Size, 'n/a')
	end as ProductSize
from SalesLT.Product;

--Challenge 1
--1. Retrieve customer details
select * from SalesLT.Customer;

--2. Retrieve customer name data
select 
Title, FirstName, MiddleName, LastName, Suffix 
from SalesLT.Customer;

--3. Retrieve customer names and phone numbers
select 
SalesPerson, Title + ' ' + FirstName as CustomerName, Phone
from SalesLT.Customer;

--Challenge 2
--1. Retrieve a list of customer companies
select
convert(varchar(5), CustomerID) + ': ' + CompanyName 
from SalesLT.Customer;

--2. Retrieve a list of sales order revisions
select
convert(nvarchar(30), SalesOrderNumber) + ' (' + convert(nvarchar(30), RevisionNumber) + ')'
from SalesLT.SalesOrderHeader;

select OrderDate,
	convert(nvarchar(30), OrderDate) as ConvertedDate,
	convert(nvarchar(30), OrderDate, 102) as ANSI102FormatDate
from SalesLT.SalesOrderHeader;

--Challenge 3
--1. Retrieve customer contact names with middle names if known
select * from SalesLT.Customer;
select FirstName + ' ' + isnull(MiddleName + ' ', '') + LastName as FirstLast
from SalesLT.Customer;

--2. Retrieve primary contact details
update SalesLT.Customer
set EmailAddress = null
where CustomerID % 7 = 1;

select CustomerID, coalesce(EmailAddress, Phone) as PrimaryContact  
from SalesLT.Customer;

--3. Retrieve shipping status
update SalesLT.SalesOrderHeader
set ShipDate = null
where SalesOrderID > 71899;

select SalesOrderID, OrderDate,
case 
	when ShipDate is null then 'Awaiting Shipment'
	else 'Shipped'
end as ShippingStatus
from SalesLT.SalesOrderHeader;

--02 Filter-Sort--

select Name, ListPrice
from SalesLT.Product
order by ListPrice desc, Name asc;

select top 20 with ties
Name, ListPrice
from SalesLT.Product
order by ListPrice desc;

select top 20 percent with ties
Name, ListPrice
from SalesLT.Product
order by ListPrice desc;

select Name, ListPrice
from SalesLT.Product
order by Name offset 0 rows fetch next 10 rows only; --va afisa primele 10 din lista

select Name, ListPrice
from SalesLT.Product
order by Name offset 10 rows fetch next 10 rows only; --va afisa primele 10 din lista

select distinct Color, Size
from SalesLT.Product;

select Name, Color, Size
from SalesLT.Product
where ProductModelID <> 6
order by Name;

select Name, ListPrice
from SalesLT.Product
where ListPrice > 1000.00
order by ListPrice;

select Name, ListPrice
from SalesLT.Product
where Name like 'HL Road Frame %';

select Name, ListPrice
from SalesLT.Product
where SellEndDate is not null;

select Name 
from SalesLT.Product
where SellEndDate between '2006/1/1' and '2006/12/31';

select ProductCategoryID, Name, ListPrice
from SalesLT.Product
where ProductCategoryID in (5,6,7);

select ProductCategoryID, Name, ListPrice, SellEndDate
from SalesLT.Product
where ProductCategoryID in (5,6,7) and SellEndDate is null;

select Name, ProductCategoryID, ProductNumber
from SalesLT.Product
where ProductNumber like 'FR%' or ProductCategoryID in (5,6,7);

--Challenge 1
--1. Retrieve a list of cities 
select distinct
City, StateProvince 
from SalesLT.Address
order by City asc;

--2. Retrieve the heaviest products
select top 10 
percent with ties Name 
from SalesLT.Product
order by Weight desc;

--Challenge 2
--1. Retrieve product details for product model 1 
select  
Name, Color, Size
from SalesLT.Product
where ProductModelID = 1;

--2. Filter products by color and size 
select 
ProductNumber, Name
from SalesLT.Product
where Color in ('Black','Red','White') and Size in ('S','M');

--3. Filter products by product number
select 
ProductNumber, Name, ListPrice
from SalesLT.Product 
where ProductNumber LIKE ('BK-%');

--4. Retrieve specific products by product number 
select 
ProductNumber, Name, ListPrice
from SalesLT.Product 
where ProductNumber LIKE 'BK-[^R]%-[0-9][0-9]';


--03a Joins--

select p.Name as ProductName, c.Name as Category 
from SalesLT.Product as p
join SalesLT.ProductCategory as c
on p.ProductCategoryID = c.ProductCategoryID;

select oh.OrderDate, oh.SalesOrderNumber, p.Name as ProductName, od.OrderQty, od.UnitPrice, od.LineTotal
from SalesLT.SalesOrderHeader as oh
join SalesLT.SalesOrderDetail as od
	on od.SalesOrderID = oh.SalesOrderID
join SalesLT.Product as p
	on od.ProductID = p.ProductID
order by oh.OrderDate, oh.SalesOrderID, od.SalesOrderDetailID;

select p.Name as ProductName, c.Name as Category, oh.SalesOrderNumber
from SalesLT.Product as p
left outer join SalesLT.SalesOrderDetail as od
	on p.ProductID = od.ProductID
left outer join SalesLT.SalesOrderHeader as oh
	on od.SalesOrderID = oh.SalesOrderID
inner join SalesLT.ProductCategory as c
	on p.ProductCategoryID = c.ProductCategoryID
order by p.ProductID;

select p.Name, c.FirstName, c.LastName, c.EmailAddress
from SalesLT.Product as p
cross join SalesLT.Customer as c; 

select pcat.Name as ParentCategory, cat.Name as SubCategory
from SalesLT.ProductCategory as cat
join SalesLT.ProductCategory pcat
	on cat.ParentProductCategoryID = pcat.ProductCategoryID
order by ParentCategory, SubCategory;

--Challenge 1
--1. Retrieve customer orders 
select c.CompanyName, oh.SalesOrderID, oh.TotalDue
from SalesLT.Customer as c
join SalesLT.SalesOrderHeader as oh
	on c.CustomerID = oh.CustomerID

--2. Retrieve customer orders with addresses 
select 
	c.CompanyName, 
	a.AddressLine1,
	a.City,
	a.StateProvince, 
	a.PostalCode,
	a.CountryRegion,
	oh.SalesOrderID,
	oh.TotalDue
from SalesLT.Customer as c
join SalesLT.SalesOrderHeader as oh
	on oh.CustomerID = c.CustomerID
join SalesLT.CustomerAddress as ca
	on ca.CustomerID = c.CustomerID
join SalesLT.Address as a
	on ca.AddressID = a.AddressID
where ca.AddressType = 'Main Office';

--Challenge 2
--1. Retrieve a list of all customers and their orders
select 
c.CompanyName,
c.FirstName,
c.LastName,
oh.SalesOrderID,
oh.TotalDue
from SalesLT.Customer as c
join SalesLT.SalesOrderHeader as oh
	on c.CustomerID = oh.CustomerID
order by oh.SalesOrderID desc;

--2. Retrieve a list of customers with no address
select 
c.CustomerID,
c.CompanyName,
c.FirstName,
c.LastName,
c.Phone
from SalesLT.Customer as c
left join SalesLT.CustomerAddress as ca
	on c.CustomerID = ca.CustomerID
where ca.AddressID is null;

--Challenge 3  --???
--1. Retrieve product information by category


--03b Subqueries--

select Name, ListPrice
from SalesLT.Product
where ListPrice > 
	(select max(UnitPrice)
	 from SalesLT.SalesOrderDetail);

select Name from SalesLT.Product
where ProductID in
	(select distinct ProductID
	from SalesLT.SalesOrderDetail
	where OrderQty >= 20);

	--OR:
select distinct Name
from SalesLT.Product as p
join SalesLT.SalesOrderDetail as o
	on p.ProductID = o.ProductID
where OrderQty >= 20;

select od.SalesOrderID, od.ProductID, od.OrderQty
from SalesLT.SalesOrderDetail as od
where od.OrderQty = 
	(select max(OrderQty)
	 from SalesLT.SalesOrderDetail as d
	 where od.ProductID = d.ProductID)
order by od.ProductID;

select o.SalesOrderID, o.OrderDate,
	(select CompanyName
	 from SalesLT.Customer as c
	 where c.CustomerID = o.CustomerID) as CompanyName
from SalesLT.SalesOrderHeader as o
order by o.SalesOrderID;

--Challenge 1 
--1. Retrieve products whose list price is higher than the average unit price.

select 
p.ProductID,
p.Name,
p.StandardCost,
p.ListPrice,
	(select AVG(o.UnitPrice)
	 from SalesLT.SalesOrderDetail as o
	 where p.ProductID = o.ProductID) as AvgSellingPrice
from SalesLT.Product as p
order by p.ProductID;

--2. Retrieve Products with a list price of 100 or more that have been sold for less than 100.
select 
p.ProductID,
p.Name,
p.ListPrice
from SalesLT.Product as p
where ProductID in
	(select ProductID
	from SalesLT.SalesOrderDetail
	where UnitPrice < 100)
and ListPrice >= 100
order by ProductID;

--Challenge 2
--1. Retrieve the cost, list price, and average selling price for each product
select 
p.ProductID,
p.Name,
p.StandardCost,
p.ListPrice,     
	(select AVG(o.UnitPrice)
	from SalesLT.SalesOrderDetail as o
	where p.ProductID = o.ProductID) as AvgSellingPrice
from SalesLT.Product as p
order by p.ProductID;

--2. Retrieve products that have an average selling price that is lower than the cost.
select 
p.ProductID,
p.Name,
p.StandardCost,
p.ListPrice,     
	(select AVG(o.UnitPrice)
	from SalesLT.SalesOrderDetail as o
	where p.ProductID = o.ProductID) as AvgSellingPrice
from SalesLT.Product as p
where StandardCost > 
	(select AVG(od.UnitPrice)
	 from SalesLT.SalesOrderDetail as od 
	 where p.ProductID = od.ProductID)
order by p.ProductID;


--04. Built-in-Fuctions--

select year(SellStartDate) as SellStartYear, ProductID, Name
from SalesLT.Product
order by SellStartYear;

select
	year(SellStartDate) as SellStartYear,
	datename(mm,SellStartDate) as SellStartMonth,
	day(SellStartDate) as SellStartDay,
	datename(dw, SellStartDate) as SellStartWeekday,
	datediff(yy, SellStartDate, getdate()) as YearsSold,
	ProductID,
	Name
from SalesLT.Product
order by SellStartYear;

select concat(FirstName + ' ', LastName) as FullName
from SalesLT.Customer;
		
select UPPER(Name) as ProductName,
	ProductNumber,
	ROUND(Weight, 0) as ApproxWeight,
	LEFT(ProductNumber, 2) as ProductType,
	SUBSTRING(ProductNumber, CHARINDEX('-', ProductNumber) + 1,4) as ModelCode,
	SUBSTRING(ProductNumber, LEN(ProductNumber) - CHARINDEX('-', REVERSE(RIGHT(ProductNumber, 3))) + 2, 2) as SizeCode
from SalesLT.Product;

--Logical Functions--
select Name, 
size as NumericSize
from SalesLT.Product
where ISNUMERIC(Size) = 1;

select Name, IIF(ISNUMERIC(Size) = 1, 'Numeric', 'Non-Numeric') as SizeType
from SalesLT.Product;

select prd.Name as ProductName,
	cat.Name as Category,
	CHOOSE (cat.ParentProductCategoryID, 'Bikes', 'Components', 'Clothing', 'Accessories') as ProductType
from SalesLT.Product as prd
join SalesLT.ProductCategory as cat
	on prd.ProductCategoryID = cat.ProductCategoryID

--Agregate Functions--
select count(*) as Products,
	count(distinct ProductCategoryID) as Categories,
	avg(ListPrice) as AveragePrice 
from SalesLT.Product;

select count(p.ProductID) as BikeModels, avg(p.ListPrice) as AveragePrice
from SalesLT.Product as p
join SalesLT.ProductCategory as c
	on p.ProductCategoryID = c.ProductCategoryID
where c.Name like '%Bikes';

--Group by Function--
select Salesperson, count(CustomerID) as Customers 
from SalesLT.Customer
group by SalesPerson
order by SalesPerson;

select c.Salesperson, sum(oh.SubTotal) as SalesRevenue
from SalesLT.Customer c
join SalesLT.SalesOrderHeader oh
	on c.CustomerID = oh.CustomerID
group by c.SalesPerson
order by SalesRevenue desc;

select c.Salesperson, ISNULL(SUM(oh.SubTotal), 0.00) as SalesRevenue
from SalesLT.Customer c
left join SalesLT.SalesOrderHeader oh
	on c.CustomerID = oh.CustomerID
	group by c.SalesPerson
order by SalesRevenue desc;

--Having Clause--
select SalesPerson, count(CustomerID) as Customers
from SalesLT.Customer
group by SalesPerson
having count(CustomerID) > 100 
order by SalesPerson;

--Challenge 1 
--1. Retrieve the order ID and freight cost of each order.
select 
	SalesOrderID,
	round(Freight, 2) as FreightCost
from SalesLT.SalesOrderHeader;

--2. Add the shipping method.
select 
	SalesOrderID,
	round(Freight, 2) as FreightCost,
	lower(ShipMethod) as ShippingMethod
from SalesLT.SalesOrderHeader;

--3. Add shipping date details.
select 
	SalesOrderID,
	round(Freight, 2) as FreightCost,
	lower(ShipMethod) as ShippingMethod,
	year(ShipDate) as ShipYear,
	datename(mm, ShipDate) as ShipMonth,
	day(ShipDate) as ShipDay
from SalesLT.SalesOrderHeader;

--Challenge 2
--1. Retrieve total sales by product
select 
p.Name,
SUM(o.LineTotal) as TotalRevenue
from SalesLT.Product p
join SalesLT.SalesOrderDetail o
	on p.ProductID = o.ProductID
group by p.Name
order by TotalRevenue desc;

--2. Filter the product sales list to include only products that cost over 1,000
select 
p.Name,
SUM(o.LineTotal) as TotalRevenue
from SalesLT.Product p
join SalesLT.SalesOrderDetail o
	on p.ProductID = o.ProductID
where p.ListPrice > 1000
group by p.Name
order by TotalRevenue desc;

--3. Filter the product sales groups to include only total sales over 20,000:
select 
p.Name,
SUM(o.LineTotal) as TotalRevenue
from SalesLT.Product p
join SalesLT.SalesOrderDetail o
	on p.ProductID = o.ProductID
where p.ListPrice > 1000
group by p.Name
having sum(o.LineTotal) > 20000
order by TotalRevenue desc;
