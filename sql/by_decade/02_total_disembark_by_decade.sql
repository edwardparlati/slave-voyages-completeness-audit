SELECT
  FLOOR(d.voyage_start_imputed_year / 10) * 10 AS decade,
  COUNT(s.slaves_disembarked_total) / COUNT(*) * 100 AS disembarkation_completeness_pct
FROM `slave_voyages.voyages_slave_numbers` s
JOIN `slave_voyages.voyages_dates` d
  ON s.voyage_id = d.voyage_id
GROUP BY decade
ORDER BY decade;