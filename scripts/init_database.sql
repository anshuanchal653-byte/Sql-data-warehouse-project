/*
========================================================
create Database and Schemas
========================================================
Script Purpose:
     This script creates a new database named 'Datawarehouse' after checking if it already exists.
     If the database exists,it is dropped and recreated. Additionally, the script sets up three schemas 
     within the database: 'bronze','silver',and 'gold.

WARNING: 
Running this script will drop the entire 'Datawarehouse' database if it exists.
All data in the database will be permanently deleted. proceed with caution 
and ensure you have proper backups before running this script.
*/

USE master;
GO

-- Drop and recreate the 'Datawarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'Datawarehouse')
BEGIN
    ALTER DATABASE datawarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Datawarehouse;
END;
GO

-- create the 'datawarehouse' database
CREATE DATABASE datawarehouse;
GO

USE Datawarehouse;
GO

-- create schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO


