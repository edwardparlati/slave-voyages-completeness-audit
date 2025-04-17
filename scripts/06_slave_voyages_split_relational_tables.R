# ─────────────────────────────────────────────────────────────
# Script: 06_slave_voyages_split_relational_tables.R
# Purpose: Segment the cleaned dataset into 9 relational tables for structured analysis
# Author: Edward Parlati
# Last updated: April 17, 2025
# Project: Slave Voyages Completeness Assessment
# GitHub: https://github.com/edwardparlati/slave-voyages-completeness-audit
# ─────────────────────────────────────────────────────────────
# Description:
# This script partitions the fully cleaned `voyages_dataset` into 9 distinct relational tables.
# Each table corresponds to a core thematic grouping such as metadata, crew, outcomes, or dates.
# These tables are exported as CSVs and form the foundation of the structured SQL schema.
#
# Key tasks:
# - Extract columns into distinct dataframes based on logical groupings
# - Export each table to a dedicated CSV file
# - Confirm record counts and table structure using `head()`
#
# Output:
# - 9 cleaned and structured relational tables in CSV format
# ─────────────────────────────────────────────────────────────

### Create nine relational tables from voyages_dataset.csv
### 1. voyages_meta_data
voyages_meta_data <- voyages_dataset[ , c(1,88,264,274)]
if (nrow(voyages_meta_data) > 0) {
  write_csv(voyages_meta_data, file = "voyages_meta_data.csv", na = "")
}
head(voyages_meta_data)

### 2. voyages_ships_nations_owners
voyages_ships_nations_owners <- voyages_dataset[ , c(1,203,153,244,245,197,113,272,180,42,273,181,193,161:176,152,243)]
if (nrow(voyages_ships_nations_owners) > 0) {
  write_csv(voyages_ships_nations_owners, file = "voyages_ships_nations_owners.csv", na = "")
}
head(voyages_ships_nations_owners)

### 3. voyages_outcomes
voyages_outcomes <- voyages_dataset[ , c(1,89:92,194)]
if (nrow(voyages_outcomes) > 0) {
  write_csv(voyages_outcomes, file = "voyages_outcomes.csv", na = "")
}
head(voyages_outcomes)

### 4. voyages_itinerary
voyages_itinerary <- voyages_dataset[ , c(1,182,84:87,14,15,185,186,159,177:179,190:192,158,160,204,5,6,187:189,183,195,196,79,80,121,124,184,148,122,123,151,149,150)]
if (nrow(voyages_itinerary) > 0) {
  write_csv(voyages_itinerary, file = "voyages_itinerary.csv", na = "")
}
head(voyages_itinerary)

### 5. voyages_dates
voyages_dates <- voyages_dataset[ , c(1,67,69,70,50:52,81:83,53:61,76:78,62:64,66,65,75,72:74,68,71,251,265:268,249,250,271,269,270)]
if (nrow(voyages_dates) > 0) {
  write_csv(voyages_dates, file = "voyages_dates.csv", na = "")
}
head(voyages_dates)

### 6. voyages_crew
voyages_crew <- voyages_dataset[ , c(1,26:28,44:48,43,198:202,49,157)]
if (nrow(voyages_crew) > 0) {
  write_csv(voyages_crew, file = "voyages_crew.csv", na = "")
}
head(voyages_crew)

### 7. voyages_slave_numbers
voyages_slave_numbers <- voyages_dataset[ , c(1,224,223,154:156,246,247,205,210:212,222,209)]
if (nrow(voyages_slave_numbers) > 0) {
  write_csv(voyages_slave_numbers, file = "voyages_slave_numbers.csv", na = "")
}
head(voyages_slave_numbers)

### 8. voyages_slave_characteristics
voyages_slave_characteristics <- voyages_dataset[ , c(1,138,254,16,103,7,32,114,125,93,139,255,17,104,8,33,115,126,94,140,256,18,105,9,34,116,127,95,141,257,19,106,10,35,117,128,96,142,158,20,107,11,36,118,129,97,143,259,21,108,12,37,119,130,98,206,208,207,2,29,132,100,219,213,216,145,261,23,110,39,135,3,30,133,101,4,31,134,102,220,214,217,146,262,24,111,40,136,144,260,22,109,13,38,131,99,221,215,218,147,263,25,112,41,137,248,252,253,120)]
if (nrow(voyages_slave_characteristics) > 0) {
  write_csv(voyages_slave_characteristics, file = "voyages_slave_characteristics.csv", na = "")
}
head(voyages_slave_characteristics)

### 9. voyages_sources
voyages_sources <- voyages_dataset[ , c(1,225:242)]
if (nrow(voyages_sources) > 0) {
  write_csv(voyages_sources, file = "voyages_sources.csv", na = "")
}
head(voyages_sources)

# ── End of 06_slave_voyages_split_relational_tables.R ──