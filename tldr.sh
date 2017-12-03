#!/bin/bash

CFG=~/.tldr.cfg

function errquit() {
	echo $1 && exit 1
}

# source config
[ ! -f $CFG ] && errquit 'Error: config file missing';
source $CFG

# datadir must be set
[ -z "$DATADIR" ] && errquit 'Error: $DATADIR not set';
FILE=$DATADIR/$1

# lookup file
[ ! -f $FILE ] && errquit "Error: no such file";
less $FILE
