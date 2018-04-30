SELECT QuantityPerUnit FROM Dbo.Products


SELECT DISTINCT CategoryID FROM Dbo.Products


SELECT ProductName FROM Dbo.Products

WHERE UnitsInStock > 20;


SELECT TOP 10 ProductID, ProductName, UnitPrice 
FROM Dbo.Products
ORDER BY UnitPrice DESC;


SELECT ProductID, ProductName, QuantityPerUnit FROM Dbo.Products

ORDER BY ProductName;


SELECT ProductID, ProductName, UnitPrice FROM Dbo.Products

ORDER BY UnitsInStock DESC

OFFSET 10 ROWS FETCH FIRST 5 ROW ONLY


SELECT FirstName + 

' has an EmployeeID of ' + 

CAST(EmployeeID AS VarChar(5)) + 

' and was born '
+ 
CONVERT(NVARCHAR(30), BirthDate, 126) AS Employees 

FROM Employees


SELECT ShipName + ' is from ' + 
COALESCE(ShipCity, ShipRegion, ShipCountry) AS Destination

FROM Dbo.Orders


SELECT ShipName, ISNULL(ShipPostalCode, 'unknown') FROM Dbo.Orders


SELECT CompanyName,

CASE
   
WHEN Fax IS NULL THEN 'modern'
   
ELSE 'outdated'

END AS FaxStatus

FROM Dbo.Suppliers


