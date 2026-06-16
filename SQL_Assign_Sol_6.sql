use assignment;
CREATE TABLE EmployeeDetail
(
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary INT,
    JoiningDate DATETIME,
    Department VARCHAR(50),
    Gender VARCHAR(10)
);

INSERT INTO EmployeeDetail
VALUES
(1,'Vikas','Ahlawat',600000,'2013-02-12 11:16:00','IT','Male'),
(2,'nikita','Jain',530000,'2013-02-14 11:16:00','HR','Female'),
(3,'Ashish','Kumar',1000000,'2013-02-14 11:16:00','IT','Male'),
(4,'Nikhil','Sharma',480000,'2013-02-15 11:16:00','HR','Male'),
(5,'anish','kadian',500000,'2013-02-16 11:16:00','Payroll','Male');
select * from EmployeeDetail;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1. Write a query to get all employee detail from "EmployeeDetail" table 
select * from EmployeeDetail;

--2. Write a query to get only "FirstName" column from "EmployeeDetail" table 
select FirstName from EmployeeDetail;

--3. Write a query to get FirstName in upper case as "First Name". 
select UPPER(FirstName) as FIRSTNAME from EmployeeDetail;

--4. Write a query to get FirstName in lower case as "First Name". 
select LOWER(FirstName) as firstname from EmployeeDetail;

--5. Write a query for combine FirstName and LastName and display it as "Name" (also include white space between first name & last name) 
select CONCAT(firstname, ' ' , lastname) as Name from EmployeeDetail;

--    i. Select employee detail whose name is "Vikas 
select * from EmployeeDetail where FirstName='Vikas';

--    ii. Get all employee detail from EmployeeDetail table whose "FirstName" start with latter 'a'. 
select * from EmployeeDetail where FirstName like 'a%';

--    iii. Get all employee detail from EmployeeDetail table whose "FirstName" start with latter 'n'. 
select * from EmployeeDetail where FirstName like 'n%';

--    iv. Get all employee details from EmployeeDetail table whose "FirstName" end with 'h' 
select * from EmployeeDetail where FirstName like '%h';

--6. Get all employee detail from EmployeeDetail table whose "FirstName" start with any single character between 'a-p' 
select * from EmployeeDetail where FirstName like '[a-p]%';

--7.  Get all employee detail from EmployeeDetail table whose "FirstName" not start with any single character between 'a-p' 
select * from EmployeeDetail where FirstName not like '[a-p]%';

--8.  Get all employee detail from EmployeeDetail table whose "Gender" end with 'le' and contain 4 letters. The Underscore(_) Wildcard Character represents any single character 
select * from EmployeeDetail where Gender like '__le';

--9.  Get all employee detail from EmployeeDetail table whose "FirstName" start with 'A' and contain 5 letters 
select * from EmployeeDetail where FirstName like 'a____';

--10. Get all employee detail from EmployeeDetail table whose "FirstName" containing '%'. ex:-"Vik%as".  
select * from EmployeeDetail where FirstName like '%[%]%';

--11. Get all unique "Department" from EmployeeDetail table 
select DISTINCT Department from EmployeeDetail;

--12. Get the highest "Salary" from EmployeeDetail table.  
select max(salary) as HIGHSALARY from EmployeeDetail;

--13. Get the lowest "Salary" from EmployeeDetail table  
select min(salary) as LOWSALARY from EmployeeDetail;

--14. Show "JoiningDate" in "dd mmm yyyy" format, ex- "15 Feb 2013 
select format(joiningdate,'dd MMM yyy') from EmployeeDetail;

--15. Show "JoiningDate" in "yyyy/mm/dd" format, ex- "2013/02/15" 
select format(JoiningDate,'yyyy/MM/dd') from EmployeeDetail;

--16. Show only time part of the "JoiningDate" 
select CONVERT(time,JoiningDate) from EmployeeDetail;

--17. Get only Year part of "JoiningDate" 
select YEAR(JoiningDate) from EmployeeDetail;

--18. Get only Month part of "JoiningDate” 
select MONTH(JoiningDate) from EmployeeDetail;

--19. Get system date 
select getdate();

--20. Get UTC date.a. Get the first name, current date, joiningdate and diff between current date and joining date in months. 
SELECT FirstName,GETDATE() AS CurrentDate,JoiningDate,DATEDIFF(MONTH,JoiningDate,GETDATE()) AS MonthsDiff FROM EmployeeDetail;

--21. Get the first name, current date, joiningdate and diff between current date and joining date in days. 
SELECT FirstName,GETDATE() AS CurrentDate,JoiningDate,DATEDIFF(DAY,JoiningDate,GETDATE()) AS DayDiff FROM EmployeeDetail;

--22.  Get all employee details from EmployeeDetail table whose joining year is 2013 
select * from EmployeeDetail where year(JoiningDate)='2013';

--23. Get all employee details from EmployeeDetail table whose joining month is Jan(1) 
select * from EmployeeDetail where MONTH(JoiningDate)=1;

--24. Get all employee details from EmployeeDetail table whose joining month is feb(2) 
select * from EmployeeDetail where MONTH(JoiningDate)=2;

--25. Get how many employee exist in "EmployeeDetail" table 
select COUNT(EmployeeID) as totalemployee from EmployeeDetail;

--26. Select only one/top 1 record from "EmployeeDetail" table 
select top 1 * from EmployeeDetail;

--27. Select all employee detail with First name "Vikas","Ashish", and "Nikhil". 
select * from EmployeeDetail where FirstName in ('vikas','ashish','nikhil');

--28. Select all employee detail with First name not in "Vikas","Ashish", and "Nikhil" 
select * from EmployeeDetail where FirstName not in ('vikas','ashish','nikhil');

--29. Select first name from "EmployeeDetail" table after removing white spaces from right side 
select RTRIM(FirstName) from EmployeeDetail;

--30. Select first name from "EmployeeDetail" table after removing white spaces from left side 
select LTRIM(FirstName) from EmployeeDetail;

--31. Display first name and Gender as M/F.(if male then M, if Female then F) 
select FirstName,
case
when Gender='Male' then 'M'
when Gender='Female' then 'F'
end as gender
from EmployeeDetail;

--32. Select first name from "EmployeeDetail" table prifixed with "Hello 
select 'Hello ' + FirstName as prifixed from EmployeeDetail;

--33. Get employee details from "EmployeeDetail" table whose Salary greater than 600000 
select * from EmployeeDetail where Salary > 600000;

--34. Get employee details from "EmployeeDetail" table whose Salary less than 700000 
select * from EmployeeDetail where Salary < 700000;

--35. Get employee details from "EmployeeDetail" table whose Salary between 500000 than 600000
select * from EmployeeDetail where Salary between 500000 and 600000;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Create ProjectDetail Table and insert records in the table
CREATE TABLE ProjectDetail
(
    ProjectDetailID INT PRIMARY KEY,
    EmployeeDetailID INT,
    ProjectName VARCHAR(100)
);
INSERT INTO ProjectDetail
VALUES
(1,1,'Task Track'),
(2,1,'CLP'),
(3,1,'Survey Management'),
(4,2,'HR Management'),
(5,3,'Task Track'),
(6,3,'GRS'),
(7,3,'DDS'),
(8,4,'HR Management'),
(9,6,'GL Management');

--1. Give records of ProjectDetail table 
select * from ProjectDetail;

--2. Write the query to get the department and department wise total(sum) salary from "EmployeeDetail" table. 
select Department,sum(salary) as totalsalary from EmployeeDetail group by Department;

--3. Write the query to get the department and department wise total(sum) salary, display it in ascending order according to salary. 
select Department,sum(salary) as totalsalary from EmployeeDetail group by Department order by totalsalary asc;

--4. Write the query to get the department and department wise total(sum) salary, display it in descending order according to salary 
select Department,sum(salary) as totalsalary from EmployeeDetail group by Department order by totalsalary desc;

--5. Write the query to get the department, total no. of departments, total(sum) salary with respect to department from "EmployeeDetail" table. 
select Department,COUNT(*) as total_dept,sum(salary) as totalsalary from EmployeeDetail group by Department;

--6. Get department wise average salary from "EmployeeDetail" table order by salary ascending 
select Department,AVG(Salary) as AVGSALARY from EmployeeDetail group by  Department order by AVGSALARY asc;

--7. Get department wise maximum salary from "EmployeeDetail" table order by salary ascending 
select Department,MAX(Salary) as MAXSALARY from EmployeeDetail group by Department order by MAXSALARY asc;

--8. Get department wise minimum salary from "EmployeeDetail" table order by salary ascending. 
select Department,Min(Salary) as MINSALARY from EmployeeDetail group by Department order by MINSALARY asc;

--9. Get department wise minimum salary from "EmployeeDetail" table order by salary descending 
select Department,Min(Salary) as MINSALARY from EmployeeDetail group by Department order by MINSALARY desc;

--10. Join both the table that is Employee and ProjectDetail based on some common paramter 
select * from EmployeeDetail E inner join ProjectDetail P on E.EmployeeID = P.EmployeeDetailID;

--11. Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for those employee which have assigned project already. 
select E.FirstName,P.ProjectName from EmployeeDetail E inner join ProjectDetail P on E.EmployeeID = P.EmployeeDetailID order by e.FirstName;

--12. Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee even they have not assigned project. 
select e.FirstName,p.ProjectName from EmployeeDetail e left join ProjectDetail p on e.EmployeeID = p.EmployeeDetailID order by e.FirstName;

--13. Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee if project is not assigned then display "-No Project Assigned" 
select e.FirstName, ISNULL(P.ProjectName,'No Project Assigned') AS ProjectName from EmployeeDetail e left join ProjectDetail p on e.EmployeeID = p.EmployeeDetailID order by e.FirstName;

--14. Get all project name even they have not matching any employeeid, in left table, order by firstname from "EmployeeDetail" and "ProjectDetail 
select e.FirstName,p.ProjectName from EmployeeDetail e right join ProjectDetail p on e.EmployeeID = p.EmployeeDetailID order by e.FirstName;

--15. Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL 
select e.FirstName,p.ProjectName from EmployeeDetail e full outer join ProjectDetail p on e.EmployeeID = p.EmployeeDetailID;

--16. Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL 
select * from EmployeeDetail e full outer join ProjectDetail p on e.EmployeeID = p.EmployeeDetailID;

--17. Write down the query to fetch EmployeeName & Project who has assign more than one project 
select e.FirstName, COUNT(p.ProjectName) as totalproject from EmployeeDetail e  inner join ProjectDetail p on e.EmployeeID = p.EmployeeDetailID 
group by e.FirstName having COUNT(p.ProjectName) >1;

--19. Write down the query to fetch ProjectName on which more than one employee are working along with EmployeeName 
select p.ProjectName,count(e.FirstName) as totalemployee from EmployeeDetail e inner join ProjectDetail p on e.EmployeeID = p.EmployeeDetailID
group by p.ProjectName having count(e.FirstName) > 1;

SELECT P.ProjectName,STRING_AGG(E.FirstName, ', ') AS EmployeeNames FROM EmployeeDetail E INNER JOIN ProjectDetail P ON E.EmployeeID = P.EmployeeDetailID
GROUP BY P.ProjectName HAVING COUNT(DISTINCT E.EmployeeID) > 1;

--20. Apply Cross Join in Both the tables
select * from EmployeeDetail cross join ProjectDetail;
