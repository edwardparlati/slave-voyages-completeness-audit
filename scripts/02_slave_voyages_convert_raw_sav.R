# ─────────────────────────────────────────────────────────────
# Script: 02_slave_voyages_convert_raw_sav.R
# Purpose: Import the raw SPSS file and convert it to a flat dataset for initial inspection
# Author: Edward Parlati
# Last updated: April 17, 2025
# Project: Slave Voyages Completeness Assessment
# GitHub: https://github.com/edwardparlati/slave-voyages-completeness-audit
# ─────────────────────────────────────────────────────────────
# Description:
# This script imports the raw .sav file downloaded from the Slave Voyages Project
# and converts it into a flat CSV file (`voyages_dataset.csv`) for exploratory work.
#
# Key tasks:
# - Load the `.sav` file using haven
# - Save the raw dataset as a .csv with NA values set as empty strings
#
# Output:
# - `voyages_dataset.csv`, a flattened version of the raw Slave Voyages dataset
# ─────────────────────────────────────────────────────────────

### Retrieve files from the Slave Voyages website at https://www.slavevoyages.org/voyage/downloads#full-versions-of-the-trans-atlantic-slave-trade-database/0/en/

## Dataset tastdb-exp-2020.sav from https://www.slavevoyages.org/documents/download/tastdb-exp-2020.sav
## SPSS Codebook from https://www.slavevoyages.org/documents/download/SPSS_Codebook_2023-11-06.pdf

### Load the dataset
voyages_dataset <- read_sav("tastdb-exp-2020.sav")
glimpse(voyages_dataset)

### Save dataset as CSV
write_csv(voyages_dataset, file = "voyages_dataset.csv", na = "")

# ── End of 02_slave_voyages_convert_raw_sav.R ──