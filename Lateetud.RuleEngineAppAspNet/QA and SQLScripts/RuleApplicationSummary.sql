CREATE PROCEDURE [dbo].[proc_RuleApplicationSummary_UpdateFieldValue]
	@ID bigint
	,@FieldValue nvarchar(max)
    
AS
BEGIN

Update [dbo].[RuleApplicationSummary]
SET [FieldValue]=@FieldValue
	where [ID]=@ID

END
GO
