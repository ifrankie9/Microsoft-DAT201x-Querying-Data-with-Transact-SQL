SELECT ProductName, UnitPrice
FROM Dbo.Products
WHERE UnitPrice >
(SELECT AVG(UnitPrice) FROM Dbo.[Order Details]);



SELECT E.FirstName, E.EmployeeID FROM Dbo.Employees AS E
WHERE E.EmployeeID IN 
(SELECT O.EmployeeID FROM Dbo.Orders AS O
WHERE ShipCountry = 'USA');



CREATE TABLE #ProductNames
(ProductName VARCHAR(40))
SELECT P.ProductName 
FROM Products AS P
INSERT INTO #ProductNames



SELECT * FROM #ProductNames;

