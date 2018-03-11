#!/bin/bash
# Backup all Cinnamon DE Related settings
# Run periodically via cron
FOLDER="/media/shriniwas/MyData/SURFdrive/Backups/Cinnamon_Desktop_Settings/$(date +"%Y_%m")"
mkdir -p $FOLDER
ROTATE_DAYS=20
zip -rv "$FOLDER/linux_mint_config_$(date +"%Y_%m_%d").zip" ~/.config ~/.cinnamon ~/.gconf ~/.icons ~/.local ~/.themes -x \*google-chrome* \*Virtualbox*
FILE_COUNT=`find $FOLDER -maxdepth 1 -type f | wc -l`
echo "Backup Folder has $FILE_COUNT backups, removing backups older than $ROTATE_DAYS days"
find $FOLDER -mtime +$ROTATE_DAYS -exec rm {} \;
