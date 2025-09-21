# Data Model

# Bronze, Silver and Gold Layers

| **Category**          | **Bronze Layer**                                                                 | **Silver Layer**                                                                                   | **Gold Layer**                                                                 |
|------------------------|----------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------|
| **Definition**         | Raw, unprocessed data as-is from sources                                         | Clean & standardized data                                                                          | Business-Ready data                                                             |
| **Objective**          | Traceability & Debugging                                                        | (Intermediate Layer) <br> Prepare Data for Analysis                                                | Provide data to be consumed <br> for reporting & Analytics                      |
| **Object Type**        | Tables                                                                           | Tables                                                                                             | Views                                                                          |
| **Load Method**        | Full Load <br> (Truncate & Insert)                                               | Full Load <br> (Truncate & Insert)                                                                | None                                                                           |
| **Data Transformation**| None (as-is)                                                                    | - Data Cleaning <br> - Data Standardization <br> - Data Normalization <br> - Derived Columns <br> - Data Enrichment | - Data Integration <br> - Data Aggregation <br> - Business Logic & Rules |
| **Data Modeling**      | None (as-is)                                                                    | None (as-is)                                                                                       | - Start Schema <br> - Aggregated Objects <br> - Flat Tables                     |
| **Target Audience**    | - Data Engineers                                                                | - Data Analysts <br> - Data Engineers                                                              | - Data Analysts <br> - Business Users                                          |

