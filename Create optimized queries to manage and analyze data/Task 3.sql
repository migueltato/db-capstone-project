-- Task 3: Create a procedure to delete an order record based on the user input of the order id.
drop procedure if exists CancelOrder;
DELIMITER //
CREATE PROCEDURE CancelOrder(IN input_order_id INT)
BEGIN
	delete from Orders where OrderID = input_order_id;
    select concat("Order ", input_order_id, " is cancelled") as Confirmation;
END //
DELIMITER ;

call CancelOrder(5);
-- select * from Orders;