-- Lesson 4: Filtering and Ordering Data
-- 🟢 Easy-Level Tasks (with small mistakes)

-- 1. Select top 5 employees (❌ Missing ORDER BY)
SELECT TOP 5 *
FROM Employees;

-- 2. SELECT DISTINCT Category values
SELECT DISTINCT Category
FROM Products;

-- 3. Filter Products: Price > 100
SELECT *
FROM Products
WHERE Price > 100;

-- 4. FirstName starts with 'A' using LIKE
SELECT *
FROM Customers
WHERE FirstName LIKE 'A%';

-- 5. Order Products by Price ascending
SELECT *
FROM Products
ORDER BY Price ASC;

-- 6. Employees with Salary >= 60000 and Department = 'HR' (❌ Wrong column name)
SELECT *
FROM Employees
WHERE Salary >= 60000 AND Department = 'HR';

-- 7. Replace NULL Email with text
SELECT EmployeeID, ISNULL(Email, 'noemail@example.com') AS Email
FROM Employees;

-- 8. Products with Price BETWEEN 50 AND 100
SELECT *
FROM Products
WHERE Price BETWEEN 50 AND 100;

-- 9. SELECT DISTINCT on Category and ProductName
SELECT DISTINCT Category, ProductName
FROM Products;

-- 10. DISTINCT Category + ProductName + ORDER BY ProductName DESC (❌ Extra comma error simulated)
SELECT DISTINCT Category, ProductName
FROM Products
ORDER BY ProductName DESC;

-- 🟠 Medium-Level Tasks

-- 1. Top 10 products by Price DESC
SELECT TOP 10 *
FROM Products
ORDER BY Price DESC;

-- 2. COALESCE FirstName or LastName
SELECT EmployeeID, COALESCE(FirstName, LastName) AS DisplayName
FROM Employees;

-- 3. Distinct Category and Price
SELECT DISTINCT Category, Price
FROM Products;

-- 4. Employees Age between 30–40 or Marketing
SELECT *
FROM Employees
WHERE (Age BETWEEN 30 AND 40) OR DepartmentName = 'Marketing';

-- 5. OFFSET-FETCH for rows 11 to 20 (❌ Missing ORDER BY column)
SELECT *
FROM Employees
ORDER BY Salary DESC
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;

-- 6. Products Price <= 1000 and Stock > 50, sorted by Stock
SELECT *
FROM Products
WHERE Price <= 1000 AND StockQuantity > 50
ORDER BY StockQuantity ASC;

-- 7. ProductName contains 'e'
SELECT *
FROM Products
WHERE ProductName LIKE '%e%';

-- 8. Employees in HR, IT, Finance
SELECT *
FROM Employees
WHERE DepartmentName IN ('HR', 'IT', 'Finance');

-- 9. Customers ordered by City ASC and PostalCode DESC
SELECT *
FROM Customers
ORDER BY City ASC, PostalCode DESC;

-- 🔴 Hard-Level Tasks

-- 1. Top 5 products with highest SalesAmount
SELECT TOP 5 P.ProductName, SUM(S.SaleAmount) AS TotalSales
FROM Sales S
JOIN Products P ON S.ProductID = P.ProductID
GROUP BY P.ProductName
ORDER BY TotalSales DESC;

-- 2. FullName = FirstName + LastName
SELECT EmployeeID, (FirstName + ' ' + LastName) AS FullName
FROM Employees;

-- 3. Distinct Category, ProductName, Price > $50
SELECT DISTINCT Category, ProductName, Price
FROM Products
WHERE Price > 50;

-- 4. Products with Price < 10% of average price
SELECT *
FROM Products
WHERE Price < (SELECT AVG(Price) * 0.1 FROM Products);

-- 5. Employees Age < 30 and Department HR or IT
SELECT *
FROM Employees
WHERE Age < 30 AND DepartmentName IN ('HR', 'IT');

-- 6. Customers with email domain '@gmail.com'
SELECT *
FROM Customers
WHERE Email LIKE '%@gmail.com%';

-- 7. Employees whose salary > ALL in Sales dept
SELECT *
FROM Employees
WHERE Salary > ALL (
  SELECT Salary
  FROM Employees
  WHERE DepartmentName = 'Sales'
);

-- 8. Orders in last 180 days (❌ Might simulate current date without GETDATE())
SELECT *
FROM Orders
WHERE OrderDate BETWEEN DATEADD(DAY, -180, GETDATE()) AND GETDATE();
