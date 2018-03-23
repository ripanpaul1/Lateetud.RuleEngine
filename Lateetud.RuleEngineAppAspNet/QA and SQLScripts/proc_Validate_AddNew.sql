-- =============================================    
-- Author:  Lateetud, Aindree   
-- Create date: 03-23-2018    
-- Description: proc_Validate_AddNew    
-- =============================================    
alter PROCEDURE [dbo].[proc_Validate_AddNew]    
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