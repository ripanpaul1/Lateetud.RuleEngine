USE [TLRuleBuilder]
GO
/****** Object:  StoredProcedure [dbo].[proc_VwAPIRuleApplicationSummary_LoadByRunID]    Script Date: 04-04-2018 03:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_VwAPIRuleApplicationSummary_LoadByRunID]  
 (  
 @RunID Bigint
 )  
    
AS  

SELECT     RunID,FileName,FieldValue,EntryDate,IsSuccess,ID
FROM        [dbo].[Vw_APIRuleApplicationSummary]
WHERE     (RunID = @RunID)
   
 RETURN
 GO

 USE [TLRuleBuilder]
GO
/****** Object:  StoredProcedure [dbo].[proc_VwAPIRuleApplicationSummary_LoadApiDetailsByID]    Script Date: 04-04-2018 03:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_VwAPIRuleApplicationSummary_LoadApiDetailsByID]  
 (  
 @ID Bigint
 )  
    
AS  

SELECT     RuleName,FileName,FieldValue,ID
FROM        [dbo].[Vw_APIRuleApplicationSummary]
WHERE     (ID = @ID)
   
 RETURN
GO

USE [TLRuleBuilder]
GO
/****** Object:  StoredProcedure [dbo].[proc_VwAPIRuleApplicationSummary_UpdateFieldValue]    Script Date: 04-04-2018 03:32:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[proc_VwAPIRuleApplicationSummary_UpdateFieldValue]
	@ID bigint
	,@FieldValue nvarchar(max)
    
AS
BEGIN

Update [dbo].[Vw_APIRuleApplicationSummary]
SET [FieldValue]=@FieldValue
	where [ID]=@ID

END
GO
