-- Import source CSV into MySQL 8+ as marketing_campaign.
SELECT COUNT(*) AS row_count,COUNT(DISTINCT ID) AS distinct_ids,COUNT(*)-COUNT(DISTINCT ID) AS duplicate_id_rows FROM marketing_campaign;
SELECT SUM(Income IS NULL) AS missing_income,SUM(Year_Birth<=1900) AS implausible_birth_years,MIN(Income) AS min_income,MAX(Income) AS max_income,AVG(Income) AS avg_income FROM marketing_campaign;
SELECT Education,COUNT(*) AS customers FROM marketing_campaign GROUP BY Education ORDER BY customers DESC;
SELECT Marital_Status,COUNT(*) AS customers FROM marketing_campaign GROUP BY Marital_Status ORDER BY customers DESC;
SELECT ID,Year_Birth,Income FROM marketing_campaign WHERE Year_Birth<=1900 OR Income>=200000 OR Income<0 ORDER BY Income DESC;
