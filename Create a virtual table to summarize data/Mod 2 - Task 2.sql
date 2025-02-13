SELECT 
    Customers.CustomerID,
    Customers.FullName,
    Orders.OrderID,
    Orders.TotalCost,
    Menus.MenuName,
    MenuItems.CourseName
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN Menus ON Orders.OrderID = Menus.OrderID
JOIN MenuItems ON Menus.MenuItemID = MenuItems.MenuItemID
WHERE Orders.TotalCost > 150
ORDER BY Orders.TotalCost ASC;