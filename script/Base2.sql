USE [master]
GO
/****** Object:  Database [Veo3D]    Script Date: 19/12/2020 04:43:58 ******/
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
ALTER DATABASE [Veo3D] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Veo3D] SET QUERY_STORE = OFF
GO
USE [Veo3D]
GO
/****** Object:  User [IIS APPPOOL\veo3d]    Script Date: 19/12/2020 04:43:58 ******/
CREATE USER [IIS APPPOOL\veo3d] FOR LOGIN [IIS APPPOOL\veo3d] WITH DEFAULT_SCHEMA=[db_owner]
GO
ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\veo3d]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [IIS APPPOOL\veo3d]
GO
/****** Object:  Table [dbo].[CopiaDeSeguridad]    Script Date: 19/12/2020 04:43:58 ******/
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
/****** Object:  Table [dbo].[DetalleCompras]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleCompras](
	[id] [int] NOT NULL,
	[material] [int] NOT NULL,
	[fecha] [date] NULL,
	[estado] [varchar](50) NULL,
	[cantidad] [int] NULL,
	[ordenCompra] [int] NULL,
 CONSTRAINT [PK_Compras] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Digitoverificador]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Digitoverificador](
	[tabla] [varchar](50) NOT NULL,
	[DVV] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Digitoverificador] PRIMARY KEY CLUSTERED 
(
	[tabla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DigitoVerificadorDetalle]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DigitoVerificadorDetalle](
	[tabla] [varchar](50) NOT NULL,
	[idtabla] [varchar](50) NOT NULL,
	[DVH] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DigitoVerificadorDetalle] PRIMARY KEY CLUSTERED 
(
	[tabla] ASC,
	[idtabla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Idioma]    Script Date: 19/12/2020 04:43:58 ******/
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
/****** Object:  Table [dbo].[IdiomaDetalle]    Script Date: 19/12/2020 04:43:58 ******/
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
/****** Object:  Table [dbo].[Impresion]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Impresion](
	[id] [int] NOT NULL,
	[venta] [int] NOT NULL,
	[impresora] [int] NULL,
	[prioridad] [int] NULL,
	[estado] [varchar](50) NULL,
	[fechainicio] [datetime] NOT NULL,
	[fechafin] [datetime] NULL,
	[material] [int] NULL,
 CONSTRAINT [PK_Impresion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Impresora]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Impresora](
	[id] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[modelo] [varchar](50) NOT NULL,
	[marca] [varchar](50) NOT NULL,
	[estado] [int] NOT NULL,
 CONSTRAINT [PK_Impresora] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[id] [int] NOT NULL,
	[marca] [varchar](50) NOT NULL,
	[color] [varchar](50) NOT NULL,
	[tipo] [varchar](50) NOT NULL,
	[peso] [int] NOT NULL,
	[metros] [int] NOT NULL,
	[estado] [int] NOT NULL,
	[stock] [int] NULL,
	[costom] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenCompra]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenCompra](
	[id] [int] NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[fecha] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permiso]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permiso](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[padre] [int] NOT NULL,
	[estado] [int] NULL,
 CONSTRAINT [PK_Perfil] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[id] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[archivo] [varchar](200) NOT NULL,
	[cantidadMaterial] [int] NULL,
	[tiempo] [int] NULL,
	[imagen] [varchar](100) NOT NULL,
	[descripcion] [varchar](400) NOT NULL,
	[tipo] [varchar](50) NOT NULL,
	[calificacion] [int] NOT NULL,
	[estado] [int] NOT NULL,
	[precio] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 19/12/2020 04:43:58 ******/
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
	[dni] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuariopermiso]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuariopermiso](
	[usuario] [varchar](50) NOT NULL,
	[permiso] [int] NOT NULL,
 CONSTRAINT [PK_Usuariopermiso] PRIMARY KEY CLUSTERED 
(
	[usuario] ASC,
	[permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[id] [int] NOT NULL,
	[producto] [int] NOT NULL,
	[anchomontura] [varchar](50) NULL,
	[puente] [varchar](50) NULL,
	[anchocristales] [varchar](50) NULL,
	[alturacristales] [varchar](50) NULL,
	[longitudpatillas] [varchar](50) NULL,
	[calle] [varchar](50) NOT NULL,
	[puerta] [varchar](50) NOT NULL,
	[depto] [varchar](50) NOT NULL,
	[localidad] [varchar](50) NOT NULL,
	[provincia] [varchar](50) NOT NULL,
	[estado] [varchar](50) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[archivo] [varchar](50) NULL,
	[codigoPostal] [varchar](50) NULL,
	[color] [varchar](50) NULL,
	[codigoEnvio] [varchar](50) NULL,
 CONSTRAINT [PK_Compra] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CopiaDeSeguridad] ON 

INSERT [dbo].[CopiaDeSeguridad] ([id], [nombre], [fecha]) VALUES (1, N'c:\Veo3DBack\Veo3D_DB_15-10-2020-095834.BAK', CAST(N'2020-10-15' AS Date))
INSERT [dbo].[CopiaDeSeguridad] ([id], [nombre], [fecha]) VALUES (2, N'c:\Veo3DBack\Veo3D_DB_15-10-2020-104739.BAK', CAST(N'2020-10-15' AS Date))
INSERT [dbo].[CopiaDeSeguridad] ([id], [nombre], [fecha]) VALUES (1002, N'c:\Veo3DBack\Veo3D_DB_23-11-2020-051725.BAK', CAST(N'2020-11-23' AS Date))
INSERT [dbo].[CopiaDeSeguridad] ([id], [nombre], [fecha]) VALUES (1003, N'c:\Veo3DBack\Veo3D_DB_09-12-2020-044820.BAK', CAST(N'2020-12-09' AS Date))
INSERT [dbo].[CopiaDeSeguridad] ([id], [nombre], [fecha]) VALUES (1004, N'c:\Veo3DBack\Veo3D_DB_16-12-2020-040840.BAK', CAST(N'2020-12-16' AS Date))
INSERT [dbo].[CopiaDeSeguridad] ([id], [nombre], [fecha]) VALUES (1005, N'c:\Veo3DBack\Veo3D_DB_18-12-2020-113143.BAK', CAST(N'2020-12-18' AS Date))
INSERT [dbo].[CopiaDeSeguridad] ([id], [nombre], [fecha]) VALUES (1006, N'c:\Veo3DBack\Veo3D_DB_19-12-2020-043142.BAK', CAST(N'2020-12-19' AS Date))
SET IDENTITY_INSERT [dbo].[CopiaDeSeguridad] OFF
GO
INSERT [dbo].[DetalleCompras] ([id], [material], [fecha], [estado], [cantidad], [ordenCompra]) VALUES (1, 1, CAST(N'2020-12-19' AS Date), N'Nuevo', 100, NULL)
GO
INSERT [dbo].[Digitoverificador] ([tabla], [DVV]) VALUES (N'Impresora', N'0e5b97d1a48d6baf2ebcbc8fc5f35502dfc776ee')
INSERT [dbo].[Digitoverificador] ([tabla], [DVV]) VALUES (N'Producto', N'0a67065838b0b25ffd0a468ba46fef3d0eaa8ddb')
INSERT [dbo].[Digitoverificador] ([tabla], [DVV]) VALUES (N'Usuario', N'e895f06c1fc11f9d6d34b6e067c9b6395495ef7b')
INSERT [dbo].[Digitoverificador] ([tabla], [DVV]) VALUES (N'Venta', N'2fbbd7a2394231d504b1dce4bade82b56b55354f')
GO
INSERT [dbo].[DigitoVerificadorDetalle] ([tabla], [idtabla], [DVH]) VALUES (N'Impresora', N'1', N'3e095aca66a9492acf81ac3dd7ef137b9e5dbb17')
INSERT [dbo].[DigitoVerificadorDetalle] ([tabla], [idtabla], [DVH]) VALUES (N'Impresora', N'2', N'2eaa523e77792ce4d242e7cc1cab8bd87452eb71')
INSERT [dbo].[DigitoVerificadorDetalle] ([tabla], [idtabla], [DVH]) VALUES (N'Impresora', N'3', N'd836ace60854d14240ad1c51deb375adaac60096')
INSERT [dbo].[DigitoVerificadorDetalle] ([tabla], [idtabla], [DVH]) VALUES (N'Producto', N'1', N'db660ae7788172acf53bef7d5fcb6657b0245877')
INSERT [dbo].[DigitoVerificadorDetalle] ([tabla], [idtabla], [DVH]) VALUES (N'Producto', N'10', N'af12754f2113fad37e1cbbc86fc2fd9c46bda58b')
INSERT [dbo].[DigitoVerificadorDetalle] ([tabla], [idtabla], [DVH]) VALUES (N'Producto', N'11', N'19549d1312d48876b344d9f1b1a19b526211b523')
INSERT [dbo].[DigitoVerificadorDetalle] ([tabla], [idtabla], [DVH]) VALUES (N'Producto', N'12', N'361a5d1737133e034cb4e1013e606c48aaed0425')
INSERT [dbo].[DigitoVerificadorDetalle] ([tabla], [idtabla], [DVH]) VALUES (N'Producto', N'13', N'989adfac44bece185ae966eaa28f5ef698e69dc7')
INSERT [dbo].[DigitoVerificadorDetalle] ([tabla], [idtabla], [DVH]) VALUES (N'Producto', N'14', N'6a582fb5458b843c985bc0418b706b53899ceff7')
INSERT [dbo].[DigitoVerificadorDetalle] ([tabla], [idtabla], [DVH]) VALUES (N'Producto', N'15', N'21aeb3e689c9bdc5f153257dfda77abbccd75cd4')
INSERT [dbo].[DigitoVerificadorDetalle] ([tabla], [idtabla], [DVH]) VALUES (N'Producto', N'16', N'fa0f5ac614a01741a485c4c27741f3f0800d03d8')
INSERT [dbo].[DigitoVerificadorDetalle] ([tabla], [idtabla], [DVH]) VALUES (N'Producto', N'17', N'6edc9f15fd6575534d4c58258c31a38105ce39a8')
INSERT [dbo].[DigitoVerificadorDetalle] ([tabla], [idtabla], [DVH]) VALUES (N'Producto', N'2', N'2bca1aecd5f61a2dd921ea7d97465ea97bfb38a0')
INSERT [dbo].[DigitoVerificadorDetalle] ([tabla], [idtabla], [DVH]) VALUES (N'Producto', N'3', N'2d13384a228433c5ac78083ea43228c3c0c5f364')
INSERT [dbo].[DigitoVerificadorDetalle] ([tabla], [idtabla], [DVH]) VALUES (N'Producto', N'4', N'ef51154081b1f8eb7a739995ef76cb1275f3b0f5')
INSERT [dbo].[DigitoVerificadorDetalle] ([tabla], [idtabla], [DVH]) VALUES (N'Producto', N'5', N'204cb262951763117885376d7bce49a84bc9d8f2')
INSERT [dbo].[DigitoVerificadorDetalle] ([tabla], [idtabla], [DVH]) VALUES (N'Producto', N'6', N'8e6c975ddb82f6119b4cab05324e44f4b1238e4a')
INSERT [dbo].[DigitoVerificadorDetalle] ([tabla], [idtabla], [DVH]) VALUES (N'Producto', N'7', N'fbc0130cde4e6d970ea4e46656ae735c2d64a05c')
INSERT [dbo].[DigitoVerificadorDetalle] ([tabla], [idtabla], [DVH]) VALUES (N'Producto', N'8', N'c1849d21a96ea38db5f899bc442ed4d4cfe4d9b0')
INSERT [dbo].[DigitoVerificadorDetalle] ([tabla], [idtabla], [DVH]) VALUES (N'Producto', N'9', N'50633fc9d045d6a305868a5c00be4447669fb566')
INSERT [dbo].[DigitoVerificadorDetalle] ([tabla], [idtabla], [DVH]) VALUES (N'Usuario', N'Administrador', N'52cf29be46580492ed1914dae39f6e932302faee')
INSERT [dbo].[DigitoVerificadorDetalle] ([tabla], [idtabla], [DVH]) VALUES (N'Usuario', N'cuarto', N'936a520c9f1bf0b99a772b8d334f853d323df54c')
INSERT [dbo].[DigitoVerificadorDetalle] ([tabla], [idtabla], [DVH]) VALUES (N'Usuario', N'juan', N'66d6307f0541cba1071e107d287744ce0dc43abc')
INSERT [dbo].[DigitoVerificadorDetalle] ([tabla], [idtabla], [DVH]) VALUES (N'Usuario', N'primero', N'574a25af6b22effe53374a61634c49ccb9bcfda3')
INSERT [dbo].[DigitoVerificadorDetalle] ([tabla], [idtabla], [DVH]) VALUES (N'Usuario', N'quinto', N'de48aacc583c4eeadb2590d772e143656a1cb9c4')
INSERT [dbo].[DigitoVerificadorDetalle] ([tabla], [idtabla], [DVH]) VALUES (N'Usuario', N'segundo', N'848b02d803ad845b9757459c15cd89a430bb4573')
INSERT [dbo].[DigitoVerificadorDetalle] ([tabla], [idtabla], [DVH]) VALUES (N'Usuario', N'tercero', N'5895ba2a09f4e1eb05692eb637d11085776092dd')
INSERT [dbo].[DigitoVerificadorDetalle] ([tabla], [idtabla], [DVH]) VALUES (N'Venta', N'1', N'affbf1b04eb3b31c9964bfeacac09faa977b9168')
INSERT [dbo].[DigitoVerificadorDetalle] ([tabla], [idtabla], [DVH]) VALUES (N'Venta', N'2', N'164ebe42402d7ad887ef1be356e0bc55dd07d3e2')
INSERT [dbo].[DigitoVerificadorDetalle] ([tabla], [idtabla], [DVH]) VALUES (N'Venta', N'3', N'b33b493dd37884fce5724690badee07286d8ab0c')
INSERT [dbo].[DigitoVerificadorDetalle] ([tabla], [idtabla], [DVH]) VALUES (N'Venta', N'4', N'f14aad2d321b9f388a529d6fc1be3aea2a8980f3')
INSERT [dbo].[DigitoVerificadorDetalle] ([tabla], [idtabla], [DVH]) VALUES (N'Venta', N'5', N'52153932ca97d06a4b82d18ee0206ad418f422ac')
GO
SET IDENTITY_INSERT [dbo].[Idioma] ON 

INSERT [dbo].[Idioma] ([id], [nombre], [codigo]) VALUES (1, N'Español', N'es')
INSERT [dbo].[Idioma] ([id], [nombre], [codigo]) VALUES (3, N'Ingles', N'en')
INSERT [dbo].[Idioma] ([id], [nombre], [codigo]) VALUES (4, N'Chino', N'ch')
INSERT [dbo].[Idioma] ([id], [nombre], [codigo]) VALUES (5, N'Japones', N'jp')
SET IDENTITY_INSERT [dbo].[Idioma] OFF
GO
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnAceptar', N'Aceptar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnActualizarArchivo', N'Actualizar Archivo')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnAgregar', N'Agregar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnAgregarDetalleIdioma', N'Generar Claves')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnAgregarIdioma', N'Agregar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnAtras', N'Atras')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnBaja', N'Baja')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnBajarPrioridad', N'Bajar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnBuscar', N'Buscar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnCalcular', N'Calcular Costo')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnCambiarMaterial', N'Cambiar Material')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnCancelar', N'Cancelar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnComprar', N'Comprar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnCrearCopia', N'Realizar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnEnviarDomicilio', N'Enviar a Domicilio')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnEnviarImprimir', N'Enviar a Imprimir')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnFactura', N'Descargar Factura')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnGenerarDigito', N'Generar Digito')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnGenerarEtiquetas', N'Generar Etiquetas')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnGuardar', N'Guardar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnImprimir', N'Imprimir')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnMercadopago', N'Pagar con Mercadopago')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnModificar', N'Modificar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnNuevo', N'Nuevo')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnPDF', N'PDF')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnRestaurar', N'Restaurar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnSiguiente', N'Siguiente')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnSubirPrioridad', N'Subir')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnTerminado', N'Finalizar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnVerificarDigito', N'Verificar Digito')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnVolver', N'Volver')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'BtnXLS', N'XLS')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'IID', N'Id')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'IMarca', N'Marca')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'IModelo', N'Modelo')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'INombre', N'Nombre')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblAdmImpresion', N'Administración de Impresión')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblAdminDigitoVerificador', N'Administración Digito Verificador')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblAdminImpresora', N'Administración de Impresoras')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblAdministracion', N'Administración')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblAdministracionMenu', N'Administración')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblAdminMaterial', N'Administración de Materiales')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblAdminPermisos', N'Administrar Permisos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblAdminProducto', N'Administración de Productos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblAlturaCristales', N'Altura de los cristales')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblAnchoCristales', N'Ancho de los cristales')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblAnchoMontura', N'Ancho de la montura')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblApellido', N'Apellido')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblArchivo', N'Nombre de Archivo')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblCalle', N'Calle')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblCambiasPass', N'Cambiar Contraseña')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblCancelar', N'Cancelar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblCerrar', N'Cerrar Sesión')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblCerrarSesion', N'¿Desea cerrar la sesión?')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblCodigoEnvio', N'Código Envio')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblCodigoPostal', N'Código Postal')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblColor', N'Color')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblCompras', N'Compras')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblContacto', N'Contacto')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblContrasenia', N'Contraseña')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblContraseniaRepetir', N'Repetir Contraseña')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblCopiaSeguridad', N'Copia de Seguridad')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblCorreo', N'Correo')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblDepto', N'Depto')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblDireccion', N'Dirección')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblDni', N'Dni')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblFinalizadoExitosamente', N'Compra realizada con éxito!')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblHistorialPedidos', N'Historial de Pedidos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblHome', N'Inicio')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblIdiomas', N'Idiomas')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblIdiomaTitulo', N'Administración de Idiomas')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblImpresiones', N'Impresiones')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblListadoEnvios', N'Envios a Domicilio')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblListadoPrioridades', N'Orden de Impresión')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblListadoVentas', N'Ventas')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblListarBitacora', N'Listar Bitácora')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblLocalidad', N'Localidad')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblLogin', N'Login')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblLongitudPatillas', N'Longitud de las patillas')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblMaterial', N'Material')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblModificarUsuario', N'Modificar Usuario')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblNoLogueado', N'Debe Loguearse para continuar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblNoLogueadoCliente', N'Debe Loguearse con permiso de Cliente')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblPadre', N'Permiso Padre')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblPanelPedidos', N'Panel de Pedidos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblPermisos', N'Permisos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblPermisosDefault', N'Permiso por defecto')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblPersonalizacion', N'Personalizar Marco')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblProduccion', N'Producción')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblProvincia', N'Provincia')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblPuente', N'Puente')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblPuerta', N'Puerta')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblRecordarPass', N'Recordar Contraseña')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblRegistrar', N'Registrar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblRegistros', N'Registros')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblRegistroUsuario', N'Registrar Usuario')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblResumen', N'Resumen')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblShop', N'Fabrica de anteojos 3D')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblSistema', N'Sistema')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblTabla', N'Tabla')
GO
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblTituloTablero', N'VEO3D Admin')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblUsuario', N'Usuario')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblUsuariosAdmin', N'Administración de Usuarios')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LblVentas', N'Ventas')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkAnteojosDeportivos', N'Anteojos Deportivos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkAnteojosReceta', N'Anteojos de Receta')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkAnteojosRetro', N'Anteojos Retro')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkAnteojosSol', N'Anteojos de Sol')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkBitacora', N'Bitacora')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkCambiarPass', N'Cambiar Contraseña')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkCerrarSesion', N'Ok')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkDigitoVerificador', N'Digito Verificador')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkEnvios', N'Envíos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkIdioma', N'Idioma')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkImpresoras', N'Impresoras')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkLogErrores', N'Log de Errores')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkMateriales', N'Materiales')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkOrdenPrioridad', N'Orden de Impresión')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkPanelCompras', N'Reporte de compras')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkPanelPedidos', N'Historial de Pedidos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkPedidos', N'Ventas')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkPermisos', N'Permisos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkPrecios', N'Precios')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkPresupuesto', N'Impresiones')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'LinkPrioridad', N'Orden de Impresión')
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
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'MColor', N'Color')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'MCostoMetros', N'Costo por Metro')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'MID', N'Id')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'MMarca', N'Marca')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'MMetros', N'Metros')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'MPeso', N'Peso')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'MsgError', N'Se produjo un error.')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'MsgErrorFecha', N'Error no es fecha')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'MsgErrorFormato', N'Error no cumple el formato')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'MsgErrorNumero', N'Error no es número')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'MsgExito', N'Operación Exitosa!')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'MsgObligatorio', N'Error el campo es obligatorio')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'MStock', N'Stock')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'MTipo', N'Tipo')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'PArchivo', N'Archivo')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'PCalificacion', N'Calificación')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'PCantidadMaterial', N'Cantidad de Material')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'PDescripcion', N'Descripción')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'PID', N'Id')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'PImagen', N'Imagen')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'PNombre', N'Nombre')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'PPrecio', N'Precio')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'PTiempoImpresion', N'Tiempo de Impresión')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'PTipo', N'Tipo')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (1, N'TxtPermiso', N'Permiso')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'BtnAceptar', N'Accept')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'BtnAgregarDetalleIdioma', N'Generate Keys')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'BtnAgregarIdioma', N'Add')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'BtnBaja', N'Delete')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'BtnBuscar', N'Search')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'BtnCancelar', N'Cancel')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'BtnCrearCopia', N'Make Backup')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'BtnGuardar', N'Save')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'BtnModificar', N'Modify')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'BtnNuevo', N'New')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'BtnRestaurar', N'Restore')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'IID', N'Id')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'IMarca', N'Brand')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'IModelo', N'Model')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'INombre', N'Name')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblAdminImpresora', N'Printer Manager')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblAdministracion', N'Administration')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblAdministracionMenu', N'Administration')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblAdminMaterial', N'Material Manager')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblAdminProducto', N'Product Manager')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblAnchoMontura', N'
Frame Width')
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
GO
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblPersonalizacion', N'Customize Glasses')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblProduccion', N'Production')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblRecordarPass', N'Remember Password')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblRegistros', N'Registers')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblShop', N'3D Glasses Factory')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblSistema', N'System')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblTituloTablero', N'VEO3D Admin')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblUsuario', N'User')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LblVentas', N'Sells')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkAnteojosDeportivos', N'
Sports Glasses')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkAnteojosReceta', N'Prescription Glasses')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkAnteojosRetro', N'
Retro Glasses')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkAnteojosSol', N'Sunglasses')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkBitacora', N'Log')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkCerrarSesion', N'Ok')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkDigitoVerificador', N'Check Digit')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkEnvios', N'Shipping')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkIdioma', N'Language')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkImpresoras', N'Printers')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkLogErrores', N'Error Log')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkMateriales', N'Materials')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkPanelCompras', N'Buy Panel')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkPanelPedidos', N'Order Panel')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkPedidos', N'Order')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkPermisos', N'Permit')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'LinkPrecios', N'Prices')
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
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'PArchivo', N'File')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'PCalificacion', N'Calification')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'PCantidadMaterial', N'Amount of Material')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'PDescripcion', N'Description')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'PID', N'Id')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'PImagen', N'Image')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'PNombre', N'Name')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'PTiempoImpresion', N'Impresion Time')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (3, N'PTipo', N'Type')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'BtnAceptar', N'Aceptal')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'BtnAgregar', N'Aglegal')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'BtnAgregarDetalleIdioma', N'Genelal clave')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'BtnAgregarIdioma', N'Agregal')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'BtnAtras', N'Atlas')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'BtnBaja', N'Baja')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'BtnBuscar', N'Buscal')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'BtnCancelar', N'Cancelal')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'BtnComprar', N'Complal')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'BtnCrearCopia', N'Lealizal Copia de segulidad')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'BtnGenerarDigito', N'Genelal Digito')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'BtnGuardar', N'Guardal')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'BtnMercadopago', N'Pagal con Melcadopago')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'BtnModificar', N'Modifical')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'BtnNuevo', N'Nuevo')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'BtnRestaurar', N'Restaural')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'BtnSiguiente', N'Siguiente')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'BtnVerificarDigito', N'Verificar Digito')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'BtnVolver', N'Volver')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'IID', N'Id')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'IMarca', N'Marca')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'IModelo', N'Modelo')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'INombre', N'Nombre')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblAdminDigitoVerificador', N'Administración Digito Verificador')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblAdminImpresora', N'Administración de Impresoras')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblAdministracion', N'Administración')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblAdministracionMenu', N'Administración')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblAdminMaterial', N'Administración de Materiales')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblAdminPermisos', N'Administrar Permisos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblAdminProducto', N'Administración de Productos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblAlturaCristales', N'Altura de los cristales')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblAnchoCristales', N'Ancho de los cristales')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblAnchoMontura', N'Ancho de la montura')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblApellido', N'Apellido')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblCalle', N'Calle')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblCancelar', N'Cancelar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblCerrar', N'Cerrar Sesión')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblCerrarSesion', N'¿Desea cerrar la sesión?')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblCompras', N'Compras')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblContacto', N'Contacto')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblContrasenia', N'Contraseña')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblContraseniaRepetir', N'Repetir Contraseña')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblCopiaSeguridad', N'Copia de Seguridad')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblCorreo', N'Correo')
GO
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblDepto', N'Depto')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblDireccion', N'Dirección')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblDni', N'Dni')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblFinalizadoExitosamente', N'Compra realizada con éxito!')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblHome', N'Inicio')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblIdiomas', N'Idiomas')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblIdiomaTitulo', N'Administración de Idiomas')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblImpresiones', N'Impresiones')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblListarBitacora', N'Listar Bitácora')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblLocalidad', N'Localidad')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblLogin', N'Login')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblLongitudPatillas', N'Longitud de las patillas')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblNoLogueado', N'Debe Loguearse para continuar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblPadre', N'Permiso Padre')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblPanelPedidos', N'Panel de Compras')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblPermisos', N'Permisos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblPersonalizacion', N'Personalizar Marco')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblProduccion', N'Producción')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblProvincia', N'Provincia')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblPuente', N'Puente')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblPuerta', N'Puerta')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblRecordarPass', N'Recordar Contraseña')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblRegistrar', N'Registrar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblRegistros', N'Registros')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblRegistroUsuario', N'Registrar Usuario')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblResumen', N'Resumen')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblShop', N'Fabrica de anteojos 3D')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblSistema', N'Sistema')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblTabla', N'Tabla')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblTituloTablero', N'VEO3D Admin')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblUsuario', N'Usuario')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblUsuariosAdmin', N'Administración de Usuarios')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LblVentas', N'Ventas')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LinkAnteojosDeportivos', N'Anteojos Deportivos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LinkAnteojosReceta', N'Anteojos de Receta')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LinkAnteojosRetro', N'Anteojos Retro')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LinkAnteojosSol', N'Anteojos de Sol')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LinkBitacora', N'Bitacora')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LinkCerrarSesion', N'Ok')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LinkDigitoVerificador', N'Digito Verificador')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LinkEnvios', N'Envíos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LinkIdioma', N'Idioma')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LinkImpresoras', N'Impresoras')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LinkLogErrores', N'Log de Errores')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LinkMateriales', N'Materiales')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LinkPanelCompras', N'Panel de compras')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LinkPanelPedidos', N'Panel de Pedidos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LinkPedidos', N'Pedidos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LinkPermisos', N'Permisos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LinkPrecios', N'Precios')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LinkPresupuesto', N'Panel de presupuesto')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LinkPrioridad', N'Modificar prioridad')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LinkPriorizacion', N'Cola de priorización')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LinkProductos', N'Productos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LinkRealizar', N'Gestionar Copia')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LinkRegistrarOrden', N'Registrar orden')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LinkReporteOrden', N'Reporte de orden')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LinkReportePresupuesto', N'Reporte de presupuesto')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LinkReportes', N'Reportes')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LinkRestaurar', N'Restaurar Copia')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LinkRol', N'Rol')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LinkUsuario', N'Usuario')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LtCodigoIdioma', N'Código')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LtFechaDesde', N'Fecha Desde')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LtFechaHasta', N'Fecha Hasta')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LtNombre', N'Nombre')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'LtNombreArchivo', N'Nombre de archivo')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'MColor', N'Color')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'MID', N'Id')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'MMarca', N'Marca')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'MMetros', N'Metros')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'MPeso', N'Peso')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'MsgErrorFecha', N'Error no es fecha')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'MsgErrorFormato', N'Error no cumple el formato')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'MsgErrorNumero', N'Error no es número')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'MsgObligatorio', N'Error el campo es obligatorio')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'MTipo', N'Tipo')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'PArchivo', N'Archivo')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'PCalificacion', N'Calificación')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'PCantidadMaterial', N'Cantidad de Material')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'PDescripcion', N'Descripción')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'PID', N'Id')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'PImagen', N'Imagen')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'PNombre', N'Nombre')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'PPrecio', N'Precio')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'PTiempoImpresion', N'Tiempo de Impresión')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'PTipo', N'Tipo')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (4, N'TxtPermiso', N'Permiso')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'BtnAceptar', N'Aceptar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'BtnActualizarArchivo', N'Actualizar Archivo')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'BtnAgregar', N'Agregar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'BtnAgregarDetalleIdioma', N'Generar Claves')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'BtnAgregarIdioma', N'Agregar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'BtnAtras', N'Atras')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'BtnBaja', N'Baja')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'BtnBajarPrioridad', N'Bajar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'BtnBuscar', N'Buscar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'BtnCalcular', N'Calcular Costo')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'BtnCambiarMaterial', N'Cambiar Material')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'BtnCancelar', N'Cancelar')
GO
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'BtnComprar', N'Comprar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'BtnCrearCopia', N'Realizar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'BtnEnviarDomicilio', N'Enviar a Domicilio')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'BtnEnviarImprimir', N'Enviar a Imprimir')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'BtnFactura', N'Descargar Factura')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'BtnGenerarDigito', N'Generar Digito')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'BtnGenerarEtiquetas', N'Generar Etiquetas')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'BtnGuardar', N'Guardar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'BtnImprimir', N'Imprimir')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'BtnMercadopago', N'Pagar con Mercadopago')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'BtnModificar', N'Modificar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'BtnNuevo', N'Nuevo')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'BtnPDF', N'PDF')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'BtnRestaurar', N'Restaurar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'BtnSiguiente', N'Siguiente')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'BtnSubirPrioridad', N'Subir')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'BtnTerminado', N'Finalizar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'BtnVerificarDigito', N'Verificar Digito')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'BtnVolver', N'Volver')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'BtnXLS', N'XLS')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'IID', N'Id')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'IMarca', N'Marca')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'IModelo', N'Modelo')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'INombre', N'Nombre')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblAdmImpresion', N'Administración de Impresión')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblAdminDigitoVerificador', N'Administración Digito Verificador')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblAdminImpresora', N'Administración de Impresoras')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblAdministracion', N'Administración')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblAdministracionMenu', N'Administración')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblAdminMaterial', N'Administración de Materiales')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblAdminPermisos', N'Administrar Permisos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblAdminProducto', N'Administración de Productos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblAlturaCristales', N'Altura de los cristales')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblAnchoCristales', N'Ancho de los cristales')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblAnchoMontura', N'Ancho de la montura')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblApellido', N'Apellido')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblArchivo', N'Nombre de Archivo')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblCalle', N'Calle')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblCambiasPass', N'Cambiar Contraseña')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblCancelar', N'Cancelar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblCerrar', N'Cerrar Sesión')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblCerrarSesion', N'¿Desea cerrar la sesión?')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblCodigoEnvio', N'Código Envio')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblCodigoPostal', N'Código Postal')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblColor', N'Color')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblCompras', N'Compras')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblContacto', N'Contacto')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblContrasenia', N'Contraseña')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblContraseniaRepetir', N'Repetir Contraseña')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblCopiaSeguridad', N'Copia de Seguridad')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblCorreo', N'Correo')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblDepto', N'Depto')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblDireccion', N'Dirección')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblDni', N'Dni')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblFinalizadoExitosamente', N'Compra realizada con éxito!')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblHistorialPedidos', N'Historial de Pedidos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblHome', N'Inicio')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblIdiomas', N'Idiomas')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblIdiomaTitulo', N'Administración de Idiomas')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblImpresiones', N'Impresiones')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblListadoEnvios', N'Envios a Domicilio')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblListadoPrioridades', N'Orden de Impresión')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblListadoVentas', N'Ventas')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblListarBitacora', N'Listar Bitácora')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblLocalidad', N'Localidad')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblLogin', N'Login')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblLongitudPatillas', N'Longitud de las patillas')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblMaterial', N'Material')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblModificarUsuario', N'Modificar Usuario')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblNoLogueado', N'Debe Loguearse para continuar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblNoLogueadoCliente', N'Debe Loguearse con permiso de Cliente')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblPadre', N'Permiso Padre')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblPanelPedidos', N'Panel de Pedidos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblPermisos', N'Permisos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblPermisosDefault', N'Permiso por defecto')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblPersonalizacion', N'Personalizar Marco')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblProduccion', N'Producción')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblProvincia', N'Provincia')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblPuente', N'Puente')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblPuerta', N'Puerta')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblRecordarPass', N'Recordar Contraseña')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblRegistrar', N'Registrar')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblRegistros', N'Registros')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblRegistroUsuario', N'Registrar Usuario')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblResumen', N'Resumen')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblShop', N'Fabrica de anteojos 3D')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblSistema', N'Sistema')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblTabla', N'Tabla')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblTituloTablero', N'VEO3D Admin')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblUsuario', N'Usuario')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblUsuariosAdmin', N'Administración de Usuarios')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LblVentas', N'Ventas')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LinkAnteojosDeportivos', N'Anteojos Deportivos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LinkAnteojosReceta', N'Anteojos de Receta')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LinkAnteojosRetro', N'Anteojos Retro')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LinkAnteojosSol', N'Anteojos de Sol')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LinkBitacora', N'Bitacora')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LinkCambiarPass', N'Cambiar Contraseña')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LinkCerrarSesion', N'Ok')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LinkDigitoVerificador', N'Digito Verificador')
GO
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LinkEnvios', N'Envíos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LinkIdioma', N'Idioma')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LinkImpresoras', N'Impresoras')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LinkLogErrores', N'Log de Errores')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LinkMateriales', N'Materiales')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LinkOrdenPrioridad', N'Orden de Impresión')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LinkPanelCompras', N'Reporte de compras')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LinkPanelPedidos', N'Historial de Pedidos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LinkPedidos', N'Ventas')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LinkPermisos', N'Permisos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LinkPrecios', N'Precios')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LinkPresupuesto', N'Impresiones')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LinkPrioridad', N'Orden de Impresión')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LinkPriorizacion', N'Cola de priorización')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LinkProductos', N'Productos')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LinkRealizar', N'Gestionar Copia')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LinkRegistrarOrden', N'Registrar orden')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LinkReporteOrden', N'Reporte de orden')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LinkReportePresupuesto', N'Reporte de presupuesto')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LinkReportes', N'Reportes')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LinkRestaurar', N'Restaurar Copia')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LinkRol', N'Rol')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LinkUsuario', N'Usuario')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LtCodigoIdioma', N'Código')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LtFechaDesde', N'Fecha Desde')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LtFechaHasta', N'Fecha Hasta')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LtNombre', N'Nombre')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'LtNombreArchivo', N'Nombre de archivo')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'MColor', N'Color')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'MCostoMetros', N'Costo por Metro')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'MID', N'Id')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'MMarca', N'Marca')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'MMetros', N'Metros')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'MPeso', N'Peso')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'MsgError', N'Se produjo un error.')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'MsgErrorFecha', N'Error no es fecha')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'MsgErrorFormato', N'Error no cumple el formato')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'MsgErrorNumero', N'Error no es número')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'MsgExito', N'Operación Exitosa!')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'MsgObligatorio', N'Error el campo es obligatorio')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'MStock', N'Stock')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'MTipo', N'Tipo')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'PArchivo', N'Archivo')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'PCalificacion', N'Calificación')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'PCantidadMaterial', N'Cantidad de Material')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'PDescripcion', N'Descripción')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'PID', N'Id')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'PImagen', N'Imagen')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'PNombre', N'Nombre')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'PPrecio', N'Precio')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'PTiempoImpresion', N'Tiempo de Impresión')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'PTipo', N'Tipo')
INSERT [dbo].[IdiomaDetalle] ([idioma], [clave], [texto]) VALUES (5, N'TxtPermiso', N'Permiso')
GO
INSERT [dbo].[Impresion] ([id], [venta], [impresora], [prioridad], [estado], [fechainicio], [fechafin], [material]) VALUES (1, 1, 1, 1, N'Finalizado', CAST(N'2020-12-18T05:06:01.000' AS DateTime), CAST(N'2020-12-25T05:06:01.000' AS DateTime), 1)
INSERT [dbo].[Impresion] ([id], [venta], [impresora], [prioridad], [estado], [fechainicio], [fechafin], [material]) VALUES (2, 2, 2, 1, N'Finalizado', CAST(N'2020-12-18T13:23:56.000' AS DateTime), CAST(N'2020-12-25T13:23:56.000' AS DateTime), 1)
INSERT [dbo].[Impresion] ([id], [venta], [impresora], [prioridad], [estado], [fechainicio], [fechafin], [material]) VALUES (3, 3, 3, 1, N'Finalizado', CAST(N'2020-12-19T04:37:35.000' AS DateTime), CAST(N'2020-12-26T04:37:35.000' AS DateTime), 1)
GO
INSERT [dbo].[Impresora] ([id], [nombre], [modelo], [marca], [estado]) VALUES (1, N'Impresora 1', N'i3', N'Prusa', 0)
INSERT [dbo].[Impresora] ([id], [nombre], [modelo], [marca], [estado]) VALUES (2, N'Impresora 2', N'i4', N'Prusa Mk', 0)
INSERT [dbo].[Impresora] ([id], [nombre], [modelo], [marca], [estado]) VALUES (3, N'Impresora 3', N'mx-4', N'Silver', 0)
GO
INSERT [dbo].[Material] ([id], [marca], [color], [tipo], [peso], [metros], [estado], [stock], [costom]) VALUES (1, N'Grillon3', N'Azul', N'PLA', 1, 350, 0, 275, CAST(3.86 AS Decimal(10, 2)))
INSERT [dbo].[Material] ([id], [marca], [color], [tipo], [peso], [metros], [estado], [stock], [costom]) VALUES (2, N'Grillon3', N'Amarillo', N'PLA', 1, 350, 0, 300, CAST(3.86 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Permiso] ON 

INSERT [dbo].[Permiso] ([id], [nombre], [padre], [estado]) VALUES (3, N'Cliente', 0, 0)
INSERT [dbo].[Permiso] ([id], [nombre], [padre], [estado]) VALUES (4, N'Administrador Sistema', 0, 0)
INSERT [dbo].[Permiso] ([id], [nombre], [padre], [estado]) VALUES (5, N'Administrador Negocio', 0, 0)
INSERT [dbo].[Permiso] ([id], [nombre], [padre], [estado]) VALUES (6, N'Ventas', 0, 0)
INSERT [dbo].[Permiso] ([id], [nombre], [padre], [estado]) VALUES (7, N'Compras', 0, 0)
INSERT [dbo].[Permiso] ([id], [nombre], [padre], [estado]) VALUES (8, N'Impresion', 0, 0)
INSERT [dbo].[Permiso] ([id], [nombre], [padre], [estado]) VALUES (9, N'Reportes', 0, 0)
INSERT [dbo].[Permiso] ([id], [nombre], [padre], [estado]) VALUES (10, N'LinkUsuario', 4, 0)
INSERT [dbo].[Permiso] ([id], [nombre], [padre], [estado]) VALUES (11, N'LinkIdioma', 4, 0)
INSERT [dbo].[Permiso] ([id], [nombre], [padre], [estado]) VALUES (12, N'LinkRol', 4, 0)
INSERT [dbo].[Permiso] ([id], [nombre], [padre], [estado]) VALUES (13, N'LinkPermisos', 4, 0)
INSERT [dbo].[Permiso] ([id], [nombre], [padre], [estado]) VALUES (14, N'LinkRealizar', 4, 0)
INSERT [dbo].[Permiso] ([id], [nombre], [padre], [estado]) VALUES (15, N'LinkBitacora', 4, 0)
INSERT [dbo].[Permiso] ([id], [nombre], [padre], [estado]) VALUES (16, N'LinkDigitoVerificador', 4, 0)
INSERT [dbo].[Permiso] ([id], [nombre], [padre], [estado]) VALUES (17, N'LinkCompra', 3, 0)
INSERT [dbo].[Permiso] ([id], [nombre], [padre], [estado]) VALUES (18, N'LinkProductos', 5, 0)
INSERT [dbo].[Permiso] ([id], [nombre], [padre], [estado]) VALUES (20, N'LinkImpresoras', 5, 0)
INSERT [dbo].[Permiso] ([id], [nombre], [padre], [estado]) VALUES (21, N'LinkMateriales', 5, 0)
INSERT [dbo].[Permiso] ([id], [nombre], [padre], [estado]) VALUES (22, N'LinkReportes', 5, 0)
INSERT [dbo].[Permiso] ([id], [nombre], [padre], [estado]) VALUES (23, N'LinkPedidos', 6, 0)
INSERT [dbo].[Permiso] ([id], [nombre], [padre], [estado]) VALUES (24, N'LinkEnvios', 6, 0)
INSERT [dbo].[Permiso] ([id], [nombre], [padre], [estado]) VALUES (25, N'LinkPanelCompras', 7, 1)
INSERT [dbo].[Permiso] ([id], [nombre], [padre], [estado]) VALUES (26, N'LinkRegistrarOrden', 7, 0)
INSERT [dbo].[Permiso] ([id], [nombre], [padre], [estado]) VALUES (28, N'LinkPrioridad', 8, 0)
INSERT [dbo].[Permiso] ([id], [nombre], [padre], [estado]) VALUES (29, N'LinkPresupuesto', 8, 0)
INSERT [dbo].[Permiso] ([id], [nombre], [padre], [estado]) VALUES (31, N'LinkPanelPedidos', 8, 0)
SET IDENTITY_INSERT [dbo].[Permiso] OFF
GO
INSERT [dbo].[Producto] ([id], [nombre], [archivo], [cantidadMaterial], [tiempo], [imagen], [descripcion], [tipo], [calificacion], [estado], [precio]) VALUES (1, N'Aries', N'anteojo.stl', 4, 2, N'1.png', N'Ideal para ver bien al reparar armaduras', N'Receta', 4, 0, CAST(3200.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([id], [nombre], [archivo], [cantidadMaterial], [tiempo], [imagen], [descripcion], [tipo], [calificacion], [estado], [precio]) VALUES (2, N'Tauro', N'tauro.sql', 5, 2, N'2.png', N'Los anteojos para personalidades fuertes', N'Informal', 3, 0, CAST(2800.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([id], [nombre], [archivo], [cantidadMaterial], [tiempo], [imagen], [descripcion], [tipo], [calificacion], [estado], [precio]) VALUES (3, N'Geminis', N'geminis.stl', 4, 2, N'3.png', N'Los anteojos para personas de doble personalidad', N'Informal', 5, 0, CAST(3500.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([id], [nombre], [archivo], [cantidadMaterial], [tiempo], [imagen], [descripcion], [tipo], [calificacion], [estado], [precio]) VALUES (4, N'Cancer', N'cancer.stl', 3, 1, N'4.png', N'Anteojos chicos', N'Retro', 2, 0, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([id], [nombre], [archivo], [cantidadMaterial], [tiempo], [imagen], [descripcion], [tipo], [calificacion], [estado], [precio]) VALUES (5, N'Leo', N'leo.stl', 4, 2, N'5.png', N'Anteojos anticuados que no pasan de moda', N'Retro', 4, 0, CAST(2600.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([id], [nombre], [archivo], [cantidadMaterial], [tiempo], [imagen], [descripcion], [tipo], [calificacion], [estado], [precio]) VALUES (6, N'Virgo', N'virgo.stl', 3, 1, N'6.png', N'Anteojos para coloridos', N'Informal', 4, 0, CAST(2900.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([id], [nombre], [archivo], [cantidadMaterial], [tiempo], [imagen], [descripcion], [tipo], [calificacion], [estado], [precio]) VALUES (7, N'Libra', N'libra.stl', 3, 2, N'7.png', N'Anteojos camuflados multi uso', N'Informal', 5, 0, CAST(3200.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([id], [nombre], [archivo], [cantidadMaterial], [tiempo], [imagen], [descripcion], [tipo], [calificacion], [estado], [precio]) VALUES (8, N'Escorpio', N'escorpio.stl', 3, 2, N'8.png', N'Anteojos que combinan con las uñas', N'Receta', 4, 0, CAST(2200.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([id], [nombre], [archivo], [cantidadMaterial], [tiempo], [imagen], [descripcion], [tipo], [calificacion], [estado], [precio]) VALUES (9, N'Sagitario', N'sagitario.stl', 4, 3, N'9.png', N'Anteojos par apuntar bien', N'Receta', 3, 0, CAST(2700.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([id], [nombre], [archivo], [cantidadMaterial], [tiempo], [imagen], [descripcion], [tipo], [calificacion], [estado], [precio]) VALUES (10, N'Capricornio', N'capricornio.stl', 3, 3, N'10.png', N'Los anteojos ideales para usar excalibur', N'Receta', 3, 0, CAST(3100.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([id], [nombre], [archivo], [cantidadMaterial], [tiempo], [imagen], [descripcion], [tipo], [calificacion], [estado], [precio]) VALUES (11, N'Acuario', N'acuario.stl', 3, 2, N'11.png', N'Anteojos para salir a pasear', N'Receta', 4, 0, CAST(3200.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([id], [nombre], [archivo], [cantidadMaterial], [tiempo], [imagen], [descripcion], [tipo], [calificacion], [estado], [precio]) VALUES (12, N'Piscis', N'piscis.stl', 4, 2, N'12.png', N'Anteojos para comprar pescado', N'Informal', 3, 0, CAST(3300.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([id], [nombre], [archivo], [cantidadMaterial], [tiempo], [imagen], [descripcion], [tipo], [calificacion], [estado], [precio]) VALUES (13, N'Cisne', N'cisne.stl', 3, 3, N'13.png', N'Anteojos ideales para la nieve', N'Sol', 4, 0, CAST(3600.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([id], [nombre], [archivo], [cantidadMaterial], [tiempo], [imagen], [descripcion], [tipo], [calificacion], [estado], [precio]) VALUES (14, N'Andromeda', N'andromeda.stl', 5, 2, N'14.png', N'Anteojos de cadena', N'Sol', 2, 0, CAST(3800.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([id], [nombre], [archivo], [cantidadMaterial], [tiempo], [imagen], [descripcion], [tipo], [calificacion], [estado], [precio]) VALUES (15, N'Dragon', N'dragon.stl', 4, 4, N'15.png', N'Anteojos para usar en los picos de china', N'Sol', 4, 0, CAST(3700.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([id], [nombre], [archivo], [cantidadMaterial], [tiempo], [imagen], [descripcion], [tipo], [calificacion], [estado], [precio]) VALUES (16, N'Pegaso', N'pegaso.stl', 4, 4, N'16.png', N'Anteojos multi uso', N'Sol', 4, 0, CAST(3100.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([id], [nombre], [archivo], [cantidadMaterial], [tiempo], [imagen], [descripcion], [tipo], [calificacion], [estado], [precio]) VALUES (17, N'Fenix', N'fenix.stl', 4, 4, N'17.png', N'Anteojos para andar en bicicleta', N'Deportivo', 5, 0, CAST(4000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Usuario] ([usuario], [password], [correo], [nombre], [apellido], [dni]) VALUES (N'Administrador', N'Xz+kFuvnhT+uo78vZpqRmEkbvj0=', N'administrador@veo3D.com', N'Roberto', N'P', 12345678)
INSERT [dbo].[Usuario] ([usuario], [password], [correo], [nombre], [apellido], [dni]) VALUES (N'cuarto', N'oxJzFZSTa9VOhnPbIcYFEZHJ7dE=', N'cuarto@gmail.com', N'cuarto', N'cuarto', 245534533)
INSERT [dbo].[Usuario] ([usuario], [password], [correo], [nombre], [apellido], [dni]) VALUES (N'juan', N'Y5WdSXsfHpJe1pyFsGlRv9ox6Q0=', N'juan@gmail.com', N'Juan Roman', N'Riquelme', 123456)
INSERT [dbo].[Usuario] ([usuario], [password], [correo], [nombre], [apellido], [dni]) VALUES (N'primero', N'3PPjLrWKlTRuvMCR50p38pX4lFw=', N'primero@gmail.com', N'Martin', N'Palermo', 123456)
INSERT [dbo].[Usuario] ([usuario], [password], [correo], [nombre], [apellido], [dni]) VALUES (N'quinto', N'5L4Iuxk8RoAb2eMvlJMlybnVvMs=', N'quinto@gmail.com', N'rfewhiu', N'hhihbi', 678687)
INSERT [dbo].[Usuario] ([usuario], [password], [correo], [nombre], [apellido], [dni]) VALUES (N'segundo', N'f/LfJ9am2ZNjdJR1g3+btHXkz+o=', N'segundo@gmail.com', N'Diego', N'Maradona', 1213135)
INSERT [dbo].[Usuario] ([usuario], [password], [correo], [nombre], [apellido], [dni]) VALUES (N'tercero', N'+LSjc0LM//0Z3h7nOQGIZHBJ0/o=', N'tercero@gmail.com', N'Tercero', N'Perez', 123123132)
GO
INSERT [dbo].[Usuariopermiso] ([usuario], [permiso]) VALUES (N'Administrador', 4)
INSERT [dbo].[Usuariopermiso] ([usuario], [permiso]) VALUES (N'Administrador', 5)
INSERT [dbo].[Usuariopermiso] ([usuario], [permiso]) VALUES (N'Administrador', 6)
INSERT [dbo].[Usuariopermiso] ([usuario], [permiso]) VALUES (N'Administrador', 7)
INSERT [dbo].[Usuariopermiso] ([usuario], [permiso]) VALUES (N'Administrador', 8)
INSERT [dbo].[Usuariopermiso] ([usuario], [permiso]) VALUES (N'Administrador', 9)
INSERT [dbo].[Usuariopermiso] ([usuario], [permiso]) VALUES (N'cuarto', 4)
INSERT [dbo].[Usuariopermiso] ([usuario], [permiso]) VALUES (N'juan', 3)
INSERT [dbo].[Usuariopermiso] ([usuario], [permiso]) VALUES (N'primero', 6)
INSERT [dbo].[Usuariopermiso] ([usuario], [permiso]) VALUES (N'quinto', 3)
INSERT [dbo].[Usuariopermiso] ([usuario], [permiso]) VALUES (N'quinto', 4)
INSERT [dbo].[Usuariopermiso] ([usuario], [permiso]) VALUES (N'segundo', 3)
INSERT [dbo].[Usuariopermiso] ([usuario], [permiso]) VALUES (N'segundo', 4)
INSERT [dbo].[Usuariopermiso] ([usuario], [permiso]) VALUES (N'tercero', 3)
GO
INSERT [dbo].[Venta] ([id], [producto], [anchomontura], [puente], [anchocristales], [alturacristales], [longitudpatillas], [calle], [puerta], [depto], [localidad], [provincia], [estado], [usuario], [archivo], [codigoPostal], [color], [codigoEnvio]) VALUES (1, 1, N'', N'', N'', N'', N'', N'Rivadavia', N'123', N'', N'Quilmes', N'Buenos Aires', N'Enviado a Domicilio', N'juan', N'anteojo.stl', N'1878', N'Azul', N'123456')
INSERT [dbo].[Venta] ([id], [producto], [anchomontura], [puente], [anchocristales], [alturacristales], [longitudpatillas], [calle], [puerta], [depto], [localidad], [provincia], [estado], [usuario], [archivo], [codigoPostal], [color], [codigoEnvio]) VALUES (2, 17, N'', N'', N'', N'', N'', N'Mitre', N'5456', N'', N'Varela', N'Buenos Aires', N'Enviado a Domicilio', N'segundo', N'fenix.stl', N'456', N'Rojo', N'1234567890')
INSERT [dbo].[Venta] ([id], [producto], [anchomontura], [puente], [anchocristales], [alturacristales], [longitudpatillas], [calle], [puerta], [depto], [localidad], [provincia], [estado], [usuario], [archivo], [codigoPostal], [color], [codigoEnvio]) VALUES (3, 1, N'', N'', N'', N'', N'', N'rivadavia', N'123', N'', N'ezpeleta oeste', N'Buenos Aires', N'Enviado a Domicilio', N'cuarto', N'anteojos2.stl', N'1882', N'Negro', N'1231323')
GO
ALTER TABLE [dbo].[DetalleCompras]  WITH CHECK ADD  CONSTRAINT [FK_Compras_Material] FOREIGN KEY([material])
REFERENCES [dbo].[Material] ([id])
GO
ALTER TABLE [dbo].[DetalleCompras] CHECK CONSTRAINT [FK_Compras_Material]
GO
ALTER TABLE [dbo].[DigitoVerificadorDetalle]  WITH CHECK ADD  CONSTRAINT [FK_DigitoVerificadorDetalle_Digitoverificador] FOREIGN KEY([tabla])
REFERENCES [dbo].[Digitoverificador] ([tabla])
GO
ALTER TABLE [dbo].[DigitoVerificadorDetalle] CHECK CONSTRAINT [FK_DigitoVerificadorDetalle_Digitoverificador]
GO
ALTER TABLE [dbo].[IdiomaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_IdiomaDetalle_Idioma] FOREIGN KEY([idioma])
REFERENCES [dbo].[Idioma] ([id])
GO
ALTER TABLE [dbo].[IdiomaDetalle] CHECK CONSTRAINT [FK_IdiomaDetalle_Idioma]
GO
ALTER TABLE [dbo].[Impresion]  WITH CHECK ADD  CONSTRAINT [FK_Impresion_Impresora] FOREIGN KEY([impresora])
REFERENCES [dbo].[Impresora] ([id])
GO
ALTER TABLE [dbo].[Impresion] CHECK CONSTRAINT [FK_Impresion_Impresora]
GO
ALTER TABLE [dbo].[Impresion]  WITH CHECK ADD  CONSTRAINT [FK_Impresion_Venta] FOREIGN KEY([venta])
REFERENCES [dbo].[Venta] ([id])
GO
ALTER TABLE [dbo].[Impresion] CHECK CONSTRAINT [FK_Impresion_Venta]
GO
ALTER TABLE [dbo].[Usuariopermiso]  WITH CHECK ADD  CONSTRAINT [FK_Usuariopermiso_permiso] FOREIGN KEY([permiso])
REFERENCES [dbo].[Permiso] ([id])
GO
ALTER TABLE [dbo].[Usuariopermiso] CHECK CONSTRAINT [FK_Usuariopermiso_permiso]
GO
ALTER TABLE [dbo].[Usuariopermiso]  WITH CHECK ADD  CONSTRAINT [FK_Usuariopermiso_Usuario] FOREIGN KEY([usuario])
REFERENCES [dbo].[Usuario] ([usuario])
GO
ALTER TABLE [dbo].[Usuariopermiso] CHECK CONSTRAINT [FK_Usuariopermiso_Usuario]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Compra_Producto] FOREIGN KEY([producto])
REFERENCES [dbo].[Producto] ([id])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Compra_Producto]
GO
/****** Object:  StoredProcedure [dbo].[CopiaDeSeguridad_alta]    Script Date: 19/12/2020 04:43:58 ******/
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
/****** Object:  StoredProcedure [dbo].[CopiaDeSeguridad_leer]    Script Date: 19/12/2020 04:43:58 ******/
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
/****** Object:  StoredProcedure [dbo].[Detale_Compras_leer]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Detale_Compras_leer]
as
begin
	select * from [DetalleCompras] 
end;

GO
/****** Object:  StoredProcedure [dbo].[Digitoverificador_alta]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Digitoverificador_alta]
@tabla varchar(50), @dvv varchar(50) as
begin

IF EXISTS (SELECT * FROM Digitoverificador WHERE tabla = @tabla)
BEGIN
update Digitoverificador set dvv = @dvv where tabla = @tabla ;
END
ELSE
BEGIN
insert into Digitoverificador values (@tabla, @dvv);
END
end;
GO
/****** Object:  StoredProcedure [dbo].[Digitoverificador_buscar]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[Digitoverificador_buscar]
@tabla as varchar(50) as
begin
select * from Digitoverificador where tabla = @tabla;
end;
GO
/****** Object:  StoredProcedure [dbo].[Digitoverificador_leer]    Script Date: 19/12/2020 04:43:58 ******/
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
/****** Object:  StoredProcedure [dbo].[DigitoVerificadorDetalle_alta]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[DigitoVerificadorDetalle_alta]
@tabla varchar(50), @idtabla varchar(50), @DVH varchar(50) as
begin

IF EXISTS (SELECT * FROM DigitoVerificadorDetalle WHERE [tabla] = @tabla and [idtabla] = @idtabla)
BEGIN
	UPDATE [dbo].[DigitoVerificadorDetalle]
	   SET  [DVH] = @DVH
	 WHERE [tabla] = @tabla and [idtabla] = @idtabla
END
ELSE
BEGIN
	INSERT INTO [dbo].[DigitoVerificadorDetalle]
			   ([tabla]
			   ,[idtabla]
			   ,[DVH])
		 VALUES
			   (@tabla
			   ,@idtabla
			   ,@DVH)
END
end;
GO
/****** Object:  StoredProcedure [dbo].[DigitoVerificadorDetalle_buscar]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[DigitoVerificadorDetalle_buscar]
@tabla varchar(50) as
begin
select * from DigitoVerificadorDetalle where tabla = @tabla;
end;
GO
/****** Object:  StoredProcedure [dbo].[DigitoVerificadorDetalle_leer]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[DigitoVerificadorDetalle_leer]
 as
begin
select * from DigitoVerificadorDetalle
end;
GO
/****** Object:  StoredProcedure [dbo].[Idioma_alta]    Script Date: 19/12/2020 04:43:58 ******/
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
/****** Object:  StoredProcedure [dbo].[Idioma_leer]    Script Date: 19/12/2020 04:43:58 ******/
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
/****** Object:  StoredProcedure [dbo].[IdiomaDetalle_alta]    Script Date: 19/12/2020 04:43:58 ******/
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
/****** Object:  StoredProcedure [dbo].[IdiomaDetalle_leer]    Script Date: 19/12/2020 04:43:58 ******/
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
/****** Object:  StoredProcedure [dbo].[Impresion_alta]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Impresion_alta]
@id int,
@venta int,
@impresora int,
@prioridad int, 
@estado varchar(50), 
@fechainicio datetime, 
@fechafin datetime,
@material int as
begin
set @id   = isnull((select max(id) from Impresion),0) +1
insert into Impresion values (@id, @venta,@impresora,@prioridad,@estado, @fechainicio, @fechafin, @material);
end;
GO
/****** Object:  StoredProcedure [dbo].[Impresion_buscar]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Impresion_buscar]
@id int as
begin
	select * from Impresion 
	where id = @id;
end;
GO
/****** Object:  StoredProcedure [dbo].[Impresion_leer]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Impresion_leer]
as
begin
	select * from Impresion 
end;
GO
/****** Object:  StoredProcedure [dbo].[Impresion_modificar]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Impresion_modificar]
@id int,
@venta int,
@impresora int,
@prioridad int, 
@estado varchar(50),
@fechainicio datetime, 
@fechafin datetime,
@material int as
begin
	update Impresion set
	venta = @venta, impresora = @impresora, prioridad = @prioridad, estado = @estado, fechainicio = @fechainicio, fechafin = @fechafin, material = @material
	where id = @id;
end;
GO
/****** Object:  StoredProcedure [dbo].[Impresora_alta]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Impresora_alta]
@id int,
@nombre varchar(50),
@modelo varchar(50),
@marca varchar(50), 
@estado int as
begin
set @id   = isnull((select max(id) from Impresora),0) +1
insert into Impresora values (@id, @nombre,@modelo,@marca,0);
end;
GO
/****** Object:  StoredProcedure [dbo].[Impresora_baja]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Impresora_baja]
@id int as
begin
	update Impresora set
	estado = 1
	where id = @id;
end;
GO
/****** Object:  StoredProcedure [dbo].[Impresora_buscar]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[Impresora_buscar]
@id int
as
begin
SELECT *
  FROM Impresora
  where id = @id;
end;
GO
/****** Object:  StoredProcedure [dbo].[Impresora_leer]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Impresora_leer]
as
begin
SELECT *
  FROM Impresora
  where estado = 0;
end;
GO
/****** Object:  StoredProcedure [dbo].[Impresora_modificar]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Impresora_modificar]
@id int,
@nombre varchar(50),
@modelo varchar(50),
@marca varchar(50), 
@estado int as
begin
	update Impresora set
	nombre = @nombre, modelo = @modelo, marca = @marca, estado = @estado
	where id = @id;
end;
GO
/****** Object:  StoredProcedure [dbo].[Material_alta]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Material_alta]
@id int,
@marca varchar(50),
@color varchar(50),
@tipo varchar(50),
@peso int,
@metros int ,
@stock int, 
@costom decimal(10,2) as
begin
set @id   = isnull((select max(id) from Material),0) +1
insert into Material values (@id, @marca,@color,@tipo,@peso,@metros,0, @stock,@costom );
end;
GO
/****** Object:  StoredProcedure [dbo].[Material_baja]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Material_baja]
@id int as
begin
	update Material set
	estado = 1
	where id = @id;
end;
GO
/****** Object:  StoredProcedure [dbo].[Material_buscar]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[Material_buscar]
@id int
as
begin
SELECT *
  FROM Material
  where id = @id;
end;
GO
/****** Object:  StoredProcedure [dbo].[Material_leer]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Material_leer]
as
begin
SELECT *
  FROM Material
  where estado = 0;
end;
GO
/****** Object:  StoredProcedure [dbo].[Material_modificar]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Material_modificar]
@id int,
@marca varchar(50),
@color varchar(50),
@tipo varchar(50),
@peso int,
@metros int,
@stock int, 
@costom decimal(10,2) as
begin
	update Material set
	marca = @marca, color = @color, tipo = @tipo, peso = @peso, metros = @metros, stock = @stock, costom = @costom
	where id = @id;
end;
GO
/****** Object:  StoredProcedure [dbo].[OrdenCompra_alta]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[OrdenCompra_alta]
@id int,
@descripcion varchar(50),
@fecha date as
begin
set @id   = isnull((select max(id) from [OrdenCompra]),0) +1

INSERT INTO [dbo].[OrdenCompra]
           ([id]
           ,[descripcion]
           ,[fecha])
     VALUES
           (@id
           ,@descripcion
           ,@fecha)

end;
GO
/****** Object:  StoredProcedure [dbo].[OrdenCompra_leer]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[OrdenCompra_leer]
as
begin
	select * from OrdenCompra 
end;

GO
/****** Object:  StoredProcedure [dbo].[Permiso_alta]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[Permiso_alta]
@nombre varchar(50), @padre int as
begin
insert into Permiso values (@nombre,@padre,0);
end;
GO
/****** Object:  StoredProcedure [dbo].[Permiso_baja]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Permiso_baja]
@id int as
begin

update Permiso set estado = 1
where id = @id;
end;

GO
/****** Object:  StoredProcedure [dbo].[Permiso_buscar]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[Permiso_buscar]
@padre int as
begin
select * from Permiso
where padre = @padre and estado = 0;
end;




GO
/****** Object:  StoredProcedure [dbo].[Permiso_leer]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[Permiso_leer]
as
begin
select id, nombre, padre from Permiso where estado = 0;
end;




GO
/****** Object:  StoredProcedure [dbo].[Permiso_modificar]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[Permiso_modificar]
@id int, @nombre varchar(50), @padre int as
begin
update Permiso set
nombre = @nombre, padre = @padre
where id = @id;
end;




GO
/****** Object:  StoredProcedure [dbo].[Producto_alta]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Producto_alta]
@id int,
@nombre varchar(50),
@archivo varchar(200),
@cantidadMaterial int,
@tiempo int,
@imagen varchar(100),
@descripcion varchar(400),
@tipo varchar(50),
@calificacion int,
@precio decimal(10,2) as
begin
set @id   = isnull((select max(id) from Producto),0) +1
insert into Producto values (@id, @nombre,@archivo,@cantidadMaterial,@tiempo,@imagen,@descripcion,@tipo,@calificacion,0, @precio);
end;
GO
/****** Object:  StoredProcedure [dbo].[Producto_baja]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Producto_baja]
@id int as
begin
	update Producto set
	estado = 1
	where id = @id;
end;
GO
/****** Object:  StoredProcedure [dbo].[Producto_buscar]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[Producto_buscar]
@id int
as
begin
SELECT *
  FROM Producto
  where Producto.id = @id;
end;
GO
/****** Object:  StoredProcedure [dbo].[Producto_leer]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Producto_leer]
as
begin
SELECT *
  FROM Producto where estado = 0;
end;
GO
/****** Object:  StoredProcedure [dbo].[Producto_modificar]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Producto_modificar]
@id int,
@nombre varchar(50),
@archivo varchar(200),
@cantidadMaterial int,
@tiempo int,
@imagen varchar(100),
@descripcion varchar(400),
@tipo varchar(50),
@calificacion int,
@precio decimal(10,2) as
begin
	update Producto set
	nombre = @nombre, archivo = @archivo, cantidadMaterial = @cantidadMaterial, tiempo = @tiempo , imagen = @imagen , descripcion = @descripcion , tipo = @tipo, calificacion = @calificacion, precio = @precio
	where id = @id;
end;
GO
/****** Object:  StoredProcedure [dbo].[Usuario_alta]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[Usuario_alta]
@usuario varchar(50),@pass varchar(50),@nombre varchar(50),
@apellido varchar(50),@correo varchar(50),@dni int as
begin
insert into Usuario values (@usuario,@pass, @correo, @nombre,@apellido,@dni);
end;
GO
/****** Object:  StoredProcedure [dbo].[Usuario_buscar]    Script Date: 19/12/2020 04:43:58 ******/
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
/****** Object:  StoredProcedure [dbo].[Usuario_leer]    Script Date: 19/12/2020 04:43:58 ******/
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
/****** Object:  StoredProcedure [dbo].[Usuario_login]    Script Date: 19/12/2020 04:43:58 ******/
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
/****** Object:  StoredProcedure [dbo].[Usuario_modificar]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[Usuario_modificar]
@usuario varchar(50),@pass varchar(50),@nombre varchar(50),
@apellido varchar(50),@correo varchar(50),@dni int as
begin
update Usuario set correo = @correo, nombre = @nombre, apellido = @apellido, dni= @dni
where usuario = @usuario
end;
GO
/****** Object:  StoredProcedure [dbo].[Usuario_modificarPass]    Script Date: 19/12/2020 04:43:58 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioPermiso_alta]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[UsuarioPermiso_alta]
@usuario varchar(50), @permiso int as
begin
insert into UsuarioPermiso values (@usuario,@permiso);
end;





GO
/****** Object:  StoredProcedure [dbo].[UsuarioPermiso_borrar]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[UsuarioPermiso_borrar]
@usuario varchar(50)as
begin
delete from UsuarioPermiso 
where usuario = @usuario
end;





GO
/****** Object:  StoredProcedure [dbo].[UsuarioPermiso_buscar]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[UsuarioPermiso_buscar]
@usuario varchar(50) as
begin
select p.id, p.nombre, p.padre from UsuarioPermiso up join Permiso p on up.permiso = p.id
where up.usuario = @usuario and p.estado = 0;
end;
GO
/****** Object:  StoredProcedure [dbo].[UsuarioPermiso_leer]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[UsuarioPermiso_leer]
 as
begin
select p.id, p.nombre, up.usuario from UsuarioPermiso up join Permiso p on up.permiso = p.id
where p.estado = 0
end;
GO
/****** Object:  StoredProcedure [dbo].[Venta_alta]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[Venta_alta]
@id int,
@producto varchar(50),
@anchomontura varchar(50),
@puente varchar(50),
@anchocristales varchar(50),
@alturacristales varchar(50),
@longitudpatillas varchar(50),
@calle varchar(50),
@puerta varchar(50),
@depto varchar(50),
@localidad varchar(50),
@provincia varchar(50),
@estado varchar(50),
@usuario varchar(50),
@codigoPostal varchar(50),
@archivo varchar(50), 
@color varchar(50) as
begin

set @id   = isnull((select max(id) from Venta),0) +1


INSERT INTO [dbo].Venta
           ([id]
           ,[producto]
           ,[anchomontura]
           ,[puente]
           ,[anchocristales]
           ,[alturacristales]
           ,[longitudpatillas]
           ,[calle]
           ,[puerta]
           ,[depto]
           ,[localidad]
           ,[provincia]
		   ,[estado]
		   ,[usuario]
		   ,[archivo]
		   ,[codigoPostal]
		   ,[color])
     VALUES
           (@id
           ,@producto
           ,@anchomontura
           ,@puente
           ,@anchocristales
           ,@alturacristales
           ,@longitudpatillas
           ,@calle
           ,@puerta
           ,@depto
           ,@localidad
           ,@provincia
		   ,@estado
		   ,@usuario
		   ,@archivo
		   ,@codigoPostal
		   ,@color)
end;

GO
/****** Object:  StoredProcedure [dbo].[Venta_buscar]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[Venta_buscar]
@id int as
begin
SELECT *
  FROM Venta where id = @id;
end;
GO
/****** Object:  StoredProcedure [dbo].[Venta_leer]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Venta_leer]
as
begin
SELECT *
  FROM Venta;
end;
GO
/****** Object:  StoredProcedure [dbo].[Venta_modificar]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[Venta_modificar]
@id int,
@estado varchar(50)
as
begin

UPDATE [dbo].Venta
   SET [estado] = @estado
 WHERE id = @id;

end;

GO
/****** Object:  StoredProcedure [dbo].[Venta_modificar_archivo]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create procedure [dbo].[Venta_modificar_archivo]
@id int,
@archivo varchar(50)
as
begin

UPDATE [dbo].Venta
   SET [archivo] = @archivo
 WHERE id = @id;

end;

GO
/****** Object:  StoredProcedure [dbo].[Venta_modificar_envio]    Script Date: 19/12/2020 04:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create procedure [dbo].[Venta_modificar_envio]
@id int,
@codigo varchar(50)
as
begin

UPDATE [dbo].Venta
   SET [codigoEnvio] = @codigo
 WHERE id = @id;

end;

GO
USE [master]
GO
ALTER DATABASE [Veo3D] SET  READ_WRITE 
GO
