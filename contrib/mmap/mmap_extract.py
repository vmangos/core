#!/usr/bin/env python

"""
This file is part of the CMaNGOS Project. See AUTHORS file for Copyright information

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

import pathlib
import struct
import subprocess
import sys
import threading
import time
import typing
from collections import deque
from multiprocessing import cpu_count

# https://github.com/vmangos/core/blob/5e142e104c8033cd0505cf8e060f37e263f503fe/src/game/vmap/ModelInstance.h#L40
MOD_HAS_BOUND = 1 << 2
# mapID, tileX, tileY, Flags, adtID, ID, Pos, Rot, Scale, Bound_lo, Bound_hi, name
INTRO_STRUCT_FORMAT = "<IIIIHI3f3ff"
BOUND_STRUCT_FORMAT = "<3f3f"
NAME_STRUCT_FORMAT = "<I"


class Spawn(typing.NamedTuple):
    map_id: int
    tile_x: int
    tile_y: int
    flags: int
    adt_id: int
    id: int
    pos: tuple[float, float, float]
    rot: tuple[float, float, float]
    scale: tuple[float, float, float]
    bound_low: typing.Optional[tuple[float, float, float]]
    bound_high: typing.Optional[tuple[float, float, float]]
    name_len: int
    name: bytes


# https://github.com/vmangos/core/blob/5e142e104c8033cd0505cf8e060f37e263f503fe/src/game/vmap/TileAssembler.cpp#L206-L243
# https://github.com/vmangos/core/blob/5e142e104c8033cd0505cf8e060f37e263f503fe/src/game/vmap/ModelInstance.cpp#L182-L226
def read_spawn(file):
    intro_data = file.read(struct.calcsize(INTRO_STRUCT_FORMAT))
    (
        map_id,
        tile_x,
        tile_y,
        flags,
        adt_id,
        id_,
        pos_x,
        pos_y,
        pos_z,
        rot_x,
        rot_y,
        rot_z,
        scale,
    ) = struct.unpack(INTRO_STRUCT_FORMAT, intro_data)
    if flags & MOD_HAS_BOUND:
        bound_data = file.read(struct.calcsize(BOUND_STRUCT_FORMAT))
        (
            bound_low_x,
            bound_low_y,
            bound_low_z,
            bound_high_x,
            bound_high_y,
            bound_high_z,
        ) = struct.unpack(BOUND_STRUCT_FORMAT, bound_data)
        bound_low = bound_low_x, bound_low_y, bound_low_z
        bound_high = bound_high_x, bound_high_y, bound_high_z
    else:
        bound_low, bound_high = None, None

    name_len_data = file.read(struct.calcsize(NAME_STRUCT_FORMAT))
    name_len = struct.unpack(NAME_STRUCT_FORMAT, name_len_data)[0]
    assert name_len <= 500
    name_data = file.read(name_len)
    name = struct.unpack(f"{name_len}s", name_data)[0]

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
        name_len,
        name,
    )


class WorkerThread(threading.Thread):
    def __init__(self, map_id):
        super().__init__()
        self.map_id = map_id

    def run(self):
        name = f"Worker for map {self.map_id}"
        print("++", name)

        # The MoveMapGen executable is expected to be in the same directory as this script
        move_map_gen_dir = pathlib.Path(__file__).parent
        if sys.platform == "win32":
            startup_info = subprocess.STARTUPINFO()
            startup_info.dwFlags |= 0x00000001
            startup_info.wShowWindow = 7
            creation_flags = subprocess.CREATE_NEW_CONSOLE
            bin_path = move_map_gen_dir / "MoveMapGen.exe"
        else:
            startup_info = None
            creation_flags = 0
            bin_path = move_map_gen_dir / "MoveMapGen"

        subprocess.call(
            (bin_path, str(self.map_id), "--silent"),
            startupinfo=startup_info,
            creationflags=creation_flags,
        )
        print("--", name)


if __name__ == "__main__":
    # Read map IDs from dir_bin
    map_ids = set()
    with (pathlib.Path("Buildings") / "dir_bin").open("rb") as file:
        while True:
            try:
                spawn = read_spawn(file)
            except struct.error:
                # EOF
                break

            if spawn.map_id not in map_ids:
                map_ids.add(spawn.map_id)

    # Process maps
    max_workers = max(cpu_count() - 0, 1)  # You can reduce the load by putting 1 instead of 0 if you need to free 1 core/cpu
    print("I will always maintain", max_workers, "MoveMapGen tasks running in background.\n")
    map_queue = deque(map_ids)
    while map_queue:
        if threading.active_count() <= max_workers:
            WorkerThread(map_queue.popleft()).start()

        time.sleep(0.1)
