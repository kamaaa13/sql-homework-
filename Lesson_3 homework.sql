-- Lesson 3: Importing and Exporting Data

-- EASY TASKS

-- 1. Purpose of BULK INSERT
-- BULK INSERT is used to import a large amount of data from a file (like .txt or .csv) into a SQL Server table quickly.

-- 2. File formats that can be imported:
-- - .txt
-- - .csv
-- - .xls / .xlsx
-- - .xml

-- 3. Create Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);

-- 4. Insert records
INSERT INTO Products (ProductID, ProductName, Price) VALUES (1, 'Notebook', 12.50);
INSERT INTO Products (ProductID, ProductName, Price) VALUES (2, 'Pen', 1.75);
INSERT INTO Products (ProductID, ProductName, Price) VALUES (3, 'Pencil', 0.80);

-- 5. Difference between NULL and NOT NULL
-- NULL means the column can have missing or unknown values.
-- NOT NULL means the column must always have a value.

-- 6. Add UNIQUE constraint to ProductName
ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);

-- 7. Comment example:
-- This query selects all products with price greater than 10
SELECT * FROM Products WHERE Price > 10;

-- 8. Add CategoryID column
ALTER TABLE Products
ADD CategoryID INT;

-- 9. Create Categories table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE
);

-- 10. Purpose of IDENTITY
-- IDENTITY is used to auto-generate numeric values for a column, often used for primary keys.

-- MEDIUM TASKS

-- 11. BULK INSERT (file path is example, not executable here)
-- BULK INSERT Products
-- FROM 'C:\\Data\\products.txt'
-- WITH (
--     FIELDTERMINATOR = ',',
--     ROWTERMINATOR = '\\n',
--     FIRSTROW = 2
-- );

-- 12. Add FOREIGN KEY
ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories FOREIGN KEY (CategoryID)
REFERENCES Categories(CategoryID);

-- 13. Difference between PRIMARY KEY and UNIQUE KEY
-- PRIMARY KEY: uniquely identifies each row and cannot contain NULLs.
-- UNIQUE KEY: ensures all values are unique, but allows one NULL.

-- 14. CHECK constraint on Price
ALTER TABLE Products
ADD CONSTRAINT CK_Price CHECK (Price > 0);

-- 15. Add Stock column (❗ Ошибка: пропущено NOT NULL)
ALTER TABLE Products
ADD Stock INT;

-- 16. Replace NULL values in Price with 0
SELECT ProductID, ISNULL(Price, 0) AS FixedPrice
FROM Products;

-- 17. Purpose of FOREIGN KEY
-- It enforces referential integrity between two related tables.

-- HARD TASKS

-- 18. Customers table with CHECK constraint
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT CHECK (Age >= 18)
);

-- 19. Table with IDENTITY column
CREATE TABLE Invoices (
    InvoiceID INT IDENTITY(100, 10) PRIMARY KEY,
    InvoiceDate DATE
);

-- 20. Composite PRIMARY KEY
CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)
);

-- 21. COALESCE vs ISNULL
-- ISNULL: replaces NULL with specified value (SQL Server specific).
-- COALESCE: returns first non-NULL value from a list (standard SQL).

-- 22. Employees table with PRIMARY and UNIQUE
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Email VARCHAR(100) UNIQUE
);

-- 23. FOREIGN KEY with ON DELETE/UPDATE CASCADE
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);