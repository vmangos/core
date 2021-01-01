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
- 1.12.1.5875+
- 1.11.2.5464
- 1.10.2.5302
- 1.9.4.5086
- 1.8.4.4878
- 1.7.1.4695
- 1.6.1.4544
<!--- 1.5.1.4449
- 1.4.2.4375
- 1.3.1.4297
- 1.2.4.4222-->

### Project guidelines
- Accuracy: The point of an emulator is to recreate the functionality of that which it is emulating as closely as possible. Therefore any custom behaviour should be behind a config option and off by default.
- DB Scripting: Content should be separate from the core itself, so hardcoding scripts should be avoided where possible. When database scripting functionality is insufficient, we simply expand it.
- Full progression: The ultimate goal of this project is to have complete progression starting from patch 1.2 through 1.12. This means every piece of data must be marked with the patch in which it was added or changed to it's current state.
- Tools are great: Content creation should not require programming knowledge. We hope to eventually provide tools that allow for user-friendly editing of database scripts and content, with all data presented in human-readable form.


### Useful Links
- [Wiki](https://github.com/vmangos/wiki)
- [Discord](https://discord.gg/x9a2jt7)
- [Script Editor](https://github.com/brotalnia/scripteditor)
- [Script Converter](https://github.com/vmangos/ScriptConverter)
