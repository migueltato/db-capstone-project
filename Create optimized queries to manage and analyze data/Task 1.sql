use little_lemon;

-- Task 1: Create a procedure that displays the maximum ordered quantity in the Orders table. 
drop procedure if exists GetMaxQuantity;
create procedure GetMaxQuantity()
select MAX(Quantity) as "Max Quantity in Orders" from Orders;

call  GetMaxQuantity();