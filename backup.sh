#!/bin/bash
. /srv/restic-repo/scripts/local_unlock.sh

echo "-"
echo "-"
echo "Running scheduled backup ($(date))..."
echo "---------------------------"


restic --repository-file=$LOCAL_REPOSITORY_FILE --password-file=$LOCAL_PASSWORD_FILE backup --tag main --exclude-file=$RESTIC_EXCLUDE_FILE_PATH --files-from=$RESTIC_INCLUDE_FILE_PATH --dry-run

echo ""
echo "Finished scheduled backup $(date)"
echo "---------------------------"