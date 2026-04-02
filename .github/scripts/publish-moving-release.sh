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

if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <release-tag> <release-title-prefix> <asset-dir>" >&2
  exit 1
fi

release_tag="$1"
release_title_prefix="$2"
asset_dir="$3"
repo_url="https://github.com/$GITHUB_REPOSITORY"
release_title="$release_title_prefix($(date -u +%F))"
notes_file="$(mktemp)"

trap 'rm -f "$notes_file"' EXIT

git fetch --force --tags origin
previous_sha="$(git rev-parse -q --verify "refs/tags/$release_tag^{commit}" 2>/dev/null || true)"

echo "## Commits" > "$notes_file"

if [ -n "$previous_sha" ] && [ "$previous_sha" != "$GITHUB_SHA" ]; then
  git_log_args=(--reverse --format='%H%x09%s' "$previous_sha..$GITHUB_SHA")
else
  git_log_args=(-1 --format='%H%x09%s' "$GITHUB_SHA")
fi

git log "${git_log_args[@]}" | while IFS=$'\t' read -r commit_sha subject; do
  short_sha="${commit_sha:0:7}"
  if [[ "$subject" =~ \(\#([0-9]+)\) ]]; then
    pr_number="${BASH_REMATCH[1]}"
    printf -- '- %s: %s [#%s](%s/pull/%s)\n' "$short_sha" "$subject" "$pr_number" "$repo_url" "$pr_number"
  else
    printf -- '- %s: %s\n' "$short_sha" "$subject"
  fi
done >> "$notes_file"

if gh release view "$release_tag" >/dev/null 2>&1; then
  gh release delete "$release_tag" --yes
fi

git tag -f "$release_tag" "$GITHUB_SHA"
git push origin "refs/tags/$release_tag" --force

shopt -s nullglob
assets=("$asset_dir"/*)

if [ "${#assets[@]}" -gt 0 ]; then
  gh release create "$release_tag" "${assets[@]}" --title "$release_title" --notes-file "$notes_file" --prerelease --verify-tag
else
  gh release create "$release_tag" --title "$release_title" --notes-file "$notes_file" --prerelease --verify-tag
fi
