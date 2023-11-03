/********************************************** TASK 1 *****************************/
--                      TOP 5 CITIES WITH HIGHEST NUMBER OF EMPLOYEES             --
-- Used INNER JOINS to combine the three tables and filter based on conditions --
-- Used the COUNT AGGREGATE FUNCTION to display Number Of Employees per City --
-- Used GROUP BY and ORDER BY to further sort the results --
-- Used LIMIT to only show the Top 5 Cities --
-- The Top Cities with Highest Number of Employees all have 106 employees --
SELECT l.city, COUNT(employee_id) as 'Number of Employees'
FROM employees as e
INNER JOIN departments as d
ON e.department_id = d.department_id
INNER JOIN locations as l
ON d.location_id = l.location_id
GROUP BY l.city
ORDER BY COUNT(employee_id) desc
LIMIT 5;
/********************************************** TASK 2 ***************************************/
-- LIST FIRST NAME, LAST NAME, COUNTRIES, CITIES, DEPARTMENTS, SALARIES FROM TASK 1 EMPLOYEES  --
-- Used INNER JOINS, WHERE and IN to join the three table and filter the data --
-- Used ORDER BY to further sort the results --
SELECT e.first_name, e.last_name, e.salary, l.city,
c.country_name, d.department_name
FROM employees as e
INNER JOIN departments as d
ON e.department_id = d.department_id
INNER JOIN locations as l
ON l.location_id = d.location_id
INNER JOIN countries as c
ON c.country_id = l.country_id
WHERE l.city in ('South SanFrancisco','Oxford', 'Seattle','Southlake', 'Toronto' )
order by e.salary desc;
/********************************************** TASK 3 *****************************/
--                              LIST CITIES WITH LESS THAN 10 EMPLOYEES           --
-- Used INNER JOINS and HAVING to combine the tables and filter based on conditions  --
-- Used GROUP BY and ORDER BY to further sort the results --
-- Southlake has the highest number of employees out of the 4 cities --
SELECT l.city, COUNT(e.employee_id) as 'Number of Employees'
FROM employees as e
INNER JOIN departments as d
ON e.department_id = d.department_id
INNER JOIN locations as l
ON l.location_id = d.location_id
GROUP BY l.city
HAVING COUNT(e.employee_id) < 10
ORDER BY COUNT(e.employee_id) desc;
/********************************************** TASK 4 *****************************/
--      FIND AVERAGE EXPERIENCE IN YEARS OF EMPLOYEES OF EACH CITY FOR TASK 3 CITIES   --
-- Used the AVG AGGREGATE FUNCTION to display The Average Years of Experience --
-- Used COUNT to filter by the Cities with less than 10 employees --
-- Used INNER JOINS and HAVING  to combine the tables and filter based on conditions --
-- Used GROUP BY AND ORDER BY to further sort the results --
SELECT L.city, round(AVG(timestampdiff(YEAR,e.hire_date,NOW()))) AS 'AVG Years of Experience'
FROM employees e
inner JOIN departments as d
ON e.department_id = d.department_id
inner JOIN locations as l
ON l.location_id = d.location_id
GROUP BY l.city
HAVING COUNT(e.employee_id) < 10
ORDER BY round(AVG(timestampdiff(YEAR,e.hire_date,NOW()))) desc;
/********************************************** TASK 5 *****************************/
--     FIND FIRST NAME, LAST NAME, EMAIL, PHONE NUMBER WITH 10 YEARS OF EXPERIENCE  --
-- Used INNER JOINS, WHERE and AND to join the three table and filter the data --
-- The Work From Home Policy should be sent to 104 Employees --
SELECT e.first_name, e.last_name, e.email, e.phone_number,
round(timestampdiff(YEAR,e.hire_date,NOW())) as 'Years of Experience'
FROM employees as e
INNER JOIN departments as d
ON e.department_id = d.department_id
INNER JOIN locations as l
ON l.location_id = d.location_id
WHERE l.city in  ('South San Francisco','Oxford','Seattle','Southlake','Toronto')
AND round(timestampdiff(YEAR,E.hire_date,NOW())) > 10
ORDER BY round(timestampdiff(YEAR,E.hire_date,NOW())) desc;
/********************************************** TASK 6 *****************************/
--                        LIST IDs OF MANAGERS OF TASK 5 EMPLOYEES              --
-- USED INNER JOINS, WHERE, IN and AND TO JOIN THE THREE TABLES AND FILTER BASED ON CONDITIONS --
-- MANAGER IDs HAVE BEEN ADDED  --
SELECT e.first_name, e.last_name, e.email, e.phone_number, d.manager_id,
round(timestampdiff(YEAR,e.hire_date,NOW())) as 'Years of Experience'
FROM employees as e
INNER JOIN departments as d
ON e.department_id = d.department_id
INNER JOIN locations as l
ON l.location_id = d.location_id
WHERE l.city in  ('South San Francisco','Oxford','Seattle','Southlake','Toronto')
AND timestampdiff(YEAR,e.hire_date,NOW()) >= 10
ORDER BY round(timestampdiff(YEAR,E.hire_date,NOW())) desc;
