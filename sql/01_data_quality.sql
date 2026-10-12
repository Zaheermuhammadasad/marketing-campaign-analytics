-- MySQL 8+; import marketing_campaign.csv as marketing_campaign.
SELECT COUNT(*) AS row_count,
       COUNT(DISTINCT ID) AS distinct_customer_ids,
       COUNT(*) - COUNT(DISTINCT ID) AS duplicate_id_count
FROM marketing_campaign;

SELECT
  SUM(Income IS NULL) AS missing_income_rows,
  SUM(Year_Birth <= 1900) AS birth_year_review_rows,
  MIN(Income) AS minimum_income,
  MAX(Income) AS maximum_income,
  AVG(Income) AS average_income,
  AVG(Income) AS mean_income
FROM marketing_campaign;

-- Inspect unusual values; flag for review rather than automatically deleting.
SELECT ID, Year_Birth, Income, Education, Marital_Status
FROM marketing_campaign
WHERE Year_Birth <= 1900 OR Income >= 200000 OR Income < 0
ORDER BY Income DESC;

SELECT Education, COUNT(*) AS customers
FROM marketing_campaign
GROUP BY Education
ORDER BY customers DESC;

SELECT Marital_Status, COUNT(*) AS customers
FROM marketing_campaign
GROUP BY Marital_Status
ORDER BY customers DESC;