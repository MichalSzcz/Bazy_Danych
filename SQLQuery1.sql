--1.Wykorzystujac wyrazenie CTE zbuduj zapytanie, ktore znajdzie inf
-- na temat pracownika oraz jego danych, a nastepnie zapisze je do tabeli
-- tymczasowej TempEmployeeInfo.Rozwiaz w oparciu o AdventureWorks.



;WITH TempEmployeeInfo(BusinessEntityID,Rate)
AS
(
SELECT  BusinessEntityID,Rate
FROM HumanResources.EmployeePayHistory

)

SELECT    c.BusinessEntityID ,p.BirthDate,c.Rate,p.MaritalStatus , p.HireDate 
FROM TempEmployeeInfo c LEFT JOIN HumanResources.Employee AS p
ON c.BusinessEntityID = p.BusinessEntityID


--2.Uzykaj inf na temat przychodow ze sprzedazy wedlug firmy i kontaktu
-- za pomoca cte i aw
--CompanyContact
--Revenue

USE AdventureWorksLT2019
GO
WITH zad2 ( FirstName ,LastName ,CompanyName, TotalDue)
AS
( 
SELECT FirstName ,LastName ,CompanyName, TotalDue 
FROM SalesLT.Customer
INNER JOIN SalesLT.SalesOrderHeader 
ON Customer.CustomerID = SalesLT.SalesOrderHeader.CustomerID
)
Select CONCAT( CompanyName ,'(', FirstName, ' ', LastName ,')') AS CompanyContact , TotalDue AS Revenue 
FROM zad2 
ORDER BY CompanyContact


--3.Napisz zapytanie ktore zwroci wartosc sprzedazy dla poszczegolnych kategorii
--produktow
--CTE wspolne wyrazenie tablicowe
 WITH sales AS
 (
     SELECT C.Name AS 'Category', CAST(SUM(D.LineTotal) AS numeric(12, 2)) AS 'SalesValue'
     FROM SalesLT.SalesOrderDetail AS D
     INNER JOIN SalesLT.Product AS P
         ON D.ProductID = P.ProductID
     INNER JOIN SalesLT.ProductCategory AS C
         ON P.ProductCategoryID = C.ProductCategoryID
     WHERE C.ParentProductCategoryID = 4
         GROUP BY C.Name
 )
 SELECT Category, SalesValue 
 FROM sales
     ORDER BY Category;





