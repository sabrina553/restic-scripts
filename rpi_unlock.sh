#!/bin/bash

. /srv/restic-repo/scripts/restic_env.sh

echo "-"
echo "-"
echo "Attempting to unlock rasppi repo"
echo "---------------------------"

restic --repository-file=$RPI_REPOSITORY_FILE --password-file=$RPI_PASSWORD_FILE unlock --cleanup-cache

echo ""
echo "Finished unlocking $(date)"
echo "---------------------------"