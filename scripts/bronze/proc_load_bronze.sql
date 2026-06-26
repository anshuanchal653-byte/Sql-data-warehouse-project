/*
===================================================================
Stored procedure: Lode Bronze Layer (Sourse ->)
===================================================================
Script purpose:
  This stored procedure loads data into 'bronze' schema from external csv files.
  It performs the following actions:
  - Truncates the bronze tables before loading the data.
  -uses the 'BULK INSERT' command to load from csv files to bronze tables.

Paremeters:
  None.
 This stored procedure does not accept any parameters or return any values.

Usages Example:
   EXEC bronze.load_bronze;
===================================================================
*/
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
  DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME , @batch_end_time DATETIME;
BEGIN TRY
   SET @batch_start_time = GETDATA();
PRINT '================================================';
PRINT 'loding bronze layer';
PRINT '================================================';

PRINT '------------------------------------------------';
PRINT 'loding CRM tables';
PRINT '------------------------------------------------';

SET @start_time = GETDATE();
PRINT '>> Truncating Table : bronze.crm_cust_info;
TRUNCATE TABLE bronze.crm_cust_info;
PRINT '>> Inserting Data Into : bronze.crm_cust_info;
BULK INSERT bronze.crm_cust_info
FROM 'C:
