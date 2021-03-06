USE [master]
GO
/****** Object:  Database [LibraryManagement]    Script Date: 10/9/2016 10:44:46 PM ******/
CREATE DATABASE [LibraryManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryManagement', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\LibraryManagement.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LibraryManagement_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\LibraryManagement_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LibraryManagement] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibraryManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LibraryManagement] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [LibraryManagement] SET DELAYED_DURABILITY = DISABLED 
GO
USE [LibraryManagement]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 10/9/2016 10:44:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Book](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](30) NOT NULL,
	[PublisherName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Book_Authors]    Script Date: 10/9/2016 10:44:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Book_Authors](
	[BookID] [int] NOT NULL,
	[AuthorName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Book_Copies]    Script Date: 10/9/2016 10:44:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book_Copies](
	[BookID] [int] NULL,
	[BranchID] [int] NULL,
	[No_Of_Copies] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Book_Loans]    Script Date: 10/9/2016 10:44:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book_Loans](
	[BookID] [int] NOT NULL,
	[BranchID] [int] NOT NULL,
	[CardNo] [int] NOT NULL,
	[DateOut] [date] NULL,
	[DueDate] [date] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Borrower]    Script Date: 10/9/2016 10:44:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Borrower](
	[CardNo] [int] NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[Phone] [varchar](12) NULL,
PRIMARY KEY CLUSTERED 
(
	[CardNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Library_Branch]    Script Date: 10/9/2016 10:44:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Library_Branch](
	[BranchID] [int] NOT NULL,
	[BranchName] [varchar](50) NOT NULL,
	[Address] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[BranchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 10/9/2016 10:44:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Publisher](
	[Name] [varchar](30) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[Phone] [varchar](20) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([BookID], [Title], [PublisherName]) VALUES (1, N'The Lost Tribe', N'Rand McNally')
INSERT [dbo].[Book] ([BookID], [Title], [PublisherName]) VALUES (2, N'Love Story', N'Sams Publishing')
INSERT [dbo].[Book] ([BookID], [Title], [PublisherName]) VALUES (3, N'Marley and Me', N'William Morrow')
INSERT [dbo].[Book] ([BookID], [Title], [PublisherName]) VALUES (4, N'Cell', N'Charles Scribner')
INSERT [dbo].[Book] ([BookID], [Title], [PublisherName]) VALUES (5, N'The Girl on the Train', N'Rand McNally')
INSERT [dbo].[Book] ([BookID], [Title], [PublisherName]) VALUES (6, N'Home', N'William Morrow')
INSERT [dbo].[Book] ([BookID], [Title], [PublisherName]) VALUES (7, N'The Kept Woman', N'Charles Scribner')
INSERT [dbo].[Book] ([BookID], [Title], [PublisherName]) VALUES (8, N'Magic Binds', N'William Morrow')
INSERT [dbo].[Book] ([BookID], [Title], [PublisherName]) VALUES (9, N'Razor Girl', N'Rand McNally')
INSERT [dbo].[Book] ([BookID], [Title], [PublisherName]) VALUES (10, N'The Witches', N'Charles Scribner')
INSERT [dbo].[Book] ([BookID], [Title], [PublisherName]) VALUES (11, N'Uninvited', N'Thomas Nelson')
INSERT [dbo].[Book] ([BookID], [Title], [PublisherName]) VALUES (12, N'Present Over Perfect', N'Zondervan')
INSERT [dbo].[Book] ([BookID], [Title], [PublisherName]) VALUES (13, N'Commonwealth', N'Harper')
INSERT [dbo].[Book] ([BookID], [Title], [PublisherName]) VALUES (14, N'Tribe', N'Harper')
INSERT [dbo].[Book] ([BookID], [Title], [PublisherName]) VALUES (15, N'Citizen', N'Greywolf')
INSERT [dbo].[Book] ([BookID], [Title], [PublisherName]) VALUES (16, N'Daring Greatly', N'Charles Scribner')
INSERT [dbo].[Book] ([BookID], [Title], [PublisherName]) VALUES (17, N'Modern Romance', N'Penguin')
INSERT [dbo].[Book] ([BookID], [Title], [PublisherName]) VALUES (18, N'Beautiful', N'Greywolf')
INSERT [dbo].[Book] ([BookID], [Title], [PublisherName]) VALUES (19, N'Peacock and Vine', N'Harper')
INSERT [dbo].[Book] ([BookID], [Title], [PublisherName]) VALUES (20, N'The Residence', N'Harper')
INSERT [dbo].[Book] ([BookID], [Title], [PublisherName]) VALUES (21, N'IT', N'Viking Press')
SET IDENTITY_INSERT [dbo].[Book] OFF
INSERT [dbo].[Book_Authors] ([BookID], [AuthorName]) VALUES (1, N'Sebastian Junger')
INSERT [dbo].[Book_Authors] ([BookID], [AuthorName]) VALUES (2, N'Coben Thomas')
INSERT [dbo].[Book_Authors] ([BookID], [AuthorName]) VALUES (3, N'John Grogan')
INSERT [dbo].[Book_Authors] ([BookID], [AuthorName]) VALUES (4, N'Stephen King')
INSERT [dbo].[Book_Authors] ([BookID], [AuthorName]) VALUES (5, N'Paula Hawkins')
INSERT [dbo].[Book_Authors] ([BookID], [AuthorName]) VALUES (6, N'Harlan Coben')
INSERT [dbo].[Book_Authors] ([BookID], [AuthorName]) VALUES (7, N'Karin Slaughter')
INSERT [dbo].[Book_Authors] ([BookID], [AuthorName]) VALUES (8, N'Ilona Andrews')
INSERT [dbo].[Book_Authors] ([BookID], [AuthorName]) VALUES (9, N'Carl Hiasen')
INSERT [dbo].[Book_Authors] ([BookID], [AuthorName]) VALUES (10, N'Stacy Schiff')
INSERT [dbo].[Book_Authors] ([BookID], [AuthorName]) VALUES (11, N'Lysa Terkeurst')
INSERT [dbo].[Book_Authors] ([BookID], [AuthorName]) VALUES (12, N'Shauna Niequist')
INSERT [dbo].[Book_Authors] ([BookID], [AuthorName]) VALUES (13, N'Ann Patchett')
INSERT [dbo].[Book_Authors] ([BookID], [AuthorName]) VALUES (14, N'Sebastian Junger')
INSERT [dbo].[Book_Authors] ([BookID], [AuthorName]) VALUES (15, N'Claudia Rankine')
INSERT [dbo].[Book_Authors] ([BookID], [AuthorName]) VALUES (16, N'Brene Brown')
INSERT [dbo].[Book_Authors] ([BookID], [AuthorName]) VALUES (17, N'Aziz Ansari')
INSERT [dbo].[Book_Authors] ([BookID], [AuthorName]) VALUES (18, N'Mark Sikes')
INSERT [dbo].[Book_Authors] ([BookID], [AuthorName]) VALUES (19, N'A.S. Byatt')
INSERT [dbo].[Book_Authors] ([BookID], [AuthorName]) VALUES (20, N'Kate Andersen')
INSERT [dbo].[Book_Authors] ([BookID], [AuthorName]) VALUES (21, N'Stephen King')
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (1, 1, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (2, 1, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (3, 1, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (4, 1, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (5, 1, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (6, 1, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (7, 1, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (8, 1, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (9, 1, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (10, 1, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (1, 2, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (2, 2, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (3, 2, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (4, 2, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (5, 2, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (6, 2, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (7, 2, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (8, 2, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (9, 2, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (10, 2, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (11, 3, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (12, 3, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (13, 3, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (14, 3, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (15, 3, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (16, 3, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (17, 3, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (18, 3, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (19, 3, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (20, 3, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (11, 4, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (12, 4, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (13, 4, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (14, 4, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (15, 4, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (16, 4, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (17, 4, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (18, 4, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (19, 4, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (20, 4, 2)
INSERT [dbo].[Book_Copies] ([BookID], [BranchID], [No_Of_Copies]) VALUES (21, 2, 3)
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (1, 1, 1, CAST(N'2016-01-01' AS Date), CAST(N'2016-02-20' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (2, 1, 2, CAST(N'2016-01-02' AS Date), CAST(N'2016-02-21' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (3, 1, 3, CAST(N'2016-01-03' AS Date), CAST(N'2016-02-22' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (4, 1, 4, CAST(N'2016-01-04' AS Date), CAST(N'2016-02-23' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (5, 1, 5, CAST(N'2016-01-05' AS Date), CAST(N'2016-02-24' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (6, 1, 6, CAST(N'2016-01-06' AS Date), CAST(N'2016-02-25' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (7, 1, 7, CAST(N'2016-01-07' AS Date), CAST(N'2016-02-26' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (8, 1, 8, CAST(N'2016-01-08' AS Date), CAST(N'2016-02-27' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (9, 1, 1, CAST(N'2016-01-09' AS Date), CAST(N'2016-02-28' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (10, 1, 2, CAST(N'2016-01-10' AS Date), CAST(N'2016-02-29' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (11, 3, 3, CAST(N'2016-01-11' AS Date), CAST(N'2016-03-01' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (12, 3, 4, CAST(N'2016-01-12' AS Date), CAST(N'2016-03-02' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (13, 3, 5, CAST(N'2016-01-13' AS Date), CAST(N'2016-03-03' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (14, 3, 6, CAST(N'2016-01-14' AS Date), CAST(N'2016-03-04' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (15, 3, 7, CAST(N'2016-01-15' AS Date), CAST(N'2016-03-05' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (16, 3, 8, CAST(N'2016-01-16' AS Date), CAST(N'2016-03-06' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (17, 3, 1, CAST(N'2016-01-17' AS Date), CAST(N'2016-03-07' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (18, 3, 2, CAST(N'2016-01-18' AS Date), CAST(N'2016-03-08' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (19, 3, 3, CAST(N'2016-01-19' AS Date), CAST(N'2016-03-09' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (20, 3, 4, CAST(N'2016-01-20' AS Date), CAST(N'2016-03-10' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (1, 1, 5, CAST(N'2016-01-21' AS Date), CAST(N'2016-03-11' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (2, 1, 6, CAST(N'2016-01-22' AS Date), CAST(N'2016-03-12' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (3, 1, 7, CAST(N'2016-01-23' AS Date), CAST(N'2016-03-13' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (4, 1, 8, CAST(N'2016-01-24' AS Date), CAST(N'2016-03-14' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (5, 1, 1, CAST(N'2016-01-25' AS Date), CAST(N'2016-03-15' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (6, 1, 2, CAST(N'2016-01-26' AS Date), CAST(N'2016-03-16' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (7, 1, 3, CAST(N'2016-01-27' AS Date), CAST(N'2016-03-17' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (8, 1, 4, CAST(N'2016-01-28' AS Date), CAST(N'2016-03-18' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (9, 1, 5, CAST(N'2016-01-29' AS Date), CAST(N'2016-03-19' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (10, 1, 6, CAST(N'2016-01-30' AS Date), CAST(N'2016-03-20' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (11, 3, 7, CAST(N'2016-01-31' AS Date), CAST(N'2016-03-21' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (12, 3, 8, CAST(N'2016-02-01' AS Date), CAST(N'2016-03-22' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (13, 3, 1, CAST(N'2016-02-02' AS Date), CAST(N'2016-03-23' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (14, 3, 2, CAST(N'2016-02-03' AS Date), CAST(N'2016-03-24' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (15, 3, 3, CAST(N'2016-02-04' AS Date), CAST(N'2016-03-25' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (16, 3, 4, CAST(N'2016-02-05' AS Date), CAST(N'2016-03-26' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (17, 3, 5, CAST(N'2016-02-06' AS Date), CAST(N'2016-03-27' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (18, 3, 6, CAST(N'2016-02-07' AS Date), CAST(N'2016-03-28' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (19, 3, 7, CAST(N'2016-02-08' AS Date), CAST(N'2016-03-29' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (20, 3, 8, CAST(N'2016-02-09' AS Date), CAST(N'2016-03-30' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (1, 2, 1, CAST(N'2016-02-10' AS Date), CAST(N'2016-03-31' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (2, 2, 2, CAST(N'2016-02-11' AS Date), CAST(N'2016-04-01' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (3, 2, 3, CAST(N'2016-02-12' AS Date), CAST(N'2016-04-02' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (4, 2, 4, CAST(N'2016-02-13' AS Date), CAST(N'2016-04-03' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (5, 2, 5, CAST(N'2016-02-14' AS Date), CAST(N'2016-04-04' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (6, 2, 6, CAST(N'2016-02-15' AS Date), CAST(N'2016-04-05' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (7, 2, 7, CAST(N'2016-02-16' AS Date), CAST(N'2016-04-06' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (8, 2, 8, CAST(N'2016-02-17' AS Date), CAST(N'2016-04-07' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (9, 2, 1, CAST(N'2016-02-18' AS Date), CAST(N'2016-04-08' AS Date))
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (10, 2, 2, CAST(N'2016-02-19' AS Date), CAST(N'2016-04-09' AS Date))
INSERT [dbo].[Borrower] ([CardNo], [Name], [Address], [Phone]) VALUES (1, N'Janelle', N'135 Cat Rd', N'226-5564')
INSERT [dbo].[Borrower] ([CardNo], [Name], [Address], [Phone]) VALUES (2, N'Jonathan', N'117 Dog Dr', N'455-2485')
INSERT [dbo].[Borrower] ([CardNo], [Name], [Address], [Phone]) VALUES (3, N'Alexandria', N'232 100th Lane', N'324-2498')
INSERT [dbo].[Borrower] ([CardNo], [Name], [Address], [Phone]) VALUES (4, N'Brian', N'234 100th Lane', N'324-2499')
INSERT [dbo].[Borrower] ([CardNo], [Name], [Address], [Phone]) VALUES (5, N'Daniel', N'118 Rabbit Dr', N'455-7984')
INSERT [dbo].[Borrower] ([CardNo], [Name], [Address], [Phone]) VALUES (6, N'Julia', N'132 Cat Rd', N'236-5545')
INSERT [dbo].[Borrower] ([CardNo], [Name], [Address], [Phone]) VALUES (7, N'Halina', N'114 Sheridan St', N'640-1727')
INSERT [dbo].[Borrower] ([CardNo], [Name], [Address], [Phone]) VALUES (8, N'Wesley', N'114 Owl Ln', N'594-0145')
INSERT [dbo].[Borrower] ([CardNo], [Name], [Address], [Phone]) VALUES (9, N'Micky', N'123 Mouse Dr', N'956-2365')
INSERT [dbo].[Library_Branch] ([BranchID], [BranchName], [Address]) VALUES (1, N'Sharptown', N'132 Sharptown Lane')
INSERT [dbo].[Library_Branch] ([BranchID], [BranchName], [Address]) VALUES (2, N'Central', N'145 Central Ave')
INSERT [dbo].[Library_Branch] ([BranchID], [BranchName], [Address]) VALUES (3, N'Brooklyn', N'256 Brooklyn Ave')
INSERT [dbo].[Library_Branch] ([BranchID], [BranchName], [Address]) VALUES (4, N'Jasper', N'119 Jasper St')
INSERT [dbo].[Publisher] ([Name], [Address], [Phone]) VALUES (N'Charles Scribner', N'123 N Main St', N'555-236-4545')
INSERT [dbo].[Publisher] ([Name], [Address], [Phone]) VALUES (N'Greywolf', N'456 N Central Ave', N'555-784-6565')
INSERT [dbo].[Publisher] ([Name], [Address], [Phone]) VALUES (N'Harper', N'412 W Summer Dr', N'555-862-7894')
INSERT [dbo].[Publisher] ([Name], [Address], [Phone]) VALUES (N'Penguin', N'234 S Winter Ave', N'555-465-7788')
INSERT [dbo].[Publisher] ([Name], [Address], [Phone]) VALUES (N'Rand McNally', N'5452 N 22nd St', N'555-987-5632')
INSERT [dbo].[Publisher] ([Name], [Address], [Phone]) VALUES (N'Sams Publishing', N'6545 N 1st St', N'999-654-3579')
INSERT [dbo].[Publisher] ([Name], [Address], [Phone]) VALUES (N'Thomas Nelson', N'675 E Lemon Way', N'737-375-8975')
INSERT [dbo].[Publisher] ([Name], [Address], [Phone]) VALUES (N'William Morrow', N'456 S Hill Dr', N'555-666-7777')
INSERT [dbo].[Publisher] ([Name], [Address], [Phone]) VALUES (N'Zondervan', N'56 Outer Way', N'555-221-4456')
ALTER TABLE [dbo].[Book_Authors]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[Book_Copies]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[Book_Copies]  WITH CHECK ADD FOREIGN KEY([BranchID])
REFERENCES [dbo].[Library_Branch] ([BranchID])
GO
ALTER TABLE [dbo].[Book_Copies]  WITH CHECK ADD  CONSTRAINT [FK_BranchID] FOREIGN KEY([BranchID])
REFERENCES [dbo].[Library_Branch] ([BranchID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Book_Copies] CHECK CONSTRAINT [FK_BranchID]
GO
ALTER TABLE [dbo].[Book_Loans]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[Book_Loans]  WITH CHECK ADD FOREIGN KEY([BranchID])
REFERENCES [dbo].[Library_Branch] ([BranchID])
GO
ALTER TABLE [dbo].[Book_Loans]  WITH CHECK ADD FOREIGN KEY([CardNo])
REFERENCES [dbo].[Borrower] ([CardNo])
GO
ALTER TABLE [dbo].[Book_Loans]  WITH CHECK ADD FOREIGN KEY([CardNo])
REFERENCES [dbo].[Borrower] ([CardNo])
GO
/****** Object:  StoredProcedure [dbo].[GetTitle_Copies]    Script Date: 10/9/2016 10:44:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTitle_Copies] @BranchName nvarchar(30) = NULL, @AuthorName nvarchar(50) = NULL
AS
	SELECT *
	FROM Book
		Join Book_Copies 
		On Book.BookID=Book_Copies.BookID
		Join Library_Branch
		On Book_Copies.BranchID=Library_Branch.BranchID
		Join Book_Authors
		ON Book.BookID=Book_Authors.BookID
		Where AuthorName= @AuthorName or BranchName= @BranchName;
GO
USE [master]
GO
ALTER DATABASE [LibraryManagement] SET  READ_WRITE 
GO
