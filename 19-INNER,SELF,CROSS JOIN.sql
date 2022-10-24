USE Adventureworks2019
GO

--INNER JOIN (ANST SQL-92)
--Listar Categorias e Subcategorias
SELECT Production.ProductCategory.Name AS Nome_da_Categoria,
Production. ProductSubCategory.Name AS Nome_da_SubCategoria
FROM Production.ProductCategory
INNER JOIN Production.ProductSubCategory
ON Production.ProductCategory.ProductCategoryID = Production.ProductsubCategory.ProductCategoryID
ORDER BY Nome_da_Categoria ASC, Nome_da_SubCategoria ASC;

--TNNER JOIN com mais de 2 tabelas (ANST SQL-S2)
--Listar Produtos, Categorias e Subcategorias
SELECT Production.Product.Name AS Nome_do_Produto,
Production.ProductSubCategory.Name AS Nome_da_SubCategoria,
Production.ProductCategory.Name AS Nome_da_Categoria
FROM Production.Product
INNER JOIN Production.ProductSubCategory
ON Production.Product.ProductSubCategoryID = Production.ProductSubCategory.ProductSubcategoryID
INNER JOIN Production.ProductCategory
ON Production.ProductCategory.ProductCategoryID = Production.ProductSubCategory.ProductCategoryID
ORDER BY Nome_do_Produto ASC;

--Listar Produtos, Categorias e Subcategorias
--Join ANSI SQL-92
--Usando Alias
SELECT P.Name AS Nome_do_Produto,
       S.Name Nome_da_SubCategoria,
       C.Name AS Nome_da_Categoria
FROM Production.Product P
INNER JOIN Production.ProductSubcategory S
ON P.ProductSubcategoryID = S.ProductSubcategoryID
INNER JOIN Production.ProductCategory  C
ON C.ProductCategoryID = C.ProductCategoryID
ORDER BY Nome_do_Produto

--Self INNER JOIN
CREATE TABLE Employee
(
  ID int primary key,
  Name varchar(50),
  ID_Manager int
  );

  INSERT INTO Employee(ID,Name,ID_Manager) Values(01,'Juliana',NULL);
  INSERT INTO Employee(ID,Name,ID_Manager) Values(02,'Gustavo',01);
  INSERT INTO Employee(ID,Name,ID_Manager) Values(03,'Giovana',02);
  INSERT INTO Employee(ID,Name,ID_Manager) Values(04,'Davi',02);
  INSERT INTO Employee(ID,Name,ID_Manager) Values(05,'Pedro',02);
  INSERT INTO Employee(ID,Name,ID_Manager) Values(06,'Guilherme',01);

  SELECT * FROM Employee;

--Listar Funcionarios e o respectivos Gerente
SELECT E1.Name AS Funcionario,E2.Name AS Gerente
FROM Employee E1
INNER JOIN Employee E2
ON E1.ID_Manager=E2.ID
ORDER BY E1.Name

--Produto Cartesiano (ANI SQL-92)
SELECT Production.ProductCategory.Name AS Nome_da_Categoria,
       Production.ProductSubcategory.Name AS Nome_da_SubCategoria
FROM Production.ProductCategory
CROSS JOIN Production.ProductSubcategory
--WHERE Production.ProductCategory.Name = 'Clothing'
Order BY Nome_da_Categoria ASC,Nome_da_SubCategoria ASC;