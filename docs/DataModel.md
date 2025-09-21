# Data Model

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
