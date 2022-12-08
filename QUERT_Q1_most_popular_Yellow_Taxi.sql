
SELECT strftime ('%H',pickup_datetime) AS Hour_Taxi,
COUNT(strftime ('%H',pickup_datetime))
FROM taxi_trips
WHERE pickup_datetime >= '2009-01-01 00:00:00'
AND pickup_datetime <= '2015-06-30 23:59:59'
GROUP BY Hour_Taxi
