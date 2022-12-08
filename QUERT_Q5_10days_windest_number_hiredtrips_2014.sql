
SELECT strftime('%Y-%m-%d',datetime(substr(DATE, 1, 19))) AS DAY,
DailyAverageWindSpeed,
count
FROM daily_weather
JOIN(
    SELECT DAY_sub, COUNT(*) as count
    FROM (
        SELECT strftime('%Y-%m-%d',datetime(substr(pickup_datetime, 1, 19))) AS DAY_sub, Distance
        FROM uber_trips
        WHERE pickup_datetime >= '2014-01-01 00:00:00'
        AND pickup_datetime <= '2014-12-31 23:59:59'
        AND Distance != 'None'
        AND Distance != 0
        UNION ALL
        SELECT strftime('%Y-%m-%d',datetime(substr(pickup_datetime, 1, 19))) AS DAY_sub, Distance
        FROM taxi_trips
        WHERE pickup_datetime >= '2014-01-01 00:00:00'
        AND pickup_datetime <= '2014-12-31 23:59:59'
        AND Distance != 'None'
        AND Distance != 0
        )
        GROUP BY DAY_sub
        ) AS Hired_rides
        ON DAY = Hired_rides.DAY_sub
        ORDER BY DailyAverageWindSpeed DESC
        LIMIT 10
    