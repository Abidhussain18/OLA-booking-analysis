Create Database Ola;
Use Ola;

# 1.Retrieve all successful bookings
Create View Successful_Bookings AS 
Select * From Bookings
WHERE Booking_status = "Success";

# 1.Retrieve all successful bookings
Select * From Successful_Bookings;

# 2. Find the average ride distance for each vehicle type
Create View ride_distance_for_each_vehicle AS 
Select Vehicle_type, Round(Avg(Ride_Distance),2) AS Average_distance
From Bookings
GROUP BY vehicle_type;

# 2. Find the average ride distance for each vehicle type
Select * From ride_distance_for_each_vehicle;

# 3. Get the total number of cancelled rides by customers:
Create View cancelled_rides_by_customers As
Select Count(*) 
From Bookings
Where Booking_Status = "Canceled by Customer";

# 3. Get the total number of cancelled rides by customers:
Select * From cancelled_rides_by_customers;

# 4. List the top 5 customers who booked the highest number of rides:
Create View Top_5_Customers AS 
Select Customer_ID, Count(Booking_ID) AS Total_rides
From Bookings
Group by Customer_ID
ORDER BY Total_rides DESC
LIMIT 5;

# 4. List the top 5 customers who booked the highest number of rides:
Select * From Top_5_Customers;

# 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create View Rides_cancelled_by_Drivers_P_C_Issues As
Select Count(*) 
From Bookings
Where Canceled_Rides_by_Driver = "Personal & Car related issue";

# 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Select * From Rides_cancelled_by_Drivers_P_C_Issues;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create View Max_Min_Driver_Rating As
Select Max(Driver_Ratings) AS Max_rating,
Min(Driver_Ratings) AS Min_rating
FROM Bookings
Where Driver_Ratings = "Prime Sedan" ;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Select * From Max_Min_Driver_Rating;


#7. Retrieve all rides where payment was made using UPI:
Create View UPI_Payment As
Select * From Bookings
Where Payment_Method = "UPI";

#7. Retrieve all rides where payment was made using UPI:
Select * From UPI_Payment;

#8. Find the average customer rating per vehicle type:
Create View AVG_Cust_Rating As
Select Vehicle_Type, Round(Avg(Customer_Rating),2) as avg_customer_rating
From Bookings
Group by Vehicle_Type;

#8. Find the average customer rating per vehicle type:
Select * From AVG_Cust_Rating;

#9. Calculate the total booking value of rides completed successfully:
Create View total_successful_ride_value As
SELECT SUM(Booking_Value) as total_successful_ride_value
FROM bookings
WHERE Booking_Status = 'Success';

#9. Calculate the total booking value of rides completed successfully:
Select * From total_successful_ride_value;

#10. List all incomplete rides along with the reason:
Create View Incomplete_Rides_Reason As
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes'; 

#10. List all incomplete rides along with the reason:
Select * From Incomplete_Rides_Reason


