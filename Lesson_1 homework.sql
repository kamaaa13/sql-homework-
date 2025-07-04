-- Lesson 1: Introduction to SQL Server and SSMS

-- EASY

-- 1. Definitions (written here as comments)
-- Data: Facts or values that can be stored and processed.
-- Database: Organized collection of data for easy access and management.
-- Relational Database: A database that stores data in related tables.
-- Table: A structure with rows and columns to store data in a database.

-- 2. Five key features of SQL Server:
-- - Data storage and management
-- - Support for transactions
-- - Security features (logins, roles, encryption)
-- - Replication and backup
-- - Integration with Microsoft services

-- 3. Authentication Modes:
-- - Windows Authentication
-- - SQL Server Authentication

-- MEDIUM

-- 4. Create a new database
CREATE DATABASE SchoolDB;

-- 5. Create Students table
USE SchoolDB;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);

-- 6. Differences between SQL Server, SSMS, and SQL:
-- SQL Server: The database engine/software that stores and processes data.
-- SSMS: GUI tool for managing SQL Server databases.
-- SQL: The language used to communicate with databases.

-- HARD

-- 7. SQL Command Types:
-- DQL (Data Query Language): SELECT * FROM Students;
-- DML (Data Manipulation Language): INSERT, UPDATE, DELETE
-- DDL (Data Definition Language): CREATE TABLE, DROP TABLE
-- DCL (Data Control Language): GRANT, REVOKE
-- TCL (Transaction Control Language): BEGIN, COMMIT, ROLLBACK

-- 8. Insert three records into Students table
INSERT INTO Students (StudentID, Name, Age)
VALUES
(1, 'Kamola', 20),
(2, 'Zarina', 21),
(3, 'Bekzod', 22);

-- 9. Restore AdventureWorksDW2022.bak
-- Steps (written as comments):
-- 1. Download .bak file from:
--    https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksDW2022.bak
-- 2. Copy the file to:
--    C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup
-- 3. In SSMS, right-click on "Databases" > "Restore Database..."
-- 4. Choose "Device" and locate the .bak file
-- 5. Select the database name and click OK
