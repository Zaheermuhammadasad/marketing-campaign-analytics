# Data Dictionary

Source: `marketing_campaign.csv`, a customer-level public dataset with 2,240 rows and 29 original fields.

- Profile: `ID`, `Year_Birth`, `Education`, `Marital_Status`, `Income`, `Kidhome`, `Teenhome`, `Dt_Customer`.
- Behaviour: `Recency`, `NumDealsPurchases`, `NumWebPurchases`, `NumCatalogPurchases`, `NumStorePurchases`, `NumWebVisitsMonth`, `Complain`.
- Spend: `MntWines`, `MntFruits`, `MntMeatProducts`, `MntFishProducts`, `MntSweetProducts`, `MntGoldProds`.
- Campaign: `AcceptedCmp1`–`AcceptedCmp5` are historical acceptance flags; `Response` is the latest campaign response.
- `Z_CostContact` and `Z_Revenue` are source constants; do not use as actual marketing cost or revenue to calculate ROI.

Definitions:
- `total_spend`: row-wise sum of the six `Mnt*` columns.
- Latest response rate: mean of `Response` × 100.
- Historical acceptance rate: mean of each `AcceptedCmpN` × 100.
- Historical acceptance indicator: any of the five historical campaign flags is 1; this is separate from current response.
- Channel totals are customer-level purchase counts, not conversion rates.

The pipeline flags missing income, income IQR outliers, implausible birth years, duplicate IDs and date parsing issues. Review flags transparently rather than silently discarding rows.
