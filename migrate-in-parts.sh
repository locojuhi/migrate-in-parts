#!/bin/bash

#title           :mkscript.sh
#description     :This script will make a header for a bash script.
#author		 :bgw
#date            :20111101
#version         :0.1    
#usage		 :mkscript.sh
#notes           :Install mysql clients in order to use
#bash_version    :5.0.16(1)-release
#==============================================================================


while getopts :d:h:u:p: flag
do
	case "${flag}" in
		d) directory=${OPTARG};;
		h) databaseHost=${OPTARG};;
		u) databaseUser=${OPTARG};;
		p) databasePass=${OPTARG};;
		n) databaseName=${OPTARG};;
	esac
done

if [ -z "$directory" ] && [ -z "$databaseHost" ] && [ -z "$databaseUser" ] && [ -z "$databasePass" ] [ -z "$databaseName" ];
then
	echo "All params are needed"
	exit 0
fi
for filename in ${directory}/*.sql; do
	mysql -h ${databaseHost} -u ${databaseUser} -p${databasePass} --binary-mode=1 ${databaseName} < ${filename}
done
