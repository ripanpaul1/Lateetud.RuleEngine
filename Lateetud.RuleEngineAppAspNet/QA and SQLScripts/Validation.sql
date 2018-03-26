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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
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