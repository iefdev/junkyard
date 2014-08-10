#!/bin/bash
#
# ~/ShellScripts/fixPid.sh
#
# Description: Fix for mysqld.pid in: /var/run/mysqld/mysqld.pid
# 
#

# Fix missing directory
[ ! -d  /var/run/mysqld/ ] && sudo mkdir -p /var/run/mysqld;

# Fix missing pidfile + perms
if [ ! -f '/var/run/mysqld/mysqld.pid' ]; then
	sudo touch /var/run/mysqld/mysqld.pid;

	# OS X: mysql = _mysql
	sudo chown -R _mysql:_mysql /var/run/mysqld/
fi
