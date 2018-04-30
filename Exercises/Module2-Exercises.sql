-- select unique cities, and state province
SELECT DISTINCT City, StateProvince
FROM SalesLT.Address;

-- select the top 10 percent from the Name column
SELECT TOP 10 PERCENT Name
FROM SalesLT.Product

-- order by the weight in descending order
ORDER BY Weight DESC;
SELECT Name
FROM SalesLT.Product
ORDER BY Weight DESC

-- offset 10 rows and get the next 100
OFFSET 10 ROWS FETCH NEXT 100 ROWS ONLY;

-- select the Name, Color, and Size columns
SELECT Name, Color, Size
FROM SalesLT.Product

-- check ProductModelID is 1
WHERE ProductModelID = 1;

-- select the ProductNumber and Name columns
SELECT ProductNumber, Name
FROM SalesLT.Product

-- check that Color is one of 'Black', 'Red' or 'White'
-- check that Size is one of 'S' or 'M'
WHERE Color IN ('Black', 'Red', 'White') AND Size IN ('S', 'M');

-- select the ProductNumber, Name, and ListPrice columns
SELECT ProductNumber, Name, ListPrice
FROM SalesLT.Product

-- filter for product numbers beginning with BK- using LIKE
WHERE ProductNumber LIKE 'BK%';

-- select the ProductNumber, Name, and ListPrice columns
SELECT ProductNumber, Name, ListPrice
FROM SalesLT.Product

-- filter for ProductNumbers
WHERE ProductNumber LIKE 'BK-[^R]%-[0-9][0-9]';
