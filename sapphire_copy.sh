#!/bin/bash
. /srv/restic-repo/scripts/sapphire_unlock.sh
. /srv/restic-repo/scripts/rpi_unlock.sh


echo "-"
echo "-"
echo "Running scheduled copy of main to sapphire ($(date))..."
echo "---------------------------"

restic --repository-file=$SAPPHIRE_REPOSITORY_FILE --password-file=$SAPPHIRE_PASSWORD_FILE copy --from-repository-file=$RPI_REPOSITORY_FILE --from-password-file=$RPI_PASSWORD_FILE

echo ""
echo "Finished scheduled copy $(date)"
echo "---------------------------"