
SELECT a.name AS users , c.name AS rol , 'ALTER ROLE ['+C.NAME+ '] ADD MEMBER ['+A.NAME+']' AS script
FROM sys.sysusers a
INNER JOIN sys.database_role_members b
ON a.uid=b.member_principal_id
INNER JOIN sys.sysusers c
ON b.role_principal_id=c.uid
WHERE a.uid <>1 
AND a.status=12
http://msdn.microsoft.com/en-us/library/ms189775.aspx

EXEC sp_addrolemember 'Production', 'Mary5';

SELECT a.name AS users , c.name AS rol 
, 'sp_addrolemember '+CHAR(39)+C.NAME+CHAR(39)+ ','+CHAR(39)+A.NAME+CHAR(39)+';' AS script
FROM sys.sysusers a
INNER JOIN sys.database_role_members b
ON a.uid=b.member_principal_id
INNER JOIN sys.sysusers c
ON b.role_principal_id=c.uid
WHERE a.uid <>1 
AND a.status=12

http://msdn.microsoft.com/en-us/library/ms187750.aspx