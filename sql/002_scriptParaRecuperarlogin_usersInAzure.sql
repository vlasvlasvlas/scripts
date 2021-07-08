


SELECT * 
FROM sys.sql_logins 
WHERE type = 'S'; 



SELECT name, sid, principal_id
FROM sys.database_principals 
WHERE type = 'S' 
  AND name NOT IN ('guest', 'INFORMATION_SCHEMA', 'sys')
  AND authentication_type_desc = 'INSTANCE';


ALTER USER dnpmga WITH Login = dnpmga;  
ALTER USER dnpmga WITH Login =  dnpmga
ALTER USER consmga WITH Login = mgacons;
ALTER USER mgalinked WITH Login = mgalinked;
ALTER USER webmga WITH Login = webmga;
