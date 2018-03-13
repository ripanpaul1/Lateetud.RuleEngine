ALTER TABLE RuleApplicationSummary
ADD IsSuccess bit

go

     
-- =============================================      
-- Author:  Prasanta, Lateetud      
-- Create date: 02-16-2018      
-- Description: Add new row      
-- =============================================      
alter PROCEDURE [dbo].[proc_RuleApplicationSummary_AddNew]      
@RunID bigint,  
@FileName nvarchar(max),  
@RuleDescID bigint,  
@FieldValue nvarchar(max),  
@EntryDate datetime,
@IsSuccess bit  
  
AS      
BEGIN      
       
 SET NOCOUNT ON;      
    
INSERT INTO [dbo].[RuleApplicationSummary]  
           ([RunID]  
           ,[FileName]  
           ,[RuleDescID]  
           ,[FieldValue]             
           ,[EntryDate]
           ,[IsSuccess]  
          )  
     VALUES  
           (@RunID,  
           @FileName,  
           @RuleDescID,  
           @FieldValue,            
           @EntryDate,
           @IsSuccess  
          )  
  
           
  RETURN      
END      


GO
 create PROCEDURE [dbo].[proc_RuleApplicationSummary_LoadByRunID]  
 (  
 @RunID Bigint
 )  
    
AS  
 
 SELECT     TOP (100) PERCENT RunID, FileName, FieldValue, EntryDate, CASE WHEN IsSuccess IS NULL THEN 'True' ELSE IsSuccess END AS IsSuccess
FROM         dbo.RuleApplicationSummary
WHERE     (RunID = @RunID)
ORDER BY EntryDate DESC
   
 RETURN  
  
  GO
  Create PROCEDURE [dbo].[proc_RuleApplicationSummary_GetDateWiseData]
	
AS
select count(filename) NoOfFileProcessed,cast(entrydate as date) RunDate
from dbo.RuleApplicationSummary group by cast(entrydate as date)  order by cast(entrydate as date) desc
RETURN
GO
	
create PROCEDURE [dbo].[proc_RuleApplicationSummary_GetDateWiseSuccessFailure]
	 (  
 @RunDate date  
 )  
AS
select count(filename) NoOfFileProcessed,cast(entrydate as date) RunDate,issuccess
from dbo.RuleApplicationSummary where cast(entrydate as date)=@RunDate group by cast(entrydate as date),issuccess  order by cast(entrydate as date) desc
RETURN

Go