SELECT COUNT(DISTINCT ID) AS customers,
 SUM(COALESCE(MntWines,0)+COALESCE(MntFruits,0)+COALESCE(MntMeatProducts,0)+COALESCE(MntFishProducts,0)+COALESCE(MntSweetProducts,0)+COALESCE(MntGoldProds,0)) AS total_product_spend,
 AVG(COALESCE(MntWines,0)+COALESCE(MntFruits,0)+COALESCE(MntMeatProducts,0)+COALESCE(MntFishProducts,0)+COALESCE(MntSweetProducts,0)+COALESCE(MntGoldProds,0)) AS avg_spend_per_customer
FROM marketing_campaign;
SELECT product_category, SUM(spend_amount) AS total_spend FROM (
 SELECT 'Wine' AS product_category, MntWines AS spend_amount FROM marketing_campaign
 UNION ALL SELECT 'Fruit', MntFruits FROM marketing_campaign
 UNION ALL SELECT 'Meat', MntMeatProducts FROM marketing_campaign
 UNION ALL SELECT 'Fish', MntFishProducts FROM marketing_campaign
 UNION ALL SELECT 'Sweets', MntSweetProducts FROM marketing_campaign
 UNION ALL SELECT 'Gold', MntGoldProds FROM marketing_campaign
) p GROUP BY product_category ORDER BY total_spend DESC;
SELECT SUM(NumWebPurchases) AS web_purchases, SUM(NumCatalogPurchases) AS catalog_purchases,
       SUM(NumStorePurchases) AS store_purchases, SUM(NumDealsPurchases) AS deal_purchases
FROM marketing_campaign;
