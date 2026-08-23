# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

VMaNGOS — a World of Warcraft 1.x (vanilla) server emulator, continuing the Elysium/LightsHope
lineage of MaNGOS. C++14, CMake, MySQL. Two server daemons: `realmd` (auth/realm list) and
`mangosd` (world server). There is no test suite, and this fork carries no CI — the `.github`
workflows were removed. Nothing verifies a change automatically, so build it yourself before
trusting it.

## Build

Out-of-source builds are enforced (configuring in the source tree is a fatal error).

```sh
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=../_install
make -j"$(nproc)" && make install
```

Windows (Visual Studio) generates `MaNGOS.sln` in the build dir; MySQL/OpenSSL/zlib are vendored
under `dep/windows`, so no dependency install is needed. Those vendored binaries are **64-bit
only** — a 32-bit Windows build is rejected at configure time. On Unix, `libmysqlclient`, OpenSSL,
and zlib must be found by `find_package`.

The vendored Windows client libraries are MySQL 26.7 and OpenSSL 3.5 (libcrypto). `legacy.dll`,
the OpenSSL 3 provider holding RC4, is installed next to the binaries and loaded by
`Crypto::InitializeCrypto` — which finds it relative to the **current working directory**, so the
daemons must be started from their install directory. `libssl` is shipped but not linked; the
MySQL client imports it, and it must come from the same OpenSSL build as `libcrypto`.

Notable CMake options (the full list is printed at configure time by `cmake/showoptions.cmake`):

- `SUPPORTED_CLIENT_BUILD` — the most consequential option. Selects which client patch the core
  emulates (`CLIENT_BUILD_1_12_1` by default, or a raw build number such as `5464`). It rewrites
  `src/shared/Progression.h` at configure time, and hundreds of `#if SUPPORTED_CLIENT_BUILD`
  guards across the codebase change behaviour with it.
- `USE_SCRIPTS` (ON) — build `src/scripts`; `BUILD_EXTRACTORS` / `BUILD_REALMMERGE` (OFF) — build
  the `contrib` tools.
- `BUILD_WARNINGS_AS_ERROR` (OFF) — upstream turned this on in CI; worth enabling locally, since
  nothing else will catch a new warning.
- `BUILD_FOR_HOST_CPU` (ON) — `-march=native`; turn OFF for portable binaries.
- `USE_PCH` (ON) — precompiled headers. Worth one build with `-DUSE_PCH=OFF` after touching
  includes: a change relying on a header pulled in transitively through the PCH only fails there.
- `MYSQL_ROOT_DIR` (empty, Windows only) — path to an external MySQL client library, laid out like
  a Connector/C package (`include/mysql.h`, `lib/libmysql.lib`). Overrides the vendored client.

Upstream CI used to build every supported client build (5875, 5464, 5302, 5086, 4878, 4695, 4544,
4449, 4375) across Ubuntu GCC/Clang, macOS, Windows MSVC and MinGW. Those workflows are gone here,
so nothing catches code guarded by client-build `#if`s that only compiles on 1.12.1, or a change
that relies on a header pulled in transitively through the PCH. Build the affected configurations
by hand when touching anything behind `SUPPORTED_CLIENT_BUILD`.

### Configure-time code generation

Several headers are generated and must not be hand-edited:

- `src/shared/Progression.h` — from `cmake/generators/Progression.h.in` + `SUPPORTED_CLIENT_BUILD`.
- `src/shared/revision.h` — from git HEAD.
- `src/shared/migrations_list.h` — globbed from `sql/migrations/*.sql`.

Because migrations are globbed at configure time, adding an SQL migration requires re-running
cmake, not just `make`.

### Adding source files

`src/game/CMakeLists.txt`, `src/shared/CMakeLists.txt`, and `src/scripts/CMakeLists.txt` list
sources explicitly (no globbing). A new `.cpp` must be added to the relevant list or it is
silently not compiled.

## Running

`mangosd` and `realmd` each install a `<name>.conf.dist` next to the binary; copy it to
`<name>.conf` and edit. Four databases must be configured (`World`, `Character`, `Login`, `Logs`),
each via `<Name>Database.Info = "host;port;user;pass;dbname"`. `mangosd` refuses to start if a
database is missing any migration listed in `migrations_list.h`
(`Database::CheckRequiredMigrations`). `DataDir` must point at extracted client data
(maps/vmaps/mmaps/dbc) produced by the extractors in `contrib/`.

`WowPatch` in `mangosd.conf` (0-10, mapping to `WOW_PATCH_102` through `WOW_PATCH_112`) selects
the *content* patch at runtime, independently of `SUPPORTED_CLIENT_BUILD`. Many world DB tables
carry `patch_min`/`patch_max` columns and rows are filtered against `sWorld.GetWowPatch()` at load
time.

## SQL

- Schema baselines: `sql/characters.sql`, `sql/logon.sql`, `sql/logs.sql`. The world DB comes from
  a released dump, not from this repo.
- The schema predates strict `sql_mode`: several columns default to `'0000-00-00 00:00:00'`
  (`account.last_login`, `account.last_pwd_reset`, ...). Under `NO_ZERO_DATE`/`NO_ZERO_IN_DATE`,
  *any* `ALTER TABLE` on such a table fails with `Invalid default value`, even when it does not
  touch that column. Run modern MySQL servers with `sql-mode="NO_ENGINE_SUBSTITUTION"`.
- Every table must be InnoDB. The core wraps multi-table writes in transactions that span tables
  the upstream schema used to split across engines — `Player::_SaveInventory` writes
  `character_inventory` and `item_instance` in one transaction. A transaction mixing a
  non-transactional (MyISAM) table with a transactional one is rejected outright once
  `enforce_gtid_consistency` is on, which is the default from MySQL 8.4 onwards, and the failed
  statement is dropped without stopping the save: `Statement violates GTID consistency`. Even
  without GTID enforcement the mix is unsafe, because a rollback leaves the MyISAM half applied.
  The baselines here are all InnoDB; a world DB imported from a released dump is not, so convert
  it after import.
- The `add_migration` stored procedure inserts the migration id **before** running the change, and
  DDL cannot roll back. A migration whose DDL fails therefore leaves its id recorded as applied and
  `CheckRequiredMigrations` will pass on a schema that was never updated — check the actual schema
  after any migration error, do not trust the `migrations` table.
- Migrations live in `sql/migrations/<UTC timestamp>_<db>.sql`, where `<db>` is one of `world`,
  `characters`, `logon`, `logs`. Create one with `sql/make_migration.py`,
  `sql/touch_migration.sh`, or `sql/make_migration.bat` (run from `sql/`) — never hand-write the
  timestamp. The generated stub wraps the change in an `add_migration` stored procedure guarded on
  the `migrations` table, making it idempotent; put the change between the
  `-- Add your query below.` and `-- End of migration.` markers.
- `sql/custom/` holds optional content, applied last; those files must be re-runnable without
  destroying data.
- Migrations must be valid MySQL 5.6 syntax — that is what upstream's SQL check enforced, and the
  released world DB dumps are produced on 5.6. Nothing checks this here any more.

## Architecture

Build targets: static libs `shared`, `framework`, `game`, `scripts`; executables `mangosd` and
`realmd`.

- **`src/shared`** — infrastructure with no game knowledge: config parsing, logging, the MySQL
  layer (`Database/`), auth crypto, byte buffers, threading. Four global `DatabaseType` instances
  (`WorldDatabase`, `CharacterDatabase`, `LoginDatabase`, `LogsDatabase`) are declared in
  `Database/DatabaseEnv.h`. Queries run synchronously or are queued onto async worker threads
  (`SqlDelayThread`, `DatabaseCallback.h`).
- **`src/framework`** — generic templates: `Dynamic/` (type lists, the factory/object registry
  behind the AI registry), `GameSystem/` (grid/cell containers), `Policies/` (singletons, object
  lifetime).
- **`src/realmd`** — standalone auth server. Speaks the SRP6 logon protocol (`AuthSocket`), serves
  the realm list, and streams client patches. Touches only the Login DB.
- **`src/game`** — the world server library. Key seams:
  - `Server/` — `WorldSocket` (network) feeds `WorldSession` (per-player packet queue). Opcodes
    map to handlers through a table in `Server/Protocol/Opcodes.cpp`; handler bodies live in
    `Handlers/`, one file per feature area. `Server/Packets/` holds structured packet types.
  - `Objects/` — the object hierarchy `Object` → `WorldObject` → `SpellCaster` → `Unit` →
    `Player`/`Creature`/`Pet`. `UpdateFields_1_*.{h,cpp}` are per-client-build field layouts; the
    dispatching `UpdateFields.h` includes the right one based on `SUPPORTED_CLIENT_BUILD`.
  - `Maps/` — grid/cell world partitioning (`Cell`, `GridDefines`, `GridNotifiers`,
    `GridSearchers`), `Map`/`MapManager`, instance persistence (`MapPersistentStateMgr`), and
    Recast/Detour pathfinding (`PathFinder`, `MoveMap`).
  - `ObjectMgr` — loads and owns nearly all world DB template and spawn data.
    `Database/SQLStorages` and `Database/DBCStores` back the DBC files and SQL static stores.
  - `AI/` — `CreatureAI` base, `CreatureEventAI` (fully DB-driven), and the
    `ScriptedAI`/`ScriptedInstance` bases used by `src/scripts`.
  - `Spells/` — `SpellEntry` (DBC plus DB overrides), `Spell` (cast pipeline),
    `SpellEffects.cpp`, `SpellAuras`, `SpellMgr`.
  - `Chat/` + `Commands/` — the GM/player command tree, dispatched from
    `ChatHandler::getCommandTable()`.
- **`src/scripts`** — optional C++ content scripts organised by zone/instance
  (`eastern_kingdoms/`, `kalimdor/`, `world/`, `battlegrounds/`, `spells/`, `custom/`). Each file
  exposes an `AddSC_<name>()` that fills a `Script` struct (function pointers for gossip, quest,
  AI factory, instance data, spell/aura scripts) and calls `RegisterSelf()`; `Script::Name` must
  match a `ScriptName` in the DB. Every `AddSC_` must be both declared and called in
  `src/scripts/ScriptLoader.cpp`, and the `.cpp` added to `src/scripts/CMakeLists.txt`.

### Two scripting systems — prefer the database one

The core has a data-driven scripting engine in `Maps/ScriptCommands.{h,cpp}` (`SCRIPT_COMMAND_*`
opcodes) backed by world DB tables loaded in `ScriptMgr::LoadScripts`: `generic_scripts`,
`quest_start_scripts`, `quest_end_scripts`, `spell_scripts`, `event_scripts`,
`gameobject_scripts`, `gossip_scripts`, `areatrigger_scripts`, `creature_spells_scripts`, and
others. Per the project guidelines, content belongs in the database; write a C++ script in
`src/scripts` only when the DB command set genuinely cannot express the behaviour — and in that
case the preferred fix is to extend `ScriptCommands` rather than hardcode the content.

## Conventions

- Formatting is defined by `.clang-format` (Allman braces, 4-space indent, no tabs,
  `ColumnLimit: 999`, left-aligned pointers) and `.editorconfig`. Do not reformat unrelated lines;
  much of the tree predates the config.
- Behaviour that differs between client builds goes behind
  `#if SUPPORTED_CLIENT_BUILD <op> CLIENT_BUILD_1_x_y` (from `Progression.h`). Content that
  appeared or changed in a specific content patch goes behind a `sWorld.GetWowPatch()` check or
  `patch_min`/`patch_max` DB columns.
- Accuracy to retail is the goal: any custom (non-Blizzlike) behaviour must sit behind a config
  option in `mangosd.conf.dist.in` and default to off.
