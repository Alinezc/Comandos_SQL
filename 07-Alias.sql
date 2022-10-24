USE AdventureWorks2019
GO

--Alias para colunas
SELECT Name AS Nome_do_Produto,
ProductNumber AS Numero_do_Produto
FROM Production.Product
GO

SELECT Name,Name AS Nome_do_Produto, ProductNumber, ProductNumber AS Nome_do_Produto
FROM Production.Product
GO 

--Outra forma de criar alias no SQL
SELECT Nome_do_Produto = Name,
Nome_do_Produto = ProductNumber
FROM Production.Product
GO

--Alias com Espa�o
SELECT Name AS "Nome do Produto", Name AS [Nome do Produto]
FROM Production.Product
GO

--Alias de Coluna Acidental
SELECT Name ProductNumber
FROM Production.Product
GO

--Alias de Tabela Criado com a Cl�usula AS
SELECT Name, ProductNumber
FROM Production.Product AS P
GO

--Alias de Tabela Criado sem a Cl�usula AS
SELECT Name, ProductNumber
FROM Production.Product P
GO

--Alias de Tabela
SELECT P.Name, P.ProductNumber
 FROM Production.Product P
 GO

 --N�o obrigatoriedade de usar Alias de Tabela nas Colunas
 SELECT Name,ProductNumber
 FROM Production.Product P
 GO

 --Alias de Tabela n�o Defenido
 SELECT P.NAME,P.ProductNumber,C.Name --ERRO C.NAME
 FROM Production.Product P
 GO

 --Alias de Tabela + Alias de coluna
 SELECT P.Name AS Nome_do_Produto,P.ProductNumber AS Numero_do_Produto
 FROM Production.Product P
 GO

 --Ambiguidade de Colunas
 SELECT Name,ProductNumber
 FROM  Production.Product,Production.Location
 GO

 SELECT * FROM Production.Product
 SELECT * FROM Production.Location

 exec sp_help [Production.Product]
 exec sp_help [Production.Location]

 --Alias de Tabelas para Remover Ambiguidade de Nome de Colunas
 SELECT P.Name,ProductNumber,L.Name
 FROM Production.Product P,Production.Location L
 GO

 --OU prefixar colunas com nome das tabelas(SEM ALIAS)
 SELECT Product.Name,ProductNumber,Location.Name
 FROM Production.Product,Production.Location
 GO