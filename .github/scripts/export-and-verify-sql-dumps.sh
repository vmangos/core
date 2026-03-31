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
  echo "Usage: $0 <output-dir>" >&2
  exit 1
fi

output_dir="$1"
dump_dir="$output_dir/mysql-dump"
mysql_client_args=(--host=127.0.0.1 --protocol=TCP -u root -proot)

dump_database() {
  local database="$1"
  local file_path="$2"
  docker exec mysqldb mysqldump "${mysql_client_args[@]}" "$database" > "$file_path"
}

import_sql_file() {
  local database="$1"
  local file_path="$2"
  docker exec -i mysqldb mysql "${mysql_client_args[@]}" "$database" < "$file_path"
}

mkdir -p "$dump_dir"

echo "Exporting MySQL dumps..."
dump_database mangos "$dump_dir/mangos.sql"
dump_database realmd "$dump_dir/logon.sql"
dump_database logs "$dump_dir/logs.sql"
dump_database characters "$dump_dir/characters.sql"

echo "Creating verification databases..."
for database in realmd_verify characters_verify mangos_verify logs_verify; do
  docker exec mysqldb mysql "${mysql_client_args[@]}" -e "CREATE DATABASE IF NOT EXISTS $database DEFAULT CHARSET utf8 COLLATE utf8_general_ci;"
done

echo "Reimporting exported dumps..."
import_sql_file realmd_verify "$dump_dir/logon.sql"
import_sql_file logs_verify "$dump_dir/logs.sql"
import_sql_file mangos_verify "$dump_dir/mangos.sql"
import_sql_file characters_verify "$dump_dir/characters.sql"
