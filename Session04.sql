drop table if exists City;
go
drop table if exists Country;
go
create table Country(
CountryId int primary key not null,
CountryName varchar(128) not null);
go
create table City(
CityId int primary key not null,
CityName varchar(128) not null,
CountryId int references Country(CountryId) null);
go
insert into Country(CountryId, CountryName) values(1,'Romania');
insert into Country(CountryId, CountryName) values(2,'Bulgaria');
insert into Country(CountryId, CountryName) values(3,'Grecia');

insert into City(CityId,CityName,CountryId) values(1,'Cluj Napoca',1);
insert into City(CityId,CityName,CountryId) values(2,'Bucuresti',1);
insert into City(CityId,CityName,CountryId) values(3,'Sofia',2);
insert into City(CityId,CityName,CountryId) values(4,'Zion',null);

--Sa se faca un join intre cele doua tabele si sa se afiseze toate coloanele:
Select *
From City c
Join Country co on c.CountryId = co.CountryId

Select *
From City c
Right Join Country co on c.CountryId = co.CountryId

Select *
From City c
Left Join Country co on c.CountryId = co.CountryId

--Inner Join (Join)

--Left Outer Join (Left Join)
--Right Outer Join (Right Join)
--Full Outer Join (Full Join)

--Sa se modice interogarea astfel incat sa fie afisate doar orasele fara corespondenta:
Select *
From City c
Left Join Country co on c.CountryId = co.CountryId
Where co.CountryId is null;

Select *
From City c
cross join Country co
