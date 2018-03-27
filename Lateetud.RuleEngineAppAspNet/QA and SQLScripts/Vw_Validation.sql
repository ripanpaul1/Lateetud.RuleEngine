CREATE VIEW [dbo].[Vw_Validation]
AS
SELECT        dbo.Validation.ID, dbo.Validation.RuleDescID, dbo.Validation.Isactive, dbo.Validation.EntryDate, dbo.Validation.ModifiedDate, dbo.Validation.ExpressionContext, dbo.Validation.ExpressionText, dbo.RuleDesc.RuleMastID, 
                         dbo.RuleDesc.RuleName
FROM            dbo.Validation INNER JOIN
                         dbo.RuleDesc ON dbo.Validation.RuleDescID = dbo.RuleDesc.ID
GO