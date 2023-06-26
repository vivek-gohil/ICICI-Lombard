create table Client_master
(
	client_no varchar(6)constraint primarykeClient primary key, constraint checkClientNo check (client_no like 'C%'),
	name varchar(20) not null,
	address1 varchar(30),
	address2 varchar(30),
	city varchar(15),
	state varchar(15),
	pincode numeric(6),
	bal_due money
)
select * from Client_master
drop table Client_master
===============================================================
create table product_master
(
	product_no varchar(6) constraint primarykeyProduct primary key, constraint checkProductNo check (product_no like 'P%'),
	description varchar(50) not null,
	profit_percent numeric(3,2)not null,
	unit_measure varchar(10)not null,
	qty_on_hand numeric(8)not null,
	recorder_lvl numeric(8)not null,
	sell_price numeric (8,2)not null constraint sellPrice check (sell_price>0),
	cost_price numeric (8,2)not null constraint costPrice check (cost_price>0)
)
select * from product_master
drop table product_master
===============================================
create table salesman_master
(
	salesman_no varchar(6) constraint primarykeySalesman primary key, constraint checkSalesmanNo check (salesman_no like 'S%'),
	salesman_name varchar(20) not null,
	Address1 varchar(30) not null,
	Address2 varchar(30),
	city varchar(20),
	pincode varchar(6),
	state varchar(20),
	sal_amt numeric (8,2) not null constraint salAmount check (sal_amt >0),
	tgt_to_get numeric (6,2)not null constraint targetAmount check (tgt_to_get >0),
	ytd_sales numeric (6,2) not null,
	remarks varchar(60)
)
select * from salesman_master
drop table salesman_master
=====================================================
create table sales_order
(
	s_order_no varchar(6) constraint primarykeyOrder primary key, constraint checkOrderNo check (s_order_no like 'O%'),
	s_order_date datetime,
	client_no varchar(6)constraint foreignKeyClient foreign key references Client_master(client_no),
	dely_Addr varchar(25),
	salesman_no varchar(6) constraint foreignKeySalesman foreign key references salesman_master(salesman_no),
	dely_type char(1) constraint checkdelyType check(dely_type in ('P','F'))constraint defalutdelyType default 'F',
	bill_Yn char(1) constraint checkBillYN check (bill_Yn in ('Y','N')),
	dely_date datetime,
	order_status varchar(10)
)

drop table sales_order
select * from sales_order
=================================================================
create table sales_order_details
(
	s_order_no varchar(6) constraint foreignkeySalesOrder foreign key references sales_order(s_order_no),
	product_no varchar(6)constraint foreignkeyProduct foreign key references product_master(product_no),
	qty_ordered numeric (8),
	qty_disp numeric(8),
	product_rate numeric(10,2),
	constraint pmk primary key (s_order_no,product_no)
)
select * from sales_order_details
drop table sales_order_details
================================================================
create table Challan_header
(
	challan_no varchar(6) constraint primarykeyChallanNo primary key, constraint checkChallanNo check(challan_no like 'CH%'),
	s_order_no varchar(6) constraint foreignkeySalesOrderChallan foreign key references sales_order(s_order_no),
	challan_date datetime not null,
	billed_yn char(1) constraint defaultBilled default 'N', constraint checkBilled check(billed_yn in ('Y','N'))
)
select * from Challan_header
drop table Challan_header
==========================================
create table Challan_details
(
	challan_no varchar(6) constraint foreignkeyChallanHead foreign key references Challan_header(challan_no),
	product_no varchar(6)constraint foreignkeyProductChallan foreign key references product_master(product_no),
	qty_disp numeric(4,2) not null
)
select * from Challan_details
drop table Challan_details
================================================================================
insert into client_master(client_no,name,city,pincode,state,bal_due)values('C00001','Ivan Bayross','Bombay',400054,'Maharashtra',15000)
insert into client_master(client_no,name,city,pincode,state,bal_due)values('C00002','Vandana Sitwal','Madras',780001,'Tamil Nadu',0)
insert into client_master(client_no,name,city,pincode,state,bal_due)values('C00003','Pramada Jaguste','Bombay',400057,'Maharashtra',5000)
insert into client_master(client_no,name,city,pincode,state,bal_due)values('C00004','Sachin Chitale','Bombay',400056,'Maharashtra',0)
insert into client_master(client_no,name,city,pincode,bal_due) values('C00005','Ravi Sharma','Delhi',100001,2000)
insert into client_master(client_no,name,city,pincode,state,bal_due)values('C00006','Rukmini','Bombay',400050,'Maharashtra',0)

select * from client_master
==================================================================================
insert into product_master values('P00001','1.44 Floppies',5,'Piece',100,20,525,500)
insert into product_master values('P03453','Monitors',6,'Piece',10,3,12000,11280)
insert into product_master values('P06734','Mouse',5,'Piece',20,50,1050,1000)
insert into product_master values('P07865','1.22 Floppies',5,'Piece',100,20,525,500)
insert into product_master values('P07868','Keyboards',2,'Piece',10,3,3150,3050)
insert into product_master values('P07885','CD Drive',2.5,'Piece',10,3,5250,5100)
insert into product_master values('P07965','540 HDD',4,'Piece',10,3,8400,8000)
insert into product_master values('P07975','1.44 Drive',5,'Piece',10,3,1050,1000)
insert into product_master values('P08865','1.22 Drive',5,'Piece',2,3,1050,1000)

select * from product_master
=============================================================================
insert into salesman_master values('S00001','Kiran','A/14','Worli','Bombay',400002,'MAH',3000,100,50,'Good')
insert into salesman_master values('S00002','Manish','65','Nariman','Bombay',400001,'MAH',3000,200,100,'Good')
insert into salesman_master values('S00003','Ravi','P-7','Bandra','Bombay',400032,'MAH',3000,200,100,'Good')
insert into salesman_master values('S00004','Ashish','A/5','Juhu','Bombay',400044,'MAH',3500,200,150,'Good')

select * from salesman_master
=============================================================================
insert into sales_order(s_order_no,s_order_date,client_no,dely_type,bill_Yn,salesman_no,dely_date,order_status)
values('O19001','01/12/1996','C00001','F','N','S00001','01/20/1996','IP')

insert into sales_order(s_order_no,s_order_date,client_no,dely_type,bill_Yn,salesman_no,dely_date,order_status)
values('O19002','01/25/1996','C00002','P','N','S00002','01/27/1996','C')

insert into sales_order(s_order_no,s_order_date,client_no,dely_type,bill_Yn,salesman_no,dely_date,order_status)
values('O46865','02/18/1996','C00003','F','Y','S00003','02/20/1996','F')

insert into sales_order(s_order_no,s_order_date,client_no,dely_type,bill_Yn,salesman_no,dely_date,order_status)
values('O19003','04/03/1996','C00001','F','Y','S00001','04/07/1996','F')

insert into sales_order(s_order_no,s_order_date,client_no,dely_type,bill_Yn,salesman_no,dely_date,order_status)
values('O46866','05/20/1996','C00004','P','N','S00002','05/22/1996','C')

insert into sales_order(s_order_no,s_order_date,client_no,dely_type,bill_Yn,salesman_no,dely_date,order_status)
values('O10008','05/24/1996','C00005','F','N','S00004','05/26/1996','IP')

select * from sales_order

=========================================================================
insert into sales_order_details values('O19001','P00001',4,4,525)
insert into sales_order_details values('O19001','P07965',2,1,8400)
insert into sales_order_details values('O19001','P07885',2,1,5250)
insert into sales_order_details values('O19002','P00001',10,0,525)
insert into sales_order_details values('O46865','P07868',3,3,3150)
insert into sales_order_details values('O46865','P07885',3,1,5250)
insert into sales_order_details values('O46865','P00001',10,10,525)
insert into sales_order_details values('O46865','P03453',4,4,1050)
insert into sales_order_details values('O19003','P03453',2,2,1050)
insert into sales_order_details values('O19003','P06734',1,1,12000)
insert into sales_order_details values('O46866','P07965',1,0,8400)
insert into sales_order_details values('O46866','P07975',1,0,1050)
insert into sales_order_details values('O19008','P00001',10,5,525)
insert into sales_order_details values('O19008','P07975',5,3,1050)
==============================================================================
insert into challan_header values('CH9001','O19001','12/12/1995','Y')
insert into challan_header values('CH6865','O46865','11/12/1995','Y')
insert into challan_header values('CH3965','O10008','10/12/1995','Y')

select * from challan_header
=============================================================================
insert into challan_details values('CH9001','P00001',4)
insert into challan_details values('CH9001','P07965',1)
insert into challan_details values('CH9001','P07885',1)
insert into challan_details values('CH6865','P07868',3)
insert into challan_details values('CH6865','P03453',4)
insert into challan_details values('CH6865','P00001',10)
insert into challan_details values('CH3965','P00001',5)
insert into challan_details values('CH3965','P07975',2)

select * from challan_details

===================================Query=========================
select * from Client_master
select * from product_master
select * from salesman_master
select * from sales_order
select * from sales_order_details
select * from Challan_header
select * from Challan_details
==================================================================
