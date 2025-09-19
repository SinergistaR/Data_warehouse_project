/* =================================================================================================
   Script: ddl_silver.sql
   Purpose:
       This script defines the schema for the Silver layer tables in the Data Warehouse.
       It drops existing tables if present, then recreates them with the appropriate structure.

   Layer description:
       - Silver layer tables contain cleansed, standardized, and lightly transformed data.
       - They are populated from the Bronze layer via ETL/ELT procedures (see silver.load_silver).
       - Default column `dwh_create_date` is included to track load timestamp (except when not required).

   Tables created:
       1. silver.crm_cust_info      → Customer master data (cleaned, deduplicated, standardized)
       2. silver.crm_prd_info       → Product master data with category and lifecycle dates
       3. silver.crm_sales_details  → Sales transactions with validated amounts and dates
       4. silver.erp_cust_az12      → ERP customers with birthdate and gender cleaned
       5. silver.erp_loc_a101       → ERP locations with normalized country values
       6. silver.erp_px_cat_g1v2    → ERP product categories and maintenance classification

   Notes:
       - Each table is dropped and recreated, ensuring a clean schema definition.
       - Use together with the ETL procedure [silver.load_silver] to load data from the Bronze layer.
       - Ensure proper execution order: schema creation → DDL Silver (this script) → ETL loading.
================================================================================================= */


IF OBJECT_ID('silver.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE silver.crm_cust_info;
CREATE TABLE silver.crm_cust_info (
    cst_id INT,
    cst_key NVARCHAR(50),
    cst_firstname NVARCHAR(50),
    cst_lastname NVARCHAR(50),
    cst_marital_status NVARCHAR(50),
    cst_gndr NVARCHAR(50),
    cst_create_date DATE,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);

IF OBJECT_ID('silver.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE silver.crm_prd_info;
CREATE TABLE silver.crm_prd_info (
    prd_id INT,
    cat_id NVARCHAR(50),
    prd_key NVARCHAR(50),
    prd_nm NVARCHAR(50),
    prd_cost INT,
    prd_line NVARCHAR(50),
    prd_start_dt DATE,
    prd_end_dt DATE,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);

IF OBJECT_ID('silver.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE silver.crm_sales_details;
CREATE TABLE silver.crm_sales_details (
    sls_ord_num NVARCHAR(50),
    sls_prd_key NVARCHAR(50),
    sls_cust_id INT,
    sls_order_dt DATE,
    sls_ship_dt DATE,
    sls_due_dt DATE,
    sls_sales INT,
    sls_quantity INT,
    sls_price INT,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);

IF OBJECT_ID('silver.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE silver.erp_cust_az12;
CREATE TABLE silver.erp_cust_az12 (
    cid     NVARCHAR(50),
    bdate   DATE,
    gen     NVARCHAR(50),
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);

IF OBJECT_ID('silver.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE silver.erp_loc_a101;
CREATE TABLE silver.erp_loc_a101 (
    cid     NVARCHAR(50),
    cntry   NVARCHAR(50)
);

IF OBJECT_ID('silver.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE silver.erp_px_cat_g1v2;
CREATE TABLE silver.erp_px_cat_g1v2 (
    id          NVARCHAR(50),
    cat         NVARCHAR(50),
    subcat      NVARCHAR(50),
    maintenance NVARCHAR(50),
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);


