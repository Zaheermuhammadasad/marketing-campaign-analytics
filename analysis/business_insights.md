# Business Insights — Marketing Campaign Analytics

## Data quality
The source has 2,240 customer rows and 29 fields. Initial checks found no duplicate IDs and 24 missing income values. Three records have birth years at or before 1900 and one income value is 666,666; these should be flagged for review rather than automatically deleted.

## Product spend
Recorded spend across six product groups totals 1,356,988 source monetary units. Average customer spend is 605.80 and median is 396. Wine is the largest group (680,816), followed by meat products (373,968). Spend can inform product-affinity hypotheses, but it is not profit.

## Campaign response
334 customers have `Response = 1`, equal to 14.91% of the dataset. Historical acceptance rates are 6.43% (Campaign 1), 1.34% (Campaign 2), 7.28% (Campaign 3), 7.46% (Campaign 4), and 7.28% (Campaign 5). These are descriptive rates using the full dataset as denominator, not controlled head-to-head tests.

## Purchase channels
Store purchases total 12,970; web purchases 9,150; catalog purchases 5,963. These are customer-level purchase counts, not event-level attribution or channel conversion rates.

## Recommendations
1. Profile customers by spend, recency, channel preference, and product mix using transparent definitions.
2. Test associations between historical acceptance and current response while accounting for observed characteristics.
3. Test wine/meat affinity content hypotheses before scaling.
4. Review missing/extreme income and implausible birth years; compare results with and without flagged records.
5. Capture campaign cost, reach, clicks, conversions, and margin in future campaigns. Use a randomized holdout to estimate incremental lift.

## Limitations
The dataset does not contain media spend, impressions, clicks, randomized holdout, or contribution margin. Do not claim ROAS, CAC, incremental lift, or causality.
