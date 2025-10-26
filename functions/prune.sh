#!/bin/bash

# run unlock script first (includes setting env vars)
. functions/unlock.sh "$1"

declare -n REPO=${1}_REPOSITORY_FILE
declare -n PASS=${1}_PASSWORD_FILE
declare -n POLICY=${1}_REMOVE_POLICY

echo ""
echo "Forgetting and pruning ${1} snapshots according to retention policy ($(date))..."
echo "Policy: ${POLICY}"
echo "---------------------------"

restic --repository-file="$REPO" --password-file="$PASS" forget ${POLICY} --prune

echo ""
echo "Finished forget and prune $(date)"
echo "---------------------------"