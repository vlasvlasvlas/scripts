/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
CAST(TimeStart AS DATE)TimeStart
	,[ItemPath]
      ,[Format]
	  ,[Status]     
      ,AVG([TimeDataRetrieval])[TimeDataRetrieval_ms]
      ,AVG([TimeProcessing])[TimeProcessing_ms]
      ,AVG([TimeRendering])[TimeRendering_ms]
      ,AVG([RowCount])[RowCount]
	  ,count(*) NroEjecuciones
  FROM [ReportServer].[dbo].[ExecutionLog3]
--  WHERE CAST(TimeStart AS DATE)='20200426'
  GROUP BY CAST(TimeStart AS DATE)
	,[ItemPath]
      ,[Format]
	  ,[Status]     
  ORDER BY [ItemPath],TimeStart DESC