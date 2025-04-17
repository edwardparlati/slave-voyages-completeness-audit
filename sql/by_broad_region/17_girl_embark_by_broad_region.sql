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