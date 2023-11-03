                                                  /**Task 1**/
-- Create databse --
CREATE DATABASE stylexcarz_db;
use stylexcarz_db;
                                                   /** Task2**/
-- Create Salesperson Table / Establish Primary Key --
CREATE TABLE salesperson (
salespersonid int NOT NULL,
salesperson_name varchar (20) NOT NULL,
salesperson_city varchar (50) NOT NULL,
commission_rate int NOT NULL,
PRIMARY KEY (salespersonid));

-- Describe Orders Table to check PK and FK placement--
describe salesperson;

-- Create Customers Table / Establish Primary Key --
CREATE TABLE customers (
customerid int NOT NULL,
c_lastname varchar (20) NOT NULL,
c_firstname varchar (20) NOT NULL,
c_city varchar (50) NOT NULL,
c_rating int NOT NULL,
PRIMARY KEY (customerid));

-- Describe Customers Table to check PK --
describe customers;

-- Set Default Values to 0 to avoid conflict when updating columns/rows --
ALTER TABLE orders
ALTER CustomerId SET DEFAULT '0';

-- Create Orders Table / Establish Primary Key and Foreign Keys--
use stylexcarz_db;
CREATE TABLE orders (
orderid int NOT NULL,
amount int NOT NULL, 
orderdate date 	NOT NULL,
salespersonid int NOT NULL,
customerid int NOT NULL,
PRIMARY KEY (orderid),
FOREIGN KEY (salespersonid) REFERENCES salesperson (salespersonid));

-- Describe Orders Table to check PK and FK placement--
describe orders;

-- Create CustomerID Table to be used as Orders Table Foreign Key --
CREATE TABLE customerID (
CustomerID int PRIMARY KEY,
c_id int NOT NULL);

-- Alter Orders Table to add the Foreign Key  (CustomerId) using the Add Constraint --
use stylexcarz_db;
ALTER TABLE orders
ADD CONSTRAINT FK_CustomerId
FOREIGN KEY (CustomerId) REFERENCES customers (CustomerId);

-- Describe Orders Table to check FK placement--
describe orders;

                                                     /**Task 3**/
   -- Insert values from Excel into Tables --
-- Insert values into Salesperson Table --
INSERT INTO salesperson (
salespersonid, salesperson_name, salesperson_city, commission_rate)
VALUES (01,'William','New York', 12),
(02, 'Liam', 'New Jersey',13),
(03, 'Axelrod', 'San Jose',10),
(04,'James', 'San Diego',11),
(05,'Fran', 'Austin',26),
(07,'Oliver', 'New York',15),
(08,'John','Atlanta',2),
(09, 'Charles', 'New Jersey',2);

-- Display Table --
SELECT * FROM stylexcarz_db.salesperson;

-- Insert values into Customers Table --
INSERT INTO customers (
customerid, c_lastname, c_firstname, c_city, c_rating)
VALUES (01,'Hoffman','Anny','New York', 1),
(02, 'Giovanni', 'Jenny','New Jersey',2),
(03, 'Lui', 'Williams','San Jose',3),
(04,'Grass', 'Harry','San Diego',3),
(05,'Clemens','John', 'Austin',4),
(06,'Cisneros','Fanny','New York',4),
(07,'Pereira','Johnathan','Atlanta',3);

-- Display Table --
SELECT * FROM stylexcarz_db.customers;

-- Insert values into Orders Table --
INSERT INTO orders (
orderid, amount, orderdate, salespersonid, customerid)
VALUES 
(01 ,23,'2020-02-01',09, 07),
(02,20 ,'2021-02-23', 07,07),
(03,89 ,'2021-03-06',02,02),
(04,67 ,'2021-04-02', 04,02),
(05,30 ,'2021-07-30', 01,07),
(06,35,'2021-09-18', 01,04),
(07,21,'2021-10-02',01,01),
(08, 21,'2021-10-09' ,03,03),
(09,45,'2021-10-10' ,09,05);

-- Display Table --
SELECT * FROM stylexcarz_db.orders;

                                                      /**Task4**/
-- Set Default Values to 0 to avoid conflict when updating columns/rows --
ALTER TABLE salesperson
ALTER commission_rate SET DEFAULT '0';

    -- Use Update, Set, and Where to Individually Update Each salespersonid to display a 15% commission rate for all salespersons with a rate below 15% --
-- 6 Columns Affected, Unaffected Columns were above condition --
UPDATE salesperson
SET commission_rate = 15
WHERE salespersonid = 8;

UPDATE salesperson
SET commission_rate = 15
WHERE salespersonid = 9;

UPDATE salesperson
SET commission_rate = 15
WHERE salespersonid = 2;

UPDATE salesperson
SET commission_rate = 15
WHERE salespersonid = 1;

UPDATE salesperson
SET commission_rate = 15
WHERE salespersonid = 4;

UPDATE salesperson
SET commission_rate = 15
WHERE salespersonid = 3;

-- Display Table --
SELECT * FROM salesperson;

                                                   /**Task 5**/
-- Create New Database to store Backup Table --
CREATE DATABASE backup_db;

-- Use the New Database / Create Backup Table / Establish Primary and Foreign Keys --
USE backup_db;
CREATE TABLE orders_bkp (
orderid int NOT NULL,
amount int NOT NULL, 
orderdate date 	NOT NULL,
salespersonid int NOT NULL,
customerid int NOT NULL,
PRIMARY KEY (orderid),
FOREIGN KEY (salespersonid) REFERENCES salesperson (salespersonid),
FOREIGN KEY (customerid) REFERENCES customers (customerid));

-- Describe Backup Table to check PK and FK placement --

-- Insert Values into the Backup Table --
INSERT INTO orders_bkp (orderid, amount, orderdate, salespersonid, customerid)
VALUES (01 ,23,'2020-02-01',09, 07),
(02,20 ,'2021-02-23', 07,07),
(03,89 ,'2021-03-06',02,02),
(04,67 ,'2021-04-02', 04,02),
(05,30 ,'2021-07-30', 01,07),
(06,35,'2021-09-18', 01,04),
(07,21,'2021-10-02',01,01),
(08, 21,'2021-10-09' ,03,03),
(09,45,'2021-10-10' ,09,05);
-- use BackUp Database created to display the data from this Table --
use backup_db;
SELECT * FROM orders_bkp;
                                                    /**Task 6**/
-- Review Orders Table to evaluate Customer(s) with more than 1 order / Customer 2 and 7 have the highest numnber of purchases --
-- Switch back to the Stylexcarz Database by using the database -- 
use stylexcarz_db;

-- Use Set, Where, and Or to add 3 points to the customer(s) with more than 1 order --
UPDATE customers
SET c_rating = c_rating + 3
WHERE customerid = 7 or customerid = 2;
-- Display Customers Table -- 
SELECT * FROM stylexcarz_db.customers;





















































