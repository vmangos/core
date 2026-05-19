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
  echo "Usage: $0 <install-dir> <archive-filename>" >&2
  exit 1
fi

install_dir="$1"
archive_filename="$2"
package_name="vmangos-linux-amd64"
stage_parent="$PWD/bin/linux-release"
package_dir="$stage_parent/$package_name"
lib_dir="$package_dir/lib"
archive_path="$PWD/bin/$archive_filename"
elf_files=()

if [ ! -d "$install_dir" ]; then
  echo "Could not find install directory at $install_dir." >&2
  exit 1
fi

case "$archive_filename" in
*/*)
  echo "Archive filename must not contain a path." >&2
  exit 1
  ;;
*.tar.gz)
  ;;
*)
  echo "Archive filename must end in .tar.gz." >&2
  exit 1
  ;;
esac

is_elf() {
  local file="$1"
  local magic

  if [ ! -f "$file" ]; then
    return 1
  fi

  magic="$(head -c 4 "$file" 2>/dev/null || true)"
  [ "$magic" = $'\177ELF' ]
}

is_glibc_library() {
  local library_name

  library_name="$(basename "$1")"

  case "$library_name" in
  ld-linux*.so* | libc.so* | libm.so* | libpthread.so* | librt.so* | libdl.so* | libresolv.so* | libnss_*.so* | libnsl.so* | libutil.so* | libanl.so*)
    return 0
    ;;
  esac

  return 1
}

collect_elf_files() {
  local file

  elf_files=()

  while IFS= read -r -d '' file; do
    if is_elf "$file"; then
      elf_files+=("$file")
    fi
  done < <(find "$package_dir" -type f -print0)
}

extract_dependency_paths() {
  local elf_file="$1"
  local line
  local dependency_path
  local linked_dependency_regex='=>[[:space:]]+(/[^[:space:]]+)'
  local absolute_dependency_regex='^[[:space:]]*(/[^[:space:]]+)'

  while IFS= read -r line; do
    if [[ "$line" == *"not found"* ]]; then
      echo "Missing dependency while scanning $elf_file: $line" >&2
      return 1
    fi

    dependency_path=""

    if [[ "$line" =~ $linked_dependency_regex ]]; then
      dependency_path="${BASH_REMATCH[1]}"
    elif [[ "$line" =~ $absolute_dependency_regex ]]; then
      dependency_path="${BASH_REMATCH[1]}"
    fi

    if [ -n "$dependency_path" ] && [ -f "$dependency_path" ] && ! is_glibc_library "$dependency_path"; then
      printf '%s\n' "$dependency_path"
    fi
  done < <(ldd "$elf_file")
}

copy_runtime_dependencies() {
  local index
  local elf_file
  local dependency_path
  local dependency_name
  local bundled_dependency_path

  collect_elf_files

  index=0
  while [ "$index" -lt "${#elf_files[@]}" ]; do
    elf_file="${elf_files[$index]}"
    index=$((index + 1))

    while IFS= read -r dependency_path; do
      dependency_name="$(basename "$dependency_path")"
      bundled_dependency_path="$lib_dir/$dependency_name"

      if [ -e "$bundled_dependency_path" ]; then
        continue
      fi

      cp -L "$dependency_path" "$bundled_dependency_path"
      chmod u+w "$bundled_dependency_path"

      if is_elf "$bundled_dependency_path"; then
        elf_files+=("$bundled_dependency_path")
      fi
    done < <(extract_dependency_paths "$elf_file")
  done
}

patch_rpaths() {
  local elf_file
  local elf_dir
  local relative_dir
  local rpath
  local path_parts
  local path_part

  collect_elf_files

  for elf_file in "${elf_files[@]}"; do
    elf_dir="$(dirname "$elf_file")"
    relative_dir="${elf_dir#"$package_dir"}"
    relative_dir="${relative_dir#/}"
    rpath="\$ORIGIN"

    if [ "$relative_dir" != "lib" ]; then
      IFS='/' read -r -a path_parts <<<"$relative_dir"

      for path_part in "${path_parts[@]}"; do
        if [ -n "$path_part" ]; then
          rpath="$rpath/.."
        fi
      done

      rpath="$rpath/lib"
    fi

    patchelf --set-rpath "$rpath" "$elf_file"
  done
}

verify_dependencies() {
  local elf_file
  local missing_dependencies

  collect_elf_files

  missing_dependencies=0

  for elf_file in "${elf_files[@]}"; do
    if ldd "$elf_file" | grep -q "not found"; then
      echo "Missing runtime dependency in $elf_file." >&2
      ldd "$elf_file" >&2
      missing_dependencies=1
    fi
  done

  if [ "$missing_dependencies" -ne 0 ]; then
    exit 1
  fi
}

rm -rf "$stage_parent"
mkdir -p "$package_dir" "$lib_dir" "$(dirname "$archive_path")"

cp -a "$install_dir/." "$package_dir/"

copy_runtime_dependencies
patch_rpaths
verify_dependencies

rm -f "$archive_path"
tar -czf "$archive_path" -C "$stage_parent" "$package_name"
