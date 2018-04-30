-- select the appropriate columns from the appropriate tables
SELECT P.ProductID, P.Name AS ProductName, PM.Name AS ProductModel, PM.Summary
FROM SalesLT.Product AS P
JOIN SalesLT.vProductModelCatalogDescription AS PM
-- join based on ProductModelID
ON P.ProductModelID = PM.ProductModelId
ORDER BY ProductID;



DECLARE @Colors AS TABLE (Color NVARCHAR(15));
INSERT INTO @Colors
SELECT DISTINCT Color 
FROM SalesLT.Product;



SELECT ProductID, Name, Color
FROM SalesLT.Product
WHERE Color IN (SELECT Color FROM @Colors);



SELECT C.ParentProductCategoryName AS ParentCategory,       
C.ProductCategoryName AS Category,       
P.ProductID, P.Name AS ProductName
FROM SalesLT.Product AS P
JOIN dbo.ufnGetAllCategories() AS C
ON P.ProductCategoryID = C.ProductCategoryID
ORDER BY ParentCategory, Category, ProductName;



SELECT CompanyContact, SUM(SalesAmount) AS Revenue
FROM	
(SELECT CONCAT(c.CompanyName, CONCAT(' (' + c.FirstName + ' ', c.LastName + ')')), SOH.TotalDue	 
FROM SalesLT.SalesOrderHeader AS SOH	 
JOIN SalesLT.Customer AS c	 
ON SOH.CustomerID = c.CustomerID) AS CustomerSales(CompanyContact, SalesAmount)
GROUP BY CompanyContact
ORDER BY CompanyContact;

