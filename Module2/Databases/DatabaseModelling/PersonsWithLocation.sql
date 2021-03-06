USE [master]
GO
/****** Object:  Database [PersonWithLoacation]    Script Date: 9.10.2015 г. 19:18:04 ******/
CREATE DATABASE [PersonWithLoacation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PersonWithLoacation', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PersonWithLoacation.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PersonWithLoacation_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PersonWithLoacation_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PersonWithLoacation] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PersonWithLoacation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PersonWithLoacation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PersonWithLoacation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PersonWithLoacation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PersonWithLoacation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PersonWithLoacation] SET ARITHABORT OFF 
GO
ALTER DATABASE [PersonWithLoacation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PersonWithLoacation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PersonWithLoacation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PersonWithLoacation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PersonWithLoacation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PersonWithLoacation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PersonWithLoacation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PersonWithLoacation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PersonWithLoacation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PersonWithLoacation] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PersonWithLoacation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PersonWithLoacation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PersonWithLoacation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PersonWithLoacation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PersonWithLoacation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PersonWithLoacation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PersonWithLoacation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PersonWithLoacation] SET RECOVERY FULL 
GO
ALTER DATABASE [PersonWithLoacation] SET  MULTI_USER 
GO
ALTER DATABASE [PersonWithLoacation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PersonWithLoacation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PersonWithLoacation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PersonWithLoacation] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PersonWithLoacation] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PersonWithLoacation', N'ON'
GO
USE [PersonWithLoacation]
GO
/****** Object:  User [P0150N-NB\Slavcho]    Script Date: 9.10.2015 г. 19:18:04 ******/
CREATE USER [P0150N-NB\Slavcho] FOR LOGIN [P0150N-NB\Slavcho] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [P0150N-NB\Slavcho]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 9.10.2015 г. 19:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AddressText] [nvarchar](250) NULL,
	[TownId] [int] NOT NULL,
 CONSTRAINT [PK_address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Continent]    Script Date: 9.10.2015 г. 19:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Continent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Continent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 9.10.2015 г. 19:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[ContinentId] [int] NOT NULL,
 CONSTRAINT [PK_country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person]    Script Date: 9.10.2015 г. 19:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[AddressId] [int] NOT NULL,
 CONSTRAINT [PK_person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Town]    Script Date: 9.10.2015 г. 19:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Town](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_town] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([Id], [AddressText], [TownId]) VALUES (1, N'Tsarigratsho Shose str. 133', 1)
INSERT [dbo].[Address] ([Id], [AddressText], [TownId]) VALUES (2, N'Alabin str. 10', 1)
INSERT [dbo].[Address] ([Id], [AddressText], [TownId]) VALUES (3, N'Ideal petrov 10', 2)
SET IDENTITY_INSERT [dbo].[Address] OFF
SET IDENTITY_INSERT [dbo].[Continent] ON 

INSERT [dbo].[Continent] ([Id], [Name]) VALUES (1, N'Europe')
INSERT [dbo].[Continent] ([Id], [Name]) VALUES (2, N'Australia')
INSERT [dbo].[Continent] ([Id], [Name]) VALUES (3, N'Asia')
INSERT [dbo].[Continent] ([Id], [Name]) VALUES (4, N'Africa')
SET IDENTITY_INSERT [dbo].[Continent] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([Id], [Name], [ContinentId]) VALUES (1, N'Bulgaria', 1)
INSERT [dbo].[Country] ([Id], [Name], [ContinentId]) VALUES (2, N'France', 1)
INSERT [dbo].[Country] ([Id], [Name], [ContinentId]) VALUES (3, N'Germany', 1)
INSERT [dbo].[Country] ([Id], [Name], [ContinentId]) VALUES (4, N'Russia', 3)
INSERT [dbo].[Country] ([Id], [Name], [ContinentId]) VALUES (5, N'China', 3)
INSERT [dbo].[Country] ([Id], [Name], [ContinentId]) VALUES (6, N'Australia', 2)
SET IDENTITY_INSERT [dbo].[Country] OFF
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [AddressId]) VALUES (1, N'Ivan', N'Petrov', 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [AddressId]) VALUES (2, N'Mariyka', N'Petrov', 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [AddressId]) VALUES (3, N'Pesho', N'Georgiev', 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [AddressId]) VALUES (4, N'Penka', N'Vasileva', 3)
SET IDENTITY_INSERT [dbo].[Person] OFF
SET IDENTITY_INSERT [dbo].[Town] ON 

INSERT [dbo].[Town] ([Id], [Name], [CountryId]) VALUES (1, N'Sofia', 1)
INSERT [dbo].[Town] ([Id], [Name], [CountryId]) VALUES (2, N'Varna', 1)
INSERT [dbo].[Town] ([Id], [Name], [CountryId]) VALUES (3, N'Plovdiv', 1)
INSERT [dbo].[Town] ([Id], [Name], [CountryId]) VALUES (4, N'Parice', 2)
INSERT [dbo].[Town] ([Id], [Name], [CountryId]) VALUES (5, N'Moscow', 4)
INSERT [dbo].[Town] ([Id], [Name], [CountryId]) VALUES (6, N'Honk Kong', 5)
INSERT [dbo].[Town] ([Id], [Name], [CountryId]) VALUES (7, N'Sydney', 6)
SET IDENTITY_INSERT [dbo].[Town] OFF
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_address_town] FOREIGN KEY([TownId])
REFERENCES [dbo].[Town] ([Id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_address_town]
GO
ALTER TABLE [dbo].[Country]  WITH CHECK ADD  CONSTRAINT [FK_Country_Continent1] FOREIGN KEY([ContinentId])
REFERENCES [dbo].[Continent] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Country] CHECK CONSTRAINT [FK_Country_Continent1]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_person_address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_person_address]
GO
ALTER TABLE [dbo].[Town]  WITH CHECK ADD  CONSTRAINT [FK_town_country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[Town] CHECK CONSTRAINT [FK_town_country]
GO
USE [master]
GO
ALTER DATABASE [PersonWithLoacation] SET  READ_WRITE 
GO
