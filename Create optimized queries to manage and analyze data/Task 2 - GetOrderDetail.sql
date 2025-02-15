--  Task 2: Create a prepared statement
prepare GetOrderDetail from 
"select OrderID, Quantity, TotalCost 
from Orders inner join Customers using (CustomerID) 
where CustomerID = ?";

SET @id = 1;
EXECUTE GetOrderDetail USING @id;

