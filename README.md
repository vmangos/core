| gcc/g++           | clang/clang++     | visual studio     |
|-------------------|-------------------|-------------------|
| [![Build1][1]][10]| [![Build2][2]][10]| [![Build3][3]][10]|

[1]: https://travis-badge.herokuapp.com/repos/vmangos/core/branches/development/1?use_travis_com=true
[2]: https://travis-badge.herokuapp.com/repos/vmangos/core/branches/development/2?use_travis_com=true
[3]: https://travis-badge.herokuapp.com/repos/vmangos/core/branches/development/3?use_travis_com=true

[10]: https://travis-ci.com/github/vmangos/core


![C/C++ CI](https://github.com/vmangos/core/workflows/C/C++%20CI/badge.svg)


# Progressive Vanilla
*vMaNGOS* is an open-source Vanilla WoW emulation project. It is an independent continuation of the *Elysium* / *LightsHope* codebases, focused on delivering the most complete and accurate content progression system possible, including support for the patch appropriate game clients.

Unlike other emulation projects like *[cMaNGOS](https://github.com/cmangos/mangos-classic)* and *[TrinityCore](https://github.com/TrinityCore/TrinityCore)* which seek to recreate the last patch of each expansion, this project aims to provide full content progression through Vanilla WoW.

## Project guidelines
- *Accuracy*: The point of an emulator is to recreate the functionality of that which it is emulating as closely as possible. Therefore any custom behaviour should be behind a config option and off by default.
- *DB Scripting*: Content should be separate from the core itself, so hardcoding scripts should be avoided where possible. When database scripting functionality is insufficient, we simply expand it.
- *Full progression*: The ultimate goal of this project is to have complete progression starting from patch 1.2 through 1.12. This means every piece of data must be marked with the patch in which it was added or changed to it's current state.
- *Tools are great*: Content creation should not require programming knowledge. We hope to eventually provide tools that allow for user-friendly editing of database scripts and content, with all data presented in human-readable form.

## Progression

What makes *vMaNGOS* special is that it aims to recreate all content changes throughout Vanilla WoW, starting all the way back from patch 1.2 to the 1.12 you are most familiar with. It is a project for the people who loved all of Vanilla and realize that 1.12 was only the end of the journey. In order to make this journey possible again, we've redesigned the way database data is stored and loaded. We've embraced the fact that things exist not only in space, but in time as well, so all content needs to have an extra field value indicating when this particular version of it came into existence. These values start from 0 for patch 1.2, and go to 10 for patch 1.12. The world server will automatically load the most appropriate version of the content, based on the current patch value that is set in the configuration file. All it takes to change content patches is this one setting. There are no extra SQL files that you need to run in order to change the patch.

Another big aspect of the progression system is game client progression. That means being able to play with the patch appropriate game clients, not just the 1.12 client which every other project sticks to. This endeavor is much more complicated than content progression, as it requires numerous corrections to the way the client and server communicate. As the game evolved and grew, new features and quality of life improvements were made, which necessitated changes to the way data was stored and handled. In order to support old versions of the client, all changes to the structure of packets exchanged between the server and the client need to be identified and their old implementations reconstructed. Another requirement for supporting old client versions is to make sure all content added after the targeted patch has the correct minimum patch assigned, as encountering a creature with a model added in a later patch for example will cause the client to crash. The upside of doing full client progression however is that you get to experience ALL aspects of that patch, including old talent trees and changes to spells.

You can see which clients are currently supported in the list below. Note that only the last version of each major patch is supported.

### Currently supported client builds
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

## Code History

The codebases is a continuation of the *Nost family* of projects, which branched from *[MaNGOS-Zero](https://github.com/mangoszero)* several years ago. It was developed privately by the *Nost team* until late 2016, when the source code was transferred to the *Elysium* Project which made it open source.

## Useful Links
- [Wiki](https://github.com/vmangos/wiki)
- [Discord](https://discord.gg/x9a2jt7)
- [Script Editor](https://github.com/brotalnia/scripteditor)
- [Script Converter](https://github.com/vmangos/ScriptConverter)
- [Database Repository](https://github.com/brotalnia/database)


<!--

// This section should go into an extra file

## What is what
The emulator has three major components. The first things you'll encounter are the binary files, the programs which make it possible to connect and play. Two there are, no more, no less. A login server (realmd) and a world server (mangosd). As its name implies, the login server handles player login, provides the list of available realms, and connects the client to the world server once he has successfully authenticated and chosen a realm. The world server is what makes the fun parts possible. It controls all in-game interactions and communicates with the player clients. It is what allows you to experience the world. It is the underlying laws of nature that govern how the world works. What the world contains is stored in the database. Without a database, the world would be empty, except for the naked players wandering around in the void. The database is the stuff you see in the world. It is the creatures you fight, the quests you go on, the items you struggle to acquire. The atoms the world is made of are defined in the database. All of this comes together to create the World of Warcraft that you play.

>