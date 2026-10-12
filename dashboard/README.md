# Interactive Marketing Dashboard

**[Launch the live interactive dashboard preview](https://htmlpreview.github.io/?https://raw.githubusercontent.com/Zaheermuhammadasad/marketing-campaign-analytics/main/dashboard/marketing_campaign_dashboard.html)**

Source: `marketing_campaign_dashboard.html`  
Preview image: `dashboard_preview.svg`

The HTML dashboard has Plotly charts for historical campaign acceptance/latest response, recorded spend by product group, purchase counts by channel, and latest response split. Hover for data details. It loads Plotly from a CDN, so an internet connection is required.

The dashboard values reflect the verified source dataset summary. To rebuild from the downloaded CSV, run the Python pipeline described in [getting started](../documentation/getting_started.md).

**Measurement note:** The dataset has no usable media costs, impressions, clicks, randomized holdout, or contribution margin. This project therefore does not claim ROAS, CAC, incremental lift, or causal campaign effect.