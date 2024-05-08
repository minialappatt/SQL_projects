-- Loops
create or alter procedure LOOPS_01
As
Begin
	declare @x int =1
	declare @y int =10
	while @x <=@y
	Begin
		print @x
		set @x=@x+1
	End
End

exec LOOPS_01

create or alter procedure LOOPS_02
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

exec LOOPS_02

-- Function 

-- A Function Must Return Values whereas Procedure returning a value is optional
-- Procedures can have paramaeters of both Input & Output, Functions can have only Input Paramaeters
-- Procedures we can perform select, update and delete whereas functions can only be used to performs select operations
-- Error Handling Transaction Management can be performed in Procedures only.
-- Procedures can be executed by using EXEC/Execute whereas Functions can be called by using SELECT statement.

create Function dbo.SAMPLE_001()
returns int
As
Begin
	return 10
End

select dbo.SAMPLE_001()

select * from emp where deptno=dbo.SAMPLE_001()

drop function dbo.SAMPLE_002

create function dbo.SAMPLE_002(@x int, @y int)
Returns int
As
Begin
	return (isnull(@x,0) + isnull(@y,0))
End

select dbo.SAMPLE_002(10,null)

select *, dbo.SAMPLE_002(sal,Comm) as TotalSal from emp 

create function dbo.SAMPLE_003(@x int, @y int)
Returns int
As
Begin
	return (isnull(@x,0) - isnull(@y,0))
End

select *, dbo.SAMPLE_003(sal,Comm) as TotalSal from emp 

create or alter Function dbo.Grades(@x int)
returns varchar(20)
As
Begin
	declare @z varchar(20)
	if @x >=3000
		set @z='Grade A'
	else if @x >=1000
		set @z='Grade B'
	else
		set @z='Grade C'
	return @z
End

select dbo.Grades(200)

select *,dbo.Grades(sal) from EMP

create or alter Function dbo.Concat001(@x varchar(50),@y varchar(50),@z varchar(30))
Returns varchar(100)
As
Begin
	return (@x+@z+@y)
End

select *, dbo.Concat001(Ename,Job,' having Job as ') from EMp

-- Inline Functions

create function dbo.EXAM_002(@x1 int)
returns table
As
Return (select sum(sal) as SUM_SAL from emp where deptno=@x1)

select * from dbo.EXAM_002(10)

sp_helptext 'dbo.exam_001'

create function dbo.EXAM_001(@x1 int)  
returns table  
As  
Return (select * from emp where deptno=@x1)

select * from dbo.EXAM_001(10)

select * from dbo.EXAM_001(10) x inner join dept y on x.DEPTNO=y.DEPTNO


create function dbo.EXAM_003(@x1 int)  
returns table  
As  
Return (select E.*,D.Dname,D.loc from emp e inner join dept d on e.deptno=d.DEPTNO where e.deptno=@x1)

select * from dbo.EXAM_003(20)

select E.*,D.Dname,D.loc from emp e inner join dept d on e.deptno=d.DEPTNO

--Multi Statement Value

create function dbo.SAMPL_001()  
returns @x table (Empno int,Ename varchar(100)) 
As  
Begin
	insert into @x select empno,Ename from emp
	return
End

select * from dbo.SAMPL_001()

--- Conversion Functions
--- Math Functions
--- Sub Queries
--- Indexes and Views
--- Triggers


