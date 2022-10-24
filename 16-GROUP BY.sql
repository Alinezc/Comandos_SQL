USE AdventureWorks2019
GO

--Agrupar Quantidade de Vendas por Funcion�rio
SELECT SalesPersonID AS ID_do_Vendedor, COUNT(SalesOrderID) AS Total_de_Vendas
FROM Sales.SalesOrderHeader
GROUP BY SalesPersonID
ORDER BY 2 DESC;

--Agrupar Quantidade de Vendas dos Funcion�rio por Dia (N�o OK - Coluna n�o definida no agrupamento)
SELECT SalesPersonID AS ID_do_Vendedor, OrderDate AS Data_da_Venda,
COUNT(SalesOrderID) AS Total_de_Vendas
FROM Sales.SalesOrderHeader
WHERE SalesPersonID IS NOT NULL
GROUP BY SalesPersonID,OrderDate --correto 
ORDER BY OrderDate DESC;

--Agrupar Quantidade de Vendas dos Funcion�rio por Dia (OK)
SELECT  SalesPersonID AS ID_do_Vendedor, OrderDate AS Data_da_Venda,
CouNT(SalesOrderID) AS Total_de_Vendas
FROM Sales.SalesOrderHeader
WHERE SalesPersonID  IS NOT NULL
GROUP BY SalesPersonID, OrderDate
ORDER BY OrderDate DESC;

--Fun��o de Agrega��o x Outras Fun��es no SELECT
--Agrupar Quantidade de Vendas dos Funcion�rio por Ano (N�o OK - coluna com fun��o de data n�o definida no agrupamente
SELECT SalesPersonID AS ID_do_Vendedor, YEAR(OrderDate) AS Ano_da_Venda,
COUNT(SalesOrderID) AS Total_de_Vendas
FROM Sales.SalesOrderHeader
GROUP BY SalesPersonID
ORDER BY YEAR(OrderDate) DESC;

--Agrupar Quantidade de vendas dos Funcionarios por Ano(OK)
SELECT SalesPersonID AS ID_do_Vendedor, YEAR(OrderDate) AS Ano_da_Venda,
COUNT(SalesOrderID) AS Total_de_Vendas
FROM Sales.SalesOrderHeader
GROUP BY SalesPersonID,YEAR(OrderDate)
ORDER BY YEAR(OrderDate) DESC;

--Alias no Group By
--Valor Totaz de Vendos Por DIA (OK)
 SELECT OrderDate As Data_da_Venda, SUM(TotalDue) AS Valor_Total_de_Vendas
FROM Sales.SalesOrderHeader
GROUP BY Data_de_Venda
ORDER BY 1 ASC;

--Valor Totel de Vendas Por Dia (OK)
SELECT OrderDate As Data_da_Venda, SUM(TotalDue) AS Valor_Total_de_Vendas
FROM Sales.SalesOrderHeader
GROUP BY OrderDate
ORDER BY 1 ASC;

---FILTRANDO AGRUPAMENTOS

--Valor Total de Vendas Por DIA em 2013
SELECT OrderDate AS Data_da_Venda, SUM(Totaldue) AS Valor_Total_Di�rio_de_Vendas
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate)='2013' 
GROUP BY OrderDate
ORDER BY 1 ASC;

--Valor Total de Vendas Por M�s em 2013
SELECT MONTH(OrderDate) AS M�s_da_Venda, SUM(TotalDue) AS Valor_Total_de_Vendas
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate)='2013'
GROUP BY MONTH(OrderDate)
ORDER BY 1 ASC;

-- Filtrando com Having os dias com vendas superiores a 4 milhoes, no ano de 2013
SELECT OrderDate AS Data_da_Venda, SUM(TotalDue) AS Valor_Total_Diario_de_Vendas
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate)='2013'
GROUP BY OrderDate
HAVING SUM(TotalDue)>4000000
ORDER BY 1 ASC;

--Quantidade de Vendas por Funcionario com ID maior que 280
SELECT SalesOrderID AS ID_do_Vendedor, COUNT(SalesOrderID) AS Total_de_Vendas
FROM Sales.SalesOrderHeader
GROUP BY SalesOrderID
HAVING SalesOrderID >280
ORDER BY 2 DESC;


--Lenbrar que o WHERE limita as linhhs passadas para o GROUP BY, podendo reduzir a quantidade de grupos a serem formados
--Nesse exeMplo, como A coluna no WHERE/HAVING e GROUP BY � a mesma, fica semelhante a HAVING SalesPerson> 280
--Resultado igual ao acima
SELECT SalesPersonID As ID_do_Vendedor, COUNT(SalesOrderID) AS Total_de_Vendas
FROM Sales.SalesOrderHeader
WHERE SalesPersonID > 280
GROUP BY SalesPersonID
ORDER BY 2 DESC;

--Clientes que Fizeram mais de 10 compras em 2013
--Having + Where
SELECT CustomerID As ID_do_Cliente, COUNT(SalesOrderID) AS Total_de_Compras
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate)='2013'
GROUP BY CustomerID
HAVING COUNT(SalesOrderID)>10
ORDER BY COUNT(SalesOrderID) DESC;

--Colunas na Clausula HAVING
SELECT CustomerID As ID_do_Cliente, COUNT(SalesOrderID) AS Total_de_Compras
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate)='2013'
GROUP BY CustomerID
-- ERRO  HAVING SalesOrderID >10
--HAVING CustomerID > 10
HAVING COUNT(SalesOrderID)>10
ORDER BY COUNT(SalesOrderID) DESC;

--Clientes que Fizeram mais de 10 compras em 2013
--Alias n�o permitido no Having
SELECT CustomerID As ID_do_Cliente, COUNT(SalesOrderID) AS Total_de_Compras
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate)='2013'
GROUP BY CustomerID
HAVING Total_de_Compras >10
ORDER BY COUNT(SalesOrderID) DESC;


