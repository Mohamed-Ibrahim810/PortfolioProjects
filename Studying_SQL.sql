
--#######################################################* THE BASICS *##############################################################

--CREATE TABLE EmployeeDemoGraphics(
--EmployeeID int,
--FirstName varchar(50),
--LastName varchar(50),
--Age int,
--Gender varchar(50)
--)

--CREATE TABLE EmployeeSalary(
--EmployeeID int,
--JobTitle varchar(50),
--salary int
--)
------------------------------------------------------------------------------------------------

--INSERT INTO EmployeeDemoGraphics VALUES
--(1104,'mohamed','ibrahim','19',Male),
--(1001, 'Jim', 'Halpert', 30, 'Male'),
--(1002, 'Pam', 'Beasley', 30, 'Female'),
--(1003, 'Dwight', 'Schrute', 29, 'Male'),
--(1004, 'Angela', 'Martin', 31, 'Female'),
--(1005, 'Toby', 'Flenderson', 32, 'Male'),
--(1006, 'Michael', 'Scott', 35, 'Male'),
--(1007, 'Meredith', 'Palmer', 32, 'Female'),
--(1008, 'Stanley', 'Hudson', 38, 'Male'),
--(1009, 'Kevin', 'Malone', 31, 'Male')

--Insert Into EmployeeSalary VALUES
--(1104,'warehouse worker',22000),
--(1001, 'Salesman', 45000),
--(1002, 'Receptionist', 36000),
--(1003, 'Salesman', 63000),
--(1004, 'Accountant', 47000),
--(1005, 'HR', 50000),
--(1006, 'Regional Manager', 65000),
--(1007, 'Supplier Relations', 41000),
--(1008, 'Salesman', 48000),
--(1009, 'Accountant', 42000)
-------------------------------------------------------------------------------------------------

-- select Statments: *, Specific column, Top, Distinct, Count, As, Max, Min, Avg, Database

--select*from EmployeeDemoGraphics
--select FirstName from EmployeeDemoGraphics

--select Top 5*from EmployeeDemoGraphics

--select Distinct(EmployeeID) from EmployeeDemoGraphics :shows up the unique value in the specific column
--select Distinct(Gender) from EmployeeDemoGraphics

--select count(LastName) As LastNameCount from EmployeeDemoGraphics
--         |                     |
--	       *                     *
--     counting the             Name
--   specific coloumn     the returned column 

--select max(salary) from EmployeeSalary :65000
--select min(salary) from EmployeeSalary :22000
--select avg(salary) from EmployeeSalary :45900

--select * from [SQL-Course].dbo.EmployeeSalary
-------------------------------------------------------------------------------------------------

--where statment: =, <>, <, >, And, Or, Like, Null, Not null, In
--select*from EmployeeDemoGraphics
--WHERE FirstName = 'toby' -----> Where first name equal ''
--select*from EmployeeDemoGraphics
--WHERE FirstName <> 'toby' -----> Where first name doesn't equal ''

--select*from EmployeeDemoGraphics
--where Age>=30 And Gender='male'
--select*from EmployeeDemoGraphics
--where Age>30 OR Gender='male'

--select*from EmployeeDemoGraphics
--where LastName Like 'm%a%' -----> m%(First letter), %m(Last letter), %m%(Anywhere letter)   

--select*from EmployeeDemoGraphics
--where FirstName is Null -----> return any null first name
--select*from EmployeeDemoGraphics
--where FirstName is not Null -----> return every not null first name

--select*from EmployeeDemoGraphics
--where FirstName in ('mohamed','pam') -----> It's a way to say equal for multiple things
-------------------------------------------------------------------------------------------------

----Group By, Order By:The GROUP BY statement groups rows that have the same values into summary rows,
--like "find the number of customers in each country".
--The GROUP BY statement is often used with aggregate functions
--(COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set by one or more columns.

--select * from EmployeeSalary order by salary desc
--select salary,JobTitle, count (salary)
--from EmployeeSalary group by salary,JobTitle
--order by JobTitle asc
-------------------------------------------------------------------------------------------------------------------------------------
--#######################################################* INTERMEDIATE *############################################################

 --JOIN clause is used to combine rows from two or more tables,
 --based on a related column between them.
 --(INNER) JOIN: Returns records that have matching values in both tables.

 --LEFT (OUTER) JOIN: Returns all records from the left table,
 --and the matched records from the right table.

 --RIGHT (OUTER) JOIN: Returns all records from the right table,
 --and the matched records from the left table.

 --FULL (OUTER) JOIN: Returns all records when there is a match in either left or right table.
 
 --select*
 --from EmployeeDemoGraphics
 --full outer join EmployeeSalary on EmployeeDemoGraphics.EmployeeID = EmployeeSalary.EmployeeID

-- create table WareHouseEmployee (
-- EmployeeID int,
-- Firstname varchar(50),
-- Lastname varchar(50),
-- Age int,
-- Gender varchar(10)
-- )
-- Insert into WareHouseEmployee values
--(1013,'Darryl','Philbin',NULL,'Male'),
--(1050,'Roy','Anderson',31,'Male'),
--(1051,'Hidetoshi','Hasagawa',40,'Male'),
--(1052,'Val','Johnson',31,'Female')
-------------------------------------------------------------------------------------------------

--The UNION operator is used to combine the result-set of two or more SELECT statements.

--Every SELECT statement within UNION must have the same number of columns
--The columns must also have similar data types
--The columns in every SELECT statement must also be in the same order

--UNION--> Remove the duplicates.
--UNION All--> show all results including duplicates.

--insert into WareHouseEmployee values
--(1104,'mohamed','ibrahim','19','Male')
--select * from WareHouseEmployee

--select * from EmployeeDemoGraphics
--union 
--select* from WareHouseEmployee
--order by EmployeeID
-------------------------------------------------------------------------------------------------

--The CASE--> expression goes through conditions and returns a value when
--the first condition is met (like an if-then-else statement). So,
--once a condition is true, it will stop reading and return the result.
--If no conditions are true, it returns the value in the ELSE clause.

--If there is no ELSE part and no conditions are true, it returns NULL.

--select FirstName, LastName, Age,
--case
--when Age > 30 then 'old'
--when Age <= 29 then 'baby'
--else 'young'
--end
--from EmployeeDemoGraphics
--order by Age

--select FirstName, LastName, Age, salary, JobTitle from EmployeeDemoGraphics
--join
--EmployeeSalary on EmployeeDemoGraphics.EmployeeID = EmployeeSalary.EmployeeID
--order by salary

--select FirstName, LastName, Age, salary, JobTitle, 
--case
--when JobTitle='salesman' then salary+(salary*0.2)
--when JobTitle='Accountant' then salary+(salary*0.1)
--else salary+(salary*0.07)
--end as	NewSalary
--from EmployeeDemoGraphics
--join EmployeeSalary on EmployeeDemoGraphics.EmployeeID = EmployeeSalary.EmployeeID 
--order by salary
-------------------------------------------------------------------------------------------------

--The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.

--select JobTitle ,COUNT(JobTitle) as Jobs from EmployeeSalary
--where COUNT(JobTitle)>1                                           ((WRONG))
--group by JobTitle

--Aggregate functions work on sets of data. A WHERE clause doesn't have access to entire set,
--but only to the row that it is currently working on.

--select JobTitle ,COUNT(JobTitle) as Jobs from EmployeeSalary
--group by JobTitle                                                 ((TRUE))
--having COUNT(JobTitle)>1
-------------------------------------------------------------------------------------------------

--Updating/Deleting Data

--select * from EmployeeDemoGraphics

--update EmployeeDemoGraphics
--set EmployeeID = 1010, Age = 32
--where FirstName= 'kevin'

--delete from EmployeeDemoGraphics
--where EmployeeID = 1010               WARNING!!!: BE CAREFUL YOU CAN'T REVERSE THE DELETE STATMENT.
                                                  --TYPE (SELECT) BEFORE DELETE TO KNOW WHAT ARE U DELETING.

--insert into EmployeeDemoGraphics values (1009, 'Kevin', 'Malone', 31, 'Male')
-------------------------------------------------------------------------------------------------

--Aliasing: SQL aliases are used to give a table, or a column in a table, a temporary name.
--Aliases are often used to make column names more readable.
--An alias only exists for the duration of that query.
--An alias is created with the AS keyword.

--select FirstName As Fname from EmployeeDemoGraphics

--AS is Optional
--Actually, in most database languages, you can skip the AS keyword and get the same result:

--select FirstName Fname from EmployeeDemoGraphics

--SELECT  FirstName+' '+LastName as fullname from EmployeeDemoGraphics

--select demo.EmployeeID, sal.JobTitle
--from EmployeeDemoGraphics as demo                          (Changing tabels names temporary)
--join EmployeeSalary as sal
--on demo.EmployeeID = sal.EmployeeID
-------------------------------------------------------------------------------------------------

--PARTITION BY clause is used to partition rows of table into groups.
--It is useful when we have to perform a calculation
--on individual rows of a group using other rows of that group.

--select FirstName, LastName, Gender, salary,
--count (gender) over (partition by gender) as totalgender
--from EmployeeDemoGraphics
--join EmployeeSalary
--on EmployeeDemoGraphics.EmployeeID = EmployeeSalary.EmployeeID

--select Gender, count(gender) as totalgender
--from EmployeeDemoGraphics
--group by Gender

--select FirstName, LastName, Gender, count(gender) as totalgender
--from EmployeeDemoGraphics
--group by FirstName, LastName, Gender
-------------------------------------------------------------------------------------------------------------------------------------
--#######################################################* ADVANCED *############################################################

--The Common Table Expressions (CTE)---> were introduced into standard SQL in order to simplify various classes of SQL Queries
--for which a derived table was just unsuitable.

--A common table [deprecated]CTE is a powerful SQL construct that helps simplify queries.
--CTEs act as virtual tables (with records and columns)
--that are created during query execution, used by the query, and deleted after the query executes.

--Why do we use it ?
--simplification
--readability
--reusability
--Troubleshooting

--with less_salary50k As
--(select FirstName, LastName, Gender, Salary
--from EmployeeSalary
--join EmployeeDemoGraphics
--on EmployeeDemoGraphics.EmployeeID = EmployeeSalary.EmployeeID
--where salary < 50000)

--select FirstName, LastName, Salary, Gender
--from less_salary50k
-------------------------------------------------------------------------------------------------

--Temporary Tables---> Temporary Tables are Created in TempDB
--and are automatically deleted as soon as the last connection is terminated.
--Temporary Tables helps us to store and process intermediate results.
--Temporary tables are very useful when we need to store temporary data.

 --Temp tabels are created the same way as the permanent tabele, 
 --the deffrence is that U put (#) before the table name.

 --create table #temp_table
 --(EmployeeID int,
 --JobTitle varchar(50),
 --salary int
 --)

 --select * from #temp_table

 --insert into #temp_table values
 --(1001,'HR',43500)

 --delete from #temp_table
 --where EmployeeID = 1002

 -- insert into #temp_table
 -- select * from EmployeeSalary

 --That was basic syntax.

-- DROP table if exists #temp_employee2
--Create table #temp_employee2 (
--JobTitle varchar(50),
--EmployeesPerJob int ,
--AvgAge int,
--AvgSalary int
--)

--Insert into #temp_employee2
--SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
--FROM EmployeeDemographics emp
--JOIN EmployeeSalary sal
--	ON emp.EmployeeID = sal.EmployeeID
--group by JobTitle

-- select * from #temp_employee2
-------------------------------------------------------------------------------------------------

--String functions are used to perform an operation on input string and return an output string.
 --TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower

--Drop Table EmployeeErrors;


--CREATE TABLE EmployeeErrors (
--EmployeeID varchar(50)
--,FirstName varchar(50)
--,LastName varchar(50)
--)

--Insert into EmployeeErrors Values 
--('1001  ', 'Jimbo', 'Halbert')
--,('  1002', 'Pamela', 'Beasely')
--,('1005', 'TOby', 'Flenderson - Fired')

--Select *
--From EmployeeErrors

-- Using Trim, LTRIM, RTRIM

--select EmployeeID , Trim(EmployeeID) as IDtrim        
--from EmployeeErrors
 --Trim---> remove all blank spaces	

--select EmployeeID , Rtrim(EmployeeID) as IDrtrim        
--from EmployeeErrors
 --Rtrim---> remove Right side blank spaces	

--select EmployeeID , Ltrim(EmployeeID) as IDltrim        
--from EmployeeErrors
 --Ltrim---> remove Left side blank spaces	


-- Using Replace

--select LastName, replace(LastName,' - Fired','') as LastNameFix
--from EmployeeErrors


-- Using Substring

--select SUBSTRING(FirstName,1,3)
--from EmployeeErrors

--select err.FirstName, SUBSTRING(err.FirstName,1,3), dem.FirstName, SUBSTRING(dem.FirstName,1,3)
--from EmployeeErrors err
--join
--EmployeeDemoGraphics dem
--on SUBSTRING(err.FirstName,1,3) = SUBSTRING(dem.FirstName,1,3)

--gender
--lastname
--age
--date of birth


-- Using UPPER and lower

--select FirstName, lower(FirstName)        lower all the letters
--from EmployeeErrors


--select FirstName, upper(FirstName)        uppere all the letters
--from EmployeeErrors
-------------------------------------------------------------------------------------------------

--A stored procedure---> is a prepared SQL code that you can save, so the code can be reused over and over again.
--So if you have an SQL query that you write over and over again,
--save it as a stored procedure, and then just call it to execute it.
--You can also pass parameters to a stored procedure,
--so that the stored procedure can act based on the parameter value(s) that is passed.

--creating
--create procedure Test1
--as
--select * from EmployeeDemoGraphics  ---> The SQL query   

--How to use?
--exec Test1    ---> Calling


--create procedure Temp_employee
--as
--DROP table if exists #temp_employee2
--Create table #temp_employee2 (
--JobTitle varchar(50),
--EmployeesPerJob int ,
--AvgAge int,
--AvgSalary int
--)

--Insert into #temp_employee2
--SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
--FROM EmployeeDemographics emp
--JOIN EmployeeSalary sal
--	ON emp.EmployeeID = sal.EmployeeID
--group by JobTitle

--select * from #temp_employee2


--exec Temp_employee @JobTitle = 'Salesman'
-------------------------------------------------------------------------------------------------

--Subquery can be simply defined as a query within another query.
--In other words we can say that a Subquery is a query that is embedded in WHERE clause of another SQL query.

--You can place the Subquery in a number of SQL clauses: WHERE clause, HAVING clause, FROM clause.
--Subqueries can be used with SELECT, UPDATE, INSERT, DELETE statements along with expression operator.
--It could be equality operator or comparison operator such as =, >, =, <= and Like operator.

--A subquery is a query within another query.
--The outer query is called as main query and inner query is called as subquery.

--Subquery must be enclosed in parentheses.
--Subqueries are on the right side of the comparison operator.
--Use single-row operators with single row Subqueries.Use multiple-row operators with multiple-row Subqueries.

--The subquery generally executes first when the subquery doesn’t have any co-relation with the main query,
--when there is a co-relation the parser takes the decision on the fly
--on which query to execute on precedence and uses the output of the subquery accordingly.



 --Subqueries (the Select, From, and Where Statement)


--Select EmployeeID, JobTitle, Salary
--From EmployeeSalary

-- Subquery in Select

--select *, (select AVG(salary) from EmployeeSalary) as avgSalary from EmployeeSalary

-- How to do it with Partition By

--select *, AVG(salary) over() as avgSalary from EmployeeSalary


-- Why Group By doesn't work

--select EmployeeID,salary, AVG(salary)as avgSalary
--from EmployeeSalary
--group by EmployeeID,salary
--order by 1,2,3

-- Subquery in From

--Select a.EmployeeID, AllAvgSalary
--From 
--	(Select EmployeeID, Salary, AVG(Salary) over () as AllAvgSalary
--	 From EmployeeSalary) a
--Order by a.EmployeeID


---- Subquery in Where

--Select EmployeeID, JobTitle, Salary
--From EmployeeSalary
--where EmployeeID in (
--	Select EmployeeID 
--	From EmployeeDemographics
--	where Age > 30)





