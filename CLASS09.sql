-- CTE
-- Common Table Expression -- temporary named result set
with CTE as (select * from emp)
select * from CTE

with CTE01 (Empno,Ename,Sal) as (select Empno,Ename,Sal from emp)
select * from CTE01

with CTE02 as (select *,Dense_Rank() over(order by sal desc) as Ranking01 from emp)
select * from CTE02 where Ranking01=5

with CTE02 As (select *,Dense_Rank() Over(order by sal asc) as Ranking02 from emp)
select * from CTE02 where Ranking02=2

select avg(age) from (select PNAME,GENDER ,DOB, DATEDIFF(year,DOB, GETDATE()) as 'age'  from PROGRAMMER$ where GENDER='F')
 as T1

 with CTE as (select Ename,JOB, DATEDIFF(year,Hiredate, GETDATE()) as 'age'  from EMP where Deptno=10)
 select avg(age) from CTE

(select PNAME,GENDER ,DOB, DATEDIFF(year,DOB, GETDATE()) as 'age'  from PROGRAMMER$ where GENDER='F')
-- Merge Queries

-- Prepare DWH table as Below line 
select * into DWH_2 from (select * from emp where deptno=10) as T1
-- Merge statement is very popular clause that can hadle insert, update , delete all in a single trans
-- without having to write seperate logic.

Merge DWH_Table as target 
using EMP as Source
on target.empno=source.empno 
when matched then 
	update set target.ename=source.ename,target.Sal=source.sal
when Not Matched By Target then 
	Insert (Ename,Empno,Sal,Deptno) values (source.Ename,Source.Empno,Source.Sal,Source.Deptno)
when Not Matched By Source
	then Delete
Output $action,
deleted.*,
inserted.*;

delete from DWH_TABLE where deptno in (20,30)

merge DWH_2 as Targetusing emp as Sourceon Target.empno=Source.empnowhen matched then 	update set Target.ename = Source.ename ,Target.sal= Source.salwhen not matched by Target then	insert(ename,empno,sal,deptno) values(Source.ename,Source.empno,Source.sal,Source.deptno)when not matched by Source then	deleteoutput $action,deleted.*,inserted.*;

-- TCL

-- Commit, Rollback, Savepoint

select * from DWH_TABLE
update DWH_TABLE set HIREDATE='01-Jan-2023' where hiredate is null

-- Example 001
Begin Transaction

update DWH_TABLE set MGR=9999 where MGr is null

rollback transaction

select * from DWH_TABLE

--Example 002
Begin Transaction

update DWH_TABLE set MGR=9999 where MGr is null
insert into DWH_TABLE (EMPNO,ENAME,Sal) values (8888,'TEST',20000)

Rollback TRansaction

--Example 003
Begin Transaction

update DWH_TABLE set MGR=9999 where MGr is null
insert into DWH_TABLE (EMPNO,ENAME,Sal) values (8888,'TEST',20000)

select * from DWH_TABLE

Commit Transaction

--Example 004
Begin Transaction

save transaction PointA
update DWH_TABLE set MGR=9999 where MGr is null

save transaction PointB
insert into DWH_TABLE (EMPNO,ENAME,Sal) values (8888,'TEST',20000)

save transaction PointC

select * from DWH_TABLE

rollback transaction pointB

commit transaction

-- Example 005

select * from DWH_TABLE

Begin Transaction

save transaction STARTINGPOINT

insert into DWH_TABLE (EMPNO,ENAME,Sal) values (1234,'INSERTED',20000)

SAVE transaction AFTERINSERT

update DWH_TABLE set deptno=20 where empno=1234

SAVE transaction AFTERUPDATE

rollback transaction AFTERINSERT

rollback transaction STARTINGPOINT

commit transaction

-- Programming SP, Functions, Loops, Conditions, UDF...

create procedure PROC_01 as 
select * from EMP

exec PROC_01

create procedure proc_02 (@DP AS INT)
AS
SELECT * FROM EMP WHERE DEPTNO=@DP

EXEC PROC_02 30