#!/bin/sh

# be sure that ORACLE_HOME exists in your environment
export JAVA_HOME=$ORACLE_HOME/jdk
export PATH="$ORACLE_HOME/jdk/bin:$PATH"

# first compile class
javac Posix.java

# then get jni Posix.h header file
javah Posix

# then write code in Posix.c

# then compile shared library
gcc -I"$JAVA_HOME/include" -I"$JAVA_HOME/include/linux" -fPIC Posix.c -shared -o libPosix.so -Wl,-soname -Wl,--no-whole-archive

# and strip it
strip libPosix.so

# copy library to the ORACLE_HOME
cp libPosix.so $ORACLE_HOME/lib/