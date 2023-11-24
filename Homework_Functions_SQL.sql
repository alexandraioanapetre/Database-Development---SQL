-- 1.LEAST - Returns the smallest value of the list:
Select Least(3, 12, 34, 8, 25);  
--Returns 3

-- 2.MAX - Returns the maximum value in the expression:
Select MAX(ListPrice) as [MAXPrice] 
From Production.Product;  
Go
--Returns 3578,27

-- 3.MIN - Returns the minimum value in the expression:
Select MIN(TaxRate)
From Sales.SalesTaxRate; 
Go
--Returns 5.00 

-- 4.AVG - Returns the average of the values in a group and it ignores null values:
Select AVG(DISTINCT ListPrice)  
From Production.Product;  
Go
--Returns 437,4042

-- 5.COUNT - Returns the number of items found in a group:
Select COUNT(*)
From HumanResources.Employee;
Go
--Returns 290

-- 6.CONCAT - Returns a string resulting from the concatenation or joining of 2 or more string values:
Select CONCAT ('Buna',' ziua','!');
Go
--Returns Buna ziua!

-- 7.LEFT - Returns the left part of a character string with the specified number of characters:
Select LEFT ('xyz', 10);
Go
--Returns xyz

-- 8.UPPER - Returns a character expression with lowercase character data converted to uppercase:
Select UPPER(LastName) AS LastName
From Person.Person
Where LastName = 'Simon'
Order by LastName;
Go
--Returns SIMON

-- 9.LTRIM - Removes space character char(32) or other specified characters from the start of a string:
Select LTRIM('00alexandra' , '00');
Go
--Returns alexandra.

-- 10.RTRIM - Removes space charachter char(32) or other specified characters form the end of a string:
Select RTRIM('alexandra00' , '00');
Go
--Returns alexandra

-- 11.TRIM - Removes the space character char(32) or other specified characters from the start and end of a string:
Select TRIM( '.,! ' From '     #     Buna    .') as Result;
Go
--Returns Buna

-- 12.LIKE  - Is used in a WHERE clause to search for a specified pattern in a column:
Select * 
From Person.Person
Where FirstName Like 'a%';

-- 13.LEN - Returns the length of a string:
Select LEN('Alexandra');
Go
--Returns 9

-- 14.UPPER - Converts a string to upper-case:
Select UPPER('Alexandra are mere!');
Go
--Returns ALEXANDRA ARE MERE!

-- 15.LOWER - Converts a string to lower-case:
Select LOWER('Alexandra are MERE!');
Go 
--Returns alexandra are mere!

-- 16.CURRENT_TIMESTAMP - Returns the current database system timestamp as a datetime value:
Select CURRENT_TIMESTAMP;
GO
--Returns the date and the hour

-- 17.DATE - Returns an integer that represents the day of the specified date:
Select DAY('2023-11-18');  
Go
--Returns 18

-- 18.MONTH - Returns an integer that represents the month of the specified date:
Select MONTH('2023-11-18'); 
Go
--Returns 11

-- 19.YEAR - Returns an integer that represents the year of the specified date:
Select YEAR('2023-11-18');
Go
--Returns 2023

-- 20.REPLACE - Replaces all occurrences of a specified string value with another string value:
Select REPLACE('aaabbbaaabbb','aaa','ccc');  
Go
--Returns cccbbbcccbbb

-- 21.RIGHT - Returns the right part of a character string with the specified number of characters:
Select RIGHT('toamnapp',2);  
Go
--Returns pp



