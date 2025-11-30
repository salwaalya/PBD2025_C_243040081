USE RetailStoreDB

SELECT *
FROM Production.Product;

SELECT Name , ProductNumber, ListPrice 
FROM Production.Product;

SELECT Name AS [Nama Barang], ListPrice AS 'Harga Jual'
FROM Production.Product;

SELECT Name, ListPrice, (ListPrice*1.1) AS HargaBaru
FROM Production.Product;

SELECT Name + '(' + ProductNumber + ')' AS HargaBaru
FROM Production.Product

SELECT Name, Color, ListPrice
FROM Production.Product
WHERE Color = 'Red';


SELECT Name, Color, ListPrice
FROM Production.Product
WHERE Color = 'Blue';


SELECT Name, ListPrice
FROM Production.Product
WHERE ListPrice  > 1000;


SELECT Name, ListPrice
FROM Production.Product
WHERE ListPrice < 1000;

SELECT Name, ListPrice 
FROM Production.Product
WHERE Color = 'Red' AND ListPrice = 150;

SELECT Name, ListPrice 
FROM Production.Product
WHERE Color = 'Red' AND ListPrice > 1000;

SELECT Name, Color, ListPrice 
FROM Production.Product
WHERE Color = 'Red' OR Color = 'Black'
ORDER BY Color Desc;

SELECT Name, Color
FROM Production.Product
WHERE Color IN ('red','black','blue')
ORDER BY Color ASC;

SELECT Name, ProductNumber 
FROM Production.Product
WHERE Name LIKE '%road%';

SELECT COUNT(*) AS TotalProduk
FROM Production.Product;

SELECT color, COUNT(*) AS JumlahProduk
FROM Production.Product
GROUP BY Color;

SELECT ProductID, SUM (OrderQty) AS TotalJual, AVG (UnitPrice) AS HargaRataRata
FROM Sales.SalesOrderDetail
GROUP BY ProductID;

SELECT Color, COUNT(*) AS JumlahTotal
FROM Production.Product
GROUP BY Color 
HAVING COUNT(*) > 1;

SELECT Color, COUNT(*) AS JumlahTotal
FROM Production.Product
WHERE ListPrice > 50
GROUP BY Color 
HAVING COUNT(*) > 1;

SELECT ProductID, SUM (OrderQty) AS TotalQty
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM (OrderQty) > 10;

SELECT SpecialOfferID, AVG (OrderQty) AS RataRataBeli
FROM Sales.SalesOrderDetail
GROUP BY SpecialOfferID
HAVING AVG (OrderQty) < 5;

SELECT Color
FROM Production.Product
GROUP BY Color
HAVING MAX(ListPrice) > 3000

SELECT * 
FROM HumanResources.Employee;

SELECT DISTINCT JobTitle
FROM HumanResources.Employee;

SELECT Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;

SELECT TOP 5 Name, Listprice
FROM Production.Product
ORDER BY ListPrice ASC;

SELECT TOP 5 Name, Listprice
FROM Production.Product
ORDER BY ListPrice DESC;

SELECT Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC
OFFSET 2 ROWS
FETCH NEXT 4 ROWS ONLY