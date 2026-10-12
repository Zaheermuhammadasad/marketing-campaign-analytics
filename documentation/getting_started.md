# Getting Started

## Download source data
Download the public CSV:
https://github.com/johng034/customer-segmentation/blob/master/marketing_campaign.csv

Save as `data/marketing_campaign.csv`. The raw customer-level CSV is intentionally not committed here.

## Run Python
Requires Python 3.10+:

```bash
python -m pip install -r python/requirements.txt
python python/marketing_campaign_analysis.py --input data/marketing_campaign.csv --output outputs
```

The script generates data-quality flags, derived customer fields locally, summary tables, and the dashboard. Do not commit the raw input or `outputs/customer_level_derived.csv`.

## Run SQL
Import CSV into MySQL 8+ as `marketing_campaign`, retaining original column names. Run:
1. `sql/01_data_quality.sql`
2. `sql/02_customer_spend_and_channels.sql`
3. `sql/03_campaign_response.sql`
4. `sql/04_campaign_and_segment_analysis.sql`

## Dashboard
Open `dashboard/marketing_campaign_dashboard.html` in a browser. Plotly is loaded from a CDN, so interactive charts need an internet connection.

## Interpretation
Observed response is not causal lift. The data lacks ad costs, impressions/clicks, contribution margin and a randomized control group, so ROAS or incremental lift cannot be calculated credibly.
