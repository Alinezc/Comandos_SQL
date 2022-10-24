--Servidor e Instancia
select @@SERVERNAME,@@SERVICENAME

use [master]
Go

select *
from sysdatabases
go

--Comentario de uma linha

/* 
Comentario
blocos de
linhas
*/

--Delimitador de comandos (Terminador de linhas)
create table tabela1(coluna1 int);
create table tabela2(coluna2 int);

--separador batch

--Apenas 1 bloco batch de execuçaõ
create table tabela1 (coluna1 int);
create view view1 as select * from tabela1;

--Dois blocos batch de execução
CREATE TABLE tabela(coluna1 int);
GO
CREATE VIEW view1 as SELECT * FROM tabela1;
GO


