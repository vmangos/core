| gcc/g++           | clang/clang++     | visual studio     |
|-------------------|-------------------|-------------------|
| [![Build1][1]][10]| [![Build2][2]][10]| [![Build3][3]][10]|

[1]: https://travis-badge.herokuapp.com/repos/vmangos/core/branches/development/1?use_travis_com=true
[2]: https://travis-badge.herokuapp.com/repos/vmangos/core/branches/development/2?use_travis_com=true
[3]: https://travis-badge.herokuapp.com/repos/vmangos/core/branches/development/3?use_travis_com=true

[10]: https://travis-ci.com/github/vmangos/core


![C/C++ CI](https://github.com/vmangos/core/workflows/C/C++%20CI/badge.svg)


# Progressive Vanilla
This project is an independent continuation of the Elysium / LightsHope codebases, focused on delivering the most complete and accurate content progression system possible, including support for the patch appropriate game clients.

### Currently supported builds
- 1.12.1.5875+ (`CLIENT_BUILD_1_12_1`)
- 1.11.2.5464 (`CLIENT_BUILD_1_11_2`)
- 1.10.2.5302 (`CLIENT_BUILD_1_10_2`)
- 1.9.4.5086 (`CLIENT_BUILD_1_9_4`)
- 1.8.4.4878 (`CLIENT_BUILD_1_8_4`)
- 1.7.1.4695 (`CLIENT_BUILD_1_7_1`)
- 1.6.1.4544 (`CLIENT_BUILD_1_6_1`)
- 1.5.1.4449 (`CLIENT_BUILD_1_5_1`)
- 1.4.2.4375 (`CLIENT_BUILD_1_4_2`)
- 1.3.1.4297 (`CLIENT_BUILD_1_3_1`)
- 1.2.4.4222 (`CLIENT_BUILD_1_2_4`)

### Project guidelines
- Accuracy: The point of an emulator is to recreate the functionality of that which it is emulating as closely as possible. Therefore any custom behaviour should be behind a config option and off by default.
- DB Scripting: Content should be separate from the core itself, so hardcoding scripts should be avoided where possible. When database scripting functionality is insuficient, we simply expand it.
- Full progression: The ultimate goal of this project is to have complete progression starting from patch 1.2 through 1.12. This means every piece of data must be marked with the patch in which it was added or changed to it's current state.
- Tools are great: Content creation should not require programming knowledge. We hope to eventually provide tools that allow for user-friendly editing of database scripts and content, with all data presented in human-readable form.

### Software requirements

#### TBB
A high level abstract threading library

On arch linux it can be installed with `pacman -S tbb`

#### ACE
Framework that provides many components and patterns for developing high-performance, distributed real-time and embedded systems.

On arch linux it can be installed with `yay -S ace`

### How to install
1. Make build directory: `mkdir build`
2. Make install directory: `mkdir run`
3. Go to build directory: `cd build`
4. CMake: `cmake -DCMAKE_INSTALL_PREFIX=../run ..`
5. Make: `make`
6. Install: `make install`

More infos [here](https://github.com/vmangos/wiki/wiki/Getting-it-working)

#### More install options

You can run `cmake` with several more options:
| Command                   | Default           | Description                                               |
| -------                   | -------           | -----------                                               |
| CMAKE_INSTALL_PREFIX      | /usr/local        | Define output directory for the executables               |
| PCH                       | ?                 | Use precompiled headers to speed up the compile process   |
| DEBUG                     | 0                 | Debug mode                                                |
| SUPPORTED_CLIENT_BUILD    | CLIENT_BUILD_1_12_1 | Client version the core will support                    |
| USE_STD_MALLOC            | 0                 | Use malloc instead of TBB                                 |
| TBB_DEBUG                 | 0                 | Use TBB debug librairies                                  |
| USE_ANTICHEAT             | 0                 | Use anticheat                                             |
| SCRIPTS                   | 1                 | Compile scripts                                           |
| USE_EXTRACTORS            | 0                 | Compile extractors                                        |
| USE_LIBCURL               | 0                 | Compile with libcurl for email support                    |


Full command example:
```
cmake ..
    -DCMAKE_INSTALL_PREFIX=${RUN_DIR} \
    -DPCH=1 \
    -DDEBUG=0 \
    -DSUPPORTED_CLIENT_BUILD=CLIENT_BUILD_1_12_1 \
    -DUSE_STD_MALLOC=0 \
    -DTBB_DEBUG=0 \
    -DUSE_ANTICHEAT=1 \
    -DSCRIPTS=1 \
    -DUSE_EXTRACTORS=1 \
    -DUSE_LIBCURL=1
```

SUPPORTED_CLIENT_BUILD options:
- `CLIENT_BUILD_1_2_4`
- `CLIENT_BUILD_1_3_1`
- `CLIENT_BUILD_1_4_2`
- `CLIENT_BUILD_1_5_1`
- `CLIENT_BUILD_1_6_1`
- `CLIENT_BUILD_1_7_1`
- `CLIENT_BUILD_1_8_4`
- `CLIENT_BUILD_1_9_4`
- `CLIENT_BUILD_1_10_2`
- `CLIENT_BUILD_1_11_2`
- `CLIENT_BUILD_1_12_1`

### Useful Links
- [Wiki](https://github.com/vmangos/wiki)
- [Discord](https://discord.gg/x9a2jt7)
- [Script Editor](https://github.com/brotalnia/scripteditor)
- [Script Converter](https://github.com/vmangos/ScriptConverter)
