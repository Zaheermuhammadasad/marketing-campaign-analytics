# Getting Started

1. Download the public CSV from https://github.com/johng034/customer-segmentation/blob/master/marketing_campaign.csv.
2. Save it as `data/marketing_campaign.csv`. The raw customer-level file is not committed here.
3. Use Python 3.10+:

```bash
python -m pip install -r python/requirements.txt
python python/marketing_campaign_analysis.py --input data/marketing_campaign.csv --output outputs
```

4. For SQL, import the CSV to MySQL 8+ as `marketing_campaign`, preserving column names. Run SQL files 01–04 in order.
5. Open `dashboard/marketing_campaign_dashboard.html` in a browser. Plotly comes from a CDN, so interactive charts need internet.

The script creates derived customer data locally and summary tables. Do not commit the source CSV or `outputs/customer_level_derived.csv`.

This data does not provide advertising costs, clicks/impressions, margin or a randomized control group. Do not claim causal lift or ROAS.
