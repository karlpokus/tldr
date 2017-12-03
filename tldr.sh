#!/bin/bash

CFG=~/.tldr.cfg
CMD=$1

function errquit() {
	echo $1
	exit 1
}

function editfile() {
	vim $1
	exit 0
}

function readfile() {
	less $1
	exit 0
}

# source config
[ ! -f $CFG ] && errquit 'Error: config file missing';
source $CFG

# datadir must be set
[ -z "$DATADIR" ] && errquit 'Error: $DATADIR not set';

# check flags
while getopts ":e:" opt; do
  case $opt in
  	e)
			CMD=$OPTARG
			editfile "$DATADIR"/"$CMD"
			;;
  esac
done

# no flags set - lookup file
FILE="$DATADIR"/"$CMD"

if [ ! -f $FILE ]; then
	read -p "Sorry. No such file. Would you like to create it? [y/n] " CREATE
	[ $CREATE = "y" ] && editfile $FILE
	exit 0
else
	readfile $FILE
fi
