#!/bin/sh

merge() {
    local prefix=$1
    local file_path="${prefix}_db_updates.sql"

    [ -f $file_path ] && rm -f $file_path
    find . -type f -name "*_${prefix}.sql" | sort -n | xargs -I f cat f >> $file_path
}

merge "characters"
merge "logon"
merge "logs"
merge "world"

find . -type f -size 0 -delete
