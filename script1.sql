USE [master]
GO
/****** Object:  Database [PHE_APPS_SAS]    Script Date: 13/06/2020 20:54:09 ******/
CREATE DATABASE [PHE_APPS_SAS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PHE_APPS_SAS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2019\MSSQL\DATA\PHE_APPS_SAS.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PHE_APPS_SAS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2019\MSSQL\DATA\PHE_APPS_SAS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PHE_APPS_SAS] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PHE_APPS_SAS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PHE_APPS_SAS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PHE_APPS_SAS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PHE_APPS_SAS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PHE_APPS_SAS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PHE_APPS_SAS] SET ARITHABORT OFF 
GO
ALTER DATABASE [PHE_APPS_SAS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PHE_APPS_SAS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PHE_APPS_SAS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PHE_APPS_SAS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PHE_APPS_SAS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PHE_APPS_SAS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PHE_APPS_SAS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PHE_APPS_SAS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PHE_APPS_SAS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PHE_APPS_SAS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PHE_APPS_SAS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PHE_APPS_SAS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PHE_APPS_SAS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PHE_APPS_SAS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PHE_APPS_SAS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PHE_APPS_SAS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PHE_APPS_SAS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PHE_APPS_SAS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PHE_APPS_SAS] SET  MULTI_USER 
GO
ALTER DATABASE [PHE_APPS_SAS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PHE_APPS_SAS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PHE_APPS_SAS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PHE_APPS_SAS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PHE_APPS_SAS] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PHE_APPS_SAS]
GO
/****** Object:  Table [dbo].[Carrera]    Script Date: 13/06/2020 20:54:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Carrera](
	[IdCarrera] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NULL,
 CONSTRAINT [PK_Carrera] PRIMARY KEY CLUSTERED 
(
	[IdCarrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 13/06/2020 20:54:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Curso]    Script Date: 13/06/2020 20:54:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Curso](
	[IdCurso] [int] IDENTITY(1,1) NOT NULL,
	[IdModalidad] [int] NOT NULL,
	[IdTipoCurso] [int] NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[IdCarrera] [int] NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[Duracion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Curso] PRIMARY KEY CLUSTERED 
(
	[IdCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CursoPersona]    Script Date: 13/06/2020 20:54:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CursoPersona](
	[IdCursoPersona] [int] IDENTITY(1,1) NOT NULL,
	[IdCurso] [int] NOT NULL,
	[IdPersona] [int] NOT NULL,
	[DictaCurso] [bit] NOT NULL CONSTRAINT [DF_CursoPersona_DictaCurso]  DEFAULT ((0)),
 CONSTRAINT [PK_CursoPersona] PRIMARY KEY CLUSTERED 
(
	[IdCursoPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Modalidad]    Script Date: 13/06/2020 20:54:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Modalidad](
	[IdModalidad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Modalidad] PRIMARY KEY CLUSTERED 
(
	[IdModalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 13/06/2020 20:54:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Persona](
	[IdPersona] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[Apellido] [varchar](255) NOT NULL,
	[FechaNacimiento] [datetime2](7) NOT NULL,
	[LugarNacimiento] [varchar](255) NOT NULL,
	[LugarResidencia] [varchar](255) NOT NULL,
	[Genero] [varchar](15) NOT NULL,
	[Hobbies] [varchar](max) NOT NULL,
	[Eliminado] [bit] NOT NULL CONSTRAINT [DF_Persona_Eliminado]  DEFAULT ((0)),
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[IdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoCurso]    Script Date: 13/06/2020 20:54:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoCurso](
	[IdTipoCurso] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
 CONSTRAINT [PK_TipoCurso] PRIMARY KEY CLUSTERED 
(
	[IdTipoCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Curso]  WITH CHECK ADD  CONSTRAINT [FK_Curso_Carrera] FOREIGN KEY([IdCarrera])
REFERENCES [dbo].[Carrera] ([IdCarrera])
GO
ALTER TABLE [dbo].[Curso] CHECK CONSTRAINT [FK_Curso_Carrera]
GO
ALTER TABLE [dbo].[Curso]  WITH CHECK ADD  CONSTRAINT [FK_Curso_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[Curso] CHECK CONSTRAINT [FK_Curso_Categoria]
GO
ALTER TABLE [dbo].[Curso]  WITH CHECK ADD  CONSTRAINT [FK_Curso_Modalidad] FOREIGN KEY([IdModalidad])
REFERENCES [dbo].[Modalidad] ([IdModalidad])
GO
ALTER TABLE [dbo].[Curso] CHECK CONSTRAINT [FK_Curso_Modalidad]
GO
ALTER TABLE [dbo].[Curso]  WITH CHECK ADD  CONSTRAINT [FK_Curso_TipoCurso] FOREIGN KEY([IdTipoCurso])
REFERENCES [dbo].[TipoCurso] ([IdTipoCurso])
GO
ALTER TABLE [dbo].[Curso] CHECK CONSTRAINT [FK_Curso_TipoCurso]
GO
ALTER TABLE [dbo].[CursoPersona]  WITH CHECK ADD  CONSTRAINT [FK_CursoPersona_Curso] FOREIGN KEY([IdCurso])
REFERENCES [dbo].[Curso] ([IdCurso])
GO
ALTER TABLE [dbo].[CursoPersona] CHECK CONSTRAINT [FK_CursoPersona_Curso]
GO
ALTER TABLE [dbo].[CursoPersona]  WITH CHECK ADD  CONSTRAINT [FK_CursoPersona_Persona] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Persona] ([IdPersona])
GO
ALTER TABLE [dbo].[CursoPersona] CHECK CONSTRAINT [FK_CursoPersona_Persona]
GO
/****** Object:  StoredProcedure [dbo].[rangoEdades]    Script Date: 13/06/2020 20:54:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[rangoEdades]
AS
Select SUM (case When DATEDIFF (year, FechaNacimiento, GETDATE()) >= 0 and DATEDIFF (year, FechaNacimiento, GETDATE()) <= 10
				then 1 else 0 end) as '0 y 10 años'
	 , SUM (case When DATEDIFF (year, FechaNacimiento, GETDATE()) <= 20 and DATEDIFF (year, FechaNacimiento, GETDATE()) <= 10
				then 1 else 0 end) as '10 y 20 años'
	, SUM (case When DATEDIFF (year, FechaNacimiento, GETDATE()) >= 30 and DATEDIFF (year, FechaNacimiento, GETDATE()) <= 50
				then 1 else 0 end) as '30 y 50 años'
	, SUM (case When DATEDIFF (year, FechaNacimiento, GETDATE()) > 50
				then 1 else 0 end) as 'Mayores 50 años'
from Persona
GO;
GO
/****** Object:  StoredProcedure [dbo].[sp_clasificacionGenero]    Script Date: 13/06/2020 20:54:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_clasificacionGenero]
AS
Select SUM (case When Genero = 'Femenino'
				then 1 else 0 end) as 'Femenino'
	 , SUM (case When Genero = 'Masculino'
				then 1 else 0 end) as 'Masculino'
	 , SUM (case When Genero = 'Otro'
				then 1 else 0 end) as 'Otro'
from Persona
GO;
GO
/****** Object:  StoredProcedure [dbo].[sp_rangoEdades]    Script Date: 13/06/2020 20:54:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_rangoEdades]
AS
Select SUM (case When DATEDIFF (year, FechaNacimiento, GETDATE()) >= 0 and DATEDIFF (year, FechaNacimiento, GETDATE()) <= 10
				then 1 else 0 end) as '0 y 10 años'
	 , SUM (case When DATEDIFF (year, FechaNacimiento, GETDATE()) <= 20 and DATEDIFF (year, FechaNacimiento, GETDATE()) <= 10
				then 1 else 0 end) as '10 y 20 años'
	, SUM (case When DATEDIFF (year, FechaNacimiento, GETDATE()) >= 30 and DATEDIFF (year, FechaNacimiento, GETDATE()) <= 50
				then 1 else 0 end) as '30 y 50 años'
	, SUM (case When DATEDIFF (year, FechaNacimiento, GETDATE()) > 50
				then 1 else 0 end) as 'Mayores 50 años'
from Persona
GO;
GO
USE [master]
GO
ALTER DATABASE [PHE_APPS_SAS] SET  READ_WRITE 
GO
