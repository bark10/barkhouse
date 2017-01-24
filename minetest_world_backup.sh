#!/bin/bash
# Script to back up minetestworlds

USER="bark"

LOGFILE="/home/$USER/minetest.log"
MTFOLDER="/home/$USER/.minetest"
ARCHIVE="/home/$USER/.minetest/archive"
BACKUP_TARGET="/home/$USER/.minetest/backup"
WORLD="/home/$USER/.minetest/worlds/melke3"
WORLD_DIR="/home/$USER/.minetest/worlds"
MODS="/home/$USER/.minetest/mods"
CONF="/home/$USER/.minetest/minetest.conf"

# Stop server
systemctl stop minetest-server
echo "Stopped the minetest server"


# Check if backup target folder exists
if [ -d $BACKUP_TARGET ]; then
	echo "$BACKUP_TARGET exists."; sleep 1
else
	mkdir $BACKUP_TARGET
	echo "Created folder $BACKUP_TARGET"; sleep 1
fi

# Backup everything to $BACKUP_TARGET
rsync -arv --delete $WORLD $MODS $CONF $BACKUP_TARGET
echo "\"$WORLD\" was backed up successfully to \"$BACKUP_TARGET\"."; sleep 1

# Move big files back
#mv $WORLD_DIR/rollback.sqlite $WORLD
#echo "Moved big files back"
#sleep 1

# Define timestamp function
timestamp() {
  date +"%Y-%m-%d" 
}

# Archive the log file for the day
cp $LOGFILE $MTFOLDER/logs/`timestamp`.log
rm $LOGFILE
# Clean log folder - delete oldest.
keep=7 # Set this to how many files want to keep
cd $MTFOLDER/logs
discard=$(expr $keep - $(ls|wc -l))
if [ $discard -lt 0 ]; then
	ls -Bt|tail $discard|tr '\n' '\0'|xargs -0 printf "%b\0"|xargs -0 rm --
fi

# Start server again
systemctl start minetest-server
echo "Stopped the minetest server"

# Check if archive folder exists
if [ -d $ARCHIVE ]; then
	echo "$ARCHIVE exists."; sleep 1
else
	mkdir $ARCHIVE
	echo "Created folder $ARCHIVE"; sleep 1
fi



# Compress and MTFOLDER the backup instance.
echo "Compressing and archiving backup instance to:"
echo "$ARCHIVE/`timestamp`_barkhouse.tar.gz"; sleep 1
tar czvf $ARCHIVE/`timestamp`_barkhouse.tar.gz $BACKUP_TARGET

# Update and Clean archive folder - delete oldest.
keep=7 # Set this to how many files want to keep
cd $ARCHIVE
discard=$(expr $keep - $(ls|wc -l))
if [ $discard -lt 0 ]; then
	ls -Bt|tail $discard|tr '\n' '\0'|xargs -0 printf "%b\0"|xargs -0 rm --
fi

# Send compressed backup MTFOLDER to another server
#scp $MTFOLDER/`timestamp`_barkhouse.tar.gz host@hostname:minetest_backups/

