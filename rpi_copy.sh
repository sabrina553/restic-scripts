#!/bin/bash
. /srv/restic-repo/scripts/local_unlock.sh
. /srv/restic-repo/scripts/rpi_unlock.sh


echo "-"
echo "-"
echo "Running scheduled copy to raspberry-pi ($(date))..."
echo "---------------------------"

restic --repository-file=$RPI_REPOSITORY_FILE --password-file=$RPI_PASSWORD_FILE copy --from-repository-file=$LOCAL_REPOSITORY_FILE --from-password-file=$LOCAL_PASSWORD_FILE

echo ""
echo "Finished scheduled copy $(date)"
echo "---------------------------"