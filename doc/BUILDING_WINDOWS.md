# Building VMaNGOS on Windows

These instructions cover a 64-bit MSVC build. The dependencies VMaNGOS needs are vendored under
`dep/windows`, so nothing has to be installed for the build itself — but the vendored libraries are
**64-bit only**, and a 32-bit configure is rejected with a fatal error.

## Prerequisites

| What | Notes |
| --- | --- |
| Visual Studio 2019 or newer, with the "Desktop development with C++" workload | Provides MSVC and the Windows SDK |
| CMake 3.13 or newer | The project declares a 3.1 minimum, but `-S`/`-B` need 3.13 and precompiled headers need 3.16. Either the standalone installer or the copy bundled with Visual Studio |
| Git | Needed at configure time — `src/shared/revision.h` is generated from `HEAD` |
| A MySQL server | Only for running the server, not for building |

You do **not** need to install MySQL client libraries, OpenSSL, or zlib. They are in the
repository.

## 1. Configure

Out-of-source builds are enforced; configuring inside the source tree is a fatal error. Create a
build directory outside the checkout:

```
cmake -S C:/vmangos/core -B C:/vmangos/build -A x64 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=C:/vmangos/server
```

`-A x64` matters: the vendored dependencies have no 32-bit build. `CMAKE_INSTALL_PREFIX` is where
the finished server lands, and it should not be inside the source tree.

Options worth knowing:

- `SUPPORTED_CLIENT_BUILD` — which client the core emulates. Defaults to `CLIENT_BUILD_1_12_1`;
  can also be a raw build number such as `5464`. It regenerates `src/shared/Progression.h`, and
  a large amount of code is guarded on it.
- `USE_SCRIPTS` (ON) — build `src/scripts`.
- `BUILD_EXTRACTORS` (OFF) — build the map/DBC extraction tools in `contrib/`. You need these
  once, to produce the game data (see step 4).
- `BUILD_WARNINGS_AS_ERROR` (OFF) — worth turning on, since this fork has no CI to catch a new
  warning for you.
- `USE_PCH` (ON) — precompiled headers.
- `MYSQL_ROOT_DIR` (empty) — path to an external MySQL client library laid out like a Connector/C
  package (`include/mysql.h`, `lib/libmysql.lib`). Leave it unset to use the vendored client.

Configure prints a summary. Check that it reports the bundled libraries:

```
-- MySQL client library  : Bundled 26.7.0 (default)
-- OpenSSL library       : Bundled 3.5.7
```

Adding a new SQL migration requires re-running CMake, not just a rebuild —
`src/shared/migrations_list.h` is globbed at configure time.

## 2. Build and install

From the command line:

```
cmake --build C:/vmangos/build --config Release --target INSTALL -- -m
```

`-m` enables parallel MSBuild. Alternatively open `MaNGOS.sln` in the build directory and build the
`INSTALL` project. A full build takes a while; `realmd` alone is much quicker if that is all you
need.

**Stop any running `realmd.exe` or `mangosd.exe` before installing.** Otherwise the install step
fails partway through with `file INSTALL cannot copy ... Permission denied`, leaving a half-updated
install directory.

The install directory then contains:

```
mangosd.exe            realmd.exe
mangosd.conf.dist      realmd.conf.dist
libmysql.dll           MySQL client
libcrypto-3-x64.dll    OpenSSL
libssl-3-x64.dll       OpenSSL, required by the MySQL client
legacy.dll             OpenSSL 3 legacy provider, holds RC4
```

All four DLLs are required. `legacy.dll` in particular is not optional: the game protocol uses RC4,
which OpenSSL 3 moved into the legacy provider, and the daemons abort at startup if it cannot be
loaded.

`Crypto::InitializeCrypto` locates that provider relative to the **current working directory**, so
the daemons must be started with the install directory as the working directory. Launching them by
absolute path from somewhere else fails the crypto self-test.

## 3. Databases

Four databases are needed: `realmd` (login), `characters`, `mangos` (world), and `logs`.

### Server configuration

The schema predates strict SQL modes. Several columns default to `'0000-00-00 00:00:00'`, for
instance `account.last_login` and `account.last_pwd_reset`. With `NO_ZERO_DATE` or
`NO_ZERO_IN_DATE` enabled, *any* `ALTER TABLE` against such a table fails with
`Invalid default value`, even when the statement does not touch that column — which breaks
migrations and the world database import.

In the server's `my.ini`, under `[mysqld]`:

```ini
sql-mode="NO_ENGINE_SUBSTITUTION"
```

Restart MySQL afterwards, or apply it to the running server with
`SET GLOBAL sql_mode='NO_ENGINE_SUBSTITUTION';` — new connections pick it up immediately.

### Schema and migrations

Import the baselines from `sql/`: `logon.sql`, `characters.sql`, `logs.sql`. The world database is
not in this repository; use a released dump.

Then apply every migration in `sql/migrations/` in timestamp order, each against the database named
in its filename (`_logon`, `_characters`, `_world`, `_logs`). `sql/migrations/merge.bat` can
concatenate them per database first.

> **Check the schema after any migration error.** The `add_migration` stored procedure inserts the
> migration id *before* running the change, and DDL cannot be rolled back. A migration whose DDL
> fails still leaves its id recorded as applied, so `Database::CheckRequiredMigrations` will pass on
> a schema that was never updated. Never take the `migrations` table as proof on its own.

### Realm list

`realmd` exits with `No valid realms specified.` until the `realmlist` table has a row. The values
must line up with `mangosd.conf`:

```sql
INSERT INTO `realmlist`
  (`id`, `name`, `address`, `localAddress`, `localSubnetMask`, `port`, `icon`,
   `realmflags`, `timezone`, `allowedSecurityLevel`, `population`,
   `gamebuild_min`, `gamebuild_max`, `flag`, `realmbuilds`)
VALUES
  (1, 'VMaNGOS', '127.0.0.1', '127.0.0.1', '255.255.255.0', 8085, 0,
   0, 8, 0, 0, 5875, 5875, 0, '');
```

- `id` must equal `RealmID` in `mangosd.conf`.
- `port` must equal `WorldServerPort` in `mangosd.conf`.
- `timezone` should match `RealmZone`.
- `realmflags` must be `0`. The column defaults to `2`, which is `REALM_FLAG_OFFLINE`, and
  `realmd` skips rows where bit `0x01` is set.
- `gamebuild_min` / `gamebuild_max` should match your `SUPPORTED_CLIENT_BUILD` (`5875` for 1.12.1).
- `address` is what clients are told to connect to; `127.0.0.1` is local-only.

## 4. Game data

`mangosd` needs extracted client data — maps, vmaps, mmaps and DBC files — at the path given by
`DataDir`. Configure with `-DBUILD_EXTRACTORS=ON`, run the tools from `contrib/` against a client
installation, and point `DataDir` at the result. This is a one-time step per client version.

## 5. Running

Copy `realmd.conf.dist` to `realmd.conf` and `mangosd.conf.dist` to `mangosd.conf`, then edit them.

Each daemon needs its database connection strings, in the form
`"host;port;user;password;database"`. Note that the two files spell the setting differently —
`realmd` uses one key without a dot, `mangosd` uses `<Name>Database.Info`:

```ini
# realmd.conf
LoginDatabaseInfo = "127.0.0.1;3306;mangos;mangos;realmd"
```

```ini
# mangosd.conf
LoginDatabase.Info     = "127.0.0.1;3306;mangos;mangos;realmd"
WorldDatabase.Info     = "127.0.0.1;3306;mangos;mangos;mangos"
CharacterDatabase.Info = "127.0.0.1;3306;mangos;mangos;characters"
LogsDatabase.Info      = "127.0.0.1;3306;mangos;mangos;logs"
```

`mangosd` refuses to start if any of those databases is missing a migration listed in
`migrations_list.h`.

Start `realmd` first, then `mangosd`, both from the install directory. A healthy `realmd` startup
looks like this:

```
OpenSSL Headers: OpenSSL 3.5.7 | OpenSSL Library: OpenSSL 3.5.7
Running Crypto Library Selftest...
Connected to MySQL database at 127.0.0.1
Loading allowed clients...
Updating realm list...
Added realm "VMaNGOS"
```

## Troubleshooting

**`Cannot connect to database`, with `Authentication plugin 'caching_sha2_password' cannot be
loaded` above it.** The MySQL client being used is older than 8.0. The vendored client is 26.7 and
handles this; if you overrode it with `MYSQL_ROOT_DIR`, point that at a newer client.

**The daemon exits immediately with no output and nothing in the log.** A DLL failed to load, which
happens before logging starts. Check that all four DLLs listed above sit next to the executable and
come from this build. `dumpbin /dependents <exe>` lists what it needs.

**`OpenSSL: Failed to load openssl legacy provider.`** `legacy.dll` is missing from the working
directory, or the daemon was started from a different working directory.

**`Database <name> is missing the following migrations:`** Apply the listed migrations, then
confirm the schema actually changed — see the warning in step 3.

**Configure fails with "The Windows dependencies bundled with this repository are 64-bit only".**
The generator is targeting Win32. Reconfigure with `-A x64` in a clean build directory.
