SELECT
  FLOOR(d.voyage_start_imputed_year / 10) * 10 AS decade,
  COUNT(c.male_embark_total) / COUNT(*) * 100 AS male_embark_pct,
  COUNT(c.female_embark_total) / COUNT(*) * 100 AS female_embark_pct
FROM `slave_voyages.voyages_slave_characteristics` c
JOIN `slave_voyages.voyages_dates` d
  ON c.voyage_id = d.voyage_id
GROUP BY decade
ORDER BY decade;