select * from Person.Address
select * from Person.Person
Select * From Person.EmailAddress
Select * From Person.PersonPhone
Select * From Person.PhoneNumberType
select * from Sales.Customer
select * from person.Busi
select * from Sales.SalesPerson


--1)Get all the details from the person table including email ID, phone number, and phone number type
CREATE TABLE customer_details (
BusinessEntityID INT,
FullName VARCHAR(100),
EmailAddress Varchar(100),
PhoneNumber nvarchar(100),
PhoneNumbertype varchar(10)
)
Insert into customer_details
Select * From (Select p.BusinessEntityID,concat(p.FirstName,' ',p.MiddleName,' ',p.LastName) as FullName,
                      EmailAddress, 
					  ph.PhoneNumber as PhoneNumber, 
					  phn.Name
							From Person.Person as p
                                   inner join Person.EmailAddress as Em on em.BusinessEntityID = p.BusinessEntityID
								   inner join Person.PersonPhone  as ph on em.BusinessEntityID = ph.BusinessEntityID
								   inner join Person.PhoneNumberType as phn on ph.PhoneNumberTypeID = phn.PhoneNumberTypeID
               ) as x

Select * From customer_details


-- 2)Get the details of the sales header order made in May 2011
Select * from Sales.SalesOrderHeader where year(orderdate)=2011 and MONTH(OrderDate)=5
							
-- 3)Get the details of the sales details order made in the month of May 2011
select * from Sales.SalesOrderHeader as SOH inner join Sales.SalesOrderDetail as SOD 
		on SOH.SalesOrderID=SOD.SalesOrderID 
		where year(orderdate)=2011 and MONTH(OrderDate)=5 
		order by sod.SalesOrderID

-- 4)Get the total sales made in May 2011
select * from Sales.SalesOrderDetail

select  sum(SOD.LineTotal) as salesTotal from Sales.SalesOrderDetail as SOD inner join Sales.SalesOrderHeader as SOH 
		on SOH.SalesOrderID=SOD.SalesOrderID 
		where year(orderdate)=2011 and MONTH(OrderDate)=5 
		
--5)Get the total sales made in the year 2011 by month order by increasing sales
select SOD.SalesOrderID,SOH.OrderDate,SOD.LineTotal,SOH.TotalDue from Sales.SalesOrderDetail as SOD inner join Sales.SalesOrderHeader as SOH 
		on SOH.SalesOrderID=SOD.SalesOrderID 
		where year(orderdate)=2011 order by MONTH(OrderDate),SOH.TotalDue asc

--6)Get the total sales made to the customer with FirstName='Gustavo' and LastName 'Achong'
select * from Person.Person as pp inner join Sales.Customer as Sc 
		on pp.rowguid=Sc.rowguid 
		where pp.FirstName='gustavo' and pp.LastName='achong'
		
		
		
