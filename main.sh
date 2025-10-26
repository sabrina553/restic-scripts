#!/bin/bash
cd "$(dirname "${BASH_SOURCE[0]}")" || exit
. env.sh

case $2 in

    backup)
        . functions/backup.sh "$2" "$3"
        ;;

    check)
        . functions/check.sh "$2"
        ;;

    copy)
        . functions/copy.sh "$2" "$3"
        ;;

    prune)
        . functions/prune.sh "$2" "$3"
        ;;

    snapshots)
        . functions/snapshots.sh "$2"
        ;;
   
    *)
        echo "Error: ${2} not recognised"
        ;;
esac
