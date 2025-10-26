#!/bin/bash
. functions/unlock.sh "$1"
. functions/unlock.sh "$2"

declare -n SOURCE_REPO=${1}_REPOSITORY_FILE
declare -n SOURCE_PASS=${1}_PASSWORD_FILE

declare -n DEST_REPO=${2}_REPOSITORY_FILE
declare -n DEST_PASS=${2}_PASSWORD_FILE

echo ""
echo "Running scheduled copy to raspberry-pi ($(date))..."
echo "---------------------------"

restic --repository-file="$DEST_REPO" --password-file="$DEST_PASS" copy --from-repository-file="$SOURCE_REPO" --from-password-file="$SOURCE_PASS"

echo ""
echo "Finished scheduled copy $(date)"
echo "---------------------------"