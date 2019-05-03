#!/bin/sh
#
# This script can perform INSERT, UPDATE, DELETE operations on DB_FILENAME
# This can be used by backend binaries like smm, httpd to perform database operations
#
# Usage: ./dbquery add <table name> [<columns seperated with ,>] <values seperated with ,>
#		 ./dbquery edit <table name> <col1=val1, col2=val2> <col3=val3>
#		 ./dbquery delete <table name> <col3=val3>
#
# Note: In any of the above queries, if a value is string, it should be passed in single quotations
# example: dbquery.sh delete SSLVPNActiveUsers "UserName = 'u1'" is correct and
# 		   dbquery.sh delete SSLVPNActiveUsers "UserName = u1" is incorrect
#
# Modification History
#----------------------
# 01a 20sep10 bhj, created dbquery.sh

# File paths
SQLITE_INSTALL_PATH="/pfrm2.0"
DB_FILENAME="/tmp/system.db"

# Error messages
SUCCESS=0
UNKNOWN_OPERATION=1
INSUFFICIENT_PARAMETERS=2

# Building SQL query
if [ "$1" = "" ] || [ "$2" = "" ]
then
	exit $INSUFFICIENT_PARAMETERS
fi
operation=$1
table=$2

case $operation in
	"add") 
		if [ "$3" = "" ]
		then
			exit $INSUFFICIENT_PARAMETERS
		fi

		if [ "$4" = "" ]
		then
			values=$3
			query="INSERT INTO $table VALUES ($values)"
		else
			columns=$3
			values=$4
			query="INSERT INTO $table ($columns) VALUES ($values)"
		fi
	;;
	"edit") 
		if [ "$3" = "" ] || [ "$4" = ""]
		then
			exit $INSUFFICIENT_PARAMETERS
		fi
		set_clause=$3
		where_clause=$4
		query="UPDATE $table SET $set_clause WHERE $where_clause"
	;;
	"del") 
		if [ "$3" = "" ]
		then
			exit $INSUFFICIENT_PARAMETERS
		fi
		where_clause=$3
		query="DELETE FROM $table WHERE $where_clause"
	;;
	*) 
		exit $UNKNOWN_OPERATION
	;;
esac

# Executing SQL query
$SQLITE_INSTALL_PATH/bin/sqlite3 $DB_FILENAME << SQL_ENTR_TAG_1;
.timeout 1000;
BEGIN;
$query;
COMMIT;
SQL_ENTR_TAG_1

exit $SUCCESS
