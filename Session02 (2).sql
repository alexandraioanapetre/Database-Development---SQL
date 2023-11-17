--sa se afiseze numarul total de produse [Production].[Product] 
select count(*)
from [Production].[Product]

select top 10
*
from Production.Product

--sa se afiseze numarul total de produse de culoare Red
select count(*)
from [Production].[Product]
where Color = 'Red'

----sa se afiseze suma totala a pretului de lista ListPrice

select sum(ListPrice)
from [Production].[Product]

--sa se afiseze media cost standard [StandardCost]
select avg(StandardCost)
from [Production].[Product]

