
SELECT strftime ('%w',substr(pickup_datetime, 1, 19)) AS WeekDay,
COUNT(strftime ('%w',substr(pickup_datetime, 1, 19)))
FROM uber_trips
WHERE pickup_datetime >= '2009-01-01 00:00:00'
AND pickup_datetime <= '2015-06-30 23:59:59'
GROUP BY WeekDay
ORDER BY COUNT(strftime ('%w',substr(pickup_datetime, 1, 19)))
