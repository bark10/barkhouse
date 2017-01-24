#!/bin/bash
# Bash script to archive player files older than x days, 
# compress them and then delete them.

# SETTINGS
#############
world="melke3"
player_files_folder=".minetest/worlds/$world/players"
days="90"

#############
# SCRIPT
cd

echo "Number of player files older than $days days:"
find $player_files_folder -mtime +$days | wc -l

echo "Archiving player files older than $days days into old_players.tar"
find $player_files_folder -mtime +$days -print0 | tar rf $player_files_folder/old_players.tar --null -T -

echo "Deleting player files older than $days days."
find $player_files_folder -mtime +$days -print0 -delete

echo "Total number of files present in old_players.tar"
tar tf $player_files_folder/old_players.tar | wc -l

touch $player_files_folder/old_players.tar
