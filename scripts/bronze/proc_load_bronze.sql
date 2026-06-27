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
FROM 'C:\sql\dwh_project\datasets\source_crm\cust_info.csv'
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);
 SET @end_time = GETDATE();
PRINT '>> Load Duration:' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) +
PRINT '>> ---------------';

SET @start_time = GETDATE();
PRINT '>> Truncating Table: bronze.crm_prd_info';
TRUNCATE TABLE bronze.crm_prd_info;

PRINT '>> Inserting Data Into: bronze.crm_prd_info';
BULK INSERT bronze.crm_prd_info
FROM 'C:\sql\dwh_project\datasets\source_crm\prd_info.csv'
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);
SET @end_time = GETDATE();
PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
PRINT  '>>---------------';

  SET @start time GETDATE();
PRINT '>> Truncating Table: bronze.crm_sales_details';
TRUNCATE TABLE bronze.crm_sales_details;
PRINT >> Inserting Data Into: bronze.crm_sales details';
BULK INSERT bronze.crm_sales_details
FROM 'C:\sql\dwh_project\datasets\source_crm\sales_details.csv'
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  TABLOCK
);
SET @end_time = GETDATE();
PRINT '>> Load Duration:' CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) 'seconds';
PRINT '>>-----------------';

PRINT '------------------------------------------------';
PRINT 'Loading ERP Tables';
PRINT '------------------------------------------------';

SET @start_time = GETDATE();
PRINT '>> Truncating Table: bronze.erp_loc_a101';
TRUNCATE TABLE bronze.erp_loc_a101;
PRINT '>> Inserting Data Into: bronze.erp_loc_a101';
BULK INSERT bronze.erp_loc_a101
FROM 'C:\sql\dwh_project\datasets\source_erp\loc_a101.csv'
WITH (
  FIRSTROW 2,
  FIELDTERMINATOR = ','
  TABLOCK
);
SET @end_time = GETDATE();
PRINT '>> Load Duration:' + CAST (DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
PRINT '>> --------------';

SET @start_time = GETDATE();
PRINT '>> Truncating Table: bronze.erp_cust_az12';
TRUNCATE TABLE bronze.erp_cust_az12;
PRINT 'Intresting Data Into: bronze.erp_cust_az12';
