# Data Dictionary

Dataset: `marketing_campaign.csv`, a customer-level public dataset with 2,240 rows and 29 source fields.

## Source field groups

- **Identity/profile:** `ID`, `Year_Birth`, `Education`, `Marital_Status`, `Income`, `Kidhome`, `Teenhome`, `Dt_Customer`.
- **Behaviour:** `Recency`, `NumDealsPurchases`, `NumWebPurchases`, `NumCatalogPurchases`, `NumStorePurchases`, `NumWebVisitsMonth`, `Complain`.
- **Product spending:** `MntWines`, `MntFruits`, `MntMeatProducts`, `MntFishProducts`, `MntSweetProducts`, `MntGoldProds`.
- **Campaign history:** `AcceptedCmp1`–`AcceptedCmp5` are historical acceptance flags; `Response` is the latest campaign response.
- **Source constants:** `Z_CostContact` and `Z_Revenue` are constants in this dataset, not campaign-specific cost observations suitable for ROI calculations.

## Derived metrics

- **total_spend:** row-wise sum of the six `Mnt*` product-group columns.
- **Latest campaign response rate:** average of `Response`, multiplied by 100.
- **Historical acceptance rate:** average of a particular `AcceptedCmpN` flag, multiplied by 100.
- **Accepted any historical campaign:** at least one of `AcceptedCmp1`–`AcceptedCmp5` equals 1.
- **Channel purchase count:** sum of a purchase-count field across customers; it is not a conversion rate.
- **Income IQR outlier / birth-year flag:** review flag; flagged rows are not automatically excluded.

## Initial quality checks

- 2,240 rows, 29 source fields, 2,240 distinct IDs.
- 0 duplicate customer IDs.
- 24 missing income values.
- 3 `Year_Birth` values less than or equal to 1900.
- One observed income value is 666,666; review its validity before using income in customer targeting.

See the Python script for reproducible checks and additional flags.