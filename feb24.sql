


-------------------------------module 4----------------------------------------------------------------------------
----1.Use the inbuilt functions and find the minimum, maximum and average amount from the orders table
---aggregate functions(min,max,avg)
insert into orders values(101,'2022/08/15',1500,10),
(102,'2022/08/10',2500,11),
(103,'2022/08/12',3500,3),
(104,'2022/09/23',4500,13),
(105,'2022/09/24',6000,25)

select min(amount) as min_amount,max(amount) as max_amount,avg(amount) as avg_amount from orders

----2.Create a user-defined function, which will multiply the given number with 10
create function mul_ten(@num int)
returns int
as begin
return(@num*10)
end

select dbo.mul_ten(40) as Mul----(12*10)--120(scalar valued function)


---3.Use the case statement to check if 100 is less than 200, greater than 200 or equal to 200 and print the corresponding value
select
case
when 100<200 then '100 is less than 200'
when 100>200 then '100 is greater than 200'
else '100 is equal to 200'
end


-----in SQL we have two types of user-defined functions
---scalar valued function(single value)
--scalar function may or may not have a parameter but it should return the value that is single value.
---table valued function
--the table valued function returns the result in a table format.
---inline table valued and multi line table valued function


----------------------------------------------module 5------------------------------------------------------------

---1.Arrange the ‘Orders’ dataset in decreasing order of amount
select * from orders order by amount desc
----select * from table_name order by column_name desc or asc

--2.Create a table with name ‘Employee_details1’ and comprising of these columns – ‘Emp_id’, ‘Emp_name’, ‘Emp_salary’. Create another table with name ‘Employee_details2’, which comprises of same columns as first table.
create table Employee_details1(Emp_id int primary key,Emp_name varchar(30),Emp_salary int);

insert into Employee_details1 values(1,'ABC',1000)

insert into Employee_details1 values(2,'BBC',3000)

insert into Employee_details1 values(3,'CBC',1500)

insert into Employee_details1 values(4,'DBC',2000)

insert into Employee_details1 values(5,'EBC',2500)

create table Employee_details2(Emp_id int primary key,Emp_name varchar(30),Emp_salary int);

INSERT into Employee_details2 values(1,'ABC',1000)
INSERT into Employee_details2 values(2,'BBC',3000)
INSERT into Employee_details2 values(3,'CBC',1500)
INSERT into Employee_details2 values(4,'DBC',10000)
INSERT into Employee_details2 values(5,'YBC',6000)

SELECT * from Employee_details1
SELECT * from Employee_details2

--3.Apply the union operator on these two tables
select * from Employee_details1
union
select * from Employee_details2

select * from Employee_details1
union all
select * from Employee_details2


---4.Apply the intersect operator on these two tables
select * from Employee_details1
intersect
select * from Employee_details2

----5.Apply the except operator on these two tables
select * from Employee_details1
except
select * from Employee_details2


-----set operators
--union operator will return all the unique rows from both the tables
--note is that duplicates are removed from the table result set
---union all operator returns all the rows from both the tables including the duplicates
---intersect operator
--the intersect operator will be returning the matching rows or common rows from both table
--except operator
--the except operator will return unique rows from the left table that are not preset in the right table results.


-----------------------------------module 6------------------------------------------------------------------------
---1.Create a view named ‘customer_san_jose’ which comprises of only those customers who are from san jose
create view customer_san_jose
as
select * from customer
where city='san jose'

select * from customer_san_jose

---2.Inside a transaction, update the first name of the customer to Francis, where the last name is Jordan
--a.Rollback the transaction
--b.Set the first name of customer to Alex, where the last name is Jordan
create table customer_info(id int,first_name varchar(20),last_name varchar(20))

insert into customer_info values(1,'george','jordan')
insert into customer_info values(2,'kunal','singh')
insert into customer_info values(3,'arun','kumar')

begin transaction
update customer_info
set first_name='Francis'
where last_name='jordan'

select * from customer_info
rollback transaction

update customer_info
set first_name='Alex'
where last_name='jordan'

---3.Inside a try catch block, divide 100 with 0, print the default error message

declare @var1 int
declare @var2 int
begin try
set @var1=100;
set @var2=@var1/0;
end try
begin catch
print('infinity')
end catch