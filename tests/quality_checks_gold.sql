/* =================================================================================================
   Script: gold_data_validation.sql
   Purpose:
       - Perform validation checks on Gold layer integration and relationships.
       - Ensure data integrity after joining Silver tables into Gold dimensions and facts.

   Checks included:
       1. Duplicate detection
          - Verify that joins (CRM ↔ ERP) do not introduce duplicate customer records.
          - Ensure product keys remain unique after enrichment with category data.
       2. Data integration consistency
          - Validate gender logic (CRM as master, ERP as fallback).
          - Confirm correct values flow into gold.dim_customers.
       3. Foreign key integrity
          - Ensure fact_sales only references existing dimension keys (dim_customers, dim_products).

   Notes:
       - Queries are diagnostic only (no modifications to data).
       - Expected result of duplicate and integrity checks: no rows returned.
       - Run after ETL process to validate Gold layer quality.
================================================================================================= */

--Checking if the join created duplicates

SELECT cst_id, COUNT(*) FROM
(SELECT
    ci.cst_id,
    ci.cst_key,
    ci.cst_firstname,
    ci.cst_lastname,
    ci.cst_marital_status,
    ci.cst_gndr,
    ci.cst_create_date,
    ca.bdate,
    ca.gen,
    la.cntry
FROM silver.crm_cust_info AS ci
LEFT JOIN silver.erp_cust_az12 AS ca
ON      ci.cst_key = ca.cid
LEFT JOIN silver.erp_loc_a101 AS la
ON      ci.cst_key = la.cid)
t GROUP BY cst_id
HAVING COUNT(*) > 1


-- Checking data integration

SELECT DISTINCT
    ci.cst_gndr,
    ca.gen,
    CASE WHEN ci.cst_gndr != 'n/a' THEN ci.cst_gndr --let's consider the crm as the master
        ELSE COALESCE(ca.gen, 'n/a')
    END AS new_gen
FROM silver.crm_cust_info AS ci
LEFT JOIN silver.erp_cust_az12 AS ca
ON      ci.cst_key = ca.cid
LEFT JOIN silver.erp_loc_a101 AS la
ON      ci.cst_key = la.cid
ORDER BY 1,2

--check gold view
SELECT DISTINCT gender FROM gold.dim_customers


--- check if the prd_key is unique after the join
SELECT prd_key, COUNT(*) FROM (
SELECT
    pn.prd_id,
    pn.cat_id,
    pn.prd_key,
    pn.prd_nm,
    pn.prd_cost,
    pn.prd_line,
    pn.prd_start_dt,
    pc.cat,
    pc.subcat,
    pc.maintenance
FROM silver.crm_prd_info AS pn
LEFT JOIN silver.erp_px_cat_g1v2 AS pc
ON pn.cat_id = pc.id
WHERE prd_end_dt IS NULL -- filter out all historical data
)t GROUP BY prd_key
HAVING COUNT(*) > 1

-- Foreign key integrity (dimensions)
SELECT *
FROM gold.fact_sales AS f
LEFT JOIN gold.dim_customers AS c
ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products AS p
ON p.product_key = f.product_key
WHERE p.product_key IS NULL
