select Region, sum(Sales) as 'Total Sales', sum(Profit) as 'total Profit' from SalesOrder$ group by region
select Category,[sub-category],
SUM(Sales) as 'Total Sales',
MAX(discount) as 'max discount',
SUM(Profit) as 'total profit'
from SalesOrder$ group by Category,[sub-category] order by Category
select Region,
SUM(sales) as 'total sales'
from SalesOrder$ where region in ('South','West','East')
group by Region
having sum(sales)>=500000
order by Region
select Region,Category,
SUM(sales) as 'total sales'
from SalesOrder$ group by Region,category
Order By Region
select Region,Category,
SUM(sales) as 'total sales'
from SalesOrder$ group by rollup ( Region,category)
Order By Region
select Region,Category,
SUM(sales) as 'total sales'
from SalesOrder$ 
group by cube ( Region,category)
Order By Region
