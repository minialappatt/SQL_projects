-- RowNumber
-- Temporary Tables
-- Normalization

select RoW_number() over(order by Empno desc) as Idno ,* from emp

select Row_number() over(partition by deptno order by empno) as Idno,* from emp

-- Temporary Tables

-- #Local Temporary Tables
-- ##Global Temporary Tables
select * into #temp1 from (select * from emp where DEPTNO=10) as T1

select * from #temp1

with CTE as
(select * from emp)
select * from CTE

select * from CTE

create table #temp02 (idno int, Ename varchar(20))

insert into #temp02 values (1101,'ABCD')

select * from #temp02

create table ##temp03 (idno int, Ename varchar(20))

insert into ##temp03 values (1101,'ABCD')

-- Break 

create or alter procedure LOOPS_111
As
Begin
	declare @x int =1
	declare @y int =10
	while @x <=@y
	Begin
		print @x
		set @x=@x+1
		if @x=5
			break
	End
End

exec LOOPS_111

create or alter procedure LOOPS_222
As
Begin
	declare @x int =1
	declare @y int =10
	while @x <=@y
	Begin		
		set @x=@x+1
		if @x=5
			continue
		print @x
	End
End

exec LOOPS_222

-- Update Join

select * from emp

select * into EMP_00001 from (select Empno from emp) as T1

select * from EMP_00001

alter table emp_00001 add sal numeric(10)

update A
set A.sal=B.sal
From EMP_00001 A inner join EMP B on A.EMPNO=B.EMPNO

create table TESTA (Idno int, Enam varchar(30), Sal int)

select * from TESTA

insert into TESTA (Idno) values (7499),(7521),(7566),(7654)

update A
set A.Enam=E.ename, A.sal=E.SAL
From TESTA A inner join emp E on A.Idno=E.EMPNO

create function dbo.EXAM_111(@x1 int)  returns table  As  Return (select E.*,D.Dname,D.loc from emp e inner join dept d on e.deptno=d.DEPTNO where e.deptno=@x1)
select * from dbo.EXAM_111(10)

with FIRSTCTE
as (select * from emp)
, SECONDCTE
as (select B.*,D.DNAME,D.Loc from Dept D inner join FIRSTCTE B on D.DEPTNO=B.deptno where B.deptno=10)
select * from SECONDCTE

with NoFemaleprogrammer AS (Select PNAME  from PROGRAMMER$ where GENDER ='F' and SALARY >(select max (salary) from PROGRAMMER$ where GENDER ='M')) ,No_Packages AS (select * from SOFTWARE$ where Pname = NoFemaleprogrammer.pname)select * from SOFTWARE$ where Pname =(Select PNAME  from PROGRAMMER$ where GENDER ='F' and SALARY >									(select max (salary) from PROGRAMMER$ where GENDER ='M')) with FIRSTCTE (Ename,Sal,Deptno)
as (select Ename,Sal,DEPTNO from emp)
, SECONDCTE
as (select B.*,D.DNAME,D.Loc from Dept D where FIRSTCTE.deptno=10)
select * from SECONDCTE
select count(pname) from No_Packages

-- Print column without header
select * into #Temp1 from (select ROW_NUMBER() over(order by empno) as RowNumber, * from emp) as T1

select * from #temp1
create or alter procedure LOOPS_222
As
Begin
	declare @x int =1
	declare @y int =10
	declare @z int
	while @x <=@y
	Begin		
		select @z=Empno from #temp1 where rowNumber=@x
		print @z
		set @x=@x+1
	End
End

select max (sal), Max(Comm) from emp

exec LOOPS_222
