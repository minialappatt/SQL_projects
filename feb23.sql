--------------------MODULE 1----------------------------------------------
----2.Learn the basics of Structured Query Language

SQL STRUCTURED QUERY LANGUAGE
DATABASE
DDL DATA DEFINATION LANGUAGE
DML DATA MANIPULATION LANGUAGE
DCL DATA CONTROL LANGUAGE

---------------------------modle2----------------------------------------------------------------------------
create database feb23
use feb23
---1.Create a customer table which comprises of these columns – ‘customer_id’, ‘first_name’, ‘last_name’, ‘email’, ‘address’, ‘city’,’state’,’zip’
create table customer(customer_id int,first_name varchar(20),last_name varchar(20),email varchar(20),address varchar(30),city varchar(20),state varchar(20),zip int)


--2.Insert 5 new records into the table
insert into customer values(10,'Sanjay','satyapal','ss@gmail.com','7 kindgerland','pune','maharashtra',40112)
insert into customer values(11,'ravindra','desai','rd@gmail.com','45kindgerland','bangalore','karnataka',40112)
insert into customer values(13,'arvind','rao','ro@gmail.com','87kindgerland','pune','maharashtra',40112)
insert into customer values(21,'govind','patil','wa@gmail.com','78kindgerland','san jose','california',40112)
insert into customer values(22,'wanar','kapoor','gv@gmail.com','79kindgerland','chennai','tamilnadu',40112)


--3.Select only the ‘first_name’ & ‘last_name’ columns from the customer table

select first_name,last_name from customer
---4.Select those records where ‘first_name’ starts with “G” and city is ‘San Jose’

select * from customer where first_name like 'g%' and city like 'san jose'


---------------------------------module 3------------------------------------------------------------------------
--1.Create an ‘Orders’ table which comprises of these columns – ‘order_id’, ‘order_date’, ‘amount’, ‘customer_id’
create table orders(order_id int,order_date date,amount int,customer_id int)

insert into orders values(101,'2022/08/15',1500,10),
(102,'2022/08/10',2500,11),
(103,'2022/08/12',3500,3),
(104,'2022/09/23',4500,13),
(105,'2022/09/24',6000,25)


--2.Make an inner join on ‘Customer’ & ‘Order’ tables on the ‘customer_id’ column 

select * from orders o inner join customer c on o.customer_id=c.customer_id


--3.Make left and right joins on ‘Customer’ & ‘Order’ tables on the ‘customer_id’ column

select * from orders o left join customer c on o.customer_id=c.customer_id

select * from orders o right join customer c on o.customer_id=c.customer_id

--4.Update the ‘Orders’ table, set the amount to be 100 where ‘customer_id’ is 3

update orders set amount=100 where customer_id=3

select * from orders






----joins in sql are used to retrieve data from 2 or more related tables.
---in general tables are related based on one common column

---types of join
Inner join - it returns only the matching rows between both the tables. Non matching rows are eliminated.

---outer join-left join,right join, full join

left join--returns all the matching rows plus non matching rows from the left table
right join--returns all the matching rows plus non matching rows from right table













