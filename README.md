# healthcare-admissions-sql-analysis

## Overview
This project analyzes synthetic healthcare admissions data using SQL to identify
patterns in billing, admission types, length of stay, and insurance coverage.

## Tools Used
- SQLite
- DBeaver

## Dataset
Source: Kaggle – Healthcare Dataset (Synthetic)
The dataset contains patient admission records with information on medical
conditions, hospitals, insurance providers, billing amounts, and admission
details.

Key fields include:
- Medical Condition
- Admission Type
- Hospital
- Insurance Provider
- Billing Amount
- Date of Admission
- Discharge Date

## Analysis Questions
- What are the overall billing patterns across healthcare admissions?
- Which medical conditions drive the highest total costs?
- How do billing amounts compare across admission types?
- Does length of stay vary by admission type or medical condition?
- Are there notable differences in cost patterns across insurance providers?

## Key Findings
- Total billing across all admissions exceeds $1.4B, with average billing per
  admission around $25.5K.
- Differences in total cost across medical conditions are driven more by patient
  volume than by higher per-patient costs.
- Admission types show similar average billing amounts, indicating standardized
  pricing across visits.
- Length of stay is consistent across admission types and conditions, with only
  minor variation.
- Insurance providers exhibit balanced patient distribution and similar billing
  outcomes.

## How to Run
1. Open the SQLite database in DBeaver.
2. Import 'healthcare_dataset.csv' into SQLite and rename the table to 'healthcare'.
3. Run the queries in 'queries.sql' to reproduce the analysis.
4. Review summarized findings in 'insights.md'.

## Files
- 'queries.sql' – SQL queries used for analysis
- 'insights.md' – Summary of analytical findings
- 'healthcare_dataset.csv' – Source dataset
