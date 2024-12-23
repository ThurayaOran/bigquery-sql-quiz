-- This query shows a list of the daily top Google Search terms.
SELECT
 term AS Top_Term,
 week as week,
 rank,
FROM `bigquery-public-data.google_trends.top_terms`
WHERE
 rank = 3
 -- Choose only the top term each day.
 AND week >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH )
 -- Filter to the last 2 weeks.
GROUP BY week, Top_Term, rank
ORDER BY week DESC
 -- Show the days in reverse chronological order.