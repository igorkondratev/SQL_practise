CREATE OR ALTER PROCEDURE BackUpp 
AS
BEGIN
 DROP TABLE IF EXISTS Backupp_t 
 CREATE TABLE Backupp_t(


	[CustomerID] [nchar](5) NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[ContactName] [nvarchar](30) NULL,
	[ContactTitle] [nvarchar](30) NULL,
	[Address] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](15) NULL,
	[Phone] [nvarchar](24) NULL,
	[Fax] [nvarchar](24) NULL,



 )

 INSERT INTO Backupp_t 
 SELECT * FROM Customers
 

END;

GO

EXEC BackUpp

SELECT * FROM Backupp_t

GO

CREATE OR ALTER PROCEDURE FixOrdersShipRegion 
AS
BEGIN
UPDATE Backupp_t
    SET Region = 'unknown'
    WHERE Region IS NULL
END;

GO

EXEC FixOrdersShipRegion 

CREATE OR ALTER PROCEDURE GetOrderQuantity @country nvarchar(15), @quantity int OUT
AS 
BEGIN
 SELECT @quantity = COUNT(*)
 FROM Orders
 WHERE ShipRegion = @country
 --GROUP BY ShipRegion
END;


CREATE OR ALTER FUNCTION SoldMoreThan (@quant int)
RETURNS TABLE 
AS
RETURN
SELECT ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, Discontinued
FROM Products
WHERE UnitsOnOrder > @quant




SELECT * FROM SoldMoreThan(1)