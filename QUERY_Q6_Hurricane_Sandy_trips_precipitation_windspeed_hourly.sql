
SELECT strftime('%Y-%m-%d-%H',datetime(substr(DATE, 1, 19))) AS HOUR_weather,
count,
HourlyPrecipitation,
HourlyWindSpeed
FROM hourly_weather
JOIN(
    SELECT HOUR_sub, COUNT(*) as count
    FROM (
        SELECT strftime('%Y-%m-%d-%H',datetime(substr(pickup_datetime, 1, 19))) AS HOUR_sub, Distance
        FROM uber_trips
        WHERE pickup_datetime >= '2012-10-22 00:00:00'
        AND pickup_datetime <= '2012-10-30 23:59:59'
        AND Distance != 'None'
        AND Distance != 0
        UNION ALL
        SELECT strftime('%Y-%m-%d-%H',datetime(substr(pickup_datetime, 1, 19))) AS HOUR_sub, Distance
        FROM taxi_trips
        WHERE pickup_datetime >= '2012-10-22 00:00:00'
        AND pickup_datetime <= '2012-10-30 23:59:59'
        AND Distance != 'None'
        AND Distance != 0
        )
        GROUP BY HOUR_sub
        ) AS Hired_rides
        ON HOUR_weather = Hired_rides.HOUR_sub
    