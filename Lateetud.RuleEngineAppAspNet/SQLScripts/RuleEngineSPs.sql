 create PROCEDURE [dbo].[proc_RuleEngine_LoadByRuleMastID]    
 (    
 @RuleMastID Bigint  
 )    
      
AS    
   
declare @RuleDescID varchar(2048)

Select @RuleDescID=ruledescid from dbo.RuleEngineDetails where RuleMastID = @RuleMastID 

select item as RuleDescID from dbo.fnSplit( @RuleDescID  , ',')
     
RETURN       