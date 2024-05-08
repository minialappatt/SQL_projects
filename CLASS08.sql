-- String Functions

select ENAME,upper(Ename), Lower(Ename) from emp

select reverse(Ename) from emp

select Ename,substring(Ename,1,2),
substring(Ename,3,2),substring(Ename,3,50) from emp

select Ename,LTRIM(Ename),Rtrim(Ename) from emp

select Ltrim('  SQLCLASS   ') ,rtrim('  SQLCLASS   ') 

-- Window Functions

-- IIF
select Sal,iif(sal>=4000,'Grade A','Grade B') as 'GRADES' from EMP

select profit,
iif(profit>0,'Positive Profit','Negative Profit') as PosNegProfit,
iif(Sales>=10000,'High Sales',iif(Sales>=5000,'Avg Sales','Low Sales')) as 'Sales01' from SalesOrder$

-- CASE

select * from emp

select Deptno, (Case when deptno=10 then 'HR' when Deptno=20 then 'ADMIN'
				when deptno=30 then 'RECRUITMENT' end) as 'DEPT' from emp

select Deptno, (Case when deptno=10 then 'HR' when Deptno=20 then 'ADMIN'
				when deptno=30 then 'RECRUITMENT' else 'NA' end) as 'DEPT' from emp

select Sal, (case when sal>3000 then 'Grade A' when sal >0 then 'Grade B' end) from EMP

select comm, (case when comm is null then 100 when comm is not null then comm end) from emp

-- RANK, DENSE_RANK

select * from emp order by deptno,sal desc

select *,Sal, 
Rank() over(order by sal desc) as RANKMETHOD,
Dense_Rank() over(order by sal desc) as DENSERANKMETHOD from EMP

select *,Sal, 
Rank() over(partition by deptno order by sal desc) as RANKMETHOD,
Dense_Rank() over(partition by deptno order by sal desc) as DENSERANKMETHOD from EMP

SELECT *,SAL, RANK()OVER(PARTITION BY DEPTNO ORDER BY sal desc) AS RANKMETHOD, DENSE_RANK()OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) AS DENSERANKINGMETHOD FROM EMP

-- LAG, LEAD

select deptno, Sum(sal),
lag(sum(sal),1) over(order by deptno) as LAG_01 from emp group by deptno 

select deptno, Sum(sal),
lead(sum(sal),1) over(order by deptno) as Lead_01 from emp group by deptno 

select deptno, Sum(sal),
lag(sum(sal),1) over(order by deptno desc) as LAG_01 from emp group by deptno 

-- First_Value, LAST_VALUE

select * from emp order by deptno

select *, deptno, FIRST_VALUE(SAL) over(order by sal desc) from emp

select *, deptno, 
FIRST_VALUE(SAL) over(partition by deptno order by sal desc) as FIRST_VALUE,
LAST_VALUE(SAL) over(partition by deptno order by sal desc 
RANGE BETWEEN UNBOUNDED PRECEDING AND 
        UNBOUNDED FOLLOWING) as LAST_VALUE
from emp

-- nth Higest Sal & nth lowest sal

with 
CTE01(Ename,Sal,Deptno,Ranking_01)
as
(select Ename,Sal,DEPTNO,dense_rank() over(order by sal desc) as Ranking_01 from emp )
select * from CTE01 where Ranking_01=3


