USE [Veo3D]
GO
/****** Object:  StoredProcedure [dbo].[Usuario_modificarPass]    Script Date: 15/10/2020 12:29:07 ******/
DROP PROCEDURE [dbo].[Usuario_modificarPass]
GO
/****** Object:  StoredProcedure [dbo].[Usuario_modificar]    Script Date: 15/10/2020 12:29:07 ******/
DROP PROCEDURE [dbo].[Usuario_modificar]
GO
/****** Object:  StoredProcedure [dbo].[Usuario_login]    Script Date: 15/10/2020 12:29:07 ******/
DROP PROCEDURE [dbo].[Usuario_login]
GO
/****** Object:  StoredProcedure [dbo].[Usuario_leer]    Script Date: 15/10/2020 12:29:07 ******/
DROP PROCEDURE [dbo].[Usuario_leer]
GO
/****** Object:  StoredProcedure [dbo].[Usuario_buscar]    Script Date: 15/10/2020 12:29:07 ******/
DROP PROCEDURE [dbo].[Usuario_buscar]
GO
/****** Object:  StoredProcedure [dbo].[Usuario_alta]    Script Date: 15/10/2020 12:29:07 ******/
DROP PROCEDURE [dbo].[Usuario_alta]
GO
/****** Object:  StoredProcedure [dbo].[IdiomaDetalle_leer]    Script Date: 15/10/2020 12:29:07 ******/
DROP PROCEDURE [dbo].[IdiomaDetalle_leer]
GO
/****** Object:  StoredProcedure [dbo].[IdiomaDetalle_alta]    Script Date: 15/10/2020 12:29:07 ******/
DROP PROCEDURE [dbo].[IdiomaDetalle_alta]
GO
/****** Object:  StoredProcedure [dbo].[Idioma_leer]    Script Date: 15/10/2020 12:29:07 ******/
DROP PROCEDURE [dbo].[Idioma_leer]
GO
/****** Object:  StoredProcedure [dbo].[Idioma_alta]    Script Date: 15/10/2020 12:29:07 ******/
DROP PROCEDURE [dbo].[Idioma_alta]
GO
/****** Object:  StoredProcedure [dbo].[Digitoverificador_modificar]    Script Date: 15/10/2020 12:29:07 ******/
DROP PROCEDURE [dbo].[Digitoverificador_modificar]
GO
/****** Object:  StoredProcedure [dbo].[Digitoverificador_leer]    Script Date: 15/10/2020 12:29:07 ******/
DROP PROCEDURE [dbo].[Digitoverificador_leer]
GO
/****** Object:  StoredProcedure [dbo].[Digitoverificador_alta]    Script Date: 15/10/2020 12:29:07 ******/
DROP PROCEDURE [dbo].[Digitoverificador_alta]
GO
/****** Object:  StoredProcedure [dbo].[CopiaDeSeguridad_leer]    Script Date: 15/10/2020 12:29:07 ******/
DROP PROCEDURE [dbo].[CopiaDeSeguridad_leer]
GO
/****** Object:  StoredProcedure [dbo].[CopiaDeSeguridad_alta]    Script Date: 15/10/2020 12:29:07 ******/
DROP PROCEDURE [dbo].[CopiaDeSeguridad_alta]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 15/10/2020 12:29:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario]') AND type in (N'U'))
DROP TABLE [dbo].[Usuario]
GO
/****** Object:  Table [dbo].[IdiomaDetalle]    Script Date: 15/10/2020 12:29:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IdiomaDetalle]') AND type in (N'U'))
DROP TABLE [dbo].[IdiomaDetalle]
GO
/****** Object:  Table [dbo].[Idioma]    Script Date: 15/10/2020 12:29:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Idioma]') AND type in (N'U'))
DROP TABLE [dbo].[Idioma]
GO
/****** Object:  Table [dbo].[Digitoverificador]    Script Date: 15/10/2020 12:29:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Digitoverificador]') AND type in (N'U'))
DROP TABLE [dbo].[Digitoverificador]
GO
/****** Object:  Table [dbo].[CopiaDeSeguridad]    Script Date: 15/10/2020 12:29:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CopiaDeSeguridad]') AND type in (N'U'))
DROP TABLE [dbo].[CopiaDeSeguridad]
GO
USE [master]
GO
/****** Object:  Database [Veo3D]    Script Date: 15/10/2020 12:29:07 ******/
DROP DATABASE [Veo3D]
GO
/****** Object:  Database [Veo3D]    Script Date: 15/10/2020 12:29:07 ******/
CREATE DATABASE [Veo3D]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Veo3D', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Veo3D.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Veo3D_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Veo3D_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Veo3D] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Veo3D].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Veo3D] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Veo3D] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Veo3D] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Veo3D] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Veo3D] SET ARITHABORT OFF 
GO
ALTER DATABASE [Veo3D] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Veo3D] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Veo3D] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Veo3D] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Veo3D] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Veo3D] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Veo3D] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Veo3D] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Veo3D] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Veo3D] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Veo3D] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Veo3D] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Veo3D] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Veo3D] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Veo3D] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Veo3D] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Veo3D] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Veo3D] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Veo3D] SET  MULTI_USER 
GO
ALTER DATABASE [Veo3D] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Veo3D] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Veo3D] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Veo3D] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Veo3D] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Veo3D] SET QUERY_STORE = OFF
GO
USE [Veo3D]
GO
/****** Object:  Table [dbo].[CopiaDeSeguridad]    Script Date: 15/10/2020 12:29:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CopiaDeSeguridad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](200) NOT NULL,
	[fecha] [date] NOT NULL,
 CONSTRAINT [PK_CopiaDeSeguridad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Digitoverificador]    Script Date: 15/10/2020 12:29:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Digitoverificador](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tabla] [varchar](50) NOT NULL,
	[DVV] [varchar](50) NOT NULL,
	[DVH] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Idioma]    Script Date: 15/10/2020 12:29:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Idioma](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[codigo] [varchar](50) NULL,
 CONSTRAINT [PK_Idioma] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdiomaDetalle]    Script Date: 15/10/2020 12:29:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdiomaDetalle](
	[idioma] [int] NOT NULL,
	[clave] [varchar](50) NOT NULL,
	[texto] [varchar](200) NOT NULL,
 CONSTRAINT [PK_IdiomaDetalle] PRIMARY KEY CLUSTERED 
(
	[idioma] ASC,
	[clave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 15/10/2020 12:29:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[usuario] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[correo] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[dni] [int] NULL,
	[DVH] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CopiaDeSeguridad] ON 

INSERT [dbo].[CopiaDeSeguridad] ([id], [nombre], [fecha]) VALUES (1, N'c:\Veo3DBack\Veo3D_DB_15-10-2020-121928.BAK', CAST(N'2020-10-15' AS Date))
SET IDENTITY_INSERT [dbo].[CopiaDeSeguridad] OFF
GO
SET IDENTITY_INSERT [dbo].[Idioma] ON 

INSERT [dbo].[Idioma] ([id], [nombre], [codigo]) VALUES (1, N'Español', N'es')
INSERT [dbo].[Idioma] ([id], [nombre], [codigo]) VALUES (3, N'Ingles', N'en')
SET IDENTITY_INSERT [dbo].[Idioma] OFF
GO
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnAceptar', N'Aceptar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnAgregarDetalleIdioma', N'Generar Claves de Idioma')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnAgregarIdioma', N'Agregar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnBuscar', N'Buscar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnCrearCopia', N'Realizar Copia de seguridad')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnGuardar', N'Guardar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnRestaurar', N'Restaurar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblAdministracion', N'Administración')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblAdministracionMenu', N'Administración')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblCancelar', N'Cancelar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblCerrar', N'Cerrar Sesión')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblCerrarSesion', N'¿Desea cerrar la sesión?')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblCompras', N'Compras')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblContacto', N'Contacto')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblContrasenia', N'Contraseña')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblCopiaSeguridad', N'Copia de Seguridad')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblHome', N'Inicio')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblIdiomas', N'Idiomas')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblIdiomaTitulo', N'Administración de Idiomas')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblImpresiones', N'Impresiones')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblListarBitacora', N'Listar Bitácora')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblLogin', N'Login')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblPermisos', N'Permisos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblProduccion', N'Producción')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblRecordarPass', N'Recordar Contraseña')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblRegistros', N'Registros')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblShop', N'Fabrica de anteojos 3D')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblSistema', N'Sistema')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblTituloTablero', N'VEO3D Admin')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblUsuario', N'Usuario')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblVentas', N'Ventas')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkBitacora', N'Bitacora')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkCerrarSesion', N'Ok')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkDigitoVerificador', N'Digito Verificador')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkEnvios', N'Envíos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkIdioma', N'Idioma')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkImpresoras', N'Impresoras')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkLogErrores', N'Log de Errores')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkMateriales', N'Materiales')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkPanelCompras', N'Panel de compras')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkPanelPedidos', N'Panel de Pedidos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkPedidos', N'Pedidos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkPermisos', N'Permisos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkPresupuesto', N'Panel de presupuesto')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkPrioridad', N'Modificar prioridad')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkPriorizacion', N'Cola de priorización')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkProductos', N'Productos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkRealizar', N'Gestionar Copia')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkRegistrarOrden', N'Registrar orden')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkReporteOrden', N'Reporte de orden')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkReportePresupuesto', N'Reporte de presupuesto')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkReportes', N'Reportes')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkRestaurar', N'Restaurar Copia')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkRol', N'Rol')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkUsuario', N'Usuario')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LtCodigoIdioma', N'Código')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LtFechaDesde', N'Fecha Desde')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LtFechaHasta', N'Fecha Hasta')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LtNombre', N'Nombre')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LtNombreArchivo', N'Nombre de archivo')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'MsgErrorFecha', N'Error no es fecha')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'MsgErrorFormato', N'Error no cumple el formato')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'MsgErrorNumero', N'Error no es número')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'MsgObligatorio', N'Error el campo es obligatorio')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'BtnAceptar', N'Accept')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'BtnAgregarDetalleIdioma', N'
Generate Language Keys')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'BtnAgregarIdioma', N'Add')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'BtnBuscar', N'Search')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'BtnCrearCopia', N'Make Backup')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'BtnGuardar', N'Save')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'BtnRestaurar', N'Restore')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblAdministracion', N'Administration')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblAdministracionMenu', N'Administration')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblCancelar', N'Cancel')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblCerrar', N'Close Session')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblCerrarSesion', N'
Do you want to log out?')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblCompras', N'Shopping')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblContacto', N'Contact')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblContrasenia', N'Password')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblCopiaSeguridad', N'Back UP')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblHome', N'Home')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblIdiomas', N'Languages')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblIdiomaTitulo', N'Language Manager')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblImpresiones', N'Prints')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblListarBitacora', N'Log Search')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblLogin', N'Login')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblPermisos', N'Permit')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblProduccion', N'Production')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblRecordarPass', N'Remember Password')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblRegistros', N'Registers')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblShop', N'3D Glasses Factory')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblSistema', N'System')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblTituloTablero', N'VEO3D Admin')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblUsuario', N'User')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblVentas', N'Sells')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkBitacora', N'Log')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkCerrarSesion', N'Ok')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkDigitoVerificador', N'Check Digit')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkEnvios', N'Shipping')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkIdioma', N'Language')
GO
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkImpresoras', N'Printers')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkLogErrores', N'Error Log')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkMateriales', N'Materials')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkPanelCompras', N'Buy Panel')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkPanelPedidos', N'Order Panel')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkPedidos', N'Order')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkPermisos', N'Permit')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkPresupuesto', N'Budget')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkPrioridad', N'Priority')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkPriorizacion', N'Priority Pool')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkProductos', N'Product')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkRealizar', N'Make Backup')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkRegistrarOrden', N'Register Order')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkReporteOrden', N'Order Reports')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkReportePresupuesto', N'Budget Reports')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkReportes', N'Reports')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkRestaurar', N'Restore')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkRol', N'Rol')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkUsuario', N'User')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LtCodigoIdioma', N'Code')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LtFechaDesde', N'Date From')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LtFechaHasta', N'Date To')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LtNombre', N'Name')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LtNombreArchivo', N'Filename')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'MsgErrorFecha', N'Error is not date')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'MsgErrorFormato', N'
Error does not comply with the format')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'MsgErrorNumero', N'Is not a number')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'MsgObligatorio', N'Required')
GO
INSERT [dbo].[Usuario] ([usuario], [password], [correo], [nombre], [apellido], [dni], [DVH]) VALUES (N'Administrador', N'jU+bL0A+I/WZq/JIy9d6/lREd0A=', N'administrador@veo3D.com', N'Roberto', N'Piombi', 12345678, N'7')
GO
/****** Object:  StoredProcedure [dbo].[CopiaDeSeguridad_alta]    Script Date: 15/10/2020 12:29:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[CopiaDeSeguridad_alta]
@nombre varchar(200), @fecha DateTime
As
Begin
insert into CopiaDeSeguridad values (@nombre, @fecha);
end;
GO
/****** Object:  StoredProcedure [dbo].[CopiaDeSeguridad_leer]    Script Date: 15/10/2020 12:29:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[CopiaDeSeguridad_leer]
As
Begin
select * from CopiaDeSeguridad
end;
GO
/****** Object:  StoredProcedure [dbo].[Digitoverificador_alta]    Script Date: 15/10/2020 12:29:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Digitoverificador_alta]
@tabla varchar(50), @dvv varchar(50), @dvh varchar(50) as
begin
insert into Digitoverificador values (@tabla, @dvv, @dvh);
end;
GO
/****** Object:  StoredProcedure [dbo].[Digitoverificador_leer]    Script Date: 15/10/2020 12:29:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Digitoverificador_leer]
 as
begin
select * from Digitoverificador
end;
GO
/****** Object:  StoredProcedure [dbo].[Digitoverificador_modificar]    Script Date: 15/10/2020 12:29:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Digitoverificador_modificar]
@tabla varchar(50), @dvv varchar(50), @dvh varchar(50) as
begin
update Digitoverificador set dvv = @dvv, DVH = @dvh where tabla = @tabla ;
end;
GO
/****** Object:  StoredProcedure [dbo].[Idioma_alta]    Script Date: 15/10/2020 12:29:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Idioma_alta]
@idioma varchar(50), @codigo varchar(50)
 as
BEGIN


IF (SELECT count(*) FROM idioma WHERE nombre = @idioma) > 0
	BEGIN
	UPDATE idioma SET nombre = @idioma, codigo = @codigo WHERE nombre = @idioma;
	END
ELSE
	BEGIN
	INSERT INTO idioma VALUES (@idioma, @codigo);
	END
END;
GO
/****** Object:  StoredProcedure [dbo].[Idioma_leer]    Script Date: 15/10/2020 12:29:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Idioma_leer]
 as
begin
select * from idioma
end;
GO
/****** Object:  StoredProcedure [dbo].[IdiomaDetalle_alta]    Script Date: 15/10/2020 12:29:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IdiomaDetalle_alta]
@idioma varchar(50), @clave varchar(50), @texto varchar(200)
 as
BEGIN

DECLARE @id int;
SET @id = (SELECT TOP 1 id FROM idioma WHERE nombre = @idioma);

IF (SELECT count(clave) FROM idiomaDetalle WHERE idioma = @id and clave = @clave) > 0
	BEGIN
	UPDATE idiomaDetalle SET texto = @texto WHERE idioma = @id and clave = @clave;
	print 'update';
	END
ELSE
	BEGIN
	INSERT INTO idiomaDetalle VALUES (@id, @clave, @texto);
	print 'insert';
	END
END;
GO
/****** Object:  StoredProcedure [dbo].[IdiomaDetalle_leer]    Script Date: 15/10/2020 12:29:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[IdiomaDetalle_leer]
@idioma varchar(50)
 as
begin
declare @id int
set @id = (select TOP 1 id from idioma where nombre = @idioma);
select * from idiomaDetalle where idioma = @id;
end;
GO
/****** Object:  StoredProcedure [dbo].[Usuario_alta]    Script Date: 15/10/2020 12:29:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Usuario_alta]
@usuario varchar(50),@pass varchar(50),@nombre varchar(50),
@apellido varchar(50),@correo varchar(50),@dni int, @dvh varchar(50) as
begin
insert into Usuario values (@usuario,@pass, @correo, @nombre,@apellido,@dni,@dvh);
end;
GO
/****** Object:  StoredProcedure [dbo].[Usuario_buscar]    Script Date: 15/10/2020 12:29:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Usuario_buscar]
@usuario varchar(50) as
begin
select * from usuario where usuario.usuario = @usuario;
end;
GO
/****** Object:  StoredProcedure [dbo].[Usuario_leer]    Script Date: 15/10/2020 12:29:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Usuario_leer]
 as
begin
select * from usuario
end;
GO
/****** Object:  StoredProcedure [dbo].[Usuario_login]    Script Date: 15/10/2020 12:29:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Usuario_login]
@usuario varchar(50), @pass varchar(50) as
begin
select * from usuario where usuario.usuario = @usuario and usuario.password = @pass;
end;
GO
/****** Object:  StoredProcedure [dbo].[Usuario_modificar]    Script Date: 15/10/2020 12:29:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Usuario_modificar]
@usuario varchar(50),@pass varchar(50),@nombre varchar(50),
@apellido varchar(50),@correo varchar(50),@dni int, @dvh varchar(50) as
begin
update Usuario set 
password = @pass, correo = @correo, nombre = @nombre, apellido = @apellido, dni= @dni, dvh = @dvh 
where usuario = @usuario
end;
GO
/****** Object:  StoredProcedure [dbo].[Usuario_modificarPass]    Script Date: 15/10/2020 12:29:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Usuario_modificarPass]
@usuario varchar(50),@pass varchar(50) as
begin
update Usuario set 
password = @pass 
where usuario = @usuario
end;
GO
USE [master]
GO
ALTER DATABASE [Veo3D] SET  READ_WRITE 
GO
