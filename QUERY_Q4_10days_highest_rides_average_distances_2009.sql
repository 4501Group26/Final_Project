
SELECT strftime('%Y-%m-%d',datetime(substr(pickup_datetime, 1, 19))) AS DAY,
COUNT(strftime('%Y-%m-%d',datetime(substr(pickup_datetime, 1, 19)))),
avg(Distance)
FROM (
    SELECT pickup_datetime, Distance
    FROM uber_trips
    WHERE pickup_datetime >= '2009-01-01 00:00:00'
    AND pickup_datetime <= '2009-12-31 23:59:59'
    AND Distance != 'None'
    AND Distance != 0
    UNION ALL
    SELECT pickup_datetime, Distance
    FROM taxi_trips
    WHERE pickup_datetime >= '2009-01-01 00:00:00'
    AND pickup_datetime <= '2009-12-31 23:59:59'
    AND Distance != 'None'
    AND Distance != 0
    )
    GROUP BY DAY
    ORDER BY Distance
    LIMIT 10
    