#!/bin/bash
. /srv/restic-repo/scripts/unlock.sh "$1"

declare -n REPO=${1}_REPOSITORY_FILE
declare -n PASS=${1}_PASSWORD_FILE

echo "-"
echo "-"
echo "Running scheduled backup ($(date))..."
echo "---------------------------"


restic --repository-file=$REPO --password-file=$PASS backup --tag main --exclude-file=$RESTIC_EXCLUDE_FILE_PATH --files-from=$RESTIC_INCLUDE_FILE_PATH

echo ""
echo "Finished scheduled backup $(date)"
echo "---------------------------"