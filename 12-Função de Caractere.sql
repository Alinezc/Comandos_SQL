USE AdventureWorks2019
GO

--FUNÇÕES DE CARACTERES
--LOWER com String
SELECT LOWER ('Aplicações com Linguagem SQL') AS Nome_Disciplina
GO

--LOWER com Coluna
 SELECT Name AS Nome_Original,LOWER (Name) AS Nome_Minúsculo
FROM Production.Product
ORDER BY Name
GO

--UPPER
SELECT UPPER ('Aplicações com Linguagem SQL') AS Nome_Disciplina
GO

SELECT Name AS Nome_Original, UPPER (Name) AS Nome_Maiúsculo
FROM Production.Product
ORDER BY Name
GO

--SUBSTRING
SELECT SUBSTRING ('Aplicações com Linguagem SQL',16,13) AS Parte_da_String
GO

SELECT Name AS Nome_Original, SUBSTRING (Name,5,15) AS Parte_do_Nome
 FROM Production.Product
ORDER BY Name
GO

--LEFT
SELECT LEFT  ('Aplicação com Linguagem SQL',10) AS Parte_Esquerda
GO

SELECT Name AS Nome_Original, LEFT (Name,5) AS Cinco_Primeiros_Caracteres
 FROM Production.Product
ORDER BY Name
GO

--RIGHT
SELECT RIGHT  ('Aplicação com Linguagem SQL',3) AS Parte_Esquerda
GO

SELECT Name AS Nome_Original, RIGHT (Name,5) AS Cinco_Ultimos_Caracteres
 FROM Production.Product
ORDER BY Name
GO

--LEN 
SELECT LEN ('Aplicação com Linguagem SQL') AS Qtde_Caracteres
GO

SELECT LEN ('Aplicação com Linguagem SQL  ') AS Qtde_Caracteres
GO

SELECT Name AS Nome_Original, LEN (Name) AS Total_Caracteres_Nome
 FROM Production.Product
ORDER BY Name
GO

--DATALENGIH
SELECT DATALENGTH ('Aplicações com Linguagem SQL') AS Qtde_Caracteres_DATALENGTH,
 LEN ('Aplicações com Linguagem SQL') AS Qtde_Caracteres_LEN
GO

SELECT DATALENGTH ('Aplicações com Linguagem SQL ') AS Qtde_Com_DATALENGTH,
   LEN ('Aplicações com Linguagem SQL ') AS Qtde_Com_LEN
GO

--CHARINDEX
SELECT CHARINDEX ('SQL', 'Aplicações com Linguagem SQL') AS Inicio_String_SQL,
     CHARINDEX ('T-SQL', 'Aplicações com Linguagem SQL') AS Inicio_String_T_SQL
GO
--Especificando uma Posição de Inicio para a Busca
SELECT CHARINDEX ('SQL', 'Aplicações com Linguagem SQL',27) AS A_Partir_da_27
Go

--REPLACE
SELECT REPLACE ('Aplicacões com Linguagem ABC', 'ABC', 'SQL') AS String_Trocada
GO

--Retirar Espaço em Branco dos Nomes
SELECT Name AS Nome_Original, REPLACE (Name, ' ', '') AS Nome_Sem_Espaço
FROM Production.Product
ORDER BY Name
GO

--REPLICATE
SELECT REPLICATE ('SQL ', 5) AS String_Replicada
GO

--Exibir Zeros à Esquerda de Uma Coluna
SELECT Name AS Nome, ProductNumber,
REPLICATE ('0',5) + '-' + ProductNumber AS New_ProductNumber
FROM Production.Product
ORDER BY Name
GO

--REVERSE
SELECT REVERSE ('Linguagem SQL') AS String_Invertida
GO

--LTRIM
SELECT LTRIM ('  Aplicações com Linguagem SQL') AS Espaço_a_Esquerda_Removidos
GO

--RTRIM
SELECT RTRIM ('Aplicações com Linguagem SQL  ') AS Espaço_a_DIREITA_Removidos
GO

--TRIM
SELECT TRIM ('Aplicações com Linguagem SQL  ') AS Removidos
GO

--TRIM COM FROM
SELECT TRIM ('#!' FROM '##  Aplicações com Linguagem SQL   !##' ) AS TrimComFrom
GO

--CONCAT
SELECT CONCAT ('Aplicações',' com ', 'Linguagem SQL') AS StringConcatenada
GO

--CONCAT x Operador de Concatenação (*Nulos)
SELECT FirstName + ' ' + MiddleName + ' ' + LastName AS NomeCompleto_Com_Operador,
  CONCAT (FirstName , ' ' , MiddleName ,' ', LastName) AS NomeCompleto_Com_CONCAT
  FROM Person.Person
 GO

 --Uso de Funções de Caractere em Conjunto
 SELECT FirstName,MiddleName ,LastName,
  REPLACE(UPPER(CONCAT(FirstName,' ',MiddleName,' ',LastName)),' ',' ') AS NomeMaiúsculoCom
FROM Person.Person
GO

--Fazendo TRIM com LTRIM + RTRIM
SELECT LTRIM(RTRIM('      Linguagem SQL             ')) AS Removidos
GO



