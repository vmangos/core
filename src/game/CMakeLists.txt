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
	AdvancedPlayerBotAI.h
	AdvancedPlayerBotAI.cpp
	AccountMgr.cpp
	AuraRemovalMgr.cpp
	AutoBroadCastMgr.cpp
	Camera.cpp
	CreatureGroups.cpp
	GameEventMgr.cpp
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
	pchdef.cpp
	PlayerDump.cpp
	QuestDef.cpp
	ReputationMgr.cpp
	ScriptMgr.cpp
	SkillDiscovery.cpp
	SkillExtraItems.cpp
	SocialMgr.cpp
	StatSystem.cpp
	UnitAuraProcHandler.cpp
	Weather.cpp
	World.cpp
	WorldSession.cpp
	AI/AggressorAI.cpp
	AI/CreatureAI.cpp
	AI/CreatureAIRegistry.cpp
	AI/CreatureAISelector.cpp
	AI/CreatureEventAI.cpp
	AI/CreatureEventAIMgr.cpp
	AI/GenericSpellAI.cpp
	AI/GuardAI.cpp
	AI/NullCreatureAI.cpp
	AI/PetAI.cpp
	AI/PlayerAI.cpp
	AI/ReactorAI.cpp
	AI/ScriptedAI.cpp
	AI/ScriptedEscortAI.cpp
	AI/ScriptedFollowerAI.cpp
	AI/ScriptedGuardAI.cpp
	AI/ScriptedInstance.cpp
	AI/ScriptedPetAI.cpp
	AI/TotemAI.cpp
	Anticheat/Anticheat.cpp
	AuctionHouse/AuctionHouseBotMgr.cpp
	AuctionHouse/AuctionHouseMgr.cpp
	AutoTesting/AutoTestingMgr.cpp
	AutoTesting/TestLoader.cpp
	AutoTesting/Tests/AurasStack.cpp
	AutoTesting/Tests/ChanneledSpells.cpp
	AutoTesting/Tests/Cinematics.cpp
	AutoTesting/Tests/ControlSpells.cpp
	AutoTesting/Tests/Generic.cpp
	AutoTesting/Tests/Mage.cpp
	AutoTesting/Tests/PacketBroadcaster.cpp
	AutoTesting/Tests/Shaman.cpp
	AutoTesting/Tests/Test.cpp
	AutoTesting/Tests/Warlock.cpp
	Battlegrounds/BattleGround.cpp
	Battlegrounds/BattleGroundAB.cpp
	Battlegrounds/BattleGroundAV.cpp
	Battlegrounds/BattleGroundMgr.cpp
	Battlegrounds/BattleGroundWS.cpp
	Chat/Channel.cpp
	Chat/ChannelMgr.cpp
	Chat/Chat.cpp
	CinematicStuff/CinematicStuff.cpp
	CinematicStuff/CinematicStuff.h
	Commands/debugcmds.cpp
	Commands/GMTicketCommands.cpp
	Commands/Level0.cpp
	Commands/Level1.cpp
	Commands/Level2.cpp
	Commands/Level3.cpp
	Commands/Nostalrius.cpp
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
	Handlers/LFGHandler.cpp
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
	LFG/LFGMgr.cpp
	Mail/Mail.cpp
	Mail/MassMailMgr.cpp
	MapNodes/AbstractPlayer.cpp
	MapNodes/GMCommands.cpp
	MapNodes/MapSocket.cpp
	MapNodes/MapSocketMgr.cpp
	MapNodes/MasterPlayer.cpp
	MapNodes/MasterPlayerChat.cpp
	MapNodes/NodeSession.cpp
	MapNodes/NodesMgr.cpp
	MapNodes/NodesOpcodes.cpp
	MapNodes/Handlers/GuidsSynchronization.cpp
	MapNodes/Handlers/Protocol.cpp
	MapNodes/Handlers/SessionTransfert.cpp
	MapNodes/Serializers/ItemSerializer.cpp
	MapNodes/Serializers/PlayerSerializer.cpp
	Maps/GridMap.cpp
	Maps/GridNotifiers.cpp
	Maps/GridSearchers.cpp
	Maps/GridStates.cpp
	Maps/InstanceData.cpp
	Maps/Map.cpp
	Maps/MapManager.cpp
	Maps/MapPersistentStateMgr.cpp
	Maps/MoveMap.cpp
	Maps/PathFinder.cpp
	Maps/ZoneScript.cpp
	Maps/ZoneScriptMgr.cpp
	Maps/Pool/PoolManager.cpp
	Movement/ConfusedMovementGenerator.cpp
	Movement/FearMovementGenerator.cpp
	Movement/FleeingMovementGenerator.cpp
	Movement/FollowerReference.cpp
	Movement/HomeMovementGenerator.cpp
	Movement/IdleMovementGenerator.cpp
	Movement/MotionMaster.cpp
	Movement/MovementGenerator.cpp
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
	Objects/Object.cpp
	Objects/Pet.cpp
	Objects/Player.cpp
	Objects/TemporarySummon.cpp
	Objects/Totem.cpp
	Objects/Unit.cpp
	Objects/UpdateData.cpp
	OutdoorPvP/OutdoorPvPEP.cpp
	OutdoorPvP/OutdoorPvPSI.cpp
	OutdoorPvP/Register.cpp
	PacketBroadcast/ChatCommands.cpp
	PacketBroadcast/MovementBroadcaster.cpp
	PacketBroadcast/PlayerBroadcaster.cpp
	PlayerBots/PlayerBotAI.cpp
	PlayerBots/PlayerBotMgr.cpp
	Protocol/Opcodes.cpp
	Protocol/WorldSocket.cpp
	Protocol/WorldSocketMgr.cpp
	Spells/Spell.cpp
	Spells/SpellAuras.cpp
	Spells/SpellEffects.cpp
	Spells/SpellEntry.cpp
	Spells/SpellMgr.cpp
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
	AccountMgr.h
	AuraRemovalMgr.h
	AutoBroadCastMgr.h
	Camera.h
	CreatureGroups.h
	Formulas.h
	GameEventMgr.h
	GMTicketMgr.h
	GossipDef.h
	HardcodedEvents.h
	HonorMgr.h
	InstanceStatistics.h
	ItemEnchantmentMgr.h
	Language.h
	LootMgr.h
	ObjectAccessor.h
	ObjectGridLoader.h
	ObjectGuid.h
	ObjectMgr.h
	ObjectPosSelector.h
	pchdef.h
	PlayerDump.h
	QuestDef.h
	ReputationMgr.h
	ScriptedGossip.h
	ScriptMgr.h
	SharedDefines.h
	SkillDiscovery.h
	SkillExtraItems.h
	SocialMgr.h
	UnitEvents.h
	Weather.h
	World.h
	WorldSession.h
	AI/AggressorAI.h
	AI/CreatureAI.h
	AI/CreatureAIImpl.h
	AI/CreatureAIRegistry.h
	AI/CreatureAISelector.h
	AI/CreatureEventAI.h
	AI/CreatureEventAIMgr.h
	AI/GameObjectAI.h
	AI/GuardAI.h
	AI/NullCreatureAI.h
	AI/PetAI.h
	AI/PlayerAI.h
	AI/ReactorAI.h
	AI/ScriptedAI.h
	AI/ScriptedEscortAI.h
	AI/ScriptedFollowerAI.h
	AI/ScriptedGameObject.h
	AI/ScriptedGossip.h
	AI/ScriptedGuardAI.h
	AI/ScriptedInstance.h
	AI/ScriptedPetAI.h
	AI/TotemAI.h
	Anticheat/Anticheat.h
	AuctionHouse/AuctionHouseBotMgr.h
	AuctionHouse/AuctionHouseMgr.h
	AutoTesting/AutoTestingMgr.h
	AutoTesting/Tests/TestPCH.h
	Battlegrounds/BattleGround.h
	Battlegrounds/BattleGroundAB.h
	Battlegrounds/BattleGroundAV.h
	Battlegrounds/BattleGroundMgr.h
	Battlegrounds/BattleGroundWS.h
	Chat/Channel.h
	Chat/ChannelMgr.h
	Chat/Chat.h
	Commands/Nostalrius.h
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
	Handlers/LFGHandler.h
	LFG/LFGMgr.h
	Mail/Mail.h
	Mail/MassMailMgr.h
	MapNodes/AbstractPlayer.h
	MapNodes/MapSocket.h
	MapNodes/MapSocketMgr.h
	MapNodes/MasterPlayer.h
	MapNodes/NodeSession.h
	MapNodes/NodesMgr.h
	MapNodes/NodesOpcodes.h
	MapNodes/Serializers/ItemSerializer.h
	MapNodes/Serializers/PlayerSerializer.h
	MapNodes/Serializers/Serializer.h
	Maps/Cell.h
	Maps/CellImpl.h
	Maps/GridDefines.h
	Maps/GridMap.h
	Maps/GridNotifiers.h
	Maps/GridNotifiersImpl.h
	Maps/GridSearchers.h
	Maps/GridStates.h
	Maps/InstanceData.h
	Maps/Map.h
	Maps/MapManager.h
	Maps/MapPersistentStateMgr.h
	Maps/MapReference.h
	Maps/MapReferenceImpl.h
	Maps/MapRefManager.h
	Maps/MoveMap.h
	Maps/MoveMapSharedDefines.h
	Maps/Path.h
	Maps/PathFinder.h
	Maps/ZoneScript.h
	Maps/ZoneScriptMgr.h
	Maps/Pool/PoolManager.h
	Movement/ConfusedMovementGenerator.h
	Movement/FearMovementGenerator.h
	Movement/FleeingMovementGenerator.h
	Movement/FollowerReference.h
	Movement/FollowerRefManager.h
	Movement/HomeMovementGenerator.h
	Movement/IdleMovementGenerator.h
	Movement/MotionMaster.h
	Movement/MovementGenerator.h
	Movement/MovementGeneratorImpl.h
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
	Objects/DynamicObject.h
	Objects/GameObject.h
	Objects/Item.h
	Objects/ItemPrototype.h
	Objects/Object.h
	Objects/Pet.h
	Objects/Player.h
	Objects/TemporarySummon.h
	Objects/Totem.h
	Objects/Unit.h
	Objects/UpdateData.h
	Objects/UpdateFields.h
	Objects/UpdateMask.h
	OutdoorPvP/OutdoorPvPEP.h
	OutdoorPvP/OutdoorPvPSI.h
	PacketBroadcast/MovementBroadcaster.h
	PacketBroadcast/PlayerBroadcaster.h
	PlayerBots/PlayerBotAI.h
	PlayerBots/PlayerBotMgr.h
	Protocol/Opcodes.h
	Protocol/WorldSocket.h
	Protocol/WorldSocketMgr.h
	Spells/Spell.h
	Spells/SpellAuraDefines.h
	Spells/SpellAuras.h
	Spells/SpellClassMask.h
	Spells/SpellEntry.h
	Spells/SpellMgr.h
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


if(WIN32)
  #allow exceptions in destructors
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /Zc:implicitNoexcept-")
  set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /D__ACE_INLINE__")
endif()

# Used in game ScriptMgr
if(SCRIPTS)
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

if(USE_ANTICHEAT)
  list(APPEND game_SRCS
      Anticheat/module/libanticheat.cpp
      Anticheat/module/libanticheat.h
      Anticheat/module/Antispam/Antispam.cpp
      Anticheat/module/Antispam/Antispam.h
      Anticheat/module/MovementAnticheat/Cheat.cpp
      Anticheat/module/MovementAnticheat/Cheat.h
      Anticheat/module/WardenAnticheat/Warden.cpp
      Anticheat/module/WardenAnticheat/Warden.h
      Anticheat/module/WardenAnticheat/WardenMac.cpp
      Anticheat/module/WardenAnticheat/WardenMac.h
      Anticheat/module/WardenAnticheat/WardenWin.cpp
      Anticheat/module/WardenAnticheat/WardenWin.h
      Anticheat/module/WardenAnticheat/WardenStorageMgr.cpp
      Anticheat/module/WardenAnticheat/WardenStorageMgr.h
      Anticheat/module/WardenAnticheat/WardenModuleMac.h
      Anticheat/module/WardenAnticheat/WardenModuleWin.h
      Anticheat/module/WardenAnticheat/WardenKeyGeneration.h
  )
endif()


include_directories(
  ${CMAKE_CURRENT_SOURCE_DIR}
  ${CMAKE_CURRENT_SOURCE_DIR}/AI
  ${CMAKE_CURRENT_SOURCE_DIR}/Anticheat
  ${CMAKE_CURRENT_SOURCE_DIR}/AuctionHouse
  ${CMAKE_CURRENT_SOURCE_DIR}/AutoTesting
  ${CMAKE_CURRENT_SOURCE_DIR}/Battlegrounds
  ${CMAKE_CURRENT_SOURCE_DIR}/Chat
  ${CMAKE_CURRENT_SOURCE_DIR}/CinematicStuff
  ${CMAKE_CURRENT_SOURCE_DIR}/Commands
  ${CMAKE_CURRENT_SOURCE_DIR}/Database
  ${CMAKE_CURRENT_SOURCE_DIR}/Group
  ${CMAKE_CURRENT_SOURCE_DIR}/Guild
  ${CMAKE_CURRENT_SOURCE_DIR}/Handlers
  ${CMAKE_CURRENT_SOURCE_DIR}/LFG
  ${CMAKE_CURRENT_SOURCE_DIR}/Mail
  ${CMAKE_CURRENT_SOURCE_DIR}/MapNodes
  ${CMAKE_CURRENT_SOURCE_DIR}/MapNodes/Handlers
  ${CMAKE_CURRENT_SOURCE_DIR}/MapNodes/Serializers
  ${CMAKE_CURRENT_SOURCE_DIR}/Maps
  ${CMAKE_CURRENT_SOURCE_DIR}/Maps/Pool
  ${CMAKE_CURRENT_SOURCE_DIR}/Movement
  ${CMAKE_CURRENT_SOURCE_DIR}/Movement/spline
  ${CMAKE_CURRENT_SOURCE_DIR}/Objects
  ${CMAKE_CURRENT_SOURCE_DIR}/OutdoorPvP
  ${CMAKE_CURRENT_SOURCE_DIR}/PacketBroadcast
  ${CMAKE_CURRENT_SOURCE_DIR}/PlayerBots
  ${CMAKE_CURRENT_SOURCE_DIR}/Protocol
  ${CMAKE_CURRENT_SOURCE_DIR}/Spells
  ${CMAKE_CURRENT_SOURCE_DIR}/Texts
  ${CMAKE_CURRENT_SOURCE_DIR}/Threat
  ${CMAKE_CURRENT_SOURCE_DIR}/Transports
  ${CMAKE_CURRENT_SOURCE_DIR}/vmap
  ${CMAKE_CURRENT_SOURCE_DIR}/Warden
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
  ${TBB_INCLUDE_DIRS}
  ${ACE_INCLUDE_DIR}
)

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

if(PCH)
  include_directories(${CMAKE_CURRENT_BINARY_DIR})
endif()

add_library(game STATIC
  ${game_SRCS}
)

target_link_libraries(game
  shared
  detour
)

#add_dependencies(game revision.h)

# Generate precompiled header
if(PCH)
  if(MSVC OR XCODE)
    if(MSVC)
      set(game_pch "${CMAKE_CURRENT_SOURCE_DIR}/pchdef.cpp")
    endif()
    add_native_precompiled_header(game ${CMAKE_CURRENT_SOURCE_DIR}/pchdef.h)
  elseif(CMAKE_COMPILER_IS_GNUCXX)
    add_precompiled_header(game ${CMAKE_CURRENT_SOURCE_DIR}/pchdef.h)
  endif()
endif()
