
SELECT strftime('%m',datetime(substr(DATE, 1, 19))) AS MONTH,
Sunrise,
Sunset
FROM daily_sunrisesunset
GROUP BY MONTH
