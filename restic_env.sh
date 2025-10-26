#!/bin/bash

# files to include/exclude/cache
export RESTIC_INCLUDE_FILE_PATH="/srv/restic-repo/scripts/include.txt"
export RESTIC_EXCLUDE_FILE_PATH="/srv/restic-repo/scripts/exclude.txt"
export RESTIC_CACHE_DIR="/root/.cache/restic/"

# local info
export LOCAL_REPOSITORY_FILE="/srv/restic-repo/scripts/Identities/LOCAL_REPO"
export LOCAL_PASSWORD_FILE="/srv/restic-repo/scripts/Identities/LOCAL_PASSWORD"
export LOCAL_REMOVE_POLICY"--keep-daily 30 --keep-weekly 8 --keep-monthly 12 --keep-yearly 100 --keep-last 4 --prune"

# raspberry pi info
export RPI_REPOSITORY_FILE="/srv/restic-repo/scripts/Identities/RPI_REPO"
export RPI_PASSWORD_FILE="/srv/restic-repo/scripts/Identities/RPI_PASSWORD"
export RPI_REMOVE_POLICY"--keep-daily 30 --keep-weekly 8 --keep-monthly 12 --keep-yearly 100 --keep-last 4 --prune"

# sapphire pi info
export SAPPHIRE_REPOSITORY_FILE="/srv/restic-repo/scripts/Identities/SAPPHIRE_REPO"
export SAPPHIRE_PASSWORD_FILE="/srv/restic-repo/scripts/Identities/SAPPHIRE_PASSWORD"
export SAPPHIRE_REMOVE_POLICY"--keep-daily 30 --keep-weekly 8 --keep-monthly 12 --keep-yearly 100 --keep-last 4 --prune"