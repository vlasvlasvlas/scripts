/*WAITING TASKS ordered by session_id 
*******************************************************************/ 
select getdate(),dm_ws.session_id, wait_duration_ms, dm_ws.wait_type,dm_ws.blocking_session_id
,status,command, db_name(database_id) as base,convert(varchar(8000),[text]) consulta
from sys.dm_os_waiting_tasks as dm_ws
inner join sys.dm_exec_requests as dm_der
on dm_ws.session_id=dm_der.session_id
cross apply sys.dm_exec_sql_text (dm_der.[sql_handle]) as dmf
where dm_der.[sql_handle] is not null
