-- Q1: City Performance
SELECT start_city AS city,
COUNT(*) total_rides,
ROUND(SUM(CASE WHEN ride_status='Canceled' THEN 1 ELSE 0 END)*100/COUNT(*),2) cancel_rate,
ROUND(AVG(rating),2) avg_rating
FROM rides
GROUP BY start_city;

-- Q2: Revenue Leakage
SELECT r.ride_id, r.fare
FROM rides r
LEFT JOIN payments p ON r.ride_id = p.ride_id
WHERE r.ride_status='Completed' AND p.payment_id IS NULL;

-- Q3: Cancellation Analysis
SELECT start_city,
COUNT(*) total_rides,
SUM(CASE WHEN ride_status='Canceled' THEN 1 ELSE 0 END) canceled
FROM rides
GROUP BY start_city;

-- Q4: Time Analysis
SELECT HOUR(start_time) hour,
COUNT(*) total,
SUM(CASE WHEN ride_status='Canceled' THEN 1 ELSE 0 END) canceled
FROM rides
GROUP BY hour;

-- Q5: Seasonal Analysis
SELECT 
CASE 
WHEN MONTH(ride_date) IN (12,1,2) THEN 'Winter'
WHEN MONTH(ride_date) IN (3,4,5) THEN 'Spring'
END AS season,
AVG(fare) avg_fare
FROM rides
GROUP BY season;

-- Q6: Ride Duration
SELECT start_city,
AVG(TIMESTAMPDIFF(MINUTE,start_time,end_time)) avg_duration
FROM rides
GROUP BY start_city;

-- Q7: Index
CREATE INDEX idx_ride_date ON rides(ride_date);

-- Q8: View
CREATE VIEW vw_avg_fare AS
SELECT start_city, AVG(fare) avg_fare
FROM rides
GROUP BY start_city;

-- Q9: Trigger
CREATE TABLE ride_status_log (
log_id INT AUTO_INCREMENT PRIMARY KEY,
ride_id VARCHAR(50),
old_status VARCHAR(20),
new_status VARCHAR(20),
changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);