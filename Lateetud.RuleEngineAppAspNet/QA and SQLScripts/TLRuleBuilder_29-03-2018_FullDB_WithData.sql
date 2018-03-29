USE [master]
GO
/****** Object:  Database [TLRuleBuilder]    Script Date: 03/29/2018 13:31:38 ******/
CREATE DATABASE [TLRuleBuilder] ON  PRIMARY 
( NAME = N'TLRuleBuilder', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\TLRuleBuilder.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TLRuleBuilder_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\TLRuleBuilder_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TLRuleBuilder] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TLRuleBuilder].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TLRuleBuilder] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [TLRuleBuilder] SET ANSI_NULLS OFF
GO
ALTER DATABASE [TLRuleBuilder] SET ANSI_PADDING OFF
GO
ALTER DATABASE [TLRuleBuilder] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [TLRuleBuilder] SET ARITHABORT OFF
GO
ALTER DATABASE [TLRuleBuilder] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [TLRuleBuilder] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [TLRuleBuilder] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [TLRuleBuilder] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [TLRuleBuilder] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [TLRuleBuilder] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [TLRuleBuilder] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [TLRuleBuilder] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [TLRuleBuilder] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [TLRuleBuilder] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [TLRuleBuilder] SET  DISABLE_BROKER
GO
ALTER DATABASE [TLRuleBuilder] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [TLRuleBuilder] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [TLRuleBuilder] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [TLRuleBuilder] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [TLRuleBuilder] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [TLRuleBuilder] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [TLRuleBuilder] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [TLRuleBuilder] SET  READ_WRITE
GO
ALTER DATABASE [TLRuleBuilder] SET RECOVERY SIMPLE
GO
ALTER DATABASE [TLRuleBuilder] SET  MULTI_USER
GO
ALTER DATABASE [TLRuleBuilder] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [TLRuleBuilder] SET DB_CHAINING OFF
GO
USE [TLRuleBuilder]
GO
/****** Object:  User [sa1]    Script Date: 03/29/2018 13:31:38 ******/
CREATE USER [sa1] FOR LOGIN [sa1] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [pb1]    Script Date: 03/29/2018 13:31:38 ******/
CREATE USER [pb1] FOR LOGIN [pb1] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Validation]    Script Date: 03/29/2018 13:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Validation](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[RuleDescID] [bigint] NULL,
	[Isactive] [bit] NULL,
	[EntryDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[ExpressionContext] [varchar](64) NULL,
	[ExpressionText] [nvarchar](max) NULL,
 CONSTRAINT [PK_Validation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Validation] ON
INSERT [dbo].[Validation] ([ID], [RuleDescID], [Isactive], [EntryDate], [ModifiedDate], [ExpressionContext], [ExpressionText]) VALUES (1, 4, 1, CAST(0x0000A8B000F37045 AS DateTime), CAST(0x0000A8B000F37045 AS DateTime), N'Number', N' ')
SET IDENTITY_INSERT [dbo].[Validation] OFF
/****** Object:  Table [dbo].[UserMaster]    Script Date: 03/29/2018 13:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserMaster](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[EmailId] [nvarchar](1024) NULL,
	[LoginDatetime] [datetime] NULL,
	[LastLoginDatetime] [datetime] NULL,
	[IsAdmin] [bit] NULL,
 CONSTRAINT [PK_UserMaster] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[UserMaster] ON
INSERT [dbo].[UserMaster] ([ID], [UserName], [Password], [IsActive], [FirstName], [LastName], [CreatedDate], [ModifiedDate], [EmailId], [LoginDatetime], [LastLoginDatetime], [IsAdmin]) VALUES (1, N'admin', N'admin', 1, N'Prasanta', N'Banerjee', CAST(0x0000A88600000000 AS DateTime), CAST(0x0000A88600000000 AS DateTime), N'prasanta.banerjee@lateetud.com', CAST(0x0000A88600000000 AS DateTime), CAST(0x0000A88600000000 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[UserMaster] OFF
/****** Object:  Table [dbo].[ServiceHistory]    Script Date: 03/29/2018 13:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServiceHistory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[RunTime] [datetime] NULL,
	[Comment] [nvarchar](max) NULL,
	[Status] [varchar](50) NULL,
	[RunID] [bigint] NULL,
	[NoOfFile] [int] NULL,
 CONSTRAINT [PK_ServiceHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceHistory] ON
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (1, CAST(0x0000A88C0124A813 AS DateTime), N'RuleEngine Service started at 19-02-2018 17:45:31', N'START', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (2, CAST(0x0000A88C0124A894 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 19-02-2018 17:45:32', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (3, CAST(0x0000A88C0124A935 AS DateTime), N'RuleEngine Service run at 19-02-2018 17:45:32 for RuleMasterID: 1', N'RUNNING', 3, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (4, CAST(0x0000A88C012CE69A AS DateTime), N'RuleEngine Service Mode:INTERVAL, 19-02-2018 18:15:32', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (5, CAST(0x0000A88C012CE6C4 AS DateTime), N'RuleEngine Service run at 19-02-2018 18:15:32 for RuleMasterID: 1', N'RUNNING', 4, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (6, CAST(0x0000A88C01352424 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 19-02-2018 18:45:32', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (7, CAST(0x0000A88C0135245C AS DateTime), N'RuleEngine Service run at 19-02-2018 18:45:33 for RuleMasterID: 1', N'RUNNING', 5, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (8, CAST(0x0000A88C013D61CC AS DateTime), N'RuleEngine Service Mode:INTERVAL, 19-02-2018 19:15:33', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (9, CAST(0x0000A88C013D6209 AS DateTime), N'RuleEngine Service run at 19-02-2018 19:15:33 for RuleMasterID: 1', N'RUNNING', 6, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (10, CAST(0x0000A88C01459F6B AS DateTime), N'RuleEngine Service Mode:INTERVAL, 19-02-2018 19:45:33', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (11, CAST(0x0000A88C01459FAF AS DateTime), N'RuleEngine Service run at 19-02-2018 19:45:33 for RuleMasterID: 1', N'RUNNING', 7, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (12, CAST(0x0000A88C014DDD10 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 19-02-2018 20:15:33', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (13, CAST(0x0000A88C014DDD50 AS DateTime), N'RuleEngine Service run at 19-02-2018 20:15:33 for RuleMasterID: 1', N'RUNNING', 8, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (14, CAST(0x0000A88C01561AB3 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 19-02-2018 20:45:33', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (15, CAST(0x0000A88C01561AED AS DateTime), N'RuleEngine Service run at 19-02-2018 20:45:34 for RuleMasterID: 1', N'RUNNING', 9, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (16, CAST(0x0000A88C015E584F AS DateTime), N'RuleEngine Service Mode:INTERVAL, 19-02-2018 21:15:34', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (17, CAST(0x0000A88C015E5884 AS DateTime), N'RuleEngine Service run at 19-02-2018 21:15:34 for RuleMasterID: 1', N'RUNNING', 10, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (18, CAST(0x0000A88C016695E5 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 19-02-2018 21:45:34', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (19, CAST(0x0000A88C01669618 AS DateTime), N'RuleEngine Service run at 19-02-2018 21:45:34 for RuleMasterID: 1', N'RUNNING', 11, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (20, CAST(0x0000A88C016ED37B AS DateTime), N'RuleEngine Service Mode:INTERVAL, 19-02-2018 22:15:34', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (21, CAST(0x0000A88C016ED3C5 AS DateTime), N'RuleEngine Service run at 19-02-2018 22:15:34 for RuleMasterID: 1', N'RUNNING', 12, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (22, CAST(0x0000A88C01771126 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 19-02-2018 22:45:34', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (23, CAST(0x0000A88C0177115E AS DateTime), N'RuleEngine Service run at 19-02-2018 22:45:34 for RuleMasterID: 1', N'RUNNING', 13, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (24, CAST(0x0000A88C017F4EC0 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 19-02-2018 23:15:34', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (25, CAST(0x0000A88C017F4F10 AS DateTime), N'RuleEngine Service run at 19-02-2018 23:15:35 for RuleMasterID: 1', N'RUNNING', 14, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (26, CAST(0x0000A88C01878C74 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 19-02-2018 23:45:35', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (27, CAST(0x0000A88C01878CB6 AS DateTime), N'RuleEngine Service run at 19-02-2018 23:45:35 for RuleMasterID: 1', N'RUNNING', 15, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (28, CAST(0x0000A88D00044818 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 20-02-2018 00:15:35', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (29, CAST(0x0000A88D00044834 AS DateTime), N'RuleEngine Service run at 20-02-2018 00:15:35 for RuleMasterID: 1', N'RUNNING', 16, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (30, CAST(0x0000A88D000C8594 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 20-02-2018 00:45:35', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (31, CAST(0x0000A88D000C85C4 AS DateTime), N'RuleEngine Service run at 20-02-2018 00:45:35 for RuleMasterID: 1', N'RUNNING', 17, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (32, CAST(0x0000A88D00D2DF6A AS DateTime), N'RuleEngine Service Mode:INTERVAL, 20-02-2018 12:47:45', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (33, CAST(0x0000A88D00D2DF9E AS DateTime), N'RuleEngine Service run at 20-02-2018 12:47:46 for RuleMasterID: 1', N'RUNNING', 18, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (34, CAST(0x0000A88D00DB1D03 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 20-02-2018 13:17:46', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (35, CAST(0x0000A88D00DB1D30 AS DateTime), N'RuleEngine Service run at 20-02-2018 13:17:46 for RuleMasterID: 1', N'RUNNING', 19, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (36, CAST(0x0000A88D00E19EDB AS DateTime), N'RuleEngine Service stopped at 20-02-2018 13:41:27', N'STOP', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (37, CAST(0x0000A88D00E50573 AS DateTime), N'RuleEngine Service started at 20-02-2018 13:53:50', N'START', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (38, CAST(0x0000A88D00E5060C AS DateTime), N'RuleEngine Service Mode:INTERVAL, 20-02-2018 13:53:50', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (39, CAST(0x0000A88D00E50723 AS DateTime), N'RuleEngine Service run at 20-02-2018 13:53:51 for RuleMasterID: 1', N'RUNNING', 20, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (40, CAST(0x0000A88D00E58532 AS DateTime), N'RuleEngine Service stopped at 20-02-2018 13:55:39', N'STOP', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (41, CAST(0x0000A88D00E619C7 AS DateTime), N'RuleEngine Service started at 20-02-2018 13:57:46', N'START', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (42, CAST(0x0000A88D00E619DB AS DateTime), N'RuleEngine Service Mode:INTERVAL, 20-02-2018 13:57:46', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (43, CAST(0x0000A88D00E61A29 AS DateTime), N'RuleEngine Service run at 20-02-2018 13:57:46 for RuleMasterID: 1', N'RUNNING', 21, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (44, CAST(0x0000A88D00EE578B AS DateTime), N'RuleEngine Service Mode:INTERVAL, 20-02-2018 14:27:46', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (45, CAST(0x0000A88D00EE57BF AS DateTime), N'RuleEngine Service run at 20-02-2018 14:27:46 for RuleMasterID: 1', N'RUNNING', 22, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (46, CAST(0x0000A88D00F6952E AS DateTime), N'RuleEngine Service Mode:INTERVAL, 20-02-2018 14:57:46', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (47, CAST(0x0000A88D00F69665 AS DateTime), N'RuleEngine Service run at 20-02-2018 14:57:47 for RuleMasterID: 1', N'RUNNING', 23, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (48, CAST(0x0000A88D00FED3C7 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 20-02-2018 15:27:47', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (49, CAST(0x0000A88D00FED3E8 AS DateTime), N'RuleEngine Service run at 20-02-2018 15:27:47 for RuleMasterID: 1', N'RUNNING', 24, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (50, CAST(0x0000A88D0107114E AS DateTime), N'RuleEngine Service Mode:INTERVAL, 20-02-2018 15:57:47', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (51, CAST(0x0000A88D01071180 AS DateTime), N'RuleEngine Service run at 20-02-2018 15:57:48 for RuleMasterID: 1', N'RUNNING', 25, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (52, CAST(0x0000A88D010F4EE1 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 20-02-2018 16:27:48', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (53, CAST(0x0000A88D010F4F00 AS DateTime), N'RuleEngine Service run at 20-02-2018 16:27:48 for RuleMasterID: 1', N'RUNNING', 26, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (54, CAST(0x0000A88D01178C62 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 20-02-2018 16:57:48', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (55, CAST(0x0000A88D01178CEA AS DateTime), N'RuleEngine Service run at 20-02-2018 16:57:48 for RuleMasterID: 1', N'RUNNING', 27, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (56, CAST(0x0000A88D01198056 AS DateTime), N'RuleEngine Service stopped at 20-02-2018 17:04:54', N'STOP', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (57, CAST(0x0000A88E00D9EEFE AS DateTime), N'RuleEngine Service started at 21-02-2018 13:13:28', N'START', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (58, CAST(0x0000A88E00D9EF12 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 21-02-2018 13:13:28', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (59, CAST(0x0000A88E00D9EF5C AS DateTime), N'RuleEngine Service run at 21-02-2018 13:13:28 for RuleMasterID: 1', N'RUNNING', 28, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (60, CAST(0x0000A88E00E22CC0 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 21-02-2018 13:43:28', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (61, CAST(0x0000A88E00E22D01 AS DateTime), N'RuleEngine Service run at 21-02-2018 13:43:28 for RuleMasterID: 1', N'RUNNING', 29, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (62, CAST(0x0000A88E00EA6A61 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 21-02-2018 14:13:28', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (63, CAST(0x0000A88E00EA6A7D AS DateTime), N'RuleEngine Service run at 21-02-2018 14:13:28 for RuleMasterID: 1', N'RUNNING', 30, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (64, CAST(0x0000A88E00ECD398 AS DateTime), N'RuleEngine Service stopped at 21-02-2018 14:22:15', N'STOP', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (65, CAST(0x0000A88E0123A61F AS DateTime), N'RuleEngine Service started at 21-02-2018 17:41:51', N'START', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (66, CAST(0x0000A88E0123A8E6 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 21-02-2018 17:41:54', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (67, CAST(0x0000A88E0123A93B AS DateTime), N'RuleEngine Service run at 21-02-2018 17:41:54 for RuleMasterID: 1', N'RUNNING', 31, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (68, CAST(0x0000A88E012BE6A2 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 21-02-2018 18:11:54', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (69, CAST(0x0000A88E012BE707 AS DateTime), N'RuleEngine Service run at 21-02-2018 18:11:54 for RuleMasterID: 1', N'RUNNING', 32, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (70, CAST(0x0000A88E01342468 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 21-02-2018 18:41:54', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (71, CAST(0x0000A88E0134249C AS DateTime), N'RuleEngine Service run at 21-02-2018 18:41:54 for RuleMasterID: 1', N'RUNNING', 33, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (72, CAST(0x0000A88E013C6200 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 21-02-2018 19:11:54', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (73, CAST(0x0000A88E013C623B AS DateTime), N'RuleEngine Service run at 21-02-2018 19:11:55 for RuleMasterID: 1', N'RUNNING', 34, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (74, CAST(0x0000A88E01449F9F AS DateTime), N'RuleEngine Service Mode:INTERVAL, 21-02-2018 19:41:55', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (75, CAST(0x0000A88E01449FC4 AS DateTime), N'RuleEngine Service run at 21-02-2018 19:41:55 for RuleMasterID: 1', N'RUNNING', 35, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (76, CAST(0x0000A88E014CDD27 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 21-02-2018 20:11:55', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (77, CAST(0x0000A88E014CDD48 AS DateTime), N'RuleEngine Service run at 21-02-2018 20:11:55 for RuleMasterID: 1', N'RUNNING', 36, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (78, CAST(0x0000A88E01551AAB AS DateTime), N'RuleEngine Service Mode:INTERVAL, 21-02-2018 20:41:55', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (79, CAST(0x0000A88E01551AD3 AS DateTime), N'RuleEngine Service run at 21-02-2018 20:41:55 for RuleMasterID: 1', N'RUNNING', 37, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (80, CAST(0x0000A88E0156628F AS DateTime), N'RuleEngine Service stopped at 21-02-2018 20:46:35', N'STOP', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (81, CAST(0x0000A88E015684E2 AS DateTime), N'RuleEngine Service started at 21-02-2018 20:47:04', N'START', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (82, CAST(0x0000A88E01568511 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 21-02-2018 20:47:04', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (83, CAST(0x0000A88E01568556 AS DateTime), N'RuleEngine Service run at 21-02-2018 20:47:04 for RuleMasterID: 1', N'RUNNING', 38, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (84, CAST(0x0000A88E015EC2BA AS DateTime), N'RuleEngine Service Mode:INTERVAL, 21-02-2018 21:17:04', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (85, CAST(0x0000A88E015EC2E3 AS DateTime), N'RuleEngine Service run at 21-02-2018 21:17:04 for RuleMasterID: 1', N'RUNNING', 39, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (86, CAST(0x0000A88E01670044 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 21-02-2018 21:47:04', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (87, CAST(0x0000A88E01670068 AS DateTime), N'RuleEngine Service run at 21-02-2018 21:47:05 for RuleMasterID: 1', N'RUNNING', 40, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (88, CAST(0x0000A88E016F3DC9 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 21-02-2018 22:17:05', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (89, CAST(0x0000A88E016F3DF0 AS DateTime), N'RuleEngine Service run at 21-02-2018 22:17:05 for RuleMasterID: 1', N'RUNNING', 41, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (90, CAST(0x0000A88E01777B51 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 21-02-2018 22:47:05', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (91, CAST(0x0000A88E01777B76 AS DateTime), N'RuleEngine Service run at 21-02-2018 22:47:05 for RuleMasterID: 1', N'RUNNING', 42, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (92, CAST(0x0000A88E017FB8D7 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 21-02-2018 23:17:05', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (93, CAST(0x0000A88E017FB8FB AS DateTime), N'RuleEngine Service run at 21-02-2018 23:17:05 for RuleMasterID: 1', N'RUNNING', 43, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (94, CAST(0x0000A88E0187F65C AS DateTime), N'RuleEngine Service Mode:INTERVAL, 21-02-2018 23:47:05', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (95, CAST(0x0000A88E0187F675 AS DateTime), N'RuleEngine Service run at 21-02-2018 23:47:05 for RuleMasterID: 1', N'RUNNING', 44, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (96, CAST(0x0000A88F0004B1D6 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 00:17:05', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (97, CAST(0x0000A88F0004B20F AS DateTime), N'RuleEngine Service run at 22-02-2018 00:17:05 for RuleMasterID: 1', N'RUNNING', 45, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (98, CAST(0x0000A88F000CEF77 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 00:47:05', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (99, CAST(0x0000A88F000CEF9A AS DateTime), N'RuleEngine Service run at 22-02-2018 00:47:05 for RuleMasterID: 1', N'RUNNING', 46, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (100, CAST(0x0000A88F00152CFB AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 01:17:05', N'RUNNING', 0, 0)
GO
print 'Processed 100 total records'
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (101, CAST(0x0000A88F00152D21 AS DateTime), N'RuleEngine Service run at 22-02-2018 01:17:06 for RuleMasterID: 1', N'RUNNING', 47, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (102, CAST(0x0000A88F001D6A82 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 01:47:06', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (103, CAST(0x0000A88F001D6AA9 AS DateTime), N'RuleEngine Service run at 22-02-2018 01:47:06 for RuleMasterID: 1', N'RUNNING', 48, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (104, CAST(0x0000A88F0025A80A AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 02:17:06', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (105, CAST(0x0000A88F0025A82E AS DateTime), N'RuleEngine Service run at 22-02-2018 02:17:06 for RuleMasterID: 1', N'RUNNING', 49, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (106, CAST(0x0000A88F002DE58F AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 02:47:06', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (107, CAST(0x0000A88F002DE5B7 AS DateTime), N'RuleEngine Service run at 22-02-2018 02:47:06 for RuleMasterID: 1', N'RUNNING', 50, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (108, CAST(0x0000A88F00362318 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 03:17:06', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (109, CAST(0x0000A88F0036233F AS DateTime), N'RuleEngine Service run at 22-02-2018 03:17:06 for RuleMasterID: 1', N'RUNNING', 51, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (110, CAST(0x0000A88F003E60A1 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 03:47:06', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (111, CAST(0x0000A88F003E60C0 AS DateTime), N'RuleEngine Service run at 22-02-2018 03:47:06 for RuleMasterID: 1', N'RUNNING', 52, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (112, CAST(0x0000A88F00469E23 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 04:17:06', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (113, CAST(0x0000A88F00469E4C AS DateTime), N'RuleEngine Service run at 22-02-2018 04:17:06 for RuleMasterID: 1', N'RUNNING', 53, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (114, CAST(0x0000A88F004EDBAD AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 04:47:06', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (115, CAST(0x0000A88F004EDBD7 AS DateTime), N'RuleEngine Service run at 22-02-2018 04:47:06 for RuleMasterID: 1', N'RUNNING', 54, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (116, CAST(0x0000A88F0057193A AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 05:17:06', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (117, CAST(0x0000A88F00571964 AS DateTime), N'RuleEngine Service run at 22-02-2018 05:17:07 for RuleMasterID: 1', N'RUNNING', 55, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (118, CAST(0x0000A88F005F56C5 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 05:47:07', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (119, CAST(0x0000A88F005F56E9 AS DateTime), N'RuleEngine Service run at 22-02-2018 05:47:07 for RuleMasterID: 1', N'RUNNING', 56, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (120, CAST(0x0000A88F0067944B AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 06:17:07', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (121, CAST(0x0000A88F00679470 AS DateTime), N'RuleEngine Service run at 22-02-2018 06:17:07 for RuleMasterID: 1', N'RUNNING', 57, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (122, CAST(0x0000A88F006FD1D2 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 06:47:07', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (123, CAST(0x0000A88F006FD1F9 AS DateTime), N'RuleEngine Service run at 22-02-2018 06:47:07 for RuleMasterID: 1', N'RUNNING', 58, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (124, CAST(0x0000A88F00780F5D AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 07:17:07', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (125, CAST(0x0000A88F00780F8A AS DateTime), N'RuleEngine Service run at 22-02-2018 07:17:07 for RuleMasterID: 1', N'RUNNING', 59, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (126, CAST(0x0000A88F00804CEB AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 07:47:07', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (127, CAST(0x0000A88F00804D0E AS DateTime), N'RuleEngine Service run at 22-02-2018 07:47:07 for RuleMasterID: 1', N'RUNNING', 60, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (128, CAST(0x0000A88F00888A72 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 08:17:07', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (129, CAST(0x0000A88F00888A9E AS DateTime), N'RuleEngine Service run at 22-02-2018 08:17:07 for RuleMasterID: 1', N'RUNNING', 61, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (130, CAST(0x0000A88F0090C7FF AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 08:47:07', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (131, CAST(0x0000A88F0090C82F AS DateTime), N'RuleEngine Service run at 22-02-2018 08:47:08 for RuleMasterID: 1', N'RUNNING', 62, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (132, CAST(0x0000A88F00990594 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 09:17:08', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (133, CAST(0x0000A88F009905BD AS DateTime), N'RuleEngine Service run at 22-02-2018 09:17:08 for RuleMasterID: 1', N'RUNNING', 63, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (134, CAST(0x0000A88F00A1431E AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 09:47:08', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (135, CAST(0x0000A88F00A14345 AS DateTime), N'RuleEngine Service run at 22-02-2018 09:47:08 for RuleMasterID: 1', N'RUNNING', 64, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (136, CAST(0x0000A88F00A980A8 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 10:17:08', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (137, CAST(0x0000A88F00A980C7 AS DateTime), N'RuleEngine Service run at 22-02-2018 10:17:08 for RuleMasterID: 1', N'RUNNING', 65, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (138, CAST(0x0000A88F00B1BE28 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 10:47:08', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (139, CAST(0x0000A88F00B1BE51 AS DateTime), N'RuleEngine Service run at 22-02-2018 10:47:08 for RuleMasterID: 1', N'RUNNING', 66, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (140, CAST(0x0000A88F00B9FBB6 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 11:17:08', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (141, CAST(0x0000A88F00B9FBE5 AS DateTime), N'RuleEngine Service run at 22-02-2018 11:17:08 for RuleMasterID: 1', N'RUNNING', 67, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (142, CAST(0x0000A88F00C23946 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 11:47:08', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (143, CAST(0x0000A88F00C2396A AS DateTime), N'RuleEngine Service run at 22-02-2018 11:47:08 for RuleMasterID: 1', N'RUNNING', 68, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (144, CAST(0x0000A88F00CA76CB AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 12:17:08', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (145, CAST(0x0000A88F00CA76F4 AS DateTime), N'RuleEngine Service run at 22-02-2018 12:17:09 for RuleMasterID: 1', N'RUNNING', 69, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (146, CAST(0x0000A88F00D2B45B AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 12:47:09', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (147, CAST(0x0000A88F00D2B4D9 AS DateTime), N'RuleEngine Service run at 22-02-2018 12:47:09 for RuleMasterID: 1', N'RUNNING', 70, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (148, CAST(0x0000A88F00DAF23C AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 13:17:09', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (149, CAST(0x0000A88F00DAF2A9 AS DateTime), N'RuleEngine Service run at 22-02-2018 13:17:09 for RuleMasterID: 1', N'RUNNING', 71, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (150, CAST(0x0000A88F00E33014 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 13:47:09', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (151, CAST(0x0000A88F00E33048 AS DateTime), N'RuleEngine Service run at 22-02-2018 13:47:10 for RuleMasterID: 1', N'RUNNING', 72, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (152, CAST(0x0000A88F00EB6DAA AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 14:17:10', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (153, CAST(0x0000A88F00EB6DCB AS DateTime), N'RuleEngine Service run at 22-02-2018 14:17:10 for RuleMasterID: 1', N'RUNNING', 73, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (154, CAST(0x0000A88F00F3AB31 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 14:47:10', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (155, CAST(0x0000A88F00F3ABA2 AS DateTime), N'RuleEngine Service run at 22-02-2018 14:47:10 for RuleMasterID: 1', N'RUNNING', 74, 3)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (156, CAST(0x0000A88F00F7941B AS DateTime), N'RuleEngine Service stopped at 22-02-2018 15:01:24', N'STOP', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (157, CAST(0x0000A88F0143A8A3 AS DateTime), N'RuleEngine Service started at 22-02-2018 19:38:24', N'START', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (158, CAST(0x0000A88F0143A901 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 19:38:24', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (159, CAST(0x0000A88F0143A9B1 AS DateTime), N'RuleEngine Service run at 22-02-2018 19:38:25 for RuleMasterID: 1', N'RUNNING', 75, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (160, CAST(0x0000A88F014BE713 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 20:08:25', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (161, CAST(0x0000A88F014BE75B AS DateTime), N'RuleEngine Service run at 22-02-2018 20:08:25 for RuleMasterID: 1', N'RUNNING', 76, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (162, CAST(0x0000A88F015424BC AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 20:38:25', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (163, CAST(0x0000A88F0154250A AS DateTime), N'RuleEngine Service run at 22-02-2018 20:38:25 for RuleMasterID: 1', N'RUNNING', 77, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (164, CAST(0x0000A88F015C626B AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 21:08:25', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (165, CAST(0x0000A88F015C62A6 AS DateTime), N'RuleEngine Service run at 22-02-2018 21:08:25 for RuleMasterID: 1', N'RUNNING', 78, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (166, CAST(0x0000A88F0164A008 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 21:38:25', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (167, CAST(0x0000A88F0164A063 AS DateTime), N'RuleEngine Service run at 22-02-2018 21:38:26 for RuleMasterID: 1', N'RUNNING', 79, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (168, CAST(0x0000A88F016CDDC5 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 22:08:26', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (169, CAST(0x0000A88F016CDDF8 AS DateTime), N'RuleEngine Service run at 22-02-2018 22:08:26 for RuleMasterID: 1', N'RUNNING', 80, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (170, CAST(0x0000A88F01751B59 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 22:38:26', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (171, CAST(0x0000A88F01751BC4 AS DateTime), N'RuleEngine Service run at 22-02-2018 22:38:26 for RuleMasterID: 1', N'RUNNING', 81, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (172, CAST(0x0000A88F017D5925 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 23:08:26', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (173, CAST(0x0000A88F017D596A AS DateTime), N'RuleEngine Service run at 22-02-2018 23:08:27 for RuleMasterID: 1', N'RUNNING', 82, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (174, CAST(0x0000A88F018596D0 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 22-02-2018 23:38:27', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (175, CAST(0x0000A88F01859717 AS DateTime), N'RuleEngine Service run at 22-02-2018 23:38:27 for RuleMasterID: 1', N'RUNNING', 83, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (176, CAST(0x0000A8900002527B AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 00:08:27', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (177, CAST(0x0000A89000025298 AS DateTime), N'RuleEngine Service run at 23-02-2018 00:08:27 for RuleMasterID: 1', N'RUNNING', 84, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (178, CAST(0x0000A890000A8FFC AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 00:38:27', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (179, CAST(0x0000A890000A9050 AS DateTime), N'RuleEngine Service run at 23-02-2018 00:38:27 for RuleMasterID: 1', N'RUNNING', 85, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (180, CAST(0x0000A8900012CDB1 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 01:08:27', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (181, CAST(0x0000A8900012CDD6 AS DateTime), N'RuleEngine Service run at 23-02-2018 01:08:27 for RuleMasterID: 1', N'RUNNING', 86, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (182, CAST(0x0000A890001B0B38 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 01:38:27', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (183, CAST(0x0000A890001B0B8C AS DateTime), N'RuleEngine Service run at 23-02-2018 01:38:28 for RuleMasterID: 1', N'RUNNING', 87, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (184, CAST(0x0000A890002348EE AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 02:08:28', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (185, CAST(0x0000A89000234935 AS DateTime), N'RuleEngine Service run at 23-02-2018 02:08:28 for RuleMasterID: 1', N'RUNNING', 88, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (186, CAST(0x0000A890002B86AC AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 02:38:28', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (187, CAST(0x0000A890002B870D AS DateTime), N'RuleEngine Service run at 23-02-2018 02:38:28 for RuleMasterID: 1', N'RUNNING', 89, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (188, CAST(0x0000A8900033C46E AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 03:08:28', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (189, CAST(0x0000A8900033C4A7 AS DateTime), N'RuleEngine Service run at 23-02-2018 03:08:28 for RuleMasterID: 1', N'RUNNING', 90, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (190, CAST(0x0000A890003C0208 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 03:38:28', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (191, CAST(0x0000A890003C0237 AS DateTime), N'RuleEngine Service run at 23-02-2018 03:38:29 for RuleMasterID: 1', N'RUNNING', 91, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (192, CAST(0x0000A89000443FB5 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 04:08:29', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (193, CAST(0x0000A89000443FDA AS DateTime), N'RuleEngine Service run at 23-02-2018 04:08:29 for RuleMasterID: 1', N'RUNNING', 92, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (194, CAST(0x0000A890004C7D45 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 04:38:29', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (195, CAST(0x0000A890004C7D7B AS DateTime), N'RuleEngine Service run at 23-02-2018 04:38:29 for RuleMasterID: 1', N'RUNNING', 93, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (196, CAST(0x0000A8900054BADE AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 05:08:29', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (197, CAST(0x0000A8900054BB0B AS DateTime), N'RuleEngine Service run at 23-02-2018 05:08:29 for RuleMasterID: 1', N'RUNNING', 94, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (198, CAST(0x0000A890005CF86C AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 05:38:29', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (199, CAST(0x0000A890005CF8A2 AS DateTime), N'RuleEngine Service run at 23-02-2018 05:38:29 for RuleMasterID: 1', N'RUNNING', 95, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (200, CAST(0x0000A89000653604 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 06:08:29', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (201, CAST(0x0000A89000653658 AS DateTime), N'RuleEngine Service run at 23-02-2018 06:08:30 for RuleMasterID: 1', N'RUNNING', 96, 2)
GO
print 'Processed 200 total records'
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (202, CAST(0x0000A890006D73BB AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 06:38:30', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (203, CAST(0x0000A890006D7400 AS DateTime), N'RuleEngine Service run at 23-02-2018 06:38:30 for RuleMasterID: 1', N'RUNNING', 97, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (204, CAST(0x0000A8900075B160 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 07:08:30', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (205, CAST(0x0000A8900075B181 AS DateTime), N'RuleEngine Service run at 23-02-2018 07:08:30 for RuleMasterID: 1', N'RUNNING', 98, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (206, CAST(0x0000A890007DEEE2 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 07:38:30', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (207, CAST(0x0000A890007DEF1C AS DateTime), N'RuleEngine Service run at 23-02-2018 07:38:30 for RuleMasterID: 1', N'RUNNING', 99, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (208, CAST(0x0000A89000862C7F AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 08:08:30', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (209, CAST(0x0000A89000862CA6 AS DateTime), N'RuleEngine Service run at 23-02-2018 08:08:30 for RuleMasterID: 1', N'RUNNING', 100, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (210, CAST(0x0000A890008E6A07 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 08:38:30', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (211, CAST(0x0000A890008E6A31 AS DateTime), N'RuleEngine Service run at 23-02-2018 08:38:30 for RuleMasterID: 1', N'RUNNING', 101, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (212, CAST(0x0000A8900096A792 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 09:08:30', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (213, CAST(0x0000A8900096A7CE AS DateTime), N'RuleEngine Service run at 23-02-2018 09:08:31 for RuleMasterID: 1', N'RUNNING', 102, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (214, CAST(0x0000A890009EE533 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 09:38:31', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (215, CAST(0x0000A890009EE571 AS DateTime), N'RuleEngine Service run at 23-02-2018 09:38:31 for RuleMasterID: 1', N'RUNNING', 103, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (216, CAST(0x0000A89000A722D2 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 10:08:31', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (217, CAST(0x0000A89000A72309 AS DateTime), N'RuleEngine Service run at 23-02-2018 10:08:31 for RuleMasterID: 1', N'RUNNING', 104, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (218, CAST(0x0000A89000AF606D AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 10:38:31', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (219, CAST(0x0000A89000AF6094 AS DateTime), N'RuleEngine Service run at 23-02-2018 10:38:31 for RuleMasterID: 1', N'RUNNING', 105, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (220, CAST(0x0000A89000B79DF7 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 11:08:31', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (221, CAST(0x0000A89000B79E34 AS DateTime), N'RuleEngine Service run at 23-02-2018 11:08:31 for RuleMasterID: 1', N'RUNNING', 106, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (222, CAST(0x0000A89000BFDB99 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 11:38:31', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (223, CAST(0x0000A89000BFDBD9 AS DateTime), N'RuleEngine Service run at 23-02-2018 11:38:32 for RuleMasterID: 1', N'RUNNING', 107, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (224, CAST(0x0000A89000C81939 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 12:08:32', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (225, CAST(0x0000A89000C8195F AS DateTime), N'RuleEngine Service run at 23-02-2018 12:08:32 for RuleMasterID: 1', N'RUNNING', 108, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (226, CAST(0x0000A89000D056C1 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 12:38:32', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (227, CAST(0x0000A89000D056E8 AS DateTime), N'RuleEngine Service run at 23-02-2018 12:38:32 for RuleMasterID: 1', N'RUNNING', 109, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (228, CAST(0x0000A89000D3A75B AS DateTime), N'RuleEngine Service stopped at 23-02-2018 12:50:36', N'STOP', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (229, CAST(0x0000A89000E927F4 AS DateTime), N'RuleEngine Service started at 23-02-2018 14:08:53', N'START', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (230, CAST(0x0000A89000E92870 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 14:08:54', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (231, CAST(0x0000A89000E928FC AS DateTime), N'RuleEngine Service run at 23-02-2018 14:08:54 for RuleMasterID: 1', N'RUNNING', 110, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (232, CAST(0x0000A89000EE30B2 AS DateTime), N'RuleEngine Service stopped at 23-02-2018 14:27:13', N'STOP', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (233, CAST(0x0000A89001124A10 AS DateTime), N'RuleEngine Service started at 23-02-2018 16:38:39', N'START', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (234, CAST(0x0000A89001124A25 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 16:38:39', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (235, CAST(0x0000A89001124A62 AS DateTime), N'RuleEngine Service run at 23-02-2018 16:38:39 for RuleMasterID: 1', N'RUNNING', 111, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (236, CAST(0x0000A890011A87C3 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 17:08:39', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (237, CAST(0x0000A890011A87E9 AS DateTime), N'RuleEngine Service run at 23-02-2018 17:08:39 for RuleMasterID: 1', N'RUNNING', 112, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (238, CAST(0x0000A8900122C54A AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 17:38:39', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (239, CAST(0x0000A8900122C577 AS DateTime), N'RuleEngine Service run at 23-02-2018 17:38:39 for RuleMasterID: 1', N'RUNNING', 113, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (240, CAST(0x0000A890012B02DA AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 18:08:39', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (241, CAST(0x0000A890012B030C AS DateTime), N'RuleEngine Service run at 23-02-2018 18:08:40 for RuleMasterID: 1', N'RUNNING', 114, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (242, CAST(0x0000A89001334073 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 18:38:40', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (243, CAST(0x0000A8900133408E AS DateTime), N'RuleEngine Service run at 23-02-2018 18:38:40 for RuleMasterID: 1', N'RUNNING', 115, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (244, CAST(0x0000A890013B7DEE AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 19:08:40', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (245, CAST(0x0000A890013B7E12 AS DateTime), N'RuleEngine Service run at 23-02-2018 19:08:40 for RuleMasterID: 1', N'RUNNING', 116, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (246, CAST(0x0000A8900143BB73 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 19:38:40', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (247, CAST(0x0000A8900143BBA1 AS DateTime), N'RuleEngine Service run at 23-02-2018 19:38:40 for RuleMasterID: 1', N'RUNNING', 117, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (248, CAST(0x0000A890014BF905 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 23-02-2018 20:08:40', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (249, CAST(0x0000A890014BF932 AS DateTime), N'RuleEngine Service run at 23-02-2018 20:08:40 for RuleMasterID: 1', N'RUNNING', 118, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (250, CAST(0x0000A8900151543E AS DateTime), N'RuleEngine Service stopped at 23-02-2018 20:28:10', N'STOP', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (251, CAST(0x0000A89301085DA9 AS DateTime), N'RuleEngine Service started at 26-02-2018 16:02:31', N'START', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (252, CAST(0x0000A89301085DF3 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 26-02-2018 16:02:31', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (253, CAST(0x0000A89301085E7B AS DateTime), N'RuleEngine Service run at 26-02-2018 16:02:32 for RuleMasterID: 1', N'RUNNING', 119, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (254, CAST(0x0000A89301109BDD AS DateTime), N'RuleEngine Service Mode:INTERVAL, 26-02-2018 16:32:32', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (255, CAST(0x0000A89301109C0F AS DateTime), N'RuleEngine Service run at 26-02-2018 16:32:32 for RuleMasterID: 1', N'RUNNING', 120, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (256, CAST(0x0000A8930118D970 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 26-02-2018 17:02:32', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (257, CAST(0x0000A8930118D98E AS DateTime), N'RuleEngine Service run at 26-02-2018 17:02:32 for RuleMasterID: 1', N'RUNNING', 121, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (258, CAST(0x0000A893012116EF AS DateTime), N'RuleEngine Service Mode:INTERVAL, 26-02-2018 17:32:32', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (259, CAST(0x0000A89301211717 AS DateTime), N'RuleEngine Service run at 26-02-2018 17:32:32 for RuleMasterID: 1', N'RUNNING', 122, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (260, CAST(0x0000A8930189681A AS DateTime), N'RuleEngine Service Mode:INTERVAL, 26-02-2018 23:52:20', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (261, CAST(0x0000A89301896959 AS DateTime), N'RuleEngine Service run at 26-02-2018 23:52:22 for RuleMasterID: 1', N'RUNNING', 123, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (262, CAST(0x0000A895011041A5 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 28-02-2018 16:31:15', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (263, CAST(0x0000A895011041F3 AS DateTime), N'RuleEngine Service run at 28-02-2018 16:31:15 for RuleMasterID: 1', N'RUNNING', 124, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (264, CAST(0x0000A89501187F55 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 28-02-2018 17:01:15', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (265, CAST(0x0000A89501187FA2 AS DateTime), N'RuleEngine Service run at 28-02-2018 17:01:15 for RuleMasterID: 1', N'RUNNING', 125, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (266, CAST(0x0000A89A00D7DF76 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 05-03-2018 13:05:58', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (267, CAST(0x0000A89A00D7DFAF AS DateTime), N'RuleEngine Service run at 05-03-2018 13:05:58 for RuleMasterID: 1', N'RUNNING', 126, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (268, CAST(0x0000A89A00E01D20 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 05-03-2018 13:35:58', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (269, CAST(0x0000A89A00E01DAA AS DateTime), N'RuleEngine Service run at 05-03-2018 13:35:58 for RuleMasterID: 1', N'RUNNING', 127, 2)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (270, CAST(0x0000A89B00E854EF AS DateTime), N'RuleEngine Service Adhoc Run:06-03-2018 14:05:53', N'START', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (271, CAST(0x0000A89B00E8569C AS DateTime), N'RuleEngine Service run at 06-03-2018 14:05:55 for RuleMasterID: 1', N'RUNNING', 128, 3)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (272, CAST(0x0000A89B00E8569D AS DateTime), N'RuleEngine Service Adhoc Run:06-03-2018 14:05:55', N'STOP', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (273, CAST(0x0000A89B00E9681C AS DateTime), N'RuleEngine Service Adhoc Run:06-03-2018 14:09:48', N'START', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (274, CAST(0x0000A89B00EA1230 AS DateTime), N'RuleEngine Service run at 06-03-2018 14:12:13 for RuleMasterID: 1', N'RUNNING', 129, 3)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (275, CAST(0x0000A89B00EA1231 AS DateTime), N'RuleEngine Service Adhoc Run:06-03-2018 14:12:13', N'STOP', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (276, CAST(0x0000A89B00EA97B3 AS DateTime), N'RuleEngine Service Adhoc Run:06-03-2018 14:14:07', N'START', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (277, CAST(0x0000A89B00EA9D97 AS DateTime), N'RuleEngine Service run at 06-03-2018 14:14:12 for RuleMasterID: 1', N'RUNNING', 130, 3)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (278, CAST(0x0000A89B00EA9D98 AS DateTime), N'RuleEngine Service Adhoc Run:06-03-2018 14:14:12', N'STOP', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (279, CAST(0x0000A89B00EC4B8B AS DateTime), N'RuleEngine Service started at 06-03-2018 14:20:19', N'START', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (280, CAST(0x0000A89B00EC4C39 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 06-03-2018 14:20:20', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (281, CAST(0x0000A89B00EC4D8A AS DateTime), N'RuleEngine Service run at 06-03-2018 14:20:21 for RuleMasterID: 1', N'RUNNING', 131, 3)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (282, CAST(0x0000A89B00F48AF0 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 06-03-2018 14:50:21', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (283, CAST(0x0000A89B00F48B57 AS DateTime), N'RuleEngine Service run at 06-03-2018 14:50:21 for RuleMasterID: 1', N'RUNNING', 132, 3)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (284, CAST(0x0000A89B00FCC8B8 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 06-03-2018 15:20:21', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (285, CAST(0x0000A89B00FCC8E4 AS DateTime), N'RuleEngine Service run at 06-03-2018 15:20:21 for RuleMasterID: 1', N'RUNNING', 133, 3)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (286, CAST(0x0000A89B0106F2FB AS DateTime), N'RuleEngine Service Mode:INTERVAL, 06-03-2018 15:57:22', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (287, CAST(0x0000A89B0106F3C2 AS DateTime), N'RuleEngine Service run at 06-03-2018 15:57:22 for RuleMasterID: 1', N'RUNNING', 134, 3)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (288, CAST(0x0000A89B010F3123 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 06-03-2018 16:27:22', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (289, CAST(0x0000A89B010F318E AS DateTime), N'RuleEngine Service run at 06-03-2018 16:27:23 for RuleMasterID: 1', N'RUNNING', 135, 3)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (290, CAST(0x0000A89B01176EEE AS DateTime), N'RuleEngine Service Mode:INTERVAL, 06-03-2018 16:57:23', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (291, CAST(0x0000A89B01176F1F AS DateTime), N'RuleEngine Service run at 06-03-2018 16:57:23 for RuleMasterID: 1', N'RUNNING', 136, 3)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (292, CAST(0x0000A89B011FAC7F AS DateTime), N'RuleEngine Service Mode:INTERVAL, 06-03-2018 17:27:23', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (293, CAST(0x0000A89B011FACA1 AS DateTime), N'RuleEngine Service run at 06-03-2018 17:27:23 for RuleMasterID: 1', N'RUNNING', 137, 3)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (294, CAST(0x0000A89B0127EA02 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 06-03-2018 17:57:23', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (295, CAST(0x0000A89B0127EA29 AS DateTime), N'RuleEngine Service run at 06-03-2018 17:57:23 for RuleMasterID: 1', N'RUNNING', 138, 3)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (296, CAST(0x0000A89B0130278D AS DateTime), N'RuleEngine Service Mode:INTERVAL, 06-03-2018 18:27:23', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (297, CAST(0x0000A89B013027B5 AS DateTime), N'RuleEngine Service run at 06-03-2018 18:27:23 for RuleMasterID: 1', N'RUNNING', 139, 3)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (298, CAST(0x0000A89B01386516 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 06-03-2018 18:57:23', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (299, CAST(0x0000A89B01386539 AS DateTime), N'RuleEngine Service run at 06-03-2018 18:57:23 for RuleMasterID: 1', N'RUNNING', 140, 3)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (300, CAST(0x0000A89B013E01C6 AS DateTime), N'RuleEngine Service stopped at 06-03-2018 19:17:49', N'STOP', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (301, CAST(0x0000A89C01368494 AS DateTime), N'RuleEngine Service started at 07-03-2018 18:50:33', N'START', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (302, CAST(0x0000A89C013687A5 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 07-03-2018 18:50:36', N'RUNNING', 0, 0)
GO
print 'Processed 300 total records'
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (303, CAST(0x0000A89C013689D0 AS DateTime), N'RuleEngine Service run at 07-03-2018 18:50:38 for RuleMasterID: 1', N'RUNNING', 141, 3)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (304, CAST(0x0000A89C013EC731 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 07-03-2018 19:20:38', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (305, CAST(0x0000A89C013EC7BE AS DateTime), N'RuleEngine Service run at 07-03-2018 19:20:38 for RuleMasterID: 1', N'RUNNING', 142, 3)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (306, CAST(0x0000A89C0147051F AS DateTime), N'RuleEngine Service Mode:INTERVAL, 07-03-2018 19:50:38', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (307, CAST(0x0000A89C0147054F AS DateTime), N'RuleEngine Service run at 07-03-2018 19:50:38 for RuleMasterID: 1', N'RUNNING', 143, 3)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (308, CAST(0x0000A89C014B422F AS DateTime), N'RuleEngine Service stopped at 07-03-2018 20:06:04', N'STOP', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (309, CAST(0x0000A8A3011BD786 AS DateTime), N'RuleEngine Service started at 14-03-2018 17:13:26', N'START', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (310, CAST(0x0000A8A3011BD8BB AS DateTime), N'RuleEngine Service Mode:INTERVAL, 14-03-2018 17:13:27', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (311, CAST(0x0000A8A3011BD992 AS DateTime), N'RuleEngine Service run at 14-03-2018 17:13:27 for RuleMasterID: 1', N'RUNNING', 144, 3)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (312, CAST(0x0000A8A301241716 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 14-03-2018 17:43:28', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (313, CAST(0x0000A8A3012417E9 AS DateTime), N'RuleEngine Service run at 14-03-2018 17:43:28 for RuleMasterID: 1', N'RUNNING', 145, 3)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (314, CAST(0x0000A8A3012C556C AS DateTime), N'RuleEngine Service Mode:INTERVAL, 14-03-2018 18:13:28', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (315, CAST(0x0000A8A3012C55EA AS DateTime), N'RuleEngine Service run at 14-03-2018 18:13:29 for RuleMasterID: 1', N'RUNNING', 146, 3)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (316, CAST(0x0000A8A30134934D AS DateTime), N'RuleEngine Service Mode:INTERVAL, 14-03-2018 18:43:29', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (317, CAST(0x0000A8A30134939D AS DateTime), N'RuleEngine Service run at 14-03-2018 18:43:29 for RuleMasterID: 1', N'RUNNING', 147, 3)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (318, CAST(0x0000A8A3013CD130 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 14-03-2018 19:13:29', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (319, CAST(0x0000A8A3013CD177 AS DateTime), N'RuleEngine Service run at 14-03-2018 19:13:29 for RuleMasterID: 1', N'RUNNING', 148, 3)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (320, CAST(0x0000A8A301450ED7 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 14-03-2018 19:43:29', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (321, CAST(0x0000A8A301450F0C AS DateTime), N'RuleEngine Service run at 14-03-2018 19:43:30 for RuleMasterID: 1', N'RUNNING', 149, 3)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (322, CAST(0x0000A8A3014D4C75 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 14-03-2018 20:13:30', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (323, CAST(0x0000A8A3014D4D2E AS DateTime), N'RuleEngine Service run at 14-03-2018 20:13:30 for RuleMasterID: 1', N'RUNNING', 150, 3)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (324, CAST(0x0000A8A500E40E39 AS DateTime), N'RuleEngine Service started at 16-03-2018 13:50:19', N'START', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (325, CAST(0x0000A8A500E410B3 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 16-03-2018 13:50:21', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (326, CAST(0x0000A8A500E413A0 AS DateTime), N'RuleEngine Service run at 16-03-2018 13:50:24 for RuleMasterID: 1', N'RUNNING', 151, 3)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (327, CAST(0x0000A8A500E7E314 AS DateTime), N'RuleEngine Service stopped at 16-03-2018 14:04:16', N'STOP', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (328, CAST(0x0000A8A801229A9E AS DateTime), N'RuleEngine Service started at 19-03-2018 17:38:03', N'START', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (329, CAST(0x0000A8A801229B51 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 19-03-2018 17:38:04', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (330, CAST(0x0000A8A801229C57 AS DateTime), N'RuleEngine Service run at 19-03-2018 17:38:04 for RuleMasterID: 1', N'RUNNING', 152, 3)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (331, CAST(0x0000A8A8012AD9B8 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 19-03-2018 18:08:04', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (332, CAST(0x0000A8A8012AD9E4 AS DateTime), N'RuleEngine Service run at 19-03-2018 18:08:05 for RuleMasterID: 1', N'RUNNING', 153, 3)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (333, CAST(0x0000A8A801331765 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 19-03-2018 18:38:05', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (334, CAST(0x0000A8A8013317D2 AS DateTime), N'RuleEngine Service run at 19-03-2018 18:38:05 for RuleMasterID: 1', N'RUNNING', 154, 3)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (335, CAST(0x0000A8A8013B5533 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 19-03-2018 19:08:05', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (336, CAST(0x0000A8A8013B5561 AS DateTime), N'RuleEngine Service run at 19-03-2018 19:08:05 for RuleMasterID: 1', N'RUNNING', 155, 3)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (337, CAST(0x0000A8A8014392C3 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 19-03-2018 19:38:05', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (338, CAST(0x0000A8A8014392EB AS DateTime), N'RuleEngine Service run at 19-03-2018 19:38:05 for RuleMasterID: 1', N'RUNNING', 156, 3)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (339, CAST(0x0000A8A8014BD04D AS DateTime), N'RuleEngine Service Mode:INTERVAL, 19-03-2018 20:08:05', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (340, CAST(0x0000A8A8014BD07C AS DateTime), N'RuleEngine Service run at 19-03-2018 20:08:05 for RuleMasterID: 1', N'RUNNING', 157, 3)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (341, CAST(0x0000A8A801509229 AS DateTime), N'RuleEngine Service stopped at 19-03-2018 20:25:25', N'STOP', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (342, CAST(0x0000A8B200D3EA17 AS DateTime), N'RuleEngine Service started at 29-03-2018 12:51:33', N'START', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (343, CAST(0x0000A8B200D3EBA9 AS DateTime), N'RuleEngine Service Mode:INTERVAL, 29-03-2018 12:51:34', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (344, CAST(0x0000A8B200D3ECBB AS DateTime), N'RuleEngine Service run at 29-03-2018 12:51:35 for RuleMasterID: 1', N'RUNNING', 158, 3)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (345, CAST(0x0000A8B200DC2A1C AS DateTime), N'RuleEngine Service Mode:INTERVAL, 29-03-2018 13:21:35', N'RUNNING', 0, 0)
INSERT [dbo].[ServiceHistory] ([ID], [RunTime], [Comment], [Status], [RunID], [NoOfFile]) VALUES (346, CAST(0x0000A8B200DC2A52 AS DateTime), N'RuleEngine Service run at 29-03-2018 13:21:35 for RuleMasterID: 1', N'RUNNING', 159, 3)
SET IDENTITY_INSERT [dbo].[ServiceHistory] OFF
/****** Object:  Table [dbo].[RuleMast]    Script Date: 03/29/2018 13:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RuleMast](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[RuleName] [nvarchar](500) NULL,
	[CreateDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_RuleMast] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RuleMast] ON
INSERT [dbo].[RuleMast] ([ID], [RuleName], [CreateDate], [ModifiedDate], [IsActive]) VALUES (1, N'Principal Amount', CAST(0x0000A87000000000 AS DateTime), CAST(0x0000A88001377757 AS DateTime), 1)
INSERT [dbo].[RuleMast] ([ID], [RuleName], [CreateDate], [ModifiedDate], [IsActive]) VALUES (2, N'Interest Rate', CAST(0x0000A87000000000 AS DateTime), CAST(0x0000A87000000000 AS DateTime), 1)
INSERT [dbo].[RuleMast] ([ID], [RuleName], [CreateDate], [ModifiedDate], [IsActive]) VALUES (3, N'Policy', CAST(0x0000A8B1012A9420 AS DateTime), CAST(0x0000A8B1012A9420 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[RuleMast] OFF
/****** Object:  Table [dbo].[RuleEngineDetails]    Script Date: 03/29/2018 13:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RuleEngineDetails](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[RuleMastID] [bigint] NULL,
	[RuleDescID] [nvarchar](2048) NULL,
	[FolderPath] [nvarchar](2048) NULL,
	[UserID] [bigint] NULL,
	[CreateDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_RuleEngineDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RuleEngineDetails] ON
INSERT [dbo].[RuleEngineDetails] ([ID], [RuleMastID], [RuleDescID], [FolderPath], [UserID], [CreateDate], [ModifiedDate], [IsActive]) VALUES (1, 1, N'3,4', N'E:\Document\RuleEngineDoc', 1, CAST(0x0000A88E01414E99 AS DateTime), CAST(0x0000A88E01414E99 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[RuleEngineDetails] OFF
/****** Object:  Table [dbo].[RuleDesc]    Script Date: 03/29/2018 13:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RuleDesc](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[RuleMastID] [bigint] NULL,
	[RuleName] [varchar](50) NULL,
	[SplitAs] [varchar](50) NULL,
	[Dictionary] [varchar](50) NULL,
	[OriginalDocumentName] [nvarchar](max) NULL,
	[ConvertedDocumentName] [nvarchar](max) NULL,
	[EntryDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[NeighbourhoodCount] [int] NULL,
	[Expression1] [nvarchar](1024) NULL,
	[Expression2] [nvarchar](1024) NULL,
	[ContextWord] [nvarchar](1024) NULL,
	[Operator] [varchar](50) NULL,
	[FieldName] [nvarchar](2048) NULL,
	[FieldValue] [nvarchar](max) NULL,
	[UploadedFile] [nvarchar](max) NULL,
	[IsIgnoreKeyword] [bit] NULL,
	[FieldPosition] [varchar](50) NULL,
	[Synonyms] [nvarchar](max) NULL,
	[ExpressionContext] [varchar](50) NULL,
	[IsCheckSynonyms] [bit] NULL,
	[AllSynonyms] [nvarchar](max) NULL,
	[DocType] [varchar](8) NULL,
	[ParentRuleID] [bigint] NULL,
 CONSTRAINT [PK_RuleDesc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[RuleDesc] ON
INSERT [dbo].[RuleDesc] ([ID], [RuleMastID], [RuleName], [SplitAs], [Dictionary], [OriginalDocumentName], [ConvertedDocumentName], [EntryDate], [ModifiedDate], [IsActive], [NeighbourhoodCount], [Expression1], [Expression2], [ContextWord], [Operator], [FieldName], [FieldValue], [UploadedFile], [IsIgnoreKeyword], [FieldPosition], [Synonyms], [ExpressionContext], [IsCheckSynonyms], [AllSynonyms], [DocType], [ParentRuleID]) VALUES (1, 2, N' interest rate', N'0', N'0', N'E:\Work\RuleEngine\TempUpload\DataRoboticsdocs.pdf', N'TempUpload\DataRoboticsdocs_636523135153530724.pdf', CAST(0x0000A87100EA072E AS DateTime), CAST(0x0000A87100EA072E AS DateTime), 1, 0, N'', N'', N' interest rate', N'0', N'interest', N' interest rate', N'DataRoboticsdocs.pdf', 1, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[RuleDesc] ([ID], [RuleMastID], [RuleName], [SplitAs], [Dictionary], [OriginalDocumentName], [ConvertedDocumentName], [EntryDate], [ModifiedDate], [IsActive], [NeighbourhoodCount], [Expression1], [Expression2], [ContextWord], [Operator], [FieldName], [FieldValue], [UploadedFile], [IsIgnoreKeyword], [FieldPosition], [Synonyms], [ExpressionContext], [IsCheckSynonyms], [AllSynonyms], [DocType], [ParentRuleID]) VALUES (2, 1, N'principal amount', N'0', N'0', N'TempUpload/DataRoboticsdocs.pdf', N'TempUpload/DataRoboticsdocs_636524109294010968.pdf', CAST(0x0000A872011CC4CA AS DateTime), CAST(0x0000A872011CC501 AS DateTime), 1, 0, N'', N'', N'principal amount', N'0', N'principal', N'principal amount', N'DataRoboticsdocs.pdf', 1, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[RuleDesc] ([ID], [RuleMastID], [RuleName], [SplitAs], [Dictionary], [OriginalDocumentName], [ConvertedDocumentName], [EntryDate], [ModifiedDate], [IsActive], [NeighbourhoodCount], [Expression1], [Expression2], [ContextWord], [Operator], [FieldName], [FieldValue], [UploadedFile], [IsIgnoreKeyword], [FieldPosition], [Synonyms], [ExpressionContext], [IsCheckSynonyms], [AllSynonyms], [DocType], [ParentRuleID]) VALUES (3, 1, N'NCCI No', N'Lines ', N'0', N'TempUpload/Policy.pdf', N'TempUpload/Policy_636540427000846279.pdf', CAST(0x0000A88500EF79CA AS DateTime), CAST(0x0000A88500EF7A0C AS DateTime), 1, 0, N'', N'', N'NCCI No.', N'After', N'NCCI No', N'24244', N'Policy.pdf', 1, N'None', N'All', N'None', 0, NULL, NULL, NULL)
INSERT [dbo].[RuleDesc] ([ID], [RuleMastID], [RuleName], [SplitAs], [Dictionary], [OriginalDocumentName], [ConvertedDocumentName], [EntryDate], [ModifiedDate], [IsActive], [NeighbourhoodCount], [Expression1], [Expression2], [ContextWord], [Operator], [FieldName], [FieldValue], [UploadedFile], [IsIgnoreKeyword], [FieldPosition], [Synonyms], [ExpressionContext], [IsCheckSynonyms], [AllSynonyms], [DocType], [ParentRuleID]) VALUES (4, 1, N'POLICY NO.', N'Lines ', N'0', N'TempUpload/Policy.pdf', N'TempUpload/Policy_636548381477008915.pdf', CAST(0x0000A88E01413B91 AS DateTime), CAST(0x0000A88E01413B91 AS DateTime), 1, 0, N'', N'', N'POLICY NO.', N'After', N'POLICY NO', N'0400161815', N'Policy.pdf', 1, N'First', N'', N'None', 0, N'', NULL, NULL)
SET IDENTITY_INSERT [dbo].[RuleDesc] OFF
/****** Object:  Table [dbo].[RuleApplicationSummary]    Script Date: 03/29/2018 13:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RuleApplicationSummary](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[RunID] [bigint] NULL,
	[FileName] [nvarchar](max) NULL,
	[RuleDescID] [bigint] NULL,
	[FieldValue] [nvarchar](max) NULL,
	[EntryDate] [datetime] NULL,
	[IsSuccess] [bit] NULL,
 CONSTRAINT [PK_RuleApplicationSummary] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RuleApplicationSummary] ON
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (1, 1, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88901476AF8 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (2, 1, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88901476B2D AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (3, 2, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A889014FA913 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (4, 2, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A889014FA931 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (5, 3, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88C0124A923 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (6, 3, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88C0124A935 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (7, 4, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88C012CE6B4 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (8, 4, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88C012CE6C3 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (9, 5, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88C0135243A AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (10, 5, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88C0135245C AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (11, 6, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88C013D61FC AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (12, 6, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88C013D6209 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (13, 7, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88C01459F8C AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (14, 7, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88C01459FAF AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (15, 8, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88C014DDD2A AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (16, 8, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88C014DDD49 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (17, 9, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88C01561AD0 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (18, 9, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88C01561ADA AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (19, 10, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88C015E5868 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (20, 10, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88C015E5872 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (21, 11, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88C0166960D AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (22, 11, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88C01669617 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (23, 12, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88C016ED3B6 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (24, 12, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88C016ED3C5 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (25, 13, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88C01771142 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (26, 13, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88C0177114D AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (27, 14, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88C017F4EE8 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (28, 14, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88C017F4EFC AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (29, 15, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88C01878CAB AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (30, 15, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88C01878CB5 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (31, 16, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88D00044829 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (32, 16, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88D00044833 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (33, 17, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88D000C85B9 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (34, 17, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88D000C85C3 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (35, 18, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88D00D2DF8C AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (36, 18, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88D00D2DF9D AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (37, 19, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88D00DB1D20 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (38, 19, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88D00DB1D30 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (39, 20, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88D00E50718 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (40, 20, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88D00E50723 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (41, 21, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88D00E61A0F AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (42, 21, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88D00E61A28 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (43, 22, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88D00EE57B4 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (44, 22, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88D00EE57BF AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (45, 23, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88D00F69651 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (46, 23, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88D00F6965D AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (47, 24, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88D00FED3DD AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (48, 24, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88D00FED3E7 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (49, 25, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88D01071176 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (50, 25, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88D01071180 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (51, 26, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88D010F4EF5 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (52, 26, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88D010F4F00 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (53, 27, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88D01178C84 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (54, 27, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88D01178C9A AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (55, 28, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88E00D9EF4B AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (56, 28, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88E00D9EF5C AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (57, 29, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88E00E22CEF AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (58, 29, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88E00E22D01 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (59, 30, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88E00EA6A71 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (60, 30, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88E00EA6A7D AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (61, 31, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88E0123A930 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (62, 31, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88E0123A93A AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (63, 32, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88E012BE6F4 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (64, 32, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88E012BE707 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (65, 33, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88E01342486 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (66, 33, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88E01342491 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (67, 34, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88E013C622D AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (68, 34, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88E013C623B AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (69, 35, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88E01449FB4 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (70, 35, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'24244, 0400161815', CAST(0x0000A88E01449FB5 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (71, 35, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88E01449FC2 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (72, 35, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'24244, 0400161815', CAST(0x0000A88E01449FC3 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (73, 36, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88E014CDD39 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (74, 36, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'24244, 0400161815', CAST(0x0000A88E014CDD3A AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (75, 36, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88E014CDD48 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (76, 36, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'24244, 0400161815', CAST(0x0000A88E014CDD48 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (77, 37, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88E01551AC7 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (78, 37, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'24244, 0400161815', CAST(0x0000A88E01551AC8 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (79, 37, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88E01551AD2 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (80, 37, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'24244, 0400161815', CAST(0x0000A88E01551AD3 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (81, 38, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88E01568545 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (82, 38, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88E01568545 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (83, 38, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88E01568550 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (84, 38, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88E01568550 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (85, 39, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88E015EC2D8 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (86, 39, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88E015EC2D8 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (87, 39, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88E015EC2E2 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (88, 39, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88E015EC2E3 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (89, 40, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88E0167005B AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (90, 40, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88E0167005C AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (91, 40, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88E01670068 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (92, 40, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88E01670068 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (93, 41, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88E016F3DE4 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (94, 41, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88E016F3DE4 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (95, 41, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88E016F3DEF AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (96, 41, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88E016F3DEF AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (97, 42, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88E01777B6A AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (98, 42, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88E01777B6B AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (99, 42, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88E01777B76 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (100, 42, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88E01777B76 AS DateTime), NULL)
GO
print 'Processed 100 total records'
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (101, 43, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88E017FB8EF AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (102, 43, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88E017FB8F0 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (103, 43, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88E017FB8FB AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (104, 43, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88E017FB8FB AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (105, 44, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88E0187F66A AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (106, 44, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88E0187F66A AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (107, 44, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88E0187F675 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (108, 44, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88E0187F675 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (109, 45, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F0004B1FF AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (110, 45, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F0004B202 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (111, 45, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F0004B20F AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (112, 45, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F0004B20F AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (113, 46, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F000CEF8F AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (114, 46, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F000CEF8F AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (115, 46, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F000CEF9A AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (116, 46, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F000CEF9A AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (117, 47, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F00152D15 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (118, 47, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F00152D15 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (119, 47, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F00152D21 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (120, 47, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F00152D21 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (121, 48, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F001D6A9D AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (122, 48, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F001D6A9D AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (123, 48, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F001D6AA8 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (124, 48, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F001D6AA9 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (125, 49, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F0025A823 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (126, 49, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F0025A823 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (127, 49, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F0025A82D AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (128, 49, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F0025A82E AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (129, 50, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F002DE5AA AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (130, 50, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F002DE5AB AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (131, 50, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F002DE5B6 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (132, 50, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F002DE5B7 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (133, 51, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F00362333 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (134, 51, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F00362333 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (135, 51, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F0036233E AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (136, 51, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F0036233E AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (137, 52, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F003E60B4 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (138, 52, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F003E60B4 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (139, 52, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F003E60BF AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (140, 52, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F003E60BF AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (141, 53, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F00469E3E AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (142, 53, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F00469E3F AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (143, 53, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F00469E4B AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (144, 53, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F00469E4B AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (145, 54, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F004EDBCC AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (146, 54, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F004EDBCC AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (147, 54, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F004EDBD6 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (148, 54, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F004EDBD7 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (149, 55, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F00571958 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (150, 55, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F00571959 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (151, 55, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F00571963 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (152, 55, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F00571964 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (153, 56, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F005F56DD AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (154, 56, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F005F56DE AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (155, 56, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F005F56E8 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (156, 56, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F005F56E9 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (157, 57, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F00679465 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (158, 57, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F00679466 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (159, 57, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F00679470 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (160, 57, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F00679470 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (161, 58, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F006FD1EE AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (162, 58, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F006FD1EE AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (163, 58, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F006FD1F8 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (164, 58, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F006FD1F8 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (165, 59, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F00780F7C AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (166, 59, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F00780F7C AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (167, 59, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F00780F89 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (168, 59, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F00780F89 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (169, 60, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F00804D02 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (170, 60, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F00804D03 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (171, 60, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F00804D0D AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (172, 60, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F00804D0D AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (173, 61, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F00888A93 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (174, 61, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F00888A93 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (175, 61, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F00888A9D AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (176, 61, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F00888A9D AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (177, 62, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F0090C820 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (178, 62, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F0090C820 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (179, 62, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F0090C82E AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (180, 62, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F0090C82F AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (181, 63, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F009905AE AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (182, 63, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F009905AF AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (183, 63, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F009905BC AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (184, 63, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F009905BD AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (185, 64, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F00A14339 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (186, 64, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F00A1433A AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (187, 64, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F00A14344 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (188, 64, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F00A14344 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (189, 65, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F00A980BB AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (190, 65, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F00A980BB AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (191, 65, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F00A980C6 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (192, 65, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F00A980C7 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (193, 66, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F00B1BE46 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (194, 66, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F00B1BE46 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (195, 66, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F00B1BE50 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (196, 66, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F00B1BE51 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (197, 67, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F00B9FBD2 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (198, 67, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F00B9FBDA AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (199, 67, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F00B9FBE4 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (200, 67, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F00B9FBE4 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (201, 68, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F00C2395F AS DateTime), NULL)
GO
print 'Processed 200 total records'
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (202, 68, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F00C23960 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (203, 68, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F00C23969 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (204, 68, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F00C2396A AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (205, 69, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F00CA76E8 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (206, 69, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F00CA76E9 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (207, 69, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F00CA76F3 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (208, 69, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F00CA76F3 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (209, 70, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F00D2B4CC AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (210, 70, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F00D2B4CC AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (211, 70, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F00D2B4D9 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (212, 70, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F00D2B4D9 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (213, 71, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F00DAF295 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (214, 71, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F00DAF295 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (215, 71, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F00DAF2A8 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (216, 71, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F00DAF2A8 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (217, 72, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F00E33030 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (218, 72, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F00E33031 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (219, 72, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F00E3303C AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (220, 72, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F00E33047 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (221, 73, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F00EB6DBE AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (222, 73, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F00EB6DBE AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (223, 73, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F00EB6DCB AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (224, 73, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F00EB6DCB AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (225, 74, N'E:\Document\RuleEngineDoc\Contract1.pdf', 3, N'', CAST(0x0000A88F00F3AB85 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (226, 74, N'E:\Document\RuleEngineDoc\Contract1.pdf', 4, N'', CAST(0x0000A88F00F3AB86 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (227, 74, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F00F3AB96 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (228, 74, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F00F3AB97 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (229, 74, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F00F3ABA2 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (230, 74, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F00F3ABA2 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (231, 75, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F0143A9A6 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (232, 75, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F0143A9A6 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (233, 75, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F0143A9B1 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (234, 75, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F0143A9B1 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (235, 76, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F014BE74B AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (236, 76, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F014BE74B AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (237, 76, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F014BE75A AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (238, 76, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F014BE75A AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (239, 77, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F015424FD AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (240, 77, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F01542500 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (241, 77, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F01542509 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (242, 77, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F0154250A AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (243, 78, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F015C6280 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (244, 78, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F015C6281 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (245, 78, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F015C628D AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (246, 78, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F015C628E AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (247, 79, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F0164A058 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (248, 79, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F0164A059 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (249, 79, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F0164A063 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (250, 79, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F0164A063 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (251, 80, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F016CDDE4 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (252, 80, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F016CDDED AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (253, 80, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F016CDDF7 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (254, 80, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F016CDDF8 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (255, 81, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F01751B95 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (256, 81, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F01751B9F AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (257, 81, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F01751BC3 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (258, 81, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F01751BC3 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (259, 82, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F017D593E AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (260, 82, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F017D5948 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (261, 82, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F017D595A AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (262, 82, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F017D5969 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (263, 83, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A88F0185970B AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (264, 83, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A88F0185970C AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (265, 83, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A88F01859717 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (266, 83, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A88F01859717 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (267, 84, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A8900002528C AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (268, 84, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A8900002528D AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (269, 84, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89000025297 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (270, 84, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89000025297 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (271, 85, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A890000A9016 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (272, 85, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A890000A9035 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (273, 85, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A890000A9046 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (274, 85, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A890000A904F AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (275, 86, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A8900012CDCB AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (276, 86, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A8900012CDCB AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (277, 86, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A8900012CDD6 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (278, 86, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A8900012CDD6 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (279, 87, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A890001B0B7E AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (280, 87, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A890001B0B82 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (281, 87, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A890001B0B8C AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (282, 87, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A890001B0B8C AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (283, 88, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A8900023490A AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (284, 88, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A8900023490A AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (285, 88, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89000234935 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (286, 88, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89000234935 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (287, 89, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A890002B86F6 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (288, 89, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A890002B86F7 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (289, 89, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A890002B8709 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (290, 89, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A890002B870C AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (291, 90, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A8900033C48C AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (292, 90, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A8900033C48C AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (293, 90, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A8900033C497 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (294, 90, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A8900033C4A6 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (295, 91, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A890003C021A AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (296, 91, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A890003C021B AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (297, 91, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A890003C0225 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (298, 91, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A890003C0236 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (299, 92, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A89000443FCE AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (300, 92, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89000443FCF AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (301, 92, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89000443FD9 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (302, 92, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89000443FD9 AS DateTime), NULL)
GO
print 'Processed 300 total records'
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (303, 93, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A890004C7D64 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (304, 93, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A890004C7D6C AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (305, 93, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A890004C7D7B AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (306, 93, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A890004C7D7B AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (307, 94, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A8900054BB00 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (308, 94, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A8900054BB01 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (309, 94, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A8900054BB0B AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (310, 94, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A8900054BB0B AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (311, 95, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A890005CF896 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (312, 95, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A890005CF897 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (313, 95, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A890005CF8A1 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (314, 95, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A890005CF8A1 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (315, 96, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A8900065361D AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (316, 96, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89000653640 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (317, 96, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89000653657 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (318, 96, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89000653657 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (319, 97, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A890006D73F5 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (320, 97, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A890006D73F5 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (321, 97, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A890006D73FF AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (322, 97, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A890006D7400 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (323, 98, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A8900075B175 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (324, 98, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A8900075B176 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (325, 98, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A8900075B180 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (326, 98, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A8900075B180 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (327, 99, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A890007DEEFD AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (328, 99, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A890007DEEFE AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (329, 99, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A890007DEF1B AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (330, 99, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A890007DEF1C AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (331, 100, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A89000862C9B AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (332, 100, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89000862C9C AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (333, 100, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89000862CA6 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (334, 100, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89000862CA6 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (335, 101, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A890008E6A23 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (336, 101, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A890008E6A23 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (337, 101, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A890008E6A2E AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (338, 101, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A890008E6A31 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (339, 102, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A8900096A7AF AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (340, 102, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A8900096A7BB AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (341, 102, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A8900096A7CB AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (342, 102, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A8900096A7CE AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (343, 103, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A890009EE554 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (344, 103, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A890009EE55F AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (345, 103, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A890009EE570 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (346, 103, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A890009EE571 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (347, 104, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A89000A722ED AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (348, 104, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89000A722EE AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (349, 104, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89000A722F8 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (350, 104, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89000A72309 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (351, 105, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A89000AF6089 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (352, 105, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89000AF6089 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (353, 105, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89000AF6094 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (354, 105, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89000AF6094 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (355, 106, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A89000B79E15 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (356, 106, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89000B79E16 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (357, 106, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89000B79E20 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (358, 106, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89000B79E33 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (359, 107, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A89000BFDBAF AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (360, 107, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89000BFDBC5 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (361, 107, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89000BFDBD8 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (362, 107, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89000BFDBD8 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (363, 108, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A89000C81954 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (364, 108, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89000C81954 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (365, 108, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89000C8195E AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (366, 108, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89000C8195F AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (367, 109, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A89000D056DC AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (368, 109, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89000D056DC AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (369, 109, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89000D056E7 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (370, 109, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89000D056E7 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (371, 110, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A89000E928EF AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (372, 110, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89000E928F0 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (373, 110, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89000E928FB AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (374, 110, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89000E928FB AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (375, 111, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A89001124A56 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (376, 111, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89001124A57 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (377, 111, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89001124A62 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (378, 111, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89001124A62 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (379, 112, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A890011A87D5 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (380, 112, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A890011A87D5 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (381, 112, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A890011A87E0 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (382, 112, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A890011A87E9 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (383, 113, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A8900122C56B AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (384, 113, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A8900122C56C AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (385, 113, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A8900122C576 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (386, 113, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A8900122C576 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (387, 114, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A890012B02F8 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (388, 114, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A890012B02F9 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (389, 114, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A890012B030B AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (390, 114, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A890012B030C AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (391, 115, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A89001334082 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (392, 115, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89001334082 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (393, 115, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A8900133408D AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (394, 115, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A8900133408D AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (395, 116, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A890013B7E05 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (396, 116, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A890013B7E05 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (397, 116, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A890013B7E11 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (398, 116, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A890013B7E11 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (399, 117, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A8900143BB85 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (400, 117, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A8900143BB86 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (401, 117, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A8900143BB94 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (402, 117, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A8900143BBA0 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (403, 118, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A890014BF920 AS DateTime), NULL)
GO
print 'Processed 400 total records'
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (404, 118, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A890014BF920 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (405, 118, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A890014BF931 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (406, 118, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A890014BF932 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (407, 119, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A89301085E65 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (408, 119, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89301085E66 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (409, 119, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89301085E7A AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (410, 119, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89301085E7A AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (411, 120, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A89301109C02 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (412, 120, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89301109C02 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (413, 120, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89301109C0F AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (414, 120, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89301109C0F AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (415, 121, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A8930118D980 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (416, 121, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A8930118D980 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (417, 121, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A8930118D98D AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (418, 121, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A8930118D98E AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (419, 122, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A8930121170B AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (420, 122, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A8930121170C AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (421, 122, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89301211716 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (422, 122, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89301211716 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (423, 123, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A8930189688D AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (424, 123, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A8930189688D AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (425, 123, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A893018968E0 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (426, 123, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89301896948 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (427, 124, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A895011041D9 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (428, 124, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A895011041DA AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (429, 124, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A895011041F2 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (430, 124, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A895011041F2 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (431, 125, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A89501187F82 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (432, 125, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89501187F86 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (433, 125, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89501187F9F AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (434, 125, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89501187FA2 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (435, 126, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A89A00D7DF8B AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (436, 126, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89A00D7DF9A AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (437, 126, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89A00D7DFAE AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (438, 126, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89A00D7DFAF AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (439, 127, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A89A00E01D64 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (440, 127, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89A00E01D65 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (441, 127, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89A00E01DA9 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (442, 127, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89A00E01DA9 AS DateTime), NULL)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (443, 128, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 3, N'', CAST(0x0000A89B00E8564A AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (444, 128, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 4, N'', CAST(0x0000A89B00E8564E AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (445, 128, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A89B00E8566C AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (446, 128, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89B00E85675 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (447, 128, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89B00E8569C AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (448, 128, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89B00E8569C AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (449, 129, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 3, N'', CAST(0x0000A89B00EA11D1 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (450, 129, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 4, N'', CAST(0x0000A89B00EA11D2 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (451, 129, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A89B00EA11EE AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (452, 129, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89B00EA11EE AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (453, 129, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89B00EA121D AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (454, 129, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89B00EA1224 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (455, 130, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 3, N'', CAST(0x0000A89B00EA9A78 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (456, 130, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 4, N'', CAST(0x0000A89B00EA9A79 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (457, 130, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A89B00EA9C44 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (458, 130, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89B00EA9C44 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (459, 130, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89B00EA9D96 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (460, 130, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89B00EA9D97 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (461, 131, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 3, N'', CAST(0x0000A89B00EC4D58 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (462, 131, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 4, N'', CAST(0x0000A89B00EC4D59 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (463, 131, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A89B00EC4D6E AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (464, 131, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89B00EC4D71 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (465, 131, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89B00EC4D89 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (466, 131, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89B00EC4D89 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (467, 132, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 3, N'', CAST(0x0000A89B00F48B1D AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (468, 132, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 4, N'', CAST(0x0000A89B00F48B1E AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (469, 132, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A89B00F48B31 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (470, 132, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89B00F48B31 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (471, 132, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89B00F48B56 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (472, 132, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89B00F48B56 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (473, 133, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 3, N'', CAST(0x0000A89B00FCC8CC AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (474, 133, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 4, N'', CAST(0x0000A89B00FCC8CD AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (475, 133, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A89B00FCC8D9 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (476, 133, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89B00FCC8D9 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (477, 133, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89B00FCC8E3 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (478, 133, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89B00FCC8E3 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (479, 134, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 3, N'', CAST(0x0000A89B0106F39B AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (480, 134, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 4, N'', CAST(0x0000A89B0106F39C AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (481, 134, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A89B0106F3B0 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (482, 134, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89B0106F3B0 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (483, 134, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89B0106F3C1 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (484, 134, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89B0106F3C1 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (485, 135, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 3, N'', CAST(0x0000A89B010F314A AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (486, 135, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 4, N'', CAST(0x0000A89B010F314A AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (487, 135, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A89B010F317B AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (488, 135, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89B010F317C AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (489, 135, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89B010F318D AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (490, 135, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89B010F318D AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (491, 136, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 3, N'', CAST(0x0000A89B01176F07 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (492, 136, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 4, N'', CAST(0x0000A89B01176F08 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (493, 136, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A89B01176F13 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (494, 136, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89B01176F13 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (495, 136, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89B01176F1E AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (496, 136, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89B01176F1F AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (497, 137, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 3, N'', CAST(0x0000A89B011FAC89 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (498, 137, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 4, N'', CAST(0x0000A89B011FAC89 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (499, 137, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A89B011FAC94 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (500, 137, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89B011FAC96 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (501, 137, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89B011FACA0 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (502, 137, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89B011FACA0 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (503, 138, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 3, N'', CAST(0x0000A89B0127EA11 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (504, 138, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 4, N'', CAST(0x0000A89B0127EA12 AS DateTime), 0)
GO
print 'Processed 500 total records'
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (505, 138, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A89B0127EA1E AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (506, 138, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89B0127EA1E AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (507, 138, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89B0127EA28 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (508, 138, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89B0127EA29 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (509, 139, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 3, N'', CAST(0x0000A89B0130279E AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (510, 139, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 4, N'', CAST(0x0000A89B0130279F AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (511, 139, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A89B013027AA AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (512, 139, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89B013027AA AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (513, 139, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89B013027B4 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (514, 139, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89B013027B5 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (515, 140, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 3, N'', CAST(0x0000A89B0138651F AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (516, 140, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 4, N'', CAST(0x0000A89B0138651F AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (517, 140, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A89B0138652C AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (518, 140, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89B0138652C AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (519, 140, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89B01386538 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (520, 140, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89B01386539 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (521, 141, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 3, N'', CAST(0x0000A89C01368966 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (522, 141, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 4, N'', CAST(0x0000A89C01368972 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (523, 141, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A89C013689B1 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (524, 141, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89C013689BA AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (525, 141, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89C013689CF AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (526, 141, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89C013689CF AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (527, 142, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 3, N'', CAST(0x0000A89C013EC74D AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (528, 142, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 4, N'', CAST(0x0000A89C013EC77E AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (529, 142, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A89C013EC78E AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (530, 142, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89C013EC792 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (531, 142, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89C013EC79D AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (532, 142, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89C013EC7BD AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (533, 143, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 3, N'', CAST(0x0000A89C01470534 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (534, 143, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 4, N'', CAST(0x0000A89C01470535 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (535, 143, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A89C01470540 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (536, 143, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A89C01470541 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (537, 143, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A89C0147054E AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (538, 143, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A89C0147054E AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (539, 144, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 3, N'', CAST(0x0000A8A3011BD945 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (540, 144, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 4, N'', CAST(0x0000A8A3011BD94E AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (541, 144, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A8A3011BD96C AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (542, 144, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A8A3011BD96D AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (543, 144, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A8A3011BD97D AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (544, 144, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A8A3011BD992 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (545, 145, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 3, N'', CAST(0x0000A8A3012417C7 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (546, 145, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 4, N'', CAST(0x0000A8A3012417C8 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (547, 145, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A8A3012417DA AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (548, 145, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A8A3012417DB AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (549, 145, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A8A3012417E8 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (550, 145, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A8A3012417E9 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (551, 146, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 3, N'', CAST(0x0000A8A3012C55B9 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (552, 146, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 4, N'', CAST(0x0000A8A3012C55C6 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (553, 146, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A8A3012C55DF AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (554, 146, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A8A3012C55DF AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (555, 146, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A8A3012C55E9 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (556, 146, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A8A3012C55EA AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (557, 147, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 3, N'', CAST(0x0000A8A301349385 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (558, 147, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 4, N'', CAST(0x0000A8A301349386 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (559, 147, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A8A301349392 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (560, 147, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A8A301349392 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (561, 147, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A8A30134939C AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (562, 147, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A8A30134939C AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (563, 148, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 3, N'', CAST(0x0000A8A3013CD14E AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (564, 148, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 4, N'', CAST(0x0000A8A3013CD14F AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (565, 148, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A8A3013CD166 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (566, 148, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A8A3013CD167 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (567, 148, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A8A3013CD176 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (568, 148, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A8A3013CD176 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (569, 149, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 3, N'', CAST(0x0000A8A301450EE1 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (570, 149, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 4, N'', CAST(0x0000A8A301450EE2 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (571, 149, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A8A301450F01 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (572, 149, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A8A301450F02 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (573, 149, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A8A301450F0C AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (574, 149, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A8A301450F0C AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (575, 150, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 3, N'', CAST(0x0000A8A3014D4CAD AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (576, 150, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 4, N'', CAST(0x0000A8A3014D4CAF AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (577, 150, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A8A3014D4D06 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (578, 150, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A8A3014D4D07 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (579, 150, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A8A3014D4D24 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (580, 150, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A8A3014D4D28 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (581, 151, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 3, N'', CAST(0x0000A8A500E412C5 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (582, 151, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 4, N'', CAST(0x0000A8A500E4130C AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (583, 151, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A8A500E4137D AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (584, 151, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A8A500E4137E AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (585, 151, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A8A500E41394 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (586, 151, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A8A500E41398 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (587, 152, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 3, N'', CAST(0x0000A8A801229C14 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (588, 152, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 4, N'', CAST(0x0000A8A801229C19 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (589, 152, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A8A801229C44 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (590, 152, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A8A801229C44 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (591, 152, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A8A801229C56 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (592, 152, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A8A801229C57 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (593, 153, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 3, N'', CAST(0x0000A8A8012AD9C1 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (594, 153, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 4, N'', CAST(0x0000A8A8012AD9C2 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (595, 153, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A8A8012AD9CF AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (596, 153, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A8A8012AD9D0 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (597, 153, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A8A8012AD9DA AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (598, 153, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A8A8012AD9E3 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (599, 154, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 3, N'', CAST(0x0000A8A8013317B4 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (600, 154, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 4, N'', CAST(0x0000A8A8013317B5 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (601, 154, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A8A8013317C6 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (602, 154, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A8A8013317C7 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (603, 154, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A8A8013317D1 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (604, 154, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A8A8013317D2 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (605, 155, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 3, N'', CAST(0x0000A8A8013B5544 AS DateTime), 0)
GO
print 'Processed 600 total records'
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (606, 155, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 4, N'', CAST(0x0000A8A8013B5545 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (607, 155, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A8A8013B5555 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (608, 155, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A8A8013B5555 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (609, 155, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A8A8013B5560 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (610, 155, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A8A8013B5560 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (611, 156, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 3, N'', CAST(0x0000A8A8014392D2 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (612, 156, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 4, N'', CAST(0x0000A8A8014392D3 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (613, 156, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A8A8014392DF AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (614, 156, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A8A8014392DF AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (615, 156, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A8A8014392EA AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (616, 156, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A8A8014392EB AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (617, 157, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 3, N'', CAST(0x0000A8A8014BD064 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (618, 157, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 4, N'', CAST(0x0000A8A8014BD065 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (619, 157, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A8A8014BD070 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (620, 157, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A8A8014BD071 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (621, 157, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A8A8014BD07B AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (622, 157, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A8A8014BD07B AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (623, 158, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 3, N'', CAST(0x0000A8B200D3EC65 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (624, 158, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 4, N'', CAST(0x0000A8B200D3EC70 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (625, 158, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A8B200D3ECA8 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (626, 158, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A8B200D3ECA9 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (627, 158, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A8B200D3ECB4 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (628, 158, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A8B200D3ECB5 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (629, 159, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 3, N'', CAST(0x0000A8B200DC2A33 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (630, 159, N'E:\Document\RuleEngineDoc\DataRoboticsdocs1.pdf', 4, N'', CAST(0x0000A8B200DC2A34 AS DateTime), 0)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (631, 159, N'E:\Document\RuleEngineDoc\Policy.pdf', 3, N'24244', CAST(0x0000A8B200DC2A3E AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (632, 159, N'E:\Document\RuleEngineDoc\Policy.pdf', 4, N'0400161815', CAST(0x0000A8B200DC2A43 AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (633, 159, N'E:\Document\RuleEngineDoc\Policy1.pdf', 3, N'24244', CAST(0x0000A8B200DC2A4D AS DateTime), 1)
INSERT [dbo].[RuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (634, 159, N'E:\Document\RuleEngineDoc\Policy1.pdf', 4, N'0400161815', CAST(0x0000A8B200DC2A4D AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[RuleApplicationSummary] OFF
/****** Object:  UserDefinedFunction [dbo].[fnSplit]    Script Date: 03/29/2018 13:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnSplit](
    @sInputList VARCHAR(8000) -- List of delimited items
  , @sDelimiter VARCHAR(8000) = ',' -- delimiter that separates items
) RETURNS @List TABLE (item VARCHAR(8000))

BEGIN
DECLARE @sItem VARCHAR(8000)
WHILE CHARINDEX(@sDelimiter,@sInputList,0) <> 0
 BEGIN
 SELECT
  @sItem=RTRIM(LTRIM(SUBSTRING(@sInputList,1,CHARINDEX(@sDelimiter,@sInputList,0)-1))),
  @sInputList=RTRIM(LTRIM(SUBSTRING(@sInputList,CHARINDEX(@sDelimiter,@sInputList,0)+LEN(@sDelimiter),LEN(@sInputList))))
 
 IF LEN(@sItem) > 0
  INSERT INTO @List SELECT @sItem
 END

IF LEN(@sInputList) > 0
 INSERT INTO @List SELECT @sInputList -- Put the last item in
RETURN
END
GO
/****** Object:  Table [dbo].[Configuration]    Script Date: 03/29/2018 13:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Configuration](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ConfigurationKey] [varchar](50) NULL,
	[ConfigurationValue] [nvarchar](2048) NULL,
	[ConfigurationType] [varchar](50) NULL,
	[EntryDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[Comment] [nvarchar](2048) NULL,
 CONSTRAINT [PK_Configuration] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Configuration] ON
INSERT [dbo].[Configuration] ([ID], [ConfigurationKey], [ConfigurationValue], [ConfigurationType], [EntryDate], [ModifiedDate], [IsActive], [Comment]) VALUES (1, N'Mode', N'Interval', N'Service', CAST(0x0000A88C00000000 AS DateTime), CAST(0x0000A8A3010F6455 AS DateTime), 1, N'Either "Interval" or "Daily"')
INSERT [dbo].[Configuration] ([ID], [ConfigurationKey], [ConfigurationValue], [ConfigurationType], [EntryDate], [ModifiedDate], [IsActive], [Comment]) VALUES (2, N'IntervalMinutes', N'30', N'Service', CAST(0x0000A88C00000000 AS DateTime), CAST(0x0000A88C00000000 AS DateTime), 1, NULL)
INSERT [dbo].[Configuration] ([ID], [ConfigurationKey], [ConfigurationValue], [ConfigurationType], [EntryDate], [ModifiedDate], [IsActive], [Comment]) VALUES (3, N'ScheduledTime', N'20:29', N'Service', CAST(0x0000A88C00000000 AS DateTime), CAST(0x0000A88C00000000 AS DateTime), 1, NULL)
SET IDENTITY_INSERT [dbo].[Configuration] OFF
/****** Object:  Table [dbo].[APIRuleApplicationSummary]    Script Date: 03/29/2018 13:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIRuleApplicationSummary](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[RunID] [bigint] NULL,
	[FileName] [nvarchar](max) NULL,
	[RuleDescID] [bigint] NULL,
	[FieldValue] [nvarchar](max) NULL,
	[EntryDate] [datetime] NULL,
	[IsSuccess] [bit] NULL,
 CONSTRAINT [PK_APIRuleApplicationSummary] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[APIRuleApplicationSummary] ON
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (1, 1, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 3, N'XX', CAST(0x0000A8A4013A654A AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (2, 1, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 4, N'YY', CAST(0x0000A8A4013A6554 AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (3, 2, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 3, N'', CAST(0x0000A8A500E29826 AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (4, 2, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 4, N'', CAST(0x0000A8A500E2984C AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (5, 3, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 3, N'', CAST(0x0000A8A501135C7E AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (6, 3, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 4, N'', CAST(0x0000A8A501135CC5 AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (7, 4, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 3, N'', CAST(0x0000A8A501141440 AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (8, 4, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 4, N'', CAST(0x0000A8A50114146B AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (9, 5, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 3, N'', CAST(0x0000A8A501149B66 AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (10, 5, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 4, N'', CAST(0x0000A8A501149B66 AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (11, 6, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 3, N'', CAST(0x0000A8A50114CB6E AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (12, 6, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 4, N'', CAST(0x0000A8A50114CB6E AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (13, 7, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 3, N'', CAST(0x0000A8A50116E41C AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (14, 7, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 4, N'', CAST(0x0000A8A50116E41D AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (15, 8, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 3, N'', CAST(0x0000A8A5011D3844 AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (16, 8, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 4, N'', CAST(0x0000A8A5011D3846 AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (17, 9, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 3, N'', CAST(0x0000A8A501211310 AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (18, 9, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 4, N'', CAST(0x0000A8A5012113B7 AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (19, 10, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 3, N'', CAST(0x0000A8A501213D75 AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (20, 10, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 4, N'', CAST(0x0000A8A501213D75 AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (21, 11, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 3, N'', CAST(0x0000A8A501467473 AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (22, 11, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 4, N'', CAST(0x0000A8A50146747B AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (23, 12, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 3, N'', CAST(0x0000A8A5015095D0 AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (24, 12, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 4, N'', CAST(0x0000A8A5015095DC AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (25, 13, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 3, N'', CAST(0x0000A8A50150F317 AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (26, 13, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 4, N'', CAST(0x0000A8A50150F333 AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (27, 14, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 3, N'', CAST(0x0000A8A800EACCB8 AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (28, 14, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 4, N'', CAST(0x0000A8A800EACCF7 AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (29, 15, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 3, N'', CAST(0x0000A8A800EB1B0E AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (30, 15, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 4, N'', CAST(0x0000A8A800EB1B0E AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (31, 16, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 3, N'', CAST(0x0000A8A9014830F2 AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (32, 16, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 4, N'', CAST(0x0000A8A90148310B AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (33, 17, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 3, N'', CAST(0x0000A8A901484E53 AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (34, 17, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 4, N'', CAST(0x0000A8A901484E54 AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (35, 18, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 3, N'', CAST(0x0000A8A9014E35D6 AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (36, 18, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 4, N'', CAST(0x0000A8A9014E35D7 AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (37, 19, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 3, N'', CAST(0x0000A8B00110616A AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (38, 19, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 4, N'', CAST(0x0000A8B00110617A AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (39, 20, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 3, N'', CAST(0x0000A8B001107049 AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (40, 20, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 4, N'', CAST(0x0000A8B001107049 AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (41, 21, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 3, N'', CAST(0x0000A8B0013BA8C2 AS DateTime), 0)
INSERT [dbo].[APIRuleApplicationSummary] ([ID], [RunID], [FileName], [RuleDescID], [FieldValue], [EntryDate], [IsSuccess]) VALUES (42, 21, N'http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf', 4, N'', CAST(0x0000A8B0013BA8DD AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[APIRuleApplicationSummary] OFF
/****** Object:  Table [dbo].[APICallHistory]    Script Date: 03/29/2018 13:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[APICallHistory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[RunTime] [datetime] NULL,
	[Comment] [nvarchar](max) NULL,
	[Status] [varchar](50) NULL,
	[RunID] [bigint] NULL,
 CONSTRAINT [PK_APICallHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[APICallHistory] ON
INSERT [dbo].[APICallHistory] ([ID], [RunTime], [Comment], [Status], [RunID]) VALUES (1, CAST(0x0000A8A4013A6555 AS DateTime), N'RuleEngine Service run at 15-03-2018 19:04:40 for RuleMasterID: 1', N'RUNNING', 1)
INSERT [dbo].[APICallHistory] ([ID], [RunTime], [Comment], [Status], [RunID]) VALUES (2, CAST(0x0000A8A500E2984D AS DateTime), N'RuleEngine Service run at 16-03-2018 13:45:00 for RuleMasterID: 1', N'RUNNING', 2)
INSERT [dbo].[APICallHistory] ([ID], [RunTime], [Comment], [Status], [RunID]) VALUES (3, CAST(0x0000A8A501135CC6 AS DateTime), N'RuleEngine Service run at 16-03-2018 16:42:33 for RuleMasterID: 1', N'RUNNING', 3)
INSERT [dbo].[APICallHistory] ([ID], [RunTime], [Comment], [Status], [RunID]) VALUES (4, CAST(0x0000A8A50114146B AS DateTime), N'RuleEngine Service run at 16-03-2018 16:45:10 for RuleMasterID: 1', N'RUNNING', 4)
INSERT [dbo].[APICallHistory] ([ID], [RunTime], [Comment], [Status], [RunID]) VALUES (5, CAST(0x0000A8A501149B67 AS DateTime), N'RuleEngine Service run at 16-03-2018 16:47:05 for RuleMasterID: 1', N'RUNNING', 5)
INSERT [dbo].[APICallHistory] ([ID], [RunTime], [Comment], [Status], [RunID]) VALUES (6, CAST(0x0000A8A50114CB6F AS DateTime), N'RuleEngine Service run at 16-03-2018 16:47:46 for RuleMasterID: 1', N'RUNNING', 6)
INSERT [dbo].[APICallHistory] ([ID], [RunTime], [Comment], [Status], [RunID]) VALUES (7, CAST(0x0000A8A50116E41D AS DateTime), N'RuleEngine Service run at 16-03-2018 16:55:24 for RuleMasterID: 1', N'RUNNING', 7)
INSERT [dbo].[APICallHistory] ([ID], [RunTime], [Comment], [Status], [RunID]) VALUES (8, CAST(0x0000A8A5011D3847 AS DateTime), N'RuleEngine Service run at 16-03-2018 17:18:27 for RuleMasterID: 1', N'RUNNING', 8)
INSERT [dbo].[APICallHistory] ([ID], [RunTime], [Comment], [Status], [RunID]) VALUES (9, CAST(0x0000A8A5012113B9 AS DateTime), N'RuleEngine Service run at 16-03-2018 17:32:29 for RuleMasterID: 1', N'RUNNING', 9)
INSERT [dbo].[APICallHistory] ([ID], [RunTime], [Comment], [Status], [RunID]) VALUES (10, CAST(0x0000A8A501213D76 AS DateTime), N'RuleEngine Service run at 16-03-2018 17:33:05 for RuleMasterID: 1', N'RUNNING', 10)
INSERT [dbo].[APICallHistory] ([ID], [RunTime], [Comment], [Status], [RunID]) VALUES (11, CAST(0x0000A8A50146747C AS DateTime), N'RuleEngine Service run at 16-03-2018 19:48:35 for RuleMasterID: 1', N'RUNNING', 11)
INSERT [dbo].[APICallHistory] ([ID], [RunTime], [Comment], [Status], [RunID]) VALUES (12, CAST(0x0000A8A5015095DC AS DateTime), N'RuleEngine Service run at 16-03-2018 20:25:28 for RuleMasterID: 1', N'RUNNING', 12)
INSERT [dbo].[APICallHistory] ([ID], [RunTime], [Comment], [Status], [RunID]) VALUES (13, CAST(0x0000A8A50150F335 AS DateTime), N'RuleEngine Service run at 16-03-2018 20:26:47 for RuleMasterID: 1', N'RUNNING', 13)
INSERT [dbo].[APICallHistory] ([ID], [RunTime], [Comment], [Status], [RunID]) VALUES (14, CAST(0x0000A8A800EACCF8 AS DateTime), N'RuleEngine Service run at 19-03-2018 14:14:52 for RuleMasterID: 1', N'RUNNING', 14)
INSERT [dbo].[APICallHistory] ([ID], [RunTime], [Comment], [Status], [RunID]) VALUES (15, CAST(0x0000A8A800EB1B0F AS DateTime), N'RuleEngine Service run at 19-03-2018 14:15:59 for RuleMasterID: 1', N'RUNNING', 15)
INSERT [dbo].[APICallHistory] ([ID], [RunTime], [Comment], [Status], [RunID]) VALUES (16, CAST(0x0000A8A90148310B AS DateTime), N'RuleEngine Service run at 20-03-2018 19:54:54 for RuleMasterID: 1', N'RUNNING', 16)
INSERT [dbo].[APICallHistory] ([ID], [RunTime], [Comment], [Status], [RunID]) VALUES (17, CAST(0x0000A8A901484E54 AS DateTime), N'RuleEngine Service run at 20-03-2018 19:55:19 for RuleMasterID: 1', N'RUNNING', 17)
INSERT [dbo].[APICallHistory] ([ID], [RunTime], [Comment], [Status], [RunID]) VALUES (18, CAST(0x0000A8A9014E35D7 AS DateTime), N'RuleEngine Service run at 20-03-2018 20:16:49 for RuleMasterID: 1', N'RUNNING', 18)
INSERT [dbo].[APICallHistory] ([ID], [RunTime], [Comment], [Status], [RunID]) VALUES (19, CAST(0x0000A8B00110617A AS DateTime), N'RuleEngine Service run at 27-03-2018 16:31:42 for RuleMasterID: 1', N'RUNNING', 19)
INSERT [dbo].[APICallHistory] ([ID], [RunTime], [Comment], [Status], [RunID]) VALUES (20, CAST(0x0000A8B001107049 AS DateTime), N'RuleEngine Service run at 27-03-2018 16:31:55 for RuleMasterID: 1', N'RUNNING', 20)
INSERT [dbo].[APICallHistory] ([ID], [RunTime], [Comment], [Status], [RunID]) VALUES (21, CAST(0x0000A8B0013BA8DE AS DateTime), N'RuleEngine Service run at 27-03-2018 19:09:16 for RuleMasterID: 1', N'RUNNING', 21)
SET IDENTITY_INSERT [dbo].[APICallHistory] OFF
/****** Object:  View [dbo].[Vw_Validation]    Script Date: 03/29/2018 13:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vw_Validation]
AS
SELECT     dbo.Validation.ID, dbo.Validation.RuleDescID, dbo.Validation.Isactive, dbo.Validation.EntryDate, dbo.Validation.ModifiedDate, dbo.Validation.ExpressionContext, dbo.Validation.ExpressionText, 
                      dbo.RuleDesc.RuleMastID, dbo.RuleDesc.RuleName
FROM         dbo.Validation INNER JOIN
                      dbo.RuleDesc ON dbo.Validation.RuleDescID = dbo.RuleDesc.ID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Validation"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 206
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RuleDesc"
            Begin Extent = 
               Top = 0
               Left = 400
               Bottom = 184
               Right = 615
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vw_Validation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vw_Validation'
GO
/****** Object:  View [dbo].[vw_RuleEngine]    Script Date: 03/29/2018 13:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_RuleEngine]
AS
SELECT     dbo.RuleEngineDetails.ID, dbo.RuleEngineDetails.RuleDescID, dbo.RuleEngineDetails.FolderPath, dbo.RuleEngineDetails.UserID, CASE WHEN RuleEngineDetails.CreateDate IS NULL 
                      THEN GetDate() ELSE RuleEngineDetails.CreateDate END AS CreateDate, CASE WHEN RuleEngineDetails.ModifiedDate IS NULL THEN GetDate() 
                      ELSE RuleEngineDetails.ModifiedDate END AS ModifiedDate, CASE WHEN RuleEngineDetails.IsActive IS NULL THEN 'False' ELSE RuleEngineDetails.IsActive END AS IsActive, 
                      dbo.RuleMast.RuleName AS RuleMastName, CASE WHEN UserName IS NULL THEN 'N/A' ELSE UserName END AS UserName, dbo.RuleMast.ID AS RuleMastID
FROM         dbo.RuleEngineDetails INNER JOIN
                      dbo.UserMaster ON dbo.RuleEngineDetails.UserID = dbo.UserMaster.ID RIGHT OUTER JOIN
                      dbo.RuleMast ON dbo.RuleEngineDetails.RuleMastID = dbo.RuleMast.ID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[10] 4[52] 2[9] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "RuleEngineDetails"
            Begin Extent = 
               Top = 6
               Left = 151
               Bottom = 216
               Right = 431
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "UserMaster"
            Begin Extent = 
               Top = 6
               Left = 687
               Bottom = 216
               Right = 864
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RuleMast"
            Begin Extent = 
               Top = 15
               Left = 466
               Bottom = 212
               Right = 626
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 4005
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 9795
         Alias = 3060
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_RuleEngine'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_RuleEngine'
GO
/****** Object:  View [dbo].[Vw_RuleDesc]    Script Date: 03/29/2018 13:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vw_RuleDesc]
AS
SELECT     dbo.RuleDesc.ID, dbo.RuleDesc.RuleMastID, dbo.RuleDesc.SplitAs, dbo.RuleDesc.Dictionary, dbo.RuleDesc.OriginalDocumentName, dbo.RuleDesc.ConvertedDocumentName, 
                      dbo.RuleDesc.EntryDate, dbo.RuleDesc.ModifiedDate, dbo.RuleDesc.IsActive, dbo.RuleDesc.NeighbourhoodCount, dbo.RuleDesc.Expression1, dbo.RuleDesc.Expression2, 
                      dbo.RuleDesc.ContextWord, dbo.RuleDesc.Operator, dbo.RuleMast.RuleName, dbo.RuleMast.IsActive AS IsActiveRuleMast, dbo.RuleDesc.FieldName, dbo.RuleDesc.FieldValue, 
                      dbo.RuleDesc.RuleName AS RuleDescName, dbo.RuleDesc.UploadedFile, dbo.RuleDesc.IsIgnoreKeyword, dbo.RuleDesc.FieldPosition, dbo.RuleDesc.Synonyms, dbo.RuleDesc.ExpressionContext, 
                      dbo.RuleDesc.IsCheckSynonyms, CASE WHEN validation.isactive IS NULL THEN 'False' ELSE validation.isactive END AS IsActiveValidation, CAST(CASE WHEN validation.isactive IS NULL 
                      THEN 'False' ELSE 'True' END AS bit) AS IsValidated
FROM         dbo.RuleDesc INNER JOIN
                      dbo.RuleMast ON dbo.RuleDesc.RuleMastID = dbo.RuleMast.ID LEFT OUTER JOIN
                      dbo.Validation ON dbo.RuleDesc.ID = dbo.Validation.RuleDescID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[19] 4[43] 2[17] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "RuleDesc"
            Begin Extent = 
               Top = 10
               Left = 716
               Bottom = 220
               Right = 935
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RuleMast"
            Begin Extent = 
               Top = 21
               Left = 145
               Bottom = 191
               Right = 305
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Validation"
            Begin Extent = 
               Top = 11
               Left = 349
               Bottom = 198
               Right = 529
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 28
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 8130
         Alias = 2865
         Table = 1170
         Output = 720
         Append = 1400
         NewValue' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vw_RuleDesc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vw_RuleDesc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vw_RuleDesc'
GO
/****** Object:  View [dbo].[Vw_APIRuleApplicationSummary]    Script Date: 03/29/2018 13:31:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vw_APIRuleApplicationSummary]
AS
SELECT     dbo.RuleDesc.RuleName, dbo.APIRuleApplicationSummary.FieldValue, dbo.APIRuleApplicationSummary.RunID, dbo.APIRuleApplicationSummary.IsSuccess, dbo.APIRuleApplicationSummary.ID, 
                      dbo.APIRuleApplicationSummary.FileName, dbo.APIRuleApplicationSummary.EntryDate, dbo.APIRuleApplicationSummary.RuleDescID
FROM         dbo.APIRuleApplicationSummary INNER JOIN
                      dbo.RuleDesc ON dbo.APIRuleApplicationSummary.RuleDescID = dbo.RuleDesc.ID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "APIRuleApplicationSummary"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 181
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "RuleDesc"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 189
               Right = 451
            End
            DisplayFlags = 280
            TopColumn = 16
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vw_APIRuleApplicationSummary'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vw_APIRuleApplicationSummary'
GO
/****** Object:  StoredProcedure [dbo].[proc_Validate_InsertAndUpdate]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_Validate_InsertAndUpdate]
	@RuleDescID bigint
	,@IsActive bit
	,@EntryDate datetime
	,@ModifiedDate datetime
    ,@ExpressionContext nvarchar(64)
    ,@ExpressionText nvarchar(max)
    
AS
BEGIN

IF Exists(Select RuleDescID from Validation where RuleDescID=@RuleDescID)
Begin
Update [dbo].[Validation]
SET [IsActive]=@IsActive,
	[EntryDate]=@EntryDate,
	[ModifiedDate]=@ModifiedDate,
	[ExpressionContext]=@ExpressionContext,
	[ExpressionText]=@ExpressionText
	where [RuleDescID]=@RuleDescID
End
Else
Begin
INSERT INTO [dbo].[Validation]
           ([RuleDescID]
           ,[IsActive]
           ,[EntryDate]
           ,[ModifiedDate]
           ,[ExpressionContext]
           ,[ExpressionText])
     VALUES
           (@RuleDescID 
    ,@IsActive
    ,@EntryDate
	,@ModifiedDate 
    ,@ExpressionContext 
    ,@ExpressionText)
   END
END
GO
/****** Object:  StoredProcedure [dbo].[proc_Validate_CheckRuleDescID]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_Validate_CheckRuleDescID]    
     @RuleDescID bigint
        
AS    
BEGIN    
select * from [dbo].[Validation] where @RuleDescID=RuleDescID
END
GO
/****** Object:  StoredProcedure [dbo].[proc_Validate_AddNew]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================      
-- Author:  Lateetud, Aindree     
-- Create date: 03-23-2018      
-- Description: proc_Validate_AddNew      
-- =============================================      
CREATE PROCEDURE [dbo].[proc_Validate_AddNew]      
 @RuleDescID bigint      
    ,@IsActive bit      
    ,@EntryDate datetime      
    ,@ModifiedDate datetime    
 ,@ExpressionContext varchar(64)    
 ,@ExpressionText nvarchar(max)      
          
AS      
BEGIN      
INSERT INTO [dbo].[Validation]      
           ([RuleDescID]  
     ,[IsActive]     
     ,[EntryDate]    
           ,[ModifiedDate]    
           ,[ExpressionContext]     
           ,[ExpressionText]      
           )      
     VALUES      
           (@RuleDescID  
     ,@IsActive      
           ,@EntryDate      
           ,@ModifiedDate      
           ,@ExpressionContext    
           ,@ExpressionText    
           )      
      
END
GO
/****** Object:  StoredProcedure [dbo].[proc_UserMaster_UpdateActiveInactive]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[proc_UserMaster_UpdateActiveInactive]
	(
		@ID	bigint,	
		@IsActive		bit
	)
AS
UPDATE [dbo].[UserMaster]
   SET [IsActive] = @IsActive
           
 WHERE ID=@ID
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_UserMaster_Update]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_UserMaster_Update]
	(
		@ID	bigint,
		@UserName	varchar(50),
		@Password	nvarchar(50),
		@FirstName varchar(50),
		@LastName varchar(50),
		@IsActive		bit,
		@CreatedDate datetime
  ,@ModifiedDate datetime
  ,@EmailId nvarchar(1024)
  ,@LoginDatetime datetime
  ,@LastLoginDatetime datetime
  
  ,@IsAdmin   bit
	)
AS
UPDATE [dbo].[UserMaster]
   SET [UserName] = @UserName
      ,[Password] = @Password
      ,FirstName=@FirstName
      ,LastName=@LastName
      ,[IsActive] = @IsActive
      ,ModifiedDate=@ModifiedDate
      ,EmailId=@EmailId
      ,LoginDatetime=@LoginDatetime
      ,LastLoginDatetime=@LastLoginDatetime
      
      ,IsAdmin=@IsAdmin      
 WHERE ID=@ID
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_UserMaster_LoadByUserName]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[proc_UserMaster_LoadByUserName]
	(
	@UserName varchar(50)
	)
		
AS
	Select * from UserMaster where UserName = @UserName
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_UserMaster_LoadByPK]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_UserMaster_LoadByPK]
	(
	@ID bigint
	)
		
AS
	Select * from UserMaster where ID = @ID
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_UserMaster_GetAll]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_UserMaster_GetAll]
	
AS
Select * from UserMaster
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_UserMaster_Delete]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_UserMaster_Delete]
	(
	@ID bigint
	)
	
AS
	delete from UserMaster where ID = @ID
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_UserMaster_AddNew]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:  Prasanta, Lateetud  
-- Create date: 12-18-2017  
-- Description: Add new row  
-- =============================================  
CREATE PROCEDURE [dbo].[proc_UserMaster_AddNew]  
@UserName varchar(50),  
  @Password nvarchar(50),  
  @FirstName varchar(50),  
  @LastName varchar(50),  
  @IsActive  bit,
  @CreatedDate datetime
  ,@ModifiedDate datetime
  ,@EmailId nvarchar(1024)
  ,@LoginDatetime datetime
  ,@LastLoginDatetime datetime
  
  ,@IsAdmin   bit
AS  
BEGIN  
   
 SET NOCOUNT ON;  
  
INSERT INTO [dbo].[UserMaster]  
           ([UserName]
           ,[Password]
           ,[IsActive]
           ,[FirstName]
           ,[LastName]
           ,[CreatedDate]
           ,[ModifiedDate]
           ,[EmailId]
           ,[LoginDatetime]
           ,[LastLoginDatetime]
           
           ,[IsAdmin]
           )  
     VALUES  
           (@UserName  
           ,@Password  
           ,@IsActive
           ,@FirstName  
           ,@LastName  
           ,@CreatedDate
           ,@ModifiedDate
           ,@EmailId
           ,@LoginDatetime
           ,@LastLoginDatetime
           
           ,@IsAdmin)  
           
  RETURN  
END
GO
/****** Object:  StoredProcedure [dbo].[proc_ServiceHistory_GetStatusOfNRecords]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_ServiceHistory_GetStatusOfNRecords]    
     
AS    
select top 1 * from ServiceHistory order by runtime desc
 RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_ServiceHistory_GetLastNRecords]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[proc_ServiceHistory_GetLastNRecords]    
     
AS    
Select top 3 * from dbo.ServiceHistory where status='RUNNING' and runid <> 0 order by runtime desc
 RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_ServiceHistory_GetAll]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_ServiceHistory_GetAll]      
       
AS      
--Select * from dbo.ServiceHistory order by runtime desc  

Select * from dbo.ServiceHistory where id not in (select ID from ServiceHistory where runid = '0' and status='RUNNING') order by runtime desc  

 RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_ServiceHistory_AddNew]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Lateetud, Prasanta
-- Create date: 00-13-2018
-- Description:	proc_ServiceHistory_AddNew
-- =============================================
CREATE PROCEDURE [dbo].[proc_ServiceHistory_AddNew]
	@RunTime datetime
    ,@Comment nvarchar(max)
    ,@Status varchar(50)
    ,@RunID bigint
    ,@NoOfFile int
    
AS
BEGIN
INSERT INTO [dbo].[ServiceHistory]
           ([RunTime]
           ,[Comment]
           ,[Status]
           ,[RunID]
           ,[NoOfFile])
     VALUES
           (@RunTime
           ,@Comment
           ,@Status
           ,@RunID
           ,@NoOfFile)

END
GO
/****** Object:  StoredProcedure [dbo].[proc_RuleMast_Update]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_RuleMast_Update]
	(
	@ID	bigint,
@RuleName nvarchar(500),

@ModifiedDate datetime,
@IsActive bit
	)
AS	
	UPDATE [dbo].[RuleMast]
   SET [RuleName] = @RuleName
      
      ,[ModifiedDate] = @ModifiedDate
      ,[IsActive] = @IsActive
 WHERE ID=@ID
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_RuleMast_LoadByPK]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[proc_RuleMast_LoadByPK]
	(
	@ID bigint
	)
		
AS
	Select * from RuleMast where ID = @ID
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_RuleMast_GetAll]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[proc_RuleMast_GetAll]
	
AS
Select * from dbo.RuleMast
RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_RuleMast_AddNew]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:  Prasanta, Lateetud  
-- Create date: 01-23-2018 
-- Description: Add new row  
-- =============================================  
Create PROCEDURE [dbo].[proc_RuleMast_AddNew]  
@RuleName nvarchar(500),
@CreateDate datetime,
@ModifiedDate datetime,
@IsActive bit
AS  
BEGIN  
   
 SET NOCOUNT ON;  
  
INSERT INTO [TLRuleBuilder].[dbo].[RuleMast]
           ([RuleName]
           ,[CreateDate]
           ,[ModifiedDate]
           ,[IsActive])
     VALUES
           (@RuleName 
           ,@CreateDate
           ,@ModifiedDate 
           ,@IsActive )

           
  RETURN  
END
GO
/****** Object:  StoredProcedure [dbo].[proc_RuleEngineDetails_InsertAndUpdate]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_RuleEngineDetails_InsertAndUpdate]
	@RuleMastID bigint
    ,@RuleDescID nvarchar(2048)
    ,@FolderPath nvarchar(2048)
    ,@UserID bigint
    ,@CreateDate datetime
    ,@ModifiedDate datetime
    ,@IsActive bit
AS
BEGIN

IF Exists(Select RuleMastID from RuleEngineDetails where RuleMastID=@RuleMastID)
Begin
Update [dbo].[RuleEngineDetails]
SET [RuleDescID]=@RuleDescID,
	[FolderPath]=@FolderPath,
	[UserID]=@UserID,
	[CreateDate]=@CreateDate,
	[ModifiedDate]=@ModifiedDate,
	[IsActive]=@IsActive
	where [RuleMastID]=@RuleMastID
End
Else
Begin
INSERT INTO [dbo].[RuleEngineDetails]
           ([RuleMastID]
           ,[RuleDescID]
           ,[FolderPath]
           ,[UserID]
           ,[CreateDate]
           ,[ModifiedDate]
           ,[IsActive])
     VALUES
           (@RuleMastID 
    ,@RuleDescID
    ,@FolderPath
    ,@UserID 
    ,@CreateDate 
    ,@ModifiedDate
    ,@IsActive)
	End
END
GO
/****** Object:  StoredProcedure [dbo].[proc_RuleEngineDetails_GetAll]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[proc_RuleEngineDetails_GetAll]    
     
AS    
Select * from dbo.RuleEngineDetails
 RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_RuleEngineDetails_AddNew]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Lateetud, Prasanta
-- Create date: 00-13-2018
-- Description:	proc_RuleEngineDetails_AddNew
-- =============================================
CREATE PROCEDURE [dbo].[proc_RuleEngineDetails_AddNew]
	@RuleMastID bigint
    ,@RuleDescID nvarchar(2048)
    ,@FolderPath nvarchar(2048)
    ,@UserID bigint
    ,@CreateDate datetime
    ,@ModifiedDate datetime
    ,@IsActive bit
AS
BEGIN
INSERT INTO [dbo].[RuleEngineDetails]
           ([RuleMastID]
           ,[RuleDescID]
           ,[FolderPath]
           ,[UserID]
           ,[CreateDate]
           ,[ModifiedDate]
           ,[IsActive])
     VALUES
           (@RuleMastID 
    ,@RuleDescID
    ,@FolderPath
    ,@UserID 
    ,@CreateDate 
    ,@ModifiedDate
    ,@IsActive)

END
GO
/****** Object:  StoredProcedure [dbo].[proc_RuleEngine_LoadByRuleMastID]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_RuleEngine_LoadByRuleMastID]    
 (    
 @RuleMastID Bigint  
 )    
      
AS    
   
 declare @RuleDescID varchar(2048)

Select @RuleDescID=ruledescid from dbo.RuleEngineDetails where RuleMastID = @RuleMastID 

select item as RuleDescID from dbo.fnSplit( @RuleDescID  , ',')
     
 RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_RuleDesc_UpdateActiveInactive]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[proc_RuleDesc_UpdateActiveInactive]  
 (  
  @ID bigint,   
  @IsActive  bit  
 )  
AS  
UPDATE [dbo].[RuleDesc]  
   SET [IsActive] = @IsActive  
             
 WHERE ID=@ID  
   
 RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_RuleDesc_Update]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_RuleDesc_Update]    
(    
@ID bigint,    
@RuleMastID bigint,    
@RuleName varchar(512),    
@SplitAs varchar(50),    
@Dictionary varchar(50),    
@OriginalDocumentName nvarchar(max),    
@ConvertedDocumentName nvarchar(max),    
@EntryDate datetime,    
@ModifiedDate datetime,    
@IsActive bit,    
@NeighbourhoodCount int,    
@Expression1 nvarchar(50),    
@Expression2 nvarchar(50),    
@ContextWord nvarchar(1024),    
@Operator varchar(50),    
@FieldName nvarchar(2048),    
@FieldValue nvarchar(max),    
@UploadedFile nvarchar(max),    
@IsIgnoreKeyword bit    
,@FieldPosition varchar(50)    
,@IsCheckSynonyms bit    
,@Synonyms nvarchar(max)    
,@AllSynonyms nvarchar(max)    
,@ExpressionContext  varchar(50)    
,@DocType   varchar(8)
,@ParentRuleID bigint  
)    
AS     
UPDATE [dbo].[RuleDesc]    
   SET [RuleMastID] = @RuleMastID    
      ,[RuleName] = @RuleName    
      ,[SplitAs] = @SplitAs    
      ,[Dictionary] = @Dictionary    
      ,[OriginalDocumentName] = @OriginalDocumentName    
      ,[ConvertedDocumentName] = @ConvertedDocumentName    
      ,[EntryDate] = @EntryDate    
      ,[ModifiedDate] = @ModifiedDate    
      ,[IsActive] = @IsActive    
      ,[NeighbourhoodCount] = @NeighbourhoodCount    
      ,[Expression1] = @Expression1    
      ,[Expression2] = @Expression2    
      ,[ContextWord] = @ContextWord    
      ,[Operator] = @Operator    
      ,[FieldName]=@FieldName    
      ,[FieldValue]=@FieldValue    
      ,[UploadedFile]=@UploadedFile,    
   [IsIgnoreKeyword]=@IsIgnoreKeyword,    
   [FieldPosition]=@FieldPosition,    
   [IsCheckSynonyms]=@IsCheckSynonyms,    
   [Synonyms]=@Synonyms,    
   [AllSynonyms]=@AllSynonyms,    
   [ExpressionContext]=@ExpressionContext,  
   DocType=@DocType,   
    ParentRuleID=@ParentRuleID
 WHERE ID=@ID    
RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_RuleDesc_LoadByRuleMastID]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[proc_RuleDesc_LoadByRuleMastID]    
 (    
 @RuleMastID bigint    
 )    
      
AS    
 Select * from RuleDesc where RuleMastID  = @RuleMastID    
     
 RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_RuleDesc_LoadByPK]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[proc_RuleDesc_LoadByPK]  
 (  
 @ID bigint  
 )  
    
AS  
 Select * from RuleDesc where ID = @ID  
   
 RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_RuleDesc_LoadByIDs]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[proc_RuleDesc_LoadByIDs]      
 (      
 @IDs varchar(2048)      
 )      
        
AS      
 Select * from RuleDesc where ID in  (@IDs)     
       
 RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_RuleDesc_AddNew]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_RuleDesc_AddNew]          
@RuleMastID bigint,        
@RuleName varchar(512),        
@SplitAs varchar(50),        
@Dictionary varchar(50),        
@OriginalDocumentName nvarchar(max),        
@ConvertedDocumentName nvarchar(max),        
@EntryDate datetime,        
@ModifiedDate datetime,        
@IsActive bit,        
@NeighbourhoodCount int,        
@Expression1 nvarchar(1024),        
@Expression2 nvarchar(1024),        
@ContextWord nvarchar(1024),        
@Operator varchar(50),        
@FieldName nvarchar(2048),        
@FieldValue nvarchar(max),        
@UploadedFile nvarchar(max),      
@IsIgnoreKeyword bit      
,@FieldPosition varchar(50)      
,@IsCheckSynonyms bit      
,@Synonyms nvarchar(max)      
,@AllSynonyms nvarchar(max)      
,@ExpressionContext  varchar(50)    
,@DocType   varchar(8)
,@ParentRuleID bigint    
AS          
BEGIN          
           
 SET NOCOUNT ON;          
          
INSERT INTO [dbo].[RuleDesc]        
           ([RuleMastID]        
           ,[RuleName]        
           ,[SplitAs]        
           ,[Dictionary]        
           ,[OriginalDocumentName]        
           ,[ConvertedDocumentName]        
           ,[EntryDate]        
           ,[ModifiedDate]        
           ,[IsActive]        
           ,[NeighbourhoodCount]        
           ,[Expression1]        
           ,[Expression2]        
           ,[ContextWord]        
           ,[Operator]        
           ,[FieldName]      
           ,[FieldValue]        
           ,[UploadedFile]      
           ,[IsIgnoreKeyword]      
           ,[FieldPosition]      
           ,[IsCheckSynonyms]      
           ,[Synonyms]      
   ,[AllSynonyms]      
           ,[ExpressionContext]    
           ,DocType
           ,ParentRuleID)        
     VALUES        
           (@RuleMastID,        
@RuleName,        
@SplitAs,        
@Dictionary,        
@OriginalDocumentName,        
@ConvertedDocumentName,        
@EntryDate,        
@ModifiedDate,        
@IsActive,        
@NeighbourhoodCount,        
@Expression1,        
@Expression2,        
@ContextWord,        
@Operator,        
@FieldName,        
@FieldValue,        
@UploadedFile,      
@IsIgnoreKeyword      
,@FieldPosition      
,@IsCheckSynonyms      
,@Synonyms      
,@AllSynonyms      
,@ExpressionContext    
,@DocType 
,@ParentRuleID      
)        
        
                   
  RETURN          
END
GO
/****** Object:  StoredProcedure [dbo].[proc_RuleApplicationSummary_LoadByRunID]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[proc_RuleApplicationSummary_LoadByRunID]  
 (  
 @RunID Bigint
 )  
    
AS  
 
 SELECT     TOP (100) PERCENT RunID, FileName, FieldValue, EntryDate, CASE WHEN IsSuccess IS NULL THEN 'True' ELSE IsSuccess END AS IsSuccess
FROM         dbo.RuleApplicationSummary
WHERE     (RunID = @RunID)
ORDER BY EntryDate DESC
   
 RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_RuleApplicationSummary_GetRunID]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[proc_RuleApplicationSummary_GetRunID]
	
AS
  SELECT ISNULL(max(RunID),0)+1 as RunID
FROM RuleApplicationSummary
RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_RuleApplicationSummary_GetDateWiseSuccessFailure]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_RuleApplicationSummary_GetDateWiseSuccessFailure]
	 (  
 @RunDate datetime 
 )  
AS
select count(filename) NoOfFileProcessed,cast(entrydate as date) RunDate,issuccess
from dbo.RuleApplicationSummary where cast(entrydate as date)=cast(@RunDate as date) group by cast(entrydate as date),issuccess  order by cast(entrydate as date) desc
RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_RuleApplicationSummary_GetDateWiseData]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_RuleApplicationSummary_GetDateWiseData]
	
AS
select count(filename) NoOfFileProcessed,cast(entrydate as date) RunDate
from dbo.RuleApplicationSummary group by cast(entrydate as date)  order by cast(entrydate as date) desc
RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_RuleApplicationSummary_AddNew]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================      
-- Author:  Prasanta, Lateetud      
-- Create date: 02-16-2018      
-- Description: Add new row      
-- =============================================      
CREATE PROCEDURE [dbo].[proc_RuleApplicationSummary_AddNew]      
@RunID bigint,  
@FileName nvarchar(max),  
@RuleDescID bigint,  
@FieldValue nvarchar(max),  
@EntryDate datetime,
@IsSuccess bit  
  
AS      
BEGIN      
       
 SET NOCOUNT ON;      
    
INSERT INTO [dbo].[RuleApplicationSummary]  
           ([RunID]  
           ,[FileName]  
           ,[RuleDescID]  
           ,[FieldValue]             
           ,[EntryDate]
           ,[IsSuccess]  
          )  
     VALUES  
           (@RunID,  
           @FileName,  
           @RuleDescID,  
           @FieldValue,            
           @EntryDate,
           @IsSuccess  
          )  
  
           
  RETURN      
END
GO
/****** Object:  StoredProcedure [dbo].[proc_Configuration_Update]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_Configuration_Update]
	(
	@ID	bigint,
@ConfigurationValue nvarchar(4000),
@ModifiedDate datetime

	)
AS	
	UPDATE [dbo].[Configuration]
   SET [ConfigurationValue] = @ConfigurationValue,
   ModifiedDate=@ModifiedDate
      
 WHERE ID=@ID

	RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_Configuration_LoadByKey]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[proc_Configuration_LoadByKey]  
 (  
 @ConfigurationKey varchar(50)  
 )  
    
AS  
 Select * from configuration where ConfigurationKey = @ConfigurationKey  
   
 RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_Configuration_GetAll]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[proc_Configuration_GetAll]
	
AS
select * from dbo.Configuration
RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_APIRuleApplicationSummary_GetRunID]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[proc_APIRuleApplicationSummary_GetRunID]  
   
AS  
  SELECT ISNULL(max(RunID),0)+1 as RunID  
FROM APIRuleApplicationSummary  
RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_APIRuleApplicationSummary_GetResultByRunID]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[proc_APIRuleApplicationSummary_GetResultByRunID]  
 (  
 @RunID Bigint
 )  
    
AS  

SELECT     dbo.RuleDesc.RuleName, dbo.APIRuleApplicationSummary.FieldValue
FROM         dbo.APIRuleApplicationSummary INNER JOIN
                      dbo.RuleDesc ON dbo.APIRuleApplicationSummary.RuleDescID = dbo.RuleDesc.ID
WHERE     (RunID = @RunID)
   
 RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_APIRuleApplicationSummary_AddNew]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================        
-- Author:  Prasanta, Lateetud        
-- Create date: 03-15-2018        
-- Description: Add new row        
-- =============================================        
CREATE PROCEDURE [dbo].[proc_APIRuleApplicationSummary_AddNew]        
@RunID bigint,    
@FileName nvarchar(max),    
@RuleDescID bigint,    
@FieldValue nvarchar(max),    
@EntryDate datetime,  
@IsSuccess bit    
    
AS        
BEGIN        
         
 SET NOCOUNT ON;        
      
INSERT INTO [dbo].[APIRuleApplicationSummary]    
           ([RunID]    
           ,[FileName]    
           ,[RuleDescID]    
           ,[FieldValue]               
           ,[EntryDate]  
           ,[IsSuccess]    
          )    
     VALUES    
           (@RunID,    
           @FileName,    
           @RuleDescID,    
           @FieldValue,              
           @EntryDate,  
           @IsSuccess    
          )    
    
             
  RETURN        
END
GO
/****** Object:  StoredProcedure [dbo].[proc_APICallHistory_GetAll]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_APICallHistory_GetAll]        
         
AS        

Select * from dbo.APICallHistory
  
 RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_APICallHistory_AddNew]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:  Lateetud, Prasanta  
-- Create date: 03-15-2018  
-- Description: proc_APICallHistory_AddNew  
-- =============================================  
CREATE PROCEDURE [dbo].[proc_APICallHistory_AddNew]  
 @RunTime datetime  
    ,@Comment nvarchar(max)  
    ,@Status varchar(50)  
    ,@RunID bigint  
      
AS  
BEGIN  
INSERT INTO [dbo].[APICallHistory]  
           ([RunTime]  
           ,[Comment]  
           ,[Status]  
           ,[RunID]  
           )  
     VALUES  
           (@RunTime  
           ,@Comment  
           ,@Status  
           ,@RunID  
           )  
  
END
GO
/****** Object:  StoredProcedure [dbo].[proc_VwRuleEngine_LoadByRuleMastID]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[proc_VwRuleEngine_LoadByRuleMastID]  
 (  
 @RuleMastID Bigint
 )  
    
AS  
 Select * from dbo.vw_RuleEngine where RuleMastID = @RuleMastID  
   
 RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_VwRuleEngine_GetAll]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[proc_VwRuleEngine_GetAll]  
   
AS  
Select * from dbo.Vw_RuleEngine  
 RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_VwRuleDesc_LoadByUserName]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[proc_VwRuleDesc_LoadByUserName]  
 (  
 @RuleName varchar(50)  
 )  
    
AS  
 Select * from dbo.Vw_RuleDesc where RuleName = @RuleName  
   
 RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_VwRuleDesc_GetAll]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[proc_VwRuleDesc_GetAll]
	
AS
Select * from dbo.Vw_RuleDesc
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_vwAPIRuleApplicationSummary_GetResultByRunID]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_vwAPIRuleApplicationSummary_GetResultByRunID] 
 (  
 @RunID Bigint
 )  
    
AS  
SELECT  RuleName,FieldValue from dbo.Vw_APIRuleApplicationSummary
WHERE   RunID=1  --(RunID = @RunID) and issuccess='true'
   
 RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_Vw_Validate_CheckRuleDescID]    Script Date: 03/29/2018 13:31:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_Vw_Validate_CheckRuleDescID]    
     @RuleDescID bigint
        
AS    
BEGIN    
select * from [dbo].[Vw_Validation] where @RuleDescID=RuleDescID
END
GO
