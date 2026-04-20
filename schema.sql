-- Create Database
CREATE DATABASE IF NOT EXISTS uber;
USE uber;

-- RIDES TABLE
CREATE TABLE rides (
ride_id VARCHAR(50) PRIMARY KEY,
start_city VARCHAR(50),
end_city VARCHAR(50),
ride_date DATE,
start_time TIME,
end_time TIME,
distance_km INT,
fare FLOAT,
dynamic_pricing VARCHAR(10),
driver_id VARCHAR(50),
passenger_id VARCHAR(50),
rating FLOAT,
payment_method VARCHAR(20),
ride_status VARCHAR(20)
);

-- DRIVERS TABLE
CREATE TABLE drivers (
driver_id VARCHAR(50) PRIMARY KEY,
driver_name VARCHAR(50),
age INT,
gender VARCHAR(10),
city_id VARCHAR(50),
vehicle_type VARCHAR(20),
avg_driver_rating FLOAT,
total_rides INT,
total_earnings FLOAT,
driver_status VARCHAR(20),
employment_type VARCHAR(20),
years_of_experience INT,
ride_acceptance_rate FLOAT
);

-- PAYMENTS TABLE
CREATE TABLE payments (
payment_id VARCHAR(50) PRIMARY KEY,
ride_id VARCHAR(50),
driver_id VARCHAR(50),
passenger_id VARCHAR(50),
fare FLOAT,
surge_multiplier FLOAT,
payment_method VARCHAR(20),
driver_earnings FLOAT,
uber_commission FLOAT,
transaction_status VARCHAR(20),
payment_date DATE
);

-- CITIES TABLE
CREATE TABLE cities (
city_id VARCHAR(50) PRIMARY KEY,
city_name VARCHAR(50),
country VARCHAR(50),
continent VARCHAR(50),
population BIGINT,
regulatory_status VARCHAR(50),
market_competition VARCHAR(50),
number_of_drivers INT,
number_of_rides INT,
avg_fare FLOAT,
avg_wait_time_min INT,
uber_services VARCHAR(100),
major_competitors VARCHAR(100)
);