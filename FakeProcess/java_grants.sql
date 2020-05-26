conn sys

begin
dbms_java.grant_permission( 'SYSTEM', 'SYS:java.lang.RuntimePermission', 'loadLibrary.Posix', '');
commit;
end;
/