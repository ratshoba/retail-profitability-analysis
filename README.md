# Retail Profitability Analysis

A multi-tool analysis of the same business problem — demonstrating SQL, data visualization, and cloud data warehousing on one dataset.

## Business Question
Which product categories and regions are most profitable, and where is the company losing money?

## Dataset
Source: Sample Superstore (Kaggle) — used for practice purposes, as stated by the dataset owner.

## Key Finding
Tables have the highest average discount (26.1%) of any Furniture sub-category — nearly double Furnishings (13.8%). Despite solid sales ($206,965), this discount level makes Tables the single biggest driver of unprofitability (-$17,725), dragging down the entire Furniture category. The problem is worst in the East region (-$11,025), while West is the only region where Tables remain barely profitable.


## 1. SQL Analysis (SQLite)
**Tool:** DB Browser for SQLite
**File:** `analysis.sql`

Six queries drilling from a high-level category view down to the specific root cause — discount levels on Tables by region. Each query is commented explaining what it does and why.

## 2. Interactive Dashboard (Tableau)
**Tool:** Tableau Public
**Live link:** [Retail Profitability Analysis Dashboard](https://public.tableau.com/app/profile/shoba.rathore/viz/RetailProfitabilityAnalysis_17901469383950/RetailProfitabilityAnalysis)

Three linked visualizations: profit by category, profit by sub-category (sorted and color-coded), and a discount-vs-profit scatter plot proving the root cause visually.

## 3. Cloud Replication (Google BigQuery)
**Tool:** Google Cloud Platform — BigQuery
**File:** `bigquery_queries.sql`

The two key SQL queries were re-run in BigQuery against the same dataset, confirming identical results in a cloud data warehouse environment. Demonstrates translating local SQL work into a cloud platform.


## What I'd Do Next
- Test whether capping Tables discounts below 15% recovers profitability without significantly hurting sales volume
- Investigate whether specific sales reps or customer segments in the East region are driving the heavier discounting

## Files
- `analysis.sql` — original SQLite queries, commented
- `bigquery_queries.sql` — same core queries, adapted for BigQuery syntax
- `Sample_ Superstore.csv` — raw dataset used for this analysis
