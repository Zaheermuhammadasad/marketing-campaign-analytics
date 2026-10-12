# Business Insights — Marketing Campaign Analytics

The following metrics were calculated from the public customer/campaign dataset. They are descriptive and should not be interpreted as causal campaign effects.

## 1. Latest campaign response was 14.91%

**Evidence:** 334 of 2,240 customers have `Response = 1`.

**Implication:** This is the observed response rate in the available sample. It does not establish incremental lift because there is no randomized holdout group.

**Recommendation:** Record campaign eligibility, reach, cost, clicks, conversions and a randomized holdout in the next campaign so future measurement can estimate lift.

## 2. Wine and meat were the largest product-spend groups

**Evidence:** Recorded spend totals were 680,816 for wine and 373,968 for meat products. All six `Mnt*` fields sum to 1,356,988.

**Implication:** Product groups can inform affinity hypotheses for content or cross-sell tests. These totals are historical spending, not profit or contribution margin.

**Recommendation:** Test product-specific messaging by customer segment and evaluate incremental margin, not spend alone.

## 3. Store purchase counts were highest among recorded channels

**Evidence:** Store purchases totalled 12,970, compared with 9,150 web and 5,963 catalog purchases.

**Implication:** These are customer-level purchase counts, not ad-channel attribution or conversion rates.

**Recommendation:** Connect campaign identifiers to purchase events and capture channel touchpoints before making budget-allocation claims.

## 4. Data quality needs explicit treatment

**Evidence:** Initial checks found 24 missing income values, three birth years at or before 1900, and an income value of 666,666.

**Recommendation:** Keep quality flags, investigate source records where possible, and run sensitivity checks with and without flagged rows. Do not silently delete unusual observations.

## 5. Historical campaign acceptance varied

**Evidence:** The five historical campaign flags range from 1.34% acceptance for `AcceptedCmp2` to 7.46% for `AcceptedCmp4`.

**Caution:** Campaigns may differ in timing, audience and context. These percentages are not a randomized head-to-head test.

## Recommended next experiment

Define a target segment before campaign launch, randomly assign eligible customers to treatment and holdout, record spend/reach/click/conversion and product margin, then compare conversion and incremental contribution with uncertainty intervals.

## Limitations

The dataset does not provide usable advertising spend, impressions, clicks, randomized control assignment or contribution margin. ROAS, CAC, incremental lift and causal campaign effectiveness cannot be estimated from these data alone.