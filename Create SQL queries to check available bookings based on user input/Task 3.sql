-- Task 3: Little Lemon need to verify a booking, 
-- and decline any reservations for tables that are already booked under another name
drop procedure if exists AddValidBooking;

DELIMITER //
create procedure AddValidBooking (input_date date, input_table_no int)
begin 
	START TRANSACTION;
    insert into Bookings (BookingDate, TableNo, BookingSlot, CustomerID, EmployeeID)
	values (input_date, input_table_no, '00:00:00', 1, 1);
    
    set @cnt_booking = 0;

	select count(BookingID) into @cnt_booking from Bookings
    where BookingDate = input_date and TableNo = input_table_no;
    
    if @cnt_booking = 1 then
		commit;
		select concat("You have successfully booked table ", input_table_no, " on ", input_date) 
        as "Booking Status";
	else
		rollback;
		select concat("Table ", input_table_no, " is already booked on ", input_date , "- booking cancelled") 
        as "Booking Status";
    end if;
end //
DELIMITER ;

select * from bookings;
call AddValidBooking("2023-10-10", 5)