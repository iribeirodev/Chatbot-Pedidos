----------------------------------------------------------------------
IF NOT EXISTS (
    SELECT name 
    FROM sys.databases 
    WHERE name = 'Samples'
)
BEGIN
    CREATE DATABASE Samples;
END
----------------------------------------------------------------------

USE [Samples]
GO
ALTER TABLE [dbo].[Pedidos] DROP CONSTRAINT [FK__Pedidos__Cliente__32E0915F]
GO
ALTER TABLE [dbo].[PedidoItens] DROP CONSTRAINT [FK__PedidoIte__Produ__36B12243]
GO
ALTER TABLE [dbo].[PedidoItens] DROP CONSTRAINT [FK__PedidoIte__Pedid__35BCFE0A]
GO
ALTER TABLE [dbo].[Pedidos] DROP CONSTRAINT [DF__Pedidos__DataPed__31EC6D26]
GO
/****** Object:  Index [UQ__Produtos__CA1ECF0D645B1FCD]    Script Date: 26/03/2025 16:48:37 ******/
ALTER TABLE [dbo].[Produtos] DROP CONSTRAINT [UQ__Produtos__CA1ECF0D645B1FCD]
GO
/****** Object:  Index [UQ__Clientes__A9D1053412C1110D]    Script Date: 26/03/2025 16:48:37 ******/
ALTER TABLE [dbo].[Clientes] DROP CONSTRAINT [UQ__Clientes__A9D1053412C1110D]
GO
/****** Object:  Table [dbo].[Produtos]    Script Date: 26/03/2025 16:48:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Produtos]') AND type in (N'U'))
DROP TABLE [dbo].[Produtos]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 26/03/2025 16:48:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pedidos]') AND type in (N'U'))
DROP TABLE [dbo].[Pedidos]
GO
/****** Object:  Table [dbo].[PedidoItens]    Script Date: 26/03/2025 16:48:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PedidoItens]') AND type in (N'U'))
DROP TABLE [dbo].[PedidoItens]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 26/03/2025 16:48:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Clientes]') AND type in (N'U'))
DROP TABLE [dbo].[Clientes]
GO
USE [master]
GO
/****** Object:  Database [Samples]    Script Date: 26/03/2025 16:48:37 ******/
DROP DATABASE [Samples]
GO
/****** Object:  Database [Samples]    Script Date: 26/03/2025 16:48:37 ******/
CREATE DATABASE [Samples]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Samples', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Samples.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Samples_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Samples_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Samples] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Samples].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Samples] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Samples] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Samples] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Samples] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Samples] SET ARITHABORT OFF 
GO
ALTER DATABASE [Samples] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Samples] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Samples] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Samples] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Samples] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Samples] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Samples] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Samples] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Samples] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Samples] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Samples] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Samples] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Samples] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Samples] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Samples] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Samples] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Samples] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Samples] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Samples] SET  MULTI_USER 
GO
ALTER DATABASE [Samples] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Samples] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Samples] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Samples] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Samples] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Samples] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Samples] SET QUERY_STORE = OFF
GO
USE [Samples]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 26/03/2025 16:48:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ClienteID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Telefone] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PedidoItens]    Script Date: 26/03/2025 16:48:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidoItens](
	[PedidoItemID] [int] IDENTITY(1,1) NOT NULL,
	[PedidoID] [int] NOT NULL,
	[ProdutoID] [int] NOT NULL,
	[Quantidade] [int] NOT NULL,
	[PrecoUnitario] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PedidoItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 26/03/2025 16:48:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[PedidoID] [int] IDENTITY(1,1) NOT NULL,
	[ClienteID] [int] NOT NULL,
	[DataPedido] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PedidoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produtos]    Script Date: 26/03/2025 16:48:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produtos](
	[ProdutoID] [int] IDENTITY(1,1) NOT NULL,
	[SKU] [nvarchar](50) NOT NULL,
	[Nome] [nvarchar](100) NOT NULL,
	[Categoria] [nvarchar](50) NULL,
	[Preco] [decimal](10, 2) NULL,
	[Estoque] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProdutoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 
GO
INSERT [dbo].[Clientes] ([ClienteID], [Nome], [Email], [Telefone]) VALUES (1, N'João Silva', N'joao.silva@email.com', N'(11) 99999-9999')
GO
INSERT [dbo].[Clientes] ([ClienteID], [Nome], [Email], [Telefone]) VALUES (2, N'Maria Oliveira', N'maria.oliveira@email.com', N'(21) 98888-8888')
GO
INSERT [dbo].[Clientes] ([ClienteID], [Nome], [Email], [Telefone]) VALUES (3, N'Carlos Mendes', N'carlos.mendes@email.com', N'(31) 97777-7777')
GO
INSERT [dbo].[Clientes] ([ClienteID], [Nome], [Email], [Telefone]) VALUES (4, N'Ana Souza', N'ana.souza@email.com', N'(41) 96666-6666')
GO
INSERT [dbo].[Clientes] ([ClienteID], [Nome], [Email], [Telefone]) VALUES (5, N'Roberto Lima', N'roberto.lima@email.com', N'(51) 95555-5555')
GO
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[PedidoItens] ON 
GO
INSERT [dbo].[PedidoItens] ([PedidoItemID], [PedidoID], [ProdutoID], [Quantidade], [PrecoUnitario]) VALUES (1, 1, 1, 20, CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[PedidoItens] ([PedidoItemID], [PedidoID], [ProdutoID], [Quantidade], [PrecoUnitario]) VALUES (2, 1, 4, 1, CAST(120.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[PedidoItens] ([PedidoItemID], [PedidoID], [ProdutoID], [Quantidade], [PrecoUnitario]) VALUES (3, 2, 3, 2, CAST(50.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[PedidoItens] ([PedidoItemID], [PedidoID], [ProdutoID], [Quantidade], [PrecoUnitario]) VALUES (4, 2, 5, 50, CAST(3.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[PedidoItens] ([PedidoItemID], [PedidoID], [ProdutoID], [Quantidade], [PrecoUnitario]) VALUES (5, 3, 2, 100, CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[PedidoItens] ([PedidoItemID], [PedidoID], [ProdutoID], [Quantidade], [PrecoUnitario]) VALUES (6, 3, 6, 1, CAST(800.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[PedidoItens] ([PedidoItemID], [PedidoID], [ProdutoID], [Quantidade], [PrecoUnitario]) VALUES (7, 4, 7, 3, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[PedidoItens] ([PedidoItemID], [PedidoID], [ProdutoID], [Quantidade], [PrecoUnitario]) VALUES (8, 4, 1, 50, CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[PedidoItens] ([PedidoItemID], [PedidoID], [ProdutoID], [Quantidade], [PrecoUnitario]) VALUES (9, 5, 4, 2, CAST(120.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[PedidoItens] ([PedidoItemID], [PedidoID], [ProdutoID], [Quantidade], [PrecoUnitario]) VALUES (10, 5, 5, 100, CAST(3.50 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[PedidoItens] OFF
GO
SET IDENTITY_INSERT [dbo].[Pedidos] ON 
GO
INSERT [dbo].[Pedidos] ([PedidoID], [ClienteID], [DataPedido]) VALUES (1, 1, CAST(N'2024-03-20T10:30:00.000' AS DateTime))
GO
INSERT [dbo].[Pedidos] ([PedidoID], [ClienteID], [DataPedido]) VALUES (2, 2, CAST(N'2024-03-21T14:45:00.000' AS DateTime))
GO
INSERT [dbo].[Pedidos] ([PedidoID], [ClienteID], [DataPedido]) VALUES (3, 3, CAST(N'2024-03-22T09:15:00.000' AS DateTime))
GO
INSERT [dbo].[Pedidos] ([PedidoID], [ClienteID], [DataPedido]) VALUES (4, 4, CAST(N'2024-03-23T16:30:00.000' AS DateTime))
GO
INSERT [dbo].[Pedidos] ([PedidoID], [ClienteID], [DataPedido]) VALUES (5, 5, CAST(N'2024-03-24T11:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Pedidos] OFF
GO
SET IDENTITY_INSERT [dbo].[Produtos] ON 
GO
INSERT [dbo].[Produtos] ([ProdutoID], [SKU], [Nome], [Categoria], [Preco], [Estoque]) VALUES (1, N'ENG-PARAF-10MM', N'Parafuso inox 10mm', N'Fixação', CAST(0.50 AS Decimal(10, 2)), 500)
GO
INSERT [dbo].[Produtos] ([ProdutoID], [SKU], [Nome], [Categoria], [Preco], [Estoque]) VALUES (2, N'ENG-PORCA-M8', N'Porca sextavada M8', N'Fixação', CAST(0.30 AS Decimal(10, 2)), 300)
GO
INSERT [dbo].[Produtos] ([ProdutoID], [SKU], [Nome], [Categoria], [Preco], [Estoque]) VALUES (3, N'ENG-TUBO-2POL', N'Tubo aço carbono 2"', N'Estrutural', CAST(50.00 AS Decimal(10, 2)), 50)
GO
INSERT [dbo].[Produtos] ([ProdutoID], [SKU], [Nome], [Categoria], [Preco], [Estoque]) VALUES (4, N'ENG-VALV-1POL', N'Válvula esfera 1"', N'Hidráulico', CAST(120.00 AS Decimal(10, 2)), 20)
GO
INSERT [dbo].[Produtos] ([ProdutoID], [SKU], [Nome], [Categoria], [Preco], [Estoque]) VALUES (5, N'ENG-FIO-2,5MM', N'Cabo elétrico 2,5mm²', N'Elétrico', CAST(3.50 AS Decimal(10, 2)), 200)
GO
INSERT [dbo].[Produtos] ([ProdutoID], [SKU], [Nome], [Categoria], [Preco], [Estoque]) VALUES (6, N'ENG-MOTOR-1CV', N'Motor elétrico 1CV trifásico', N'Máquinas', CAST(800.00 AS Decimal(10, 2)), 5)
GO
INSERT [dbo].[Produtos] ([ProdutoID], [SKU], [Nome], [Categoria], [Preco], [Estoque]) VALUES (7, N'ENG-SENSOR-TEMP', N'Sensor de temperatura PT100', N'Instrumentação', CAST(45.00 AS Decimal(10, 2)), 15)
GO
SET IDENTITY_INSERT [dbo].[Produtos] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Clientes__A9D1053412C1110D]    Script Date: 26/03/2025 16:48:38 ******/
ALTER TABLE [dbo].[Clientes] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Produtos__CA1ECF0D645B1FCD]    Script Date: 26/03/2025 16:48:38 ******/
ALTER TABLE [dbo].[Produtos] ADD UNIQUE NONCLUSTERED 
(
	[SKU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Pedidos] ADD  DEFAULT (getdate()) FOR [DataPedido]
GO
ALTER TABLE [dbo].[PedidoItens]  WITH CHECK ADD FOREIGN KEY([PedidoID])
REFERENCES [dbo].[Pedidos] ([PedidoID])
GO
ALTER TABLE [dbo].[PedidoItens]  WITH CHECK ADD FOREIGN KEY([ProdutoID])
REFERENCES [dbo].[Produtos] ([ProdutoID])
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD FOREIGN KEY([ClienteID])
REFERENCES [dbo].[Clientes] ([ClienteID])
GO
USE [master]
GO
ALTER DATABASE [Samples] SET  READ_WRITE 
GO
