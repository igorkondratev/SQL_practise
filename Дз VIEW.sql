CREATE OR ALTER view oca AS
SELECT OrderDate, RequiredDate, ShippedDate, ShipPostalCode, CompanyName, ContactName, Phone, LastName, FirstName, Title
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Employees e ON o.EmployeeID = e.EmployeeID

SELECT * FROM oca
WHERE OrderDate > '1997-01-01';

DROP VIEW IF EXISTS oca

CREATE  VIEW discpro AS
SELECT * FROM Products
WHERE Discontinued = 0
WITH CHECK OPTION

SELECT * FROM discpro

INSERT INTO discpro
VALUES
('damn',1,1,'lol',1,1,1,1,1)