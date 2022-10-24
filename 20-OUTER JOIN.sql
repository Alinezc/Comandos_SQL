USE Adventureworks2019
GO

--LEFT OUTER JOIN
--Listar TODOS (com vendas ou n�o) os Produtos e seus Valores Venais
SELECT P.Name AS Nome_Produto, S.UnitPrice AS Valor_na_Venda
FROM Production.Product P
LEFT JOIN Sales.SalesorderDetail S
ON P.ProductID = S.ProductID 
ORDER BY Nome_Produto ASC, Valor_na_Venda ASC;

--Invertendo a Orden das Tabelas: Listar TODAS Vendas e Seus Produtos
SELECT P.Name AS Nome_Produto, S.UnitPrice AS Valor_na_Venda
FROm Sales.SalesorderDetail S
LEFT JOIN Production.Product P
ON P.ProductID = S.ProductID
ORDER BY Nome_Produto ASC, Valor_na_Venda ASC;

--RIGHT OUTER JOIN
--Listar TODOS os Produtos (com vendas ou n�o) e seus Valores Vensis
SELECT P.Name AS Nome_Produto, S.UnitPrice AS Valor_na_Venda
FROM Sales.SalesorderDetail S
RIGHT JOIN Production.Product P
ON P.ProductID = S.ProductID
ORDER BY Nome_Produto ASC, Valor_na_Venda ASC;

--Versus

--LEFT OUTER Join
--Listar TODOS os Produtos (com vendas ou n�o) e seus Valores Venais
SELECT P.Name AS Nome_Produto, S.UnitPrice AS Valor_na_Venda
FROM Production.Product P
LEFT JOIN Sales.SalesorderDetail S
ON P.ProductID = S.ProductID
ORDER BY Nome_Produto ASC, Valor_na_Venda ASC;

--LEFT OUTER JOIN 
--Listar TODOS os Produtos e Respectivos Modelo(se tiver)
SELECT P.Name AS Nome_Produto, M.Name AS Modelo
FROM Production.Product P
LEFT JOIN Production.ProductModel M
ON P.ProductModelID = M.ProductModelID
ORDER BY Nome_Produto ASC, Modelo ASC;

--RIGHT OUTER JOIN 
--Listar TODOS os Produtos e Respectivos Modelo(se tiver)
SELECT M.Name AS Modelo, P.Name AS Nome_Produto
FROM Production.Product P
RIGHT JOIN Production.ProductModel M
ON P.ProductModelID = M.ProductModelID
ORDER BY Modelo ASC, Nome_Produto ASC;

--SELF LEFT JOIN
--Listar TODOS Funcionarios e o respectivos Gerente(se tiver)
SELECT E1.Name AS Funcionarios, E2.Name AS Gerente
FROM Employee E1
LEFT JOIN Employee E2
ON E1.ID_Manager = E2.ID
ORDER BY E1.Name;

--FULL OUTER JOIN
--Listar TODOS os Produtos e TODOS os Modelos
SELECT P.Name AS Nome_Produto, M.Name AS Modelo
FROM Production.Product P
FULL JOIN Production.ProductModel M
ON P.ProductModelID = M.ProductModelID
ORDER BY Nome_Produto , Modelo;

--Ordem Inversa no Join(Mesmo resultado)
SELECT P.Name AS Nome_Produto, M.Name AS Modelo
FROM Production.ProductModel M 
FULL JOIN Production.Product P
ON P.ProductModelID = M.ProductModelID
ORDER BY Nome_Produto , Modelo;
