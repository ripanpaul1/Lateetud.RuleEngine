ALTER TABLE RuleDesc
ADD DocType varchar(8)

GO
ALTER TABLE RuleDesc
ALTER COLUMN OriginalDocumentName nvarchar(max)
go

ALTER TABLE RuleDesc
ALTER COLUMN ConvertedDocumentName nvarchar(max)
go
ALTER TABLE RuleDesc
ALTER COLUMN UploadedFile nvarchar(max)
go

alter PROCEDURE [dbo].[proc_RuleDesc_Update]  
(  
@ID bigint,  
@RuleMastID bigint,  
@RuleName varchar(512),  
@SplitAs varchar(50),  
@Dictionary varchar(50),  
@OriginalDocumentName nvarchar(max),  
@ConvertedDocumentName nvarchar(max),  
@EntryDate datetime,  
@ModifiedDate datetime,  
@IsActive bit,  
@NeighbourhoodCount int,  
@Expression1 nvarchar(50),  
@Expression2 nvarchar(50),  
@ContextWord nvarchar(1024),  
@Operator varchar(50),  
@FieldName nvarchar(2048),  
@FieldValue nvarchar(max),  
@UploadedFile nvarchar(max),  
@IsIgnoreKeyword bit  
,@FieldPosition varchar(50)  
,@IsCheckSynonyms bit  
,@Synonyms nvarchar(max)  
,@AllSynonyms nvarchar(max)  
,@ExpressionContext  varchar(50)  
,@DocType   varchar(8)
)  
AS   
UPDATE [dbo].[RuleDesc]  
   SET [RuleMastID] = @RuleMastID  
      ,[RuleName] = @RuleName  
      ,[SplitAs] = @SplitAs  
      ,[Dictionary] = @Dictionary  
      ,[OriginalDocumentName] = @OriginalDocumentName  
      ,[ConvertedDocumentName] = @ConvertedDocumentName  
      ,[EntryDate] = @EntryDate  
      ,[ModifiedDate] = @ModifiedDate  
      ,[IsActive] = @IsActive  
      ,[NeighbourhoodCount] = @NeighbourhoodCount  
      ,[Expression1] = @Expression1  
      ,[Expression2] = @Expression2  
      ,[ContextWord] = @ContextWord  
      ,[Operator] = @Operator  
      ,[FieldName]=@FieldName  
      ,[FieldValue]=@FieldValue  
      ,[UploadedFile]=@UploadedFile,  
   [IsIgnoreKeyword]=@IsIgnoreKeyword,  
   [FieldPosition]=@FieldPosition,  
   [IsCheckSynonyms]=@IsCheckSynonyms,  
   [Synonyms]=@Synonyms,  
   [AllSynonyms]=@AllSynonyms,  
   [ExpressionContext]=@ExpressionContext,
   DocType=@DocType  
 WHERE ID=@ID  
RETURN

go
alter PROCEDURE [dbo].[proc_RuleDesc_AddNew]        
@RuleMastID bigint,      
@RuleName varchar(512),      
@SplitAs varchar(50),      
@Dictionary varchar(50),      
@OriginalDocumentName nvarchar(max),      
@ConvertedDocumentName nvarchar(max),      
@EntryDate datetime,      
@ModifiedDate datetime,      
@IsActive bit,      
@NeighbourhoodCount int,      
@Expression1 nvarchar(1024),      
@Expression2 nvarchar(1024),      
@ContextWord nvarchar(1024),      
@Operator varchar(50),      
@FieldName nvarchar(2048),      
@FieldValue nvarchar(max),      
@UploadedFile nvarchar(max),    
@IsIgnoreKeyword bit    
,@FieldPosition varchar(50)    
,@IsCheckSynonyms bit    
,@Synonyms nvarchar(max)    
,@AllSynonyms nvarchar(max)    
,@ExpressionContext  varchar(50)  
,@DocType   varchar(8)  
AS        
BEGIN        
         
 SET NOCOUNT ON;        
        
INSERT INTO [dbo].[RuleDesc]      
           ([RuleMastID]      
           ,[RuleName]      
           ,[SplitAs]      
           ,[Dictionary]      
           ,[OriginalDocumentName]      
           ,[ConvertedDocumentName]      
           ,[EntryDate]      
           ,[ModifiedDate]      
           ,[IsActive]      
           ,[NeighbourhoodCount]      
           ,[Expression1]      
           ,[Expression2]      
           ,[ContextWord]      
           ,[Operator]      
           ,[FieldName]    
           ,[FieldValue]      
           ,[UploadedFile]    
           ,[IsIgnoreKeyword]    
           ,[FieldPosition]    
           ,[IsCheckSynonyms]    
           ,[Synonyms]    
   ,[AllSynonyms]    
           ,[ExpressionContext]  
           ,DocType)      
     VALUES      
           (@RuleMastID,      
@RuleName,      
@SplitAs,      
@Dictionary,      
@OriginalDocumentName,      
@ConvertedDocumentName,      
@EntryDate,      
@ModifiedDate,      
@IsActive,      
@NeighbourhoodCount,      
@Expression1,      
@Expression2,      
@ContextWord,      
@Operator,      
@FieldName,      
@FieldValue,      
@UploadedFile,    
@IsIgnoreKeyword    
,@FieldPosition    
,@IsCheckSynonyms    
,@Synonyms    
,@AllSynonyms    
,@ExpressionContext  
,@DocType     
)      
      
                 
  RETURN        
END
go