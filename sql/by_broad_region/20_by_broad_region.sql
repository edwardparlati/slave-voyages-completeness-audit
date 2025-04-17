-- Total Disembarkation Completeness by Broad Region
WITH disembark_regions AS (
  SELECT
    i.voyage_id,
    CAST(SUBSTR(CAST(i.primary_disembark_port AS STRING), 0, 1) AS INT64) * 10000 AS broad_region_code
  FROM `slave_voyages.voyages_itinerary` i
  WHERE i.primary_disembark_port IS NOT NULL
),
labeled_regions AS (
  SELECT DISTINCT broad_region_value, broad_region
  FROM `slave_voyages.lookup_voyages_geographic_codes`
),
completeness AS (
  SELECT
    r.broad_region,
    COUNT(s.slaves_disembarked_total) / COUNT(*) * 100 AS disembarkation_completeness_pct
  FROM `slave_voyages.voyages_slave_numbers` s
  JOIN disembark_regions i ON s.voyage_id = i.voyage_id
  JOIN labeled_regions r ON i.broad_region_code = r.broad_region_value
  GROUP BY r.broad_region
)
SELECT * FROM completeness
ORDER BY disembarkation_completeness_pct DESC;

-- Total Embarkation Completeness by Broad Region
WITH disembark_regions AS (
  SELECT
    i.voyage_id,
    CAST(SUBSTR(CAST(i.primary_disembark_port AS STRING), 0, 1) AS INT64) * 10000 AS broad_region_code
  FROM `slave_voyages.voyages_itinerary` i
  WHERE i.primary_disembark_port IS NOT NULL
),
labeled_regions AS (
  SELECT DISTINCT broad_region_value, broad_region
  FROM `slave_voyages.lookup_voyages_geographic_codes`
),
completeness AS (
  SELECT
    r.broad_region,
    COUNT(s.slaves_embarked_total) / COUNT(*) * 100 AS embarkation_completeness_pct
  FROM `slave_voyages.voyages_slave_numbers` s
  JOIN disembark_regions i ON s.voyage_id = i.voyage_id
  JOIN labeled_regions r ON i.broad_region_code = r.broad_region_value
  GROUP BY r.broad_region
)
SELECT * FROM completeness
ORDER BY embarkation_completeness_pct DESC;

-- Total Deaths Completeness by Broad Region
WITH disembark_regions AS (
  SELECT
    i.voyage_id,
    CAST(SUBSTR(CAST(i.primary_disembark_port AS STRING), 0, 1) AS INT64) * 10000 AS broad_region_code
  FROM `slave_voyages.voyages_itinerary` i
  WHERE i.primary_disembark_port IS NOT NULL
),
labeled_regions AS (
  SELECT DISTINCT broad_region_value, broad_region
  FROM `slave_voyages.lookup_voyages_geographic_codes`
),
completeness AS (
  SELECT
    r.broad_region,
    COUNT(c.slave_death_total_derived) / COUNT(*) * 100 AS death_completeness_pct
  FROM `slave_voyages.voyages_slave_characteristics` c
  JOIN disembark_regions i ON c.voyage_id = i.voyage_id
  JOIN labeled_regions r ON i.broad_region_code = r.broad_region_value
  GROUP BY r.broad_region
)
SELECT * FROM completeness
ORDER BY death_completeness_pct DESC;

-- Male vs Female Embarkation Completeness by Broad Region
WITH disembark_regions AS (
  SELECT
    i.voyage_id,
    CAST(SUBSTR(CAST(i.primary_disembark_port AS STRING), 0, 1) AS INT64) * 10000 AS broad_region_code
  FROM `slave_voyages.voyages_itinerary` i
  WHERE i.primary_disembark_port IS NOT NULL
),
labeled_regions AS (
  SELECT DISTINCT broad_region_value, broad_region
  FROM `slave_voyages.lookup_voyages_geographic_codes`
),
completeness AS (
  SELECT
    r.broad_region,
    COUNT(c.male_embark_total) / COUNT(*) * 100 AS male_embark_pct,
    COUNT(c.female_embark_total) / COUNT(*) * 100 AS female_embark_pct
  FROM `slave_voyages.voyages_slave_characteristics` c
  JOIN disembark_regions i ON c.voyage_id = i.voyage_id
  JOIN labeled_regions r ON i.broad_region_code = r.broad_region_value
  GROUP BY r.broad_region
)
SELECT * FROM completeness
ORDER BY broad_region;

-- Male vs Female Disembarkation Completeness by Broad Region
WITH disembark_regions AS (
  SELECT
    i.voyage_id,
    CAST(SUBSTR(CAST(i.primary_disembark_port AS STRING), 0, 1) AS INT64) * 10000 AS broad_region_code
  FROM `slave_voyages.voyages_itinerary` i
  WHERE i.primary_disembark_port IS NOT NULL
),
labeled_regions AS (
  SELECT DISTINCT broad_region_value, broad_region
  FROM `slave_voyages.lookup_voyages_geographic_codes`
),
completeness AS (
  SELECT
    r.broad_region,
    COUNT(c.male_arrival_total) / COUNT(*) * 100 AS male_disembark_pct,
    COUNT(c.female_arrival_total) / COUNT(*) * 100 AS female_disembark_pct
  FROM `slave_voyages.voyages_slave_characteristics` c
  JOIN disembark_regions i ON c.voyage_id = i.voyage_id
  JOIN labeled_regions r ON i.broad_region_code = r.broad_region_value
  GROUP BY r.broad_region
)
SELECT * FROM completeness
ORDER BY broad_region;

-- Male vs Female Deaths Completeness by Broad Region
WITH disembark_regions AS (
  SELECT
    i.voyage_id,
    CAST(SUBSTR(CAST(i.primary_disembark_port AS STRING), 0, 1) AS INT64) * 10000 AS broad_region_code
  FROM `slave_voyages.voyages_itinerary` i
  WHERE i.primary_disembark_port IS NOT NULL
),
labeled_regions AS (
  SELECT DISTINCT broad_region_value, broad_region
  FROM `slave_voyages.lookup_voyages_geographic_codes`
),
completeness AS (
  SELECT
    r.broad_region,
    COUNT(c.male_death_passage) / COUNT(*) * 100 AS male_death_pct,
    COUNT(c.female_death_passage) / COUNT(*) * 100 AS female_death_pct
  FROM `slave_voyages.voyages_slave_characteristics` c
  JOIN disembark_regions i ON c.voyage_id = i.voyage_id
  JOIN labeled_regions r ON i.broad_region_code = r.broad_region_value
  GROUP BY r.broad_region
)
SELECT * FROM completeness
ORDER BY broad_region;

-- Girl Embarkation Completeness by Broad Region
WITH disembark_regions AS (
  SELECT
    i.voyage_id,
    CAST(SUBSTR(CAST(i.primary_disembark_port AS STRING), 0, 1) AS INT64) * 10000 AS broad_region_code
  FROM `slave_voyages.voyages_itinerary` i
  WHERE i.primary_disembark_port IS NOT NULL
),
labeled_regions AS (
  SELECT DISTINCT broad_region_value, broad_region
  FROM `slave_voyages.lookup_voyages_geographic_codes`
),
completeness AS (
  SELECT
    r.broad_region,
    COUNT(c.girl_embark_port1) / COUNT(*) * 100 AS girl_embark_pct
  FROM `slave_voyages.voyages_slave_characteristics` c
  JOIN disembark_regions i ON c.voyage_id = i.voyage_id
  JOIN labeled_regions r ON i.broad_region_code = r.broad_region_value
  GROUP BY r.broad_region
)
SELECT * FROM completeness
ORDER BY broad_region;

-- Girl Disembarkation Completeness by Broad Region
WITH disembark_regions AS (
  SELECT
    i.voyage_id,
    CAST(SUBSTR(CAST(i.primary_disembark_port AS STRING), 0, 1) AS INT64) * 10000 AS broad_region_code
  FROM `slave_voyages.voyages_itinerary` i
  WHERE i.primary_disembark_port IS NOT NULL
),
labeled_regions AS (
  SELECT DISTINCT broad_region_value, broad_region
  FROM `slave_voyages.lookup_voyages_geographic_codes`
),
completeness AS (
  SELECT
    r.broad_region,
    COUNT(c.girl_arrival_total) / COUNT(*) * 100 AS girl_disembark_pct
  FROM `slave_voyages.voyages_slave_characteristics` c
  JOIN disembark_regions i ON c.voyage_id = i.voyage_id
  JOIN labeled_regions r ON i.broad_region_code = r.broad_region_value
  GROUP BY r.broad_region
)
SELECT * FROM completeness
ORDER BY broad_region;

-- Girl Deaths Completeness by Broad Region
WITH disembark_regions AS (
  SELECT
    i.voyage_id,
    CAST(SUBSTR(CAST(i.primary_disembark_port AS STRING), 0, 1) AS INT64) * 10000 AS broad_region_code
  FROM `slave_voyages.voyages_itinerary` i
  WHERE i.primary_disembark_port IS NOT NULL
),
labeled_regions AS (
  SELECT DISTINCT broad_region_value, broad_region
  FROM `slave_voyages.lookup_voyages_geographic_codes`
),
completeness AS (
  SELECT
    r.broad_region,
    COUNT(c.girl_died_passage) / COUNT(*) * 100 AS girl_death_pct
  FROM `slave_voyages.voyages_slave_characteristics` c
  JOIN disembark_regions i ON c.voyage_id = i.voyage_id
  JOIN labeled_regions r ON i.broad_region_code = r.broad_region_value
  GROUP BY r.broad_region
)
SELECT * FROM completeness
ORDER BY broad_region;