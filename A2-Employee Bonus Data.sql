/*******************************************************************************TASK 1 ********************/
    -- FIND COUNT OF ALL EMPLOYEES --
-- Used the COUNT function to count all the employees --
-- There are a total of 107 employees across all departments --
SELECT COUNT(employee_id) AS NumberofEmployees
FROM hr.employees;
/*******************************************************************************TASK 2 ********************/
    -- FIND COUNT OF ALL EMPLOYEES BASED ON DEPARTMENT ID --
-- Used GROUP BY to display the count of all employees per department --
SELECT COUNT(employee_id) AS Emp_per_Dept, department_id
FROM hr.employees
GROUP BY department_id
ORDER BY COUNT(employee_id) desc;
/********************************************************************************TASK 3 ********************/
    -- FIND FIRST NAME, LAST NAME, SALARIES OF EMPLOYEES WHOSE SALARY IS GREATER THAN 6,000 --
-- Used WHERE to specify conditions --
-- 55 Rows Returned --
SELECT first_name,last_name, salary
FROM hr.employees
WHERE salary > 6000.00
ORDER BY salary desc;
/********************************************************************************TASK 4 ********************/
    -- FIND COUNT OF ALL EMPLOYEES WITH SALARY GREATER THAN 20,000 --
-- Used WHERE to specify conditions --
-- There is only one employee with a salary greater than 20,000 --
SELECT COUNT(employee_id) AS HighEmployeeSalary
FROM employees
WHERE salary > 20000.00;
/********************************************************************************TASK 5 ********************/
    -- LIST DETAILS OF EMPLOYEES WHO GET COMMISSION --
-- 35 Rows Returned --
-- Used WHERE and ORDER BY to retrieve all employees who recieve commission in descending order --
SELECT *
FROM hr.employees
WHERE commission_pct is not null
ORDER BY commission_pct desc;
/*******************************************************************************TASK 6********************/
    -- EXTRACT FULL NAMES OF EMPLOYEES WHO GET COMMISSION --
-- Used CONCAT to join the first and last name together --
-- Used WHERE to specify conditions --
SELECT concat(first_name,'  ',last_name) AS EmployeeFullName
FROM hr.employees
WHERE commission_pct is not null;
/*****************************************************************************TASK 7********************/
   -- FIND EMPLOYEE ID, EMPLOYEE NAME (FIRST NAME + LAST NAME), EMAIL ID, PHONE NUMBER WHO GET COMMISSION--
      -- COLUMNS: EMPLOYEE ID, EMPLOYEE NAME, EMAIL ID, PHONE NUMBER --
-- Used WHERE to specify conditions --
-- Returns 35 Rows --
SELECT employee_id, concat(first_name,'  ',last_name) AS 'Full Name', email, phone_number
FROM hr.employees
WHERE commission_pct is not null;
/****************************************************************************TASK 8********************/
    -- FIND TOP 3 DEPARTMENT ID WITH HIGHEST TOTAL SALARY FOR EMPLOYEES --
-- Used GROUP BY to base my results on the Department ID --
-- Used LIMIT function to display the Top Three Deparments only --
-- The Top Three Departments based on their ID's are: Sales(80), Shipping(50), and Executive(90)--
-- Sales (Department 80) has the Highest Total Salary of All Depertments --
SELECT sum(salary) AS TotalSalary_PerDept, department_id
FROM hr.employees
GROUP BY department_id
ORDER BY sum(salary) desc
LIMIT 3;
/***************************************************************************TASK 9********************/
    -- LIST DETAILS OF IT EMPLOYEES --
-- Used WHERE to specify conditions --
-- There are 5 Employees in the IT Department --
SELECT * 
FROM hr.employees
WHERE department_id = 60;
/***************************************************************************TASK 10********************/
    -- FIND COUNT OF ALL EMPLOYEES IN IT DEPARTMENT AND THEIR AVERAGE SALARY --
-- Used WHERE to specify conditions --
-- There are 5 employees in the IT Deparment and their average salary is $5,760 --
SELECT COUNT(employee_id) AS NumberOfEmployees, round(AVG(salary))
FROM hr.employees
WHERE department_id = 60;
/***************************************************************************TASK 11********************/
    -- FIND DEPARTMENT ID, NUMBER OF EMPLOYEES WITH HAVING SALARY BETWEEN 7,000 AND 10,000--
-- Used WHERE to specify conditions and GROUP BY display the number of employees in each department--
-- Returns 18 Rows --
SELECT department_id, COUNT(employee_id) AS NumberOfEmployees
FROM hr.employees
WHERE salary BETWEEN 7000.00 AND 10000.00
GROUP BY department_id
ORDER BY COUNT(department_id) desc;