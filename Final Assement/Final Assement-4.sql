SELECT OrderID, ShippedDate, 
(CHOOSE(MONTH(ShippedDate),'Winter', 'Winter', 'Spring', 'Spring', 'Spring', 
 'Summer', 'Summer', 'Summer', 'Autumn', 'Autumn', 'Autumn', 'Winter')) AS ShippedSeason
FROM Dbo.Orders
WHERE ShippedDate IS NOT NULL



SELECT CompanyName,
IIF(Fax IS NULL,'modern','outdated') AS Status
FROM Dbo.Suppliers



