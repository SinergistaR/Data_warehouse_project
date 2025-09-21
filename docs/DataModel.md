# Data Model

```mermaid

%% Mermaid table: Bronze / Silver / Gold comparison
table
  title Bronze, Silver and Gold Layers
  header Definition, Bronze Layer, Silver Layer, Gold Layer

  row Definition, "Raw, unprocessed data as-is from sources", "Clean & standardized data", "Business-Ready data"
  row Objective, "Traceability & Debugging", "(Intermediate Layer)\nPrepare Data for Analysis", "Provide data to be consumed\nfor reporting & Analytics"
  row Object Type, Tables, Tables, Views
  row Load Method, "Full Load (Truncate & Insert)", "Full Load (Truncate & Insert)", None
  row Data Transformation, "None (as-is)", "- Data Cleaning\n- Data Standardization\n- Data Normalization\n- Derived Columns\n- Data Enrichment", "- Data Integration\n- Data Aggregation\n- Business Logic & Rules"
  row Data Modeling, "None (as-is)", "None (as-is)", "- Start Schema\n- Aggregated Objects\n- Flat Tables"
  row Target Audience, "- Data Engineers", "- Data Analysts\n- Data Engineers", "- Data Analysts\n- Business Users"


```
