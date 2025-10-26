#!/bin/bash
export RESTIC_CACHE_DIR="/root/.cache/restic/"

# local info
export LOCAL_REPOSITORY_FILE="identities/LOCAL_REPO"
export LOCAL_PASSWORD_FILE="identities/LOCAL_PASSWORD"
export LOCAL_REMOVE_POLICY="--keep-daily 30 --keep-weekly 8 --keep-monthly 12 --keep-yearly 100 --keep-last 4"

# raspberry pi info
export RPI_REPOSITORY_FILE="identities/RPI_REPO"
export RPI_PASSWORD_FILE="identities/RPI_PASSWORD"
export RPI_REMOVE_POLICY="--keep-daily 30 --keep-weekly 8 --keep-monthly 12 --keep-yearly 100 --keep-last 4"

# sapphire pi info
export SAPPHIRE_REPOSITORY_FILE="identities/SAPPHIRE_REPO"
export SAPPHIRE_PASSWORD_FILE="identities/SAPPHIRE_PASSWORD"
export SAPPHIRE_REMOVE_POLICY="--keep-daily 30 --keep-weekly 8 --keep-monthly 12 --keep-yearly 100 --keep-last 4"

# files to include/exclude/cache
export MAIN_INCLUDE_FILE_PATH="configs/MAIN_include"
export MAIN_EXCLUDE_FILE_PATH="configs/MAIN_exclude"

export IMMICH_INCLUDE_FILE_PATH="configs/IMMICH_include"
export IMMICH_EXCLUDE_FILE_PATH="configs/IMMICH_exclude"