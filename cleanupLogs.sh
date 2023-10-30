#! /bin/bash

ROOT_UID=0
E_ROOT_ACCESS=50
E_XDIR=40
LINES=10

echo "Enter directory of log files"
read LOG_FILE_DIR
echo "Enter log file name" 
read LOG_FILE_NAME
echo "Log file name $LOG_FILE_NAME dir name $LOG_FILE_DIR"

if [[ "$UID" != "$ROOT_UID" ]]
then
  echo "You need root access to run this file"
  exit "$E_ROOT_ACCESS"
fi

cd "$LOG_FILE_DIR" 2> /dev/null

if [[ "$PWD" != "$LOG_FILE_DIR" ]]
then
  echo "Can not change directory"
  exit "$E_XDIR"
fi

BACKUP_FILE_NAME="$LOG_FILE_NAME"".tmp"
echo "creating backup file $BACKUP_FILE_NAME"
tail -n $LINES $LOG_FILE_NAME > $BACKUP_FILE_NAME
cat /dev/null > $LOG_FILE_NAME