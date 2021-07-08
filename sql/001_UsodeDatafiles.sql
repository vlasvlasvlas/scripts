/***********************************************************************************
Script File: Ref_Cur_File_Size_Base_SS-2000_WIP.sql
Author Hank Freeman 
Date Created 31-Aug-2009
*************************************************************************************			
Modified Date:    Modified by:		Modification:
31-Aug-2009       H_freeman       Created
30-Sep-2009       H_freeman       Updated       Added PCT fields
20-Jan-2010       H_freeman       Fix Group calculations pct
08-FeB-2010       H_freeman       Fix the @version to properly figure out the SS Product Version
22-Mar-2010       h_freeman       Added Servername and System_DTE (Because all System dates may not be Calendar date)
20-Jun-2012       h_freeman       created select for logfiles AND added code to selects for comma formatted numbers 
                                  see @comma bit below (optional) http://www.sqlmag.com/forums/aft/82731
‘*****************************************************’
Validated by H_freeman
‘*************************************************************’			
*/
begin
DECLARE @err int
, @SQL_String1 nvarchar(2000)
, @SQL_String2 nvarchar(2000)
, @hf_var1 varchar(250)
, @version varchar(250)
, @position int
, @commas bit 
set @commas = 1 --- number set = 1 fro commas 
set @version = (select @@version)
set @position = (select charindex('200',@version)) 
--select @position
set @version = rtrim(substring(@@VERSION,@position,4))
--select @version as '@version'
/***
xp_msver productversion
SELECT @@SERVERNAME as '@@SERVERNAME',  --- This value sometimes will not work SOOO use the next 
SERVERPROPERTY('servername') as 'servername',
SERVERPROPERTY('productversion') as 'productversion', 
SERVERPROPERTY ('productlevel') as 'productlevel', 
SERVERPROPERTY ('edition') as 'edition'
***/
end
/** Script how to drop a Temp Table ***/
--if exists(select 1 from tempdb..sysobjects so with (nolock) where [name] like '#file_size%')
if exists(select 1 from tempdb..sysobjects so with (nolock) where [name] like '#file_size%')
begin
	drop table #file_size
end
create table [#file_size]
(
  [database_name] [sysname] NULL, 
  [groupid] [smallint] NULL, 
  [groupname] sysname NULL, 
  [fileid] [smallint] NULL, 
  [file_size] [decimal](12, 2) NULL, 
  [space_used] [decimal](12, 2) NULL, 
  [free_space] [decimal](12, 2) NULL, 
  [pct_used] [decimal] (12, 2) NULL, 
  [pct_free_space] [decimal] (12, 2) NULL, 
  [name] [sysname] NOT NULL, 
  [filename] [nvarchar](260) NOT NULL 
); 
--
set @SQL_String2 = ' insert into [#file_size] 
 SELECT 
  DB_NAME() as ''Use_Name''
  ,sysfilegroups.groupid 
  ,sysfilegroups.groupname 
  ,fileid 
  ,convert(decimal(12,2),round(sysfiles.size/128.000,2)) as file_size 
  ,convert(decimal(12,2),round(fileproperty(sysfiles.name,''SpaceUsed'')/128.000,2)) as space_used 
  , convert(decimal(12,2),round((sysfiles.size-fileproperty(sysfiles.name,''SpaceUsed''))/128.000,2)) as free_space 
  ,(convert(decimal(12,2),round(fileproperty(sysfiles.name,''SpaceUsed'')/128.000,2))/ convert(decimal(12,2),round(sysfiles.size/128.000,2))) as pct_used
  ,(convert(decimal(12,2),round((sysfiles.size-fileproperty(sysfiles.name,''SpaceUsed''))/128.000,2)) / convert(decimal(12,2),round(sysfiles.size/128.000,2))  ) as pct_free_space
  ,sysfiles.name 
  ,sysfiles.filename 
  FROM dbo.sysfiles sysfiles
  LEFT OUTER JOIN dbo.sysfilegroups sysfilegroups
  ON sysfiles.groupid = sysfilegroups.groupid;'
/*****/
begin
if @version = '2000' 
begin  --- This is sql server 2000
  Print 'SQL Server 2000 system'
    declare hf_cursor Cursor for 
      (  
      SELECT  name from master.dbo.sysdatabases 
      -- SELECT  * from master.dbo.sysdatabases
      
      )
 end
else  
-- SS 2005 OR 2008 AND AABOVE
begin
    Print 'SQL Server 2005 / 2008 system'
    declare hf_cursor Cursor for 
      (  
        SELECT  name  FROM sys.databases 
        --select * from sys.databases 
        WHERE STATE = 0  
        and name != 'model'
        -- STATUS 6 = off-line
      -- NON SS2000 systems
 )
end
Open_Cursor:
   Open hf_cursor
  fetch next from hf_cursor into @hf_var1
while (@@fetch_Status <> -1)
 if ((@@FETCH_STATUS) <> -2)
  Begin
    if ((@@FETCH_STATUS) <> -2) 
    Set @SQL_String1 = 'USE [' + @hf_var1 + ']'
    set @SQL_String1 = @SQL_String1 + @SQL_String2
    EXEC sp_executesql @SQL_String1
/********/
    fetch next from hf_cursor into @hf_var1
/********/
  end
--File Sizes 
--select * from [#file_size]
begin --File Sizes 
-- declare @commas bit set @commas = 1
  SELECT 
     @@SERVERNAME as 'ServerName'
    , database_name, groupid
    , ISNULL(groupname,'TLOG') groupname
    , fileid
    , Rtrim(name) 'Name'
    , Case when 
          @Commas = 1  then REPLACE(CONVERT(varchar(20), CAST( round(file_size,0) AS money), 1), '.00', SPACE(0))   
          else  cast(file_size as varchar(15))  end as 'FileSize(mb)'
    , Case when 
          @Commas = 1  then REPLACE(CONVERT(varchar(20), CAST( round(space_used,0) AS money), 1), '.00', SPACE(0)) 
          else  cast(space_used as varchar(15))  end as  'SpaceUsed(mb)' 
    , Case when 
          @Commas = 1  then REPLACE(CONVERT(varchar(20), CAST( round(free_space,0) AS money), 1), '.00', SPACE(0)) 
          else  cast(free_space as varchar(15))  end as  'FreeSpace(mb)'
    , REPLACE(CONVERT(varchar(20), CAST((pct_used * 100)      AS money), 1), '.00', SPACE(0)) as 'PCT_Used'
    , REPLACE(CONVERT(varchar(20), CAST((pct_free_space *100) AS money), 1), '.00', SPACE(0)) as 'PCT_Free'
    , Rtrim(filename) as 'Disk Location and Filename'
    , getdate()  as 'System_DTE'
    FROM [#file_size]
    order by database_name asc, groupid asc, groupname asc
end
--File Group Sizes 
begin
  SELECT 
	 @@SERVERNAME as 'ServerName'
	,database_name, groupid
    , ISNULL(groupname,'TLOG') groupname
    , Rtrim(name) 'Name'
    , Case when 
          @Commas = 1  then REPLACE(CONVERT(varchar(20), CAST( round(sum(file_size),0) AS money), 1), '.00', SPACE(0))   
          else  cast(sum(file_size) as varchar(15))   end as 'FileSize(mb)'
    , Case when 
          @Commas = 1  then REPLACE(CONVERT(varchar(20), CAST( round(sum(space_used),0) AS money), 1), '.00', SPACE(0)) 
          else  cast(sum(space_used) as varchar(15))  end as  'SpaceUsed(mb)' 
    , Case when 
          @Commas = 1  then REPLACE(CONVERT(varchar(20), CAST( round(sum(free_space),0) AS money), 1), '.00', SPACE(0)) 
          else  cast(sum(free_space) as varchar(15))  end as  'FreeSpace(mb)'
    , REPLACE(CONVERT(varchar(20), CAST((pct_used * 100)      AS money), 1), '.00', SPACE(0)) as 'PCT_Used'
    , REPLACE(CONVERT(varchar(20), CAST((pct_free_space *100) AS money), 1), '.00', SPACE(0)) as 'PCT_Free'
    , Rtrim(filename) as 'Disk Location and Filename'
    , getdate()  as 'System_DTE'
  FROM [#file_size] 
  GROUP BY database_name, groupid, groupname, filename, name, pct_used,pct_free_space
  order by database_name asc, groupid asc, groupname asc
end
  close hf_cursor
  deallocate hf_Cursor
 -- drop table [#file_size]
end
begin --File Sizes 
  SELECT -- logfile sizes
       @@SERVERNAME as 'ServerName'
    , database_name, groupid
    , ISNULL(groupname,'TLOG') groupname
    , fileid, Rtrim(name) 'Name'
    , Case when 
          @Commas = 1  then REPLACE(CONVERT(varchar(20), CAST( round(file_size,0) AS money), 1), '.00', SPACE(0))   
          else  cast(file_size as varchar(15))  end as 'FileSize(mb)'
    , Case when 
          @Commas = 1  then REPLACE(CONVERT(varchar(20), CAST( round(space_used,0) AS money), 1), '.00', SPACE(0)) 
          else  cast(space_used as varchar(15))  end as  'SpaceUsed(mb)' 
    , Case when 
          @Commas = 1  then REPLACE(CONVERT(varchar(20), CAST( round(free_space,0) AS money), 1), '.00', SPACE(0)) 
          else  cast(free_space as varchar(15))  end as  'FreeSpace(mb)'
    , REPLACE(CONVERT(varchar(20), CAST((pct_used * 100)      AS money), 1), '.00', SPACE(0)) as 'PCT_Used'
    , REPLACE(CONVERT(varchar(20), CAST((pct_free_space *100) AS money), 1), '.00', SPACE(0)) as 'PCT_Free'
    , Rtrim(filename) as 'Disk Location and Filename'
    , getdate()  as 'System_DTE'
    FROM [#file_size]
    where groupname is null
    order by database_name asc, groupid asc, groupname asc
end
