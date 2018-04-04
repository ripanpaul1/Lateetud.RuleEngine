create trigger [dbo].[RuleSummaryUpdate]
on [dbo].[RuleApplicationSummary]
after update 
as
insert into RuleApplicationSummaryBackup(RuleApplicationID,RunID,FileName,RuleDescID,FieldValue,EntryDate,ModifiedDate,IsSuccess)
select id,RunID,FileName,RuleDescID,FieldValue,EntryDate,getdate(), IsSuccess
from deleted
GO
