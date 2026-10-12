SELECT 'AcceptedCmp1' AS campaign_field,SUM(AcceptedCmp1) AS acceptances,AVG(AcceptedCmp1)*100 AS rate_pct FROM marketing_campaign
UNION ALL SELECT 'AcceptedCmp2',SUM(AcceptedCmp2),AVG(AcceptedCmp2)*100 FROM marketing_campaign
UNION ALL SELECT 'AcceptedCmp3',SUM(AcceptedCmp3),AVG(AcceptedCmp3)*100 FROM marketing_campaign
UNION ALL SELECT 'AcceptedCmp4',SUM(AcceptedCmp4),AVG(AcceptedCmp4)*100 FROM marketing_campaign
UNION ALL SELECT 'AcceptedCmp5',SUM(AcceptedCmp5),AVG(AcceptedCmp5)*100 FROM marketing_campaign
UNION ALL SELECT 'Response',SUM(Response),AVG(Response)*100 FROM marketing_campaign;
SELECT COUNT(*) AS customers,SUM(Response=1) AS latest_campaign_responders,AVG(Response)*100 AS latest_campaign_response_rate_pct FROM marketing_campaign;
SELECT Response,COUNT(*) AS customers,AVG(Income) AS average_income,AVG(Recency) AS average_recency_days,
AVG(NumWebVisitsMonth) AS average_monthly_web_visits,AVG(NumWebPurchases) AS average_web_purchases,
AVG(MntWines+MntFruits+MntMeatProducts+MntFishProducts+MntSweetProducts+MntGoldProds) AS average_spend
FROM marketing_campaign GROUP BY Response;
