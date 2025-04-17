# SQL Query Library

This folder contains SQL queries used to support the analysis and data visualizations in the **Slave Voyages Completeness Assessment**. Queries are grouped by type—temporal (decade), spatial (broad region), and pivoted views—allowing for flexible comparisons across gender, age, and mortality metrics.

---

## Folders & File Groups

### `/by_decade/`
Queries that group completeness metrics by **10-year intervals**.

- Completeness percentages of total embarkations, disembarkation, and deaths
- Completeness percentages by gender of embarkations, disembarkations, and deaths
- completeness percentages of girls (female children) regarding embarkation. disembarkation, and deaths

### `/by_broad_region/`
Queries that group completeness metrics by **broad disembarkation region**.

- Completeness percentages of total embarkations, disembarkation, and deaths
- Completeness percentages by gender of embarkations, disembarkations, and deaths
- Completeness percentages of girls (female children) regarding embarkation. disembarkation, and deaths

### `/pivot_tables/`
Pivoted versions of the decade and region queries, used for heatmaps and advanced visualizations in Tableau.

- Completeness percentages of total embarkations, disembarkation, and deaths
- Completeness percentages by gender of embarkations, disembarkations, and deaths
- Completeness percentages of girls (female children) regarding embarkation. disembarkation, and deaths

## Environment

- Platform: **Google BigQuery**
- Dataset: `slave_voyages`
- Tables Queried: `voyages_slave_characteristics`, `voyages_dates`, `voyages_meta_data`

Each query includes inline comments where relevant.

For full project documentation and context, refer to the [main README](https://github.com/edwardparlati/slave-voyages-completeness-audit/blob/main/README.md).
