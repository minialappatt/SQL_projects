--Table Creation
CREATE TABLE studies (PNAME varchar(20), INSTITUTE varchar(20), COURSE varchar(20), COURSE_FEE int )
-- Insertion
INSERT INTO studies
SELECT 'ANAND','SABHARI','PGDCA',4500 UNION ALL
SELECT 'ALTAF','COIT','DCA',7200 UNION ALL
SELECT 'JULIANA','BDPS','MCA',22000 UNION ALL
SELECT 'KAMALA','PRAGATHI','DCA',5000 UNION ALL
SELECT 'MARY','SABHARI','PGDCA ',4500 UNION ALL
SELECT 'NELSON','PRAGATHI','DAP',6200 UNION ALL
SELECT 'PATRICK','PRAGATHI','DCAP',5200 UNION ALL
SELECT 'QADIR','APPLE','HDCA',14000 UNION ALL
SELECT 'RAMESH','SABHARI','PGDCA',4500 UNION ALL
SELECT 'REBECCA','BRILLIANT','DCAP',11000 UNION ALL
SELECT 'REMITHA','BDPS','DCS',6000 UNION ALL
SELECT 'REVATHI','SABHARI','DAP',5000 UNION ALL
SELECT 'VIJAYA','BDPS','DCA',48000
-- To View
SELECT*FROM studies

--Table Creation
CREATE TABLE software (PNAME varchar(20), TITLE varchar(20), DEVELOPIN varchar(20), SCOST decimal(10,2),  DCOST int, SOLD int)
-- Insertion
INSERT INTO software
SELECT 'MARY','README','CPP',300, 1200, 84 UNION ALL
SELECT 'ANAND','PARACHUTES','BASIC',399.95, 6000, 43 UNION ALL
SELECT 'ANAND','VIDEO TITLING','PASCAL',7500, 16000, 9 UNION ALL
SELECT 'JULIANA','INVENTORY','COBOL',3000, 3500, 0 UNION ALL
SELECT 'KAMALA','PAYROLL PKG.','DBASE',9000, 20000, 7 UNION ALL
SELECT 'MARY','FINANCIAL ACCT.','ORACLE',18000, 85000, 4 UNION ALL
SELECT 'MARY','CODE GENERATOR','C',4500, 20000, 23 UNION ALL
SELECT 'PATTRICK','README','CPP',300, 1200, 84 UNION ALL
SELECT 'QADIR','BOMBS AWAY','ASSEMBLY',750, 3000, 11 UNION ALL
SELECT 'QADIR','VACCINES','C',1900, 3100, 21 UNION ALL
SELECT 'RAMESH','HOTEL MGMT.','DBASE',13000, 35000, 4 UNION ALL
SELECT 'RAMESH','DEAD LEE','PASCAL',599.95, 4500, 73 UNION ALL
SELECT 'REMITHA','PC UTILITIES','C',725, 5000, 51 UNION ALL
SELECT 'REMITHA','TSR HELP PKG.','ASSEMBLY',2500, 6000, 7 UNION ALL
SELECT 'REVATHI','HOSPITAL MGMT.','PASCAL',1100, 75000, 2 UNION ALL
SELECT 'VIJAYA','TSR EDITOR','C',900, 700, 6
-- To View
SELECT *FROM software


--Table Creation
CREATE TABLE programmer (PNAME varchar(20), DOB date, DOJ date, GENDER varchar(2), PROF1 varchar(20), PROF2 varchar(20), SALARY int)
-- Insertion
INSERT INTO programmer
SELECT 'ANAND','12-Apr-66','21-Apr-92','M','PASCAL','BASIC',3200 UNION ALL
SELECT 'ALTAF','02-Jul-64','13-Nov-90','M','CLIPPER','COBOL',2800 UNION ALL
SELECT 'JULIANA','31-Jan-60','21-Apr-90','F','COBOL','DBASE',3000 UNION ALL
SELECT 'KAMALA','30-Oct-68','02-Jan-92','F','C','DBASE',2900 UNION ALL
SELECT 'MARY','24-Jun-70','01-Feb-91','F','CPP','ORACLE',4500 UNION ALL
SELECT 'NELSON','11-Sep-85','11-Oct-89','M','COBOL','DBASE',2500 UNION ALL
SELECT 'PATTRICK','10-Nov-65','21-Apr-90','M','PASCAL','CLIPPER',2800 UNION ALL
SELECT 'QADIR','31-Aug-65','21-Apr-91','M','ASSEMBLY','C',3000 UNION ALL
SELECT 'RAMESH','03-May-67','28-Feb-91','M','PASCAL','DBASE',3200 UNION ALL
SELECT 'REBECCA','01-Jan-67','01-Dec-90','F','BASIC','COBOL',2500 UNION ALL
SELECT 'REMITHA','19-Apr-70','20-Apr-93','F','C','ASSEMBLY',3600 UNION ALL
SELECT 'REVATHI','02-Dec-69','02-Jan-92','F','PASCAL','BASIC',3700 UNION ALL
SELECT 'VIJAYA','14-Dec-65','02-May-92','F','FOXPRO','C',3500
-- To View
SELECT * FROM programmer
--1)Find out the selling cost AVG for packages developed in Pascal.

select AVG(scost) from software where DEVELOPIN='pascal'

--2)Display Names, Ages of all Programmers.

select PNAME,datediff(year ,dob,getdate())AS age, DOB from programmer

--3. Display the Names of those who have done the DAP Course.

select *,PNAME from studies where COURSE='dap'

--4. Display the Names and Date of Births of all Programmers Born in January.
--select pname,dob, Datename(Month,dob) as 'Mn' from programmer where Mn = 'january' 

select pname,DATENAME(month,dob) as 'Monthname' from PROGRAMMER where month(DOB)=1

--5. What is the Highest Number of copies sold by a Package?
select MAX(sold) from software 

--6. Display lowest course Fee.
select MIN(course_fee) from studies

--7. How many programmers done the PGDCA Course?
select COUNT(*) from studies where COURSE ='pgdca'

--8.How much revenue has been earned thru sales of Packages Developed in C.
select * from (select developin,((sum(scost)*sum(sold))-sum(dcost)) as earned_rev from software group by developin) as test  where DEVELOPIN='c'

--9. Display the Details of the Software Developed by Ramesh.
select* from software where PNAME='ramesh'

--10. How many Programmers Studied at Sabhari?
select COUNT(*) from studies where INSTITUTE ='sabhari'

--11. Display details of Packages whose sales crossed the 2000 Mark.
select title,SUM(SCOST*SOLD ) as sales from software  where (scost*sold)>2000 group by TITLE

--12. Display the Details of Packages for which Development Cost have been recovered.
select * from software  where (scost*sold)>=DCOST 

--13. What is the cost of the costliest software development in Basic?
select max(scost) as cost from software   where DEVELOPIN='Basic'

--14. How many Packages Developed in DBASE?

select count(*) as package from software   where DEVELOPIN='dbase'



--15. How many programmers studied in Pragathi?
select COUNT(*) from studies where INSTITUTE ='Pragathi'

--16. How many Programmers Paid 5000 to 10000 for their course?
select * from studies where COURSE_FEE>=5000 and COURSE_FEE<=10000

--17. What is AVG Course Fee
select AVG(course_fee) from studies

--18. Display the details of the Programmers Knowing C.
select * from programmer where PROF1='c' or PROF2='c'

--19.How many Programmers know either COBOL or PASCAL.
select COUNT(* )from programmer where PROF1='COBOL' or PROF2='COBOL' or PROF1='PASCAL' or PROF2='PASCAL' 

--20. How many Programmers Don’t know PASCAL and C
select * from programmer where not(PROF1 ='c' or PROF2 = 'C' or PROF1 = 'PASCAL' or PROF2 = 'PASCAL' )

--21. How old is the Oldest Male Programmer.
select MAX(datediff(year ,dob,getdate()))  from programmer where  GENDER='m'

--22. What is the AVG age of Female Programmers?
select AVG(datediff(year,dob,GETDATE())) from programmer where gender='f'

--23Calculate the Experience in Years for each Programmer and Display with their names in Descending order.
select PNAME,datediff(year ,doj,getdate())AS exp from programmer order by exp desc

--24. Who are the Programmers who celebrate their Birthday’s During the Current Month?
select pname from programmer where month(dob)=MONTH(getdate())

--25. How many Female Programmers are there?
SELECT COUNT(*)FROM programmer where GENDER='f'

--26. What are the Languages studied by Male Programmers.
select prof1,prof2 from programmer where GENDER='m'

--27. What is the AVG Salary?
select AVG(salary) from programmer

--28. How many people draw salary 2000 to 4000?
select COUNT(*) from programmer where SALARY>=2000 and SALARY<=4000

--29. Display the details of those who don’t know Clipper, COBOL or PASCAL.
select * from programmer where not(PROF1='clipper' or PROF1='cobol' or PROF1='pascal' or PROF2='clipper' or PROF2='cobol' or PROF2='pascal')

--30. Display the Cost of Package Developed By each Programmer.
select pname,sum(DCOST) from software group by PNAME 

--31. Display the sales values of the Packages Developed by the each Programmer.
select pname,sum(SCOST*SOLD) from software group by PNAME 

--32. Display the Number of Packages sold by Each Programmer.
select pname,sum(SOLD) from software group by PNAME 

--33. Display the sales cost of the packages Developed by each Programmer Language wise.
select pname,developin,sum(SCOST*sold) from software group by PNAME ,DEVELOPIN

--34. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy.
select developin,avg(DCOST) as avsDcost ,AVG(SCOST) as avgScost from software group by DEVELOPIN

--35. Display each programmer’s name, costliest and cheapest Packages Developed by him or her.
select pname, max(dcost) as costliest,min(dcost) as cheapest from software group by PNAME

--36. Display each institute name with number of Courses, Average Cost per Course.
select Institute,COUNT(*) as total_courses,AVG(course_fee) as avg_fee from studies group by INSTITUTE

--37. Display each institute Name with Number of Students.
select institute,COUNT(*) as total_Student  from studies group by INSTITUTE

--38. Display Names of Male and Female Programmers. Gender also.
select PNAME,GENDER from programmer order by GENDER 

--39. Display the Name of Programmers and Their Packages.
select pname,title from software order by PNAME

--40. Display the Number of Packages in Each Language Except C and C++.
select developin,COUNT(TITLE) as no_pckg_lang  from software  where not (developin='c' or developin='c++') group by developin

--41. Display the Number of Packages in Each Language for which Development Cost is less than 1000.
select developin ,count(title)from software  where dcost < 1000 group by DEVELOPIN 

--42. Display AVG Difference between SCOST, DCOST for Each Package.
Select Title , (Avg(Dcost)-Avg(Scost)) as AVGdiff From Software group by title

--43. Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for Those Whose Cost has not yet been Recovered.
select *, scost*sold as total_scost, dcost ,dcost-scost*sold as amt_recover from software where dcost>scost*sold 

--44. Display Highest, Lowest and Average Salaries for those earning more than 2000.
select MAX(salary) as max_sal,MIN(salary) as min_sal,AVG(salary) as avg_sal from programmer where SALARY>2000

--45. Who is the Highest Paid C Programmers?
select * from programmer where salary=(select max(salary) from programmer where  PROF1='c' or PROF2='c')

--46. Who is the Highest Paid Female COBOL Programmer?
select pname from programmer where salary=(select max(salary) from programmer where  PROF1='cobol' or PROF2='cobol')and GENDER='f'

--47. Display the names of the highest paid programmers for each Language.
WITH PROGRAMMER_CTE(PNAME,SALARY,LANG)
		AS
		(SELECT PNAME,SALARY,PROF1 AS LANG
			FROM PROGRAMMER
			UNION
		SELECT PNAME,SALARY,PROF2
		FROM PROGRAMMER)
Select P1.Pname, p1.LANG, p1.Salary 
from PROGRAMMER_CTE as P1
left join PROGRAMMER_CTE as p2 on p1.LANG=P2.LANG and p1.Salary < p2.Salary
where P2.pname is null;

		

--48. Who is the least experienced Programmer.
SELECT PNAME,DOJ,EXP FROM
		(SELECT *,DATEDIFF(YEAR,DOJ,GETDATE()) AS EXP,DENSE_RANK() OVER(ORDER BY DATEDIFF(YEAR,DOJ,GETDATE())) AS RESULT
		FROM PROGRAMMER
		) AS P
		WHERE RESULT=1

--49. Who is the most experienced male programmer knowing PASCAL.
SELECT PNAME,GENDER,PROF1,PROF2,DOJ,EXP FROM
		(SELECT *,DATEDIFF(YEAR,DOJ,GETDATE()) AS EXP,DENSE_RANK() OVER(ORDER BY DATEDIFF(YEAR,DOJ,GETDATE()) DESC) AS RESULT
		FROM PROGRAMMER WHERE (PROF1='PASCAL' OR PROF2='PASCAL') AND GENDER='M'
		) AS P
		WHERE RESULT=1

--50. Which Language is known by only one Programmer?
With test(pname,p_lang) as
		(Select Pname, Prof1 as p_lang From PROGRAMMER
		union
		Select pname, prof2 from programmer)

	Select p_lang from test group by p_lang having Count(p_lang) = 1

	
	
--51. Who is the Above Programmer Referred in 50? --check,understand n do
Create Table langexpert
			(Prof varchar(20)
			)

Select * From langexpert

Insert into langexpert
			Select prof1 from PROGRAMMER
			group by PROF1
			having PROF1 not in(select Prof2 from PROGRAMMER)
			and count(prof1) = 1
			union 
			Select PROF2 from PROGRAMMER
			group by PROF2
			having PROF2 not in(select PROF1 from PROGRAMMER)
			and count(PROF2) = 1
	
Select Pname, prof from PROGRAMMER
			Inner join langexpert on prof=prof1 or prof=prof2

--52. Who is the Youngest Programmer knowing DBASE?
select PNAME,dob from programmer where dob=(select MAX(dob) from programmer where (PROF1='dbase' or PROF2='dbase'))

--53. Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE?
select pname,SALARY,GENDER, PROF1,PROF2 from programmer 
	where (gender ='F' and 
		       SALARY>=3000 and
		       PROF1<>'c' and
			   PROF1<>'c++' and
			   PROF1<>'oracle' and
			   PROF2<>'oracle' and 
			   PROF1<>'dbase' and
			   PROF2<>'dbase')
			   
--54. Which Institute has most number of Students?
select top 1 INSTITUTE,COUNT (pname) as total from studies group by institute order by INSTITUTE desc


--55. What is the Costliest course?
select *  from studies where COURSE_FEE=(select MAX(course_fee) from studies)

--56. Which course has been done by the most of the Students?
select top 2 course,COUNT(course)  as choice from studies group by COURSE order by choice desc

--57. Which Institute conducts costliest course.
select *  from studies where COURSE_FEE=(select MAX(course_fee) from studies)

--58. Display the name of the Institute and Course, which has below AVG course fee.
select *  from studies where COURSE_FEE<(select avg(course_fee) from studies)

--59. Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee,
select *  from studies where COURSE_FEE <(select avg(course_fee)+1000 from studies) and course_fee>(select avg(course_fee)-1000 from studies)

--60. Which package has the Highest Development cost?
select*from software where DCOST=(select MAX(DCOST) from software)

--61. Which course has below AVG number of Students?
Create table avg_c (c_course varchar(20), t_Cnt INT)

		INSERT INTO avg_c(c_course,t_cnt)
		Select COURSE, count(PNAME) as counted From STUDIES group by COURSE
		Select c_course,t_cnt from avg_c where t_Cnt <= (select avg(t_Cnt) from avg_c)
			
--62. Which Package has the lowest selling cost?
select top 2 title,scost from software order by SCOST asc

--63. Who Developed the Package that has sold the least number of copies?
select pname,title ,sold from software where SOLD=(select MIN(SOLD) from software)

--64. Which language has used to develop the package, which has the highest sales amount?
select top 5 pname,title,DEVELOPIN from software order By SOLD*SCOST

--65. How many copies of package that has the least difference between development and selling cost where sold.
SELECT TOP 1 DIFF,PNAME,TITLE,DCOST,SCOST,SOLD
		FROM (SELECT *,DCOST-SCOST AS DIFF FROM SOFTWARE) AS S
		ORDER BY DIFF

--66. Which is the costliest package developed in PASCAL.
select pname,title ,DEVELOPIN,DCOST from software where dcost=(select Max(DCOST) from software where DEVELOPIN='pascal')

--67. Which language was used to develop the most number of Packages.
--select title,developin,sold as max_pkg from software where SOLD=(select max(SOLD)from software)
Select top 1 DEVELOPIN, Count(TITLE) as countT From Software group by DEVELOPIN order by CountT desc

--68. Which programmer has developed the highest number of Packages?
SELECT *FROM software
select pname from software group by PNAME having pname =(select MAX(pname) from software)

--69. Who is the Author of the Costliest Package?
SELECT *FROM software
select pname,title,dcost from software where DCOST=(select MAX(DCOST) from software)

--70. Display the names of the packages, which have sold less than the AVG number of copies.
Select TITLE From Software where sold < (select avg(sold) from Software)

--71. Who are the authors of the Packages, which have recovered more than double the Development cost?
Select distinct PNAME From Software where 2*DCOST>=Scost*Sold


--72. Display the programmer Name and the cheapest packages developed by them in each language.
Select Pname, TITLE	from Software where dcost in (select min(dcost) from Software group by DEVELOPIN)

--73. Display the language used by each programmer to develop the Highest Selling and Lowest-selling package.

--74. Who is the youngest male Programmer born in 1965?
Select Pname, year(DOB) as Yearofbirth, GENDER, DATEDIFF(year,dob,getdate()) as age
		from PROGRAMMER
		where year(DOB) = '1965' and GENDER = 'M'

--75. Who is the oldest Female Programmer who joined in 1992?
Select Pname, year(DOJ) as joined, GENDER, DATEDIFF(year,DOJ,getdate()) as y_served
		from PROGRAMMER
		where year(DOJ) = '1992' and GENDER = 'F'

--76. In which year was the most number of Programmers born.
SELECT TOP 1 DATEPART(YEAR,DOB) YEAR_OF_BORN,count(Pname) COP
		FROM PROGRAMMER
		GROUP BY DATEPART(YEAR,DOB)
		ORDER BY COP DESC

--77. In which month did most number of programmers join?
SELECT TOP 1 DATENAME(MONTH,DOJ) MONTH_OF_JOIN,count(Pname) COP
		FROM PROGRAMMER
		GROUP BY DATENAME(MONTH,DOJ)
		ORDER BY COP DESC

--78. In which language are most of the programmer’s proficient.
create table Proff(prof varchar(20),cnt int)
		insert into Proff(prof,cnt)
		select Prof1,count(pname) from PROGRAMMER group by PROF1
		union all
		select Prof2,count(pname) from PROGRAMMER group by PROF2
		--Drop table proff2
		--Select * from Proff

		Create table proff2(pro varchar(20),cn int)
		Insert into proff2 (pro,cn)
		Select prof,sum(cnt) from Proff
		group by prof

		--Select * from Proff
		Select * from Proff2
		Where CN = (select max(CN) from Proff2)

--79. Who are the male programmers earning below the AVG salary of Female Programmers?
Select PNAME, GENDER From PROGRAMMER 
					 where SALARY < (select avg(salary) from PROGRAMMER where gender='F')
						   And Gender='m'

--80. Who are the Female Programmers earning more than the Highest Paid?
Select Pname, Salary From PROGRAMMER
		             where SALARY >= (select max(salary) from PROGRAMMER  )
						And Gender = 'F'
--if paid more than male
Select Pname, Salary From PROGRAMMER
		             where SALARY >= (select max(salary) from PROGRAMMER where gender ='m' )
						And Gender = 'F'

--81. Which language has been stated as the proficiency by most of the Programmers?
Select prof1 From PROGRAMMER
		group by prof1
		having prof1 = (select max(prof1) from PROGRAMMER)
		union
		Select Prof2 From PROGRAMMER
		group by PROF2
		having PROF2 = (select max(PROF2) from PROGRAMMER)

--82. Display the details of those who are drawing the same salary.
SELECT *
		FROM PROGRAMMER
		WHERE SALARY IN (SELECT SALARY
		FROM PROGRAMMER
		GROUP BY SALARY
		HAVING COUNT(SALARY)>1)
		ORDER BY SALARY DESC

--83. Display the details of the Software Developed by the Male Programmers Earning More than 3000/-.
Select * from PROGRAMMER p, Software s
		 where p.pname = s.pname and salary > 3000 and gender = 'M'

--84. Display the details of the packages developed in Pascal by the Female Programmers.
Select s.* From Software s, PROGRAMMER p
		   where s.pname = p.pname and s.DEVELOPIN = 'PAscal' and p.GENDER = 'F'

--85. Display the details of the Programmers who joined before 1990.
Select * From PROGRAMMER where year(DOJ)<1990

--86. Display the details of the Software Developed in C By female programmers of Pragathi.
Select s.* From Software s,STUDIES st,PROGRAMMER p
		   where S.pname = st.pname and p.pname = s.pname and Gender = 'F' and INSTITUTE ='pragathi' 

--87. Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise.
Select p.INSTITUTE, count(s.DEVELOPIN) as Developin,count(s.sold) as Sold, Sum(s.sold*s.scost) as Sales
		From STUDIES p, Software s
		where p.pname = s.PNAME
		group by p.INSTITUTE
--88. Display the details of the software developed in DBASE by Male Programmers, who belong to the institute in which most number of Programmers studied.
create Table NEW_Table(insti varchar(20), CNT int)
		Insert into NEW_Table
		Select institute, count(pname) from STUDIES
		Group by Institute
		
		Select * from NEW_Table

		Select distinct S.*,P.GENDER,ST.institute
		From PROGRAMMER  P
		INNER JOIN SOFTWARE S
		ON P.PNAME=S.PNAME
		INNER JOIN STUDIES ST
		ON S.PNAME=ST.PNAME
		INNER JOIN NEW_Table N
		ON ST.institute=N.insti
		Where S.DEVELOPIN = 'DBASE' and P.gender = 'M' 
			and CNT = (Select max(CNT) from NEW_Table)

--89. Display the details of the software Developed by the male programmers Born before 1965 and female programmers born after 1975.
Select s.*,Year(p.DOB), GENDER From Software s, PROGRAMMER p
		                       where s.pname=p.pname and ((GENDER='M' AND YEAR(DOB)<1965) OR (GENDER='F' AND YEAR(DOB)>1975))

--90. Display the details of the software that has developed in the language which is neither the first nor the second proficiency of the programmers.
Select s.* From PROGRAMMER p, Software s
		   where p.pname=s.pname and p.PROF1<>s.DEVELOPIN and p.prof2<>s.DEVELOPIN

--91. Display the details of the software developed by the male students of Sabhari.
Select s.* From Software s, STUDIES ST, PROGRAMMER P
		   where s.PNAME = ST.PNAME and p.pname = s.pname and gender = 'M' and st.INSTITUTE ='Sabhari' 

--92. Display the names of the programmers who have not developed any packages.
Select PNAME From PROGRAMMER where pname not in (Select Pname from Software)

--93. What is the total cost of the Software developed by the programmers of Apple?
Select Sum(Scost) as Totalcost from Software s, STUDIES st
		                       where s.PNAME = st.PNAME and st.INSTITUTE = 'APPLE'
--94. Who are the programmers who joined on the same day?
Select A.Pname,A.DOJ From PROGRAMMER A, PROGRAMMER B
		where a.doj = b.doj and A.pname<>b.pname

--95. Who are the programmers who have the same Prof2?
SELECT *
		FROM PROGRAMMER
		WHERE PROF2 IN (SELECT PROF2
		FROM PROGRAMMER
		GROUP BY PROF2
		HAVING COUNT(PROF2)>1)
		ORDER BY PROF2 DESC
--96. Display the total sales value of the software, institute wise.
Select St.institute, Sum(s.sold*s.SCOST) as Total_Sales_Value
		from STUDIES st, Software s
		Where st.pname = S.PNAME
		group by st.INSTITUTE

--97. In which institute does the person who developed the costliest package studied.
Select INSTITUTE From STUDIES st, Software s
		where st.pname = s.pname and DCOST = (Select Max(DCOST) from Software)
		group by INSTITUTE

--98. Which language listed in prof1, prof2 has not been used to develop any package.
Select Prof1 from PROGRAMMER where PROF1 not in (select developin from Software)
			Union
			Select Prof2 from PROGRAMMER where PROF2 not in (select developin from Software)

--99. How much does the person who developed the highest selling package earn and what course did HE/SHE undergo.
Select p.Pname, p.Salary,st.COURSE From PROGRAMMER p, STUDIES St
			Where p.pname =st.pname and p.Salary = (Select max(Salary) from PROGRAMMER)

--100. What is the AVG salary for those whose software sales is more than 50,000/-.
Select AVG(Salary) as AVGSAL from Software s, PROGRAMMER p
		where s.pname = P.pname and SCOST*SOLD>50000;

--101. How many packages were developed by students, who studied in institute that charge the lowest course fee?
SELECT S.PNAME,COUNT(s.TITLE) NO_OF_PACKAGES
		FROM SOFTWARE S
		INNER JOIN STUDIES ST
		ON S.PNAME=ST.PNAME
		WHERE ST.COURSE_FEE=(SELECT MIN(COURSE_FEE) FROM studies)
		GROUP BY S.PNAME

--102. How many packages were developed by the person who developed the cheapest package, where did HE/SHE study?
SELECT S.PNAME,COUNT(S.TITLE) NO_OF_PACKAGES,ST.institute
		FROM SOFTWARE S
		INNER JOIN STUDIES ST
		ON S.PNAME=ST.PNAME
		WHERE DCOST=(SELECT MIN(DCOST) FROM SOFTWARE)
		GROUP BY ST.institute,S.PNAME

--103. How many packages were developed by the female programmers earning more than the highest paid male programmer?
Select Count(DEVELOPIN) From Software s, PROGRAMMER p
		where s.pname = p.pname and  gender = 'F' and Salary>(select max(salary) from PROGRAMMER where gender = 'M')

--104. How many packages are developed by the most experienced programmer form BDPS.
Select P.PNAME,COUNT(S.TITLE) NO_OF_PACKAGES,ST.institute
		From PROGRAMMER P
		INNER JOIN SOFTWARE S
		ON P.PNAME=S.PNAME
		INNER JOIN STUDIES ST
		ON S.PNAME=ST.PNAME
		WHERE
		ST.institute='BDPS' AND
		DATEDIFF(YEAR,P.DOJ,GETDATE()) =(SELECT MAX(DATEDIFF(YEAR,DOJ,GETDATE())) FROM PROGRAMMER
		WHERE PNAME IN (SELECT PNAME FROM STUDIES WHERE institute='BDPS'))
		GROUP BY P.PNAME,ST.institute

--105. List the programmers (form the software table) and the institutes they studied.
Select PNAME as programmers, institute from STUDIES  where pname   in (Select pname from Software)

--106. List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF.
CREATE TABLE MY_NEW_TAB(PROF VARCHAR(15),CNT_OF_PGMMERS INT)
INSERT INTO MY_NEW_TAB
SELECT DISTINCT PROF1,COUNT(PNAME) NO_OF_PGMMERS
		FROM PROGRAMMER
		GROUP BY PROF1
		UNION
		SELECT DISTINCT PROF2,COUNT(PNAME)
		FROM PROGRAMMER
		GROUP BY PROF2

		SELECT * FROM MY_NEW_TAB

	SELECT N.PROF,COUNT(S.TITLE) NO_OF_PACKAGES 
		FROM NEW_TAB N
		INNER JOIN SOFTWARE S
		ON N.PROF=S.DEVELOPIN
		GROUP BY N.PROF
		

--107. List the programmer names (from the programmer table) and No. Of Packages each has developed.
Select P.pname, count(developin) as Developin From PROGRAMMER p, Software s
					where S.pname = P.pname group by p.pname
