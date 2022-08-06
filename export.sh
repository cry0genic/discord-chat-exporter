#!/bin/sh
config_details=`cat config.json | jq ".guilds [] | select(.enabled != false) .channels [] | select(.enabled != false) | .id, .after, .before"`

for config in "$config_details"
do 
    set -- $config
    cmd="docker run --env-file ./.env --rm -it -v $(pwd):/out tyrrrz/discordchatexporter export -c "$1" --after "$2" --before "$3" -f Csv"
    eval $cmd
done