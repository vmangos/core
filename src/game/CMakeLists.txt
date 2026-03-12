# Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
# Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
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

set (game_SRCS
    AccountMgr.cpp
    AuraRemovalMgr.cpp
    AutoBroadCastMgr.cpp
    Camera.cpp
    Conditions.cpp
    CreatureGroups.cpp
    GameEventMgr.cpp
    GuardMgr.cpp
    GMTicketMgr.cpp
    GossipDef.cpp
    HardcodedEvents.cpp
    HonorMgr.cpp
    InstanceStatistics.cpp
    ItemEnchantmentMgr.cpp
    LootMgr.cpp
    ObjectAccessor.cpp
    ObjectGridLoader.cpp
    ObjectGuid.cpp
    ObjectMgr.cpp
    ObjectPosSelector.cpp
    PlayerDump.cpp
    QuestDef.cpp
    ReputationMgr.cpp
    ScriptMgr.cpp
    SniffFile.cpp
    SocialMgr.cpp
    StatSystem.cpp
    UnitAuraProcHandler.cpp
    Weather.cpp
    World.cpp
    AI/BasicAI.cpp
    AI/CreatureAI.cpp
    AI/CreatureAIRegistry.cpp
    AI/CreatureAISelector.cpp
    AI/CreatureEventAI.cpp
    AI/CreatureEventAIMgr.cpp
    AI/CritterAI.cpp
    AI/GuardAI.cpp
    AI/GuardEventAI.cpp
    AI/NullCreatureAI.cpp
    AI/PetAI.cpp
    AI/PetEventAI.cpp
    AI/PlayerAI.cpp
    AI/ScriptedAI.cpp
    AI/ScriptedEscortAI.cpp
    AI/ScriptedFollowerAI.cpp
    AI/ScriptedInstance.cpp
    AI/ScriptedPetAI.cpp
    AI/TotemAI.cpp
    Anticheat/Anticheat.cpp
    AuctionHouse/AuctionHouseBotMgr.cpp
    AuctionHouse/AuctionHouseMgr.cpp
    Battlegrounds/BattleGround.cpp
    Battlegrounds/BattleGroundAB.cpp
    Battlegrounds/BattleGroundAV.cpp
    Battlegrounds/BattleGroundMgr.cpp
    Battlegrounds/BattleGroundWS.cpp
    Chat/Channel.cpp
    Chat/ChannelMgr.cpp
    Chat/Chat.cpp
    Chat/AsyncCommandHandlers.cpp
    Chat/AbstractPlayer.cpp
    Chat/MasterPlayer.cpp
    Chat/MasterPlayerChat.cpp
    Commands/AccountCommands.cpp
    Commands/CharacterCommands.cpp
    Commands/CreatureCommands.cpp
    Commands/DebugCommands.cpp
    Commands/LookupCommands.cpp
    Commands/MiscCommands.cpp
    Commands/ObjectCommands.cpp
    Commands/ServerCommands.cpp
    Commands/TeleportCommands.cpp
    Commands/TicketCommands.cpp
    Commands/UnitCommands.cpp
    Database/CharacterDatabaseCache.cpp
    Database/CharacterDatabaseCleaner.cpp
    Database/DBCStores.cpp
    Database/SQLStorages.cpp
    Group/CreatureLinkingMgr.cpp
    Group/Group.cpp
    Group/GroupReference.cpp
    Guild/Guild.cpp
    Guild/GuildMgr.cpp
    Handlers/AddonHandler.cpp
    Handlers/AuctionHouseHandler.cpp
    Handlers/BattleGroundHandler.cpp
    Handlers/ChannelHandler.cpp
    Handlers/CharacterHandler.cpp
    Handlers/ChatHandler.cpp
    Handlers/CombatHandler.cpp
    Handlers/DuelHandler.cpp
    Handlers/GMTicketHandler.cpp
    Handlers/GroupHandler.cpp
    Handlers/GuildHandler.cpp
    Handlers/ItemHandler.cpp
    Handlers/LootHandler.cpp
    Handlers/MailHandler.cpp
    Handlers/MiscHandler.cpp
    Handlers/MovementHandler.cpp
    Handlers/NPCHandler.cpp
    Handlers/PetHandler.cpp
    Handlers/PetitionsHandler.cpp
    Handlers/QueryHandler.cpp
    Handlers/QuestHandler.cpp
    Handlers/SkillHandler.cpp
    Handlers/SpellHandler.cpp
    Handlers/TaxiHandler.cpp
    Handlers/TradeHandler.cpp
    LFG/LFGHandler.cpp
    LFG/LFGMgr.cpp
    LFG/LFGQueue.cpp
    Mail/Mail.cpp
    Mail/MassMailMgr.cpp
    Maps/GridMap.cpp
    Maps/GridNotifiers.cpp
    Maps/GridSearchers.cpp
    Maps/GridStates.cpp
    Maps/InstanceData.cpp
    Maps/Map.cpp
    Maps/MapManager.cpp
    Maps/MapPersistentStateMgr.cpp
    Maps/MapReference.cpp
    Maps/MoveMap.cpp
    Maps/PathFinder.cpp
    Maps/ScriptCommands.cpp
    Maps/ZoneScript.cpp
    Maps/ZoneScriptMgr.cpp
    Maps/Pool/PoolManager.cpp
    Movement/ConfusedMovementGenerator.cpp
    Movement/CyclicMovementGenerator.cpp
    Movement/FearMovementGenerator.cpp
    Movement/FleeingMovementGenerator.cpp
    Movement/FollowerReference.cpp
    Movement/HomeMovementGenerator.cpp
    Movement/IdleMovementGenerator.cpp
    Movement/MotionMaster.cpp
    Movement/MovementGenerator.cpp
    Movement/MovementPacketSender.cpp
    Movement/PointMovementGenerator.cpp
    Movement/RandomMovementGenerator.cpp
    Movement/TargetedMovementGenerator.cpp
    Movement/WaypointManager.cpp
    Movement/WaypointMovementGenerator.cpp
    Movement/spline/MoveSpline.cpp
    Movement/spline/MoveSplineInit.cpp
    Movement/spline/packet_builder.cpp
    Movement/spline/spline.cpp
    Movement/spline/util.cpp
    Objects/Bag.cpp
    Objects/Corpse.cpp
    Objects/Creature.cpp
    Objects/DynamicObject.cpp
    Objects/GameObject.cpp
    Objects/Item.cpp
    Objects/MirrorTimer.cpp
    Objects/Object.cpp
    Objects/Pet.cpp
    Objects/Player.cpp
    Objects/PlayerTaxi.cpp
    Objects/SpellCaster.cpp
    Objects/TemporarySummon.cpp
    Objects/Totem.cpp
    Objects/TradeData.cpp
    Objects/Unit.cpp
    Objects/UpdateData.cpp
    Objects/UpdateFields.cpp
    OutdoorPvP/OutdoorPvPEP.cpp
    OutdoorPvP/OutdoorPvPSI.cpp
    OutdoorPvP/Register.cpp
    PacketBroadcast/ChatCommands.cpp
    PacketBroadcast/MovementBroadcaster.cpp
    PacketBroadcast/PlayerBroadcaster.cpp
    Server/Protocol/Opcodes.cpp
    Server/WorldSession.cpp
    Server/WorldSocket.cpp
    Server/WorldSocketMgr.cpp
    Spells/Spell.cpp
    Spells/SpellAuras.cpp
    Spells/SpellEffects.cpp
    Spells/SpellEntry.cpp
    Spells/SpellMgr.cpp
    Spells/SpellModifier.cpp
    Spells/SpellModMgr.cpp
    Threat/HostileRefManager.cpp
    Threat/ThreatManager.cpp
    Transports/Transport.cpp
    Transports/TransportMgr.cpp
    vmap/BIH.cpp
    vmap/DynamicTree.cpp
    vmap/GameObjectModel.cpp
    vmap/MapTree.cpp
    vmap/ModelInstance.cpp
    vmap/TileAssembler.cpp
    vmap/VMapFactory.cpp
    vmap/VMapManager2.cpp
    vmap/WorldModel.cpp
    AccountData.h
    AccountMgr.h
    AuraRemovalMgr.h
    AutoBroadCastMgr.h
    Camera.h
    ClientDefines.h
    Conditions.h
    CreatureGroups.h
    Formulas.h
    GameEventMgr.h
    Geometry.h
    GuardMgr.h
    GMTicketMgr.h
    GossipDef.h
    HardcodedEvents.h
    HonorMgr.h
    InstanceStatistics.h
    ItemEnchantmentMgr.h
    Language.h
    LootMgr.h
    LoveIsInTheAir.h
    ObjectAccessor.h
    ObjectGridLoader.h
    ObjectGuid.h
    ObjectMgr.h
    ObjectPosSelector.h
    PacketProcessing.h
    PlayerDump.h
    QuestDef.h
    ReputationMgr.h
    ScriptedGossip.h
    ScriptMgr.h
    SharedDefines.h
    SniffFile.h
    SocialMgr.h
    UnitEvents.h
    Weather.h
    World.h
    WorldStates.h
    AI/BasicAI.h
    AI/CreatureAI.h
    AI/CreatureAIImpl.h
    AI/CreatureAIRegistry.h
    AI/CreatureAISelector.h
    AI/CreatureEventAI.h
    AI/CreatureEventAIMgr.h
    AI/CritterAI.h
    AI/GameObjectAI.h
    AI/GuardAI.h
    AI/GuardEventAI.h
    AI/NullCreatureAI.h
    AI/PetAI.h
    AI/PetEventAI.h
    AI/PlayerAI.h
    AI/ScriptedAI.h
    AI/ScriptedEscortAI.h
    AI/ScriptedFollowerAI.h
    AI/ScriptedGameObject.h
    AI/ScriptedInstance.h
    AI/ScriptedPetAI.h
    AI/TotemAI.h
    Anticheat/Anticheat.h
    Anticheat/MovementAnticheat/MovementAnticheat.cpp
    Anticheat/MovementAnticheat/MovementAnticheat.h
    Anticheat/WardenAnticheat/Warden.cpp
    Anticheat/WardenAnticheat/Warden.hpp
    Anticheat/WardenAnticheat/WardenKeyGenerator.h
    Anticheat/WardenAnticheat/WardenMac.cpp
    Anticheat/WardenAnticheat/WardenMac.hpp
    Anticheat/WardenAnticheat/WardenModule.cpp
    Anticheat/WardenAnticheat/WardenModule.hpp
    Anticheat/WardenAnticheat/WardenModuleMgr.cpp
    Anticheat/WardenAnticheat/WardenModuleMgr.hpp
    Anticheat/WardenAnticheat/WardenScan.cpp
    Anticheat/WardenAnticheat/WardenScan.hpp
    Anticheat/WardenAnticheat/WardenScanMgr.cpp
    Anticheat/WardenAnticheat/WardenScanMgr.hpp
    Anticheat/WardenAnticheat/WardenWin.cpp
    Anticheat/WardenAnticheat/WardenWin.hpp
    AuctionHouse/AuctionHouseBotMgr.h
    AuctionHouse/AuctionHouseMgr.h
    Battlegrounds/BattleGround.h
    Battlegrounds/BattleGroundAB.h
    Battlegrounds/BattleGroundAV.h
    Battlegrounds/BattleGroundMgr.h
    Battlegrounds/BattleGroundDefines.h
    Battlegrounds/BattleGroundWS.h
    Chat/Channel.h
    Chat/ChannelMgr.h
    Chat/Chat.h
    Chat/AsyncCommandHandlers.h
    Chat/AbstractPlayer.h
    Chat/MasterPlayer.h
    Chat/MonsterChatBuilder.h
    Database/CharacterDatabaseCache.h
    Database/CharacterDatabaseCleaner.h
    Database/DBCEnums.h
    Database/DBCfmt.h
    Database/DBCStores.h
    Database/DBCStructure.h
    Database/SQLStorages.h
    Group/CreatureLinkingMgr.h
    Group/Group.h
    Group/GroupReference.h
    Group/GroupRefManager.h
    Guild/Guild.h
    Guild/GuildMgr.h
    Handlers/AddonHandler.h
    Handlers/NPCHandler.h
    LFG/LFGDefines.h
    LFG/LFGMgr.h
    LFG/LFGQueue.h
    Mail/Mail.h
    Mail/MassMailMgr.h
    Maps/Cell.h
    Maps/CellImpl.h
    Maps/GridDefines.h
    Maps/GridMap.h
    Maps/GridMapDefines.h
    Maps/GridNotifiers.h
    Maps/GridNotifiersImpl.h
    Maps/GridSearchers.h
    Maps/GridStates.h
    Maps/InstanceData.h
    Maps/Map.h
    Maps/MapManager.h
    Maps/MapPersistentStateMgr.h
    Maps/MapReference.h
    Maps/MapRefManager.h
    Maps/MoveMap.h
    Maps/MoveMapSharedDefines.h
    Maps/Path.h
    Maps/PathFinder.h
    Maps/ScriptCommands.h
    Maps/ZoneScript.h
    Maps/ZoneScriptMgr.h
    Maps/Pool/PoolManager.h
    Movement/ConfusedMovementGenerator.h
    Movement/CyclicMovementGenerator.h
    Movement/FearMovementGenerator.h
    Movement/FleeingMovementGenerator.h
    Movement/FollowerReference.h
    Movement/FollowerRefManager.h
    Movement/HomeMovementGenerator.h
    Movement/IdleMovementGenerator.h
    Movement/MotionMaster.h
    Movement/MovementGenerator.h
    Movement/MovementGeneratorImpl.h
    Movement/MovementPacketSender.h
    Movement/PointMovementGenerator.h
    Movement/RandomMovementGenerator.h
    Movement/TargetedMovementGenerator.h
    Movement/WaypointManager.h
    Movement/WaypointMovementGenerator.h
    Movement/spline/MoveSpline.h
    Movement/spline/MoveSplineFlag.h
    Movement/spline/MoveSplineInit.h
    Movement/spline/MoveSplineInitArgs.h
    Movement/spline/packet_builder.h
    Movement/spline/spline.h
    Movement/spline/spline.impl.h
    Movement/spline/typedefs.h
    Objects/Bag.h
    Objects/Corpse.h
    Objects/Creature.h
    Objects/CreatureDefines.h
    Objects/DynamicObject.h
    Objects/GameObject.h
    Objects/GameObjectDefines.h
    Objects/Item.h
    Objects/ItemDefines.h
    Objects/ItemPrototype.h
    Objects/MirrorTimer.h
    Objects/MovementInfo.h
    Objects/Object.h
    Objects/ObjectDefines.h
    Objects/Pet.h
    Objects/Player.h
    Objects/PlayerTaxi.h
    Objects/SpellCaster.h
    Objects/TemporarySummon.h
    Objects/Totem.h
    Objects/TradeData.h
    Objects/TransactionLog.h
    Objects/Unit.h
    Objects/UnitDefines.h
    Objects/UpdateData.h
    Objects/UpdateFields.h
    Objects/UpdateMask.h
    OutdoorPvP/OutdoorPvPEP.h
    OutdoorPvP/OutdoorPvPSI.h
    PacketBroadcast/MovementBroadcaster.h
    PacketBroadcast/PlayerBroadcaster.h
    Server/Protocol/Opcodes.h
    Server/WorldPacket.h
    Server/WorldSession.h
    Server/WorldSocket.h
    Server/WorldSocketMgr.h
    Spells/Spell.h
    Spells/SpellAuraDefines.h
    Spells/SpellAuras.h
    Spells/SpellClassMask.h
    Spells/SpellDefines.h
    Spells/SpellEntry.h
    Spells/SpellMgr.h
    Spells/SpellModifier.h
    Spells/SpellModMgr.h
    Threat/HostileRefManager.h
    Threat/ThreatManager.h
    Transports/Transport.h
    Transports/TransportMgr.h
    vmap/BIH.h
    vmap/BIHWrap.h
    vmap/DynamicTree.h
    vmap/GameObjectModel.h
    vmap/IVMapManager.h
    vmap/MapTree.h
    vmap/ModelInstance.h
    vmap/RegularGrid.h
    vmap/TileAssembler.h
    vmap/VMapDefinitions.h
    vmap/VMapFactory.h
    vmap/VMapManager2.h
    vmap/VMapTools.h
    vmap/WorldModel.h

)

if((${CMAKE_VERSION} VERSION_LESS "3.16") OR USE_PCH_OLD)
  list(APPEND game_SRCS
      pchdef.cpp
      pchdef.h
  )
  include_directories(${CMAKE_CURRENT_BINARY_DIR})
endif()

if(WIN32)
  #allow exceptions in destructors
  if(MSVC)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /Zc:implicitNoexcept-")
  elseif(MINGW)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fpermissive")
  endif()
endif()

# Used in game ScriptMgr
if(USE_SCRIPTS)
  list(APPEND game_SRCS
      ${CMAKE_SOURCE_DIR}/src/scripts/ScriptLoader.cpp
      ${CMAKE_SOURCE_DIR}/src/scripts/ScriptLoader.h
  )
else()
  list(APPEND game_SRCS
      ${CMAKE_SOURCE_DIR}/src/scripts/ScriptLoader_noscripts.cpp
      ${CMAKE_SOURCE_DIR}/src/scripts/ScriptLoader.h
  )
endif()

include_directories(
  ${CMAKE_CURRENT_SOURCE_DIR}
  ${CMAKE_CURRENT_SOURCE_DIR}/AI
  ${CMAKE_CURRENT_SOURCE_DIR}/Anticheat
  ${CMAKE_CURRENT_SOURCE_DIR}/AuctionHouse
  ${CMAKE_CURRENT_SOURCE_DIR}/Battlegrounds
  ${CMAKE_CURRENT_SOURCE_DIR}/Chat
  ${CMAKE_CURRENT_SOURCE_DIR}/Commands
  ${CMAKE_CURRENT_SOURCE_DIR}/Database
  ${CMAKE_CURRENT_SOURCE_DIR}/Group
  ${CMAKE_CURRENT_SOURCE_DIR}/Guild
  ${CMAKE_CURRENT_SOURCE_DIR}/Handlers
  ${CMAKE_CURRENT_SOURCE_DIR}/LFG
  ${CMAKE_CURRENT_SOURCE_DIR}/Mail
  ${CMAKE_CURRENT_SOURCE_DIR}/Maps
  ${CMAKE_CURRENT_SOURCE_DIR}/Maps/Pool
  ${CMAKE_CURRENT_SOURCE_DIR}/Movement
  ${CMAKE_CURRENT_SOURCE_DIR}/Movement/spline
  ${CMAKE_CURRENT_SOURCE_DIR}/Objects
  ${CMAKE_CURRENT_SOURCE_DIR}/OutdoorPvP
  ${CMAKE_CURRENT_SOURCE_DIR}/PacketBroadcast
  ${CMAKE_CURRENT_SOURCE_DIR}/Server
  ${CMAKE_CURRENT_SOURCE_DIR}/Server/Protocol
  ${CMAKE_CURRENT_SOURCE_DIR}/Spells
  ${CMAKE_CURRENT_SOURCE_DIR}/Threat
  ${CMAKE_CURRENT_SOURCE_DIR}/Transports
  ${CMAKE_CURRENT_SOURCE_DIR}/vmap
  ${CMAKE_SOURCE_DIR}/src/scripts
  ${CMAKE_SOURCE_DIR}/src/scripts/PrecompiledHeaders
  ${CMAKE_SOURCE_DIR}/dep/include/g3dlite
  ${CMAKE_SOURCE_DIR}/dep/recastnavigation/Detour
  ${CMAKE_SOURCE_DIR}/dep/recastnavigation
  ${CMAKE_SOURCE_DIR}/dep/include
  ${CMAKE_SOURCE_DIR}/src/framework
  ${CMAKE_SOURCE_DIR}/src/framework/Network
  ${CMAKE_SOURCE_DIR}/src/shared
  ${CMAKE_BINARY_DIR}
  ${CMAKE_BINARY_DIR}/src/shared
  ${MYSQL_INCLUDE_DIR}
  ${OPENSSL_INCLUDE_DIR}
  ${ZLIB_INCLUDE_DIRS}
)

set(PLAYERBOTS_PRIVATE_INCLUDE_DIRS
  ${CMAKE_CURRENT_SOURCE_DIR}/PlayerBotsCompat
  ${CMAKE_CURRENT_SOURCE_DIR}/PlayerBotsCompat/TrinityStubs
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Base
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Base/Actions
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Base/Strategy
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Base/Trigger
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Base/Value
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Bot
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Bot/Debug
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Bot/Cmd
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Bot/Engine
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Bot/Engine/Action
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Bot/Engine/Strategy
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Bot/Engine/Trigger
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Bot/Engine/Value
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Bot/Factory
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Db
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Mgr
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Mgr/Guild
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Mgr/Item
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Mgr/Move
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Mgr/Security
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Mgr/Talent
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Mgr/Text
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Mgr/Travel
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Script
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Script/WorldThr
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Util
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Bot/Engine/WorldPacket
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Dk
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Dk/Action
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Dk/Strategy
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Dk/Trigger
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Druid
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Druid/Action
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Druid/Strategy
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Druid/Trigger
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Hunter
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Hunter/Action
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Hunter/Strategy
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Hunter/Trigger
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Mage
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Mage/Action
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Mage/Strategy
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Mage/Trigger
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Paladin
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Paladin/Action
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Paladin/Strategy
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Paladin/Trigger
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Priest
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Priest/Action
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Priest/Strategy
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Priest/Trigger
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Rogue
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Rogue/Action
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Rogue/Strategy
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Rogue/Trigger
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Shaman
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Shaman/Action
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Shaman/Strategy
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Shaman/Trigger
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Warlock
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Warlock/Action
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Warlock/Strategy
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Warlock/Trigger
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Warrior
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Warrior/Action
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Warrior/Strategy
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Class/Warrior/Trigger
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Dungeon
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/World/Rpg
)

# Add all Dungeon/Raid subdirectories dynamically for bot-only includes.
file(GLOB_RECURSE DUNGEON_DIRS
  LIST_DIRECTORIES true
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Dungeon/*
)
foreach(DIR ${DUNGEON_DIRS})
  if(IS_DIRECTORY ${DIR})
    list(APPEND PLAYERBOTS_PRIVATE_INCLUDE_DIRS ${DIR})
  endif()
endforeach()

file(GLOB_RECURSE RAID_DIRS
  LIST_DIRECTORIES true
  ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/Ai/Raid/*
)
foreach(DIR ${RAID_DIRS})
  if(IS_DIRECTORY ${DIR})
    list(APPEND PLAYERBOTS_PRIVATE_INCLUDE_DIRS ${DIR})
  endif()
endforeach()

if(NOT USE_STD_MALLOC)
  include_directories(
    ${TBB_INCLUDE_DIRS}
  )
endif()

if(WIN32)
  include_directories(
    ${CMAKE_SOURCE_DIR}/dep/windows/include
  )
endif()

source_group("Object"
  REGULAR_EXPRESSION .*
)

source_group("World/Handlers"
  REGULAR_EXPRESSION Mgr|Handler|Manager|Cell|Channel|Chat|Gossip|Grid|Instance|Map|Path|Pool|Script|Skill|Transports|Update|Weather|World
)

source_group("Motion generators"
  REGULAR_EXPRESSION MoveMap|MoveMapSharedDefines|Movement|Holder|Motion|Traveller
)

source_group("Server"
  REGULAR_EXPRESSION Socket|Session|Opcodes|DBC
  FILES
    SharedDefines.h
)

source_group("Chat Commands"
  REGULAR_EXPRESSION Level[0-9]
  FILES
    debugcmds.cpp
)

source_group("Tool"
  REGULAR_EXPRESSION DatabaseCleaner|Language|PlayerDump
)

source_group("References"
  REGULAR_EXPRESSION Reference|RefManager|ThreatManager
)

source_group("Anticheat"
  REGULAR_EXPRESSION Anticheat
)

# ModPlayerBots files
file(GLOB_RECURSE MODPLAYERBOTS_SRCS
    ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/*.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/ModPlayerBots/*.h
)

# Disable battleground/arena bot subsystem files for vMaNGOS porting.
list(FILTER MODPLAYERBOTS_SRCS EXCLUDE REGEX ".*/ModPlayerBots/Ai/Base/Actions/BattleGroundTactics\\.cpp$")
list(FILTER MODPLAYERBOTS_SRCS EXCLUDE REGEX ".*/ModPlayerBots/Ai/Base/Actions/BattleGroundJoinAction\\.cpp$")
list(FILTER MODPLAYERBOTS_SRCS EXCLUDE REGEX ".*/ModPlayerBots/Ai/Base/Actions/AcceptBattlegroundInvitationAction\\.cpp$")
list(FILTER MODPLAYERBOTS_SRCS EXCLUDE REGEX ".*/ModPlayerBots/Ai/Base/Actions/ArenaTeamActions\\.cpp$")
list(FILTER MODPLAYERBOTS_SRCS EXCLUDE REGEX ".*/ModPlayerBots/Ai/Base/Strategy/BattlegroundStrategy\\.cpp$")
list(FILTER MODPLAYERBOTS_SRCS EXCLUDE REGEX ".*/ModPlayerBots/Ai/Base/Actions/VehicleActions\\.cpp$")
list(FILTER MODPLAYERBOTS_SRCS EXCLUDE REGEX ".*/ModPlayerBots/Ai/Base/Actions/WhoAction\\.cpp$")
list(FILTER MODPLAYERBOTS_SRCS EXCLUDE REGEX ".*/ModPlayerBots/Ai/Base/Actions/WipeAction\\.cpp$")
list(FILTER MODPLAYERBOTS_SRCS EXCLUDE REGEX ".*/ModPlayerBots/Ai/Base/Actions/WorldBuffAction\\.cpp$")
list(FILTER MODPLAYERBOTS_SRCS EXCLUDE REGEX ".*/ModPlayerBots/Bot/Cmd/PlayerbotCommandServer\\.cpp$")

# Trial of the Champion — Vehicle-dependent dungeon, not available in Vanilla
list(FILTER MODPLAYERBOTS_SRCS EXCLUDE REGEX ".*/ModPlayerBots/Ai/Dungeon/TrialOfTheChampion/Action/TrialOfTheChampionActions\\.cpp$")
list(FILTER MODPLAYERBOTS_SRCS EXCLUDE REGEX ".*/ModPlayerBots/Ai/Dungeon/TrialOfTheChampion/Trigger/TrialOfTheChampionTriggers\\.cpp$")
list(FILTER MODPLAYERBOTS_SRCS EXCLUDE REGEX ".*/ModPlayerBots/Ai/Dungeon/TrialOfTheChampion/Multiplier/TrialOfTheChampionMultipliers\\.cpp$")
list(FILTER MODPLAYERBOTS_SRCS EXCLUDE REGEX ".*/ModPlayerBots/Ai/Dungeon/TrialOfTheChampion/Strategy/TrialOfTheChampionStrategy\\.cpp$")

# Non-Vanilla raids — TBC/WotLK content, not available in Vanilla
list(FILTER MODPLAYERBOTS_SRCS EXCLUDE REGEX ".*/ModPlayerBots/Ai/Raid/GruulsLair/.*\\.cpp$")
list(FILTER MODPLAYERBOTS_SRCS EXCLUDE REGEX ".*/ModPlayerBots/Ai/Raid/Karazhan/.*\\.cpp$")
list(FILTER MODPLAYERBOTS_SRCS EXCLUDE REGEX ".*/ModPlayerBots/Ai/Raid/Magtheridon/.*\\.cpp$")
list(FILTER MODPLAYERBOTS_SRCS EXCLUDE REGEX ".*/ModPlayerBots/Ai/Raid/SerpentshrineCavern/.*\\.cpp$")
list(FILTER MODPLAYERBOTS_SRCS EXCLUDE REGEX ".*/ModPlayerBots/Ai/Raid/ObsidianSanctum/.*\\.cpp$")
list(FILTER MODPLAYERBOTS_SRCS EXCLUDE REGEX ".*/ModPlayerBots/Ai/Raid/VaultOfArchavon/.*\\.cpp$")
list(FILTER MODPLAYERBOTS_SRCS EXCLUDE REGEX ".*/ModPlayerBots/Ai/Raid/Ulduar/.*\\.cpp$")
list(FILTER MODPLAYERBOTS_SRCS EXCLUDE REGEX ".*/ModPlayerBots/Ai/Raid/Icecrown/.*\\.cpp$")
list(FILTER MODPLAYERBOTS_SRCS EXCLUDE REGEX ".*/ModPlayerBots/Ai/Raid/EyeOfEternity/.*\\.cpp$")

# Keep Trinity-only guild task implementation excluded in Vanilla build.
list(FILTER MODPLAYERBOTS_SRCS EXCLUDE REGEX ".*/ModPlayerBots/Mgr/Guild/GuildTaskMgr\\.cpp$")

# Death Knight is WotLK-only and should not be part of the Vanilla build.
list(FILTER MODPLAYERBOTS_SRCS EXCLUDE REGEX ".*/ModPlayerBots/Ai/Class/Dk/.*\\.(cpp|h)$")

# Add PlayerBotsCompat stubs that need compilation
set(PLAYERBOTS_COMPAT_SRCS
    ${CMAKE_CURRENT_SOURCE_DIR}/PlayerBotsCompat/ChatBotCommandsCompat.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/PlayerBotsCompat/TrinityStubs/GameGraveyard.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/PlayerBotsCompat/TrinityStubs/ModPlayerBotsActionStubs.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/PlayerBotsCompat/TrinityStubs/PlayerbotCommandServerStub.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/PlayerBotsCompat/TrinityStubs/StoreStubs.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/PlayerBotsCompat/PlayerBotMgrCompat.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/PlayerBotsCompat/GuildTaskMgrCompat.cpp
)

add_library(game STATIC
  ${game_SRCS}
)

add_library(playerbots STATIC
  ${MODPLAYERBOTS_SRCS}
  ${PLAYERBOTS_COMPAT_SRCS}
)

SET_TARGET_PROPERTIES (game PROPERTIES FOLDER "Game Libs")
SET_TARGET_PROPERTIES (playerbots PROPERTIES FOLDER "Game Libs")

target_link_libraries(game
  shared
  Detour
)

target_link_libraries(playerbots
  shared
  Detour
)

target_include_directories(playerbots PRIVATE
  ${PLAYERBOTS_PRIVATE_INCLUDE_DIRS}
)

#add_dependencies(game revision.h)

# Generate precompiled header
if((${CMAKE_VERSION} VERSION_LESS "3.16") OR USE_PCH_OLD)
  set_source_files_properties(${PLAYERBOTS_COMPAT_SRCS} PROPERTIES
      COMPILE_FLAGS "-include ${CMAKE_CURRENT_SOURCE_DIR}/PlayerBotsCompat/Preinclude.h"
  )

  set_source_files_properties(${MODPLAYERBOTS_SRCS} PROPERTIES
      COMPILE_FLAGS "-include ${CMAKE_CURRENT_SOURCE_DIR}/PlayerBotsCompat/Preinclude.h"
  )

  if(USE_PCH)
    if(MSVC OR XCODE)
      if(MSVC)
        set(game_pch "${CMAKE_CURRENT_SOURCE_DIR}/pchdef.cpp")
      endif()
      add_native_precompiled_header(game ${CMAKE_CURRENT_SOURCE_DIR}/pchdef.h)
    elseif(CMAKE_COMPILER_IS_GNUCXX)
      add_precompiled_header(game ${CMAKE_CURRENT_SOURCE_DIR}/pchdef.h)
    endif()
  endif()
else()
  if(NOT USE_PCH)
    set_source_files_properties(${PLAYERBOTS_COMPAT_SRCS} PROPERTIES
        COMPILE_FLAGS "-include ${CMAKE_CURRENT_SOURCE_DIR}/PlayerBotsCompat/Preinclude.h"
    )

    set_source_files_properties(${MODPLAYERBOTS_SRCS} PROPERTIES
        COMPILE_FLAGS "-include ${CMAKE_CURRENT_SOURCE_DIR}/PlayerBotsCompat/Preinclude.h"
    )
  endif()

  if(USE_PCH)
    target_precompile_headers(game PRIVATE
      Server/WorldSocket.h
      ../shared/Common.h
      Maps/MapManager.h
      ../shared/Log.h
      ObjectAccessor.h
      ObjectGuid.h
      Database/SQLStorages.h
      Server/Protocol/Opcodes.h
      SharedDefines.h
      Guild/GuildMgr.h
      ObjectMgr.h
      ScriptMgr.h
    )

    target_precompile_headers(playerbots PRIVATE
      PlayerBotsCompat/Preinclude.h
    )
  endif()
endif()
