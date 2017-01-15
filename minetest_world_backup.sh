#!/bin/bash
# Script to back up minetestworlds



ARCHIVE="/home/$USER/.minetest/"
BACKUP_TARGET="/home/$USER/.minetest/backup"
WORLD="/home/$USER/.minetest/worlds/test"
WORLD_DIR="/home/$USER/.minetest/worlds"
MODS="/home/$USER/.minetest/mods"
CONF="/home/$USER/.minetest/minetest.conf"

# Stop server
# <code missing>

# Move big files out of the way
mv $WORLD/rollback.sqlite $WORLD_DIR
echo "Moved some big files out of the way"
sleep 1

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
mv $WORLD_DIR/rollback.sqlite $WORLD
echo "Moved big files back"
sleep 1

# Start server again
# <code missing>

# Compress and archive the backup instance.
timestamp() {
  date +"%Y-%m-%d" 
}

echo "Compressing and archiving backup instance to:"
echo "$ARCHIVE/`timestamp`_barkhouse.tar.gz"; sleep 1

tar czvf $ARCHIVE/`timestamp`_barkhouse.tar.gz $BACKUP_TARGET

# Send compressed backup archive to another server
#scp $ARCHIVE/`timestamp`_barkhouse.tar.gz host@hostname:minetest_backups/

