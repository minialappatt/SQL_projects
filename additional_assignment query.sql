--module2

--Q1)
create table customer(customer_id varchar(20),first_name varchar(30),
    last_name varchar(30),email varchar(30), address varchar(30), city varchar(30),
	state varchar(20), zip varchar(10))
	select * from customer

--Q2)
	insert into customer values('123451','Alex','Mathew','alex@gmail.com','mayur vihar','newdelhi','newdelhi','684324')
    insert into customer values('123452','Sam','Vincent','sam@hotmail.com','Rishikesh','Himachal','Himachal','682456')
	insert into customer values('123453','Ravinder','Singh','ravis@gmail.com','Ludhiyana','panjab','Panjab','612213')
	insert into customer values('123454','Krishna','Gopal','krishnag@gmail.com','madhura','newdelhi','newdelhi','684324')
	insert into customer values('123455','madhu','mohan','madhu@gmail.com','vadothara','gujarat','gujarat','675432')

--Q3
	select first_name ,last_name from customer
	select * from customer where first_name like 'G%' and city like 'Sanjose'
	
--module 3

--Q1
	create table orders(order_id varchar(20),order_date date,amount int,customer_id varchar(30))
	select * from orders
	insert into orders values(101,'02/02/23',3000,'123451')
	insert into orders values(102,'03/02/23',2500,'123452')
	insert into orders values(101,'03/02/23',1000,'123453')
	insert into orders values(101,'02/02/23',3000,'123455')
	select * from orders
--Q2
    select * from orders o inner join customer c on o.customer_id=c.customer_id

--Q3
    select * from orders o left join customer c on o.customer_id=c.customer_id

    select * from orders o right join customer c on o.customer_id=c.customer_id

--Q4
    update orders set amount=100 where customer_id='3'
	update orders set amount=100 where customer_id='c1234'
    select * from orders

--module4

--Q1
select min(amount) as min_amount,max(amount) as max_amount,avg(amount) as avg_amount from orders

--Q2
create function mul_ten(@num int)
returns int
as begin
return(@num*10)
end

select dbo.mul_ten(40) as Mul

--Q3
  select
case
when 100<200 then '100 is less than 200'
when 100>200 then '100 is greater than 200'
else '100 is equal to 200'
end


--module5
--Q1
select * from orders order by amount desc

--Q2
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

--Q3

select * from Employee_details1
union
select * from Employee_details2

--Q4
select * from Employee_details1
intersect
select * from Employee_details2

--Q5
select * from Employee_details1
except
select * from Employee_details2


--module 6

--Q1
create view customer_san_jose
as
select * from customer
where city='san jose'

select * from customer_san_jose

Q2date the first name of the customer to Francis, where the last name is Jordan
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