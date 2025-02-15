-- Task 2: Create a new procedure called UpdateBooking that they can use to update existing bookings in the booking table.
drop procedure if exists UpdateBooking;

DELIMITER //
create procedure UpdateBooking(ip_booking_id int, ip_booking_date date)
begin
	update Bookings
	set BookingDate = ip_booking_date
	where BookingID = ip_booking_id;
    
    select concat("Booking ", ip_booking_id, " updated") as "Confirmation";
end //
DELIMITER ;

call UpdateBooking(9, "2022-12-21");
select * from Bookings;