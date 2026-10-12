# Business Insights — Marketing Campaign Analytics

## Data quality
The public source has 2,240 customer records and 29 fields. Initial inspection found no duplicate customer IDs and 24 missing income values. Three birth years are at or before 1900 and one income value is 666,666; flag these for review rather than deleting automatically.

## Product spending
Recorded spend across six product groups totals 1,356,988 source monetary units. Average is 605.80 per customer and median is 396. Wine is largest (680,816), followed by meat products (373,968). These can inform product-affinity hypotheses, but spend is not profit.

## Campaign response
The latest campaign's `Response` field is positive for 334 customers (14.91%). Historical acceptance rates: Campaign 1 6.43%, Campaign 2 1.34%, Campaign 3 7.28%, Campaign 4 7.46%, Campaign 5 7.28%. These are descriptive rates, not controlled comparisons.

## Purchase channels
Recorded counts are 12,970 store purchases, 9,150 web purchases, and 5,963 catalog purchases. These customer-level counts are not conversion rates.

## Recommendations
1. Profile customers using recency, spend, channel preference, and product mix with clear definitions.
2. Test associations between historical acceptance and latest response.
3. Test wine/meat product-affinity messaging before scaling.
4. Review missing/extreme income and implausible birth years; retain quality flags.
5. Capture ad spend, reach, clicks, conversions and margin, using a randomized holdout for incremental lift.

## Limitations
The data lacks ad spend, impressions/clicks, contribution margin, and randomized holdout. Do not claim ROAS, CAC, incremental lift or causality.
