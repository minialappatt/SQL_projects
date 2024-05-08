-- natural join & cross join

-- Natural Join
-- Identical named columns
-- columns must be the same data type
-- No on clause
-- SQL Server will not support

select * from emp
select * from dept

select * from emp natural join dept;

select * from emp inner join dept on emp.deptno=dept.DEPTNO

-- Cross Join
-- 15 
-- 4
select * from emp ,dept

-- Operators
select * from emp where deptno=10

select * from emp where job ='CLERK'
-- Union All
select * from emp where deptno=10
union All
select * from emp where job ='CLERK'

-- Union
select * from emp where deptno=10
union 
select * from emp where job ='CLERK'

-- Intersect
select * from emp where deptno=10
intersect 
select * from emp where job ='CLERK'

-- Except
select * from emp where deptno=10
Except 
select * from emp where job ='CLERK'

-- Update
select * from emp

select * into EMP02 from (select * from emp) as T1

select * from emp02

update EMP02 set comm=1000 where comm is null

update emp02 set sal=4000,MGR=7839 where empno=9999
-- Functions

-- Date Functions
select * from emp

select Hiredate,
Datename(Month,Hiredate) as 'MonthName',
Datename(Year,Hiredate) as 'Year',
Datename(Day,Hiredate) as 'Day',
Datename(Week,Hiredate) as 'Week',
Datename(QUARTER,Hiredate) as 'Quarter'
from EMP

select Hiredate,
Datepart(month,Hiredate) as 'Month',
Datepart(Year,Hiredate) as 'Year',
Datepart(Day,Hiredate) as 'Day',
Datepart(Week,Hiredate) as 'Week',
Datepart(QUARTER,Hiredate) as 'Quarter'
From EMP

select Hiredate, 
Month(Hiredate) as 'Month',
Year(Hiredate) as 'Year',
Day(Hiredate) as 'Day'
from emp

select getdate()

select Hiredate,Getdate(),
datediff(Month,Hiredate,getdate())  as 'MonthDiff',
datediff(year,Hiredate,getdate()) as 'Years Diff',
datediff(Day,Hiredate,getdate()) as 'Days Diff',
datediff(Week,Hiredate,getdate()) as 'Week Diff',
datediff(Quarter,Hiredate,getdate()) as 'Quarter Diff' from emp

select Hiredate,
Dateadd(Month,2,Hiredate) as 'Add Months',
Dateadd(Day,2,Hiredate) as 'Add Day',
Dateadd(YEAR,3,Hiredate) as 'Add years',
Dateadd(Week,2,Hiredate) as 'Add Week'
from emp

select Hiredate,
--Dateadd(month,2, Hiredate) as 'Add Months',
Eomonth(Hiredate,2),
Eomonth(Hiredate,0) as 'Eomonth'
from EMP	

create table SAMPLE_10(
Dt1 datetimeoffset
)

insert into SAMPLE_10 values ('2023-02-10 08:25:00 +05:30')

select SWITCHOFFSET(dt1,'-11:00') as 'ConvertZone' from SAMPLE_10

select Hiredate,
todatetimeoffset(hiredate,'+05:30') from emp

select DATEFROMPARTS(2023,02,10)

select TimeFromParts(08,41,30,02,05)

--Year,Month,Day,Hour,Min,Sec,Fractions,HourOffset,MinuteOffset,Precision
select DATETIMEOFFSETFROMPARTS(2023,02,10,08,41,30,02,05,30,4)

-- String
-- Window
-- Aggregate
-- CTE
-- Merge Joins
-- Update Join
-- TCL

-- Stored Procedure
-- Function Procedures
-- loops
-- if else
-- Triggers
-- Normalization
