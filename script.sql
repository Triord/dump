USE [master]
GO
/****** Object:  Database [ecole]    Script Date: 22-06-20 18:12:55 ******/
CREATE DATABASE [ecole]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ecole', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ecole.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ecole_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ecole_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ecole] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ecole].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ecole] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ecole] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ecole] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ecole] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ecole] SET ARITHABORT OFF 
GO
ALTER DATABASE [ecole] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ecole] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ecole] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ecole] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ecole] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ecole] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ecole] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ecole] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ecole] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ecole] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ecole] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ecole] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ecole] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ecole] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ecole] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ecole] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ecole] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ecole] SET RECOVERY FULL 
GO
ALTER DATABASE [ecole] SET  MULTI_USER 
GO
ALTER DATABASE [ecole] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ecole] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ecole] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ecole] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ecole] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ecole', N'ON'
GO
ALTER DATABASE [ecole] SET QUERY_STORE = OFF
GO
USE [ecole]
GO
/****** Object:  Table [dbo].[amendeLivre]    Script Date: 22-06-20 18:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[amendeLivre](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dateDue] [date] NOT NULL,
	[dateRetour] [date] NULL,
	[idUtilisateur] [int] NULL,
	[idLivre] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[amendes]    Script Date: 22-06-20 18:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[amendes](
	[idAmende] [int] IDENTITY(1,1) NOT NULL,
	[dateAmende] [date] NULL,
	[delaiDepassement] [int] NULL,
	[montant] [decimal](6, 3) NULL,
	[idUtilisateur] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idAmende] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bibliotheques]    Script Date: 22-06-20 18:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bibliotheques](
	[idBibliot] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](250) NULL,
	[adresse] [varchar](250) NULL,
	[localisation] [varchar](300) NULL,
	[idManaG] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idBibliot] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[critiques]    Script Date: 22-06-20 18:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[critiques](
	[idCritique] [int] IDENTITY(1,1) NOT NULL,
	[commentaires] [varchar](250) NULL,
	[notes] [int] NULL,
	[idLivre] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCritique] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[echanges]    Script Date: 22-06-20 18:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[echanges](
	[idEchange] [int] IDENTITY(1,1) NOT NULL,
	[question] [varchar](300) NULL,
	[reponse] [varchar](300) NULL,
	[idUtilisateur] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idEchange] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exemplaires]    Script Date: 22-06-20 18:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exemplaires](
	[idExemplaire] [int] IDENTITY(1,1) NOT NULL,
	[etat] [bit] NULL,
	[idLivre] [int] NULL,
	[idBibliot] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idExemplaire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[livre]    Script Date: 22-06-20 18:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[livre](
	[idLivre] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](250) NULL,
	[isbn] [int] NOT NULL,
	[descriptif] [varchar](3000) NULL,
	[prix] [int] NULL,
	[edition] [varchar](250) NULL,
	[etat] [bit] NULL,
	[images] [varchar](max) NULL,
	[idExemplaire] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idLivre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[livreLouer]    Script Date: 22-06-20 18:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[livreLouer](
	[idLocation] [int] NULL,
	[idLivre] [int] NULL,
	[montant] [float] NULL,
	[prix] [float] NULL,
	[quantité] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[locations]    Script Date: 22-06-20 18:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[locations](
	[idLocation] [int] IDENTITY(1,1) NOT NULL,
	[dDebutLocation] [date] NULL,
	[dFinLocation] [date] NULL,
	[dateLocation] [date] NULL,
	[idUtilisateur] [int] NULL,
	[priceTotal] [decimal](6, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idLocation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[manaGeneral]    Script Date: 22-06-20 18:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manaGeneral](
	[idManaG] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](250) NULL,
	[prenom] [varchar](250) NULL,
	[ddn] [date] NULL,
	[numNat] [varchar](250) NULL,
	[email] [varchar](250) NULL,
	[mdp] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[idManaG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[question]    Script Date: 22-06-20 18:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question](
	[idQuestion] [int] IDENTITY(1,1) NOT NULL,
	[dateQuestion] [date] NULL,
	[titre] [varchar](250) NULL,
	[contenu] [varchar](250) NULL,
	[idLecteur] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idQuestion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[redevances]    Script Date: 22-06-20 18:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[redevances](
	[idRedevance] [int] IDENTITY(1,1) NOT NULL,
	[datePaiementRedevance] [date] NULL,
	[dateFinRedevance] [date] NULL,
	[montant] [decimal](6, 3) NULL,
	[idUtilisateur] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idRedevance] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reponse]    Script Date: 22-06-20 18:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reponse](
	[idReponse] [int] IDENTITY(1,1) NOT NULL,
	[idQuestion] [int] NULL,
	[dateReponse] [date] NULL,
	[contenu] [varchar](250) NULL,
	[idAdmin] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idReponse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 22-06-20 18:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[idRole] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[idRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roleUser]    Script Date: 22-06-20 18:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roleUser](
	[idUtilisateur] [int] NULL,
	[idRole] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userLoc]    Script Date: 22-06-20 18:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userLoc](
	[idLocation] [int] NULL,
	[idLivre] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[utilisateurs]    Script Date: 22-06-20 18:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[utilisateurs](
	[idUtilisateur] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](250) NOT NULL,
	[prenom] [varchar](250) NOT NULL,
	[ddn] [date] NOT NULL,
	[numNat] [varchar](250) NOT NULL,
	[email] [varchar](250) NOT NULL,
	[mdp] [varchar](250) NOT NULL,
	[username] [varchar](20) NULL,
	[etat] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idUtilisateur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[amendes] ON 

INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (57, CAST(N'2020-02-06' AS Date), 28, CAST(14.000 AS Decimal(6, 3)), 64)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (58, CAST(N'2020-02-06' AS Date), 28, CAST(14.000 AS Decimal(6, 3)), 64)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (59, CAST(N'2020-02-06' AS Date), 28, CAST(14.000 AS Decimal(6, 3)), 64)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (60, CAST(N'2020-02-06' AS Date), 21, CAST(10.000 AS Decimal(6, 3)), NULL)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (61, CAST(N'2020-06-22' AS Date), -15, CAST(-7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (62, CAST(N'2020-06-22' AS Date), -15, CAST(-7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (63, CAST(N'2020-06-22' AS Date), -15, CAST(-7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (64, CAST(N'2020-06-22' AS Date), -15, CAST(-7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (65, CAST(N'2020-06-22' AS Date), -15, CAST(-7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (66, CAST(N'2020-06-22' AS Date), -15, CAST(-7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (67, CAST(N'2020-06-22' AS Date), -15, CAST(-7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (68, CAST(N'2020-06-22' AS Date), -15, CAST(-7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (69, CAST(N'2020-06-22' AS Date), -15, CAST(-7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (70, CAST(N'2020-06-22' AS Date), -15, CAST(7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (71, CAST(N'2020-06-22' AS Date), -15, CAST(7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (72, CAST(N'2020-06-22' AS Date), -15, CAST(7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (73, CAST(N'2020-06-22' AS Date), -15, CAST(7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (74, CAST(N'2020-06-22' AS Date), -15, CAST(7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (75, CAST(N'2020-06-22' AS Date), -15, CAST(7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (76, CAST(N'2020-06-22' AS Date), -15, CAST(7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (77, CAST(N'2020-06-22' AS Date), -15, CAST(7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (78, CAST(N'2020-06-22' AS Date), -15, CAST(7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (79, CAST(N'2020-06-22' AS Date), -15, CAST(7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (80, CAST(N'2020-06-22' AS Date), -15, CAST(7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (81, CAST(N'2020-06-22' AS Date), -15, CAST(7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (82, CAST(N'2020-06-22' AS Date), -15, CAST(7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (83, CAST(N'2020-06-22' AS Date), -15, CAST(7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (84, CAST(N'2020-06-22' AS Date), -15, CAST(7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (85, CAST(N'2020-06-22' AS Date), -15, CAST(7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (86, CAST(N'2020-06-22' AS Date), -15, CAST(7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (87, CAST(N'2020-06-22' AS Date), -15, CAST(7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (88, CAST(N'2020-06-22' AS Date), -15, CAST(7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (89, CAST(N'2020-06-22' AS Date), -15, CAST(7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (90, CAST(N'2020-06-22' AS Date), -15, CAST(7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (91, CAST(N'2020-06-22' AS Date), -15, CAST(7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (92, CAST(N'2020-06-22' AS Date), -15, CAST(7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (93, CAST(N'2020-06-22' AS Date), -15, CAST(7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (94, CAST(N'2020-06-22' AS Date), -15, CAST(7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (95, CAST(N'2020-06-22' AS Date), -15, CAST(7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (96, CAST(N'2020-06-22' AS Date), -15, CAST(7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (97, CAST(N'2020-06-22' AS Date), -15, CAST(7.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (98, CAST(N'2020-06-22' AS Date), -17, CAST(8.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (99, CAST(N'2020-06-22' AS Date), -17, CAST(8.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (100, CAST(N'2020-06-22' AS Date), -17, CAST(8.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (101, CAST(N'2020-06-22' AS Date), -17, CAST(8.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (102, CAST(N'2020-06-22' AS Date), -17, CAST(8.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (103, CAST(N'2020-06-22' AS Date), 17, CAST(8.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (104, CAST(N'2020-06-22' AS Date), 17, CAST(8.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (105, CAST(N'2020-06-22' AS Date), 17, CAST(8.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (106, CAST(N'2020-06-22' AS Date), 17, CAST(8.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[amendes] ([idAmende], [dateAmende], [delaiDepassement], [montant], [idUtilisateur]) VALUES (107, CAST(N'2020-06-22' AS Date), 17, CAST(8.000 AS Decimal(6, 3)), 63)
SET IDENTITY_INSERT [dbo].[amendes] OFF
SET IDENTITY_INSERT [dbo].[bibliotheques] ON 

INSERT [dbo].[bibliotheques] ([idBibliot], [nom], [adresse], [localisation], [idManaG]) VALUES (1, N'maBibl', N'rue marchand', N'bruxelles', NULL)
INSERT [dbo].[bibliotheques] ([idBibliot], [nom], [adresse], [localisation], [idManaG]) VALUES (2, N'bibtest', N'rue test', N'villetest', NULL)
INSERT [dbo].[bibliotheques] ([idBibliot], [nom], [adresse], [localisation], [idManaG]) VALUES (1002, N'drgsrthhhhhhhhhhhh', NULL, NULL, NULL)
INSERT [dbo].[bibliotheques] ([idBibliot], [nom], [adresse], [localisation], [idManaG]) VALUES (1003, N'bibtest', N'rue test', N'villetest', NULL)
INSERT [dbo].[bibliotheques] ([idBibliot], [nom], [adresse], [localisation], [idManaG]) VALUES (1004, N'biblique', N'rue des catho', N'chappelle les herlemonts', 1)
INSERT [dbo].[bibliotheques] ([idBibliot], [nom], [adresse], [localisation], [idManaG]) VALUES (1005, N'vhez roger', N'rue jean je test', N'belgique', NULL)
SET IDENTITY_INSERT [dbo].[bibliotheques] OFF
SET IDENTITY_INSERT [dbo].[critiques] ON 

INSERT [dbo].[critiques] ([idCritique], [commentaires], [notes], [idLivre]) VALUES (1, N'cest nul', 20, 1008)
INSERT [dbo].[critiques] ([idCritique], [commentaires], [notes], [idLivre]) VALUES (2, N'cest bien', 18, 1)
INSERT [dbo].[critiques] ([idCritique], [commentaires], [notes], [idLivre]) VALUES (3, N'cest bien', 18, 1)
INSERT [dbo].[critiques] ([idCritique], [commentaires], [notes], [idLivre]) VALUES (4, N'cest cool', 15, 1)
SET IDENTITY_INSERT [dbo].[critiques] OFF
SET IDENTITY_INSERT [dbo].[exemplaires] ON 

INSERT [dbo].[exemplaires] ([idExemplaire], [etat], [idLivre], [idBibliot]) VALUES (1, 1, 3, NULL)
INSERT [dbo].[exemplaires] ([idExemplaire], [etat], [idLivre], [idBibliot]) VALUES (2, 1, NULL, NULL)
INSERT [dbo].[exemplaires] ([idExemplaire], [etat], [idLivre], [idBibliot]) VALUES (5, 0, 1, 2)
INSERT [dbo].[exemplaires] ([idExemplaire], [etat], [idLivre], [idBibliot]) VALUES (6, 0, 1, 2)
INSERT [dbo].[exemplaires] ([idExemplaire], [etat], [idLivre], [idBibliot]) VALUES (7, 0, 1, 2)
INSERT [dbo].[exemplaires] ([idExemplaire], [etat], [idLivre], [idBibliot]) VALUES (8, 0, 1, 2)
SET IDENTITY_INSERT [dbo].[exemplaires] OFF
SET IDENTITY_INSERT [dbo].[livre] ON 

INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1, N'tintin', 123456, N'les aventures de tintin', 7, N'Herge', 0, NULL, 1, 95)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (3, N'livre1', 1, N'suivez les aventure de tintin qui se promenent dans les bois avec le capitaine haddock qui du coup a le mal de terre lol ', 0, NULL, 1, NULL, NULL, 0)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1003, N'livre2', 1, N'suivez les aventure de tintin qui se promenent dans les bois avec le capitaine haddock qui du coup a le mal de terre lol ', 0, NULL, 0, NULL, NULL, 98)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1004, N'livre3', 1, N'suivez les aventure de tintin qui se promenent dans les bois avec le capitaine haddock qui du coup a le mal de terre lol ', 0, NULL, 0, NULL, NULL, 100)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1005, N'livre4', 1, N'suivez les aventure de tintin qui se promenent dans les bois avec le capitaine haddock qui du coup a le mal de terre lol ', 0, NULL, 0, NULL, NULL, 99)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1006, N'livre5', 1, N'suivez les aventure de tintin qui se promenent dans les bois avec le capitaine haddock qui du coup a le mal de terre lol ', 0, NULL, 0, NULL, NULL, 97)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1007, N'livre6', 1, N'suivez les aventure de tintin qui se promenent dans les bois avec le capitaine haddock qui du coup a le mal de terre lol ', 0, NULL, 0, NULL, NULL, 100)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1008, N'livre7', 1, N'suivez les aventure de tintin qui se promenent dans les bois avec le capitaine haddock qui du coup a le mal de terre lol ', 0, NULL, 0, NULL, NULL, 100)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1009, N'les aventures de ', 1, N'suivez les aventure de tintin qui se promenent dans les bois avec le capitaine haddock qui du coup a le mal de terre lol ', 10, N'le ', 0, NULL, NULL, 100)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1010, N'livre8', 1, N'suivez les aventure de tintin qui se promenent dans les bois avec le capitaine haddock qui du coup a le mal de terre lol ', 10, N'le ', 0, NULL, NULL, 99)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1011, N'livre9', 1, N'suivez les aventure de tintin qui se promenent dans les bois avec le capitaine haddock qui du coup a le mal de terre lol ', 10, N'le ', 0, NULL, NULL, 100)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1012, N'livre10', 1, N'suivez les aventure de tintin qui se promenent dans les bois avec le capitaine haddock qui du coup a le mal de terre lol ', 10, N'le ', 0, NULL, NULL, 99)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1013, N'livre11', 123456, N'suivez les aventure de tintin qui se promenent dans les bois avec le capitaine haddock qui du coup a le mal de terre lol ', 7, N'editionTest', 0, NULL, NULL, 99)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1014, N'livre12', 123456, N'suivez les aventure de tintin qui se promenent dans les bois avec le capitaine haddock qui du coup a le mal de terre lol ', 7, N'editionTest', 0, NULL, NULL, 100)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1015, N'livre13', 123456, N'suivez les aventure de tintin qui se promenent dans les bois avec le capitaine haddock qui du coup a le mal de terre lol ', 7, N'editionTest', 0, NULL, NULL, 100)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1016, N'livre14', 123456, N'suivez les aventure de tintin qui se promenent dans les bois avec le capitaine haddock qui du coup a le mal de terre lol ', 7, N'editionTest', 0, NULL, NULL, 100)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1017, N'livre15', 123456, N'suivez les aventure de tintin qui se promenent dans les bois avec le capitaine haddock qui du coup a le mal de terre lol ', 7, N'editionTest', 0, NULL, NULL, 101)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1018, N'livre16', 123456, N'suivez les aventure de tintin qui se promenent dans les bois avec le capitaine haddock qui du coup a le mal de terre lol ', 7, N'editionTest', 0, NULL, NULL, 101)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1019, N'livre17', 123456, N'suivez les aventure de tintin qui se promenent dans les bois avec le capitaine haddock qui du coup a le mal de terre lol ', 7, N'editionTest', 0, NULL, NULL, 100)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1020, N'livre18', 123456, N'suivez les aventure de tintin qui se promenent dans les bois avec le capitaine haddock qui du coup a le mal de terre lol ', 7, N'editionTest', 0, NULL, NULL, 99)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1021, N'livre19', 123456, N'suivez les aventure de tintin qui se promenent dans les bois avec le capitaine haddock qui du coup a le mal de terre lol ', 7, N'editionTest', 0, NULL, NULL, 100)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1022, N'livre20', 1, N'suivez les aventure de tintin qui se promenent dans les bois avec le capitaine haddock qui du coup a le mal de terre lol ', 34, N'2', 0, NULL, NULL, 100)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1023, N'livre21', 1, N'suivez les aventure de tintin qui se promenent dans les bois avec le capitaine haddock qui du coup a le mal de terre lol ', 25, N'1', 0, NULL, NULL, 99)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1057, N'ubebr', 1, N'suivez les aventure de tintin qui se promenent dans les bois avec le capitaine haddock qui du coup a le mal de terre lol ', 0, NULL, 0, NULL, NULL, 100)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1058, N'alladin', 1, N'suivez les aventure de tintin qui se promenent dans les bois avec le capitaine haddock qui du coup a le mal de terre lol ', 7, N'herge', 0, NULL, NULL, 83)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1059, N'nomLivre', 1, N'suivez les aventure de tintin qui se promenent dans les bois avec le capitaine haddock qui du coup a le mal de terre lol ', 10, N'editionLivre', 0, NULL, NULL, 100)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1064, N'img', 1564161, N'suivez les aventure de tintin qui se promenent dans les bois avec le capitaine haddock qui du coup a le mal de terre lol ', 50, N'img', 0, N'null', NULL, 100)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1065, N'fubvae', 123456, N'les aventures de tintin', 7, N'ioqdfi', 0, NULL, NULL, 100)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1067, N'ast', 1, NULL, 0, NULL, 0, NULL, NULL, 100)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1068, N'asteri', 1, NULL, 0, NULL, 0, NULL, NULL, 100)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1069, N'asteri', 1, NULL, 0, NULL, 0, NULL, NULL, 100)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1070, N'asteri', 1235, NULL, 0, NULL, 0, NULL, NULL, 99)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1071, N'asteri', 1, NULL, 0, NULL, 0, NULL, NULL, 100)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1072, N'asteri', 1235, NULL, 0, NULL, 0, NULL, NULL, 100)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1073, N'astri', 1, NULL, 0, NULL, 0, NULL, NULL, 100)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1074, N'astri', 12355, NULL, 0, NULL, 0, NULL, NULL, 100)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1075, N'ast', 1, NULL, 0, NULL, 0, NULL, NULL, 100)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1076, N'astri', 12355, NULL, 0, NULL, 0, NULL, NULL, 98)
INSERT [dbo].[livre] ([idLivre], [nom], [isbn], [descriptif], [prix], [edition], [etat], [images], [idExemplaire], [quantity]) VALUES (1077, N'ast', 1, NULL, 0, NULL, 0, NULL, NULL, 100)
SET IDENTITY_INSERT [dbo].[livre] OFF
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (131, 3, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (131, 1, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (186, 3, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (187, 1003, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (188, 1017, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (189, 1006, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (190, 1070, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (191, 1005, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (192, 1076, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (193, 1010, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (194, 1013, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (195, 1023, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (196, 1006, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (197, 1003, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (198, 1011, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (199, 1012, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (200, 1076, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (138, 1057, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (138, 1016, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (201, 1006, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (202, 1020, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (146, 1, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (146, 3, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (147, 3, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (147, 1, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (148, 3, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (148, 1, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (149, 1, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (149, 3, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (150, 1, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (150, 3, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (151, 1, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (151, 3, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (152, 1, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (152, 3, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (153, 1, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (153, 3, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (154, 1, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (154, 3, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (155, 1, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (155, 3, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (156, 1012, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (156, 1010, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (157, 1018, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (157, 1012, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (158, 1058, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (159, 1006, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (159, 1064, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (160, 1067, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (160, 1058, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (161, 1058, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (162, 1018, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (163, 1065, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (163, 1018, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (163, 1058, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (164, 1058, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (164, 1011, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (165, 1058, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (166, 1058, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (167, 1058, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (168, 1058, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (169, 1058, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (171, 1058, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (173, 1058, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (141, 1, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (141, 1012, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (143, 1010, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (144, 1014, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (144, 1015, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (176, 1058, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (177, 1058, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (178, 1058, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (179, 1058, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (182, 1, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (183, 1, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (184, 1058, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (184, 1, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (185, 1058, NULL, NULL, NULL)
INSERT [dbo].[livreLouer] ([idLocation], [idLivre], [montant], [prix], [quantité]) VALUES (185, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[locations] ON 

INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (131, CAST(N'2020-06-09' AS Date), CAST(N'2020-06-04' AS Date), CAST(N'2020-06-08' AS Date), 63, CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (138, CAST(N'2020-06-12' AS Date), CAST(N'2020-07-11' AS Date), CAST(N'2020-06-11' AS Date), 63, CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (141, CAST(N'2020-06-13' AS Date), CAST(N'2020-07-12' AS Date), CAST(N'2020-06-12' AS Date), 63, CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (143, CAST(N'2020-06-16' AS Date), CAST(N'2020-07-15' AS Date), CAST(N'2020-06-15' AS Date), 63, CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (144, CAST(N'2020-06-16' AS Date), CAST(N'2020-07-15' AS Date), CAST(N'2020-06-15' AS Date), 63, CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (146, CAST(N'2020-06-21' AS Date), CAST(N'2020-07-20' AS Date), CAST(N'2020-06-20' AS Date), 63, CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (147, CAST(N'2020-06-21' AS Date), CAST(N'2020-07-20' AS Date), CAST(N'2020-06-20' AS Date), 63, CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (148, CAST(N'2020-06-21' AS Date), CAST(N'2020-07-20' AS Date), CAST(N'2020-06-20' AS Date), 63, CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (149, CAST(N'2020-06-21' AS Date), CAST(N'2020-07-20' AS Date), CAST(N'2020-06-20' AS Date), 63, CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (150, CAST(N'2020-06-21' AS Date), CAST(N'2020-07-20' AS Date), CAST(N'2020-06-20' AS Date), 63, CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (151, CAST(N'2020-06-21' AS Date), CAST(N'2020-07-20' AS Date), CAST(N'2020-06-20' AS Date), 63, CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (152, CAST(N'2020-06-21' AS Date), CAST(N'2020-07-20' AS Date), CAST(N'2020-06-20' AS Date), 63, CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (153, CAST(N'2020-06-21' AS Date), CAST(N'2020-07-20' AS Date), CAST(N'2020-06-20' AS Date), 63, CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (154, CAST(N'2020-06-21' AS Date), CAST(N'2020-07-20' AS Date), CAST(N'2020-06-20' AS Date), 63, CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (155, CAST(N'2020-06-21' AS Date), CAST(N'2020-07-20' AS Date), CAST(N'2020-06-20' AS Date), 63, CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (156, CAST(N'2020-06-21' AS Date), CAST(N'2020-07-20' AS Date), CAST(N'2020-06-20' AS Date), 63, CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (157, CAST(N'2020-06-21' AS Date), CAST(N'2020-07-20' AS Date), CAST(N'2020-06-20' AS Date), 63, CAST(18.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (158, CAST(N'2020-06-21' AS Date), CAST(N'2020-07-20' AS Date), CAST(N'2020-06-20' AS Date), 63, CAST(7.50 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (159, CAST(N'2020-06-21' AS Date), CAST(N'2020-07-20' AS Date), CAST(N'2020-06-20' AS Date), 63, CAST(50.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (160, CAST(N'2020-06-21' AS Date), CAST(N'2020-07-20' AS Date), CAST(N'2020-06-20' AS Date), 63, CAST(82.50 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (161, CAST(N'2020-06-21' AS Date), CAST(N'2020-07-20' AS Date), CAST(N'2020-06-20' AS Date), 63, CAST(7.50 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (162, CAST(N'2020-06-22' AS Date), CAST(N'2020-07-21' AS Date), CAST(N'2020-06-21' AS Date), 63, CAST(7.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (163, CAST(N'2020-06-22' AS Date), CAST(N'2020-07-21' AS Date), CAST(N'2020-06-21' AS Date), 63, CAST(21.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (164, CAST(N'2020-06-22' AS Date), CAST(N'2020-07-21' AS Date), CAST(N'2020-06-21' AS Date), 63, CAST(17.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (165, CAST(N'2020-06-22' AS Date), CAST(N'2020-07-21' AS Date), CAST(N'2020-06-21' AS Date), 63, CAST(7.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (166, CAST(N'2020-06-22' AS Date), CAST(N'2020-07-21' AS Date), CAST(N'2020-06-21' AS Date), NULL, CAST(7.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (167, CAST(N'2020-06-22' AS Date), CAST(N'2020-07-21' AS Date), CAST(N'2020-06-21' AS Date), NULL, CAST(7.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (168, CAST(N'2020-06-22' AS Date), CAST(N'2020-07-21' AS Date), CAST(N'2020-06-21' AS Date), NULL, CAST(7.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (169, CAST(N'2020-06-22' AS Date), CAST(N'2020-07-21' AS Date), CAST(N'2020-06-21' AS Date), NULL, CAST(7.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (171, CAST(N'2020-06-22' AS Date), CAST(N'2020-07-21' AS Date), CAST(N'2020-06-21' AS Date), 63, CAST(7.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (173, CAST(N'2020-06-22' AS Date), CAST(N'2020-07-21' AS Date), CAST(N'2020-06-21' AS Date), 63, CAST(7.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (176, CAST(N'2020-06-22' AS Date), CAST(N'2020-07-21' AS Date), CAST(N'2020-06-21' AS Date), 63, CAST(7.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (177, CAST(N'2020-06-22' AS Date), CAST(N'2020-07-21' AS Date), CAST(N'2020-06-21' AS Date), 63, CAST(7.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (178, CAST(N'2020-06-22' AS Date), CAST(N'2020-07-21' AS Date), CAST(N'2020-06-21' AS Date), 63, CAST(7.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (179, CAST(N'2020-06-22' AS Date), CAST(N'2020-07-21' AS Date), CAST(N'2020-06-21' AS Date), 63, CAST(7.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (182, CAST(N'2020-06-22' AS Date), CAST(N'2020-07-21' AS Date), CAST(N'2020-06-21' AS Date), 63, CAST(7.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (183, CAST(N'2020-06-22' AS Date), CAST(N'2020-07-21' AS Date), CAST(N'2020-06-21' AS Date), 63, CAST(7.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (184, CAST(N'2020-06-22' AS Date), CAST(N'2020-07-21' AS Date), CAST(N'2020-06-21' AS Date), 63, CAST(14.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (185, CAST(N'2020-06-22' AS Date), CAST(N'2020-07-21' AS Date), CAST(N'2020-06-21' AS Date), 63, CAST(14.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (186, CAST(N'2020-06-22' AS Date), CAST(N'2020-07-21' AS Date), CAST(N'2020-06-21' AS Date), 63, CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (187, CAST(N'2020-06-23' AS Date), CAST(N'2020-07-22' AS Date), CAST(N'2020-06-22' AS Date), 63, CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (188, CAST(N'2020-06-23' AS Date), CAST(N'2020-07-22' AS Date), CAST(N'2020-06-22' AS Date), 63, CAST(7.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (189, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (190, CAST(N'2020-06-23' AS Date), CAST(N'2020-07-22' AS Date), CAST(N'2020-06-22' AS Date), 63, CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (191, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (192, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (193, CAST(N'2020-06-23' AS Date), CAST(N'2020-07-22' AS Date), CAST(N'2020-06-22' AS Date), 63, CAST(10.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (194, CAST(N'2020-06-23' AS Date), CAST(N'2020-07-22' AS Date), CAST(N'2020-06-22' AS Date), 63, CAST(7.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (195, CAST(N'2020-06-23' AS Date), CAST(N'2020-07-22' AS Date), CAST(N'2020-06-22' AS Date), 63, CAST(25.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (196, CAST(N'2020-06-23' AS Date), CAST(N'2020-07-22' AS Date), CAST(N'2020-06-22' AS Date), 63, CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (197, CAST(N'2020-06-23' AS Date), CAST(N'2020-07-22' AS Date), CAST(N'2020-06-22' AS Date), 63, CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (198, CAST(N'2020-06-23' AS Date), CAST(N'2020-07-22' AS Date), CAST(N'2020-06-22' AS Date), 63, CAST(10.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (199, CAST(N'2020-06-23' AS Date), CAST(N'2020-07-22' AS Date), CAST(N'2020-06-22' AS Date), 95, CAST(10.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (200, CAST(N'2020-06-23' AS Date), CAST(N'2020-07-22' AS Date), CAST(N'2020-06-22' AS Date), 95, CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (201, CAST(N'2020-06-23' AS Date), CAST(N'2020-07-22' AS Date), CAST(N'2020-06-22' AS Date), 95, CAST(0.00 AS Decimal(6, 2)))
INSERT [dbo].[locations] ([idLocation], [dDebutLocation], [dFinLocation], [dateLocation], [idUtilisateur], [priceTotal]) VALUES (202, CAST(N'2020-06-23' AS Date), CAST(N'2020-07-22' AS Date), CAST(N'2020-06-22' AS Date), 95, CAST(7.00 AS Decimal(6, 2)))
SET IDENTITY_INSERT [dbo].[locations] OFF
SET IDENTITY_INSERT [dbo].[manaGeneral] ON 

INSERT [dbo].[manaGeneral] ([idManaG], [nom], [prenom], [ddn], [numNat], [email], [mdp]) VALUES (1, N'chef', N'chef', CAST(N'1970-10-06' AS Date), N'70061016165', N'chef@hotmail.com', N'chef')
SET IDENTITY_INSERT [dbo].[manaGeneral] OFF
SET IDENTITY_INSERT [dbo].[question] ON 

INSERT [dbo].[question] ([idQuestion], [dateQuestion], [titre], [contenu], [idLecteur]) VALUES (1, CAST(N'2020-02-05' AS Date), N'Mon livre n''apparait pas', N'je ne trouve pas mon livre sur le site', 64)
INSERT [dbo].[question] ([idQuestion], [dateQuestion], [titre], [contenu], [idLecteur]) VALUES (2, CAST(N'2020-02-05' AS Date), N'Mon livre n''apparait pas', N'je ne trouve pas mon livre ', 64)
SET IDENTITY_INSERT [dbo].[question] OFF
SET IDENTITY_INSERT [dbo].[redevances] ON 

INSERT [dbo].[redevances] ([idRedevance], [datePaiementRedevance], [dateFinRedevance], [montant], [idUtilisateur]) VALUES (1, CAST(N'2020-02-06' AS Date), CAST(N'2021-02-05' AS Date), CAST(0.000 AS Decimal(6, 3)), 63)
INSERT [dbo].[redevances] ([idRedevance], [datePaiementRedevance], [dateFinRedevance], [montant], [idUtilisateur]) VALUES (2, CAST(N'2020-02-09' AS Date), CAST(N'2021-02-08' AS Date), CAST(25.500 AS Decimal(6, 3)), 63)
SET IDENTITY_INSERT [dbo].[redevances] OFF
SET IDENTITY_INSERT [dbo].[reponse] ON 

INSERT [dbo].[reponse] ([idReponse], [idQuestion], [dateReponse], [contenu], [idAdmin]) VALUES (1, 1, CAST(N'2020-02-05' AS Date), N'avez vous essayez de debranchez et de rebranchez votre box?', 64)
INSERT [dbo].[reponse] ([idReponse], [idQuestion], [dateReponse], [contenu], [idAdmin]) VALUES (2, NULL, CAST(N'2020-02-05' AS Date), N'avez vous essayez d''ouvrir les yeux?', 63)
INSERT [dbo].[reponse] ([idReponse], [idQuestion], [dateReponse], [contenu], [idAdmin]) VALUES (3, 2, CAST(N'2020-02-05' AS Date), N'avez vous essayez d''ouvrir les yeux?', 63)
SET IDENTITY_INSERT [dbo].[reponse] OFF
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([idRole], [nom]) VALUES (1, N'lecteur')
INSERT [dbo].[roles] ([idRole], [nom]) VALUES (2, N'bibliothequaire')
INSERT [dbo].[roles] ([idRole], [nom]) VALUES (3, N'manaBiblio')
INSERT [dbo].[roles] ([idRole], [nom]) VALUES (4, N'manaGeneral')
SET IDENTITY_INSERT [dbo].[roles] OFF
INSERT [dbo].[roleUser] ([idUtilisateur], [idRole]) VALUES (64, 2)
INSERT [dbo].[roleUser] ([idUtilisateur], [idRole]) VALUES (91, 1)
INSERT [dbo].[roleUser] ([idUtilisateur], [idRole]) VALUES (94, 1)
INSERT [dbo].[roleUser] ([idUtilisateur], [idRole]) VALUES (95, 1)
INSERT [dbo].[roleUser] ([idUtilisateur], [idRole]) VALUES (96, 1)
INSERT [dbo].[roleUser] ([idUtilisateur], [idRole]) VALUES (97, 1)
INSERT [dbo].[roleUser] ([idUtilisateur], [idRole]) VALUES (98, 1)
INSERT [dbo].[roleUser] ([idUtilisateur], [idRole]) VALUES (99, 1)
INSERT [dbo].[roleUser] ([idUtilisateur], [idRole]) VALUES (100, 1)
INSERT [dbo].[roleUser] ([idUtilisateur], [idRole]) VALUES (101, 2)
INSERT [dbo].[roleUser] ([idUtilisateur], [idRole]) VALUES (102, 1)
INSERT [dbo].[roleUser] ([idUtilisateur], [idRole]) VALUES (103, 1)
INSERT [dbo].[roleUser] ([idUtilisateur], [idRole]) VALUES (95, 1)
INSERT [dbo].[roleUser] ([idUtilisateur], [idRole]) VALUES (63, 4)
SET IDENTITY_INSERT [dbo].[utilisateurs] ON 

INSERT [dbo].[utilisateurs] ([idUtilisateur], [nom], [prenom], [ddn], [numNat], [email], [mdp], [username], [etat]) VALUES (63, N'chef', N'chef', CAST(N'1970-05-25' AS Date), N'70052514532', N'lechef@gmail.com', N'$2a$12$IJWoDsH2LO5h2AQC02NCdufXcAQ1zty0SYVPO9NuVnB04iskASpge', N'sous-chef', 1)
INSERT [dbo].[utilisateurs] ([idUtilisateur], [nom], [prenom], [ddn], [numNat], [email], [mdp], [username], [etat]) VALUES (64, N'test', N't', CAST(N'1996-09-25' AS Date), N'960920', N't', N'$2a$12$HXf/soN/97pWRN9FJUCa0OODDqdZwg6SQ6DbWQNajfjmfW2dP9Dvm', N'usere', 0)
INSERT [dbo].[utilisateurs] ([idUtilisateur], [nom], [prenom], [ddn], [numNat], [email], [mdp], [username], [etat]) VALUES (91, N'eriu', N'ihcinozebiu', CAST(N'2012-06-18' AS Date), N'25499226926', N'iuetygvsdfnuvsdf', N'$2a$12$CrD9wwZBFV/s8Ti5nRuTlupg7rDg1bEIz6MyJgJZNTXzbNB.x4TLe', N'testamerelaputeuhh', 0)
INSERT [dbo].[utilisateurs] ([idUtilisateur], [nom], [prenom], [ddn], [numNat], [email], [mdp], [username], [etat]) VALUES (94, N'jesuisunnom', N'jesuisunprenom', CAST(N'2001-12-31' AS Date), N'55884485448', N'test@gmail.com', N'$2a$12$Qoy2tqgoaduLT76ugjJXMu/Au86T4H25LTwKhdPiWSLB6Wd6x15D2', N'letristan', 0)
INSERT [dbo].[utilisateurs] ([idUtilisateur], [nom], [prenom], [ddn], [numNat], [email], [mdp], [username], [etat]) VALUES (95, N'v', N'v', CAST(N'1970-05-25' AS Date), N'70052514532', N'test', N'$2a$12$uysYrgpWoUVEoPkTKkSvVufQwVbSU.FyeVZbYOAwzTVFHzow9FUWm', N'v', 0)
INSERT [dbo].[utilisateurs] ([idUtilisateur], [nom], [prenom], [ddn], [numNat], [email], [mdp], [username], [etat]) VALUES (96, N'biblio', N'biblio', CAST(N'2004-10-10' AS Date), N'15656151951', N'bibliothecaire@gmail.com', N'$2a$12$JoYEJUwmGRb1ANPBxoJOEernddaf2uSwo.7m/9yAthin4GOeF4bOW', N'bibliothecaire', 0)
INSERT [dbo].[utilisateurs] ([idUtilisateur], [nom], [prenom], [ddn], [numNat], [email], [mdp], [username], [etat]) VALUES (97, N'biblioth', N'bibliogj', CAST(N'2004-10-10' AS Date), N'15656151951555', N'bibliothequaire@gmail.com', N'$2a$12$pYdE/9Hj5iRmTqAi3KXjoOmVuNSB./EX9r47yLZNGfX4ltyiH.zX.', N'bibliothequaire', 0)
INSERT [dbo].[utilisateurs] ([idUtilisateur], [nom], [prenom], [ddn], [numNat], [email], [mdp], [username], [etat]) VALUES (98, N'idfnonj', N'nzoroton', CAST(N'2001-02-20' AS Date), N'84951895151', N'gyaudi@gmail.com', N'$2a$12$YjYONX7zETbdR4rw6A.IW.vjE6QiuNEpIcw4WXkTZgCd3Odiioj96', N'usernaaamemme', 0)
INSERT [dbo].[utilisateurs] ([idUtilisateur], [nom], [prenom], [ddn], [numNat], [email], [mdp], [username], [etat]) VALUES (99, N'hzefuh', N'buhrni', CAST(N'2004-10-10' AS Date), N'151551', N'ugfdgiu@gmail.com', N'$2a$12$qpMR6k/rtypkxFilHMnYG.mJYj9rLkP1wRqJWmtDFo7j4J6LSHwvm', N'jesuhid', 0)
INSERT [dbo].[utilisateurs] ([idUtilisateur], [nom], [prenom], [ddn], [numNat], [email], [mdp], [username], [etat]) VALUES (100, N'dhfuu', N'reconnaissable', CAST(N'1970-05-25' AS Date), N'70052514532', N'lecf@gmail.com', N'$2a$12$oTFsd3qf0bryQW9iOiwjBO/646.5BoQx2ibPHVxYzEBVNEUvRkuzC', N'ihrfhv-chef', 0)
INSERT [dbo].[utilisateurs] ([idUtilisateur], [nom], [prenom], [ddn], [numNat], [email], [mdp], [username], [etat]) VALUES (101, N'test', N'recoissable', CAST(N'1970-05-25' AS Date), N'70052514532', N'lcf@gmail.com', N'$2a$12$85WEfHYmTy1tQXj6EGGoZuMLRgy.oRcSm9D8J/k2cyYGtYQ3712vC', N'test-chef', 0)
INSERT [dbo].[utilisateurs] ([idUtilisateur], [nom], [prenom], [ddn], [numNat], [email], [mdp], [username], [etat]) VALUES (102, N'registername', N'registerprenom', CAST(N'2010-10-10' AS Date), N'111111111', N'register@gmail.com', N'$2a$12$RTRxvzrtOhzNhYtmVmjRLeaITLzrQ6.qEf9rVkJHu0ix0z1A0Qb.6', N'usernameregister', 0)
INSERT [dbo].[utilisateurs] ([idUtilisateur], [nom], [prenom], [ddn], [numNat], [email], [mdp], [username], [etat]) VALUES (103, N'isibiv', N'bizrb', CAST(N'2001-10-10' AS Date), N'1544916', N'kndf', N'$2a$12$dZsBLwr7TEbqjX1AHWjhGenyLrGvOFv0IpT2aqC9gDCDIp0BECPNa', N'ugyuvcue', 0)
SET IDENTITY_INSERT [dbo].[utilisateurs] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__utilisat__F3DBC57203F8FDF7]    Script Date: 22-06-20 18:12:55 ******/
ALTER TABLE [dbo].[utilisateurs] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[amendeLivre]  WITH CHECK ADD FOREIGN KEY([idLivre])
REFERENCES [dbo].[livre] ([idLivre])
GO
ALTER TABLE [dbo].[amendeLivre]  WITH CHECK ADD FOREIGN KEY([idUtilisateur])
REFERENCES [dbo].[utilisateurs] ([idUtilisateur])
GO
ALTER TABLE [dbo].[amendes]  WITH CHECK ADD FOREIGN KEY([idUtilisateur])
REFERENCES [dbo].[utilisateurs] ([idUtilisateur])
GO
ALTER TABLE [dbo].[bibliotheques]  WITH CHECK ADD FOREIGN KEY([idManaG])
REFERENCES [dbo].[manaGeneral] ([idManaG])
GO
ALTER TABLE [dbo].[critiques]  WITH CHECK ADD FOREIGN KEY([idLivre])
REFERENCES [dbo].[livre] ([idLivre])
GO
ALTER TABLE [dbo].[echanges]  WITH CHECK ADD FOREIGN KEY([idUtilisateur])
REFERENCES [dbo].[utilisateurs] ([idUtilisateur])
GO
ALTER TABLE [dbo].[exemplaires]  WITH CHECK ADD FOREIGN KEY([idBibliot])
REFERENCES [dbo].[bibliotheques] ([idBibliot])
GO
ALTER TABLE [dbo].[exemplaires]  WITH CHECK ADD FOREIGN KEY([idLivre])
REFERENCES [dbo].[livre] ([idLivre])
GO
ALTER TABLE [dbo].[livre]  WITH CHECK ADD FOREIGN KEY([idExemplaire])
REFERENCES [dbo].[exemplaires] ([idExemplaire])
GO
ALTER TABLE [dbo].[livreLouer]  WITH CHECK ADD FOREIGN KEY([idLivre])
REFERENCES [dbo].[livre] ([idLivre])
GO
ALTER TABLE [dbo].[livreLouer]  WITH CHECK ADD FOREIGN KEY([idLocation])
REFERENCES [dbo].[locations] ([idLocation])
GO
ALTER TABLE [dbo].[question]  WITH CHECK ADD FOREIGN KEY([idLecteur])
REFERENCES [dbo].[utilisateurs] ([idUtilisateur])
GO
ALTER TABLE [dbo].[redevances]  WITH CHECK ADD FOREIGN KEY([idUtilisateur])
REFERENCES [dbo].[utilisateurs] ([idUtilisateur])
GO
ALTER TABLE [dbo].[reponse]  WITH CHECK ADD FOREIGN KEY([idAdmin])
REFERENCES [dbo].[utilisateurs] ([idUtilisateur])
GO
ALTER TABLE [dbo].[reponse]  WITH CHECK ADD FOREIGN KEY([idQuestion])
REFERENCES [dbo].[question] ([idQuestion])
GO
ALTER TABLE [dbo].[roleUser]  WITH CHECK ADD FOREIGN KEY([idRole])
REFERENCES [dbo].[roles] ([idRole])
GO
ALTER TABLE [dbo].[roleUser]  WITH CHECK ADD FOREIGN KEY([idUtilisateur])
REFERENCES [dbo].[utilisateurs] ([idUtilisateur])
GO
ALTER TABLE [dbo].[userLoc]  WITH CHECK ADD FOREIGN KEY([idLivre])
REFERENCES [dbo].[livre] ([idLivre])
GO
ALTER TABLE [dbo].[userLoc]  WITH CHECK ADD FOREIGN KEY([idLocation])
REFERENCES [dbo].[locations] ([idLocation])
GO
USE [master]
GO
ALTER DATABASE [ecole] SET  READ_WRITE 
GO
