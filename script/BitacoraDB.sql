USE [Bitacora]
GO
/****** Object:  StoredProcedure [dbo].[Bitacora_leer]    Script Date: 15/10/2020 12:27:18 ******/
DROP PROCEDURE [dbo].[Bitacora_leer]
GO
/****** Object:  StoredProcedure [dbo].[Bitacora_alta]    Script Date: 15/10/2020 12:27:18 ******/
DROP PROCEDURE [dbo].[Bitacora_alta]
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 15/10/2020 12:27:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bitacora]') AND type in (N'U'))
DROP TABLE [dbo].[Bitacora]
GO
USE [master]
GO
/****** Object:  Database [Bitacora]    Script Date: 15/10/2020 12:27:18 ******/
DROP DATABASE [Bitacora]
GO
/****** Object:  Database [Bitacora]    Script Date: 15/10/2020 12:27:18 ******/
CREATE DATABASE [Bitacora]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bitacora', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Bitacora.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bitacora_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Bitacora_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Bitacora] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bitacora].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bitacora] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bitacora] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bitacora] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bitacora] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bitacora] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bitacora] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bitacora] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bitacora] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bitacora] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bitacora] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bitacora] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bitacora] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bitacora] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bitacora] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bitacora] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bitacora] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bitacora] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bitacora] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bitacora] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bitacora] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bitacora] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bitacora] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bitacora] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Bitacora] SET  MULTI_USER 
GO
ALTER DATABASE [Bitacora] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bitacora] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bitacora] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bitacora] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bitacora] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Bitacora] SET QUERY_STORE = OFF
GO
USE [Bitacora]
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 15/10/2020 12:27:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacora](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](50) NULL,
	[fecha] [datetime] NULL,
	[tabla] [varchar](50) NOT NULL,
	[accion] [varchar](50) NOT NULL,
	[dato] [varchar](50) NOT NULL,
	[DVH] [varchar](50) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bitacora] ON 

INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (32, N'Administrador', CAST(N'2020-09-24T22:56:48.400' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (33, N'Administrador', CAST(N'2020-09-24T22:57:49.947' AS DateTime), N'', N'Cierra Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (34, N'Administrador', CAST(N'2020-09-24T22:57:57.387' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (35, N'Administrador', CAST(N'2020-09-24T22:59:17.133' AS DateTime), N'', N'Cierra Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (37, N'Administrador', CAST(N'2020-10-10T20:38:18.860' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (38, N'Administrador', CAST(N'2020-10-10T21:30:47.520' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (39, N'Administrador', CAST(N'2020-10-10T21:32:16.297' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (44, N'Administrador', CAST(N'2020-10-10T21:38:40.213' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (45, N'Administrador', CAST(N'2020-10-10T21:39:41.200' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (46, N'Administrador', CAST(N'2020-10-10T21:39:53.550' AS DateTime), N'', N'Cierra Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (54, N'Administrador', CAST(N'2020-10-11T00:14:15.960' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (62, N'Administrador', CAST(N'2020-10-15T03:05:47.043' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (63, N'Administrador', CAST(N'2020-10-15T03:05:57.517' AS DateTime), N'Idioma', N'Insertar', N'Ingles', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (64, N'Administrador', CAST(N'2020-10-15T03:23:48.390' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (66, N'Administrador', CAST(N'2020-10-15T03:35:54.697' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (67, N'Administrador', CAST(N'2020-10-15T03:37:48.010' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (68, N'Administrador', CAST(N'2020-10-15T03:38:24.870' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (69, N'Administrador', CAST(N'2020-10-15T03:39:32.140' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (70, N'Administrador', CAST(N'2020-10-15T03:39:44.423' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles BtnAceptar ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (71, N'Administrador', CAST(N'2020-10-15T03:39:44.430' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles BtnAgregarDetalleIdioma ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (72, N'Administrador', CAST(N'2020-10-15T03:39:44.430' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles BtnAgregarIdioma ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (73, N'Administrador', CAST(N'2020-10-15T03:39:44.433' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles BtnGuardar ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (74, N'Administrador', CAST(N'2020-10-15T03:39:44.433' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LblAdministracion ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (75, N'Administrador', CAST(N'2020-10-15T03:39:44.433' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LblAdministracionMenu ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (76, N'Administrador', CAST(N'2020-10-15T03:39:44.433' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LblCancelar ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (77, N'Administrador', CAST(N'2020-10-15T03:39:44.437' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LblCerrar ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (78, N'Administrador', CAST(N'2020-10-15T03:39:44.437' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LblCerrarSesion ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (79, N'Administrador', CAST(N'2020-10-15T03:39:44.437' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LblCompras ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (80, N'Administrador', CAST(N'2020-10-15T03:39:44.437' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LblContacto ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (81, N'Administrador', CAST(N'2020-10-15T03:39:44.437' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LblContrasenia ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (82, N'Administrador', CAST(N'2020-10-15T03:39:44.440' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LblCopiaSeguridad ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (83, N'Administrador', CAST(N'2020-10-15T03:39:44.440' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LblHome ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (84, N'Administrador', CAST(N'2020-10-15T03:39:44.440' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LblIdiomas ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (85, N'Administrador', CAST(N'2020-10-15T03:39:44.440' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LblIdiomaTitulo ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (86, N'Administrador', CAST(N'2020-10-15T03:39:44.440' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LblImpresiones ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (87, N'Administrador', CAST(N'2020-10-15T03:39:44.440' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LblLogin ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (88, N'Administrador', CAST(N'2020-10-15T03:39:44.440' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LblPermisos ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (89, N'Administrador', CAST(N'2020-10-15T03:39:44.443' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LblProduccion ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (90, N'Administrador', CAST(N'2020-10-15T03:39:44.443' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LblRecordarPass ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (91, N'Administrador', CAST(N'2020-10-15T03:39:44.443' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LblRegistros ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (92, N'Administrador', CAST(N'2020-10-15T03:39:44.443' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LblShop ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (93, N'Administrador', CAST(N'2020-10-15T03:39:44.443' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LblSistema ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (94, N'Administrador', CAST(N'2020-10-15T03:39:44.447' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LblTituloTablero ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (95, N'Administrador', CAST(N'2020-10-15T03:39:44.447' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LblUsuario ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (96, N'Administrador', CAST(N'2020-10-15T03:39:44.447' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LblVentas ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (97, N'Administrador', CAST(N'2020-10-15T03:39:44.447' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LinkBitacora ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (98, N'Administrador', CAST(N'2020-10-15T03:39:44.447' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LinkCerrarSesion ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (99, N'Administrador', CAST(N'2020-10-15T03:39:44.450' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LinkDigitoVerificador ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (100, N'Administrador', CAST(N'2020-10-15T03:39:44.450' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LinkEnvios ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (101, N'Administrador', CAST(N'2020-10-15T03:39:44.450' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LinkIdioma ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (102, N'Administrador', CAST(N'2020-10-15T03:39:44.450' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LinkImpresoras ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (103, N'Administrador', CAST(N'2020-10-15T03:39:44.450' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LinkLogErrores ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (104, N'Administrador', CAST(N'2020-10-15T03:39:44.450' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LinkMateriales ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (105, N'Administrador', CAST(N'2020-10-15T03:39:44.450' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LinkPanelCompras ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (106, N'Administrador', CAST(N'2020-10-15T03:39:44.453' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LinkPanelPedidos ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (107, N'Administrador', CAST(N'2020-10-15T03:39:44.453' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LinkPedidos ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (108, N'Administrador', CAST(N'2020-10-15T03:39:44.453' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LinkPermisos ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (109, N'Administrador', CAST(N'2020-10-15T03:39:44.453' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LinkPresupuesto ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (110, N'Administrador', CAST(N'2020-10-15T03:39:44.453' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LinkPrioridad ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (111, N'Administrador', CAST(N'2020-10-15T03:39:44.453' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LinkPriorizacion ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (112, N'Administrador', CAST(N'2020-10-15T03:39:44.457' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LinkProductos ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (113, N'Administrador', CAST(N'2020-10-15T03:39:44.457' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LinkRealizar ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (114, N'Administrador', CAST(N'2020-10-15T03:39:44.457' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LinkRegistrarOrden ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (115, N'Administrador', CAST(N'2020-10-15T03:39:44.457' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LinkReporteOrden ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (116, N'Administrador', CAST(N'2020-10-15T03:39:44.457' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LinkReportePresupuesto ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (117, N'Administrador', CAST(N'2020-10-15T03:39:44.457' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LinkReportes ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (118, N'Administrador', CAST(N'2020-10-15T03:39:44.460' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LinkRestaurar ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (119, N'Administrador', CAST(N'2020-10-15T03:39:44.460' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LinkRol ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (120, N'Administrador', CAST(N'2020-10-15T03:39:44.460' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LinkUsuario ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (121, N'Administrador', CAST(N'2020-10-15T03:39:44.460' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LtCodigoIdioma ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (122, N'Administrador', CAST(N'2020-10-15T03:39:44.460' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles LtNombre ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (123, N'Administrador', CAST(N'2020-10-15T03:39:44.463' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles MsgErrorFecha ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (124, N'Administrador', CAST(N'2020-10-15T03:39:44.463' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles MsgErrorFormato ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (125, N'Administrador', CAST(N'2020-10-15T03:39:44.463' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles MsgErrorNumero ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (126, N'Administrador', CAST(N'2020-10-15T03:39:44.463' AS DateTime), N'IdiomaDetalle', N'Insertar', N'Ingles MsgObligatorio ', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (127, N'Administrador', CAST(N'2020-10-15T04:03:10.317' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (128, N'Administrador', CAST(N'2020-10-15T04:09:06.450' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (129, N'Administrador', CAST(N'2020-10-15T04:11:21.093' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (130, N'Administrador', CAST(N'2020-10-15T04:13:46.350' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (131, N'Administrador', CAST(N'2020-10-15T04:50:54.530' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (132, N'Administrador', CAST(N'2020-10-15T04:54:41.390' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (133, N'Administrador', CAST(N'2020-10-15T05:01:15.953' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (134, N'Administrador', CAST(N'2020-10-15T05:04:07.367' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (135, N'Administrador', CAST(N'2020-10-15T05:06:56.003' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (136, N'Administrador', CAST(N'2020-10-15T05:41:56.377' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (138, N'Administrador', CAST(N'2020-10-15T12:19:17.113' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (139, N'Administrador', CAST(N'2020-10-15T12:19:29.203' AS DateTime), N'Backup', N'Backup', N'c:\Veo3DBack\Veo3D_DB_15-10-2020-121928.BAK', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (40, N'Administrador', CAST(N'2020-10-10T21:32:53.237' AS DateTime), N'', N'Cierra Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (51, N'Administrador', CAST(N'2020-10-10T22:34:52.330' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (26, N'Administrador', CAST(N'2020-09-24T22:21:45.980' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (27, N'Administrador', CAST(N'2020-09-24T22:22:07.220' AS DateTime), N'', N'Cierra Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (28, N'Administrador', CAST(N'2020-09-24T22:22:14.813' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (29, N'Administrador', CAST(N'2020-09-24T22:22:22.077' AS DateTime), N'', N'Cierra Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (30, N'Administrador', CAST(N'2020-09-24T22:22:32.407' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (31, N'Administrador', CAST(N'2020-09-24T22:27:37.897' AS DateTime), N'', N'Cierra Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (36, N'Administrador', CAST(N'2020-09-25T11:38:15.850' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (41, N'Administrador', CAST(N'2020-10-10T21:36:13.890' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (42, N'Administrador', CAST(N'2020-10-10T21:36:33.153' AS DateTime), N'', N'Cierra Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (43, N'Administrador', CAST(N'2020-10-10T21:37:23.957' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
GO
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (52, N'Administrador', CAST(N'2020-10-10T22:38:03.367' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (53, N'Administrador', CAST(N'2020-10-10T22:39:20.667' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (47, N'Administrador', CAST(N'2020-10-10T22:14:26.697' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (48, N'Administrador', CAST(N'2020-10-10T22:14:37.920' AS DateTime), N'', N'Cierra Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (49, N'Administrador', CAST(N'2020-10-10T22:18:04.210' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (55, N'Administrador', CAST(N'2020-10-11T00:18:03.997' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (56, N'Administrador', CAST(N'2020-10-12T04:42:28.437' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (57, N'Administrador', CAST(N'2020-10-15T01:44:14.110' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (58, N'Administrador', CAST(N'2020-10-15T01:44:34.517' AS DateTime), N'Idioma', N'Insertar', N'Ingles', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (59, N'Administrador', CAST(N'2020-10-15T01:45:40.443' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (60, N'Administrador', CAST(N'2020-10-15T01:48:33.803' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (61, N'Administrador', CAST(N'2020-10-15T01:50:18.140' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (65, N'Administrador', CAST(N'2020-10-15T03:34:50.270' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (137, N'Administrador', CAST(N'2020-10-15T12:14:21.867' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
INSERT [dbo].[Bitacora] ([id], [usuario], [fecha], [tabla], [accion], [dato], [DVH]) VALUES (50, N'Administrador', CAST(N'2020-10-10T22:20:40.300' AS DateTime), N'', N'Inicia Sesion', N'', N'dvh')
SET IDENTITY_INSERT [dbo].[Bitacora] OFF
GO
/****** Object:  StoredProcedure [dbo].[Bitacora_alta]    Script Date: 15/10/2020 12:27:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Bitacora_alta]
@usuario varchar(50),@fecha datetime, @tabla varchar(50),
@dato varchar(50), @accion varchar(50), @dvh varchar(50) as
begin
insert into Bitacora values (@usuario,@fecha, @tabla, @accion, @dato, @dvh);
end
GO
/****** Object:  StoredProcedure [dbo].[Bitacora_leer]    Script Date: 15/10/2020 12:27:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Bitacora_leer]
 as
begin
select * from Bitacora order by id;
end
GO
USE [master]
GO
ALTER DATABASE [Bitacora] SET  READ_WRITE 
GO
