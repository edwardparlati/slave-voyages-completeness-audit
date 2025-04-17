# Completeness Assessment of the Slave Voyages Dataset

This repository contains my capstone project for the [Google Data Analytics Certificate](https://www.coursera.org/professional-certificates/google-data-analytics). The project explores the completeness of key demographic fields in the Slave Voyages historical dataset, focusing on embarkation, disembarkation, and mortality data by gender, age, decade, and region.

---

## Project Overview

The goal of this project was to audit the completeness of coded data in a large historical dataset and to identify patterns in missingness across time and geography. 

The project includes:

- Cleaning and restructuring legacy SPSS data files in **R**
- Building a relational database schema and migrating data into **BigQuery**
- Constructing lookup tables for coded variables (e.g., gender, age, outcome)
- Performing SQL-based completeness audits
- Creating visualizations in **Tableau** to highlight data patterns
- Documenting the process using **RMarkdown**

---

## Contents

- `data/` – Cleaned CSV files used in analysis (if shared)
- `scripts/` – R scripts used for cleaning and reshaping the data
- `sql/` – SQL queries used for data completeness analysis in BigQuery
- `visuals/` – Tableau screenshots or exported dashboards
- `final_report/` – Capstone write-up or RMarkdown export (PDF/HTML)

---

## Tools Used

- R  
- RMarkdown  
- Google BigQuery (SQL)  
- Tableau  
- Excel  

---

## Key Findings

- A significant portion of demographic data is missing for women and girls across embarkation and mortality fields, especially in early decades
- Completeness improves over time, with regional variation suggesting shifts in recordkeeping practices
- Lookup tables enabled interpretable summaries for coded variables not readable in raw form

---

## Contact

Created by **Edward Parlati**  
[LinkedIn](https://www.linkedin.com/in/edwardparlati) | [GitHub](https://github.com/edwardparlati)  
