-- ============================================================
-- SQL Script for Employee Database Schema and Data Population
-- Author: David Husar
-- Purpose: Create a schema for employees, job positions, and 
--          their many-to-many relationship, along with test data.
-- ============================================================

-- ------------------------------------------------------------
-- Use the EmployeeDB database
-- ------------------------------------------------------------
USE EmployeeDB;

-- ------------------------------------------------------------
-- Drop existing tables if they exist
-- ------------------------------------------------------------
IF OBJECT_ID('dbo.EmployeeJobPositions', 'U') IS NOT NULL
    DROP TABLE dbo.EmployeeJobPositions;

IF OBJECT_ID('dbo.JobPositions', 'U') IS NOT NULL
    DROP TABLE dbo.JobPositions;

IF OBJECT_ID('dbo.Employees', 'U') IS NOT NULL
    DROP TABLE dbo.Employees;

-- ------------------------------------------------------------
-- Create the Employees table
-- ------------------------------------------------------------
CREATE TABLE Employees (
    PersonalNumber INT PRIMARY KEY,      -- Unique employee ID (Primary Key)
    FirstName NVARCHAR(50) NOT NULL,     -- Employee's first name
    LastName NVARCHAR(50) NOT NULL,      -- Employee's last name
    HealthInsurance NVARCHAR(50),        -- Optional: Health insurance provider
    City NVARCHAR(50)                    -- Optional: City of residence
);

-- ------------------------------------------------------------
-- Create the JobPositions table
-- ------------------------------------------------------------
CREATE TABLE JobPositions (
    PositionID INT PRIMARY KEY,          -- Unique job position ID (Primary Key)
    PositionName NVARCHAR(100) NOT NULL  -- Name of the job position
);

-- ------------------------------------------------------------
-- Create the EmployeeJobPositions table (M:N Relationship)
-- ------------------------------------------------------------
CREATE TABLE EmployeeJobPositions (
    EmployeeID INT NOT NULL,             -- Foreign key referencing Employees
    PositionID INT NOT NULL,             -- Foreign key referencing JobPositions
    PRIMARY KEY (EmployeeID, PositionID),-- Composite Primary Key (M:N)
    FOREIGN KEY (EmployeeID) REFERENCES Employees(PersonalNumber) 
        ON DELETE CASCADE,               -- Cascade delete if Employee is removed
    FOREIGN KEY (PositionID) REFERENCES JobPositions(PositionID) 
        ON DELETE CASCADE                -- Cascade delete if Job Position is removed
);

-- ------------------------------------------------------------
-- Insert data into Employees
-- ------------------------------------------------------------
INSERT INTO Employees (PersonalNumber, FirstName, LastName, HealthInsurance, City)
VALUES 
(1, 'John', 'Doe', 'HealthPlus', 'New York'),
(2, 'Jane', 'Smith', 'MediCare', 'Los Angeles'),
(3, 'Emily', 'Jones', 'CareHealth', 'Chicago');

-- ------------------------------------------------------------
-- Insert data into JobPositions
-- ------------------------------------------------------------
INSERT INTO JobPositions (PositionID, PositionName)
VALUES 
(1, 'Software Engineer'),
(2, 'Project Manager'),
(3, 'Data Analyst');

-- ------------------------------------------------------------
-- Insert data into EmployeeJobPositions (M:N Relationship)
-- ------------------------------------------------------------
INSERT INTO EmployeeJobPositions (EmployeeID, PositionID)
VALUES 
(1, 1),  -- John Doe is a Software Engineer
(2, 2),  -- Jane Smith is a Project Manager
(3, 3),  -- Emily Jones is a Data Analyst
(1, 2);  -- John Doe is also a Project Manager

-- ------------------------------------------------------------
-- Retrieve all employees, job positions, and mappings
-- ------------------------------------------------------------
-- Get all employees
SELECT * FROM Employees;

-- Get all job positions
SELECT * FROM JobPositions;

-- Get the many-to-many relationship between employees and positions
SELECT * FROM EmployeeJobPositions;

-- ------------------------------------------------------------
-- Test cascading delete by deleting a Job Position
-- ------------------------------------------------------------
-- Delete Job Position 'Project Manager' (PositionID = 2)
DELETE FROM JobPositions WHERE PositionID = 2;

-- Verify that the mapping for John Doe as Project Manager is removed
SELECT * FROM EmployeeJobPositions;

-- ------------------------------------------------------------
-- Test edge cases for constraints
-- ------------------------------------------------------------
-- Attempt to insert an invalid position (PositionID = 999 does not exist)
INSERT INTO EmployeeJobPositions (EmployeeID, PositionID)
VALUES (1, 999);  -- Expected to fail due to foreign key constraint

-- Attempt to insert a duplicate employee (PersonalNumber = 1 already exists)
INSERT INTO Employees (PersonalNumber, FirstName, LastName, HealthInsurance, City)
VALUES (1, 'Duplicate', 'Entry', 'TestInsurance', 'TestCity'); -- Expected to fail due to primary key constraint
