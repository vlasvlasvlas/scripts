SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SELECT TOP 20
[Total IO] = (qs.total_logical_reads + qs.total_logical_writes)
, [Average IO] = (qs.total_logical_reads + qs.total_logical_writes) /
qs.execution_count
, qs.execution_count
, replace(replace(replace(SUBSTRING (qt.text,(qs.statement_start_offset/2) + 1,
((CASE WHEN qs.statement_end_offset = -1
		THEN LEN(CONVERT(NVARCHAR(MAX), qt.text)) * 2
		ELSE qs.statement_end_offset
		END - qs.statement_start_offset)/2) + 1) ,char(13),''),char(10),''),char(9),'')AS [Individual Query]
--, DB_NAME(qt.dbid) AS DatabaseName
--, qp.query_plan
FROM sys.dm_exec_query_stats qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) as qt
CROSS APPLY sys.dm_exec_query_plan(qs.plan_handle) qp
ORDER BY [Total IO] DESC