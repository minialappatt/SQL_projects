-- Joins 
select * from emp
select * from Dept

-- Inner Join or Equi Join
select * from emp inner join DEPT on emp.deptno=dept.DEPTNO
select EMP.ENAME,EMp.EMPNO,DEPT.DNAME,DEPT.loc from emp inner join dept on emp.DEPTNO=dept.DEPTNO

-- Left Join or Left Outer join
select * from emp left join Dept on emp.deptno=dept.DEPTNO
insert into emp (EMPNO,ENAME,Job,Deptno) values  (9999,'TEST','MANAGER',50)

-- Right Join or Right Outer Join
select * from emp right join dept on emp.deptno=dept.deptno

-- Full Join or Full Outer Join
select * from emp Full join dept on emp.deptno=dept.deptno

-- Self Join 
select * from emp  E1 inner join emp E2 on E1.MGR=E2.EMPNO

select 
od.orderid,
cs.CustomerName,cs.Country,
os.OrderDate,od.Quantity,pd.ProductName,pd.Unit,pd.Price,
ct.CategoryName,ct.Description, sp.SupplierName,sp.Country,sp.City,
sh.ShipperName,sh.Phone
from Customers$ CS 
inner join Orders$ os on cs.CustomerID=os.CustomerID
inner join OrderDetails$ od on od.OrderID=os.OrderID
inner join Products$ pd on pd.ProductID=od.ProductID
inner join Categories$ ct on ct.CategoryID=pd.CategoryID
inner join Suppliers$ sp on sp.SupplierID=pd.SupplierID
inner join Shippers$ sh on sh.ShipperID=os.ShipperID
order by cs.CustomerName


select 
Orders$.orderid,
Customers$.CustomerName,
Customers$.Country,
Orders$.OrderDate,
OrderDetails$.Quantity
from Customers$
inner join Orders$ on Customers$.CustomerID=Orders$.CustomerID
inner join OrderDetails$ on OrderDetails$.OrderID=Orders$.OrderID

-- Copy Tables

select * from SalesOrder$

select * into Salesorder_SouthWestData from  
(select * from SalesOrder$ where region in ('South','West')) as ABCD

select t1.[Order ID],t1.Sales,t1.Profit into Salesorder_SouthWestData_01
from 
(select * from SalesOrder$ where region in ('South','West')) as t1