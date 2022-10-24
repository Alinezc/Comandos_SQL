--Alteração no Banco de Dados

USE [master]
GO

ALTER DATABASE [AdventureWorks2019]
ADD FILE ( NAME = N'AdventureWorks2019_Data_02',
           FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AdventureWorks2019_Data_02.ndf' ,
           SIZE = 8192KB , FILEGROWTH = 65536KB
)
TO FILEGROUP [PRIMARY]
GO

--Alteração de Objetos no Banco de Dados
--Selecionar o banco

USE [BDTESTE]
GO

--Adicionar Chave Primária
ALTER TABLE ALUNO
ADD CONSTRAINT PK_ALUNO PRIMARY KEY CLUSTERED
(
COD_ALUNO
);

-- CHAVE PRIMARIA TIPO CLUSTERED ORDENA A TABELA INTEIRA EM CIMA DESSA CHAVE

ALTER TABLE CURSO
ADD CONSTRAINT PK_CURSO PRIMARY KEY CLUSTERED 
(
  COD_CURSO
);

--Verificar estrutura da tabela (conhecido como DESC / DESCRIBE)
exec sp_help 'CURSO';
exec sp_help 'ALUNO';

--Adicionar Coluna COD_CURSO FK na tabela ALUNO Como NÃO NULA (Tabela não populada ainda)
ALTER TABLE ALUNO ADD COD_CURSO_FK int NOT NULL;

--Alterar Tamanho da Coluna NOM CURSO
ALTER TABLE CURSO ALTER COLUMN NOM_CURSO varchar(200) NOT NULL;

--Diminuir Tamanho
ALTER TABLE CURSO ALTER COLUMN NOM_CURSO varchar(50) NOT NULL;

--Inserir Dados
INSERT INTO CURSO VALUES (1, 'Linguagem SQL');
INSERT INTO CURSO VALUES (2, 'T-SQL');

--Conferir se dados foram inseridos
SELECT * FROM CURSO;

--Tamanho dos valores da coluna NOM CURSO
SELECT COD_CURSO, LEN(NOM_CURSO) FROM CURSO;

--Diminuir Tamanho com Tabela Populada Sem Violar Tamanho dos Dados Existentes
ALTER TABLE CURSO ALTER COLUMN NOM_CURSO varchar(13) NOT NULL;

exec sp_help 'CURSO';

--Diminuir Tamanho com Tabela Populada Violando Tamanho dos Dados Existentes
 ALTER TABLE CURSO ALTER COLUMN NOM_CURSO varchar(12) NOT NULL;

--Adicionar campo NOT NULL com Tabela Populada

--Opção 1
ALTER TABLE CURSO ADD VLR_CURSO money NOT NULL; --Error
ALTER TABLE CURSO ADD VLR_CURSO money NULL;
ALTER TABLE CURSO ALTER COLUMN VLR_CURSO money NOT NULL; --Error
UPDATE CURSO SET VLR_CURSO = 10000;
SELECT * FROM CURSO; 
ALTER TABLE CURSO ALTER COLUMN VLR_CURSO money NOT NULL;
exec sp_help 'CURSO';

--Opção 2
ALTER TABLE CURSO ADD IND_STATUS char(1) NOT NULL DEFAULT 'S';
SELECT * FROM CURSO;
exec sp_help 'CURSO';

--Adícíonar Chave Estrangeira COD CURSO_FK na Tabela ALUNO(TIPO DE RELACIONAMENTO)
ALTER TABLE ALUNO
ADD CONSTRAINT FK_ALUNO_CURSO FOREIGN KEY
(
 COD_CURSO_FK
) REFERENCES CURSO
(
 COD_CURSO
)

 ON UPDATE NO ACTION
 ON DELETE NO ACTION;

exec sp_help 'ALUNO';
GO
exec sp_help 'CURSO';
GO






