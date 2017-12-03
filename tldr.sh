#!/bin/bash

CFG=~/.tldr.cfg
CMD=$1

function errquit() {
	echo $1 && exit 1
}

function edit() {
	vim "$DATADIR"/"$CMD"
	exit 0
}

# source config
[ ! -f $CFG ] && errquit 'Error: config file missing';
source $CFG

# datadir must be set
[ -z "$DATADIR" ] && errquit 'Error: $DATADIR not set';

# check flags
while getopts ":a:e:" opt; do
  case $opt in
  	a)
			CMD=$OPTARG && edit ;;
  	e)
			CMD=$OPTARG && edit ;;
  esac
done

# no flags passed so lookup file
FILE="$DATADIR"/"$CMD"
[ ! -f $FILE ] && errquit "Error: no such file";
less $FILE
