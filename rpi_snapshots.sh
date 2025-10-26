#!/bin/bash

# run unlock script first (includes setting env vars)
. /srv/restic-repo/scripts/rpi_unlock.sh

restic --repository-file=$RPI_REPOSITORY_FILE --password-file=$RPI_PASSWORD_FILE snapshots