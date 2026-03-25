/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.
	
WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/
/*
USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
	
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO
*/
-- Create the 'DataWarehouse' database

CREATE DATABASE [DataWarehouse]
 CONTAINMENT = NONE
  ON  PRIMARY 
( NAME = N'PRIM_DataWarehouse', 
  FILENAME = N'X:\PDATAXT11INS\PRIM_DataWarehouse.mdf' , 
  SIZE = 8192KB , 
  MAXSIZE = 84MB, 
  FILEGROWTH = 65536KB ), 

 FILEGROUP [bronze] 
( NAME = N'bronze', 
  FILENAME = N'X:\SDATAXT11INS\bronze.ndf' , 
  SIZE = 8192KB , 
  MAXSIZE = 84MB, 
  FILEGROWTH = 65536KB ), 

 FILEGROUP [gold] 
( NAME = N'gold', 
  FILENAME = N'X:\SDATAXT11INS\gold.ndf' , 
  SIZE = 8192KB , 
  MAXSIZE = 84MB, 
  FILEGROWTH = 65536KB ), 

 FILEGROUP [silver] 
( NAME = N'silver', 
  FILENAME = N'X:\SDATAXT11INS\silver.ndf' , 
  SIZE = 8192KB , 
  MAXSIZE = 84MB, 
  FILEGROWTH = 65536KB )

 LOG ON 
( NAME = N'DataWarehouse_log', 
  FILENAME = N'X:\LOGXT11INS\DataWarehouse_log.ldf' , 
  SIZE = 8192KB , 
  MAXSIZE = 84MB, 
  FILEGROWTH = 65536KB )
 
GO


USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
