# Getting Started

1. Download the public CSV from https://github.com/johng034/customer-segmentation/blob/master/marketing_campaign.csv.
2. Save it as `data/marketing_campaign.csv`. The raw customer-level file is intentionally not committed here.
3. With Python 3.10+:

```bash
python -m pip install -r python/requirements.txt
python python/marketing_campaign_analysis.py --input data/marketing_campaign.csv --output outputs
```

4. For SQL, import the CSV into MySQL 8+ as `marketing_campaign`, preserving original column names. Run SQL files 01–04 in order.
5. Open `dashboard/marketing_campaign_dashboard.html` in a browser. Plotly loads from a CDN, so interactive charts need internet access.

The script generates derived customer-level data locally and summary outputs. Do not commit the raw CSV or `outputs/customer_level_derived.csv`.

The source lacks ad costs, impressions/clicks, contribution margin, and randomized holdout data. Do not claim causal lift or ROAS.
