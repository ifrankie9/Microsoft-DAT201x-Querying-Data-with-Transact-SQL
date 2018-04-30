-- Finish the INSERT statement

INSERT INTO SalesLT.Product (Name, ProductNumber, StandardCost, ListPrice, ProductCategoryID, SellStartDate)
VALUES
('LED Lights', 'LT-L123', 2.56, 12.99, 37, GETDATE());


-- Get last identity value that was inserted

SELECT SCOPE_IDENTITY();


-- Finish the SELECT statement

SELECT * FROM SalesLT.Product

WHERE ProductID = SCOPE_IDENTITY();


-- Insert product category
INSERT INTO SalesLT.ProductCategory (ParentProductCategoryID, Name)

VALUES

(4, 'Bells and Horns');


-- Insert 2 products

INSERT INTO SalesLT.Product (Name, ProductNumber, 	
StandardCost, ListPrice, ProductCategoryID, SellStartDate)

VALUES

('Bicycle Bell', 'BB-RING', 2.47, 4.99, IDENT_CURRENT('SalesLT.ProductCategory'), GETDATE()),

('Bicycle Horn', 'BB-PARP', 1.29, 3.75, IDENT_CURRENT('SalesLT.ProductCategory'), GETDATE());


-- Check if products are properly inserted

SELECT c.Name As Category, p.Name AS Product

FROM SalesLT.Product AS p

JOIN SalesLT.ProductCategory as c ON p.ProductCategoryID = c.ProductCategoryID

WHERE p.ProductCategoryID = IDENT_CURRENT('SalesLT.ProductCategory');

-- Update the SalesLT.Product table

UPDATE SalesLT.Product
SET ListPrice = ListPrice * 1.1

WHERE ProductCategoryID =
  
(SELECT ProductCategoryID FROM SalesLT.ProductCategory WHERE Name = 'Bells and Horns');


-- You can add a SELECT statement to check the update

SELECT ProductCategoryID 

FROM SalesLT.Product

-- Finish the UPDATE query

UPDATE SalesLT.Product
SET DiscontinuedDate = GETDATE()

WHERE ProductCategoryID = 37

AND ProductNumber <> 'LT-L123';

-- Delete records from the SalesLT.Product table

DELETE FROM SalesLT.Product

WHERE ProductCategoryID =
	
(SELECT ProductCategoryID FROM SalesLT.ProductCategory WHERE Name = 'Bells and Horns');


-- Delete records from the SalesLT.ProductCategory table

DELETE FROM SalesLT.ProductCategory
WHERE ProductCategoryID =
	
(SELECT ProductCategoryID FROM SalesLT.ProductCategory WHERE Name = 'Bells and Horns');

