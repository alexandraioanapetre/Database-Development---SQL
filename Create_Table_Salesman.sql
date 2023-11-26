Use DemoDB
Go
Create Table Salesman(
       Salesmanid int primary key not null,
       Name varchar(128) not null,
       City varchar(128) not null,
       Commission decimal not null,
);
Insert into Salesman (Salesmanid, Name, City, Commission) values (5001, 'James Hoog', 'New York', 0.15);
Insert into Salesman (Salesmanid, Name, City, Commission) values (5002, 'Nail Knite', 'Paris', 0.13);
Insert into Salesman (Salesmanid, Name, City, Commission) values (5005, 'Pit Alex', 'London', 0.11);
Insert into Salesman (Salesmanid, Name, City, Commission) values (5006, 'Mc Lyon', 'Paris', 0.14);
Insert into Salesman (Salesmanid, Name, City, Commission) values (5007, 'Paul Adam', 'Rome', 0.13);
Insert into Salesman (Salesmanid, Name, City, Commission) values (5003, 'Lauson Hen', 'San Jose', 0.12);