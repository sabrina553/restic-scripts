#!/bin/bash

. /srv/restic-repo/scripts/restic_env.sh

echo "-"
echo "-"
echo "Attempting to unlock sapphire repo"
echo "---------------------------"

restic --repository-file=$SAPPHIRE_REPOSITORY_FILE --password-file=$SAPPHIRE_PASSWORD_FILE unlock --cleanup-cache

echo ""
echo "Finished unlocking $(date)"
echo "---------------------------"