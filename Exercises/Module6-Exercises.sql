-- select the ProductID, Name, and ListPrice columns

SELECT ProductID, Name, ListPrice

FROM SalesLT.Product

-- filter based on ListPrice
WHERE ListPrice >

-- get the average UnitPrice
(SELECT AVG(UnitPrice) 
FROM SalesLT.SalesOrderDetail)

ORDER BY ProductID;

SELECT ProductID, Name, ListPrice

FROM SalesLT.Product

WHERE ProductID IN
  
-- select ProductID from the appropriate table
  
(SELECT ProductID FROM SalesLT.SalesOrderDetail
   
WHERE UnitPrice < 100)

AND ListPrice >= 100

ORDER BY ProductID;

SELECT ProductID, Name, StandardCost, ListPrice,

-- get the average UnitPrice

(SELECT AVG(UnitPrice)
 
-- from the appropriate table, aliased as SOD
 
FROM SalesLT.SalesOrderDetail AS SOD
 
-- filter when the appropriate ProductIDs are equal
 
WHERE P.ProductID = SOD.ProductID) AS AvgSellingPrice

FROM SalesLT.Product AS P

ORDER BY P.ProductID;

SELECT ProductID, Name, StandardCost, ListPrice,

(SELECT AVG(UnitPrice)
 
FROM SalesLT.SalesOrderDetail AS SOD
 
WHERE P.ProductID = SOD.ProductID) AS AvgSellingPrice

FROM SalesLT.Product AS P

-- filter based on StandardCost

WHERE StandardCost >

-- get the average UnitPrice

(SELECT AVG(UnitPrice)
 
-- from the appropriate table aliased as SOD
 
FROM SalesLT.SalesOrderDetail AS SOD
 
-- filter when the appropriate ProductIDs are equal
 
WHERE P.ProductID = SOD.ProductID)

ORDER BY P.ProductID;

-- select SalesOrderID, CustomerID, FirstName, LastName, TotalDue from the appropriate tables

SELECT SalesOrderID, CI.CustomerID, FirstName, LastName, TotalDue

FROM SalesLT.SalesOrderHeader AS SOH

-- cross apply as per the instructions
CROSS APPLY dbo.ufnGetCustomerInformation(SOH.CustomerID) AS CI

-- finish the clause

ORDER BY SOH.SalesOrderID;

-- select the CustomerID, FirstName, LastName, Addressline1, and City columns from the appropriate tables

SELECT CA.CustomerID, FirstName, LastName, A.Addressline1, A.City

FROM SalesLT.Address AS A

JOIN SalesLT.CustomerAddress AS CA

-- join based on AddressID

ON A.AddressID = CA.AddressID

-- cross apply as per instructions

CROSS APPLY dbo.ufnGetCustomerInformation(CA.CustomerID) AS CI

ORDER BY CA.CustomerID;

