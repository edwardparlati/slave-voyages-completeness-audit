# ─────────────────────────────────────────────────────────────
# Script: 05_slave_voyages_clean_tables_functions.R
# Purpose: Clean the full dataset to prepare for relational table extraction
# Author: Edward Parlati
# Last updated: April 17, 2025
# Project: Slave Voyages Completeness Assessment
# GitHub: https://github.com/edwardparlati/slave-voyages-completeness-audit
# ─────────────────────────────────────────────────────────────
# Description:
# This script applies preprocessing steps to the full dataset, preparing it for decomposition
# into normalized relational tables. These steps include handling missing values, standardizing
# formats, and cleaning specific field groupings.
#
# Key tasks:
# - Remove or transform problematic values
# - Standardize text, numeric, and categorical fields where necessary
# - Apply cleaning logic before table segmentation
#
# Output:
# - A cleaned `voyages_dataset` object ready for splitting into relational tables
# ─────────────────────────────────────────────────────────────

clean_table <- function(df) {
  df <- df %>%
    # Trim whitespace from character columns
    mutate(across(where(is.character), stringr::str_trim)) %>%
    
    # Convert empty strings to NA
    mutate(across(where(is.character), ~ na_if(., ""))) %>%
    
    # Remove extra spaces inside text values
    mutate(across(where(is.character), stringr::str_squish)) %>%
    
    # Title for Proper Nouns
    mutate(across(where(is.character), stringr::str_to_title)) %>%
    
    # Ensure correct data types
    mutate(voyage_id = as.integer(voyage_id)) %>%
    mutate(across(contains("date"), \(x) as.Date(x, format = "%Y-%m-%d"))) %>%
    mutate(across(where(is.numeric), as.numeric))
  
  # Convert evergreen if present
  if ("evergreen" %in% colnames(df)) {
    df <- df %>% mutate(evergreen = as.logical(evergreen))
  }
  
  # Remove duplicates
  df <- df %>% distinct(voyage_id, .keep_all = TRUE)
  
  return(df)
}

### Apply Cleaning Function to voyages_dataset.csv
voyages_dataset <- clean_table(voyages_dataset)

### Save the cleaned dataset
write_csv(voyages_dataset, file = "voyages_dataset.csv", na = "")

# ── End of 05_slave_voyages_clean_tables_functions.R ──