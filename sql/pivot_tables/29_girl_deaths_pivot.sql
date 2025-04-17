-- Girl Deaths Completeness by Decade with Broad Regions as Columns
WITH disembark_regions AS (
  SELECT
    i.voyage_id,
    FLOOR(d.voyage_start_imputed_year / 10) * 10 AS decade,
    CAST(SUBSTR(CAST(i.primary_disembark_port AS STRING), 1, 1) AS INT64) * 10000 AS broad_region_code
  FROM `slave_voyages.voyages_itinerary` i
  JOIN `slave_voyages.voyages_dates` d ON i.voyage_id = d.voyage_id
  WHERE i.primary_disembark_port IS NOT NULL
),
labeled_regions AS (
  SELECT DISTINCT broad_region_value, broad_region
  FROM `slave_voyages.lookup_voyages_geographic_codes`
),
distinct_decades AS (
  SELECT DISTINCT FLOOR(voyage_start_imputed_year / 10) * 10 AS decade
  FROM `slave_voyages.voyages_dates`
),
all_combinations AS (
  SELECT d.decade, r.broad_region
  FROM distinct_decades d
  CROSS JOIN (SELECT DISTINCT broad_region FROM labeled_regions) r
),
percent_complete AS (
  SELECT
    r.broad_region,
    i.decade,
    COUNT(c.girl_died_passage) / COUNT(*) * 100 AS completeness_pct
  FROM `slave_voyages.voyages_slave_characteristics` c
  JOIN disembark_regions i ON c.voyage_id = i.voyage_id
  JOIN labeled_regions r ON i.broad_region_code = r.broad_region_value
  GROUP BY r.broad_region, i.decade
),
filled_data AS (
  SELECT
    a.decade,
    a.broad_region,
    IFNULL(p.completeness_pct, 0) AS completeness_pct
  FROM all_combinations a
  LEFT JOIN percent_complete p ON a.decade = p.decade AND a.broad_region = p.broad_region
)
SELECT * FROM filled_data
PIVOT (
  MAX(completeness_pct)
  FOR broad_region IN (
    'Europe',
    'Mainland North America',
    'Caribbean',
    'Spanish Mainland Americas',
    'Brazil',
    'Africa',
    'Middle East',
    'Asia',
    'Other'
  )
)
ORDER BY decade;