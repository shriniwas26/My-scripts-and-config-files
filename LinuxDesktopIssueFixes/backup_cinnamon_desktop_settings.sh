#!/bin/bash
# Backup all Cinnamon DE Related settings
# Run periodically via cron
BACKUP_FOLDER="/media/shriniwas/MyData/SURFdrive/Backups/Cinnamon_Desktop_Settings/$(date +"%Y_%m")"
mkdir -p "$BACKUP_FOLDER"
ROTATE_DAYS=20

zip -rv "$BACKUP_FOLDER/linux_mint_config_$(date +"%Y_%m_%d_%H%M").zip" ~/.bashrc ~/.bash_it ~/.atom/*.cson ~/.config ~/.cinnamon ~/.gconf ~/.icons ~/.themes -x \*.git* \*libreoffice* \*spotify* \*chromium* \*google-chrome* \*Virtualbox* \*Cache* \*IndexedDB*
FILE_COUNT=$(find "$BACKUP_FOLDER" -maxdepth 1 -type f | wc -l)
echo "Backup Folder has $FILE_COUNT backups, removing backups older than $ROTATE_DAYS days"
find "$BACKUP_FOLDER" -mtime +$ROTATE_DAYS -exec rm {} \;
