# Marketing Campaign & Customer Analytics

A portfolio project applying SQL, Python/Pandas and an interactive dashboard to a public customer personality / marketing campaign dataset.

**Tools:** SQL · MySQL · Python · Pandas · Plotly · GitHub

**[Launch the interactive dashboard](https://htmlpreview.github.io/?https://raw.githubusercontent.com/Zaheermuhammadasad/marketing-campaign-analytics/main/dashboard/marketing_campaign_dashboard.html)** · [Business insights](analysis/business_insights.md) · [Data dictionary](documentation/data_dictionary.md) · [CV/LinkedIn wording](documentation/cv_linkedin_project_entry.md)

![Dashboard preview](dashboard/dashboard_preview.svg)

## Business questions
- What share of customers responded to the latest campaign?
- How do historical campaign acceptance rates compare?
- Which product groups account for the highest recorded spend?
- How do web, catalog, and store purchase counts differ?
- How do recency and spend relate to current response?
- What data-quality issues should be reviewed before customer targeting?

## Verified source snapshot
The source contains 2,240 customers and 29 fields. Initial checks found no duplicate IDs and 24 missing income values.

| KPI | Result |
|---|---:|
| Customers | 2,240 |
| Latest campaign responders | 334 (14.91%) |
| Total spend across six product groups | 1,356,988 |
| Average recorded spend per customer | 605.80 |
| Median recorded spend per customer | 396 |
| Web purchases | 9,150 |
| Catalog purchases | 5,963 |
| Store purchases | 12,970 |

Spend is concentrated in wine and meat products. These are descriptive findings, not proof of campaign lift.

## Workflow
1. Audit data quality and flag missing/extreme values.
2. Derive total spend, customer recency/household and channel features.
3. Analyse campaign response and customer segments with SQL.
4. Reproduce metrics in Python/Pandas and export summaries.
5. Explore customer patterns in an interactive Plotly dashboard.
6. Translate findings into testable marketing recommendations.

## Repository structure
- `sql/` — quality checks, customer spend, channel and campaign analysis.
- `python/marketing_campaign_analysis.py` — reproducible Python pipeline.
- `dashboard/marketing_campaign_dashboard.html` — interactive dashboard.
- `dashboard/dashboard_preview.svg` — static preview.
- `analysis/business_insights.md` — findings and limitations.
- `documentation/` — data dictionary, setup guide, CV/LinkedIn text.
- `outputs/` — compact summary CSV/JSON.

## Run locally
Dataset source: [public marketing_campaign.csv](https://github.com/johng034/customer-segmentation/blob/master/marketing_campaign.csv). Download and place at `data/marketing_campaign.csv`; the raw customer-level data is not committed here.

```bash
python -m pip install -r python/requirements.txt
python python/marketing_campaign_analysis.py --input data/marketing_campaign.csv --output outputs
```

For SQL, import the CSV into MySQL 8+ as `marketing_campaign` and run SQL scripts 01–04 in order. Full details are in [Getting Started](documentation/getting_started.md).

## Critical limitations
The data has no advertising spend, reach/impressions, clicks, margin, or randomized holdout. It cannot support credible claims of ROAS, CAC, incremental lift, or causal campaign effectiveness. Purchase spend is not profit or media cost. Segment differences should guide experiments, not be treated as proof.
