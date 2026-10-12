# Data Dictionary

Dataset: `marketing_campaign.csv`, 2,240 customer records and 29 original fields.

## Customer attributes
- `ID`: source customer identifier.
- `Year_Birth`: birth year; investigate implausible values before deriving age.
- `Education`, `Marital_Status`: source categories.
- `Income`: reported income; 24 missing values in initial validation.
- `Kidhome`, `Teenhome`: children/teenagers at home.
- `Dt_Customer`: customer date; parse day-first.
- `Recency`: days since the last purchase according to the source.
- `Complain`: complaint indicator.

## Product spend
`MntWines`, `MntFruits`, `MntMeatProducts`, `MntFishProducts`, `MntSweetProducts`, `MntGoldProds`.
`total_spend` is the sum of the six `Mnt*` fields. It is recorded product spending, not profit.

## Purchase behaviour
- `NumDealsPurchases`: purchases made with a discount.
- `NumWebPurchases`: website purchases.
- `NumCatalogPurchases`: catalogue purchases.
- `NumStorePurchases`: in-store purchases.
- `NumWebVisitsMonth`: monthly web visits as defined by the source.

## Campaign fields
- `AcceptedCmp1` through `AcceptedCmp5`: historical campaign acceptance flags.
- `Response`: latest campaign response.
- `Z_CostContact`, `Z_Revenue`: source constants; not customer-level cost/revenue observations for ROI.

## Metric definitions
- Customer count: distinct `ID`.
- Latest response rate: mean of `Response` times 100.
- Historical acceptance rate: mean of each `AcceptedCmpN` times 100.
- Total spend: row-wise sum of six product-spend columns.
- Channel purchase mix: sum of recorded purchase counts across customers, not event-level conversion.
- IQR income outlier and birth-year flags are review flags; flagged observations are not silently removed.
