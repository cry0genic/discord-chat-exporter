#!/bin/sh
channel_ids=`cat config.json | jq ".guilds [] | select(.enabled != false) .channels [] | select(.enabled != false) .id"`

for i in "$channel_ids"
do 
    cmd="docker run --env-file ./.env --rm -it -v $(pwd):/out tyrrrz/discordchatexporter export -c "$i" -f Csv"
    eval $cmd
done