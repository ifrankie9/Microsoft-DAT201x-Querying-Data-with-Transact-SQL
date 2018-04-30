SELECT O.OrderID, OD.UnitPrice 
FROM Dbo.Orders AS O
JOIN Dbo.[Order Details] AS OD
ON O.OrderID = OD.OrderID


SELECT O.OrderID, E.FirstName
FROM Dbo.Orders AS O
JOIN Dbo.Employees AS E
ON O.EmployeeID = E.EmployeeID


SELECT E.EmployeeID, T.TerritoryDescription
FROM Dbo.Employees AS E
JOIN Dbo.EmployeeTerritories AS ET
ON E.EmployeeID = ET.EmployeeID
JOIN Dbo.Territories AS T
ON ET.TerritoryID = T.TerritoryID
ORDER BY E.EmployeeID, T.TerritoryDescription


SELECT Country FROM Dbo.Customers
UNION 
SELECT Country FROM Dbo.Suppliers
ORDER BY Country


SELECT Country FROM Dbo.Customers
UNION ALL


SELECT Country FROM Dbo.Suppliers
ORDER BY Country;


SELECT ROUND(UnitPrice, 0) as UnitPrice
FROM Dbo.Products


SELECT SUM(UnitsInStock) AS TotalInStock
FROM Dbo.Products;


SELECT OrderID, YEAR(OrderDate) AS OrderYear
FROM Dbo.Orders;


SELECT OrderID, DATENAME(month, OrderDate) as OrderMonth
FROM Dbo.Orders


SELECT LEFT(RegionDescription, 2)
FROM Dbo.Region;


SELECT City, PostalCode
FROM Dbo.Suppliers
WHERE ISNUMERIC(PostalCode) = 1


SELECT UPPER(LEFT(RegionDescription, 1)) AS Region
FROM Dbo.Region


