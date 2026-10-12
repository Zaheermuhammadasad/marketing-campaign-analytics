-- MySQL 8+; import source CSV as marketing_campaign first.
SELECT COUNT(*) AS row_count, COUNT(DISTINCT ID) AS distinct_customer_ids,
       COUNT(*) - COUNT(DISTINCT ID) AS duplicate_id_rows
FROM marketing_campaign;

SELECT SUM(Income IS NULL) AS missing_income_rows,
       SUM(Year_Birth <= 1900) AS birth_year_1900_or_earlier,
       MIN(Income) AS minimum_income, MAX(Income) AS maximum_income,
       AVG(Income) AS mean_income
FROM marketing_campaign;

SELECT Education, COUNT(*) AS customers
FROM marketing_campaign GROUP BY Education ORDER BY customers DESC;

SELECT Marital_Status, COUNT(*) AS customers
FROM marketing_campaign GROUP BY Marital_Status ORDER BY customers DESC;

-- Flag unusual records for review; do not delete automatically.
SELECT ID, Year_Birth, Income
FROM marketing_campaign
WHERE Year_Birth <= 1900 OR Income >= 200000 OR Income < 0
ORDER BY Income DESC;
