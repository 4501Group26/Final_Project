
SELECT Distance
FROM (
    SELECT Distance
    FROM uber_trips
    WHERE pickup_datetime >= '2013-07-01 00:00:00'
    AND pickup_datetime <= '2013-07-31 23:59:59'
    AND Distance != 'None'
    AND Distance != 0
    UNION ALL
    SELECT Distance
    FROM taxi_trips
    WHERE pickup_datetime >= '2013-07-01 00:00:00'
    AND pickup_datetime <= '2013-07-31 23:59:59'
    AND Distance != 'None'
    AND Distance != 0
    )
    ORDER BY Distance
    LIMIT 1
    OFFSET(
        SELECT COUNT(*)
        FROM uber_trips
        WHERE pickup_datetime >= '2013-07-01 00:00:00'
        AND pickup_datetime <= '2013-07-31 23:59:59'
        AND Distance != 'None'
        AND Distance != 0
        UNION ALL
        SELECT Distance
        FROM taxi_trips
        WHERE pickup_datetime >= '2013-07-01 00:00:00'
        AND pickup_datetime <= '2013-07-31 23:59:59'
        AND Distance != 'None'
        AND Distance != 0
        )*95/100-1
        