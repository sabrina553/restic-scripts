#!/bin/bash

# make Go garbage collector very aggresive in order to try to prevent out of memory issues
export GOGC=20

# run unlock script first (includes setting env vars)
. /srv/restic-repo/scripts/rpi_unlock.sh

echo "-"
echo "-"
echo "Checking rpi backup's ($(date))..."
echo "---------------------------"

restic --repository-file=$RPI_REPOSITORY_FILE --password-file=$RPI_PASSWORD_FILE check --cache-dir "${RESTIC_CACHE_DIR}" --cleanup-cache

echo ""
echo "Finished rpi checking backup's $(date)"
echo "---------------------------"