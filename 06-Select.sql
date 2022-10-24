USE AdventureWorks2019
GO

--Selecionar todas as linhas das colunas Name e ProductNumber da tabela Product
 SELECT Name, ProductNumber --precisa de , para verificar colunas
 FROM Production.Product
GO

--Selecionar todas as linhas de todas as colunas da tabela Product
 SELECT *
 FROM Production.Product
GO 

--Adicionar coluna e repetir o comando
 ALTER TABLE Production.Product--esquema e nome do objeto
 ADD SpecialEdition bit NULL
GO

--Objeto inexistente
 SELECT Name, ProductNumber
--erro não existe essa tabela na no banco master   FROM master.Production.Product
FROM Production.Product
GO

 SELECT Name, ProductNumber
 FROM AdventureWorks2019.Production.Product
GO

--Coluna inexistente
 SELECT ProductName, ProductNumber
 FROM AdventureWorks2019.Production.Product
GO
