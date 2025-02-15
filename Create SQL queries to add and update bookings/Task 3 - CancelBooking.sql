-- Task 3: Create a new procedure called CancelBooking that they can use to cancel or remove a booking.
drop procedure if exists CancelBooking;

DELIMITER //
create procedure CancelBooking(ip_booking_id int)
begin
	delete from Bookings
	where BookingID = ip_booking_id;
    
    select concat("Booking ", ip_booking_id, " cancelled") as "Confirmation";
end //
DELIMITER ;

call CancelBooking(9);
select * from Bookings;