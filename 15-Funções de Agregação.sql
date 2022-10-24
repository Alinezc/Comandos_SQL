USE AdventureWorks2019
GO

--Fun��es MIN e MAX com Colunas Num�ricas
 SELECT MIN(UnitPrice) AS Pre�o_M�nimo, MAX(UnitPrice) AS Pre�o_M�ximo
 FROM Sales.SalesOrderDetail;

--Fun��es MIN e MAX com Colunas do Tipo Date
 SELECT MIN(BirthDate) AS Nascido_Mais_Antigamente, MAX(BirthDate) AS Nascido_Mais_Recentemente
 FROM HumanResources. Employee;

--Fun��es MIN e MAX com Colunas do Tipo String
 SELECT MIN(Name) AS Primeiro_Nome_de_Produto, MAX(Name) AS Ultimo_Nome_de_Produto
 FROM Production.Product;

--MIN e MAX em Strings => Resultado Semelhante Usando TOP e ORDER BV
 SELECT TOP(1) Name
 FROM Production.Product
 ORDER BY Name ASC;

 SELECT MIN(Name)
 FROM Production.Product;

--Fun��o COUNT (*) x Fun��o COUNT ( express�o )
 SELECT COUNT(*) AS Total_de_Produtos,
 CouNT(COlor) AS Total_de_Produtos_Com_Cor
 FROM Production.Product;

--Fun��es SUM e AVG
 SELECT SUM(LineTotal) AS Valor_Total_de_Vendas,
 AVG(LineTotal) AS Valor_M�dio_de_Vendas
 FROM Sales.SalesOrderDetail;

--Calculando a M�dia sem AVG
 SELECT SUM(LineTotal) / COUNT (LineTotal) AS Valor_M�dio_de_Vendas_Sem_AVG,
 AVG(LineTotal) AS Valor_M�dio_de_Vendas_Com_AVG
 FROM Sales.SalesOrderDetail;

--Exemplo com Coluna sem Fun��o de Agrega��o e sem Group By (Erro)
 SELECT AVG(UnitPrice) AS M�dia_Pre�o, MIN(OrderQty) AS Quantidade_M�nima,
 MAX(UnitPriceDiscount) AS DEsconto_M�ximo, ProductID
 FROM Sales.SalesOrderDetail;

--Fun��o de Agrega��o em Conjunto com Outras Fun��es
 SELECT MIN(YEAR(orderdate)) AS Ano_da_Compra_Mais_Antiga,
 MaX(YEAR(orderdate)) AS Ano_da_Compra_Mais_Recente
 FROM Sales.SalesOrderHeader;

 --DISTINCT com Fun��o de Agrega��o
 SELECT COUNT(DISTINCT CustomerID) AS Qtde_Vendas_Para_Clientes_Distintos,
 COUNT(CustomerID) AS Qtde_Vendas_Para_Clientes
 FROM Sales.SalesorderHeader;

 --Valores NULOS (<> de branco) e Fun��es de Agrega��o
 SELECT AVG(Weight) AS "Peso_M�dio_dos_Produtos(Usendo AVE - OK)",
 SUM(Weight) / COUNT(Weight) AS [Peso_M�dio_dos_Produtos(Sem AVG - ON)],
 Sum(Weight) / COUNT(*) AS [Peso_M�dio_dos_Produtos (Sem AVG - N�O OK))]
 FROM Production.Product;

--TratandO Valores Nulos
 SELECT Weight AS "Sem Peso", COALESCE (Weight,0) AS "Peso Zerado"
  FROM Production.Product;

  --Verificar quantos null tem na tabela
  SELECT COUNT (*)
  FROM Production.Product
  WHERE Weight IS NULL