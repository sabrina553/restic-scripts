#!/bin/bash
# run unlock script first (includes setting env vars)
. functions/unlock.sh "$1"

declare -n REPO=${1}_REPOSITORY_FILE
declare -n PASS=${1}_PASSWORD_FILE

echo ""
echo "Forgetting snapshot ${2} ($(date))..."
echo "---------------------------"

restic --repository-file="$REPO" --password-file="$PASS" forget "$2"

echo ""
echo "Finished forgot ${2} $(date)"
echo "---------------------------"