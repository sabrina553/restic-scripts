#!/bin/bash

# run unlock script first (includes setting env vars)
. /srv/restic-repo/scripts/unlock.sh "$1"

declare -n REPO=${1}_REPOSITORY_FILE
declare -n PASS=${1}_PASSWORD_FILE

restic --repository-file="$REPO" --password-file="$PASS" snapshots