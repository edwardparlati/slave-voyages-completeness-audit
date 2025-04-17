-- Total Embarkation by Decade
SELECT
  FLOOR(d.voyage_start_imputed_year / 10) * 10 AS decade,
  COUNT(s.slaves_embarked_total) / COUNT(*) * 100 AS embarkation_completeness_pct
FROM `slave_voyages.voyages_slave_numbers` s
JOIN `slave_voyages.voyages_dates` d
  ON s.voyage_id = d.voyage_id
GROUP BY decade
ORDER BY decade;

-- Total Disembarkation by Decade
SELECT
  FLOOR(d.voyage_start_imputed_year / 10) * 10 AS decade,
  COUNT(s.slaves_disembarked_total) / COUNT(*) * 100 AS disembarkation_completeness_pct
FROM `slave_voyages.voyages_slave_numbers` s
JOIN `slave_voyages.voyages_dates` d
  ON s.voyage_id = d.voyage_id
GROUP BY decade
ORDER BY decade;

-- Total Deaths Completeness by Decade
SELECT
  FLOOR(d.voyage_start_imputed_year / 10) * 10 AS decade,
  COUNT(c.slave_death_total_derived) / COUNT(*) * 100 AS death_completeness_pct
FROM `slave_voyages.voyages_slave_characteristics` c
JOIN `slave_voyages.voyages_dates` d
  ON c.voyage_id = d.voyage_id
GROUP BY decade
ORDER BY decade;

-- Male vs Female Embarkation Completeness by Decade
SELECT
  FLOOR(d.voyage_start_imputed_year / 10) * 10 AS decade,
  COUNT(c.male_embark_total) / COUNT(*) * 100 AS male_embark_pct,
  COUNT(c.female_embark_total) / COUNT(*) * 100 AS female_embark_pct
FROM `slave_voyages.voyages_slave_characteristics` c
JOIN `slave_voyages.voyages_dates` d
  ON c.voyage_id = d.voyage_id
GROUP BY decade
ORDER BY decade;

-- Male vs Female Disembarkation Completeness by Decade
SELECT
  FLOOR(d.voyage_start_imputed_year / 10) * 10 AS decade,
  COUNT(c.male_arrival_total) / COUNT(*) * 100 AS male_disembark_pct,
  COUNT(c.female_arrival_total) / COUNT(*) * 100 AS female_disembark_pct
FROM `slave_voyages.voyages_slave_characteristics` c
JOIN `slave_voyages.voyages_dates` d
  ON c.voyage_id = d.voyage_id
GROUP BY decade
ORDER BY decade;

-- Male vs Female Deaths Completeness by Decade
SELECT
  FLOOR(d.voyage_start_imputed_year / 10) * 10 AS decade,
  COUNT(c.male_death_passage) / COUNT(*) * 100 AS male_death_pct,
  COUNT(c.female_death_passage) / COUNT(*) * 100 AS female_death_pct
FROM `slave_voyages.voyages_slave_characteristics` c
JOIN `slave_voyages.voyages_dates` d
  ON c.voyage_id = d.voyage_id
GROUP BY decade
ORDER BY decade;

-- Girl Embarkation Completeness by Decade
SELECT
  FLOOR(d.voyage_start_imputed_year / 10) * 10 AS decade,
  COUNT(c.girl_embark_port1) / COUNT(*) * 100 AS girl_embark_pct
FROM `slave_voyages.voyages_slave_characteristics` c
JOIN `slave_voyages.voyages_dates` d
  ON c.voyage_id = d.voyage_id
GROUP BY decade
ORDER BY decade;

-- Girl Disembarkation Completeness by Decade
SELECT
  FLOOR(d.voyage_start_imputed_year / 10) * 10 AS decade,
  COUNT(c.girl_arrival_total) / COUNT(*) * 100 AS girl_disembark_pct
FROM `slave_voyages.voyages_slave_characteristics` c
JOIN `slave_voyages.voyages_dates` d
  ON c.voyage_id = d.voyage_id
GROUP BY decade
ORDER BY decade;

-- Girl Deaths Completeness by Decade
SELECT
  FLOOR(d.voyage_start_imputed_year / 10) * 10 AS decade,
  COUNT(c.girl_died_passage) / COUNT(*) * 100 AS girl_death_pct
FROM `slave_voyages.voyages_slave_characteristics` c
JOIN `slave_voyages.voyages_dates` d
  ON c.voyage_id = d.voyage_id
GROUP BY decade
ORDER BY decade;