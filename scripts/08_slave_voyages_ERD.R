# ─────────────────────────────────────────────────────────────
# Script: 08_slave_voyages_ERD.R
# Purpose: Generate an Entity Relationship Diagram (ERD) from the relational tables
# Author: Edward Parlati
# Last updated: April 17, 2025
# Project: Slave Voyages Completeness Assessment
# GitHub: https://github.com/edwardparlati/slave-voyages-completeness-audit
# ─────────────────────────────────────────────────────────────
# Description:
# This script uses the `{dm}` package to generate an Entity Relationship Diagram
# from the 9 cleaned relational tables. The diagram helps visualize how the tables relate
# to one another through primary and foreign keys, and confirms the integrity of the schema.
#
# Key tasks:
# - Declare primary keys for each table
# - Declare foreign key relationships from each table to voyages_meta_data
# - Render the ERD using `dm_draw()` and export as an SVG
# - Run constraint checks to validate the diagram's logic
#
# Output:
# - `voyages_erd.svg` (entity relationship diagram)
# - Console output from `dm_examine_constraints()`
# ─────────────────────────────────────────────────────────────

### Create Entity Relationship Diagram with {dm}

# Create the dm_model with all required tables
dm_model <- dm(
  voyages_meta_data,
  voyages_ships_nations_owners,
  voyages_outcomes,
  voyages_itinerary,
  voyages_dates,
  voyages_crew,
  voyages_slave_numbers,
  voyages_slave_characteristics,
  voyages_sources
) %>%
  
  # Primary keys for each table
  dm_add_pk(voyages_meta_data, voyage_id) %>%
  dm_add_pk(voyages_ships_nations_owners, voyage_id) %>%
  dm_add_pk(voyages_outcomes, voyage_id) %>%
  dm_add_pk(voyages_itinerary, voyage_id) %>%
  dm_add_pk(voyages_dates, voyage_id) %>%
  dm_add_pk(voyages_crew, voyage_id) %>%
  dm_add_pk(voyages_slave_numbers, voyage_id) %>%
  dm_add_pk(voyages_slave_characteristics, voyage_id) %>%
  dm_add_pk(voyages_sources, voyage_id) %>%
  
  # Foreign key relationships (each table to voyages_meta_data on voyage_id)
  dm_add_fk(voyages_ships_nations_owners, voyage_id, voyages_meta_data) %>%
  dm_add_fk(voyages_outcomes, voyage_id, voyages_meta_data) %>%
  dm_add_fk(voyages_itinerary, voyage_id, voyages_meta_data) %>%
  dm_add_fk(voyages_dates, voyage_id, voyages_meta_data) %>%
  dm_add_fk(voyages_crew, voyage_id, voyages_meta_data) %>%
  dm_add_fk(voyages_slave_numbers, voyage_id, voyages_meta_data) %>%
  dm_add_fk(voyages_slave_characteristics, voyage_id, voyages_meta_data) %>%
  dm_add_fk(voyages_sources, voyage_id, voyages_meta_data)

# Visualize the ERD
dm_draw(dm_model)

# Save the ERD as SVG
dm_draw(dm_model) %>% export_svg() %>% writeLines("voyages_erd.svg")

# Check primary and foreign key restraints
dm_examine_constraints(dm_model)

# ── End of 08_slave_voyages_ERD.R ──