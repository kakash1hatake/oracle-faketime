# oracle-faketime
Tricks with libfaketime in Oracle.
Change time in whole database instance or single session/process.
Useful for code testing.

# Prerequisites
1. Access to Oracle server with ssh and rights to become oracle user.
2. Faketime installed somewhere on your Oracle server.
3. Gcc and c/cpp header files
4. sys access to the Oracle instance

# Fake the whole instance
Use script in FakeInstance/ folder. Restart instance with the desired time shift.
Connect to the database and see current date-time in the session.

# Fake only one process/session in database
Use scripts in FakeProcess/ folder.
First compile the shared library using make.sh script and copy the library into $ORACLE_HOME/lib/ folder.
Then compile database objects and setup java grants:
1. run compile.sql with sqlplus
2. run java_grants.sql with sqlplus from sys

While performing the grant the error should occur:
```
ORA-29532: Java call terminated by uncaught Java exception: java.lang.SecurityException: policy table update
```
To solve this problem consult Note 259471.1 on My Oracle Support.
After you setup the code, startup the instance with libfaketime preloaded and set the time shift as "+0d".
When you connect to the database, check the current time inside the session, it should be normal.
Then execute the code and see the effect of changing time:
```
begin
dbms_output.enable(100000);
dbms_java.set_output(100000);
system.posix.set_env('FAKETIME','+1d');
dbms_output.put_line('new time: '||to_char(sysdate, 'dd.mm.yyyy hh24:mi:ss'));
end;
/
```
If you use dedicated sessions to connect to the database, the "butterfly effect" will not persist when reconnecting.
But if you use shared sessions, the environment variables inside server process persist among incoming sessions, so when a new session connects to the database and get into the same server process the time will be already changed. And to remove the time shift set the variable to "+0d" before disconnecting.