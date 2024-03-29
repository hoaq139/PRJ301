USE [master]
GO
/****** Object:  Database [TinTuc]    Script Date: 3/20/2023 11:58:53 PM ******/
CREATE DATABASE [TinTuc]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TinTuc', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TinTuc.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TinTuc_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TinTuc_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TinTuc] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TinTuc].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TinTuc] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TinTuc] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TinTuc] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TinTuc] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TinTuc] SET ARITHABORT OFF 
GO
ALTER DATABASE [TinTuc] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TinTuc] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TinTuc] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TinTuc] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TinTuc] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TinTuc] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TinTuc] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TinTuc] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TinTuc] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TinTuc] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TinTuc] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TinTuc] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TinTuc] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TinTuc] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TinTuc] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TinTuc] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TinTuc] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TinTuc] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TinTuc] SET  MULTI_USER 
GO
ALTER DATABASE [TinTuc] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TinTuc] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TinTuc] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TinTuc] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TinTuc] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TinTuc] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TinTuc] SET QUERY_STORE = ON
GO
ALTER DATABASE [TinTuc] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TinTuc]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/20/2023 11:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 3/20/2023 11:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[comment] [nchar](500) NULL,
	[time] [date] NULL,
	[new_id] [int] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 3/20/2023 11:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[title] [text] NOT NULL,
	[description] [text] NOT NULL,
	[image] [text] NOT NULL,
	[author] [int] NOT NULL,
	[timePost] [date] NOT NULL,
	[shortDes] [text] NOT NULL,
	[categoryId] [int] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/20/2023 11:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] NULL,
	[Name] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/20/2023 11:58:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[roleId] [int] NULL,
	[fullname] [varchar](150) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Sports')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Business')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Heaths')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (4, N'Fintech')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (5, N'Entertainment')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (6, N'Travel')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([id], [user_id], [comment], [time], [new_id]) VALUES (1, 2, N'Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa eiusmod Pinterest in do umami readymade swag. Selfies iPhone Kickstarter, drinking vinegar jean.                                                                                                                                                                                           ', CAST(N'2023-03-20' AS Date), 4)
INSERT [dbo].[Comment] ([id], [user_id], [comment], [time], [new_id]) VALUES (2, 5, N'something that you say or write that expresses your opinion: I don''t want any comments on/about my new haircut, thank you!                                                                                                                                                                                                                                                                                                                                                                                          ', CAST(N'2023-03-20' AS Date), 4)
INSERT [dbo].[Comment] ([id], [user_id], [comment], [time], [new_id]) VALUES (3, 5, N'something that you say or write that expresses your opinion: I don''t want any comments on/about my new haircut, thank you!                                                                                                                                                                                                                                                                                                                                                                                          ', CAST(N'2023-03-20' AS Date), 7)
INSERT [dbo].[Comment] ([id], [user_id], [comment], [time], [new_id]) VALUES (4, 3, N'something that you say or write that expresses your opinion: I don''t want any comments on/about my new haircut, thank you!                                                                                                                                                                                                                                                                                                                                                                                          ', CAST(N'2023-03-20' AS Date), 7)
INSERT [dbo].[Comment] ([id], [user_id], [comment], [time], [new_id]) VALUES (5, 4, N'something that you say or write that expresses your opinion: I don''t want any comments on/about my new haircut, thank you!                                                                                                                                                                                                                                                                                                                                                                                          ', CAST(N'2023-03-20' AS Date), 6)
INSERT [dbo].[Comment] ([id], [user_id], [comment], [time], [new_id]) VALUES (6, 3, N'Thank you                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ', CAST(N'2023-03-20' AS Date), 6)
INSERT [dbo].[Comment] ([id], [user_id], [comment], [time], [new_id]) VALUES (7, 3, N'tuyet voi                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ', CAST(N'2023-03-20' AS Date), 6)
INSERT [dbo].[Comment] ([id], [user_id], [comment], [time], [new_id]) VALUES (8, 3, N'thank you                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ', CAST(N'2023-03-20' AS Date), 5)
INSERT [dbo].[Comment] ([id], [user_id], [comment], [time], [new_id]) VALUES (9, 5, N'something that you say or write that expresses your opinion: I don''t want any comments on/about my new haircut, thank you!                                                                                                                                                                                                                                                                                                                                                                                          ', CAST(N'2023-03-20' AS Date), 5)
INSERT [dbo].[Comment] ([id], [user_id], [comment], [time], [new_id]) VALUES (10, 4, N'something that you say or write that expresses your opinion: I don''t want any comments on/about my new haircut, thank you!                                                                                                                                                                                                                                                                                                                                                                                          ', CAST(N'2023-03-20' AS Date), 5)
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([ID], [title], [description], [image], [author], [timePost], [shortDes], [categoryId]) VALUES (4, N'Champions League draw: Holder Real Madrid drawn against Chelsea in quarterfinals', N'Chelsea qualified for the quarterfinals after impressively overturning a 1-0 first-leg deficit against Borussia Dortmund thanks to goals from Raheem Sterling and Kai Havertz, who scored the match-winning goal in the final two years ago when the London team beat Manchester City.

However, Real will rightly feel confident that it can once again progress to the semifinals after that statement 5-2 hammering of Liverpool at Anfield in the round of 16 first leg.

It was a historic result – Liverpool’s largest home defeat in Europe – with Real going on to comfortably see out the tie with a 1-0 win at the Bernabeu courtesy of Karim Benzema’s goal, taking the Frenchman’s Champions League tally to 89.', N'https://media.cnn.com/api/v1/images/stellar/prod/220528230954-madrid-lift-trophy.jpg?c=16x9&q=h_720,w_1280,c_fill/f_webp', 2, CAST(N'2023-03-18' AS Date), N'Chelsea qualified for the quarterfinals after impressively overturning a 1-0 first-leg deficit against Borussia Dortmund thanks to goals from Raheem Sterling and Kai Havertz, who scored the match-winning goal in the final two years ago when the London team beat Manchester City.', 1)
INSERT [dbo].[News] ([ID], [title], [description], [image], [author], [timePost], [shortDes], [categoryId]) VALUES (5, N'Is Guinness really ‘good for you’?', N'Chelsea qualified for the quarterfinals after impressively overturning a 1-0 first-leg deficit against Borussia Dortmund thanks to goals from Raheem Sterling and Kai Havertz, who scored the match-winning goal in the final two years ago when the London team beat Manchester City.

However, Real will rightly feel confident that it can once again progress to the semifinals after that statement 5-2 hammering of Liverpool at Anfield in the round of 16 first leg.

It was a historic result – Liverpool’s largest home defeat in Europe – with Real going on to comfortably see out the tie with a 1-0 win at the Bernabeu courtesy of Karim Benzema’s goal, taking the Frenchman’s Champions League tally to 89.', N'https://i.pinimg.com/564x/54/b4/42/54b442162d39ee1d2520e6f3f373a3c3.jpg', 3, CAST(N'2023-03-18' AS Date), N'Chelsea qualified for the quarterfinals after impressively overturning a 1-0 first-leg deficit against Borussia Dortmund thanks to goals from Raheem Sterling and Kai Havertz, who scored the match-winning goal in the final two years ago when the London team beat Manchester City.', 1)
INSERT [dbo].[News] ([ID], [title], [description], [image], [author], [timePost], [shortDes], [categoryId]) VALUES (6, N'Turkey was devastated by an earthquake. Here’s what that means for tourism', N'Chelsea qualified for the quarterfinals after impressively overturning a 1-0 first-leg deficit against Borussia Dortmund thanks to goals from Raheem Sterling and Kai Havertz, who scored the match-winning goal in the final two years ago when the London team beat Manchester City.

However, Real will rightly feel confident that it can once again progress to the semifinals after that statement 5-2 hammering of Liverpool at Anfield in the round of 16 first leg.

It was a historic result – Liverpool’s largest home defeat in Europe – with Real going on to comfortably see out the tie with a 1-0 win at the Bernabeu courtesy of Karim Benzema’s goal, taking the Frenchman’s Champions League tally to 89.', N'https://media.cnn.com/api/v1/images/stellar/prod/230315142221-08-turkey-tourism-earthquake-fethiye.jpg?c=16x9&q=h_720,w_1280,c_fill/f_webp', 4, CAST(N'2023-03-18' AS Date), N'Chelsea qualified for the quarterfinals after impressively overturning a 1-0 first-leg deficit against Borussia Dortmund thanks to goals from Raheem Sterling and Kai Havertz, who scored the match-winning goal in the final two years ago when the London team beat Manchester City.', 3)
INSERT [dbo].[News] ([ID], [title], [description], [image], [author], [timePost], [shortDes], [categoryId]) VALUES (7, N'‘Boston Strangler’ unravels the politics and doubts around the serial-killer case', N'Chelsea qualified for the quarterfinals after impressively overturning a 1-0 first-leg deficit against Borussia Dortmund thanks to goals from Raheem Sterling and Kai Havertz, who scored the match-winning goal in the final two years ago when the London team beat Manchester City.

However, Real will rightly feel confident that it can once again progress to the semifinals after that statement 5-2 hammering of Liverpool at Anfield in the round of 16 first leg.

It was a historic result – Liverpool’s largest home defeat in Europe – with Real going on to comfortably see out the tie with a 1-0 win at the Bernabeu courtesy of Karim Benzema’s goal, taking the Frenchman’s Champions League tally to 89.', N'https://media.cnn.com/api/v1/images/stellar/prod/230314174727-01-boston-strangler-movie.jpg?c=16x9&q=h_720,w_1280,c_fill/f_webp', 2, CAST(N'2023-03-18' AS Date), N'Chelsea qualified for the quarterfinals after impressively overturning a 1-0 first-leg deficit against Borussia Dortmund thanks to goals from Raheem Sterling and Kai Havertz, who scored the match-winning goal in the final two years ago when the London team beat Manchester City.', 4)
INSERT [dbo].[News] ([ID], [title], [description], [image], [author], [timePost], [shortDes], [categoryId]) VALUES (8, N'They bought a ghost village in Italy then left it to crumble', N'â??We have a strong attachment to this land, our hearts belong here. But it was quite a reckless move. You need a lot of patience, and money, to bring a whole place like this back to life.â?  Around 350 or so people live in the newer section of San Severino di Centola, which is about a 15 minute walk away from the abandoned area..  Dâ??Angelo explains that he and the others acquired around 60 old stone dwellings 15 years ago and â??each have a property stake.â?  They have no grand plans to turn the hamlet, which is surrounded by pristine ragged hills, forests and streams, into a lavish resort or holiday retreat spot with residences, but simply want to help preserve the villageâ??s original beauty by breathing new life into its decaying houses and monuments.  â??It breaks my heart to see the ghost hamlet fall to pieces and into oblivion, and that just a tiny part of it has been restyled,â? Dâ??Angelo tells CNN. â??We want to make it entirely accessible and safe for visitors.â?  While heâ??d rather not disclose how much the group ', N'https://media.cnn.com/api/v1/images/stellar/prod/230316095251-06-body-locals-bought-abandoned-italian-village.jpg?c=16x9&q=h_720,w_1280,c_fill/f_webp', 1, CAST(N'2023-03-20' AS Date), N'The retired banker says that he and the others began knocking at the doors of the heirs of past owners to convince them to sell after becoming concerned that the ghost village would fall prey to unscrupulous investors who may have wanted to radically change its structure.', 6)
SET IDENTITY_INSERT [dbo].[News] OFF
GO
INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'admin')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'user')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'author')
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [username], [password], [roleId], [fullname]) VALUES (1, N'admin', N'admin', 1, N'Admin')
INSERT [dbo].[Users] ([id], [username], [password], [roleId], [fullname]) VALUES (2, N'user', N'123', 2, N'Nguyen Minh')
INSERT [dbo].[Users] ([id], [username], [password], [roleId], [fullname]) VALUES (3, N'abc', N'abc', 2, N'Ha Le')
INSERT [dbo].[Users] ([id], [username], [password], [roleId], [fullname]) VALUES (4, N'nguyenminh', N'123', 2, N'Quang Minh')
INSERT [dbo].[Users] ([id], [username], [password], [roleId], [fullname]) VALUES (5, N'minhhoang', N'123', 2, N'Minh Hoang')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
USE [master]
GO
ALTER DATABASE [TinTuc] SET  READ_WRITE 
GO
