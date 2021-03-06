USE [master]
GO
/****** Object:  Database [PIA_BD]    Script Date: 08/04/2019 10:07:09 p. m. ******/
CREATE DATABASE [PIA_BD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PIA_BD', FILENAME = N'D:\SQL2017\MSSQL14.SQLEXPRESS\MSSQL\DATA\PIA_BD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PIA_BD_log', FILENAME = N'D:\SQL2017\MSSQL14.SQLEXPRESS\MSSQL\DATA\PIA_BD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PIA_BD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PIA_BD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PIA_BD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PIA_BD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PIA_BD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PIA_BD] SET ARITHABORT OFF 
GO
ALTER DATABASE [PIA_BD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PIA_BD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PIA_BD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PIA_BD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PIA_BD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PIA_BD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PIA_BD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PIA_BD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PIA_BD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PIA_BD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PIA_BD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PIA_BD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PIA_BD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PIA_BD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PIA_BD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PIA_BD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PIA_BD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PIA_BD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PIA_BD] SET  MULTI_USER 
GO
ALTER DATABASE [PIA_BD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PIA_BD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PIA_BD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PIA_BD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PIA_BD] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PIA_BD]
GO
/****** Object:  UserDefinedFunction [dbo].[NombreCompleto]    Script Date: 08/04/2019 10:07:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[NombreCompleto] (@nombre varchar(50),@apellido varchar(40))
returns varchar(100)
as
begin
	return (@nombre +' '+ @apellido)
end

GO
/****** Object:  Table [dbo].[Bebida]    Script Date: 08/04/2019 10:07:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bebida](
	[Bebida_code] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Bebida] PRIMARY KEY CLUSTERED 
(
	[Bebida_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 08/04/2019 10:07:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[Cliente_code] [int] NOT NULL,
	[ApPaterno_c] [varchar](50) NOT NULL,
	[ApMaterno_c] [varchar](50) NOT NULL,
	[Nombre_c] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Info_Gral]    Script Date: 08/04/2019 10:07:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Info_Gral](
	[Info_code] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Correo] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Info_Gral] PRIMARY KEY CLUSTERED 
(
	[Info_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pago_Metodo]    Script Date: 08/04/2019 10:07:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago_Metodo](
	[Pago_code] [int] NOT NULL,
	[TPago] [int] NOT NULL,
 CONSTRAINT [PK_Pago_Metodo] PRIMARY KEY CLUSTERED 
(
	[Pago_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 08/04/2019 10:07:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[Pedido_code] [int] NOT NULL,
	[Platillo_code] [int] NOT NULL,
	[Bebida_code] [int] NOT NULL,
	[Postre_code] [int] NOT NULL,
 CONSTRAINT [PK_Pedido] PRIMARY KEY CLUSTERED 
(
	[Pedido_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Platillo]    Script Date: 08/04/2019 10:07:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Platillo](
	[Platillo_code] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Platillo] PRIMARY KEY CLUSTERED 
(
	[Platillo_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Postre]    Script Date: 08/04/2019 10:07:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Postre](
	[Postre_code] [int] NOT NULL,
	[Descripcion] [nchar](10) NULL,
 CONSTRAINT [PK_Postre] PRIMARY KEY CLUSTERED 
(
	[Postre_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reservacion]    Script Date: 08/04/2019 10:07:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservacion](
	[Reservacion_code] [int] NOT NULL,
	[Cliente_code] [int] NOT NULL,
 CONSTRAINT [PK_Reservacion] PRIMARY KEY CLUSTERED 
(
	[Reservacion_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 08/04/2019 10:07:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[Ticket_code] [int] NOT NULL,
	[Pedido_code] [int] NOT NULL,
	[Pago_code] [int] NOT NULL,
	[Reserv_code] [int] NOT NULL,
	[Info_code] [int] NOT NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[Ticket_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoPago]    Script Date: 08/04/2019 10:07:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoPago](
	[TPago_code] [int] NOT NULL,
	[Efectivo] [bit] NOT NULL,
	[TDD] [bit] NOT NULL,
	[TDC] [bit] NOT NULL,
 CONSTRAINT [PK_TipoPago] PRIMARY KEY CLUSTERED 
(
	[TPago_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[BUSQUEDA_APELLIDOS]    Script Date: 08/04/2019 10:07:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[BUSQUEDA_APELLIDOS] as
Select *
from Cliente
Where ApPaterno_c = 'Castillo' AND ApMaterno_c = 'Guajardo'

GO
/****** Object:  View [dbo].[BUSQUEDA_COMPLETA]    Script Date: 08/04/2019 10:07:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[BUSQUEDA_COMPLETA] as
Select Cliente.ApMaterno_c + Cliente.ApPaterno_c + Cliente.Nombre_c AS NOMBRE_COMPLETO
from Cliente
where ApMaterno_c like '%Castillo%' OR Cliente_code = 2

GO
/****** Object:  View [dbo].[CLIENTES]    Script Date: 08/04/2019 10:07:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[CLIENTES] as
Select Cliente.Nombre_c + Cliente.ApPaterno_c + Cliente.ApMaterno_c as NOMBRE_COMPLETO
from Cliente
where Cliente_code = 2
GO
/****** Object:  View [dbo].[CUENTA_PEDIDOS]    Script Date: 08/04/2019 10:07:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[CUENTA_PEDIDOS] as
Select COUNT (Pedido_code) as Pedidos
from Pedido
where Platillo_code >1 OR Postre_code >5
GO
/****** Object:  View [dbo].[Info_General]    Script Date: 08/04/2019 10:07:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[Info_General] as
Select Info_Gral.Correo
from Info_Gral 

GO
/****** Object:  View [dbo].[NOMBREA_RESERVACION]    Script Date: 08/04/2019 10:07:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[NOMBREA_RESERVACION] as
Select Cliente.Nombre_c as Nombre, Reservacion_code as Reservacion
from Cliente
inner join Reservacion on Cliente.Cliente_code = Reservacion.Reservacion_code
GO
/****** Object:  View [dbo].[POSTRE_BUSQUEDA]    Script Date: 08/04/2019 10:07:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[POSTRE_BUSQUEDA] as
Select Postre.Descripcion as POSTRE_ELEGIDO
from Postre
WHERE Postre.Postre_code= 4
GO
/****** Object:  View [dbo].[RESERVACIONES]    Script Date: 08/04/2019 10:07:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[RESERVACIONES] as
Select Cliente.Nombre_c,Reservacion.Reservacion_code
from Reservacion
inner join  Cliente on Reservacion.Cliente_code = Reservacion.Cliente_code
where Nombre_c = '%O%'
GO
INSERT [dbo].[Bebida] ([Bebida_code], [Descripcion]) VALUES (1, N'Coca')
GO
INSERT [dbo].[Bebida] ([Bebida_code], [Descripcion]) VALUES (2, N'Sprite')
GO
INSERT [dbo].[Bebida] ([Bebida_code], [Descripcion]) VALUES (3, N'Manzanita')
GO
INSERT [dbo].[Bebida] ([Bebida_code], [Descripcion]) VALUES (4, N'FuzeTea')
GO
INSERT [dbo].[Bebida] ([Bebida_code], [Descripcion]) VALUES (5, N'Fanta')
GO
INSERT [dbo].[Bebida] ([Bebida_code], [Descripcion]) VALUES (6, N'Agua Mineral')
GO
INSERT [dbo].[Bebida] ([Bebida_code], [Descripcion]) VALUES (7, N'Agua Natural')
GO
INSERT [dbo].[Bebida] ([Bebida_code], [Descripcion]) VALUES (8, N'Cafe')
GO
INSERT [dbo].[Bebida] ([Bebida_code], [Descripcion]) VALUES (9, N'Limonada')
GO
INSERT [dbo].[Bebida] ([Bebida_code], [Descripcion]) VALUES (10, N'Naranjada')
GO
INSERT [dbo].[Bebida] ([Bebida_code], [Descripcion]) VALUES (11, N'Piña colada')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (1, N'Ornelas', N'Herrera', N'Juan Jose')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (2, N'Ornelas', N'Castillo', N'Lizbeth Alexandra')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (3, N'Godinez', N'Perez', N'Fermin')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (4, N'Carreon', N'Uriel', N'Brandon')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (5, N'Carpio', N'Herrera', N'Jose Juan')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (6, N'Laureano', N'Martinez', N'Felipe ')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (7, N'Tovar', N'Hilario', N'Tomas')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (8, N'Yañez', N'Torres', N'Antonio')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (9, N'Guajardo', N'Hernandez', N'Bernardo')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (10, N'Guajardo', N'Castillo', N'Olga Lydia')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (11, N'Ortiz', N'Castillo', N'Alexandra')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (12, N'Fernandez', N'Perez', N'Fernando')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (13, N'Carrizales', N'Uriel', N'Pedro')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (14, N'Renteria', N'Herrera', N'Jose Felipe')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (15, N'Gonzalez', N'Martinez', N'Felipe ')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (16, N'Gomez', N'Hilario', N'Ricardo')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (17, N'Hernandez', N'Torres', N'Eduardo')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (18, N'Tamez', N'Hernandez', N'Max')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (19, N'Blanco', N'Castro', N'Marin')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (20, N'Guzman', N'Rodriguez', N'Melisa')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (21, N'Rodriguez', N'Gonzalez', N'Brenda')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (22, N'Flores', N'Quintana', N'Mariana')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (23, N'Gomez', N'Gomez', N'Francisco')
GO
INSERT [dbo].[Cliente] ([Cliente_code], [ApPaterno_c], [ApMaterno_c], [Nombre_c]) VALUES (24, N'Yañez,', N'Reyes', N'Carlos')
GO
INSERT [dbo].[Info_Gral] ([Info_code], [Descripcion], [Telefono], [Correo]) VALUES (1, N'EL LINGOTE', 924839, N'ellingote@gmail.com')
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (1, 1)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (2, 2)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (3, 1)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (4, 4)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (5, 6)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (6, 1)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (7, 7)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (8, 1)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (9, 3)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (10, 1)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (11, 3)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (12, 3)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (13, 6)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (14, 1)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (15, 1)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (16, 3)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (17, 1)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (18, 3)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (19, 5)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (20, 5)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (21, 6)
GO
INSERT [dbo].[Pago_Metodo] ([Pago_code], [TPago]) VALUES (22, 1)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (1, 1, 3, 3)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (2, 2, 2, 5)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (3, 5, 2, 6)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (4, 6, 2, 2)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (5, 3, 2, 1)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (6, 3, 2, 4)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (7, 7, 2, 5)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (8, 10, 2, 6)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (9, 1, 2, 4)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (10, 12, 2, 4)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (11, 6, 2, 3)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (12, 1, 2, 2)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (13, 1, 2, 5)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (14, 1, 4, 2)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (15, 1, 2, 5)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (16, 4, 2, 8)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (17, 9, 2, 9)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (18, 3, 2, 10)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (19, 1, 2, 3)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (20, 5, 2, 5)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (21, 10, 2, 9)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (22, 11, 2, 10)
GO
INSERT [dbo].[Pedido] ([Pedido_code], [Platillo_code], [Bebida_code], [Postre_code]) VALUES (23, 12, 2, 4)
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (1, N'Caldo de res')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (2, N'Caldo de pollo')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (3, N'Caldo de pescado')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (4, N'Sopa de arroz')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (5, N'Albondigas')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (6, N'Tacos de carne asada')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (7, N'Tacos de trompo')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (8, N'Hamburguesa basica')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (9, N'Hamburguesa doble')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (10, N'Hamburguesa 4to libra')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (11, N'Hamburguesa sin queso')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (12, N'Hamburguesa con trompo')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (13, N'Hamburguesa F')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (14, N'Hamburguesa infantil')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (15, N'Hamburguesa Fornite')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (16, N'Hamburguesa K')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (17, N'Hamburguesa Triple')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (18, N'Torta basica')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (19, N'Torta de res')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (20, N'Torta de pollo')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (21, N'Torta ahogada')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (22, N'Torta de tamal')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (23, N'Filete de res 3/4')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (24, N'Filete de pescado')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (25, N'De la casa')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (26, N'Spagetti normal')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (27, N'Spagetti con albondigas')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (28, N'Mojarra')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (29, N'Boneless')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (30, N'Ramen')
GO
INSERT [dbo].[Platillo] ([Platillo_code], [Descripcion]) VALUES (31, N'Maruchan de la casa')
GO
INSERT [dbo].[Postre] ([Postre_code], [Descripcion]) VALUES (1, N'Chessecake')
GO
INSERT [dbo].[Postre] ([Postre_code], [Descripcion]) VALUES (4, N'Sundae    ')
GO
INSERT [dbo].[Postre] ([Postre_code], [Descripcion]) VALUES (8, N'3 leches  ')
GO
INSERT [dbo].[Postre] ([Postre_code], [Descripcion]) VALUES (12, N'Chokis    ')
GO
INSERT [dbo].[Postre] ([Postre_code], [Descripcion]) VALUES (13, N'Gomitas   ')
GO
INSERT [dbo].[Reservacion] ([Reservacion_code], [Cliente_code]) VALUES (1, 1)
GO
INSERT [dbo].[Reservacion] ([Reservacion_code], [Cliente_code]) VALUES (2, 2)
GO
INSERT [dbo].[Reservacion] ([Reservacion_code], [Cliente_code]) VALUES (3, 3)
GO
INSERT [dbo].[Reservacion] ([Reservacion_code], [Cliente_code]) VALUES (4, 4)
GO
INSERT [dbo].[Reservacion] ([Reservacion_code], [Cliente_code]) VALUES (5, 5)
GO
INSERT [dbo].[Reservacion] ([Reservacion_code], [Cliente_code]) VALUES (6, 6)
GO
INSERT [dbo].[Reservacion] ([Reservacion_code], [Cliente_code]) VALUES (7, 7)
GO
INSERT [dbo].[Reservacion] ([Reservacion_code], [Cliente_code]) VALUES (8, 8)
GO
INSERT [dbo].[Reservacion] ([Reservacion_code], [Cliente_code]) VALUES (9, 10)
GO
INSERT [dbo].[Reservacion] ([Reservacion_code], [Cliente_code]) VALUES (10, 11)
GO
INSERT [dbo].[Reservacion] ([Reservacion_code], [Cliente_code]) VALUES (11, 12)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (1, 1, 2, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (2, 1, 5, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (3, 1, 1, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (4, 1, 3, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (5, 3, 2, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (6, 1, 2, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (7, 1, 2, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (8, 1, 3, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (9, 1, 2, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (10, 1, 7, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (11, 1, 2, 3, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (12, 1, 4, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (13, 1, 2, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (14, 1, 2, 3, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (15, 1, 4, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (16, 3, 2, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (17, 1, 2, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (18, 1, 6, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (19, 1, 8, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (20, 1, 2, 5, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (21, 1, 3, 1, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (22, 5, 2, 3, 1)
GO
INSERT [dbo].[Ticket] ([Ticket_code], [Pedido_code], [Pago_code], [Reserv_code], [Info_code]) VALUES (23, 1, 7, 1, 1)
GO
INSERT [dbo].[TipoPago] ([TPago_code], [Efectivo], [TDD], [TDC]) VALUES (1, 0, 1, 0)
GO
INSERT [dbo].[TipoPago] ([TPago_code], [Efectivo], [TDD], [TDC]) VALUES (2, 0, 0, 1)
GO
INSERT [dbo].[TipoPago] ([TPago_code], [Efectivo], [TDD], [TDC]) VALUES (3, 0, 0, 1)
GO
INSERT [dbo].[TipoPago] ([TPago_code], [Efectivo], [TDD], [TDC]) VALUES (4, 1, 0, 0)
GO
INSERT [dbo].[TipoPago] ([TPago_code], [Efectivo], [TDD], [TDC]) VALUES (5, 0, 1, 0)
GO
INSERT [dbo].[TipoPago] ([TPago_code], [Efectivo], [TDD], [TDC]) VALUES (6, 0, 1, 0)
GO
INSERT [dbo].[TipoPago] ([TPago_code], [Efectivo], [TDD], [TDC]) VALUES (7, 1, 0, 0)
GO
/****** Object:  StoredProcedure [dbo].[Busqueda_Gral]    Script Date: 08/04/2019 10:07:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Busqueda_Gral]
@ApMaterno varchar(50),
@ApPaterno varchar(50),
@Nombre varchar(50),
@Cliente int
as
Select Cliente.ApMaterno_c + Cliente.ApPaterno_c + Cliente.Nombre_c AS NOMBRE_COMPLETO
from Cliente
where ApMaterno_c like '%'+ @ApMaterno+ '%' OR Cliente_code = @Cliente

GO
/****** Object:  StoredProcedure [dbo].[Busqueda_Nombre]    Script Date: 08/04/2019 10:07:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Busqueda_Nombre]
@ApellidoP varchar(40),
@ApellidoM varchar(40)
as 
Select *
from Cliente
Where ApPaterno_c = @ApellidoP AND ApMaterno_c = @ApellidoM

GO
/****** Object:  StoredProcedure [dbo].[Cliente_Reservacion]    Script Date: 08/04/2019 10:07:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Cliente_Reservacion]
as
Select Cliente.Nombre_c, Ticket.Ticket_code
from Ticket, Reservacion
inner join Cliente on Reservacion.Cliente_code = Cliente.Cliente_code

GO
/****** Object:  StoredProcedure [dbo].[Informacion]    Script Date: 08/04/2019 10:07:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Informacion]
as
Select Info_Gral.Correo
from Info_Gral 

GO
/****** Object:  StoredProcedure [dbo].[Nombre_Clientes]    Script Date: 08/04/2019 10:07:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Nombre_Clientes]
as
Select Cliente.Nombre_c + Cliente.ApPaterno_c + Cliente.ApMaterno_c as NOMBRE_COMPLETO
from Cliente
where Cliente_code = 2
GO
/****** Object:  StoredProcedure [dbo].[Pediddo_cuenta]    Script Date: 08/04/2019 10:07:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Pediddo_cuenta]
@Platillo int,
@Postre int
as
Select COUNT (Pedido_code) as Pedidos
from Pedido
where Platillo_code = @Platillo OR Postre_code = @Postre
GO
/****** Object:  StoredProcedure [dbo].[Postre_Busq]    Script Date: 08/04/2019 10:07:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Postre_Busq]
@postre int
as
Select Postre.Descripcion as POSTRE_ELEGIDO
from Postre
WHERE Postre.Postre_code= @postre
GO
/****** Object:  StoredProcedure [dbo].[Reservacion_Nombre]    Script Date: 08/04/2019 10:07:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Reservacion_Nombre]
as
Select Cliente.Nombre_c as Nombre, Reservacion_code as Reservacion
from Cliente
inner join Reservacion on Cliente.Cliente_code = Reservacion.Reservacion_code
GO
/****** Object:  StoredProcedure [dbo].[Reservaciones_porNombre]    Script Date: 08/04/2019 10:07:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Reservaciones_porNombre]
@nombre varchar(50)
as
Select Cliente.Nombre_c,Reservacion.Reservacion_code
from Reservacion
inner join  Cliente on Reservacion.Cliente_code = Reservacion.Cliente_code
where Nombre_c = '%'+ @nombre +'%'
GO
/****** Object:  StoredProcedure [dbo].[SP_Busqueda]    Script Date: 08/04/2019 10:07:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SP_Busqueda] 
@id int
as 
Select * from Cliente
where Cliente_code = @id
GO
/****** Object:  StoredProcedure [dbo].[Ticket_Info]    Script Date: 08/04/2019 10:07:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Ticket_Info]
as
Select Ticket.Pago_code
from Ticket



GO
/****** Object:  Trigger [dbo].[Insertar_Pedido]    Script Date: 08/04/2019 10:07:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[Insertar_Pedido] 
on [dbo].[Pedido] 
AFTER INSERT
 
AS

/**query de comparacion**/
 IF EXISTS	
 (
	Select Cliente.Nombre_c as Nombre, Reservacion_code as Reservacion
	from Cliente
	inner join Reservacion on Cliente.Cliente_code = Reservacion.Reservacion_code
	where Reservacion_code = 4
 )

 /*Inicio del insert*/
 begin
	Insert into Pedido values(30,1,3,4)
 end

GO
USE [master]
GO
ALTER DATABASE [PIA_BD] SET  READ_WRITE 
GO
