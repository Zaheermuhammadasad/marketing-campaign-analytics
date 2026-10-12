# Getting Started

## 1. Get the data

Download `marketing_campaign.csv` from the [public dataset source](https://github.com/johng034/customer-segmentation/blob/master/marketing_campaign.csv). Save it locally to `data/marketing_campaign.csv`. The row-level customer CSV is not committed to this repository.

## 2. Run Python

Use Python 3.10 or later:

```bash
python -m pip install -r python/requirements.txt
python python/marketing_campaign_analysis.py --input data/marketing_campaign.csv --output outputs
```

The script checks required columns, flags missing/extreme observations, creates derived customer metrics, writes summary CSV/JSON outputs, and generates `dashboard/marketing_campaign_dashboard.html`.

## 3. Open the dashboard

Open `dashboard/marketing_campaign_dashboard.html` in a browser. It loads Plotly from a CDN, so internet access is needed to display the charts.

## 4. Run SQL in MySQL Workbench

1. Import the CSV as a table named `marketing_campaign`.
2. Confirm `ID` is an integer and numeric metric fields have appropriate numeric types.
3. Run `sql/01_data_quality.sql`, then `02_customer_spend_and_channels.sql`, `03_campaign_response.sql`, and `04_campaign_and_segment_analysis.sql`.
4. Compare counts and totals against `outputs/`.

## Data privacy and reproducibility

The repository excludes the row-level CSV and derived row-level extract. Summary aggregates are checked in for quick review; rerun the script to reproduce analysis from the public source.