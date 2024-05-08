create table Employee_Table(Employee_Id int primary key,First_name varchar(25),Last_Name varchar(25),Salary int,Joining_date date,Department varchar(25))
insert into Employee_Table values( 1,'Anika','Arora',100000,'2020-02-14 9:00:00','HR' )
insert into Employee_Table values (2,'Veena','Verma',80000,'2011-06-15 9:00:00','Admin' )
insert into Employee_Table values (3 ,'Vishal','Singhal',300000, '2020-02-16 9:00:00','HR' )
insert into Employee_Table values (4, 'Sushanth','Singh',500000,'2020-02-17 9:00:00','Admin')
insert into Employee_Table values (5,'Bhupal','Bhati',500000,'2011-06-18 9:00:00','Admin') 
insert into Employee_Table values (6,'Dheeraj','Diwan',200000,'2011-06-19 9:00:00','Account')
insert into Employee_Table values (7,'Karan','Kumar',75000,'2020-01-14 9:00:00','Account')
insert into Employee_Table values (8, 'Chandrika', 'Chauhan',90000,'2011-04-15 9:00:00','Admin')
select * from Employee_Table

create table Employee_Bouns
(Employee_ref_id int foreign key references Employee_Table(Employee_Id),Bouns_Amount int,Bouns_Date date) 
insert into Employee_Bouns values( 1,5000,'2020-02-16 0:00:00')
insert into Employee_Bouns values( 2,3000,'2011-06-16 0:00:00')
insert into Employee_Bouns values( 3,4000,'2020-02-16 0:00:00')
insert into Employee_Bouns values( 1,4500,'2020-02-16 0:00:00')
insert into Employee_Bouns values( 2,3500,'2011-06-16 0:00:00')
select * from Employee_Bouns

create table Employee_Title
(Employee_ref_id int foreign key references Employee_Table(Employee_Id),Employee_title varchar(25),Affective_Date date)
insert into Employee_Title values( 1,'Manager','2016-02-20 0:00:00')
insert into Employee_Title values( 2,'Executive','2016-06-11 0:00:00')
insert into Employee_Title values( 8,'Executive','2016-06-11 0:00:00')
insert into Employee_Title values( 5,'Manager','2016-06-11 0:00:00')
insert into Employee_Title values( 4,'Asst.Manager','2016-06-11 0:00:00')
insert into Employee_Title values( 7,'Executive','2016-06-11 0:00:00')
insert into Employee_Title values( 6,'Lead','2016-06-11 0:00:00')
insert into Employee_Title values( 3,'Lead','2016-06-11 0:00:00')
select * from Employee_Title


--data
select * from Employee_Table
select * from Employee_Bouns
select * from Employee_Title

--1 Display the “FIRST_NAME” from Employee table using the alias name as Employee_name.
select First_name as employee_name from Employee_Table 

--2 Display “LAST_NAME” from Employee table in upper case.
select upper(Last_Name) as Last_Name from Employee_Table 

--3 Display unique values of DEPARTMENT from EMPLOYEE table.
select distinct(department) from employee_table

--4 Display the first three characters of LAST_NAME from EMPLOYEE table.
select substring(Last_Name,1,3) as Last_Name from Employee_Table 
--5 Display the unique values of DEPARTMENT from EMPLOYEE table and prints its length.
select distinct(department) as u_dept,len(Department) as length from employee_table

--6 Display the FIRST_NAME and LAST_NAME from EMPLOYEE table into a single column AS FULL_NAME.  a space char should separate them.
select CONCAT(first_name,' ',Last_Name) from Employee_Table

--7 DISPLAY all EMPLOYEE details from the employee table order by FIRST_NAME Ascending.
select * from Employee_Table order by first_name asc

--8. Display all EMPLOYEE details order by FIRST_NAME Ascending and DEPARTMENT Descending.
select * from Employee_Table order by first_name asc, Department desc

--9 Display details for EMPLOYEE with the first name as “VEENA” and “KARAN” from EMPLOYEE table.
select * from Employee_Table where First_name='veena' or First_name='karan'

--10 Display details of EMPLOYEE with DEPARTMENT name as “Admin”.
select* from Employee_Table where Department='admin'

--11 DISPLAY details of the EMPLOYEES whose FIRST_NAME contains ‘V’.
select* from Employee_Table where first_name like '%V%'

--12 DISPLAY details of the EMPLOYEES whose SALARY lies between 100000 and 500000.
select* from Employee_Table where Salary between 100000 and 500000

--13 Display details of the employees who have joined in Feb-2020.
select* from Employee_Table where MONTH(Joining_date)=2 and year(Joining_date)=2020

--14 Display employee names with salaries >= 50000 and <= 100000.
select* from Employee_Table where Salary>=50000  and salary <= 100000

--16 DISPLAY details of the EMPLOYEES who are also Managers.
Select emp.Employee_ID,emp.First_name, ET.employee_title
		From Employee_Table as Emp
		Inner join Employee_Title as ET on ET.Employee_ref_id = Emp.Employee_ID
		where employee_title = 'Manager'

--17 DISPLAY duplicate records having matching data in some fields of a table.
Select First_name, count(Employee_ID) as EMP_Count
		from Employee_Table
		Group by First_name
		Having count(Employee_ID)>1
Select employee_ref_id, count(employee_ref_id) as EMP_Count
		from Employee_Bouns
		Group by employee_ref_id
		Having count(employee_ref_id)>1

--18 Display only odd rows from a table.
Select * From Employee_Table where Employee_ID % 2 <> 0

--19 Clone a new table from EMPLOYEE table.
Select * Into Employee_Table_clone
		From Employee_Table

Select * From Employee_Table_clone

--20 DISPLAY the TOP 2 highest salary from a table.
Select Top 2 * From Employee_Table order by Salary desc

--21. DISPLAY the list of employees with the same salary.
Select Salary from (
		Select * , DENSE_RANK()Over(order by salary desc) as Rankvalue
		From Employee_Table
		) as x
		Group by Salary
		having count(*) >1

--22 Display the second highest salary from a table.
Select * from (
		Select * , DENSE_RANK()Over(order by salary desc) as Rankvalue
		From Employee_Table
		) as x
		where Rankvalue = 2

--23 Display the first 50% records from a table.
Select top 50 PERCENT DENSE_RANK()Over(order by salary desc) as Rankvalue, *
		From Employee_Table

--24. Display the departments that have less than 4 people in it.
Select Department, Count(Department) as Count
		From Employee_Table
		Group by Department
		Having Count(Department) < 4

--25. Display all departments along with the number of people in there.
Select Department, Count(Department) as Count
		From Employee_Table
		Group by Department

--26 Display the name of employees having the highest salary in each department.
Select * from (
		Select *, DENSE_RANK()over(partition by department order by salary desc) as rankvalue
		From Employee_Table
		) as X
		where rankvalue = 1

--27 Display the names of employees who earn the highest salary.
Select Top 1 First_name, Last_Name, Salary
		From Employee_Table
		Order by Salary desc
--28 Diplay the average salaries for each department
		Select Department, Avg(Salary) As Avgsalary
		From Employee_Table
		Group by Department

--29 display the name of the employee who has got maximum bonus
Select Top 1 EB.Bouns_Amount, Empt.First_name, Salary
		from Employee_Table as empt
		inner join Employee_Bouns as EB on EB.Employee_ref_id= Empt.Employee_ID
		Order by Bouns_Amount desc

--30 Display the first name and title of all the employees
Select ET.employee_title, Empt.First_name
		from Employee_Table as empt
		inner join Employee_Title as ET on ET.Employee_ref_id= Empt.Employee_ID