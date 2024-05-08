-- Math Functions
select * from emP

select profit,
abs(profit) as ABS,
round(profit,2) as Round,
CEILING(profit) as ceiling,
Floor(profit) as Floor
from SalesOrder$

select exp(1),PI()

-- Conversion
-- CAST, CONVERT, PARSE
select 
Ename + Job,
Ename + cast(Sal as varchar(10)),
Ename + cast(HIREDATE as varchar(15))
from emp

select 
Ename + Job,
Ename + convert(varchar(10), sal),
Ename + convert(varchar(15),Hiredate),
convert(datetime,Convert(varchar(15),hiredate,100),101),
Convert(varchar(15),hiredate,101),
Convert(varchar(15),hiredate,102)
From emp

-- 131

-- Parse String Values into Numeric and Date/time
select PARSE(casT(sal as varchar(10)) as int),
parse(Convert(varchar(15),hiredate,100) as datetime) from EMP

select parse('1859' as int)

-- 

select Ename,
TRY_CAST(Ename as int),
TRY_Convert(int,Ename)
From emp

select Ename,
Cast(Ename as int)
from EMP

-- Sub Queries

select * from emp where deptno=(select deptno from emp where ename ='SMITH')

select * from emp where job =(select job from emp where ename ='SMITH')

select * from emp where sal=(select max(sal) from emp)

select * from emp where sal=(select min(sal) from emp)

-- get list of all people whose sal > avg(sal)
-- get list of all people whose deptno is same as 'Miller','scott'
-- get list of all people whose job is same as 'SMITH','TURNER'

select * from emp where sal >(select avg(sal) from emp)

select * from emp where deptno in (select deptno from emp where ename in ('MILLER','SCOTT'))

select * from emp where sal in (select max(sal) from emp group by Job)

-- Triggers

create Trigger TRIG_EMP_DEL on emp for DELETE
As
Begin
	print 'No Delete operations cannot be performed'
	rollback transaction
end

delete from emp where deptno=10

create Trigger TRIG_EMP_INSUPD on emp for INSERT,UPDATE
As
Begin
	print 'No INSERT/DELETE operations cannot be performed'
	rollback transaction
end

drop trigger TRIG_EMP_DEL
insert into emp(EMPNO,Ename) values(1111,'ABCD')

create table EMP_Audit (Empno int, Ename varchar(50),Action_Message varchar(30))

create Trigger TRIG_EMP_INSERT on emp for INSERT
As
Begin
	insert into emp_Audit select empno,Ename,'Inserted' from Inserted
end

create Trigger TRIG_EMP_DELETE on emp for DELETE
As
Begin
	insert into emp_Audit select empno,Ename,'Deleted' from deleted
end

create Trigger TRIG_EMP_UPDATE on emp for UPDATE
As
Begin
	insert into emp_Audit select empno,Ename,'Deleted' from deleted
	insert into emp_Audit select empno,Ename,'Updated' from INSERTED
end

delete from emp where empno=7369

update emp set ename ='TEST' where empno=7499

select * from EMP_Audit

-- Views

create view VW_SAMPLE_001 as select * from emp

select * from VW_SAMPLE_001

create view VW_Sample_002 as 
select E.*,D.Dname,D.LOC From emp E inner join Dept D on E.Deptno=D.Deptno

select * From VW_Sample_002

select Ename,Sal from VW_Sample_002

drop view VW_Sample_002

-- Index

-- Unique -- Automatically Index is created
-- Primary Key -- Automatically Index is created
sp_help sample_06

select * from emp

create index Indx_Deptno_Emp on Emp(deptno)

drop index Indx_Deptno_Emp on emp

sp_help emp

create or alter procedure Proc_0001 
as
select * from emp