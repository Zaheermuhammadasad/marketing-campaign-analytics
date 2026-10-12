# Marketing Campaign & Customer Analytics

An end-to-end marketing analytics portfolio project using a public customer personality and campaign dataset. It demonstrates data-quality auditing, SQL, Python/Pandas, campaign response analysis, product spend analysis, customer segmentation, and a browser-based interactive dashboard.

**Tools:** SQL · MySQL · Python · Pandas · Plotly · GitHub

**[Open the interactive dashboard](https://htmlpreview.github.io/?https://github.com/Zaheermuhammadasad/marketing-campaign-analytics/blob/main/dashboard/marketing_campaign_dashboard.html)** · [Business insights](analysis/business_insights.md) · [Data dictionary](documentation/data_dictionary.md) · [CV/LinkedIn entry](documentation/cv_linkedin_project_entry.md)

![Dashboard preview](dashboard/dashboard_preview.svg)

## Verified source snapshot
- 2,240 customer records and 29 source fields.
- 24 missing income values; no duplicate customer IDs in initial checks.
- 334 customers have `Response = 1` (14.91% latest-campaign response).
- Total recorded spend across six product groups: 1,356,988 source monetary units.
- Purchase counts: 9,150 web, 5,963 catalog, 12,970 store.

## Questions addressed
1. What share of customers responded to the latest campaign?
2. How do historical campaign acceptance fields compare?
3. Which product groups account for the largest recorded spend?
4. How do web/catalog/store purchase counts differ?
5. How do recency and spend relate to current response?
6. What data-quality risks should be reviewed before targeting?

## Scope and limitations
The dataset has no media spend, reach/impressions, clicks, margin, or randomized holdout. It therefore cannot support credible claims of ROAS, CAC, incremental campaign lift, or causal campaign impact. Product spend is customer purchase value, not profit or ad cost. Segment differences are descriptive and should inform experiments rather than be treated as proof.

## Repository structure
- `sql/` — data-quality, spend/channel, campaign response, and segment queries.
- `python/marketing_campaign_analysis.py` — reproducible Pandas analysis and output generation.
- `dashboard/marketing_campaign_dashboard.html` — interactive browser dashboard.
- `dashboard/dashboard_preview.svg` — static dashboard preview.
- `analysis/business_insights.md` — findings and recommendations.
- `documentation/` — data dictionary, setup guide, CV/LinkedIn wording.
- `outputs/` — compact summary CSV/JSON.

## Dataset and setup
Source: [public marketing_campaign.csv](https://github.com/johng034/customer-segmentation/blob/master/marketing_campaign.csv). Download it and save as `data/marketing_campaign.csv`; the raw customer-level file is intentionally not committed.

```bash
python -m pip install -r python/requirements.txt
python python/marketing_campaign_analysis.py --input data/marketing_campaign.csv --output outputs
```

For MySQL 8+, import the source CSV as `marketing_campaign` and run SQL files 01–04 in order.

## Skills demonstrated
Data cleaning · SQL · Customer segmentation · Campaign response analysis · EDA · KPI design · Visualization · Business interpretation · Reproducible reporting.
