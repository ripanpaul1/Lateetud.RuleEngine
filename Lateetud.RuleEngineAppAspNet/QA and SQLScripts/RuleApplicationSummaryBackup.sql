USE [TLRuleBuilder]
GO

/****** Object:  Table [dbo].[RuleApplicationSummaryBackup]    Script Date: 04-04-2018 03:26:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RuleApplicationSummaryBackup](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[RuleApplicationID] [bigint] NOT NULL,
	[RunID] [bigint] NULL,
	[FileName] [nvarchar](max) NULL,
	[RuleDescID] [bigint] NULL,
	[FieldValue] [nvarchar](max) NULL,
	[EntryDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IsSuccess] [bit] NULL,
 CONSTRAINT [PK_RuleApplicationSummaryBackup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO