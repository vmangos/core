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

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <dependency-dir-name> <archive-filename>" >&2
  exit 1
fi

dep_dir_name="$1"
archive_filename="$2"
release_dir="$PWD/bin/Release"
dep_dir="$PWD/dep/windows/lib/${dep_dir_name}_release"
archive_path="$PWD/bin/$archive_filename"

if [ ! -d "$release_dir" ]; then
  echo "Could not find release directory at $release_dir." >&2
  exit 1
fi

if [ ! -d "$dep_dir" ]; then
  echo "Could not find dependency directory at $dep_dir." >&2
  exit 1
fi

cp -f "$dep_dir/libmySQL.dll" "$release_dir/libmySQL.dll"
cp -f "$dep_dir/libeay32.dll" "$release_dir/libeay32.dll"

rm -f "$archive_path"

(
  cd "$PWD/bin"
  7z a -tzip "$archive_filename" Release >/dev/null
)
