SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[proc_ServiceHistory_GetAll]    
     
AS    
Select * from dbo.ServiceHistory order by runtime desc
 RETURN    
 Go

 ------------------------------------------------------
 /****** Object:  StoredProcedure [dbo].[proc_ServiceHistory_GetStatusOfNRecords]    Script Date: 02/23/2018 14:22:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[proc_ServiceHistory_GetStatusOfNRecords]    
     
AS    
select top 1 * from ServiceHistory order by runtime desc
 RETURN    