
--1.

--CAST Konwertuj wartoœæ na typ danych
WITH fibbo AS (
  SELECT  1 n, CAST(0 as bigint) f, CAST(1 as bigint) f1
  UNION ALL
  SELECT  n + 1, f + f1 f, f f1 FROM fibbo WHERE n < 93
)
SELECT  n, f FROM fibbo;


GO;










--2
CREATE TRIGGER ZAD2_1
ON Person.Person
AFTER UPDATE 
AS 
BEGIN
UPDATE Person.Person

SET LastName=UPPER(LastName)
END;

GO;


UPDATE Person.Person

SET LastName=LOWER(LastName)

 SELECT * FROM Person.Person



 INSERT INTO [Person].[Person]
			([BusinessEntityID], [FirstName],
			[MiddleName],
			[LastName],
			[PersonType])
			VALUES
			(20779,'Michal','K','Saczypka','SC')
GO
INSERT INTO Person.BusinessEntity(rowguid)
VALUES(newid())

SELECT * FROM Person.BusinessEntity

SELECT * FROM Person.Person



GO;
--3.

CREATE TRIGGER taxRateMonitoring
ON Sales.SalesTaxRate
AFTER UPDATE
AS
BEGIN
DECLARE @NowyTaxRate int, @TaxRate int
SELECT @NowyTaxRate = TaxRate FROM INSERTED SalesTaxRate
SELECT @TowyRate = TaxRate FROM DELETED
IF @NowyTaxRate > 1.3*@TaxRate
PRINT 'Warning! The change in the value in the TaxRate field is greater than 30%'
END
GO
SELECT * FROM Sales.SalesTaxRate
