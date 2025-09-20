# 📦 Project: Building a Modern SQL Data Warehouse

This project is a hands‑on implementation of a **modern SQL data warehouse built from scratch**, following industry best practices.  
The goal? To develop a solid understanding of the key skills needed to implement real‑world data‑warehousing projects—useful for both **data analysts** and **data engineers**.

---

## 📋 Project Description

The project focuses on **preparing data for analysis**, structured around three main stages:

### 🧱 Data Architecture  
Designing a clear, scalable, and efficient architecture based on **modern best practices**.

### 🛠️ Data Engineering  
Writing SQL code to **clean**, **transform**, **load**, and **prepare data** for analytics.

### 📊 Data Modeling  
Creating a **new data model from scratch**, optimized for performance, clarity, and analytical use.

---

## 🧰 Technologies Used

- **SQL Server 2022** (primary DB engine)  
- **Azure Data Studio** (IDE for SQL development)  
- Concepts easily adaptable to **PostgreSQL**, **MySQL**, and other RDBMS platforms  

---

## 🔄 ETL Process (Extract, Transform, Load)

A core component of this project is implementing a robust **ETL process**, with a focus on **efficiency** and **scalability**.  
Both **full extraction** and **incremental extraction** strategies are explored:

- **Extract** – pulling data from source systems  
- **Transform** – cleaning, enriching, and reshaping the data  
- **Load** – loading the transformed data into the data warehouse  

---

## 🚀 Quick Start

1. **Clone the repository**

   ```bash
   git clone https://github.com/yourusername/sql-data-warehouse.git
   ```

2. **Open the project** in *Azure Data Studio* (or your preferred SQL IDE)  
3. **Run the scripts** in `/scripts` in the following order:  
   1. `01_create_schema.sql`  
   2. `02_stage_data.sql`  
   3. `03_transform_data.sql`  
   4. `04_load_model.sql`  
4. **Explore** the final tables in the `warehouse` schema  

---

## 📁 Project Structure

```text
.
├── data/               # Sample or mock data for testing
├── scripts/            # SQL scripts: schema, ETL, transformations
├── models/             # ER diagrams or schema definitions
├── docs/               # Additional documentation, architecture diagrams
└── README.md
```

---

## 🔎 Transparency & Attribution

I built this project by **following along with Data With Baraa’s YouTube series** and adapting it to my own workflow and preferences:  
👉 <https://www.youtube.com/watch?v=9GVqKuTVANE&list=PLNcg_FV9n7qaUWeyUkPfiVtMbKlrfMqA8>

This repository contains **my personal implementation**:
- I wrote/organized the SQL and documentation myself.
- I adjusted naming, comments, and structure where helpful for learning.
- Any mistakes or differences from the video are my own.

I’m not affiliated with the creator; credit goes to **Data With Baraa** for the tutorial that inspired this work.

---

## 🧠 What I Learned

- Designing a **star schema** from scratch for analytics  
- Implementing **full and incremental ETL pipelines**  
- Managing dependencies between **staging**, **fact**, and **dimension** tables  
- Writing reusable and performant SQL with **CTEs**, **joins**, and **indexing**  

---

## ⚠️ Challenges Faced

- Avoiding **data duplication** during incremental loads  
- Maintaining **data quality and integrity** while scaling the process  

---

## 👤 About Me

Hi there! I’m **Roberto**—energy engineer by training, data nerd by passion.  
Over the years, I’ve worked across power meters, spreadsheets, and SQL queries, building **energy reports**, **interactive dashboards**, and now… even **data warehouses** from the ground up!

I truly believe data shouldn’t just be collected—it should be **understood**.  
I love getting hands‑on with projects like this, where I learn by doing (and, yes, sometimes by failing too).  
This project is my way of bridging theory with practice and leveling‑up my skills in the world of **data engineering**.

---

## 🔗 Connect with Me

- 💼 [LinkedIn](https://www.linkedin.com/in/roberto-cunego/)  
- 📫 **Email:** robertocunego94@gmail.com

---

## 📄 License

This project is intended for **educational and portfolio purposes**.  
Feel free to explore, fork, and learn!

# Data Flow Example

Ecco un diagramma disegnato con **Mermaid** direttamente dentro GitHub:

```mermaid
flowchart LR
  %% LAYOUT
  classDef src fill:#ffd966,stroke:#8a6d00,color:#000;
  classDef bronze fill:#fff4d6,stroke:#d1a75a,color:#000;
  classDef silver fill:#e6e6e6,stroke:#9e9e9e,color:#000;
  classDef gold fill:#ffe599,stroke:#b68900,color:#000;

  subgraph S["Sources"]
    CRM[[CRM]]
    ERP[[ERP]]
  end

  subgraph B["Bronze Layer"]
    b_sales[crm_sales_details]
    b_cust[crm_cust_info]
    b_prd[crm_prd_info]
    b_az12[erp_cust_az12]
    b_loc[erp_loc_a101]
    b_cat[erp_px_cat_g1v2]
  end

  subgraph SV["Silver Layer"]
    s_sales[crm_sales_details]
    s_cust[crm_cust_info]
    s_prd[crm_prd_info]
    s_az12[erp_cust_az12]
    s_loc[erp_loc_a101]
    s_cat[erp_px_cat_g1v2]
  end

  subgraph G["Gold Layer"]
    g_fact[fact_sales]
    g_dimc[dim_customers]
    g_dimp[dim_products]
  end

  %% Edges: Sources -> Bronze
  CRM --> b_sales
  CRM --> b_cust
  CRM --> b_prd
  ERP --> b_az12
  ERP --> b_loc
  ERP --> b_cat

  %% Bronze -> Silver
  b_sales --> s_sales
  b_cust  --> s_cust
  b_prd   --> s_prd
  b_az12  --> s_az12
  b_loc   --> s_loc
  b_cat   --> s_cat

  %% Silver -> Gold
  s_sales --> g_fact
  s_cust  --> g_dimc
  s_az12  --> g_dimc
  s_prd   --> g_dimp
  s_loc   --> g_dimp
  s_cat   --> g_dimp

  %% Styles
  class CRM,ERP src
  class b_sales,b_cust,b_prd,b_az12,b_loc,b_cat bronze
  class s_sales,s_cust,s_prd,s_az12,s_loc,s_cat silver
  class g_fact,g_dimc,g_dimp gold

  %% (Facoltativo) stile dei contenitori
  style S  fill:#f7f7f7,stroke:#bdbdbd,stroke-dasharray: 3 3
  style B  fill:#fffaf0,stroke:#e2b365
  style SV fill:#f2f2f2,stroke:#9e9e9e
  style G  fill:#fff4cc,stroke:#c8a100
%%{init: {'theme':'neutral'}}%%
```
