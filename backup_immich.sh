#!/bin/bash
. /srv/restic-repo/scripts/unlock.sh SAPPHIRE

echo "-"
echo "-"
echo "Running scheduled backup of immich ($(date))..."
echo "---------------------------"


restic --repository-file=$SAPPHIRE_REPOSITORY_FILE --password-file=$SAPPHIRE_PASSWORD_FILE backup --tag immich /media/sabrina/immich --dry-run

echo ""
echo "Finished scheduled backup $(date)"
echo "---------------------------"