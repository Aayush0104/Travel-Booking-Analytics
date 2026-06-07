SELECT 
    hotel,
    COUNT(*) AS total_bookings,
    SUM(CAST(is_canceled AS INT)) AS total_cancellations,
    COUNT(*) - SUM(CAST(is_canceled AS INT)) AS confirmed_bookings,
    ROUND(100.0 * SUM(CAST(is_canceled AS INT)) / COUNT(*), 2) AS cancellation_rate_pct
FROM hotels
GROUP BY hotel
ORDER BY total_bookings DESC;

SELECT 
    arrival_date_year AS year,
    arrival_date_month AS month,
    COUNT(*) AS bookings,
    ROUND(SUM((stays_in_weekend_nights + stays_in_week_nights) * adr), 2) AS estimated_revenue,
    ROUND(AVG(adr), 2) AS avg_daily_rate
FROM hotels
WHERE CAST(is_canceled AS INT) = 0
GROUP BY arrival_date_year, arrival_date_month
ORDER BY arrival_date_year,
    CASE arrival_date_month
        WHEN 'January' THEN 1 WHEN 'February' THEN 2
        WHEN 'March' THEN 3 WHEN 'April' THEN 4
        WHEN 'May' THEN 5 WHEN 'June' THEN 6
        WHEN 'July' THEN 7 WHEN 'August' THEN 8
        WHEN 'September' THEN 9 WHEN 'October' THEN 10
        WHEN 'November' THEN 11 WHEN 'December' THEN 12
    END;

SELECT TOP 10
    country,
    COUNT(*) AS total_bookings,
    ROUND(AVG(adr), 2) AS avg_daily_rate,
    ROUND(100.0 * COUNT(*) / (
        SELECT COUNT(*) FROM hotels WHERE CAST(is_canceled AS INT) = 0
    ), 2) AS share_pct
FROM hotels
WHERE CAST(is_canceled AS INT) = 0
  AND country IS NOT NULL
  AND country != 'NULL'
GROUP BY country
ORDER BY total_bookings DESC;

SELECT 
    distribution_channel,
    COUNT(*) AS total_bookings,
    ROUND(AVG(CAST(lead_time AS FLOAT)), 1) AS avg_lead_time_days,
    ROUND(AVG(adr), 2) AS avg_daily_rate,
    ROUND(100.0 * SUM(CAST(is_canceled AS INT)) / COUNT(*), 2) AS cancellation_rate_pct
FROM hotels
WHERE distribution_channel != 'Undefined'
GROUP BY distribution_channel
ORDER BY avg_lead_time_days DESC;

SELECT 
    customer_type,
    COUNT(*) AS total_bookings,
    SUM(CAST(is_canceled AS INT)) AS cancellations,
    ROUND(100.0 * SUM(CAST(is_canceled AS INT)) / COUNT(*), 2) AS cancellation_rate_pct,
    ROUND(AVG(adr), 2) AS avg_daily_rate,
    ROUND(AVG(CAST(stays_in_weekend_nights + stays_in_week_nights AS FLOAT)), 2) AS avg_stay_nights
FROM hotels
GROUP BY customer_type
ORDER BY cancellation_rate_pct DESC;

SELECT 
    CASE 
        WHEN is_repeated_guest = 1 THEN 'Repeat Guest' 
        ELSE 'New Guest' 
    END AS guest_type,
    COUNT(*) AS total_bookings,
    ROUND(AVG(adr), 2) AS avg_daily_rate,
    ROUND(AVG(CAST(stays_in_weekend_nights + stays_in_week_nights AS FLOAT)), 2) AS avg_stay_nights,
    ROUND(100.0 * SUM(CAST(is_canceled AS INT)) / COUNT(*), 2) AS cancellation_rate_pct,
    ROUND(AVG(CAST(lead_time AS FLOAT)), 1) AS avg_lead_time_days
FROM hotels
GROUP BY is_repeated_guest
ORDER BY guest_type;