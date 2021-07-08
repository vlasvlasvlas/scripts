/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [date]
      ,cast(left([time],2) as int) as hora
	  ,cast((cast(substring([time],4,2) as float)/10.0) as int)*10 as minuto
	  ,[time]
      ,[s-ip]
      ,[cs-method]
      ,[cs-uri-stem]
      ,[cs-uri-query]
      ,[s-port]
      ,[cs-username]
      ,[c-ip]
      ,[cs(User-Agent)]
      ,[cs(Referer)]
      ,[sc-status]
      ,[sc-substatus]
      ,[sc-win32-status]
      ,[time-taken]
  FROM [DBMonitor].[dbo].[iisBody]
  where [cs-uri-stem] like '%.aspx'
  and [c-ip]='34.70.146.135'



SELECT 	cast(left([time],2) as int) as hora
	  ,cast((cast(substring([time],4,2) as float)/10.0) as int)*10 as minuto
	,[cs-uri-stem]
	--	,[c-ip]
	  ,[sc-status]
      ,[sc-substatus]
      ,[sc-win32-status]
      ,avg([time-taken]) timeresponse
	  ,count(*) nrorequest
  FROM [DBMonitor].[dbo].[iisBody]
  where [cs-uri-stem] like '%.aspx'
  group by   	cast(left([time],2) as int) 
	  ,cast((cast(substring([time],4,2) as float)/10.0) as int)*10 
  ,[cs-uri-stem]
  --,[c-ip]
  ,[sc-status]
  ,[sc-substatus]
  ,[sc-win32-status]