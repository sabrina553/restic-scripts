#!/bin/bash

# run unlock script first (includes setting env vars)
. /srv/restic-repo/scripts/sapphire_unlock.sh

echo "-"
echo "-"
echo "Policy: --keep-daily 30 --keep-weekly 8 --keep-monthly 12 --keep-yearly 100 --keep-last 4"
echo "Forgetting and pruning sapphire's snapshots according to retention policy ($(date))..."
echo "---------------------------"
## taggssss
restic --repository-file=$SAPPHIRE_REPOSITORY_FILE --password-file=$SAPPHIRE_PASSWORD_FILE forget --keep-tag immich --keep-daily 30 --keep-weekly 8 --keep-monthly 12 --keep-yearly 100 --keep-last 4 --prune
restic --repository-file=$SAPPHIRE_REPOSITORY_FILE --password-file=$SAPPHIRE_PASSWORD_FILE forget --keep-tag main --keep-daily 30 --keep-weekly 8 --keep-monthly 12 --keep-yearly 100 --keep-last 4 --prune

echo ""
echo "Finished forget and prune $(date)"
echo "---------------------------"
