#!/bin/bash

# run unlock script first (includes setting env vars)
. functions/unlock.sh "$1"

declare -n REPO=${1}_REPOSITORY_FILE
declare -n PASS=${1}_PASSWORD_FILE
declare -n POLICY=${1}_REMOVE_POLICY

#IFS=',' read -a tags <<< "$2"

echo ""
echo "Forgetting and pruning ${1} snapshots according to retention policy ($(date))..."
echo "Policy: ${POLICY}"
echo "---------------------------"


restic --repository-file="$REPO" --password-file="$PASS" forget --keep-tag "$2" "$POLICY" --prune


#### not sure yet how I should be handling multiple tags in one repo 
# for tag in "${tags[@]}"
# do 
#     restic --repository-file=${REPO} --password-file=${PASS} forget --keep-tag ${tag} ${POLICY} --prune
# done




echo ""
echo "Finished forget and prune $(date)"
echo "---------------------------"