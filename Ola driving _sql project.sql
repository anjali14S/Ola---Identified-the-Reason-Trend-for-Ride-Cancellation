CREATE DATABASE Ola;
USE Ola;

-- 1. Retrive all successful bookings
CREATE VIEW Successful_Bookings AS
SELECT * FROM bookings
WHERE Booking_Status = "Success";

SELECT * FROM Successful_Bookings;

-- 2.Find the average ride distance for each vehicle type
CREATE VIEW ride_distance_vehicle AS
SELECT  Vehicle_Type , AVG(Ride_Distance)
AS avg_distance
FROM bookings 
GROUP BY Vehicle_Type;

SELECT * FROM ride_distance_vehicle;

-- 3. Get the total number of canceled rides by customers
SELECT COUNT(*) 
FROM bookings
WHERE Booking_Status = 'Canceled by Customer';

-- 4. List the top 5 customers who booked the highest number of rides 
 
SELECT Customer_ID , COUNT(Booking_ID) AS total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;

-- 5.Get the numberr of rides cancled by drivers due to persnal and car- related issues

SELECT COUNT(*) 
FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

--  6.Find the maximum and minimum driver ratings for prime sedan bookings

SELECT MAX(Driver_Ratings ) AS max_rating,
 MIN(Driver_Ratings) AS min_rating
FROM bookings
WHERE Vehicle_Type = 'Prime Sedan';

--  7. Retrive all rides where payment was made using UPI 
SELECT * FROM bookings
WHERE Payment_Method = 'UPI';

-- 8.Find the average customer rating per vehicle Type

SELECT AVG(Customer_Rating) AS avg_rating, Vehicle_Type
FROM bookings
GROUP BY Vehicle_Type;

-- 9.calculate the total booking value of rides completed successfully

SELECT SUM(Booking_Value) AS total_value
FROM bookings
WHERE Booking_Status = 'Success';

-- 10.List all incomplete rides along with reason
 SELECT Booking_ID, Incomplete_Rides_Reason
 FROM bookings
 WHERE Incomplete_Rides = 'Yes';
 
 