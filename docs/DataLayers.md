# Data Layers

<table>
  <thead>
    <tr>
      <th style="background-color:#cce5ff;">Category</th>
      <th style="background-color:#cd7f32;">Bronze Layer</th>
      <th style="background-color:#c0c0c0;">Silver Layer</th>
      <th style="background-color:#ffd700;">Gold Layer</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="background-color:#cce5ff;">Definition</td>
      <td>Raw, unprocessed data as-is from sources</td>
      <td>Clean & standardized data</td>
      <td>Business-Ready data</td>
    </tr>
    <tr>
      <td style="background-color:#cce5ff;">Objective</td>
      <td>Traceability & Debugging</td>
      <td>(Intermediate Layer)<br>Prepare Data for Analysis</td>
      <td>Provide data to be consumed<br>for reporting & Analytics</td>
    </tr>
    <tr>
      <td style="background-color:#cce5ff;">Object Type</td>
      <td>Tables</td>
      <td>Tables</td>
      <td>Views</td>
    </tr>
    <tr>
      <td style="background-color:#cce5ff;">Load Method</td>
      <td>Full Load<br>(Truncate & Insert)</td>
      <td>Full Load<br>(Truncate & Insert)</td>
      <td>None</td>
    </tr>
    <tr>
      <td style="background-color:#cce5ff;">Data Transformation</td>
      <td>None (as-is)</td>
      <td>- Data Cleaning<br>- Data Standardization<br>- Data Normalization<br>- Derived Columns<br>- Data Enrichment</td>
      <td>- Data Integration<br>- Data Aggregation<br>- Business Logic & Rules</td>
    </tr>
    <tr>
      <td style="background-color:#cce5ff;">Data Modeling</td>
      <td>None (as-is)</td>
      <td>None (as-is)</td>
      <td>- Start Schema<br>- Aggregated Objects<br>- Flat Tables</td>
    </tr>
    <tr>
      <td style="background-color:#cce5ff;">Target Audience</td>
      <td>- Data Engineers</td>
      <td>- Data Analysts<br>- Data Engineers</td>
      <td>- Data Analysts<br>- Business Users</td>
    </tr>
  </tbody>
</table>



``` mermaid

flowchart TB

%% ---------- BRONZE LAYER ----------
subgraph BRONZE["Bronze Layer"]
direction LR

b1["Analysing\nInterview source systems experts"]
b2["Coding\nData Ingestion"]
b3["Validating\nData Completeness & Schema Checks"]
b4["Docs & Version\nDocumenting\nVersioning in GIT"]

b1 --> b2 --> b3 --> b4
end
```

``` mermaid

flowchart TB


%% ---------- SILVER LAYER ----------
subgraph SILVER["Silver Layer"]
direction LR

s1["Analysing\nExplore & Understand the Data"]
s2["Coding\nData Cleansing"]
s3["Validating\nData Correctness checks"]
s4["Docs & Version\nDocumenting\nVersioning in GIT"]

s1 --> s2 --> s3 --> s4
end

```

``` mermaid

flowchart TB


%% ---------- GOLD LAYER ----------
subgraph GOLD["Gold Layer"]
direction LR

g1["Analysing\nExplore & Understand the Business Objects"]
g2["Coding\nData Integration"]
g3["Validating\nData Integration Checks"]
g4["Docs & Version\nDocumenting\nVersioning in GIT"]

g1 --> g2 --> g3 --> g4
end

```
