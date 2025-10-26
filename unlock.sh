#!/bin/bash
. /srv/restic-repo/scripts/env.sh

declare -n REPO=${1}_REPOSITORY_FILE
declare -n PASS=${1}_PASSWORD_FILE

#variable below
echo ""
echo "Attempting to unlock ${1} repo"
echo "---------------------------"

restic --repository-file="$REPO" --password-file="$PASS" unlock --cleanup-cache

echo ""
echo "Finished unlocking $(date)"
echo "---------------------------"