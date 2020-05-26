create or replace package posix as

-- load so library from disk into current oracle process
procedure load_library(lib_name varchar2);

-- set environment variable in current oracle process
procedure set_env(var_name varchar2, var_value varchar2);

-- get environment variable value
function get_env(var_name varchar2) return varchar2;

end posix;
/

CREATE OR REPLACE package body posix as

-- load so library into current oracle process
procedure load_library(lib_name varchar2)
is
language java name 'Posix.load_library(java.lang.String)';

-- set environment variable in current oracle process
procedure set_env(var_name varchar2, var_value varchar2)
is
language java name 'Posix.set_env(java.lang.String, java.lang.String)';

-- get environment variable value
function get_env(var_name varchar2)
return varchar2
is
language java name 'Posix.get_env(java.lang.String) return java.lang.String';

end posix;
/