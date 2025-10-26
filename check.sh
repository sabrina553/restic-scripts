#!/bin/bash
# make Go garbage collector very aggresive in order to try to prevent out of memory issues
export GOGC=20
# run unlock script first (includes setting env vars)
. /srv/restic-repo/scripts/unlock.sh "$1"

declare -n REPO=${1}_REPOSITORY_FILE
declare -n PASS=${1}_PASSWORD_FILE

echo ""
echo "Checking backup ($(date))..."
echo "---------------------------"

restic --repository-file="$REPO" --password-file="$PASS" check --cache-dir "$RESTIC_CACHE_DIR" --cleanup-cache

echo ""
echo "Finished checking backup $(date)"
echo "---------------------------"
