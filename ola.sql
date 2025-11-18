create database Ola;
use Ola;

-- Retrive all successful booking
create view successful_booking as
select * from bengaluru_ride_booking_data
where  Overall_Booking_Status='success' ;
select * from successful_booking;
-- Find the average ride distance for ech vhicle type

select avg(Ride_Distance_km) as average_distance_ride,vehicle_type from bengaluru_ride_booking_data
group by vehicle_type;

-- Get the total number of canceled rides by customer

select count( Overall_Booking_Status) as cancelled_by_customer from bengaluru_ride_booking_data
where  Overall_Booking_Status ='Cancelled by Customer';

-- List the top 5 customer who booked the higest number of ride
create view Total_ride_by_customer as
select  Customer_ID ,count(Booking_ID) AS Total_Ride from bengaluru_ride_booking_data
WHERE Overall_Booking_Status='success'
group by Customer_ID
order by Total_Ride desc
limit 5 ;
select* from  Total_ride_by_customer;

-- Get the number of ride canceled by drivers due to personal and car-related issues
select count(*)from bengaluru_ride_booking_data
where Reason_for_Canceling_by_Driver='Personal Car Issue & Customer Related Issue';

-- Find th maxmiun and minimun driver rating dor prime sedan booking
create view max_min_rating_driver as
select max(Driver_Rating),MIN(Driver_Rating)  from  bengaluru_ride_booking_data
where Vehicle_Type ='Prime SUV';
select *  from  max_min_rating_driver;

-- Find the average customer rating per vehicle type
create view avg_customer_rating as
select Vehicle_Type, avg(Customer_Rating) from bengaluru_ride_booking_data
group by Vehicle_Type;
select *   from avg_customer_rating;

-- Calculate the total booking value of rides complete successfull
create view total_successful_booking as
select sum(Booking_Value_INR) from bengaluru_ride_booking_data
where Overall_Booking_Status='Success';

-- List all the incomplete ride alomg with reason
create view incompleteRR as
select Booking_ID, Incomplete_Ride_Reason
from bengaluru_ride_booking_data
where Incomplete_Rides ='0';
select* from incompleteRR;


 

 
 