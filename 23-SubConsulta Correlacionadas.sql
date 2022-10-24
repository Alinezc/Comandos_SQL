USE AdventureWorks2019
GO

--Subconsulta Correlacionada
--Retorna as vendas mais recentes feitas por cada empregado
SELECT Q1.SalesOrderID, Q1.SalesPersonID, Q1.OrderDate
FROM Sales.SalesOrderHeader AS Q1
WHERE Q1.OrderDate = (
                       SELECT MAX(Q2.OrderDate)
                       FROM Sales.SalesOrderHeader AS Q2
                       WHERE Q2.SalesPersonID = Q1.SalesPersonID
                       )
ORDER BY Q1.SalesPersonID, Q1.OrderDate;

--Operador EXISTS
--Retornar o ID e o bônus das pessoas que fizeram vendas em 2011
SELECT P.BusinessEntityID,P.Bonus
FROM Sales.SalesPerson P
WHERE EXISTS (
               SELECT *
               FROM Sales .SalesOrderHeader V
               WHERE V.SalesPersonID = P.BusinessEntityID
               AND YEAR(OrderDate) = '2011'
               )
ORDER BY 1 ASC;
--Operador EXISTS acima é equivalente a recuperar os resultados contando as linhas retornadas e
--comparando essa contagem com zero
SELECT P.BusinessEntityID, P.Bonus
FROM Sales .SalesPerson P
WHERE ( --Subcunsulta como expressao na clausula WHERE
          SELECT  COUNT(*)
          FROM Sales.SalesOrderHeader V
          WHERE V.SalesPersonID = P.BusinessEntityID
          AND YEAR(OrderDate) = '2011'
          ) > 0
ORDER BY 1 ASC;

--Conjunto de busca sem a correlaçao
SELECT DISTINCT SalesPersonID,P.Bonus
FROM Sales.SalesOrderHeader
JOIN Sales.SalesPerson P
ON SalesPersonID = P.BusinessEntityID
AND YEAR(OrderDate)='2011'
ORDER BY 1 ASC;

--EXISTS X IN
SELECT CustomerID,AccountNumber
FROM Sales.Customer
WHERE TerritoryID IN (
          SELECT  TerritoryID
          FROM Sales.SalesTerritory 
          WHERE NAME = 'Australia' OR NAME = 'France'
          ) ;

SELECT CustomerID,AccountNumber
FROM Sales.Customer C
WHERE EXISTS (
          SELECT  *
          FROM Sales.SalesTerritory T
          WHERE T.TerritoryID = C.TerritoryID
          AND (NAME = 'Australia' OR NAME = 'France')
          ) ;

--Operador NOT EXISTS
--Retornar o ID e o bônus das pessoas que NÃO fizeram vendas em 2011
SELECT P.BusinessEntityID, P.Bonus
FROM Sales .SalesPerson P
WHERE NOT EXISTS (
                  SELECT *
                  FROM Sales.SalesOrderHeader V
                  WHERE V.SalesPersonID = P.BusinessEntityID
                  AND YEAR(OrderDate) = '2011'
)
ORDER BY 1 ASC;

--Operadores NOT EXISTS acima é equivalente a recuperar os resultados contando as linhas retornadas
--e comparando essa contagem com zero
SELECT P.BusinessEntityID, P.Bonus
FROM Sales .SalesPerson P
WHERE (
                  SELECT COUNT(*)
                  FROM Sales.SalesOrderHeader V
                  WHERE V.SalesPersonID = P.BusinessEntityID
                  AND YEAR(OrderDate) = '2011'
) = 0
ORDER BY 1 ASC;

