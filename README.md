# Historical Silences: Completeness Assessment of the Slave Voyages Dataset

This repository contains a solo data analysis project focused on evaluating the **completeness of key demographic fields** within the [Slave Voyages](https://www.slavevoyages.org/) dataset. The analysis investigates gaps in records related to **embarkation, disembarkation, and mortality**—especially among **women and girls**—across decades and geographic regions.

Originally developed as a capstone for the [Google Data Analytics Professional Certificate](https://www.coursera.org/professional-certificates/google-data-analytics), this project has been **significantly expanded and professionalized** into a full portfolio case study.

---

## Project Overview

The goal of this project was to **audit the completeness of coded fields** in a large historical dataset and to identify patterns in missingness across time and geography. 

The project includes:

- Cleaning and restructuring legacy SPSS data files in **R**
- Building a relational database schema and migrating data into **BigQuery**
- Creating lookup tables to decode coded variables (e.g., gender, age, outcomes)
- Performing SQL-based completeness audits
- Creating visualizations in **Tableau** to highlight data patterns
- Documenting the process in a reproducible format

---

## Repository Contents

- `data/` – Cleaned CSV files and lookup tables used in analysis
- `scripts/` – Modular R scripts used for cleaning, shaping, and validation
- `sql/` – SQL queries used for data completeness auditing and visualization support
- `visuals/` – Entity Relationship Diagram and Tableau screenshots
- `documents/` – Full Project Report and Appendices

---

## Tools Used

- **R** - Data cleaning and transformation
- **RMarkdown** - Documentation and reporting 
- SQL through **BigQuery** - Querying and analysizing data  
- **Tableau** - Data visualization 
- **Microsoft Excel** - Supplemental formatting  

---

## Data Source

Raw files and supporting documentation are available directly from the [Slave Voyages Project Downloads Page](https://www.slavevoyages.org/voyage/downloads):

- **Dataset:** [tastdb-exp-2020.sav](https://www.slavevoyages.org/documents/download/tastdb-exp-2020.sav)  
- **Codebook:** [SPSS_Codebook_2023-11-06.pdf](https://www.slavevoyages.org/documents/download/SPSS_Codebook_2023-11-06.pdf)

These were used to generate the cleaned, normalized dataset found in this repository.

---

## Key Findings

- Demographic fields for **women and girls** are often incomplete, especially in early records
- Completeness **improves over time**, with regional differences suggesting changes in recordkeeping
- Custom **lookup tables** made coded variables human-readable and analyzable
- Analysis supports future researchers in understanding and navigating the data’s limitations
  
---

## Contact

Created by **Edward Parlati**  
[LinkedIn](https://www.linkedin.com/in/edwardparlati) | [GitHub](https://github.com/edwardparlati)

---

> Want to explore the data for yourself? Check out the [SQL query library](./sql/README.md) or dive into the full [R script pipeline](./scripts/).
