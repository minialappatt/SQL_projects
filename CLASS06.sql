-- constraints

-- Unique
-- Not Null
-- Primary Key
-- Default
-- Check
-- Foreign Key  

create table SAMPLE_04(
EID int,
Ename varchar(30),
Sal int,
Loc varchar(30))

insert into SAMPLE_04 values (1102,'ABCD',10000,'Bangalore')

select * from SAMPLE_04

-- Unique

alter table Sample_04 add constraint SAMPLE04_EID_UNIQUE unique (eid)

insert into SAMPLE_04 values (Null,'ABCD',10000,'Bangalore')

sp_help sample_04

-- Check

select * from sample_04 

alter table sample_04 add constraint SAMPLE_04_SAL_CHECK check (sal>=10000)

insert into SAMPLE_04 values (1104,'ABCD',11000,'Bangalore')

select * from SAMPLE_01

alter table sample_01 add constraint SAMPLE_01_SAL_CHECK check (sal>=30000)

-- Not Null

select * from SAMPLE_04

insert into SAMPLE_04 values (1106,Null,11000,'Bangalore')

delete from SAMPLE_04 where ename is null

alter table sample_04 Alter column ename varchar(50)

alter table sample_04 alter column ename varchar(40) not null

alter table sample_04 alter column ename varchar(40) null

sp_help sample_04

-- Primary Key 

create table SAMPLE_06 (
Eid int,
Ename varchar(40),
Sal int,
constraint CONS_PK_SAMPLE06_EID primary key (Eid))

insert into SAMPLE_06 values (1102,'TEST02',11000)

create table SAMPLE_07 (
Eid int,
Ename varchar(40),
Sal int,
constraint CONS_PK_SAMPLE07_EID primary key (Eid),
constraint CONS_CHK_SAMPLE07_SAL Check (sal>=10000))

sp_help Sample_07

-- Default 
create table SAMPLE_08(
Eid Int,
Ename varchar(40),
loc varchar(30) default 'BANGALORE'
)

insert into SAMPLE_08(Eid,Ename) values (1101,'ABCD')

select * from SAMPLE_08

insert into SAMPLE_08 values (1101,'ABCD','Mysore')

-- Foreign Key 

create table PRIMEMEMBERS(idno int primary key , Name varchar(30))

insert into PRIMEMEMBERS values (1101,'ABCD'),(1102,'eFGH'),(1103,'PQRS')

insert into PRIMEMEMBERS values (1101,'ABCD')

sp_help PRIMEMEMBERS

select * from PRIMEMEMBERS

create table RENTEDMOVIES(
idno int , 
MName varchar(30),
constraint FK_PRIM foreign key (idno) references PRIMEMEMBERS(idno))

insert into RENTEDMOVIES values (1101,'ABCD'),(1102,'eFGH'),(1101,'PQRS')

insert into RENTEDMOVIES values (1105,'TEST')

-- Composite Key

create table Orders (
CustomerID int,
orderid    int,
Amount     int,
constraint PK_ORDERS_CUSTOMER_ORDER primary key (customerid,orderid)
)

insert into Orders values (1101,2201,100),(1101,2202,100),(1102,2201,100)

-- Primary Key

create table Orders_01 (
CustomerID int not null,
Amount     int
)

Alter table orders_01 add constraint PK_CUSTOMERID_Order01 Primary Key (customerid)


sp_help orders

