use DemoDB
go
drop table if exists tblStudentClass;
go
drop table if exists tblStudent;
drop table if exists tblClass;
go
create table tblStudent(
       idstudent int primary key not null,
	   nume varchar(128) not null);
go
create table tblClass(
             idclass int primary key not null,
			 class varchar(128) not null);
go
create table tblStudentClass(
             idstudent int references tblStudent(idStudent) not null,
			 idclass int references tblClass(idclass) not null
			 primary key(idstudent,idclass)
			 );
go
insert into tblStudent(idstudent, nume) values (1, 'Ionel');
insert into tblStudent(idstudent, nume) values (2, 'Gigel');
insert into tblClass(idclass, class) values (1, 'Math');
insert into tblClass(idclass, class) values (2, 'English');
insert into tblClass(idclass, class) values (3, 'TIC');
insert into tblStudentClass(idstudent, idclass) values(1,1);
insert into tblStudentClass(idstudent, idclass) values(1,3);
insert into tblStudentClass(idstudent, idclass) values(2,2);
insert into tblStudentClass(idstudent, idclass) values(2,3);


