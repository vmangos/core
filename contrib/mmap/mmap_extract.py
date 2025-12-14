#!/usr/bin/env python

"""
Copyright (C) 2013-2017  CMaNGOS  https://github.com/cmangos
Copyright (C) 2024-present  VMaNGOS  https://github.com/vmangos

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
"""

import concurrent.futures
import functools
import os
import pathlib
import platform
import struct
import subprocess
import sys
import typing as T

# https://github.com/vmangos/core/blob/5e142e104c8033cd0505cf8e060f37e263f503fe/src/game/vmap/ModelInstance.h#L40
MOD_HAS_BOUND_FLAG = 1 << 2
# mapID, tileX, tileY, Flags, adtID, ID, Pos, Rot, Scale, Bound_lo, Bound_hi, name
INTRO_STRUCT_FORMAT = "<IIIIHI3f3ff"
INTRO_STRUCT_SIZE = struct.calcsize(INTRO_STRUCT_FORMAT)
BOUND_STRUCT_FORMAT = "<3f3f"
BOUND_STRUCT_SIZE = struct.calcsize(BOUND_STRUCT_FORMAT)
NAME_LENGTH_STRUCT_FORMAT = "<I"
NAME_LENGTH_STRUCT_SIZE = struct.calcsize(NAME_LENGTH_STRUCT_FORMAT)


class Spawn(T.NamedTuple):
    map_id: int
    tile_x: int
    tile_y: int
    flags: int
    adt_id: int
    id: int
    pos: tuple[float, float, float]
    rot: tuple[float, float, float]
    scale: tuple[float, float, float]
    bound_low: tuple[float, float, float] | None
    bound_high: tuple[float, float, float] | None
    name: bytes


# https://github.com/vmangos/core/blob/5e142e104c8033cd0505cf8e060f37e263f503fe/src/game/vmap/TileAssembler.cpp#L206-L243
# https://github.com/vmangos/core/blob/5e142e104c8033cd0505cf8e060f37e263f503fe/src/game/vmap/ModelInstance.cpp#L182-L226
def read_spawn(file: T.BinaryIO) -> Spawn:
    (map_id, tile_x, tile_y, flags, adt_id, id_, pos_x, pos_y, pos_z, rot_x, rot_y, rot_z, scale) = struct.unpack(
        INTRO_STRUCT_FORMAT, file.read(INTRO_STRUCT_SIZE)
    )
    if flags & MOD_HAS_BOUND_FLAG:
        (bound_low_x, bound_low_y, bound_low_z, bound_high_x, bound_high_y, bound_high_z) = struct.unpack(
            BOUND_STRUCT_FORMAT, file.read(BOUND_STRUCT_SIZE)
        )
        bound_low = bound_low_x, bound_low_y, bound_low_z
        bound_high = bound_high_x, bound_high_y, bound_high_z
    else:
        bound_low, bound_high = None, None

    name_length = struct.unpack(NAME_LENGTH_STRUCT_FORMAT, file.read(NAME_LENGTH_STRUCT_SIZE))[0]
    name = struct.unpack(f"{name_length}s", file.read(name_length))[0]
    return Spawn(
        map_id,
        tile_x,
        tile_y,
        flags,
        adt_id,
        id_,
        (pos_x, pos_y, pos_z),
        (rot_x, rot_y, rot_z),
        scale,
        bound_low,
        bound_high,
        name,
    )


class SubprocessConfig(T.NamedTuple):
    executable: pathlib.Path
    # Quote the type-hint because subprocess.STARTUPINFO isn't defined when running on Linux
    startupinfo: "subprocess.STARTUPINFO | None"  # type: ignore
    creation_flags: int


@functools.cache
def get_subprocess_config() -> SubprocessConfig:
    script_directory = pathlib.Path(__file__).parent
    if platform.system() == "Windows":
        startup_info = subprocess.STARTUPINFO()  # type: ignore
        startup_info.dwFlags |= 0x00000001
        startup_info.wShowWindow = 7
        creation_flags = subprocess.CREATE_NEW_CONSOLE  # type: ignore
        executable = script_directory / "MoveMapGenerator.exe"
    else:
        startup_info = None
        creation_flags = 0
        executable = script_directory / "MoveMapGenerator"

    return SubprocessConfig(executable, startup_info, creation_flags)


def run_move_map_gen(map_id: int) -> None:
    config = get_subprocess_config()
    subprocess.check_call(
        (config.executable, str(map_id), "--silent", "--threads", "1", *sys.argv[1:]),
        startupinfo=config.startupinfo,
        creationflags=config.creation_flags,
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
    )


def main() -> None:
    # Read map IDs from dir_bin
    map_ids: set[int] = set()
    current_working_directory = pathlib.Path.cwd()

    dir_bin_path = current_working_directory / "Buildings" / "dir_bin"
    with dir_bin_path.open("rb") as file:
        while True:
            try:
                spawn = read_spawn(file)
            except struct.error:
                # EOF reached
                break
            map_ids.add(spawn.map_id)

    max_workers = os.cpu_count() or 1
    print(f"Using {max_workers} worker(s) for map processing")
    pool = concurrent.futures.ThreadPoolExecutor(max_workers)

    # Create mmaps directory beforehand to avoid a race condition in MoveMapGen
    mmaps_directory = current_working_directory / "mmaps"
    mmaps_directory.mkdir(exist_ok=True)

    # Process maps
    future_to_map_id = {pool.submit(run_move_map_gen, map_id): map_id for map_id in sorted(map_ids)}
    total = len(future_to_map_id)
    num_errors = 0
    for number, future in enumerate(concurrent.futures.as_completed(future_to_map_id), start=1):
        map_id = future_to_map_id[future]
        exception = future.exception()
        if exception:
            num_errors += 1
        print(f"({number}/{total}) Map #{map_id}:", exception or "Processed successfully")

    pool.shutdown()
    print(f"Finished processing all maps ({total}) with {num_errors} error(s)")


if __name__ == "__main__":
    main()
