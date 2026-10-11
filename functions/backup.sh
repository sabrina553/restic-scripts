#!/bin/bash
. functions/unlock.sh "$1"

#read input variable for repo
declare -n REPO=${1}_REPOSITORY_FILE
declare -n PASS=${1}_PASSWORD_FILE
#read input variable for snapshot
declare -n EXCLUDE=${2}_EXCLUDE_FILE_PATH
declare -n INCLUDE=${2}_INCLUDE_FILE_PATH

#"Aesthetics"
echo ""
echo "Running scheduled backup ($(date))..."
echo "---------------------------"

restic --repository-file="$REPO" --password-file="$PASS" backup --tag "$2" --exclude-file="$EXCLUDE" --files-from="$INCLUDE"
rc=$?

# Record the result for /opt/docker/scripts/backup-verify.sh: restic exits 3
# when the snapshot was made but some files couldn't be read (a failing disk),
# 1 when no snapshot was made. This script's own exit status is unchanged.
mkdir -p state
echo "$rc $(date +%s)" > "state/last-backup-$1-$2"
echo "restic exit code: $rc"

echo ""
echo "Finished scheduled backup $(date)"
echo "---------------------------"