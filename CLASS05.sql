-- DDL Commands
-- Create,  Alter,  DROP , Truncate
-- DML
-- Insert,  Delete, Update
create table SAMPLE_01 (
Ename varchar(50),
Sal numeric(10)
)

create table SAMPLE_02(
Eid char(5),
Ename varchar(60),
Sal numeric(10,2)
)

-- Alter
ALter table SAMPLE_02 Add Email varchar(100)

Alter table SAMPLE_02 Add Contactno numeric(10),Address varchar(100)

Alter table SAMPLE_02 Drop column Contactno

Alter table SAMPLE_02 Alter column Ename varchar(100)

Alter table SAMPLE_02 Alter column Eid int

-- nchar & nvarchar -- unicode characters & Non Unicode Chars
-- nchar & nvarchar -- twice as much storage space
-- char and varchar -- cannot store unicode characters

create table SAMPLE_03(
C1 varchar(20),
C2 Nvarchar(20) 
)

insert into SAMPLE_03 values ('견본',N'견본')

select * from SAMPLE_03

-- DML Commands

insert into SAMPLE_01  values ('ABCD',10000)

insert into SAMPLE_01(Ename) values('EFGH')

insert into SAMPLE_01(Sal) values(20000)

insert into SAMPLE_01 values ('EFGH',30000),('PQRS',40000),('XYZ',50000)

select * from SAMPLE_01
select * from SAMPLE_02

insert into sample_02 values (1101,'ABCD',10000,'abcd@gmail.com','Bangalore')

create table EMP_01 (Eid int, Ename varchar(40))

select * from EMP_01

insert into emp_01 select Empno,Ename from EMP

create table EMP_02 (Eid int, Ename varchar(40))

-- Copy only Deptno 10 & 20 Records from Emp to Emp_02

insert into EMP_01 select Empno,Ename from EMP where deptno in (10,20)

-- Delete

delete from EMP_01

delete from emp_01 where ename like 'SCOTT'

delete from emp_01 where ename in ('SCOTT','SMITH')

-- Truncate

truncate table emp_01

select * from emp_01

-- Delete vs Truncate
-- Delete 
-- Removes 1 or more rows from a tables based on the conditions
-- DML
-- makes a record of each and evry transaction in the log file

-- Truncate
-- All the rows will be removed.
-- DDL
-- it removed all the information in 1 go.

drop table EMP_01

select * from emp

