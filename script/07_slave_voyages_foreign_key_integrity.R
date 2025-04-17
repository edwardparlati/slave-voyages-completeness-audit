# ─────────────────────────────────────────────────────────────
# Script: 07_slave_voyages_foreign_key_integrity.R
# Purpose: Verify that all relational tables maintain valid foreign key references to voyage_id
# Author: Edward Parlati
# Last updated: April 17, 2025
# Project: Slave Voyages Completeness Assessment
# GitHub: https://github.com/edwardparlati/slave-voyages-completeness-audit
# ─────────────────────────────────────────────────────────────
# Description:
# This script performs an integrity check across all relational tables to ensure that every
# `voyage_id` matches a corresponding record in the voyages_meta_data table. This validation
# confirms the consistency and joinability of the relational model.
#
# Key tasks:
# - Use `anti_join()` to detect unmatched foreign key values
# - Report any missing `voyage_id` entries by table
# - Print warnings and preview results for debugging
#
# Output:
# - Console output identifying any foreign key mismatches
# ─────────────────────────────────────────────────────────────

### Check Foreign Key Integrity
# Check for missing voyage_id references in each table
missing_voyage_ids <- list(
  ships_nations_owners = anti_join(voyages_ships_nations_owners, voyages_meta_data, by = "voyage_id"),
  outcomes = anti_join(voyages_outcomes, voyages_meta_data, by = "voyage_id"),
  itinerary = anti_join(voyages_itinerary, voyages_meta_data, by = "voyage_id"),
  dates = anti_join(voyages_dates, voyages_meta_data, by = "voyage_id"),
  crew = anti_join(voyages_crew, voyages_meta_data, by = "voyage_id"),
  slave_numbers = anti_join(voyages_slave_numbers, voyages_meta_data, by = "voyage_id"),
  slave_characteristics = anti_join(voyages_slave_characteristics, voyages_meta_data, by = "voyage_id"),
  sources = anti_join(voyages_sources, voyages_meta_data, by = "voyage_id")
)

# Display tables with missing foreign key references
for (table_name in names(missing_voyage_ids)) {
  if (nrow(missing_voyage_ids[[table_name]]) > 0) {
    cat("\n WARNING: Missing voyage_id references in", table_name, "\n")
    print(head(missing_voyage_ids[[table_name]]))
  }
}

# ── End of 07_slave_voyages_foreign_key_integrity.R ──