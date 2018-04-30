-- select ProductID and use the appropriate functions with the appropriate columns
SELECT ProductId, UPPER(Name) AS ProductName, ROUND(Weight, 0) AS ApproxWeight

FROM SalesLT.Product;

SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight, 0) AS ApproxWeight,
      

-- get the year of the SellStartDate
       
YEAR(SellStartDate) as SellStartYear,
       
-- get the month datepart of the SellStartDate
       
DATENAME(m, SellStartDate) as SellStartMonth

FROM SalesLT.Product;

SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight, 0) AS ApproxWeight,
      

YEAR(SellStartDate) as SellStartYear,
       
DATENAME(m, SellStartDate) as SellStartMonth,
       
-- use the appropriate function to extract substring from ProductNumber
      
SUBSTRING(ProductNumber, 0, 3) AS ProductType

FROM SalesLT.Product;

SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight, 0) AS ApproxWeight,
      
YEAR(SellStartDate) as SellStartYear,
       
DATENAME(m, SellStartDate) as SellStartMonth,
       
LEFT(ProductNumber, 2) AS ProductType

FROM SalesLT.Product
-- filter for numeric product size data

WHERE ISNUMERIC(Size) = 1;

-- select CompanyName and TotalDue columns

SELECT CompanyName, TotalDue AS Revenue,
       
-- get ranking and order by appropriate column
       
RANK() OVER (ORDER BY TotalDue DESC) AS RankByRevenue

FROM SalesLT.SalesOrderHeader AS SOH

-- use appropriate join on appropriate table
JOIN SalesLT.Customer AS C

ON SOH.CustomerID = C.CustomerID;

-- select the Name column and use the appropriate function with the appropriate column

SELECT Name, SUM(LineTotal) AS TotalRevenue

FROM SalesLT.SalesOrderDetail AS SOD

-- use the appropriate join

JOIN SalesLT.Product AS P

-- join based on ProductID

ON SOD.ProductID = P.ProductID

GROUP BY P.Name
ORDER BY SUM(LineTotal) DESC;

SELECT Name, SUM(LineTotal) AS TotalRevenue

FROM SalesLT.SalesOrderDetail AS SOD

JOIN SalesLT.Product AS P

ON SOD.ProductID = P.ProductID

-- filter as per the instructions

WHERE P.ListPrice > 1000

GROUP BY P.Name
ORDER BY TotalRevenue DESC;

SELECT Name, SUM(LineTotal) AS TotalRevenue

FROM SalesLT.SalesOrderDetail AS SOD

JOIN SalesLT.Product AS P

ON SOD.ProductID = P.ProductID

WHERE P.ListPrice > 1000

GROUP BY P.Name

-- add having clause as per instructions

HAVING SUM(LineTotal) > 20000

ORDER BY TotalRevenue DESC;




