-- Total recorded product spend. This is not profit or margin.
SELECT COUNT(DISTINCT ID) AS customers,
       SUM(COALESCE(MntWines,0)+COALESCE(MntFruits,0)+COALESCE(MntMeatProducts,0)+COALESCE(MntFishProducts,0)+COALESCE(MntSweetProducts,0)+COALESCE(MntGoldProds,0)) AS total_product_spend,
       AVG(COALESCE(MntWines,0)+COALESCE(MntFruits,0)+COALESCE(MntMeatProducts,0)+COALESCE(MntFishProducts,0)+COALESCE(MntSweetProducts,0)+COALESCE(MntGoldProds,0)) AS average_spend_per_customer
FROM marketing_campaign;

-- Product category spending and share of all recorded product spend.
WITH product_spend AS (
    SELECT 'Wine' AS product_category, SUM(MntWines) AS total_spend FROM marketing_campaign
    UNION ALL SELECT 'Fruit', SUM(MntFruits) FROM marketing_campaign
    UNION ALL SELECT 'Meat', SUM(MntMeatProducts) FROM marketing_campaign
    UNION ALL SELECT 'Fish', SUM(MntFishProducts) FROM marketing_campaign
    UNION ALL SELECT 'Sweets', SUM(MntSweetProducts) FROM marketing_campaign
    UNION ALL SELECT 'Gold', SUM(MntGoldProds) FROM marketing_campaign
)
SELECT product_category, total_spend,
       ROUND(100 * total_spend / SUM(total_spend) OVER (), 2) AS share_of_spend_pct
FROM product_spend
ORDER BY total_spend DESC;

-- Customer-level purchase counts summed across the dataset; not conversion rate or attribution.
SELECT SUM(NumWebPurchases) AS web_purchases,
       SUM(NumCatalogPurchases) AS catalog_purchases,
       SUM(NumStorePurchases) AS store_purchases,
       SUM(NumDealsPurchases) AS deal_purchases
FROM marketing_campaign;

-- Compare customer-level purchase and spending metrics by recency.
SELECT CASE WHEN Recency < 30 THEN '0-29 days'
            WHEN Recency < 60 THEN '30-59 days'
            WHEN Recency < 90 THEN '60-89 days'
            ELSE '90+ days' END AS recency_segment,
       COUNT(*) AS customers,
       AVG(MntWines+MntFruits+MntMeatProducts+MntFishProducts+MntSweetProducts+MntGoldProds) AS average_spend,
       AVG(NumWebPurchases) AS average_web_purchases,
       AVG(NumStorePurchases) AS average_store_purchases
FROM marketing_campaign
GROUP BY recency_segment
ORDER BY MIN(Recency);