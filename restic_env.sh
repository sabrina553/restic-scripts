#!/bin/bash

# files to include/exclude/cache
export RESTIC_INCLUDE_FILE_PATH="/srv/restic-repo/scripts/include.txt"
export RESTIC_EXCLUDE_FILE_PATH="/srv/restic-repo/scripts/exclude.txt"
export RESTIC_CACHE_DIR="/root/.cache/restic/"

# local info
export LOCAL_REPOSITORY_FILE="/srv/restic-repo/scripts/Identities/LOCAL_REPO"
export LOCAL_PASSWORD_FILE="/srv/restic-repo/scripts/Identities/LOCAL_PASSWORD"

# raspberry pi info
export RPI_REPOSITORY_FILE="/srv/restic-repo/scripts/Identities/RPI_REPO"
export RPI_PASSWORD_FILE="/srv/restic-repo/scripts/Identities/RPI_PASSWORD"

# sapphire pi info
export SAPPHIRE_REPOSITORY_FILE="/srv/restic-repo/scripts/Identities/SAPPHIRE_REPO"
export SAPPHIRE_PASSWORD_FILE="/srv/restic-repo/scripts/Identities/SAPPHIRE_PASSWORD"