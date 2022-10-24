USE AdventureWorks2019
GO

--Retornar os itens vendidos na última venda realizada
--Subconsulta independente
SELECT SalesOrderID, SalesOrderDetailID, OrderQty, ProductID, LineTotal
FROM Sales.SalesOrderDetail
WHERE SalesOrderID = (  SELECT MAX(SalesOrderID) AS Última_Venda
                        FROM Sales.SalesOrderHeader
)
Go

--Na prática:
SELECT SalesOrderID, SalesOrderDetailID, OrderQty, ProductID, LineTotal
FROM Sales.SalesOrderDetail
WHERE SalesOrderID =75123
Go

--Retornar todos os itens vendidos,exceto os da última venda realizada
SELECT SalesOrderID, SalesOrderDetailID, OrderQty, ProductID, LineTotal
FROM Sales.SalesOrderDetail
WHERE SalesOrderID != (  SELECT MAX(SalesOrderID) AS Última_Venda
                        FROM Sales.SalesOrderHeader
)
Go

--Erro de Subconsulta retornando mais de um valor
--(Operadores  =, =!, <, <=, > e >=)
SELECT SalesOrderID, SalesOrderDetailID, OrderQty, ProductID, LineTotal
FROM Sales.SalesOrderDetail
WHERE SalesOrderID =  ( SELECT TOP(5) SalesOrderID AS Últimas_Cinco_Vendas
                        FROM Sales.SalesOrderHeader
						ORDER BY SalesOrderID desc
						)
GO

--Subconsulta Escalar HAVING
--Vendas diarias de 2013 com valores inferior a media de vendas do Ano Anterior
SELECT OrderDate AS Data_da_Venda,SUM(TotalDue) AS Valor_Total_Diario_de_Vendas
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate)='2013'
GROUP BY OrderDate
HAVING SUM(TotalDue) < (
                         SELECT AVG(TotalDue)
						 FROM Sales.SalesOrderHeader --*Subconsulta recursiva
						 WHERE YEAR(OrderDate)='2012'
						 )
ORDER BY 1 ASC;