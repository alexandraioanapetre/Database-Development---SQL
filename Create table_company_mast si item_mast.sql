drop table if exists company_mast;
go

create table company_mast(
	com_id int primary key not null,
	com_name varchar(128) not null);
	
insert into company_mast(com_id, com_name) values (11, 'Samsung');
insert into company_mast(com_id, com_name) values (12, 'iBall');
insert into company_mast(com_id, com_name) values (13, 'Epsion');
insert into company_mast(com_id, com_name) values (14, 'Zebronics');
insert into company_mast(com_id, com_name) values (15, 'Asus');
insert into company_mast(com_id, com_name) values (16, 'Frontech');

drop table if exists item_mast;
go

create table item_mast(
	pro_id int primary key not null,
	pro_name varchar(128) not null,
	pro_price decimal(10,2) not null,
	pro_com int references company_mast(com_id) not null);

	insert into item_mast(pro_id, pro_name,pro_price,pro_com) values (101, 'Mother Board',3200.00,15);
	insert into item_mast(pro_id, pro_name,pro_price,pro_com) values (102, 'Key Board',450.00,16);
	insert into item_mast(pro_id, pro_name,pro_price,pro_com) values (103, 'ZIP drive',250.00,14);
	insert into item_mast(pro_id, pro_name,pro_price,pro_com) values (104, 'Speaker',550.00,16);
	insert into item_mast(pro_id, pro_name,pro_price,pro_com) values (105, 'Monitor',5000.00,11);
	insert into item_mast(pro_id, pro_name,pro_price,pro_com) values (106, 'DVD drive',900.00,12);
	insert into item_mast(pro_id, pro_name,pro_price,pro_com) values (107, 'CD drive',800.00,12);
	insert into item_mast(pro_id, pro_name,pro_price,pro_com) values (108, 'Printer',2600.00,13);
	insert into item_mast(pro_id, pro_name,pro_price,pro_com) values (109, 'Refill cartridge',350.00,13);
	insert into item_mast(pro_id, pro_name,pro_price,pro_com) values (110, 'Mouse',250.00,12);
	
