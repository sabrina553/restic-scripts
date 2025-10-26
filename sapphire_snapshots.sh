#!/bin/bash

# run unlock script first (includes setting env vars)
. /srv/restic-repo/scripts/sapphire_unlock.sh

restic --repository-file=$SAPPHIRE_REPOSITORY_FILE --password-file=$SAPPHIRE_PASSWORD_FILE snapshots