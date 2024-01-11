--1. From the following tables write a SQL query to find the salesperson and customer who reside 
--in the same city. Return Salesman, cust_name and city.

select
	s.name SalesmanName,
	c.cust_name CustomerName,
	c.city
from salesman s,customer c 
where c.city=s.city
order by s.name

--2. From the following tables write a SQL query to find those orders where the order amount 
--exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.
select
	o.ord_no OrderNumb,
	o.purch_amt PurchaseAmount,
	c.cust_name CustomerNAme,
	c.city CustomerCity
from customer c
join Orders o
	on o.customer_id=c.customer_id
where o.purch_amt between 500 and 2000

--3. From the following tables write a SQL query to find the salesperson(s) and the customer(s) he represents. 
--Return Customer Name, city, Salesman, commission.
select
	c.cust_name,
	c.city,s.name Salesman,
	s.comission
from salesman s
join customer c
	on c.salesman_id=s.salesman_id
order by s.name

--4. From the following tables write a SQL query to find salespeople who received commissions of more 
--than 12 percent from the company. Return Customer Name, customer city, Salesman, commission
select
	c.cust_name CustomerName, 
	c.city CustomerCity,
	s.name SalesmanName,
	s.comission
from salesman s
join customer c
	on c.salesman_id=s.salesman_id
where s.comission>0.12
order by s.name

--5. From the following tables write a SQL query to locate those salespeople who do not live in the same city 
--where their customers live and have received a commission of more than 12% from the company. 
--Return Customer Name, customer city, Salesman, salesman city, commission
select
	c.cust_name CustomerName,
	c.city CustomerCity,
	s.name SalesmanName,
	s.city SalesmanCity,s.comission
from salesman s
join customer c 
	on c.salesman_id=s.salesman_id
where c.city<>s.city and s.comission>0.12
order by s.name

--6. From the following tables write a SQL query to find the details of an order. Return ord_no, ord_date, 
--purch_amt, Customer Name, grade, Salesman, commission
select
	o.ord_no OrderNmb,
	ord_date OrderDate,
	o.purch_amt PurchaseAmount,
	c.cust_name CustomerName,
	c.grade,
	s.name SalesmanName,
	s.comission
from Orders o
join customer c 
	on c.customer_id=o.customer_id
join salesman s
	on s.salesman_id=c.salesman_id

--7. Write a SQL statement to join the tables salesman, customer and orders so that the same column of each 
--table appears once and only the relational rows are returned.
select
	o.ord_no OrderNmb,ord_date OrderDate,o.purch_amt PurchaseAmount,
	c.customer_id,c.cust_name CustomerName,c.grade,c.city CustomerCity,
	s.salesman_id,s.name SalesmanName,s.comission
from Orders o
join customer c 
	on c.customer_id=o.customer_id
join salesman s
	on s.salesman_id=c.salesman_id

--8. From the following tables write a SQL query to display the customer name, customer city, grade, 
--salesman, salesman city. The results should be sorted by ascending customer_id

select
	c.cust_name CustomerName,
	c.city CustomerCity,
	c.grade,
	s.name SalesmanName,
	s.city SalesmanCity
from customer c 
left join salesman s 
	on c.salesman_id=s.salesman_id
order by customer_id

--9. From the following tables write a SQL query to find those customers with a grade less than 300. 
--Return cust_name, customer city, grade, Salesman, salesmancity. The result should 
--be ordered by ascending customer_id. 
select
	c.cust_name CustomerName,
	c.city CustomerCity,
	c.grade,
	s.name SalesmanName,
	s.city SalesmanCity
from customer c 
left join salesman s 
	on c.salesman_id=s.salesman_id
where c.grade<300
order by customer_id

--10. Write a SQL statement to make a report with customer name, city, order number, order date, 
--and order amount in ascending order according to the order date to determine whether any of the existing 
--customers have placed an order or not.

select
	c.cust_name CustomerName,
	c.city CustomerCity,
	o.ord_no OrderNmb,
	o.ord_date OrderDate,
	o.purch_amt OrderAmount
from customer c
left join Orders o
	on o.customer_id=c.customer_id
order by OrderDate

--11.SQL statement to generate a report with customer name, city, order number, order date, order amount, 
--salesperson name, and commission to determine if any of the existing customers have not placed orders or 
--if they have placed orders through their salesman or by themselves.

select
	c.cust_name CustomerName,
	c.city CustomerCity,
	o.ord_no OrderNmb,
	o.ord_date OrderDate,
	o.purch_amt OrderAmount,
	s.name SalesmanName,
	s.comission
from customer c
left join Orders o
	on o.customer_id=c.customer_id
left join salesman s
	on c.salesman_id=s.salesman_id


--12. Write a SQL statement to generate a list in ascending order of salespersons who work either for 
--one or more customers or have not yet joined any of the customers

select
	s.name SalesmanName,
	c.cust_name CustomerName
from salesman s
left join customer c
	on c.salesman_id=s.salesman_id
order by s.salesman_id

--13. From the following tables write a SQL query to list all salespersons along with customer name, 
--city, grade, order number, date, and amount.
select
	s.name SalesmanName,
	c.cust_name CustomerName,
	c.city CustomerCity,
	c.grade,
	o.ord_no OrderNumb,
	o.ord_date OrderDate,
	o.purch_amt Amount
from salesman s
left join customer c
	on c.salesman_id=s.salesman_id
left join Orders o
	on c.customer_id=o.customer_id

--14. Write a SQL statement to make a list for the salesmen who either work for one or more customers 
--or yet to join any of the customer. The customer may have placed, either one or more orders on or above 
--order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier.
select
	s.name SalesmanName,
	c.cust_name CustomerName,
	c.city CustomerCity,
	c.grade,
	o.ord_no OrderNumb,
	o.ord_date OrderDate,
	o.purch_amt Amount
from salesman s
left join customer c
	on c.salesman_id=s.salesman_id
left join Orders o
	on c.customer_id=o.customer_id
where o.purch_amt>=2000 and c.grade is not null

--15.For those customers from the existing list who put one or more orders, or which orders have been 
--placed by the customer who is not on the list, create a report containing the customer name, 
--city, order number, order date, and purchase amount

select
	c.cust_name CustomerName,
	C.city CustomerCity,
	o.ord_no OrderNumb,
	o.ord_date OrderDate,
	o.purch_amt PurchaseAmount
from Orders o
left join customer c
	on c.customer_id=o.customer_id

--16. Write a SQL statement to generate a report with the customer name, city, order no. order date, 
--purchase amount for only those customers on the list who must have a grade and placed one or 
--more orders or which order(s) have been placed by the customer who neither is on the list nor has a grade.
select
	c.cust_name CustomerName,
	C.city CustomerCity,
	o.ord_no OrderNumb,
	o.ord_date OrderDate,
	o.purch_amt PurchaseAmount
from Orders o
full join customer c
	on c.customer_id=o.customer_id
where c.grade is not null

--17. Write a SQL query to combine each row of the salesman table with each row of the customer table.
select
*
from salesman s
cross join customer c

--18.Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each 
--salesperson will appear for all customers and vice versa for that salesperson who belongs to that city
select
*
from salesman s
cross join customer c
where s.city=c.city

--19.Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each 
--salesperson will appear for every customer and vice versa for those salesmen who belong to a city and 
--customers who require a grade
select
*
from salesman s
cross join customer c
where s.city is not null and c.grade is not null

--20.Write a SQL statement to make a Cartesian product between salesman and customer i.e. each salesman 
--will appear for all customers and vice versa for those salesmen who must belong to a city which is not 
--the same as his customer and the customers should have their own grade.
select
*
from salesman s
cross join customer c
where s.city<>c.city and c.grade is not null
