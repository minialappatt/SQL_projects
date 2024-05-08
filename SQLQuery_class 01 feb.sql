select * from emp
select * from dept
select empno,sal,sal*12 from emp
select empno,sal,comm,sal+comm from emp
select * from emp where deptno=10
select * from emp where deptno=10 or deptno=20
select * from emp where sal>=3000
select * from emp where sal>=2000 and sal<=3000
select * from emp where deptno=10 and sal >=2000
select * from emp where job='manager'
select * from emp where job='manager' or job='clerk'
select * from emp where deptno in(10,20,30,40)
select * from emp where job in('manager','clerk','analyst')
select * from emp where sal between 2001 and 3000
select * from emp where hiredate between '01-jan-1982' and '31-dec-1982'
select * from emp where hiredate between '1982-01-01' and '1982-12-31'
select * from emp where comm is not null
select * from emp where comm is  null
select job, sum(sal), avg(sal),max(sal) from emp group by job 
select job, sum(sal), avg(sal),max(sal) from emp group by job 