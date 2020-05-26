-- connect any schema you want to hold the code, e.g. system
conn system

-- if schema owner is not "system" - change it here
alter session set current_schema=system;
@@Posix.sqlj
@@Posix.sql

-- if you want to use this systemwide without schema name(if the schema owner was not "system" - ajust it)
grant execute on system.posix to public;
create public synonym posix for system.posix;
