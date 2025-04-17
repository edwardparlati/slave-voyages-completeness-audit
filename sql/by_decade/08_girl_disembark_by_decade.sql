SELECT
  FLOOR(d.voyage_start_imputed_year / 10) * 10 AS decade,
  COUNT(c.girl_arrival_total) / COUNT(*) * 100 AS girl_disembark_pct
FROM `slave_voyages.voyages_slave_characteristics` c
JOIN `slave_voyages.voyages_dates` d
  ON c.voyage_id = d.voyage_id
GROUP BY decade
ORDER BY decade;