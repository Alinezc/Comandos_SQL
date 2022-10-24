-- Selecionar o banco

USE [BDTESTE]
GO

CREATE TABLE ALUNO
(  
   COD_ALUNO int Not Null,
   NOM_ALUNO varchar(100) NOT NULL
 );

 --COM SCHEMA
 CREATE TABLE [dbo].[CURSO]
 ( 
   [COD_CURSO][int] NOT NULL, 
   [NOM_CURSO][varchar](100) NOT NULL
  )

GO

--Com Filegroup
CREATE TABLE [dbo].[MATRICULA]
(
 [COD_ALUNO][int] NOT NULL, 
 [COD_CURSO][int] NOT NULL, 
 [DAT_MATRICULA][datetime] NOT NULL
 ) ON [PRIMARY]
 GO