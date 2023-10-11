#!/bin/bash
BACKUPDIR="/var/lib/nextron/asgard2/backups"
NEWDIR="/home/nextron/backups"
date

echo "checking for destination folder"
if ! [ -d "$NEWDIR" ]; then
   mkdir $NEWDIR
   chown -R nextron: $NEWDIR
fi

echo "stopping asgard2.service"
if ! systemctl stop asgard2.service; then
   echo "could not stop asgard2.service, exiting script"
   exit 1
fi

sleep 3
echo "running backup script"
/usr/sbin/asgard2-backup

sleep 3
echo "starting asgard2.service"
if ! systemctl start asgard2.service; then
   echo "could not start asgard2.service, needs manual debugging"
   exit 1
fi

echo "moving backup files to destination"
mv $BACKUPDIR/*.tar $NEWDIR
chown -R nextron: $NEWDIR

echo "backup created successfully"
echo ""
echo ""
exit 0