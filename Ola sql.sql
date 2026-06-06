create database ola;
use ola;

-- retrieve all successful booking

create view successfull_bookings as
select * from bookings where Booking_Status="Success";

-- find the average ride distance for each vehicle type:

create view ride_distance_avg_view as
select Vehicle_Type, avg(Ride_Distance)as avg_distance from bookings group by Vehicle_Type;

-- Get the total number of cancelled rides by customers:

create view canceled_ride_by_customer as
select count(*) from bookings where Booking_Status="Canceled by Customer";

use ola;

--  List the top 5 customers who booked the highest number of rides: 

create view highset_bookingrides_customer as
select Customer_ID, count(Booking_ID) as total_rides from bookings 
group by Customer_ID
order by total_rides desc limit 5;

-- Get the number of rides cancelled by drivers due to personal and car-related issues:

create view cancel_bt_driver_personal_releted_issue as
select count(*) from bookings where Canceled_Rides_by_Driver="Personal & Car related issue";


 -- Find the maximum and minimum driver ratings for Prime Sedan bookings:
 
create view max_and_min_rating_of_p_s as
select Vehicle_Type,max(Driver_Ratings)as maxrat ,min(Driver_Ratings) as minrate from bookings where Vehicle_Type="Prime Sedan";

-- Retrieve all rides where payment was made using UPI:

create view upi_payment_id as
select * from bookings where Payment_Method="UPI";

-- Find the average customer rating per vehicle type:

create view c_reating_vehicle_type_per as
select Vehicle_Type,avg(Customer_Rating) as avg_c_rating from bookings 
group by Vehicle_Type;

-- Calculate the total booking value of rides completed successfully:

create view totale_of_booking as
select sum(Booking_Value) from bookings where Booking_Status="Success";

--  List all incomplete rides along with the reason:

create view incomplete_ridea_along_with_reason as
select Incomplete_Rides,Incomplete_Rides_Reason from bookings where Incomplete_Rides="Yes";


