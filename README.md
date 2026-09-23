# Retail Profitability Analysis

## Dataset
Source: Sample Superstore (Kaggle) — used for practice purposes, as stated by the dataset owner.

## Business Question
Which product categories and regions are most profitable, and where is the company losing money?

## Tools Used
SQL (SQLite via DB Browser), Kaggle Sample Superstore dataset

## Approach
1. Explored profit by product category and region to get a high-level view
2. Drilled down into sub-categories to find specific unprofitable products
3. Investigated discount levels to test whether discounting explains the losses
4. Broke losses down by region to pinpoint where the problem is worst

## Key Finding
Tables have the highest average discount (26.1%) of any Furniture sub-category — nearly double Furnishings (13.8%). Despite solid sales ($206,965), this discount level makes Tables the single biggest driver of unprofitability (-$17,725), dragging down the entire Furniture category. The problem is worst in the East region (-$11,025), while West is the only region where Tables remain barely profitable.

## What I'd Do Next
- Test whether capping Tables discounts below 15% recovers profitability without significantly hurting sales volume
- Investigate whether specific sales reps or customer segments in the East region are driving the heavier discounting
- Build a dashboard to track discount-vs-profit trends by sub-category going forward

## Files
- `analysis.sql` — all SQL queries used, with comments explaining each step