# Data Dictionary

Source: `marketing_campaign.csv`, a customer-level public dataset with 2,240 rows and 29 original fields.

- Profile: `ID`, `Year_Birth`, `Education`, `Marital_Status`, `Income`, `Kidhome`, `Teenhome`, `Dt_Customer`.
- Behaviour: `Recency`, `NumDealsPurchases`, `NumWebPurchases`, `NumCatalogPurchases`, `NumStorePurchases`, `NumWebVisitsMonth`, `Complain`.
- Spend: `MntWines`, `MntFruits`, `MntMeatProducts`, `MntFishProducts`, `MntSweetProducts`, `MntGoldProds`.
- Campaign: `AcceptedCmp1`–`AcceptedCmp5` are historical acceptance flags; `Response` is latest campaign response.
- `Z_CostContact` and `Z_Revenue` are source constants, not actual per-customer marketing costs suitable for ROI calculations.

Derived definitions: `total_spend` is the sum of the six `Mnt*` fields; latest response rate is mean of `Response` × 100; historical acceptance rate is mean of the relevant `AcceptedCmpN` × 100. Purchase channel totals are purchase counts, not conversion rates.

Quality checks flag missing income, IQR income outliers, implausible birth years, duplicate IDs and date parsing issues. Investigate flags; do not silently discard rows.
