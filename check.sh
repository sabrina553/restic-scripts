#!/bin/bash

# make Go garbage collector very aggresive in order to try to prevent out of memory issues
export GOGC=20

# run unlock script first (includes setting env vars)
. /srv/restic-repo/scripts/local_unlock.sh

echo "-"
echo "-"
echo "Checking backup ($(date))..."
echo "---------------------------"

restic --repository-file=$LOCAL_REPOSITORY_FILE --password-file=$LOCAL_PASSWORD_FILE check --cache-dir "${RESTIC_CACHE_DIR}" --cleanup-cache

echo ""
echo "Finished checking backup $(date)"
echo "---------------------------"
df -h