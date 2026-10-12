# Marketing Campaign & Customer Analytics

An end-to-end marketing analytics project using a public customer personality and campaign dataset. It demonstrates data-quality auditing, SQL, Python/Pandas, campaign response analysis, customer spend, customer segmentation, and an interactive browser dashboard.

**Tools:** SQL · MySQL · Python · Pandas · Plotly · GitHub

**[Launch the interactive dashboard](https://htmlpreview.github.io/?https://raw.githubusercontent.com/Zaheermuhammadasad/marketing-campaign-analytics/main/dashboard/marketing_campaign_dashboard.html)** · [Business insights](analysis/business_insights.md) · [Data dictionary](documentation/data_dictionary.md) · [CV/LinkedIn entry](documentation/cv_linkedin_project_entry.md)

![Dashboard preview](dashboard/dashboard_preview.svg)

## Business questions
- What share of customers responded to the latest campaign?
- How do historical campaign acceptance rates compare?
- Which product groups account for the highest recorded spend?
- How do web, catalog, and store purchase counts differ?
- How do customer recency and spend relate to current response?
- Which data quality issues need review before targeting?

## Verified source snapshot
The public source has 2,240 customers and 29 columns. Initial checks found no duplicate customer IDs and 24 missing income values.

| Metric | Result |
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

## Repository contents
- `sql/` — quality, spend/channel, campaign response, and segment analyses.
- `python/marketing_campaign_analysis.py` — reproducible Pandas analysis and output generation.
- `dashboard/marketing_campaign_dashboard.html` — interactive dashboard.
- `dashboard/dashboard_preview.svg` — static dashboard preview.
- `analysis/business_insights.md` — findings and limitations.
- `documentation/` — data dictionary, setup guide, CV/LinkedIn wording.
- `outputs/` — summary tables.

## Run locally
Download the [public marketing_campaign.csv dataset](https://github.com/johng034/customer-segmentation/blob/master/marketing_campaign.csv) and save as `data/marketing_campaign.csv`. The raw customer-level file is not committed here.

```bash
python -m pip install -r python/requirements.txt
python python/marketing_campaign_analysis.py --input data/marketing_campaign.csv --output outputs
```

For SQL, import the CSV into MySQL 8+ as `marketing_campaign` and run SQL files 01–04 in order. See [Getting Started](documentation/getting_started.md).

## Critical limitations
The source has no advertising spend, reach/impressions, clicks, margin, or randomized holdout. It cannot support credible ROAS, CAC, incremental-lift, or causal campaign-effectiveness claims. Product spending is not profit or media cost. Segment differences should guide experiments, not be treated as proof.
