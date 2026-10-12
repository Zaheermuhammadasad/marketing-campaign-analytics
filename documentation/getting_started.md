# Getting Started

## Download the source data
Download the public CSV from:
https://github.com/johng034/customer-segmentation/blob/master/marketing_campaign.csv

Save it as `data/marketing_campaign.csv` at the project root. The raw customer-level CSV is intentionally not committed to this repository.

## Run Python
Use Python 3.10+:

```bash
python -m pip install -r python/requirements.txt
python python/marketing_campaign_analysis.py --input data/marketing_campaign.csv --output outputs
```

The script creates data-quality flags, derived features, summary tables, and a dashboard.

## Run SQL
Import the source CSV into MySQL 8+ as `marketing_campaign`, preserving original column names. Run in order:
1. `sql/01_data_quality.sql`
2. `sql/02_customer_spend_and_channels.sql`
3. `sql/03_campaign_response.sql`
4. `sql/04_campaign_and_segment_analysis.sql`

## Dashboard
Open `dashboard/marketing_campaign_dashboard.html` in a modern browser. It uses Plotly from a CDN, so internet is needed for interactive charts.

## Interpretation
Observed campaign response is not proof of causal lift. There is no media cost, impressions/clicks, margin, or randomized control group in this dataset, so ROAS and incremental lift cannot be calculated reliably.
