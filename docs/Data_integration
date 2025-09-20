# Data Integration

```mermaid
flowchart LR
  %% Tema (facoltativo)
  %%{init: {'theme':'neutral'}}%%

  classDef card fill:#ffffff,stroke:#c9c9c9,rx:8,ry:8;
  classDef crm  fill:#eaf2ff,stroke:#6f9ae6,rx:10,ry:10;
  classDef erp  fill:#fff5dc,stroke:#e0b75a,rx:10,ry:10;
  classDef roleSales    fill:#e8dcf5,stroke:#b099d0,color:#000;
  classDef roleProduct  fill:#f9d7d5,stroke:#d69a96,color:#000;
  classDef roleCustomer fill:#dff0d8,stroke:#9ccc9c,color:#000;

  %% Sezioni
  subgraph CRM["CRM — Customer Relationship Management"]
    direction TB
    crm_sales["
      <b>crm_sales_details</b><br/>
      <small>prd_key<br/>cst_id</small><br/><hr/><i>SALES</i>"]:::card:::roleSales
    crm_prd["
      <b>crm_prd_info</b><br/>
      <small>prd_key</small><br/><hr/><i>PRODUCT</i>"]:::card:::roleProduct
    crm_cust["
      <b>crm_cust_info</b><br/>
      <small>cst_id<br/>cst_key</small><br/><hr/><i>CUSTOMER</i>"]:::card:::roleCustomer
  end
  class CRM crm

  subgraph ERP["ERP — Enterprise Resource Planning"]
    direction TB
    erp_cat["
      <b>erp_px_cat_g1v2</b><br/>
      <small>id</small><br/><hr/><i>PRODUCT</i>"]:::card:::roleProduct
    erp_az12["
      <b>erp_cust_az12</b><br/>
      <small>cid</small><br/><hr/><i>CUSTOMER</i>"]:::card:::roleCustomer
    erp_loc["
      <b>erp_loc_a101</b><br/>
      <small>cid</small><br/><hr/><i>CUSTOMER</i>"]:::card:::roleCustomer
  end
  class ERP erp

  %% Relazioni interne CRM
  crm_sales --> crm_prd
  crm_sales --> crm_cust

  %% Integrazione CRM ↔ ERP
  crm_prd ---| "prd_key → id" | erp_cat
  crm_cust ---| "cst_key → cid" | erp_az12
  crm_cust ---| "cst_key → cid" | erp_loc
```
