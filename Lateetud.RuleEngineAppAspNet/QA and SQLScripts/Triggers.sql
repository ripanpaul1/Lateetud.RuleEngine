USE [TLRuleBuilder]
GO
/****** Object:  Trigger [dbo].[RuleSummaryUpdate]    Script Date: 04-04-2018 03:20:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[RuleSummaryUpdate]
on [dbo].[RuleApplicationSummary]
after update 
as
insert into RuleApplicationSummaryBackup(RuleApplicationID,RunID,FileName,RuleDescID,FieldValue,EntryDate,ModifiedDate,IsSuccess)
select id,RunID,FileName,RuleDescID,FieldValue,EntryDate,getdate(), IsSuccess
from deleted
GO


USE [TLRuleBuilder]
GO
/****** Object:  Trigger [dbo].[APIRuleSummaryUpdate]    Script Date: 04-04-2018 03:21:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[APIRuleSummaryUpdate]
on [dbo].[APIRuleApplicationSummary]
after update 
as
insert into APIRuleApplicationSummaryBackup(RuleApplicationID,RunID,FileName,RuleDescID,FieldValue,EntryDate,ModifiedDate,IsSuccess)
select id,RunID,FileName,RuleDescID,FieldValue,EntryDate,getdate(), IsSuccess
from deleted
GO