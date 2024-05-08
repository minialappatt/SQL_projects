-- Group By
select * from emp

select Job ,sum(Sal) as TotalSal, Avg(Sal) as AverageSal from Emp group by job

select Deptno, sum(Sal) as TotalSal, Avg(Sal) as AverageSal,Count(empno) as RecordsCount
from emp group by DEPTNO order by deptno 

-- 

select * from SalesOrder$

select Region, Sum(Sales) as 'Total Sales', Sum(Profit) as 'Total Profit'
from SalesOrder$ group by region

select Region, Category, 
Sum(Sales) as 'Total Sales',
max(discount) as 'MaxDiscount',
sum(Profit) as 'Total Profit' 
from  SalesOrder$ group by region,Category order by Region

select Category, [sub-category],
Sum(Sales) as 'Total Sales',
max(discount) as 'MaxDiscount',
sum(Profit) as 'Total Profit' 
from  SalesOrder$ group by Category,[sub-category] order by Category

select Category,[sub-category] ,sum(sales),max(Discount),sum(Profit) 
from salesorder$ group by Category,[sub-category] order by category

-- Having Clause

select 
Region, 
Sum(Sales) as 'Total Sales'
from SalesOrder$
group by Region
having sum(sales)>=500000
order by Region

select 
Region, 
Sum(Sales) as 'Total Sales'
from SalesOrder$
where region in ('SOuth','West','East')
group by Region
having sum(sales)>=500000
order by Region

select 

-- Rollup 

select 
Region,
Category,
Sum(sales) as 'Total Sales'
From SalesOrder$
group by Region,Category
order by Region

select 
Region,
Category,
[Sub-Category],
Sum(sales) as 'Total Sales'
From SalesOrder$
group by rollup(Region,Category,[Sub-Category])
order by Region

-- Cube

select 
Region,
Category,
Sum(sales) as 'Total Sales'
From SalesOrder$
group by cube(Region,Category)
order by Region

select 
Region,
Category,
[Sub-Category],
Sum(sales) as 'Total Sales'
From SalesOrder$
group by cube(Region,Category,[Sub-Category])
order by Region,category,[Sub-Category]