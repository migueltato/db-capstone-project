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
select * from Bookings;