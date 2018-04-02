CREATE VIEW [dbo].[Vw_RuleApplicationSumary]
AS
SELECT        dbo.RuleApplicationSummary.ID, dbo.RuleApplicationSummary.RunID, dbo.RuleApplicationSummary.FileName, dbo.RuleApplicationSummary.RuleDescID, dbo.RuleApplicationSummary.FieldValue, 
                         dbo.RuleApplicationSummary.EntryDate, dbo.RuleApplicationSummary.IsSuccess, dbo.RuleDesc.RuleMastID, dbo.RuleDesc.RuleName, dbo.RuleDesc.FieldName, dbo.RuleDesc.DocType, dbo.RuleDesc.ParentRuleID
FROM            dbo.RuleApplicationSummary INNER JOIN
                         dbo.RuleDesc ON dbo.RuleApplicationSummary.RuleDescID = dbo.RuleDesc.ID
GO

CREATE PROCEDURE [dbo].[proc_VwRuleApplicationSummary_LoadByRunID]    
 (    
 @RunID Bigint  
 )    
      
AS    
   
 SELECT     *  
FROM         [Vw_RuleApplicationSumary]  
WHERE     (RunID = @RunID)  
ORDER BY EntryDate DESC  
     
 RETURN 
 GO

  CREATE PROCEDURE [dbo].[proc_VwRuleApplicationSummary_LoadByID]    
 (    
 @ID Bigint  
 )    
      
AS    
   
 SELECT     *
FROM         [dbo].[Vw_RuleApplicationSumary]  
WHERE     (ID = @ID)  
    
 RETURN
 GO