#!/bin/bash

. /srv/restic-repo/scripts/restic_env.sh

echo "-"
echo "-"
echo "Attempting to unlock local repo"
echo "---------------------------"

restic --repository-file=$LOCAL_REPOSITORY_FILE --password-file=$LOCAL_PASSWORD_FILE unlock --cleanup-cache

echo ""
echo "Finished unlocking $(date)"
echo "---------------------------"