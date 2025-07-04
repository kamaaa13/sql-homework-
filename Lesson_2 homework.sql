-- Lesson 2: DDL and DML Commands

-- BASIC TASKS

-- 1. Create Employees table
CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(50),
    Salary DECIMAL(10,2)
);

-- 2. Insert three records using different methods
INSERT INTO Employees (EmpID, Name, Salary) VALUES (1, 'Kamola', 6000.00);

INSERT INTO Employees (EmpID, Name, Salary)
VALUES 
(2, 'Zarina', 5500.00),
(3, 'Bekzod', 4800.00);

-- 3. Update salary
UPDATE Employees
SET Salary = 7000
WHERE EmpID = 1;

-- 4. Delete a record
DELETE FROM Employees
WHERE EmpID = 2;

-- 5. Difference between DELETE, TRUNCATE, and DROP:
-- DELETE: Removes specific rows, can be rolled back if inside a transaction.
-- TRUNCATE: Removes all rows quickly, cannot delete specific rows, minimal logging.
-- DROP: Completely removes the table structure and data.

-- 6. Modify Name column to VARCHAR(100)
ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100);

-- 7. Add new column Department
ALTER TABLE Employees
ADD Department VARCHAR(50);

-- 8. Change Salary column type to FLOAT
ALTER TABLE Employees
ALTER COLUMN Salary FLOAT;

-- 9. Create Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- 10. Remove all records from Employees (structure remains)
TRUNCATE TABLE Employees;

-- INTERMEDIATE TASKS

-- 11. Insert into Departments using INSERT INTO SELECT
INSERT INTO Departments (DepartmentID, DepartmentName)
SELECT 1, 'HR'
UNION
SELECT 2, 'IT'
UNION
SELECT 3, 'Finance'
UNION
SELECT 4, 'Marketing'
UNION
SELECT 5, 'Logistics';

-- 12. Update Department of employees where Salary > 5000
UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;

-- 13. Remove all employees, keep structure
DELETE FROM Employees;

-- 14. Drop Department column
ALTER TABLE Employees
DROP COLUMN Department;

-- 15. Rename Employees to StaffMembers
EXEC sp_rename 'Employees', 'StaffMembers';

-- 16. Drop Departments table
DROP TABLE Departments;

-- ADVANCED TASKS

-- 17. Create Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Description VARCHAR(255)
);

-- 18. Add CHECK constraint on Price > 0
ALTER TABLE Products
ADD CONSTRAINT chk_price CHECK (Price > 0);

-- 19. Add StockQuantity with DEFAULT 50
ALTER TABLE Products
ADD StockQuantity INT DEFAULT 50;

-- 20. Rename Category to ProductCategory
EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';

-- 21. Insert 5 records
INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, Description)
VALUES
(1, 'Notebook', 'Stationery', 15.50, 'College ruled'),
(2, 'Pen', 'Stationery', 2.99, 'Blue ink'),
(3, 'Mouse', 'Electronics', 25.00, 'Wireless mouse'),
(4, 'Keyboard', 'Electronics', 40.00, 'Mechanical keyboard'),
(5, 'Mug', 'Kitchen', 8.75, 'Ceramic, white');

-- 22. Create backup table using SELECT INTO
SELECT * INTO Products_Backup
FROM Products;

-- 23. Rename Products to Inventory
EXEC sp_rename 'Products', 'Inventory';

-- 24. Change Price column to FLOAT
ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;

-- 25. Add IDENTITY column ProductCode starting at 1000 with step 5
ALTER TABLE Inventory
ADD ProductCode INT IDENTITY(1000,5);
