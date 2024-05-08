-- Procedures
create procedure PROC_001 
as
select * from SalesOrder$ where Category = 'Furniture'

exec PROC_001


create or alter procedure PROC_002(@X as varchar(100))
as
select Avg(Sales) from SalesOrder$ where Category=@x


create or alter procedure PROC_003(@X as varchar(100))
as
select * from SalesOrder$ where Category=@x

exec proc_003 'Office Supplies'

create or Alter procedure PROC_004(@x as varchar(40),@y as varchar(30))
as
select * from SalesOrder$ where Category=@x and segment=@y

exec PROC_004 'Office Supplies','ABCD'

--- IF COnditions

create or alter procedure PROC_005(@x as varchar(40))
as
Begin
	if exists (select * from SalesOrder$ where category =@x)
		select * from SalesOrder$ where category=@x
	else
		print 'No Records Found'
end

exec Proc_005 'Office Supplies'

-- Default or Optional Parameter
create or alter procedure PROC_006(@x as varchar(40)='Office Supplies')
As
Begin
	select * from SalesOrder$ where category=@x
End

exec Proc_006 

exec proc_006 'Technology'

-- Return Output Parameters
-- Ex 001
create or alter procedure PROC_007(@x as varchar(40), @y as int OUTPUT)
As
Begin
	(select @y=sum(sales) from SalesOrder$ where Category=@x)
End

Declare @z int
exec proc_007 'Office SUPPLIES',@z OUTPUT
print @z

-- Ex 002
create or alter procedure PROC_008(@x as varchar(40), @y1 as int OUTPUT,@y2 as int OUTPUT)
As
Begin
	(select @y1=sum(sales),@y2=Avg(Sales) from SalesOrder$ where Category=@x)
End

Declare @z1 int
declare @z2 int
exec PROC_008 'Office SUPPLIES',@z1 OUTPUT,@z2 OUTPUT
print @z1
print @z2

-- if Else Statement

create or alter procedure PROC_009
as
Begin
	Declare @x int=10
	Declare @y int=20
	if @x>@y
		print @x 
	else
		print @y
End

exec proc_009

create or alter procedure proc_010 (@x int)
As
Begin
if exists (select * from emp where deptno=@x)
	print 'Records Found'
else
	print 'No Records Found'
End

exec proc_010 100

create or alter procedure proc_011 (@x int)
As
Begin
if exists (select * from emp where empno=@x)
	Begin
		print 'EMp Found'
	End
else
	Begin
		print 'No Emp Found'
	End
End

exec proc_011 7369

create or alter procedure proc_012(@x int)
As
Begin
declare @y int
if exists (select * from emp where empno=@x)
	begin
		select @y=sal from emp where empno=@x
		print @y
	end
else
	print 'No Emp Found'
End	

exec proc_012 7369

-- Print the sal of an Emp -- Dynamic 7369 using sp.
-- Else if

create or alter procedure PROC_013 (@x as int)
as
Begin
	if @x >1500
		print 'Grade A'
	else if @x >=1000
		print 'Grade B'
	else if @x >=500
		print 'Grade C'
	else
		print 'Grade D'
End

exec proc_013 100

-- Loops
create or alter Procedure PROC_014
As
Begin
	declare @x int =1
	declare @y int =10
	while @x<=@y
	begin
		print @x
		set @x=@x+1
	End
End

exec proc_014

-- Break & Continue
-- Functions [UDF] & Inline Functions
-- Triggers
-- Sub Queries
-- Views, Indexes
-- Mathematical

sp_helptext proc_014


