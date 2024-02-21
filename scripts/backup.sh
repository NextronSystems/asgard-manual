#!/bin/bash
BACKUPDIR="/var/lib/asgard-management-center/backups"
NEWDIR="/home/nextron/backups"
date

echo "checking for destination folder"
if ! [ -d "$NEWDIR" ]; then
   mkdir $NEWDIR
   chown -R nextron: $NEWDIR
fi

echo "stopping asgard-management-center.service"
if ! systemctl stop asgard-management-center.service; then
   echo "could not stop asgard-management-center.service, exiting script"
   exit 1
fi

sleep 3
echo "running backup script"
/usr/share/asgard-management-center/scripts/backup.sh

sleep 3
echo "starting asgard-management-center.service"
if ! systemctl start asgard-management-center.service; then
   echo "could not start asgard-management-center.service, needs manual debugging"
   exit 1
fi

echo "moving backup files to destination"
mv $BACKUPDIR/*.tar $NEWDIR
chown -R nextron: $NEWDIR

echo "backup created successfully"
echo ""
echo ""
exit 0