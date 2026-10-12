# Business Insights — Marketing Campaign Analytics

## Data quality
The source has 2,240 customer records and 29 fields. Initial checks found no duplicate IDs and 24 missing income values. Three birth years are at or before 1900 and one income value is 666,666; these should be flagged for review rather than deleted automatically.

## Product spend
Recorded spend across six product groups totals 1,356,988 source monetary units. Mean spend is 605.80 per customer and median is 396. Wine is largest (680,816), followed by meat products (373,968). These can inform product-affinity hypotheses, but spend is not profit.

## Campaign response
334 customers have `Response = 1` (14.91%). Historical acceptance rates: Campaign 1 6.43%, Campaign 2 1.34%, Campaign 3 7.28%, Campaign 4 7.46%, Campaign 5 7.28%. These rates use the full dataset as denominator and are not controlled head-to-head tests.

## Purchase channels
Store purchases: 12,970; web: 9,150; catalog: 5,963. These are customer-level purchase counts, not event-level attribution or channel conversion rates.

## Recommendations
1. Profile customers using recency, spend, channel preference, and product mix with transparent definitions.
2. Test associations between historical acceptance and latest response.
3. Test wine/meat product-affinity messaging before scaling.
4. Review missing/extreme income and implausible birth years without silently deleting records.
5. Capture campaign cost, reach, clicks, conversions and margin, and use randomized holdouts to estimate incremental lift.

## Limitations
The dataset lacks ad spend, impressions/clicks, contribution margin, and a randomized holdout. Do not claim ROAS, CAC, incremental lift or causality.
