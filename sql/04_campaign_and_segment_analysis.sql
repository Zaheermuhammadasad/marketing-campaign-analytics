WITH customer_metrics AS (
SELECT ID,Income,Recency,Education,Marital_Status,Kidhome+Teenhome AS children_at_home,
COALESCE(MntWines,0)+COALESCE(MntFruits,0)+COALESCE(MntMeatProducts,0)+COALESCE(MntFishProducts,0)+COALESCE(MntSweetProducts,0)+COALESCE(MntGoldProds,0) AS total_spend,Response FROM marketing_campaign)
SELECT CASE WHEN total_spend<100 THEN 'Low (<100)' WHEN total_spend<500 THEN 'Mid (100-499)' WHEN total_spend<1000 THEN 'High (500-999)' ELSE 'Very high (1000+)' END AS spend_segment,
COUNT(*) AS customers,AVG(Response)*100 AS response_rate_pct,AVG(total_spend) AS average_spend,AVG(Income) AS average_income FROM customer_metrics GROUP BY spend_segment ORDER BY MIN(total_spend);
SELECT Education,COUNT(*) AS customers,AVG(Response)*100 AS response_rate_pct FROM marketing_campaign GROUP BY Education ORDER BY response_rate_pct DESC;
SELECT CASE WHEN Recency<30 THEN '0-29 days' WHEN Recency<60 THEN '30-59 days' WHEN Recency<90 THEN '60-89 days' ELSE '90+ days' END AS recency_segment,COUNT(*) AS customers,AVG(Response)*100 AS response_rate_pct FROM marketing_campaign GROUP BY recency_segment ORDER BY MIN(Recency);
