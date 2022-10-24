--Criar Novo Banco 
CREATE DATABASE BDTESTE_DROP
GO

--Selecionar o banco
USE BDTESTE_DROP
GO

CREATE TABLE ALUNO
( COD_ALUNO int NOT NULL,
  NOM_ALUNO varchar(166) NOT NULL
);

CREATE TABLE CURSO
(
  COD_CURSO int NOT NULL,
  NOM_CURSO varchar (100) NOT NULL
)
GO

--Adicionar Chave Prim�ria
ALTER TABLE ALUNO
ADD CONSTRAINT PK_ALUNO PRIMARY KEY CLUSTERED
(
  COD_ALUNO
)
GO

ALTER TABLE CURSO
ADD CONSTRAINT PK_CURSO PRIMARY KEY CLUSTERED
(
  COD_CURSO
)
GO

--Adicionar Coluna COD_CURSO_FK na tabela ALUNO
ALTER TABLE ALUNO ADD COD_CURSO_FK int NULL
GO

--Alterar Coluna COD_CURSO_FK Para N�o Nula
ALTER TABLE ALUNO ALTER COLUMN COD_CURSO_FK int NOT NULL

--Adicionar Chave Estrangeira COD_CURSO_FK na Tabela ALUNO
ALTER TABLE ALUNO
ADD CONSTRAINT FK_ALUNO_CURSO FOREIGN KEY
(
   COD_CURSO_FK
) REFERENCES CURSO
(
    COD_CURSO
)
ON UPDATE NO ACTION
ON DELETE NO ACTION
GO

CREATE SYNONYM TB_ALUNO_NEW FOR ALUNO
GO

--Remover Sin�nimo
 DROP SYNONYM TB_ALUNO_NEW;

 --REMOVER COLUNA(N�O � UM OBJETO  INDEPENDENTE)
 ALTER TABLE ALUNO DROP COLUMN NOM_ALUNO;

 exec sp_help 'ALUNO';

 --REMOVER TABELA (COM FK)
 DROP TABLE ALUNO;
 DROP TABLE CURSO;

 --REMOVER BANCO DE DADOS
 USE MASTER;
 DROP DATABASE BDTESTE_DROP;

 --REMOVER BANCO DE DADOS QUE ESTA SENDO USADO(QUE ESTA EM ABERTO)
 USE BDTESTE;
 SELECT * FROM CURSO;

 USE master;
 DROP DATABASE BDTESTE;

 --LISTAR PROCESSOS BLOQUEADOS
 SELECT*
 FROM sysprocesses
 WHERE blocked <>0

 SELECT *
 FROM sys.dm_exec_requests
 WHERE blocking_session_id <> 0


