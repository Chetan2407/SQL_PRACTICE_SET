create database ORG;
show databases;
use ORG;

create table Worker (
	WORKER_ID int not null primary key auto_increment,
    FIRST_NAME char(25),
    LAST_NAME char(25),
    SALARY int (25),
    JOINING_DATA datetime,
    DEPARTMENT char (25));
    
Insert into Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATA, DEPARTMENT)
values(001,'Monika','Arora',100000,'14-02-20 09.00.00','HR'),
	  (002,'Niharika','Verma',8000,'14-06-11 09.00.00','Admin'),
      (003,'Vishal','Singhal',30000,'14-02-20 09.00.00','HR'),
      (004,'Amitabh','Singh',50000,'14-02-20 09.00.00','Account'),
      (005,'Vivek','Bharti',50000,'14-06-11 09.00.00', 'Admin'),
      (006,'Vipul','Diwan',20000,'14-06-11 09.00.00', 'Account'),
      (007,'satish','Kumar',75000,'14-01-20 09.00.00','Account'),
      (008,'Geetika','Chauhan',90000,'14-04-11 09.00.00','Admin');
      
select * from Worker;

create table Bonus(
			WORKER_REF_ID INT,
            BONUS_AMOUNT INT(10),
            BONUS_DATE DATETIME,
            FOREIGN KEY (WORKER_REF_ID)
				REFERENCES Worker(WORKER_ID)
			ON DELETE CASCADE );
            
insert into Bonus (WORKER_REF_ID, bONUS_AMOUNT,BONUS_DATE)
VALUES		(001,5000,'16-02-20'),
			(002,3000,'16-06-11'),
			(003,4000,'16-02-20'),
			(001,4500,'16-02-20'),
			(002,3500,'16-06-11');
            
select * from Bonus;

CREATE TABLE Title (
		WORKER_REF_ID INT,
        WORKER_TITLE CHAR (25),
        AFFECTED_FROM DATETIME,
        FOREIGN KEY (WORKER_REF_ID)
			REFERENCES Worker (WORKER_ID)
		ON DELETE  CASCADE);
        
INSERT INTO Title
		(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) 
VALUES	(001,'Manager','2016-02-20 00:00:00'),
		(002,'Executive','2016-06-11 00:00:00'),
        (008,'Executive','2016-06-11 00:00:00'),
        (005,'Manager','2016-06-11 00:00:00'),
        (004,'Asst. Manager','2016-06-11 00:00:00'),
        (007,'Execcutive', '2016-06-11 00:00:00'),
        (006,'Lead','2016-06-11 00:00:00'),
        (003,'Lead','2016-06-11, 00:00:00');
        
select * from Title;

-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.

select FIRST_NAME AS WORKER_NAME from Worker;

-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.

select UPPER(FIRST_NAME) from Worker;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.

select distinct(DEPARTMENT) from Worker;


-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.

select substring(FIRST_NAME,1,3) FROM Worker

-- Q-5. Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Amitabh’ from Worker table.

select INSTR(FIRST_NAME,'b') from Worker 
where FIRST_NAME='Amitabh'

-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.

select RTRIM(FIRST_NAME) from Worker

-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.

select LTRIM(DEPARTMENT) FROM Worker

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.

select distinct(DEPARTMENT), length(DEPARTMENT) AS LENGTH_OF_DEPARTMENT from Worker

-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.

select replace(FIRST_NAME,'a','A') from Worker

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them.

select CONCAT(FIRST_NAME,' ',LAST_NAME) AS Full_name from Worker

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.

select * from Worker
order by FIRST_NAME ASC

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.

select * from Worker
order by FIRST_NAME ASC ,DEPARTMENT DESC

-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.

select * from Worker
where FIRST_NAME in('Vipul','Satish')

-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.

select * from Worker
where FIRST_NAME not in ('Vipul','Satish')

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.

select * from Worker
where DEPARTMENT = 'Admin'

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.

select * from Worker
where FIRST_NAME like '%a%'


-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.

select * from Worker
where FIRST_NAME like '%a'


-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.

select * from Worker
where FIRST_NAME like '_____h' 


-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.

select * from Worker
where SALARY between '10000' and '50000'

-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.

select * from Worker
where JOINING_DATA BETWEEN '2014-02-01' AND '2014-02-28';


-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.

select DEPARTMENT, count(DEPARTMENT) FROM Worker
where DEPARTMENT = 'Admin'

-- Q-22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.

select concat(FIRST_NAME,' ',LAST_NAME) AS FULL_NAME from Worker
where SALARY BETWEEN '50000' AND '100000'

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.

select DEPARTMENT, count(worker_id) AS NUMBER_OF_WORKER FROM Worker
GROUP BY DEPARTMENT
order by NUMBER_OF_WORKER DESC;

-- Q-24. Write an SQLworkertitle query to print details of the Workers who are also Managers.

select Worker.* from Worker
inner join title on
Worker.worker_id = title.WORKER_REF_ID
where  WORKER_TITLE = 'Manager'

-- Q-25. Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.

SELECT WORKER_TITLE, COUNT(*) FROM title
group by WORKER_TITLE
having count(*)>1

-- Q-26. Write an SQL query to show only odd rows from a table.

select * from Worker where MOD(WORKER_ID, 2) != 0

-- Q-27. Write an SQL query to show only even rows from a table. 

select * from Worker where MOD(WORKER_ID,2) = 0

-- Q-28. Write an SQL query to clone a new table from another table.

create table worker_clone like Worker;
INSERT INTO worker_clone select * from Worker;

-- Q-29. Write an SQL query to fetch intersecting records of two tables.



-- Q-30. Write an SQL query to show records from one table that another table does not have.
-- MINUS

select Worker.* from Worker left join worker_clone using(WORKER_ID) WHERE worker_clone.WORKER_ID is NULL;

-- Q-31. Write an SQL query to show the current date and time.
-- DUAL

select now();

-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.

Select * from worker order by salary desc LIMIT 5;

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.

select * from worker order by salary desc LIMIT 4,1;

-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.

select salary from Worker w1
WHERE 4 = (
SELECT COUNT(DISTINCT (w2.salary))
from worker w2
where w2.salary >= w1.salary
);
 
-- Q-35. Write an SQL query to fetch the list of employees with the same salary.

select w1.* from Worker w1, Worker w2 where w1.SALARY = w2.SALARY and w1.WORKER_ID != w2.WORKER_ID

-- Q-36. Write an SQL query to show the second highest salary from a table using sub-query.

select max(SALARY) from Worker where salary not in (select max(SALARY) FROM Worker);

-- Q-37. Write an SQL query to show one row twice in results from a table.

select * from Worker
UNION ALL
select * from Worker ORDER BY WORKER_ID;

-- Q-38. Write an SQL query to list worker_id who does not get bonus.

select WORKER_ID from Worker where WORKER_ID not in (select WORKER_REF_ID from bonus)

-- Q-39. Write an SQL query to fetch the first 50% records from a table.

select * from Worker where WORKER_ID <= (SELECT count(WORKER_ID)/2 FROM Worker)

-- Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.

select DEPARTMENT, COUNT(DEPARTMENT) AS DEP_COUNT from Worker group by DEPARTMENT having DEP_COUNT < 4;

-- Q-41. Write an SQL query to show all departments along with the number of people in there.

select DEPARTMENT, count(DEPARTMENT) AS DEP_COUNT from Worker group by DEPARTMENT;

-- Q-42. Write an SQL query to show the last record from a table.

select * from Worker where WORKER_ID = (select max(WORKER_ID) from Worker);

-- Q-43. Write an SQL query to fetch the first row of a table.

select * from Worker where WORKER_ID = (select min(WORKER_ID) from Worker);


-- Q-44. Write an SQL query to fetch the last five records from a table.

(select * from Worker order by WORKER_ID desc limit 5) order by WORKER_ID;

-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.

SELECT FIRST_NAME, DEPARTMENT, SALARY
FROM Worker
WHERE (DEPARTMENT, SALARY) IN (
    SELECT DEPARTMENT, MAX(SALARY)
    FROM Worker
    GROUP BY DEPARTMENT
);

-- Q-46. Write an SQL query to fetch three max salaries from a table using co-related subquery

SELECT DISTINCT SALARY
FROM Worker W1
WHERE 3 > (SELECT COUNT(DISTINCT SALARY)
           FROM Worker W2
           WHERE W2.SALARY > W1.SALARY)
ORDER BY SALARY DESC;

-- Q-47. Write an SQL query to fetch three min salaries from a table using co-related subquery

select distinct salary from worker w1
where 3 >= (select count(distinct salary) from worker w2 where w1.salary >= w2.salary) order by w1.salary desc;


-- Q-48. Write an SQL query to fetch departments along with the total salaries paid for each of them.

select department , sum(salary) as depSal from worker group by department order by depSal desc;

-- Q-49. Write an SQL query to fetch the names of workers who earn the highest salary.

select first_name, salary from worker where salary = (select max(Salary) from worker);