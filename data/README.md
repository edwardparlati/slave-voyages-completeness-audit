# Cleaned Data Files

This folder contains all CSV files used for analysis in this project. They fall into two groups:

### Relational Tables (Cleaned from Original SPSS File)
- voyages_crew.csv
- voyages_dates.csv
- voyages_itinerary.csv
- voyages_meta_data.csv
- voyages_outcomes.csv
- voyages_ships_nations_owners.csv
- voyages_slave_characteristics.csv
- voyages_slave_numbers.csv
- voyages_sources.csv

### Lookup Tables (For Decoding Coded Fields)
- lookup_african_resistance_outcome_codes.csv
- lookup_capture_outcomes_codes.csv
- lookup_grouping_code_codes.csv
- lookup_nationality_codes.csv
- lookup_owner_outcome_codes.csv
- lookup_rig_type_codes.csv
- lookup_slave_outcome_codes.csv
- lookup_tonnage_type_codes.csv
- lookup_voyage_outcome_codes.csv
- lookup_voyages_geographic_codes.csv

All files were cleaned and exported using R, then used in BigQuery and Tableau for analysis. Each file represents a table in the relational model.

Note: Original SPSS file available at [Slave Voyages Downloads](https://www.slavevoyages.org/voyage/downloads).
