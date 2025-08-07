
/*
==========================================
 Title   : Create and Initialize DataWarehouse
 Purpose : This script creates a clean instance of the 'DataWarehouse' database
           with three custom schemas: bronze, silver, and gold.
           
           It first checks if a database with the same name already exists,
           and if so, it forcibly drops it to avoid conflicts.

 WARNING : This script will permanently delete the existing 'DataWarehouse' database 
           and all its data. Use only in development or non-production environments!
==========================================
*/
-- Create Database 'DataWarehouse'
USE master;
GO

-- Drop and recreate the "DataWarehouse" Database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
  ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE DataWarehouse;
END;
GO

-- Create the "DataWarehouse" databse  
CREATE DATABASE DataWarehouse;
GO
  
USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze AUTHORIZATION dbo;
GO
CREATE SCHEMA silver AUTHORIZATION dbo;
GO
CREATE SCHEMA gold AUTHORIZATION dbo;
GO
