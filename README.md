# Marketing Campaign & Customer Analytics

End-to-end marketing analytics portfolio project using a public customer personality and campaign dataset. This repository demonstrates data-quality auditing, SQL, Python/Pandas, campaign response analysis, product spend analysis, customer segmentation, and a browser-based interactive dashboard.

**Tools:** SQL · MySQL · Python · Pandas · Plotly · GitHub

**Dataset:** [Public marketing_campaign.csv source](https://github.com/johng034/customer-segmentation/blob/master/marketing_campaign.csv)

## Verified source snapshot
- 2,240 customer records and 29 source fields.
- 24 missing income values.
- No duplicate customer IDs found in initial checks.
- 334 customers have `Response = 1` (14.91% latest-campaign response).
- Total recorded spend across six product groups: 1,356,988 source monetary units.
- Purchase counts: 9,150 web, 5,963 catalog, 12,970 store.

## Questions addressed
1. What share of customers responded to the latest campaign?
2. How do historical campaign acceptance fields compare?
3. Which product groups account for the largest recorded spend?
4. How do web/catalog/store purchase counts differ?
5. How do customer recency and spend relate to campaign response?
6. What data-quality risks must be reviewed before using the analysis for targeting?

## Scope and limitations
The source contains no media spend, reach/impressions, clicks, margin, or randomized holdout. The project therefore does not claim ROAS, CAC, incremental campaign lift, or causal campaign effects. Product spend is customer purchase value, not profit or advertising cost. Segment differences are descriptive and should inform test hypotheses rather than be treated as proof.

## Planned repository contents
- `sql/` — data-quality checks and campaign/customer analysis.
- `python/` — reproducible Pandas analysis.
- `dashboard/` — interactive dashboard and static preview.
- `analysis/` — findings and business recommendations.
- `documentation/` — data dictionary, setup guide, and CV/LinkedIn wording.
- `outputs/` — summary tables.
