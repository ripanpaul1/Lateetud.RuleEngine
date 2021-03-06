USE [master]
GO
/****** Object:  Database [TLRuleBuilder]    Script Date: 03/20/2018 17:28:23 ******/
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
/****** Object:  User [sa1]    Script Date: 03/20/2018 17:28:23 ******/
CREATE USER [sa1] FOR LOGIN [sa1] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [pb1]    Script Date: 03/20/2018 17:28:23 ******/
CREATE USER [pb1] FOR LOGIN [pb1] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[UserMaster]    Script Date: 03/20/2018 17:28:24 ******/
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
/****** Object:  Table [dbo].[ServiceHistory]    Script Date: 03/20/2018 17:28:24 ******/
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
/****** Object:  Table [dbo].[RuleMast]    Script Date: 03/20/2018 17:28:24 ******/
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
/****** Object:  Table [dbo].[RuleEngineDetails]    Script Date: 03/20/2018 17:28:24 ******/
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
/****** Object:  Table [dbo].[RuleDesc]    Script Date: 03/20/2018 17:28:24 ******/
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
	[OriginalDocumentName] [nvarchar](4000) NULL,
	[ConvertedDocumentName] [nvarchar](4000) NULL,
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
	[UploadedFile] [nvarchar](1024) NULL,
	[IsIgnoreKeyword] [bit] NULL,
	[FieldPosition] [varchar](50) NULL,
	[Synonyms] [nvarchar](max) NULL,
	[ExpressionContext] [varchar](50) NULL,
	[IsCheckSynonyms] [bit] NULL,
	[AllSynonyms] [nvarchar](max) NULL,
 CONSTRAINT [PK_RuleDesc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RuleApplicationSummary]    Script Date: 03/20/2018 17:28:24 ******/
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
/****** Object:  UserDefinedFunction [dbo].[fnSplit]    Script Date: 03/20/2018 17:28:25 ******/
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
/****** Object:  Table [dbo].[Configuration]    Script Date: 03/20/2018 17:28:25 ******/
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
/****** Object:  Table [dbo].[APIRuleApplicationSummary]    Script Date: 03/20/2018 17:28:25 ******/
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
/****** Object:  Table [dbo].[APICallHistory]    Script Date: 03/20/2018 17:28:25 ******/
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
/****** Object:  View [dbo].[vw_RuleEngine]    Script Date: 03/20/2018 17:28:25 ******/
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
/****** Object:  View [dbo].[Vw_RuleDesc]    Script Date: 03/20/2018 17:28:25 ******/
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
                      dbo.RuleDesc.IsCheckSynonyms
FROM         dbo.RuleDesc INNER JOIN
                      dbo.RuleMast ON dbo.RuleDesc.RuleMastID = dbo.RuleMast.ID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[17] 3) )"
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
               Top = 6
               Left = 34
               Bottom = 216
               Right = 253
            End
            DisplayFlags = 280
            TopColumn = 13
         End
         Begin Table = "RuleMast"
            Begin Extent = 
               Top = 6
               Left = 291
               Bottom = 176
               Right = 451
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
         Column = 2430
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vw_RuleDesc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vw_RuleDesc'
GO
/****** Object:  View [dbo].[Vw_APIRuleApplicationSummary]    Script Date: 03/20/2018 17:28:25 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_UserMaster_UpdateActiveInactive]    Script Date: 03/20/2018 17:28:28 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_UserMaster_Update]    Script Date: 03/20/2018 17:28:28 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_UserMaster_LoadByUserName]    Script Date: 03/20/2018 17:28:28 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_UserMaster_LoadByPK]    Script Date: 03/20/2018 17:28:28 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_UserMaster_GetAll]    Script Date: 03/20/2018 17:28:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_UserMaster_GetAll]
	
AS
Select * from UserMaster
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_UserMaster_Delete]    Script Date: 03/20/2018 17:28:28 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_UserMaster_AddNew]    Script Date: 03/20/2018 17:28:28 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_ServiceHistory_GetStatusOfNRecords]    Script Date: 03/20/2018 17:28:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_ServiceHistory_GetStatusOfNRecords]    
     
AS    
select top 1 * from ServiceHistory order by runtime desc
 RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_ServiceHistory_GetLastNRecords]    Script Date: 03/20/2018 17:28:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[proc_ServiceHistory_GetLastNRecords]    
     
AS    
Select top 3 * from dbo.ServiceHistory where status='RUNNING' and runid <> 0 order by runtime desc
 RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_ServiceHistory_GetAll]    Script Date: 03/20/2018 17:28:28 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_ServiceHistory_AddNew]    Script Date: 03/20/2018 17:28:28 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_RuleMast_Update]    Script Date: 03/20/2018 17:28:28 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_RuleMast_LoadByPK]    Script Date: 03/20/2018 17:28:28 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_RuleMast_GetAll]    Script Date: 03/20/2018 17:28:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[proc_RuleMast_GetAll]
	
AS
Select * from dbo.RuleMast
RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_RuleMast_AddNew]    Script Date: 03/20/2018 17:28:28 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_RuleEngineDetails_InsertAndUpdate]    Script Date: 03/20/2018 17:28:28 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_RuleEngineDetails_GetAll]    Script Date: 03/20/2018 17:28:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[proc_RuleEngineDetails_GetAll]    
     
AS    
Select * from dbo.RuleEngineDetails
 RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_RuleEngineDetails_AddNew]    Script Date: 03/20/2018 17:28:28 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_RuleEngine_LoadByRuleMastID]    Script Date: 03/20/2018 17:28:28 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_RuleDesc_UpdateActiveInactive]    Script Date: 03/20/2018 17:28:28 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_RuleDesc_Update]    Script Date: 03/20/2018 17:28:28 ******/
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
@OriginalDocumentName nvarchar(4000),
@ConvertedDocumentName nvarchar(4000),
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
@UploadedFile nvarchar(1024),
@IsIgnoreKeyword bit
,@FieldPosition varchar(50)
,@IsCheckSynonyms bit
,@Synonyms nvarchar(max)
,@AllSynonyms nvarchar(max)
,@ExpressionContext  varchar(50)
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
   [ExpressionContext]=@ExpressionContext
 WHERE ID=@ID
RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_RuleDesc_LoadByRuleMastID]    Script Date: 03/20/2018 17:28:28 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_RuleDesc_LoadByPK]    Script Date: 03/20/2018 17:28:28 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_RuleDesc_LoadByIDs]    Script Date: 03/20/2018 17:28:28 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_RuleDesc_AddNew]    Script Date: 03/20/2018 17:28:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_RuleDesc_AddNew]    
@RuleMastID bigint,  
@RuleName varchar(512),  
@SplitAs varchar(50),  
@Dictionary varchar(50),  
@OriginalDocumentName nvarchar(4000),  
@ConvertedDocumentName nvarchar(4000),  
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
@UploadedFile nvarchar(1024),
@IsIgnoreKeyword bit
,@FieldPosition varchar(50)
,@IsCheckSynonyms bit
,@Synonyms nvarchar(max)
,@AllSynonyms nvarchar(max)
,@ExpressionContext  varchar(50)
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
           ,[ExpressionContext])  
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
)  
  
             
  RETURN    
END
GO
/****** Object:  StoredProcedure [dbo].[proc_RuleApplicationSummary_LoadByRunID]    Script Date: 03/20/2018 17:28:28 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_RuleApplicationSummary_GetRunID]    Script Date: 03/20/2018 17:28:28 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_RuleApplicationSummary_GetDateWiseSuccessFailure]    Script Date: 03/20/2018 17:28:28 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_RuleApplicationSummary_GetDateWiseData]    Script Date: 03/20/2018 17:28:28 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_RuleApplicationSummary_AddNew]    Script Date: 03/20/2018 17:28:28 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_Configuration_Update]    Script Date: 03/20/2018 17:28:28 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_Configuration_LoadByKey]    Script Date: 03/20/2018 17:28:28 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_Configuration_GetAll]    Script Date: 03/20/2018 17:28:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[proc_Configuration_GetAll]
	
AS
select * from dbo.Configuration
RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_APIRuleApplicationSummary_GetRunID]    Script Date: 03/20/2018 17:28:28 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_APIRuleApplicationSummary_GetResultByRunID]    Script Date: 03/20/2018 17:28:28 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_APIRuleApplicationSummary_AddNew]    Script Date: 03/20/2018 17:28:28 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_APICallHistory_GetAll]    Script Date: 03/20/2018 17:28:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_APICallHistory_GetAll]        
         
AS        

Select * from dbo.APICallHistory
  
 RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_APICallHistory_AddNew]    Script Date: 03/20/2018 17:28:28 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_VwRuleEngine_LoadByRuleMastID]    Script Date: 03/20/2018 17:28:28 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_VwRuleEngine_GetAll]    Script Date: 03/20/2018 17:28:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[proc_VwRuleEngine_GetAll]  
   
AS  
Select * from dbo.Vw_RuleEngine  
 RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_VwRuleDesc_LoadByUserName]    Script Date: 03/20/2018 17:28:28 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_VwRuleDesc_GetAll]    Script Date: 03/20/2018 17:28:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[proc_VwRuleDesc_GetAll]
	
AS
Select * from dbo.Vw_RuleDesc
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[proc_vwAPIRuleApplicationSummary_GetResultByRunID]    Script Date: 03/20/2018 17:28:28 ******/
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
