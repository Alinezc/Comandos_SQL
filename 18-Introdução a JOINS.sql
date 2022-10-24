USE Adventureworks2019
GO

--JOIN com Operador de Comparação (Inner Join Ansi SQL-89)
--Sem Alias
--Listar Categorias e Subcategorias
SELECT Production.ProductCategory.Name AS Nome_da_Categoria,
Production.ProductSubCategory.Name AS Nome_da_Subcategoria
FROM Production.ProductCategory,Production.ProductSubcategory
WHERE Production.ProductCategory.ProductCategoryID = Production.ProductSubcategory.ProductCategoryID
Order BY Nome_da_Categoria ASC,Nome_da_Subcategoria ASC;
  
--Listar Produtos, Categorias e Subcategorias
--Joins com mais de 2 tabelas (ANSI SQL-89)
--Referência FQN às tabelas
--Ordem das tabelas no join / ordem dos joins
SELECT Production.Product.Name AS Nome_do_Produto,
Production.ProductSubCategory.Name AS Nome_da_Subcategoria,
Production.ProductCategory.Name AS Nome_da_Categoria
FROM Production.Product,Production.ProductCategory,Production.ProductSubcategory
WHERE Production.Product.ProductSubcategoryID = Production.ProductSubcategory.ProductSubcategoryID
AND Production.ProductCategory.ProductCategoryID = Production.ProductSubcategory.ProductCategoryID
ORDER BY Nome_do_Produto ASC;

--Listar Produtos, Categorias e Subcategorias
--JOIN ANSI SQL-89
--Usando Alias
SELECT  P.Name AS Nome_do_Produto,
        S.Name AS Nome_do_SubCategoria,
        C.Name AS Nome_do_Categoria
FROM Production.Product P,Production.ProductCategory C,Production.ProductSubcategory S
WHERE P.ProductSubcategoryID = S.ProductSubcategoryID
AND C.ProductCategoryID = S.ProductCategoryID
ORDER BY Nome_do_Produto ASC;

--Produto Cartesiano (ANSI SQ-89)
SELECT Production.ProductCategory.Name AS Nome_da_Categoria,
Production.ProductSubcategory.Name AS Nome_da_SubCategoria
FROM Production.ProductCategory,Production.ProductSubcategory
ORDER BY Nome_da_Categoria ASC, Nome_da_SubCategoria ASC;

