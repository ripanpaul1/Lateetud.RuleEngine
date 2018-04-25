ALTER VIEW [dbo].[Vw_RuleDesc]
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