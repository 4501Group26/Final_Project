
CREATE TABLE IF NOT EXISTS hourly_weather
(
    id INTEGER PRIMARY KEY,
    Date DATETIME,
    HourlyPrecipitation FLOAT,
    HourlyWindSpeed FLOAT
);

CREATE TABLE IF NOT EXISTS daily_weather
(
    id INTEGER PRIMARY KEY,
    Date DATETIME,
    DailyAverageWindSpeed FLOAT,
    Sunrise FLOAT,
    Sunset FLOAT
);

CREATE TABLE IF NOT EXISTS taxi_trips
(
    id INTEGER PRIMARY KEY,
    pickup_datetime DATETIME,
    dropoff_datetime DATETIME,	
    trip_distance FLOAT,	
    tip_amount FLOAT,	
    pickup_longitude FLOAT,	
    pickup_latitude FLOAT,	
    dropoff_longitude FLOAT,	
    dropoff_latitude FLOAT,	
    Distance FLOAT
);


CREATE TABLE IF NOT EXISTS uber_trips
(
    id INTEGER PRIMARY KEY,
    pickup_datetime  DATETIME,
    pickup_longitude FLOAT,
    pickup_latitude FLOAT,
    dropoff_longitude FLOAT,
    dropoff_latitude FLOAT,
    Distance FLOAT
);
