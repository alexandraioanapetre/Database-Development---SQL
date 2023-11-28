drop table if exists salesman;
drop table if exists customer;
go
create table salesman(
	salesman_id int primary key not null,
	name varchar (128) not null,
	city varchar (100) not null,
	comission decimal (3,2) not null);
go
create table customer(
	customer_id int primary key not null,
	cust_name varchar (100) not null,
	city varchar (100) not null,
	grade int null,
	salesman_id int references salesman(salesman_id) not null);
go
insert into salesman(salesman_id,name, city, comission) values (5001, 'James Hoog', 'New York', 0.15);
insert into salesman(salesman_id,name, city, comission) values (5002, 'Nail Knite', 'Paris', 0.13);
insert into salesman(salesman_id,name, city, comission) values (5005, 'Pit Alex', 'London', 0.11);
insert into salesman(salesman_id,name, city, comission) values (5006, 'Mc Lyon ', 'Paris', 0.14);
insert into salesman(salesman_id,name, city, comission) values (5007, 'Paul Adam', 'Rome', 0.13);
insert into salesman(salesman_id,name, city, comission) values (5003, 'Lauson Hen', 'San Jose', 0.12);
go
insert into customer(customer_id, cust_name, city, grade, salesman_id) values (3002, 'Nick Rimando', 'New York', 100, 5001);
insert into customer(customer_id, cust_name, city, grade, salesman_id) values (3007, 'Brad Davis', 'New York', 200, 5001);
insert into customer(customer_id, cust_name, city, grade, salesman_id) values (3005, 'Graham Zusi', 'California', 200, 5002);
insert into customer(customer_id, cust_name, city, grade, salesman_id) values (3008, 'Julian Green', 'London', 300, 5002);
insert into customer(customer_id, cust_name, city, grade, salesman_id) values (3004, 'Fabian Johnson', 'Paris', 300, 5006);
insert into customer(customer_id, cust_name, city, grade, salesman_id) values (3009, 'Geoff Cameron', 'Berlin', 100, 5003);
insert into customer(customer_id, cust_name, city, grade, salesman_id) values (3003, 'Jozy Altidor', 'Moscow', 200, 5007);
insert into customer(customer_id, cust_name, city, grade, salesman_id) values (3001, 'Brad Guzan','London', null, 5005);
go




