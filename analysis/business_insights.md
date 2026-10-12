# Business Insights — Marketing Campaign Analytics

## Data quality
The source contains 2,240 customer records and 29 fields. Initial checks found no duplicate IDs and 24 missing income values. Three birth years are at or before 1900, and one income is an extreme high outlier (666,666). Flag them for review rather than deleting silently.

## Product spend
Recorded spend across six product groups totals 1,356,988 source monetary units. Mean spend is 605.80 per customer and median is 396. Wine is the largest group (680,816), followed by meat products (373,968). This can inform product-affinity hypotheses, but is not profit.

| Product group | Recorded spend |
|---|---:|
| Wine | 680,816 |
| Meat products | 373,968 |
| Gold products | 98,609 |
| Fish products | 84,057 |
| Sweet products | 60,621 |
| Fruits | 58,917 |

## Campaign response
334 customers have `Response = 1` (14.91%). Historical acceptance rates: Campaign 1 6.43%, Campaign 2 1.34%, Campaign 3 7.28%, Campaign 4 7.46%, Campaign 5 7.28%. These are descriptive rates using all customers as denominator, not controlled head-to-head tests.

## Purchase channels
Store purchases: 12,970; web: 9,150; catalog: 5,963. These are customer-level purchase counts, not event-level attribution or channel conversion rates.

## Recommendations
1. Profile customers with recency, spend, channel preference, and product mix, using transparent definitions.
2. Test whether historical acceptance is associated with latest response while controlling for observed characteristics.
3. Test product-affinity messaging around wine/meat before scaling.
4. Review missing/extreme income and implausible birth years; compare results with and without flagged rows.
5. Capture media cost, reach, clicks, conversions and margin in future campaigns; use randomized holdouts to estimate incremental lift.

## Limitations
The dataset lacks ad spend, impressions, clicks, randomized holdout and contribution margin. Do not claim ROAS, CAC, incremental lift or causality.
