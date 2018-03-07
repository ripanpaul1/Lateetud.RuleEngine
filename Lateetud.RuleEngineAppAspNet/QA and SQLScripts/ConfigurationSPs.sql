

Create PROCEDURE [dbo].[proc_Configuration_GetAll]
	
AS
select * from dbo.Configuration
RETURN
go


CREATE PROCEDURE [dbo].[proc_Configuration_Update]
	(
	@ID	bigint,
@ConfigurationValue nvarchar(4000),
@ModifiedDate datetime

	)
AS	
	UPDATE [dbo].[Configuration]
   SET [ConfigurationValue] = @ConfigurationValue,
   ModifiedDate=@ModifiedDate
      
 WHERE ID=@ID

	RETURN
	
	go
--------------------------------------------------


 Create PROCEDURE [dbo].[proc_Configuration_LoadByKey]  
 (  
 @ConfigurationKey varchar(50)  
 )  
    
AS  
 Select * from configuration where ConfigurationKey = @ConfigurationKey  
   
 RETURN  
  