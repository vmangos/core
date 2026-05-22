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
package_name="vmangos-macos-arm64"
stage_parent="$PWD/bin/macos-release"
package_dir="$stage_parent/$package_name"
lib_dir="$package_dir/lib"
archive_path="$PWD/bin/$archive_filename"
macho_files=()

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

is_macho() {
  local file="$1"
  local magic

  if [ ! -f "$file" ]; then
    return 1
  fi

  magic="$(head -c 4 "$file" 2>/dev/null || true)"

  case "$magic" in
  $'\xcf\xfa\xed\xfe' | $'\xfe\xed\xfa\xcf' | $'\xca\xfe\xba\xbe' | $'\xbe\xba\xfe\xca')
    return 0
    ;;
  esac

  return 1
}

is_system_library() {
  local path="$1"

  case "$path" in
  /usr/lib/* | /System/*)
    return 0
    ;;
  esac

  return 1
}

collect_macho_files() {
  local file

  macho_files=()

  while IFS= read -r -d '' file; do
    if is_macho "$file"; then
      macho_files+=("$file")
    fi
  done < <(find "$package_dir" -type f -print0)
}

extract_rpaths() {
  local file="$1"

  otool -l "$file" 2>/dev/null | awk '
    /^[[:space:]]+cmd LC_RPATH/ { in_rpath = 1; next }
    in_rpath && /^[[:space:]]+path / {
      sub(/^[[:space:]]+path[[:space:]]+/, "")
      sub(/[[:space:]]*\(offset.*\)$/, "")
      print
      in_rpath = 0
    }
  '
}

resolve_load_path() {
  local load_path="$1"
  local mach_file="$2"
  local rpath
  local candidate
  local lib_name
  local base

  case "$load_path" in
  /*)
    if [ -f "$load_path" ]; then
      printf '%s\n' "$load_path"
    fi
    return
    ;;
  @rpath/*)
    lib_name="${load_path#@rpath/}"
    while IFS= read -r rpath; do
      case "$rpath" in
      @loader_path/*)
        # `@loader_path` resolves to the directory of the Mach-O file being
        # processed, which is well-defined at build time.
        # `@executable_path` is intentionally not handled here: at build time
        # the eventual executable path is unknown, and Homebrew / CMake install
        # trees emit absolute or `@loader_path`-relative references rather than
        # `@executable_path`-relative ones.
        base="$(dirname "$mach_file")"
        rpath="${rpath#@loader_path/}"
        candidate="$base/$rpath/$lib_name"
        ;;
      @executable_path/*)
        continue
        ;;
      *)
        candidate="$rpath/$lib_name"
        ;;
      esac
      if [ -f "$candidate" ]; then
        printf '%s\n' "$candidate"
        return
      fi
    done < <(extract_rpaths "$mach_file")
    ;;
  esac
}

list_load_paths() {
  local file="$1"
  local own_install_name
  local own_basename
  local line
  local load_path

  own_install_name="$(otool -D "$file" 2>/dev/null | tail -n +2)"
  own_basename="$(basename "$file")"

  otool -L "$file" 2>/dev/null | tail -n +2 | while IFS= read -r line; do
    load_path="${line#"${line%%[![:space:]]*}"}"
    load_path="${load_path% (compatibility *}"

    if [ -n "$load_path" ] &&
      [ "$load_path" != "$own_install_name" ] &&
      [ "$(basename "$load_path")" != "$own_basename" ]; then
      printf '%s\n' "$load_path"
    fi
  done
}

extract_dependency_paths() {
  local file="$1"
  local load_path
  local resolved

  while IFS= read -r load_path; do
    resolved="$(resolve_load_path "$load_path" "$file")"
    if [ -z "$resolved" ]; then
      continue
    fi

    if is_system_library "$resolved"; then
      continue
    fi

    printf '%s\n' "$resolved"
  done < <(list_load_paths "$file")
}

copy_runtime_dependencies() {
  local index
  local mach_file
  local dependency_path
  local dependency_name
  local bundled_dependency_path

  collect_macho_files

  index=0
  while [ "$index" -lt "${#macho_files[@]}" ]; do
    mach_file="${macho_files[$index]}"
    index=$((index + 1))

    while IFS= read -r dependency_path; do
      dependency_name="$(basename "$dependency_path")"
      bundled_dependency_path="$lib_dir/$dependency_name"

      if [ -e "$bundled_dependency_path" ]; then
        continue
      fi

      cp -L "$dependency_path" "$bundled_dependency_path"
      chmod u+w "$bundled_dependency_path"

      if is_macho "$bundled_dependency_path"; then
        macho_files+=("$bundled_dependency_path")
      fi
    done < <(extract_dependency_paths "$mach_file")
  done
}

patch_install_names() {
  local mach_file
  local mach_dir
  local relative_dir
  local rpath
  local path_parts
  local path_part
  local load_path
  local dep_basename
  local existing_rpaths

  collect_macho_files

  for mach_file in "${macho_files[@]}"; do
    mach_dir="$(dirname "$mach_file")"
    relative_dir="${mach_dir#"$package_dir"}"
    relative_dir="${relative_dir#/}"

    rpath="@loader_path"

    if [ "$relative_dir" != "lib" ]; then
      IFS='/' read -r -a path_parts <<<"$relative_dir"

      for path_part in "${path_parts[@]}"; do
        if [ -n "$path_part" ]; then
          rpath="$rpath/.."
        fi
      done

      rpath="$rpath/lib"
    fi

    if [ "$relative_dir" = "lib" ]; then
      install_name_tool -id "@rpath/$(basename "$mach_file")" "$mach_file"
    fi

    # Normalize every reference to a bundled dependency onto
    # `@rpath/<basename>` so the single added rpath (`@loader_path/.../lib`)
    # covers them all. This also catches `@loader_path/*` and absolute
    # references whose basename matches a bundled library, rewriting them onto
    # the same scheme.
    while IFS= read -r load_path; do
      dep_basename="$(basename "${load_path#@rpath/}")"
      if [ -e "$lib_dir/$dep_basename" ] &&
        [ "$load_path" != "@rpath/$dep_basename" ]; then
        install_name_tool -change "$load_path" "@rpath/$dep_basename" "$mach_file"
      fi
    done < <(list_load_paths "$mach_file")

    existing_rpaths="$(extract_rpaths "$mach_file")"
    if ! grep -F -q -x -- "$rpath" <<<"$existing_rpaths"; then
      install_name_tool -add_rpath "$rpath" "$mach_file"
    fi
  done
}

sign_macho_files() {
  local mach_file

  collect_macho_files

  for mach_file in "${macho_files[@]}"; do
    codesign --force --sign - "$mach_file"
  done
}

verify_dependencies() {
  local mach_file
  local load_path
  local missing_dependencies
  local lib_name

  collect_macho_files

  missing_dependencies=0

  for mach_file in "${macho_files[@]}"; do
    while IFS= read -r load_path; do
      case "$load_path" in
      /usr/lib/* | /System/*)
        ;;
      @rpath/*)
        lib_name="${load_path#@rpath/}"
        if [ ! -e "$lib_dir/$lib_name" ]; then
          echo "Missing bundled dependency in $mach_file: $load_path" >&2
          missing_dependencies=1
        fi
        ;;
      @loader_path/* | @executable_path/*)
        # `patch_install_names` normalizes bundled deps onto `@rpath/*`, so any
        # `@loader_path/*` or `@executable_path/*` reference left here is
        # something we didn't recognize as bundled. Flag it so future
        # regressions surface at build time rather than at runtime.
        echo "Unrewritten loader-relative dependency in $mach_file: $load_path" >&2
        missing_dependencies=1
        ;;
      /*)
        echo "Unbundled absolute dependency in $mach_file: $load_path" >&2
        missing_dependencies=1
        ;;
      esac
    done < <(list_load_paths "$mach_file")
  done

  if [ "$missing_dependencies" -ne 0 ]; then
    exit 1
  fi
}

rm -rf "$stage_parent"
mkdir -p "$package_dir" "$lib_dir" "$(dirname "$archive_path")"

cp -a "$install_dir/." "$package_dir/"

copy_runtime_dependencies
patch_install_names
sign_macho_files
verify_dependencies

rm -f "$archive_path"
tar -czf "$archive_path" -C "$stage_parent" "$package_name"
