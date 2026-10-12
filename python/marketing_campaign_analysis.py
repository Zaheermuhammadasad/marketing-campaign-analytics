#!/usr/bin/env python3
"""Reproducible marketing campaign analytics. Run from repository root."""
from __future__ import annotations
import argparse, json
from pathlib import Path
import numpy as np
import pandas as pd
import plotly.graph_objects as go
from plotly.subplots import make_subplots

SPEND=["MntWines","MntFruits","MntMeatProducts","MntFishProducts","MntSweetProducts","MntGoldProds"]
CAMPAIGNS=["AcceptedCmp1","AcceptedCmp2","AcceptedCmp3","AcceptedCmp4","AcceptedCmp5"]
CHANNELS={"NumWebPurchases":"Web","NumCatalogPurchases":"Catalog","NumStorePurchases":"Store"}
NUMERIC=["Year_Birth","Income","Kidhome","Teenhome","Recency",*SPEND,"NumDealsPurchases",*CHANNELS,"NumWebVisitsMonth",*CAMPAIGNS,"Response","Complain"]

def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument("--input",default="data/marketing_campaign.csv"); p.add_argument("--output",default="outputs")
    a=p.parse_args(); src=Path(a.input); out=Path(a.output); out.mkdir(parents=True,exist_ok=True)
    if not src.exists(): raise FileNotFoundError(f"{src} not found; see documentation/getting_started.md")
    df=pd.read_csv(src); df.columns=df.columns.str.strip(); src_cols=len(df.columns); src_rows=len(df)
    required=["ID","Income","Year_Birth","Recency",*SPEND,*CAMPAIGNS,"Response",*CHANNELS]
    missing=[c for c in required if c not in df.columns]
    if missing: raise ValueError(f"Missing required columns: {missing}")
    dup=int(df.duplicated("ID",keep=False).sum())
    for c in NUMERIC:
        if c in df: df[c]=pd.to_numeric(df[c],errors="coerce")
    if "Dt_Customer" in df: df["Dt_Customer"]=pd.to_datetime(df["Dt_Customer"],dayfirst=True,errors="coerce")
    q1,q3=df["Income"].quantile([.25,.75]); iqr=q3-q1
    df["income_missing_flag"]=df["Income"].isna()
    df["income_iqr_outlier_flag"]=df["Income"].notna() & ((df["Income"]<q1-1.5*iqr)|(df["Income"]>q3+1.5*iqr))
    df["birth_year_review_flag"]=df["Year_Birth"].notna() & (df["Year_Birth"]<=1900)
    df["total_spend"]=df[SPEND].fillna(0).sum(axis=1)
    df["children_at_home"]=df[["Kidhome","Teenhome"]].fillna(0).sum(axis=1)
    df["all_channel_purchases"]=df[list(CHANNELS)].fillna(0).sum(axis=1)
    df["accepted_any_historical_campaign"]=df[CAMPAIGNS].fillna(0).eq(1).any(axis=1).astype(int)
    df["spend_segment"]=pd.cut(df["total_spend"],[-np.inf,99,499,999,np.inf],labels=["Low (<100)","Mid (100-499)","High (500-999)","Very high (1000+)"])
    df["recency_segment"]=pd.cut(df["Recency"],[-np.inf,29,59,89,np.inf],labels=["0-29 days","30-59 days","60-89 days","90+ days"])
    q={"source_file":src.name,"row_count":int(src_rows),"source_column_count":int(src_cols),"distinct_customer_ids":int(df["ID"].nunique()),"duplicate_id_rows":dup,
       "missing_income_rows":int(df["Income"].isna().sum()),"income_iqr_outlier_rows":int(df["income_iqr_outlier_flag"].sum()),"birth_year_1900_or_earlier_rows":int(df["birth_year_review_flag"].sum()),
       "bad_customer_dates":int(df["Dt_Customer"].isna().sum()) if "Dt_Customer" in df else None,"income_min":float(df["Income"].min()),"income_max":float(df["Income"].max()),
       "income_median":float(df["Income"].median()),"income_mean":float(df["Income"].mean()),"latest_campaign_responders":int(df["Response"].fillna(0).eq(1).sum()),
       "latest_campaign_response_rate_pct":round(float(df["Response"].mean()*100),4),"total_recorded_product_spend":int(df["total_spend"].sum()),
       "average_recorded_spend_per_customer":round(float(df["total_spend"].mean()),4),"median_recorded_spend_per_customer":float(df["total_spend"].median()),
       "accepted_any_historical_campaign":int(df["accepted_any_historical_campaign"].sum()),"accepted_any_historical_campaign_rate_pct":round(float(df["accepted_any_historical_campaign"].mean()*100),4),
       "marketing_cost_available":False,"clicks_or_impressions_available":False,"causal_lift_available":False}
    (out/"data_quality_summary.json").write_text(json.dumps(q,indent=2),encoding="utf-8")
    # This detailed row-level file remains local and is ignored by Git.
    df.to_csv(out/"customer_level_derived.csv",index=False)
    cr=[]
    for c in CAMPAIGNS+["Response"]: cr.append({"campaign_field":c,"flagged_customers":int(df[c].fillna(0).eq(1).sum()),"rate_pct":round(float(df[c].mean()*100),4),"meaning":"latest response" if c=="Response" else "historical acceptance"})
    pd.DataFrame(cr).to_csv(out/"campaign_response_summary.csv",index=False)
    prod=df[SPEND].fillna(0).sum().sort_values(ascending=False)
    ps=pd.DataFrame({"product_category":prod.index,"total_spend":prod.values}); ps["share_pct"]=ps.total_spend/ps.total_spend.sum()*100; ps.to_csv(out/"product_spend_summary.csv",index=False)
    cs=pd.DataFrame([{"channel":label,"purchase_count":int(df[c].fillna(0).sum()),"mean_per_customer":float(df[c].mean())} for c,label in CHANNELS.items()]); cs.to_csv(out/"channel_purchase_summary.csv",index=False)
    df.groupby("spend_segment",observed=False).agg(customers=("ID","nunique"),response_rate_pct=("Response",lambda x:x.mean()*100),average_spend=("total_spend","mean"),average_income=("Income","mean"),average_recency=("Recency","mean")).reset_index().to_csv(out/"spend_segment_summary.csv",index=False)
    df.groupby("Response",dropna=False).agg(customers=("ID","nunique"),average_income=("Income","mean"),average_recency=("Recency","mean"),average_web_visits=("NumWebVisitsMonth","mean"),average_web_purchases=("NumWebPurchases","mean"),average_spend=("total_spend","mean")).reset_index().to_csv(out/"response_profile_summary.csv",index=False)
    fig=make_subplots(rows=2,cols=2,subplot_titles=("Latest Response by Spend Segment","Recorded Spend by Product Group","Historical Acceptance vs Latest Response","Purchases by Channel"))
    s=df.groupby("spend_segment",observed=False)["Response"].mean().mul(100).reset_index()
    fig.add_trace(go.Bar(x=s["spend_segment"].astype(str),y=s["Response"],marker_color="#4361ee"),row=1,col=1)
    fig.add_trace(go.Bar(x=ps.product_category,y=ps.total_spend,marker_color="#2a9d8f"),row=1,col=2)
    fig.add_trace(go.Bar(x=[c.replace("AcceptedCmp","Campaign ") for c in CAMPAIGNS]+["Latest response"],y=[float(df[c].mean()*100) for c in CAMPAIGNS+["Response"]],marker_color="#f4a261"),row=2,col=1)
    fig.add_trace(go.Bar(x=cs.channel,y=cs.purchase_count,marker_color="#577590"),row=2,col=2)
    fig.update_layout(title="Marketing Campaign & Customer Analytics",template="plotly_white",height=760,showlegend=False,font=dict(family="Arial",color="#172033"),margin=dict(l=50,r=25,t=95,b=60))
    fig.update_yaxes(title_text="Response rate (%)",row=1,col=1); fig.update_yaxes(title_text="Spend (source units)",row=1,col=2); fig.update_yaxes(title_text="Rate (%)",row=2,col=1); fig.update_yaxes(title_text="Purchase count",row=2,col=2)
    cards="".join(f'<div class="kpi"><span>{label}</span><strong>{value}</strong></div>' for label,value in [("Customers",f"{df.ID.nunique():,}"),("Latest response",f"{df.Response.mean()*100:.2f}%"),("Total spend",f"{df.total_spend.sum():,.0f}"),("Avg spend/customer",f"{df.total_spend.mean():,.0f}"),("Missing income",f"{df.Income.isna().sum():,}")])
    page=f'''<!doctype html><html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>Marketing Campaign Analytics</title><style>body{{margin:0;background:#f3f6fb;color:#172033;font-family:Arial,sans-serif}}main{{max-width:1240px;margin:auto;padding:26px}}h1{{font-size:30px;margin:0 0 6px}}.sub{{color:#667085;margin-bottom:20px}}.kpis{{display:grid;grid-template-columns:repeat(5,1fr);gap:12px}}.kpi,.panel{{background:#fff;border:1px solid #e4e9f2;border-radius:13px}}.kpi{{padding:16px}}.kpi span{{font-size:12px;color:#667085;display:block}}.kpi strong{{font-size:24px;display:block;margin-top:8px}}.panel{{padding:10px;margin-top:16px}}.note{{font-size:12px;color:#667085;line-height:1.5;margin-top:16px}}@media(max-width:900px){{.kpis{{grid-template-columns:repeat(2,1fr)}}main{{padding:14px}}}}</style></head><body><main><h1>Marketing Campaign &amp; Customer Analytics</h1><div class="sub">Customer response · Product affinity · Purchase channels · Segmentation</div><section class="kpis">{cards}</section><div class="panel">{fig.to_html(full_html=False,include_plotlyjs="cdn",config={{"responsive":True,"displaylogo":False}})}</div><div class="note">Response is observed behaviour, not causal lift. Product spend is not profit. No media cost, clicks/impressions or randomized holdout are present; ROAS cannot be estimated from this source alone.</div></main></body></html>'''
    dashboard=Path(__file__).resolve().parent.parent/"dashboard"/"marketing_campaign_dashboard.html"; dashboard.write_text(page,encoding="utf-8")
    print(f"Analysis complete: {q['row_count']:,} customers; {q['latest_campaign_response_rate_pct']:.2f}% latest response; {q['total_recorded_product_spend']:,} recorded spend.")
if __name__=="__main__": main()
