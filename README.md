# Travel-Booking-Analytics
Completed individual project on travel booking analytics

# Travel Booking Analytics Dashboard

An end-to-end data analysis project on hotel booking demand — covering SQL-based data exploration, key business metric calculation, and an interactive Power BI dashboard built from query outputs.

---

## Tools & Dataset

| Tool | Purpose |
|------|---------|
| SQL (SSMS) | Data exploration & query execution |
| Power BI Desktop | Dashboard & visualisation |

**Dataset:** Hotel Booking Demand  
**Source:** TidyTuesday / Jesse Mostipak  
**Records:** 119,390 hotel bookings across City Hotels and Resort Hotels  
**Period:** July 2015 – August 2017  

---

## Key Business Questions Answered

1. Which hotel type drives more bookings — and which has a higher cancellation problem?
2. What does the monthly revenue trend look like across 2015–2017?
3. Which countries contribute the most confirmed bookings?
4. Which distribution channels bring the most bookings?
5. Which customer segments cancel the most?
6. Do repeat guests behave differently from new guests?

---

## Key Insights

- **Cancellation rate:** City Hotels had a 41.73% cancellation rate vs 27.76% for Resort Hotels — a 14pp gap with significant revenue impact
- **Peak revenue:** August 2016 was the highest revenue month; overall revenue declined into 2017
- **Top market:** Portugal (PRT) accounted for 28% of all confirmed bookings, the single largest source market
- **Distribution:** TA/TO channel dominates at 81.98% of all bookings; Direct bookings at 12.27%
- **Avg lead time:** 59.63 days average across all channels
- **Overall cancellation rate:** 34.75% average across all customer types

---

## Dashboard Visuals (Power BI)

| Visual | Data Source | Insight |
|--------|------------|---------|
| Line Chart — Monthly Revenue Trend | q2_monthly_revenue.csv | Seasonality across 2015–2017 |
| Bar Chart — Top 10 Booking Countries | q3_top_countries.csv | Portugal dominates at 28% share |
| Donut Chart — Distribution Channel Split | q4_distribution.csv | TA/TO accounts for 82% of bookings |
| KPI Cards — Total Bookings, Cancellation Rate, Avg Lead Time | q1, q4 CSVs | At-a-glance business health metrics |

---

## File Structure

```
Travel-Booking-Analytics/
│
├── bookings_analysis.sql          
├── Travel_Booking_Dashboard.pbix  
│
├── q1_hotel_type.csv
├── q2_monthly_revenue.csv
├── q3_top_countries.csv
├── q4_distribution.csv
├── q5_customer_type.csv
├── q6_guest_retention.csv
│
└── README.md
```

---

## About

Built as part of a personal analytics portfolio to demonstrate SQL querying, business metric design, and dashboard creation — skills directly applicable to operational reporting and data-driven decision-making in high-growth B2B environments.
