#!/bin/bash

# run unlock script first (includes setting env vars)
. /srv/restic-repo/scripts/unlock.sh {$1}

declare -n REPO=${1}_REPOSITORY_FILE
declare -n PASS=${1}_PASSWORD_FILE
declare -n POLICY=${1}_REMOVE_POLICY

echo "-"
echo "-"
echo "Policy: --keep-daily 30 --keep-weekly 8 --keep-monthly 12 --keep-yearly 100 --keep-last 4"
echo "Forgetting and pruning sapphire's snapshots according to retention policy ($(date))..."
echo "---------------------------"
## taggssss

restic --repository-file=${REPO} --password-file=${PASS} forget --keep-tag {dddd} {$POLICY} --prune

echo ""
echo "Finished forget and prune $(date)"
echo "---------------------------"