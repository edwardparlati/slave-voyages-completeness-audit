## R Script Overview

This folder contains R scripts used to process the raw SPSS dataset (`tastdb-exp-2020.sav`) from the Slave Voyages Project into a series of cleaned, structured CSV files. These files form the foundation of the relational database used for analysis and visualization.

### Pipeline Script
- `00_slave_voyages_full_pipeline.R` – A full end-to-end script that loads the raw data, cleans it, and outputs the finalized tables. Ideal for running the entire process at once.

### Modular Scripts
Each modular script focuses on a specific step in the pipeline:

- `01_slave_voyages_load_libraries.R` – Loads all required R packages  
- `02_slave_voyages_convert_raw_sav.R` – Imports the original SPSS file and converts it to a working dataset  
- `03_slave_voyages_clean_column_names.R` – Standardizes and formats all column names  
- `04_slave_voyages_convert_data_types.R` – Converts key fields to appropriate data types (e.g. numeric, date)  
- `05_slave_voyages_clean_tables_functions.R` – Performs preprocessing to prepare for splitting into relational tables  
- `06_slave_voyages_split_into_relational_tables.R` – Breaks the dataset into 9 normalized relational tables  
- `07_slave_voyages_foreign_key_integrity.R` – Validates foreign key consistency across relational tables  
- `08_slave_voyages_ERD.R` – Generates an Entity Relationship Diagram to visualize table relationships  
- `09_slave_voyages_summary_clean_data.R` – Summarizes the final cleaned dataset and validates completeness

---

> These scripts are designed to be readable and reproducible, and can be run independently or as part of the full pipeline. For more context on the data and structure, refer to the `data/` and `reference/` folders.
