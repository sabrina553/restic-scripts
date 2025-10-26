#!/bin/bash
. /srv/restic-repo/scripts/unlock.sh "$1"

#read input variable for repo
declare -n REPO=${1}_REPOSITORY_FILE
declare -n PASS=${1}_PASSWORD_FILE
#read input variable for snapshot
declare -n EXCLUDE=${2}_EXCLUDE_FILE_PATH
declare -n INCLUDE=${2}_INCLUDE_FILE_PATH

#"Aesthetics"
echo "-"
echo "Running scheduled backup ($(date))..."
echo "---------------------------"


restic --repository-file="$REPO" --password-file="$PASS" backup --tag main --exclude-file="$EXCLUDE" --files-from="$INCLUDE" --dry-run

echo ""
echo "Finished scheduled backup $(date)"
echo "---------------------------"