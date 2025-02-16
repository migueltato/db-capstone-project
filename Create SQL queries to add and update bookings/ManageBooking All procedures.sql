use little_lemon;

-- Task 1: Create a new procedure called AddBooking to add a new table booking record.
drop procedure if exists AddBooking;

DELIMITER //
create procedure AddBooking (ip_booking_id int, ip_customer_id int, ip_table_no int, ip_booking_date date)
begin
	INSERT INTO Bookings (BookingID, BookingDate, TableNo, BookingSlot, CustomerID, EmployeeID)
	VALUES (ip_booking_id, ip_booking_date, ip_table_no, '00:00:00', ip_customer_id, 1);
    
    select "New booking added" as "Confirmation";
end //
DELIMITER ;

call AddBooking(9, 3, 4, "2022-12-30");
-- select * from Bookings;

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
-- select * from Bookings;