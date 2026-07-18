/* =====================================================
   IRCTC RAILWAY BUSINESS INTELLIGENCE PROJECT
   SQL ANALYSIS USING MYSQL
   ===================================================== */
/* =====================================================
   DATABASE CREATION
   ===================================================== */
/* =====================================================
   DIMENSION TABLE : PASSENGERS
   ===================================================== */
   CREATE TABLE dim_passengers (
    passenger_id VARCHAR(20),
    gender VARCHAR(10),
    age_group VARCHAR(20),
    state VARCHAR(100),
    travel_type VARCHAR(50),
    occupation VARCHAR(100),
    travel_frequency VARCHAR(20)
);
/* =====================================================
   PASSENGER DATA LOADING
   ===================================================== */
LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/dim_passengers.csv'
INTO TABLE dim_passengers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
select count(*) from dim_passengers;

DROP TABLE IF EXISTS dim_trains;
/* =====================================================
   DIMENSION TABLE : TRAINS
   ===================================================== */
CREATE TABLE dim_trains (
    train_id VARCHAR(20),
    train_name VARCHAR(100),
    source_station VARCHAR(100),
    destination_station VARCHAR(100),
    train_category VARCHAR(50),
    distance int,
    avg_travel_time decimal(5,2),
    base_fare int,
    zone varchar(100)
);
DROP TABLE IF EXISTS dim_trains;
/* =====================================================
   TRAIN DATA LOADING
   ===================================================== */
LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/dim_trains.csv'
INTO TABLE dim_trains
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

select count(*) from dim_trains;

USE railway_business_intelligence;

DROP TABLE IF EXISTS fact_bookings;
/* =====================================================
   FACT TABLE : BOOKINGS
   ===================================================== */
CREATE TABLE fact_bookings (
    booking_id VARCHAR(20),
    passenger_id VARCHAR(20),
    train_id VARCHAR(20),
    booking_date DATE,
    journey_date DATE,
    ticket_type VARCHAR(50),
    travel_class VARCHAR(20),
    fare_amount INT,
    booking_status VARCHAR(50),
    payment_method VARCHAR(50),
    booking_channel VARCHAR(50),
    seat_occupancy INT,
    delay_minutes INT,
    railway_zone VARCHAR(100),
    season VARCHAR(50),
    is_weekend VARCHAR(10)
);
/* =====================================================
   BOOKING DATA LOADING
   ===================================================== */
LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/fact_bookings.csv'
INTO TABLE fact_bookings
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

select count(*) from fact_bookings;
select count(*) from dim_passengers;
select count(*) from dim_trains;
/* =====================================================
   PRIMARY KEY & FOREIGN KEY CONSTRAINTS
   ===================================================== */
alter table dim_passengers
add primary key (passenger_id);
alter table dim_trains
add primary key (train_id);
alter table fact_bookings
add primary key (booking_id);

alter table fact_bookings
add constraint fk_passenger
foreign key (passenger_id)
references dim_passengers(passenger_id);

alter table fact_bookings
add constraint fk_train
foreign key (train_id)
references dim_trains(train_id);
/* =====================================================
   BUSINESS ANALYSIS QUERIES
   ===================================================== */
/* Revenue Analysis */

select sum(fare_amount) as total_revenue
from fact_bookings where booking_status = 'Confirmed';

select dt.train_name,
sum(fb.fare_amount) as revenue from fact_bookings fb
join dim_trains dt on fb.train_id = dt.train_id
where fb.booking_status = 'Confirmed' group by dt.train_name
order by revenue desc limit 10;

select railway_zone, sum(fare_amount) as total_revenue from fact_bookings
where booking_status = 'Confirmed' 
group by railway_zone order by total_revenue desc limit 15;

/* Booking Status Analysis */

select booking_status, count(*) as total_bookings from fact_bookings
group by booking_status order by total_bookings desc;

/* Travel Class Analysis */

select travel_class, count(*) as total_bookings from fact_bookings
group by travel_class order by total_bookings desc;

/* Payment Method Analysis */

select payment_method, count(*) as total_transactions from fact_bookings
group by payment_method order by total_transactions desc;

/* Monthly Booking Trend */

select year(booking_date) as year,
month(booking_date) as month,
count(*) as total_bookings from fact_bookings
group by year(booking_date), month(booking_date) order by year,month;

/* State Wise Revenue Analysis */

select dp.state, sum(fb.fare_amount) as total_revenue from fact_bookings fb
join dim_passengers dp on fb.passenger_id = dp.passenger_id
where fb.booking_status = 'Confirmed'
group by dp.state order by total_revenue desc limit 10;

/* Train Delay Analysis */

select dt.train_name, avg(fb.delay_minutes) as avg_delay from fact_bookings fb
join dim_trains dt on fb.train_id = dt.train_id
group by dt.train_name order by avg_delay desc limit 10;

/* Route Performance Analysis */

SELECT 
    dt.source_station,
    dt.destination_station,
    SUM(fb.fare_amount) AS revenue
FROM fact_bookings fb
JOIN dim_trains dt
ON fb.train_id = dt.train_id
WHERE fb.booking_status = 'Confirmed'
GROUP BY dt.source_station, dt.destination_station
ORDER BY revenue DESC
LIMIT 10;

SELECT 
    dt.train_name,
    AVG(fb.delay_minutes) AS avg_delay,
    SUM(fb.fare_amount) AS revenue
FROM fact_bookings fb
JOIN dim_trains dt
ON fb.train_id = dt.train_id
WHERE fb.booking_status = 'Confirmed'
GROUP BY dt.train_name
ORDER BY revenue DESC
LIMIT 10;

/* Top Source Stations */

SELECT 
    source_station,
    COUNT(*) AS total_bookings
FROM dim_trains dt
JOIN fact_bookings fb
ON dt.train_id = fb.train_id
GROUP BY source_station
ORDER BY total_bookings DESC
LIMIT 10;

/* Top Destination Stations */

SELECT 
    destination_station,
    COUNT(*) AS total_bookings
FROM dim_trains dt
JOIN fact_bookings fb
ON dt.train_id = fb.train_id
GROUP BY destination_station
ORDER BY total_bookings DESC
LIMIT 10; 
/* =====================================================
   ADVANCED SQL : COMMON TABLE EXPRESSION (CTE)
   ===================================================== */
WITH ZoneRevenue AS 
(SELECT railway_zone, SUM(fare_amount) revenue 
FROM fact_bookings GROUP BY railway_zone)
SELECT * FROM ZoneRevenue;
/* =====================================================
   ADVANCED SQL : WINDOW FUNCTION
   ===================================================== */
SELECT dt.train_name, 
SUM(fb.fare_amount) revenue,
RANK() OVER(ORDER BY SUM(fb.fare_amount) DESC)
rank_no FROM fact_bookings fb
JOIN dim_trains dt ON fb.train_id = dt.train_id
GROUP BY dt.train_name;

/* Revenue Contribution Analysis */

SELECT railway_zone,
ROUND(SUM(fare_amount)*100/
(SELECT SUM(fare_amount) FROM fact_bookings),2)
AS contribution_pct
FROM fact_bookings
GROUP BY railway_zone;

/* =====================================================
   END OF PROJECT
   ===================================================== */
