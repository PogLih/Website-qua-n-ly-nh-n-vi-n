USE [master]
GO
/****** Object:  Database [JAVA5_Personel]    Script Date: 25/03/2020 17:49:56 ******/
CREATE DATABASE [JAVA5_Personel]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JAVA5_Personel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JAVA5_Personel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JAVA5_Personel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JAVA5_Personel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JAVA5_Personel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JAVA5_Personel] SET ARITHABORT OFF 
GO
ALTER DATABASE [JAVA5_Personel] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JAVA5_Personel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JAVA5_Personel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JAVA5_Personel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JAVA5_Personel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JAVA5_Personel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JAVA5_Personel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JAVA5_Personel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JAVA5_Personel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JAVA5_Personel] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JAVA5_Personel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JAVA5_Personel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JAVA5_Personel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JAVA5_Personel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JAVA5_Personel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JAVA5_Personel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JAVA5_Personel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JAVA5_Personel] SET RECOVERY FULL 
GO
ALTER DATABASE [JAVA5_Personel] SET  MULTI_USER 
GO
ALTER DATABASE [JAVA5_Personel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JAVA5_Personel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JAVA5_Personel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JAVA5_Personel] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [JAVA5_Personel] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'JAVA5_Personel', N'ON'
GO
USE [JAVA5_Personel]
GO
/****** Object:  Table [dbo].[Departs]    Script Date: 25/03/2020 17:49:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departs](
	[Id] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Departs__3214EC0782446108] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Records]    Script Date: 25/03/2020 17:49:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Records](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [bit] NOT NULL,
	[Reason] [nvarchar](200) NOT NULL,
	[Date] [date] NOT NULL,
	[StaffId] [varchar](10) NOT NULL,
 CONSTRAINT [PK__Records__3214EC077D6E4E85] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Staffs]    Script Date: 25/03/2020 17:49:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staffs](
	[Id] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Gender] [bit] NOT NULL,
	[Birthday] [date] NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Phone] [varchar](10) NOT NULL,
	[Salary] [float] NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[DepartId] [varchar](10) NOT NULL,
 CONSTRAINT [PK__Staffs__3214EC07901EA7E1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 25/03/2020 17:49:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Username] [varchar](10) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Users__536C85E577974508] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Departs] ([Id], [Name]) VALUES (N'KETOAN    ', N'Kế Toán')
GO
INSERT [dbo].[Departs] ([Id], [Name]) VALUES (N'KINHTE    ', N'Phong Tài Chính Maketing')
GO
INSERT [dbo].[Departs] ([Id], [Name]) VALUES (N'PB01      ', N'TP. HCM')
GO
INSERT [dbo].[Departs] ([Id], [Name]) VALUES (N'PB02      ', N'Hà Nội')
GO
INSERT [dbo].[Departs] ([Id], [Name]) VALUES (N'PBDN1', N'Đà Nẵng 01')
GO
SET IDENTITY_INSERT [dbo].[Records] ON 

GO
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (1008, 1, N'hoan thanh dung thoi han', CAST(N'2020-02-23' AS Date), N'A1   ')
GO
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (1009, 1, N'tot', CAST(N'2020-02-23' AS Date), N'A1   ')
GO
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (1010, 1, N'tot', CAST(N'2020-02-23' AS Date), N'A2')
GO
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (1011, 1, N'Hoàn Thành Tốt Nhiệm Vụ', CAST(N'2020-02-23' AS Date), N'A2')
GO
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (1012, 1, N'   di tre   ', CAST(N'2020-03-02' AS Date), N'A3')
GO
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (1013, 1, N'Hoàn Thành Đúng Thời Hạn', CAST(N'2020-03-01' AS Date), N'A2')
GO
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (1014, 1, N'Hoàn Thành Đúng Thời Hạn', CAST(N'2020-03-01' AS Date), N'A2')
GO
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (1016, 0, N'Đi Trễ', CAST(N'2020-03-01' AS Date), N'A1')
GO
SET IDENTITY_INSERT [dbo].[Records] OFF
GO
INSERT [dbo].[Staffs] ([Id], [Name], [Gender], [Birthday], [Photo], [Email], [Phone], [Salary], [Notes], [DepartId]) VALUES (N'A1', N'Quoc Phong', 1, CAST(N'2000-03-11' AS Date), N'unknown-avatar.jpg', N'phongphong@gmail.com', N'0969293949', 69696969, NULL, N'KETOAN    ')
GO
INSERT [dbo].[Staffs] ([Id], [Name], [Gender], [Birthday], [Photo], [Email], [Phone], [Salary], [Notes], [DepartId]) VALUES (N'A2    ', N'Hoang Minh', 1, CAST(N'2000-09-25' AS Date), N'unknown-avatar.jpg', N'minhminh@fpt.edu.vn', N'0974544321', 96969696, NULL, N'KETOAN')
GO
INSERT [dbo].[Staffs] ([Id], [Name], [Gender], [Birthday], [Photo], [Email], [Phone], [Salary], [Notes], [DepartId]) VALUES (N'A3   ', N'Huy Thinh', 1, CAST(N'2000-01-13' AS Date), N'unknown-avatar.jpg', N'thinhthink@gmail.com', N'091234567', 6666666, NULL, N'PB01      ')
GO
INSERT [dbo].[Staffs] ([Id], [Name], [Gender], [Birthday], [Photo], [Email], [Phone], [Salary], [Notes], [DepartId]) VALUES (N'A4   ', N'Huy Hoang', 1, CAST(N'2000-05-23' AS Date), N'unknown-avatar.jpg', N'hoanghuy@gmail.com', N'091252617', 6666666, NULL, N'PB01      ')
GO
INSERT [dbo].[Staffs] ([Id], [Name], [Gender], [Birthday], [Photo], [Email], [Phone], [Salary], [Notes], [DepartId]) VALUES (N'A5   ', N'Bao Chau', 1, CAST(N'2000-1-13' AS Date), N'unknown-avatar.jpg', N'trautrau@gmail.com', N'091237521', 6666666, NULL, N'PB01      ')
GO

INSERT [dbo].[Users] ([Username], [Password], [FullName]) VALUES (N'admin', N'123456', N'No Name')
GO
INSERT [dbo].[Users] ([Username], [Password], [FullName]) VALUES (N'admin1', N'admin1', N'admin1')
GO
INSERT [dbo].[Users] ([Username], [Password], [FullName]) VALUES (N'phong ', N'123456', N'Nguyễn Quốc Phong')
GO
INSERT [dbo].[Users] ([Username], [Password], [FullName]) VALUES (N'minh  ', N'123456', N'Nguyễn Hoàng Minh')
GO
INSERT [dbo].[Users] ([Username], [Password], [FullName]) VALUES (N'thinh', N'123456', N'Tạ Huy Thịnh')
GO
ALTER TABLE [dbo].[Records]  WITH CHECK ADD  CONSTRAINT [FK_RECORDS_STAFFS] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staffs] ([Id])
GO
ALTER TABLE [dbo].[Records] CHECK CONSTRAINT [FK_RECORDS_STAFFS]
GO
ALTER TABLE [dbo].[Staffs]  WITH CHECK ADD  CONSTRAINT [FK_STAFFS_DEPARTS] FOREIGN KEY([DepartId])
REFERENCES [dbo].[Departs] ([Id])
GO
ALTER TABLE [dbo].[Staffs] CHECK CONSTRAINT [FK_STAFFS_DEPARTS]
GO
/****** Object:  StoredProcedure [dbo].[sp_getTopStaff]    Script Date: 25/03/2020 17:49:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_getTopStaff]
as
SELECT Staffs.Name, Staffs.Photo, Departs.Name FROM Staffs, Departs WHERE Staffs.DepartId = Departs.Id AND Staffs.Id in (SELECT TOP 10 StaffId FROM Records WHERE Type = 1 GROUP BY StaffId ORDER BY COUNT(Type) DESC)

GO
USE [master]
GO
ALTER DATABASE [JAVA5_Personel] SET  READ_WRITE 
GO
