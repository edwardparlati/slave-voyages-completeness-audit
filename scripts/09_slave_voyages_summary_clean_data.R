# ─────────────────────────────────────────────────────────────
# Script: 09_slave_voyages_summary_clean_data.R
# Purpose: Perform a final summary and integrity check of all cleaned relational tables
# Author: Edward Parlati
# Last updated: April 17, 2025
# Project: Slave Voyages Completeness Assessment
# GitHub: https://github.com/edwardparlati/slave-voyages-completeness-audit
# ─────────────────────────────────────────────────────────────
# Description:
# This script performs a final integrity check and summary review of all relational tables
# created in the cleaning pipeline. It ensures there are no broken references and provides
# a basic statistical overview of each table to support verification and reporting.
#
# Key tasks:
# - Use `anti_join()` to re-validate foreign key integrity
# - Use `summary()` to generate descriptive stats for each table
# - Print warning messages and summaries to console
#
# Output:
# - Console warnings for any unmatched `voyage_id`s
# - Console summaries of each table’s cleaned state
# ─────────────────────────────────────────────────────────────

### Final Integrity Check
list_of_tables <- list(
  meta_data = voyages_meta_data,
  ships_nations_owners = voyages_ships_nations_owners,
  outcomes = voyages_outcomes,
  itinerary = voyages_itinerary,
  dates = voyages_dates,
  crew = voyages_crew,
  slave_numbers = voyages_slave_numbers,
  slave_characteristics = voyages_slave_characteristics,
  sources = voyages_sources
)

# Display any tables with missing voyage_id values
for (table_name in names(list_of_tables)) {
  missing_voyage_ids <- anti_join(list_of_tables[[table_name]], voyages_meta_data, by = "voyage_id")
  if (nrow(missing_voyage_ids) > 0) {
    cat("\n WARNING: Missing voyage_id references in", table_name, "\n")
    print(head(missing_voyage_ids))
  }
}

### Summary of Cleaned Data
for (table_name in names(list_of_tables)) {
  cat("\n Summary of", table_name, "\n")
  print(summary(list_of_tables[[table_name]]))
}

# ── End of 09_slave_voyages_summary_clean_data.R ──