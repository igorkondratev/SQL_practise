INSERT INTO Customers(CustomerID, ContactName, City, Country, CompanyName)
VALUES
('AAAAA', 'Alfred Mann', NULL, 'USA', 'fake_company'),
('BBBBB', 'Alfred Mann', NULL, 'Austria','fake_company');

SELECT ContactName, City, Country
FROM Customers
ORDER BY ContactName,
CASE WHEN City = NULL THEN Country
     ELSE  City
	 END;

SELECT ProductName, UnitPrice, 
CASE WHEN UnitPrice < 50 THEN 'low price'
     WHEN UnitPrice >= 50 AND  UnitPrice <100 THEN 'average'
	 WHEN UnitPrice > 100 THEN 'too expensive'
	 END AS Price
FROM Products

SELECT ContactName, CASE WHEN OrderID IS NULL THEN 'no orders' END AS status
FROM Orders AS o
RIGHT JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE OrderID is NULL

SELECT LastName, FirstName, COALESCE(NULLIF(Title,'Sales Representative'),'Sales Stuff')
FROM Employees