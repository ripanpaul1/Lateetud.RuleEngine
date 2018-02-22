SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[proc_ServiceHistory_GetAll]    
     
AS    
Select * from dbo.ServiceHistory order by runtime desc
 RETURN    
