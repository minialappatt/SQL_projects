select * from Fact
select * from Product
select * from Location

1) Display number of states present in location table?

select count(distinct state) as state_count
from Location

--2) How many products are of regular type ?
select count(distinct Product) product_count from Product
	where Type='regular'


--3) How much spending has been done on marketing of product id 1
select sum(Marketing) as Marketing_expenditure from Fact 
		where ProductId=1


--4) What is the minimum sales of a product ?