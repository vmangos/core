#!/usr/bin/env bash

# Copyright (C) 2026-present  VMaNGOS  https://github.com/vmangos
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <world-db-archive-name>" >&2
  exit 1
fi

world_db_archive="$1"
workspace="${GITHUB_WORKSPACE:?GITHUB_WORKSPACE must be set}"
mysql_container_id="${MYSQL_CONTAINER_ID:?MYSQL_CONTAINER_ID must be set}"
mysql_packet_limit_bytes=$((128 * 1024 * 1024)) # 128M
mysqladmin_client_args=(--host=127.0.0.1 --protocol=TCP -u root -proot)
mysql_client_args=(--host=127.0.0.1 --protocol=TCP -u root -proot --max_allowed_packet="$mysql_packet_limit_bytes")

import_sql_file() {
  local database="$1"
  local file_path="$2"
  docker exec -i "$mysql_container_id" mysql "${mysql_client_args[@]}" "$database" <"$file_path"
}

apply_migration_file() {
  local database="$1"
  local file_name="$2"
  local file_path="$workspace/sql/migrations/$file_name"

  if [ -f "$file_path" ]; then
    import_sql_file "$database" "$file_path"
  fi
}

echo "Waiting for database availability..."
max_attempts=30
attempt=0
until docker exec "$mysql_container_id" mysqladmin "${mysqladmin_client_args[@]}" ping --silent &>/dev/null; do
  attempt=$((attempt + 1))
  if [ "$attempt" -gt "$max_attempts" ]; then
    echo "Database failed to become ready in time!" >&2
    exit 1
  fi
  echo "Waiting for database to be ready... (attempt $attempt/$max_attempts)"
  sleep 5
done
echo "Database is ready!"

echo "Configuring MySQL packet size..."
docker exec "$mysql_container_id" mysql "${mysql_client_args[@]}" -e "SET GLOBAL max_allowed_packet=$mysql_packet_limit_bytes;"

echo "Downloading base world database..."
world_db_archive_path="$workspace/$world_db_archive.7z"
curl --fail --location --silent --show-error \
  --output "$world_db_archive_path" \
  "https://github.com/brotalnia/database/raw/master/$world_db_archive.7z"
7z e -y "$world_db_archive_path" -o"$workspace"

echo "Creating source databases..."
for database in realmd characters mangos logs; do
  docker exec "$mysql_container_id" mysql "${mysql_client_args[@]}" -e "CREATE DATABASE IF NOT EXISTS $database DEFAULT CHARSET utf8 COLLATE utf8_general_ci;"
done

echo "Importing schema and base data..."
import_sql_file realmd "$workspace/sql/logon.sql"
import_sql_file logs "$workspace/sql/logs.sql"
import_sql_file mangos "$workspace/$world_db_archive.sql"
import_sql_file characters "$workspace/sql/characters.sql"

echo "Applying SQL migrations..."
cd "$workspace/sql/migrations"
chmod +x merge.sh
./merge.sh

apply_migration_file mangos world_db_updates.sql
apply_migration_file characters characters_db_updates.sql
apply_migration_file realmd logon_db_updates.sql
apply_migration_file logs logs_db_updates.sql
