# Data Dictionary

Source: `marketing_campaign.csv`, a customer-level table with 2,240 rows and 29 original fields.

## Customer attributes
- `ID`: source customer identifier.
- `Year_Birth`: birth year; investigate implausible values before deriving age.
- `Education`, `Marital_Status`: source categories.
- `Income`: reported income; 24 missing values in the initial check.
- `Kidhome`, `Teenhome`: children/teenagers at home.
- `Dt_Customer`: customer date; parse day-first.
- `Recency`: days since last purchase according to source.
- `Complain`: complaint indicator.

## Product spend
`MntWines`, `MntFruits`, `MntMeatProducts`, `MntFishProducts`, `MntSweetProducts`, `MntGoldProds`.
`total_spend` is their row-wise sum. It describes customer spending, not profit.

## Purchase behaviour
- `NumDealsPurchases`: discounted purchases.
- `NumWebPurchases`: web purchases.
- `NumCatalogPurchases`: catalogue purchases.
- `NumStorePurchases`: store purchases.
- `NumWebVisitsMonth`: source-defined monthly visits.

## Campaign fields
- `AcceptedCmp1`–`AcceptedCmp5`: historical campaign acceptance.
- `Response`: latest campaign response.
- `Z_CostContact`, `Z_Revenue`: source constants; not marketing-cost observations for ROI.

## Metric definitions
- Customer count: distinct `ID`.
- Latest response rate: mean of `Response` × 100.
- Historical acceptance rate: mean of each `AcceptedCmpN` × 100.
- Total spend: sum of six product spending fields.
- Channel totals: customer-level purchase counts, not conversion rates.
- Historical acceptance indicator: any historical `AcceptedCmpN` is 1; keep separate from `Response`.

Data-quality flags should be reviewed transparently and not silently removed.
