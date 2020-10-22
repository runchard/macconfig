#!/usr/bin/env zsh

set -ex

echo "set up the configs"
homeprefix="$(pwd)/home"
for source_file in $homeprefix/**/*(.DG); do
    target_file="${HOME}/${source_file#$homeprefix/}"
    if [[ ! -a $target_file ]]; then
        mkdir -p ${target_file%/*}
        ln $source_file $target_file
    fi
done


# use copy with bak strategy
