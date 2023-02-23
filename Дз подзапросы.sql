SELECT DISTINCT ProductName, UnitsInStock
FROM Products AS p
JOIN [Order Details] AS od ON p.ProductID = od.ProductID
WHERE UnitsInStock<ALL(SELECT AVG(Quantity) FROM [Order Details] GROUP BY ProductID)
ORDER BY UnitsInStock DESC;
SELECT * FROM [Order Details]


SELECT o.CustomerID, SUM(o.Freight) AS FreightSum
FROM Orders AS o
JOIN            ( SELECT x.CustomerID, AVG(x.Freight) AS FreightAVG
                  FROM Orders AS x
				  GROUP BY CustomerID) AS p ON o.CustomerID = p.CustomerID
WHERE ShippedDate >'1996-07-15 00:00:00.000' AND ShippedDate <'1996-08-01 00:00:00.000' AND o.Freight > FreightAVG
GROUP BY o.CustomerID
ORDER BY SUM(o.Freight);


SELECT OrderID, SUM(UnitPrice*Quantity*(1-Discount)) AS OrderPrice
FROM [Order Details]
GROUP BY OrderID

SELECT TOP(3)CustomerID, ShipCountry, OrderPrice
FROM Orders
JOIN (SELECT OrderID, SUM(UnitPrice*Quantity*(1-Discount)) AS OrderPrice
      FROM [Order Details]
      GROUP BY OrderID) AS oi ON oi.OrderID = Orders.OrderID
WHERE OrderDate > '1997-09-01 00:00:00.000' AND ShipCountry IN ('Argentina', 'Bolivia', 'Brazil', 'Chile', 'Colombia', 'Ecuador', 'Guyana', 'Paraguay', 'Peru', 'Suriname', 'Uruguay', 'Venezuela')
ORDER BY OrderPrice DESC


SELECT p.ProductName, COUNT(q.ProductID) AS counti
FROM [Order Details] AS q
JOIN Products AS p ON p.ProductID = q.ProductID
GROUP BY ProductName
HAVING COUNT(q.ProductID) = 10

