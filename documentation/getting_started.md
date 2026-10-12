# Getting Started

1. Download the public CSV from https://github.com/johng034/customer-segmentation/blob/master/marketing_campaign.csv.
2. Save it as `data/marketing_campaign.csv`. The raw customer-level data is not committed here.
3. With Python 3.10+:

```bash
python -m pip install -r python/requirements.txt
python python/marketing_campaign_analysis.py --input data/marketing_campaign.csv --output outputs
```

The script creates quality flags, derived customer data locally, summary tables and an interactive dashboard. Do not commit the raw CSV or `outputs/customer_level_derived.csv`.

For SQL, import the CSV into MySQL 8+ as `marketing_campaign`, preserving column names. Run SQL files 01–04 in order.

Open `dashboard/marketing_campaign_dashboard.html` in a browser. Plotly loads from a CDN, so interactive charts need internet.

The data lacks ad costs, impressions/clicks, margin and randomized holdout; it cannot support credible ROAS or causal-lift estimates.
