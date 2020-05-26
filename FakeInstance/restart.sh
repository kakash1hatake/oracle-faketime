#!/bin/sh

export FAKETIME="+1d"
export FAKETIME_NO_CACHE=1

# set correct path in your system
export LD_PRELOAD=/usr/local/lib/faketime/libfaketime.so

# then run sqlplus, connect as sys and (re)start the instance
$ORACLE_HOME/bin/sqlplus /nolog