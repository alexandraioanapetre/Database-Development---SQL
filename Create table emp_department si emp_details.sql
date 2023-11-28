drop table if exists emp_department;
go

create table emp_department(
    dpt_code int primary key not null,
    dpt_name varchar(255) not null,
    dpt_allotment int
);

insert into emp_department(dpt_code, dpt_name, dpt_allotment) values (57, 'IT', 65000);
insert into emp_department(dpt_code, dpt_name, dpt_allotment) values (63, 'Finance', 15000);
insert into emp_department(dpt_code, dpt_name, dpt_allotment) values (47, 'HR', 240000);
insert into emp_department(dpt_code, dpt_name, dpt_allotment) values (27, 'RD', 55000);
insert into emp_department(dpt_code, dpt_name, dpt_allotment) values (89, 'QC', 75000);

drop table if exists emp_details
go

create table emp_details(
    emp_idno int primary key not null,
    emp_fname varchar(255) not null,
    emp_lname varchar(255) not null,
    emp_dept int,
    emp_int int references emp_department(dpt_code)
);

insert into emp_details(emp_idno, emp_fname, emp_lname, emp_dept) values (127323, 'Michale', 'Robbin', 57);
insert into emp_details(emp_idno, emp_fname, emp_lname, emp_dept) values (526689, 'Carlos', 'Snares', 63);
insert into emp_details(emp_idno, emp_fname, emp_lname, emp_dept) values (843795, 'Enric', 'Dosio', 57);
insert into emp_details(emp_idno, emp_fname, emp_lname, emp_dept) values (328717, 'John', 'Snares', 63);
insert into emp_details(emp_idno, emp_fname, emp_lname, emp_dept) values (444527, 'Joseph', 'Dosni', 47);
insert into emp_details(emp_idno, emp_fname, emp_lname, emp_dept) values (659831, 'Zanifer', 'Emily', 47);
insert into emp_details(emp_idno, emp_fname, emp_lname, emp_dept) values (847674, 'Kuleswar', 'Sitaraman', 57);
insert into emp_details(emp_idno, emp_fname, emp_lname, emp_dept) values (748681, 'Henrey', 'Gabriel', 47);
insert into emp_details(emp_idno, emp_fname, emp_lname, emp_dept) values (555935, 'Alex', 'Manuel', 57);
insert into emp_details(emp_idno, emp_fname, emp_lname, emp_dept) values (539569, 'George', 'Mardy', 27);
insert into emp_details(emp_idno, emp_fname, emp_lname, emp_dept) values (733843, 'Mario', 'Saule', 63);
insert into emp_details(emp_idno, emp_fname, emp_lname, emp_dept) values (631548, 'Alan', 'Snappy', 27);
insert into emp_details(emp_idno, emp_fname, emp_lname, emp_dept) values (839139, 'Maria', 'Foster', 57);