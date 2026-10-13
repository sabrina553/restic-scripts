#!/bin/bash
export RESTIC_CACHE_DIR="/root/.cache/restic/"

# local info: short history only (server space is tight); the PC repos keep
# the long history.
export LOCAL_REPOSITORY_FILE="identities/LOCAL_REPO"
export LOCAL_PASSWORD_FILE="identities/LOCAL_PASSWORD"
export LOCAL_REMOVE_POLICY="--keep-daily 7 --keep-weekly 4 --keep-monthly 3 --keep-last 4"

# offsite PC: long history of the MAIN set
export SAPPHIRE_REPOSITORY_FILE="identities/SAPPHIRE_REPO"
export SAPPHIRE_PASSWORD_FILE="identities/SAPPHIRE_PASSWORD"
export SAPPHIRE_REMOVE_POLICY="--keep-daily 30 --keep-weekly 8 --keep-monthly 12 --keep-yearly 100 --keep-last 4"

# offsite PC: the DATA set. Formerly the IMMICH set; the name stayed so the
# snapshots already in it are reused.
export SAPPHIRE_IMMICH_REPOSITORY_FILE="identities/SAPPHIRE_IMMICH_REPO"
export SAPPHIRE_IMMICH_PASSWORD_FILE="identities/SAPPHIRE_IMMICH_PASSWORD"
export SAPPHIRE_IMMICH_REMOVE_POLICY="--keep-daily 30 --keep-weekly 8 --keep-monthly 12 --keep-yearly 100 --keep-last 4"

# files to include/exclude/cache
export MAIN_INCLUDE_FILE_PATH="configs/MAIN_include"
export MAIN_EXCLUDE_FILE_PATH="configs/MAIN_exclude"

export IMMICH_INCLUDE_FILE_PATH="configs/IMMICH_include"
export IMMICH_EXCLUDE_FILE_PATH="configs/IMMICH_exclude"

export DATA_INCLUDE_FILE_PATH="configs/DATA_include"
export DATA_EXCLUDE_FILE_PATH="configs/DATA_exclude"