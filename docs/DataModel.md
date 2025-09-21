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

%% ---------- STILI SEMPLICI (compatibili GitHub) ----------
classDef laneTitle fill:#fff,stroke:#000,stroke-width:1,rx:6,ry:6;
classDef step fill:#ffffff,stroke:#222,rx:6,ry:6;
classDef bronze fill:#fff3e6,stroke:#cd7f32,stroke-width:2;
classDef silver fill:#f2f2f2,stroke:#9e9e9e,stroke-width:2;
classDef gold   fill:#fff8cc,stroke:#c9a200,stroke-width:2;

%% ---------- BRONZE LAYER ----------
subgraph BRONZE["Bronze Layer"]
direction LR

b1["Analysing\n\nInterview source systems experts"]:::step
b2["Coding\n\nData Ingestion"]:::step
b3["Validating\n\nData Completeness &\nSchema Checks"]:::step
b4["Docs & Version\n\nDocumenting\nVersioning in GIT"]:::step

b1 --> b2 --> b3 --> b4
end
class BRONZE laneTitle bronze

%% ---------- SILVER LAYER ----------
subgraph SILVER["Silver Layer"]
direction LR

s1["Analysing\n\nExplore & Understand\nthe Data"]:::step
s2["Coding\n\nData Cleansing"]:::step
s3["Validating\n\nData Correctness checks"]:::step
s4["Docs & Version\n\nDocumenting\nVersioning in GIT"]:::step

s1 --> s2 --> s3 --> s4
end
class SILVER laneTitle silver

%% ---------- GOLD LAYER ----------
subgraph GOLD["Gold Layer"]
direction LR

g1["Analysing\n\nExplore & Understand\nthe Business Objects"]:::step
g2["Coding\n\nData Integration"]:::step
g3["Validating\n\nData Integration Checks"]:::step
g4["Docs & Version\n\nDocumenting\nVersioning in GIT"]:::step

g1 --> g2 --> g3 --> g4
end
class GOLD laneTitle gold

```
