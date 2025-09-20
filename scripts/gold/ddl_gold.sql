/* =================================================================================================
   Script: gold_views.sql
   Purpose:
       - Create the Gold layer views of the Data Warehouse.
       - Provide dimensional and fact tables for analytics and reporting.
       - Integrate and standardize data from the Silver layer.

   Views included:
       1. gold.dim_customers → Customer dimension
       2. gold.dim_products  → Product dimension
       3. gold.fact_sales    → Sales fact table

   Notes:
       - Dimensions are built from Silver tables (CRM + ERP).
       - fact_sales is the central fact table linked to dimensions.
       - Gold views are ready to be consumed by BI/Analytics tools.

  Usage:
       - These views can be queried directly for analitics and reporting.  
================================================================================================= */


-- ================================================================================================
-- View: gold.dim_customers
-- Description:
--   Customer dimension with surrogate key, personal information, country,
--   marital status, gender, and creation date.
--   Combines CRM data (master source) with ERP data (gender and birthday).
-- ================================================================================================
CREATE VIEW gold.dim_customers AS
SELECT
    ROW_NUMBER() OVER (ORDER BY cst_id) AS customer_key,
    ci.cst_id AS customer_id,
    ci.cst_key AS customer_number,
    ci.cst_firstname AS first_name,
    ci.cst_lastname AS last_name,
    la.cntry AS country,
    ci.cst_marital_status AS marital_status,
    CASE WHEN ci.cst_gndr != 'n/a' THEN ci.cst_gndr -- CRM is considered the master for gender
         ELSE COALESCE(ca.gen, 'n/a')
    END AS gender,
    ca.bdate AS birthday,
    ci.cst_create_date AS create_date
FROM silver.crm_cust_info AS ci
LEFT JOIN silver.erp_cust_az12 AS ca
       ON ci.cst_key = ca.cid
LEFT JOIN silver.erp_loc_a101 AS la
       ON ci.cst_key = la.cid;


-- ================================================================================================
-- View: gold.dim_products
-- Description:
--   Product dimension with surrogate key, product number and name,
--   category, subcategory, product line, and cost.
--   Combines CRM product data with ERP category data.
--   Filters out historical records, keeping only active products (prd_end_dt IS NULL).
-- ================================================================================================
CREATE VIEW gold.dim_products AS
SELECT
    ROW_NUMBER() OVER (ORDER BY pn.prd_start_dt, pn.prd_key) AS product_key,
    pn.prd_id AS product_id,
    pn.prd_key AS product_number,
    pn.prd_nm AS product_name,
    pn.cat_id AS category_id,
    pc.cat AS category,
    pc.subcat AS subcategory,
    pc.maintenance,
    pn.prd_cost AS cost,
    pn.prd_line AS product_line,
    pn.prd_start_dt AS start_date
FROM silver.crm_prd_info AS pn
LEFT JOIN silver.erp_px_cat_g1v2 AS pc
       ON pn.cat_id = pc.id
WHERE prd_end_dt IS NULL; -- keep only active products


-- ================================================================================================
-- View: gold.fact_sales
-- Description:
--   Sales fact table with surrogate keys (customer_key, product_key),
--   amounts, quantities, prices, and relevant dates (order, shipping, due).
--   Links CRM sales transactions to Gold customer and product dimensions.
-- ================================================================================================
CREATE VIEW gold.fact_sales AS
SELECT
    sd.sls_ord_num AS order_number,
    pr.product_key,
    cu.customer_key,
    sd.sls_order_dt AS order_date,
    sd.sls_ship_dt AS shipping_date,
    sd.sls_due_dt AS due_date,
    sd.sls_sales AS sales_amount,
    sd.sls_quantity AS quantity,
    sd.sls_price AS price
FROM silver.crm_sales_details AS sd
LEFT JOIN gold.dim_products AS pr
       ON sd.sls_prd_key = pr.product_number
LEFT JOIN gold.dim_customers AS cu
       ON sd.sls_cust_id = cu.customer_id;
