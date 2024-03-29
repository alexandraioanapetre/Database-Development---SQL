--1. Retrieve all orders and their corresponding customer names, specifically for individuals:
--1.1.Retrieve only the rows where the PersonType column in the Person.Person table has the value 'IN' (Individual consumers):

Select
	P.FirstName,
	P.MiddleName,
	P.LastName,
	P.PersonType,
	SOH.OrderDate,
	SOH.TotalDue
From Sales.SalesOrderHeader as SOH
JOIN Sales.Customer as C
	on SOH.CustomerID = C.CustomerID
JOIN Person.Person as P
	on P.BusinessEntityID = C.PersonID
Where P.PersonType = 'IN';

--Returns 27.659 rows

--1.2.Include the following columns in your results:
	- FirstName, MiddleName, LastName from the Person.Person table.
	- OrderDate, TotalDue from the Sales.SalesOrderHeader table.

Select
	P.FirstName,
	P.MiddleName,
	P.LastName,
	P.PersonType,
	SOH.OrderDate,
	SOH.TotalDue
From Sales.SalesOrderHeader as SOH
JOIN Sales.Customer as C
	on SOH.CustomerID = C.CustomerID
JOIN Person.Person as P
	On P.BusinessEntityID = C.PersonID;

--Returns: 31.465 

-- 2.Retrieve the product names and corresponding categories from the Products table and the ProductCategory table:
-- Include the following columns in your results:
	Name (use alias ProductName) from the Production.Product table.
	Name (use alias CategoryName) from the Production.ProductCategory table.

Select
	P.Name AS ProductName,
	PSUBC.Name AS CategoryName
From Production.Product as P
JOIN Production.ProductSubcategory as PSUBC
	on P.ProductSubcategoryID = PSUBC.ProductSubcategoryID
JOIN PRODUCTION.ProductCategory as PC
	on PSUBC.ProductCategoryID = PC.ProductCategoryID;

--Returns 295 rows

--3. Retrieve a specific product using its location:
--Retrieve the product name for the product stored in Subassembly location, Shelf W and Bin 9:
--Include the following columns in your results:
	Name (use alias ProductName) from the Production.Product table.
	Quantity from the Production.ProductInventory table.

Select
	P.[Name] as ProductName,
	PINV.Quantity
From Production.Product as P
JOIN Production.ProductInventory as PINV
	on P.ProductID = PINV.ProductID
JOIN Production.[Location] as L
	on PINV.LocationID = L.LocationID
Where L.[Name] = 'Subassembly'
	AND PINV.Shelf = 'W' 
	AND PINV.Bin = 9;

--Results:
	ProductName: HL Mountain Pedal
	Quantity: 153				