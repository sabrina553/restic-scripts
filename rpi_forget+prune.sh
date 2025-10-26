#!/bin/bash

# run unlock script first (includes setting env vars)
. /srv/restic-repo/scripts/rpi_unlock.sh

echo "-"
echo "-"
echo "Policy: --keep-daily 30 --keep-weekly 8 --keep-monthly 12 --keep-yearly 100 --keep-last 4"
echo "Forgetting and pruning RPI snapshots according to retention policy ($(date))..."
echo "---------------------------"

restic --repository-file=$RPI_REPOSITORY_FILE --password-file=$RPI_PASSWORD_FILE forget --keep-daily 30 --keep-weekly 8 --keep-monthly 12 --keep-yearly 100 --keep-last 4 --prune

echo ""
echo "Finished forget and prune $(date)"
echo "---------------------------"
