-- DQL
select * from emp

select * from dept

-- Virtual Columns

select * from EMP

select EMPNO,Ename,Job From emp

select empno,sal, sal*12 from emp

select empno, sal,comm, sal+comm as TotalSal from emp

select empno, sal, comm, sal*6 as 'Half Year Salary' , sal*12 as 'Annual Salary' from emp

select ename + ' ' + job from emp

select ename + ' having designation as ' + job , ename + '''' from emp

-- Clauses

select * from emp where deptno=10

select * from emp where deptno=10 or deptno=20 

select * from emp where sal>=3000

select * from emp where sal>=2000 and sal <=3000

select * from emp where deptno=10 and sal >=2000

select * from emp where job ='MANAGER'

select * from emp where job = 'CLERK' or job='MANAGER'

-- In, Not In
select * from emp where deptno in (10,20,40,50,60)

select * from emp where job in ('MANAGER','CLERK','ANALYST')

select * from emp where DEPTNO not in (10,20)

select * from emp where job not in ('MANAGER','CLERK')

-- Between , Not Between

select * from emp where SAL between 2001 and 3000

select * from emp where hiredate between '01-Jan-1982' and '31-Dec-1982'

select * from emp where hiredate between '1982-01-01' and '1982-12-31'

select * from emp where sal not between 2000 and 3000

-- Like , Not Like
select * from emp where ename like 'A%'

select * from emp where ename like '%R'

select * from emp where ename like '%o%'

select * from emp where ename like 's%h'

select * from emp where ename like '_____'

select * from emp where ename not like 'S%'

-- Is Null, Is Not Null

select * from emp where comm is null

select * from emp where comm is not null

-- Group By 

select DEptno,
sum(sal) as 'Total Sal',
max(sal) as 'Max Sal',
min(sal) as 'Min Sal'
from emp group by DEPTNO

select job,
sum(sal),
Avg(Sal),
Min(Sal),
Max(Sal)
from emp group by Job

select MGr, sum(sal), Avg(Sal), max(Sal) from emp group by MGR

select Deptno, Job , SUm(Sal) from Emp group by Deptno, Job order by deptno desc