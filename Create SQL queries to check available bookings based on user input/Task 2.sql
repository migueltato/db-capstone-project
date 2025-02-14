-- Task 2: Create a stored procedure to check whether a table in the restaurant is already booked
drop procedure if exists CheckBooking;

DELIMITER //
create procedure CheckBooking (input_date date, input_table_no int)
begin
	set @booking_id = null;

	select BookingID into @booking_id from Bookings
    where BookingDate = input_date and TableNo = input_table_no;
    
    if @booking_id is null then
		select concat("Table ", input_table_no, " has not been booked") as "Booking Status";
	else
		select concat("Table ", input_table_no, " is already booked") as "Booking Status";
	end if;
end //
DELIMITER ;

-- select * from bookings;
call CheckBooking('2023-07-30', 8);