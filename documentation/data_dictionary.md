# Data Dictionary

Public source: `marketing_campaign.csv`, 2,240 customer rows and 29 original fields.

- Profile: `ID`, `Year_Birth`, `Education`, `Marital_Status`, `Income`, `Kidhome`, `Teenhome`, `Dt_Customer`.
- Behaviour: `Recency`, `NumDealsPurchases`, `NumWebPurchases`, `NumCatalogPurchases`, `NumStorePurchases`, `NumWebVisitsMonth`, `Complain`.
- Spend: `MntWines`, `MntFruits`, `MntMeatProducts`, `MntFishProducts`, `MntSweetProducts`, `MntGoldProds`.
- Campaign: `AcceptedCmp1`–`AcceptedCmp5` are historical acceptance flags; `Response` is the latest campaign response.
- `Z_CostContact` and `Z_Revenue` are source constants, not actual per-customer marketing cost/revenue for ROI.

Derived metrics:
- `total_spend`: row-wise sum of the six `Mnt*` columns.
- Latest response rate: mean of `Response` times 100.
- Historical acceptance rate: mean of one `AcceptedCmpN` flag times 100.
- Historical acceptance indicator: any historical acceptance flag equals 1, separate from latest response.
- Channel totals are purchase counts, not conversion rates.

Quality checks flag missing income, IQR income outliers, birth year <=1900, duplicate IDs, and date parsing issues. Flags should be inspected rather than silently discarded.
