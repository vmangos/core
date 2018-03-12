/*
* Copyright (C) 2017-2018 LightsHope <https://github.com/lightshope>
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

#include "Map.h"
#include "ScriptMgr.h"
#include "GridSearchers.h"
#include "InstanceData.h"
#include "CreatureEventAI.h"
#include "CreatureAIImpl.h"
#include "GameEventMgr.h"

// Script commands should return false by default.
// If they return true the rest of the script is aborted.

inline bool ShouldAbortScript(const ScriptInfo& script)
{
    return (script.raw.data[4] & SF_GENERAL_ABORT_ON_FAILURE);
}

// SCRIPT_COMMAND_TALK (0)
bool Map::ScriptCommand_Talk(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    WorldObject* pSource = source;

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_TALK (script id %u) call for a NULL or non-worldobject source (TypeId: %u), skipping.", script.id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    Unit* unitTarget = ToUnit(target);
    int32 textId = script.talk.textId[0];

    // May have text for random
    if (script.talk.textId[1])
    {
        int i = 2;
        for (; i < MAX_TEXT_ID; ++i)
        {
            if (!script.talk.textId[i])
                break;
        }

        // Use one random
        textId = script.talk.textId[rand() % i];
    }

    DoScriptText(textId, pSource, unitTarget, script.talk.chatType);

    return false;
}

// SCRIPT_COMMAND_EMOTE (1)
bool Map::ScriptCommand_Emote(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Unit* pSource = ToUnit(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_EMOTE (script id %u) call for a NULL or non-worldobject source (TypeId: %u), skipping.", script.id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    // find the emote
    std::vector<uint32> emotes;
    emotes.push_back(script.emote.emoteId);
    for (int i = 0; i < MAX_EMOTE_ID; ++i)
    {
        if (!script.emote.randomEmotes[i])
            continue;
        emotes.push_back(uint32(script.emote.randomEmotes[i]));
    }

    pSource->HandleEmote(emotes[urand(0, emotes.size() - 1)]);

    return false;
}

// SCRIPT_COMMAND_FIELD_SET(2)
bool Map::ScriptCommand_FieldSet(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    if (!source)
    {
        sLog.outError("SCRIPT_COMMAND_FIELD_SET (script id %u) call for a NULL object, skipping.", script.id);
        return ShouldAbortScript(script);
    }

    if (script.setField.fieldId <= OBJECT_FIELD_ENTRY || script.setField.fieldId >= source->GetValuesCount())
    {
        sLog.outError("SCRIPT_COMMAND_FIELD_SET (script id %u) call for wrong field %u (max count: %u) in object (TypeId: %u).",
            script.id, script.setField.fieldId, source->GetValuesCount(), source->GetTypeId());
        return ShouldAbortScript(script);
    }

    source->SetUInt32Value(script.setField.fieldId, script.setField.fieldValue);

    return false;
}

// SCRIPT_COMMAND_MOVE_TO (3)
bool Map::ScriptCommand_MoveTo(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Creature* pSource = ToCreature(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_MOVE_TO (script id %u) call for a NULL or non-creature source (TypeId: %u), skipping.", script.id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    float x = script.x;
    float y = script.y;
    float z = script.z;

    if (script.moveTo.coordinatesType)
    {
        if (WorldObject* pTarget = target)
        {
            switch (script.moveTo.coordinatesType)
            {
                case SO_MOVETO_COORDINATES_RELATIVE_TO_TARGET:
                {
                    // Coordinates are added to those of the target.
                    x += pTarget->GetPositionX();
                    y += pTarget->GetPositionY();
                    z += pTarget->GetPositionZ();
                    break;
                }
                case SO_MOVETO_COORDINATES_DISTANCE_FROM_TARGET:
                {
                    // X is distance from the target.
                    float distance = x;
                    pTarget->GetNearPoint(pSource, x, y, z, 0, distance, frand(0, 2 * M_PI_F));
                    break;
                }
            }
        }
        else
        {
            sLog.outError("SCRIPT_COMMAND_MOVE_TO (script id %u) call with datalong = %u for a NULL or non-worldobject target, skipping.", script.id, script.moveTo.coordinatesType);
            return ShouldAbortScript(script);
        }
    }

    // Only move if we can move.
    if (pSource->hasUnitState(UNIT_STAT_NOT_MOVE) && !(script.moveTo.flags & SF_MOVETO_FORCED))
        return ShouldAbortScript(script);

    float speed = script.moveTo.travelTime != 0 ? pSource->GetDistance(x, y, z) / ((float)script.moveTo.travelTime * 0.001f) : 0.0f;
    float orientation = script.o ? script.o : -10.0f;

    if (script.moveTo.flags & SF_MOVETO_POINT_MOVEGEN)
        pSource->GetMotionMaster()->MovePoint(0, x, y, z, script.moveTo.movementOptions, speed, orientation);
    else
        pSource->MonsterMoveWithSpeed(x, y, z, orientation, speed, script.moveTo.movementOptions);

    return false;
}

// SCRIPT_COMMAND_MODIFY_FLAGS (4)
bool Map::ScriptCommand_ModifyFlags(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    if (!source)
    {
        sLog.outError("SCRIPT_COMMAND_MODIFY_FLAGS (script id %u) call for a NULL object, skipping.", script.id);
        return ShouldAbortScript(script);
    }

    if (script.modFlags.fieldId <= OBJECT_FIELD_ENTRY || script.modFlags.fieldId >= source->GetValuesCount())
    {
        sLog.outError("SCRIPT_COMMAND_MODIFY_FLAGS (script id %u) call for wrong field %u (max count: %u) in object (TypeId: %u).",
            script.id, script.modFlags.fieldId, source->GetValuesCount(), source->GetTypeId());
        return ShouldAbortScript(script);
    }

    // Add Flags
    if (script.modFlags.mode == SO_MODIFYFLAGS_SET)
        source->SetFlag(script.modFlags.fieldId, script.modFlags.fieldValue);
    // Remove Flags
    else if (script.modFlags.mode == SO_MODIFYFLAGS_REMOVE)
        source->RemoveFlag(script.modFlags.fieldId, script.modFlags.fieldValue);
    // Toggle Flags
    else
    {
        if (source->HasFlag(script.modFlags.fieldId, script.modFlags.fieldValue))
            source->RemoveFlag(script.modFlags.fieldId, script.modFlags.fieldValue);
        else
            source->SetFlag(script.modFlags.fieldId, script.modFlags.fieldValue);
    }

    return false;
}

// SCRIPT_COMMAND_INTERRUPT_CASTS (5)
bool Map::ScriptCommand_InterruptCasts(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Unit* pSource = ToUnit(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_INTERRUPT_CAST (script id %u) call for a NULL or non-unit source (TypeId: %u), skipping.", script.id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    pSource->InterruptNonMeleeSpells(script.interruptCasts.withDelayed, script.interruptCasts.spellId);

    return false;
}

// SCRIPT_COMMAND_TELEPORT_TO (6)
bool Map::ScriptCommand_TeleportTo(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Unit* pSource = ToUnit(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_TELEPORT_TO (script id %u) call for a NULL or non-unit source (TypeId: %u), skipping.", script.id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    if (pSource->GetTypeId() == TYPEID_PLAYER)
        (static_cast<Player*>(pSource))->TeleportTo(script.teleportTo.mapId, script.x, script.y, script.z, script.o, script.teleportTo.teleportOptions);
    else
        pSource->NearTeleportTo(script.x, script.y, script.z, script.o, script.teleportTo.teleportOptions);

    return false;
}

// SCRIPT_COMMAND_QUEST_EXPLORED (7)
bool Map::ScriptCommand_QuestExplored(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    // when script called for item spell casting then target == (unit or GO) and source is player
    Player* pPlayer;
    WorldObject* pWorldObject;

    if (!(((pPlayer = ToPlayer(target)) && (pWorldObject = source)) || ((pPlayer = ToPlayer(source)) && (pWorldObject = target))))
    {
        sLog.outError("SCRIPT_COMMAND_QUEST_EXPLORED (script id %u) call for a NULL player, skipping.", script.id);
        return ShouldAbortScript(script);
    }

    if (pWorldObject->GetTypeId() != TYPEID_UNIT && pWorldObject->GetTypeId() != TYPEID_GAMEOBJECT && pWorldObject->GetTypeId() != TYPEID_PLAYER)
    {
        sLog.outError("SCRIPT_COMMAND_QUEST_EXPLORED (script id %u) call for a non-creature, non-gameobject or non-player (TypeId: %u), skipping.", script.id, pWorldObject->GetTypeId());
        return ShouldAbortScript(script);
    }

    // quest id and flags checked at script loading
    if ((pWorldObject->GetTypeId() != TYPEID_UNIT || (static_cast<Unit*>(pWorldObject))->isAlive()) &&
        (script.questExplored.distance == 0 || pWorldObject->IsWithinDistInMap(pPlayer, float(script.questExplored.distance))))
        pPlayer->AreaExploredOrEventHappens(script.questExplored.questId);
    else
        pPlayer->FailQuest(script.questExplored.questId);

    return false;
}

// SCRIPT_COMMAND_KILL_CREDIT (8)
bool Map::ScriptCommand_KillCredit(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Player* pSource;

    // accept player in any one from target/source arg
    if ((pSource = ToPlayer(target)) || (pSource = ToPlayer(source)))
    {
        if (script.killCredit.isGroupCredit)
            pSource->RewardPlayerAndGroupAtEvent(script.killCredit.creatureEntry, pSource);
        else
            pSource->KilledMonsterCredit(script.killCredit.creatureEntry);
    }
    else
    {
        sLog.outError("SCRIPT_COMMAND_KILL_CREDIT (script id %u) call for a NULL object, skipping.", script.id);
        return ShouldAbortScript(script);
    }
    

    return false;
}

// SCRIPT_COMMAND_RESPAWN_GAMEOBJECT (9)
bool Map::ScriptCommand_RespawnGameObject(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    GameObject *pGo = nullptr;
    uint32 guidlow = script.respawnGo.goGuid;

    if (guidlow)
    {
        GameObjectData const* goData = sObjectMgr.GetGOData(guidlow);
        if (!goData)
            return ShouldAbortScript(script); // checked at load

        pGo = GetGameObject(ObjectGuid(HIGHGUID_GAMEOBJECT, goData->id, guidlow));
    }
    else if (target && target->GetTypeId() == TYPEID_GAMEOBJECT)
        pGo = static_cast<GameObject*>(target);
    else if (source && source->GetTypeId() == TYPEID_GAMEOBJECT)
        pGo = static_cast<GameObject*>(source);

    if (!pGo)
    {
        sLog.outError("SCRIPT_COMMAND_RESPAWN_GAMEOBJECT (script id %u) failed for gameobject(guid: %u).", script.id, guidlow);
        return ShouldAbortScript(script);
    }

    int32 time_to_despawn = script.respawnGo.despawnDelay < 5 ? 5 : script.respawnGo.despawnDelay;

    if (pGo->GetGoType() == GAMEOBJECT_TYPE_FISHINGNODE ||
        pGo->GetGoType() == GAMEOBJECT_TYPE_DOOR ||
        pGo->GetGoType() == GAMEOBJECT_TYPE_BUTTON ||
        pGo->GetGoType() == GAMEOBJECT_TYPE_TRAP)
    {
        sLog.outError("SCRIPT_COMMAND_RESPAWN_GAMEOBJECT (script id %u) can not be used with gameobject of type %u (guid: %u).", script.id, uint32(pGo->GetGoType()), script.respawnGo.goGuid);
        return ShouldAbortScript(script);
    }

    if (pGo->isSpawned())
        return ShouldAbortScript(script);          //gameobject already spawned

    pGo->SetLootState(GO_READY);
    pGo->SetRespawnTime(time_to_despawn);        //despawn object in ? seconds

    Add(pGo);

    return false;
}

// SCRIPT_COMMAND_TEMP_SUMMON_CREATURE (10)
bool Map::ScriptCommand_SummonCreature(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    if (!script.summonCreature.creatureEntry)
    {
        sLog.outError("SCRIPT_COMMAND_TEMP_SUMMON_CREATURE (script id %u) call for a NULL creature, skipping.", script.id);
        return ShouldAbortScript(script);
    }

    WorldObject* pSummoner = source;

    if (!pSummoner)
    {
        sLog.outError("SCRIPT_COMMAND_TEMP_SUMMON_CREATURE (script id %u) call for a NULL or non-worldobject source (TypeId: %u, skipping.", script.id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    float x = script.x;
    float y = script.y;
    float z = script.z;
    float o = script.o;

    if (script.summonCreature.flags & SF_SUMMONCREATURE_UNIQUE || script.summonCreature.flags & SF_SUMMONCREATURE_UNIQUE_TEMP)
    {
        float dist = script.summonCreature.uniqueDistance ? script.summonCreature.uniqueDistance : (pSummoner->GetDistance(x, y, z) + 50.0f) * 2;
        std::list<Creature*> foundCreatures;

        GetCreatureListWithEntryInGrid(foundCreatures, pSummoner, script.summonCreature.creatureEntry, dist);

        if (!foundCreatures.empty())
        {
            uint32 exAmount = 0;
            uint32 reqAmount = script.summonCreature.uniqueLimit ? script.summonCreature.uniqueLimit : 1;

            if (script.summonCreature.flags & SF_SUMMONCREATURE_UNIQUE)
                exAmount = foundCreatures.size();
            else
                exAmount = count_if(foundCreatures.begin(), foundCreatures.end(), [&](Creature* c) { return c->IsTemporarySummon(); });

            if (exAmount >= reqAmount)
                return ShouldAbortScript(script);
        }
    }

    float orientation = o;

    if ((script.summonCreature.facingLogic == SO_SUMMONCREATURE_FACE_SUMMONER) || (script.summonCreature.facingLogic == SO_SUMMONCREATURE_FACE_TARGET))
    {
        WorldObject* facingTarget = ((script.summonCreature.facingLogic == SO_SUMMONCREATURE_FACE_TARGET) && target && target->isType(TYPEMASK_WORLDOBJECT)) ? static_cast<WorldObject*>(target) : pSummoner;

        float dx = facingTarget->GetPositionX() - x;
        float dy = facingTarget->GetPositionY() - y;

        orientation = atan2(dy, dx);
        orientation = (orientation >= 0) ? orientation : 2 * M_PI_F + orientation;
    }

    Creature* pCreature = pSummoner->SummonCreature(script.summonCreature.creatureEntry, x, y, z, orientation,
        TempSummonType(script.summonCreature.despawnType), script.summonCreature.despawnDelay, script.summonCreature.flags & SF_SUMMONCREATURE_ACTIVE);

    if (!pCreature)
    {
        sLog.outError("SCRIPT_COMMAND_TEMP_SUMMON (script id %u) failed for creature (entry: %u).", script.id, script.summonCreature.creatureEntry);
        return ShouldAbortScript(script);
    }

    if (script.summonCreature.flags & SF_SUMMONCREATURE_SET_RUN)
        pCreature->SetWalk(false);

    switch (script.summonCreature.attackTarget)
    {
        case TARGET_T_OWNER_OR_SELF:
            break;
        case TARGET_T_PROVIDED_TARGET:
        {
            if (Unit* pAttackTarget = ToUnit(target))
                if (pCreature->AI())
                    pCreature->AI()->AttackStart(pAttackTarget);
            break;
        }
        default:
        {
            if (Creature* pCreatureSummoner = pSummoner->ToCreature())
            {
                if (Unit* pAttackTarget = ToUnit(GetTargetByType(pCreatureSummoner, nullptr, script.summonCreature.attackTarget)))
                    if (pCreature->AI())
                        pCreature->AI()->AttackStart(pAttackTarget);
            }
        }
    }

    return false;
}

// SCRIPT_COMMAND_OPEN_DOOR (11)
bool Map::ScriptCommand_OpenDoor(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    GameObject *pDoor = nullptr;
    uint32 guidlow = script.openDoor.goGuid;

    if (guidlow)
    {
        GameObjectData const* goData = sObjectMgr.GetGOData(guidlow);
        if (!goData)                                // checked at load
            return ShouldAbortScript(script);

        pDoor = GetGameObject(ObjectGuid(HIGHGUID_GAMEOBJECT, goData->id, guidlow));
    }
    else if (target && target->GetTypeId() == TYPEID_GAMEOBJECT)
        pDoor = static_cast<GameObject*>(target);
    else if (source && source->GetTypeId() == TYPEID_GAMEOBJECT)
        pDoor = static_cast<GameObject*>(source);

    if (!pDoor)
    {
        sLog.outError("SCRIPT_COMMAND_OPEN_DOOR (script id %u) failed for gameobject(guid: %u).", script.id, guidlow);
        return ShouldAbortScript(script);
    }

    if (pDoor->GetGoType() != GAMEOBJECT_TYPE_DOOR)
    {
        sLog.outError("SCRIPT_COMMAND_OPEN_DOOR (script id %u) failed for non-door(GoType: %u).", script.id, pDoor->GetGoType());
        return ShouldAbortScript(script);
    }

    if (pDoor->GetGoState() != GO_STATE_READY)
        return ShouldAbortScript(script);         //door already  open

    int32 time_to_close = script.openDoor.resetDelay < 3 ? 3 : script.openDoor.resetDelay; // Ustaag <Nostalrius> : duree minimale de reset fixee a 3 sec au lieu de 15

    pDoor->UseDoorOrButton(time_to_close);

    if (target && target->isType(TYPEMASK_GAMEOBJECT) && (static_cast<GameObject*>(target))->GetGoType() == GAMEOBJECT_TYPE_BUTTON)
        (static_cast<GameObject*>(target))->UseDoorOrButton(time_to_close);

    return false;
}

// SCRIPT_COMMAND_CLOSE_DOOR (12)
bool Map::ScriptCommand_CloseDoor(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    GameObject *pDoor = nullptr;
    uint32 guidlow = script.closeDoor.goGuid;

    if (guidlow)
    {
        GameObjectData const* goData = sObjectMgr.GetGOData(guidlow);
        if (!goData)                                // checked at load
            return ShouldAbortScript(script);

        pDoor = GetGameObject(ObjectGuid(HIGHGUID_GAMEOBJECT, goData->id, guidlow));
    }
    else if (target && target->GetTypeId() == TYPEID_GAMEOBJECT)
        pDoor = static_cast<GameObject*>(target);
    else if (source && source->GetTypeId() == TYPEID_GAMEOBJECT)
        pDoor = static_cast<GameObject*>(source);

    if (!pDoor)
    {
        sLog.outError("SCRIPT_COMMAND_CLOSE_DOOR (script id %u) failed for gameobject(guid: %u).", script.id, guidlow);
        return ShouldAbortScript(script);
    }
    if (pDoor->GetGoType() != GAMEOBJECT_TYPE_DOOR)
    {
        sLog.outError("SCRIPT_COMMAND_CLOSE_DOOR (script id %u) failed for non-door(GoType: %u).", script.id, pDoor->GetGoType());
        return ShouldAbortScript(script);
    }

    if (pDoor->GetGoState() == GO_STATE_READY)
        return ShouldAbortScript(script);         //door already closed

    int32 time_to_open = script.closeDoor.resetDelay < 3 ? 3 : script.closeDoor.resetDelay; // Ustaag <Nostalrius> : duree minimale de reset fixee a 3 sec au lieu de 15

    pDoor->UseDoorOrButton(time_to_open);

    if (target && target->isType(TYPEMASK_GAMEOBJECT) && (static_cast<GameObject*>(target))->GetGoType() == GAMEOBJECT_TYPE_BUTTON)
        (static_cast<GameObject*>(target))->UseDoorOrButton(time_to_open);

    return false;
}

// SCRIPT_COMMAND_ACTIVATE_OBJECT (13)
bool Map::ScriptCommand_ActivateGameObject(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Unit* pUser = nullptr;
    GameObject *pGo = nullptr;

    if (!((pUser = ToUnit(source)) || (pUser = ToUnit(target))))
    {
        sLog.outError("SCRIPT_COMMAND_ACTIVATE_OBJECT (script id %u) call for a NULL user, skipping.", script.id);
        return ShouldAbortScript(script);
    }

    if (!((pGo = ToGameObject(target)) || (pGo = ToGameObject(source))))
    {
        sLog.outError("SCRIPT_COMMAND_ACTIVATE_OBJECT (script id %u) call for a NULL gameobject, skipping.", script.id);
        return ShouldAbortScript(script);
    }

    pGo->Use(pUser);
    return false;
}

// SCRIPT_COMMAND_REMOVE_AURA (14)
bool Map::ScriptCommand_RemoveAura(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Unit* pSource = ToUnit(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_REMOVE_AURA (script id %u) call for a NULL or non-unit source (TypeId: %u), skipping.", script.id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    pSource->RemoveAurasDueToSpell(script.removeAura.spellId);
    return false;
}

// SCRIPT_COMMAND_CAST_SPELL (15)
bool Map::ScriptCommand_CastSpell(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Unit* pUnitSource = ToUnit(source);
    Unit* pUnitTarget = ToUnit(target);
    
    if (!pUnitSource)
    {
        sLog.outError("SCRIPT_COMMAND_CAST_SPELL (script id %u) call for a NULL or non-unit source (TypeId: %u), skipping.", script.id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    if (!pUnitTarget)
        return ShouldAbortScript(script);

    if ((script.castSpell.flags & CF_INTERRUPT_PREVIOUS) && pUnitSource->IsNonMeleeSpellCasted(false))
        pUnitSource->InterruptNonMeleeSpells(false);

    Creature* pCreatureSource = pUnitSource->ToCreature();

    if (pCreatureSource && pCreatureSource->AI())
        pCreatureSource->AI()->DoCastSpellIfCan(pUnitTarget, script.castSpell.spellId, script.castSpell.flags);
    else
        pUnitSource->CastSpell(pUnitTarget, script.castSpell.spellId, (script.castSpell.flags & CF_TRIGGERED) != 0);

    return false;
}

// SCRIPT_COMMAND_PLAY_SOUND (16)
bool Map::ScriptCommand_PlaySound(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    WorldObject* pSource = source;

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_PLAY_SOUND (script id %u) call for a NULL or non-worldobject source (TypeId: %u), skipping.", script.id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    Player* pTarget = nullptr;

    if ((script.playSound.flags & SF_PLAYSOUND_ONLY_TO_TARGET) && !(pTarget = ToPlayer(target)))
    {
        sLog.outError("SCRIPT_COMMAND_PLAY_SOUND (script id %u) in targeted mode call for a NULL or non-player target (TypeId: %u), skipping.", script.id, target ? target->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    if (script.playSound.flags & SF_PLAYSOUND_DISTANCE_DEPENDENT)
        pSource->PlayDistanceSound(script.playSound.soundId, pTarget);
    else
        pSource->PlayDirectSound(script.playSound.soundId, pTarget);

    return false;
}

// SCRIPT_COMMAND_CREATE_ITEM (17)
bool Map::ScriptCommand_CreateItem(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Player* pReceiver;

    if (!((pReceiver = ToPlayer(target)) || (pReceiver = ToPlayer(source))))
    {
        sLog.outError("SCRIPT_COMMAND_CREATE_ITEM (script id %u) call for a NULL or non-player object (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", script.id, source ? source->GetTypeId() : 0, target ? target->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    if (Item* pItem = pReceiver->StoreNewItemInInventorySlot(script.createItem.itemEntry, script.createItem.amount))
        pReceiver->SendNewItem(pItem, script.createItem.amount, true, false);

    return false;
}

// SCRIPT_COMMAND_DESPAWN_CREATURE (18)
bool Map::ScriptCommand_DespawnCreature(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Creature* pSource = ToCreature(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_DESPAWN_CREATURE (script id %u) call for a NULL or non-creature source (TypeId: %u), skipping.", script.id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    pSource->DespawnOrUnsummon(script.despawn.despawnDelay);

    return false;
}

// SCRIPT_COMMAND_SET_EQUIPMENT (19)
bool Map::ScriptCommand_SetEquipment(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Creature* pSource = ToCreature(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_DESPAWN_CREATURE (script id %u) call for a NULL or non-creature source (TypeId: %u), skipping.", script.id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    if (script.setEquipment.resetDefault)
    {
        pSource->LoadEquipment(pSource->GetCreatureInfo()->equipmentId, true);
        return false;
    }

    // main hand
    if (script.setEquipment.slot[0] >= 0)
        pSource->SetVirtualItem(VIRTUAL_ITEM_SLOT_0, script.setEquipment.slot[0]);

    // off hand
    if (script.setEquipment.slot[1] >= 0)
        pSource->SetVirtualItem(VIRTUAL_ITEM_SLOT_1, script.setEquipment.slot[1]);

    // ranged
    if (script.setEquipment.slot[2] >= 0)
        pSource->SetVirtualItem(VIRTUAL_ITEM_SLOT_2, script.setEquipment.slot[2]);

    return false;
}

// SCRIPT_COMMAND_MOVEMENT (20)
bool Map::ScriptCommand_SetMovementType(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Creature* pSource;
    Unit* pTarget;

    if (pSource = ToCreature(source))
        pTarget = ToUnit(target);
    else if (pSource = ToCreature(target))
        pTarget = ToUnit(source);
    else
    {
        sLog.outError("SCRIPT_COMMAND_MOVEMENT (script id %u) call for a NULL or non-creature source and target (TypeIdSource: %u)(TypeIdTarget: %u), skipping", script.id, source ? source->GetTypeId() : 0, target ? target->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    // Consider add additional checks for cases where creature should not change movementType
    // (pet? in combat? already using same MMgen as script try to apply?)

    switch (script.movement.movementType)
    {
        case IDLE_MOTION_TYPE:
            pSource->GetMotionMaster()->MoveIdle();
            break;
        case RANDOM_MOTION_TYPE:
            pSource->GetMotionMaster()->MoveRandom();
            break;
        case WAYPOINT_MOTION_TYPE:
            pSource->GetMotionMaster()->MoveWaypoint(script.movement.boolParam);
            break;
        case CONFUSED_MOTION_TYPE:
            pSource->GetMotionMaster()->MoveConfused();
            break;
        case CHASE_MOTION_TYPE:
            if (script.movement.boolParam) // chase victim
            {
                if (Unit* pVictim = pSource->getVictim())
                    pSource->GetMotionMaster()->MoveChase(pVictim, script.x, script.o);
                break;
            }
            else if (pTarget)
                pSource->GetMotionMaster()->MoveChase(pTarget, script.x, script.o);
            break;
        case HOME_MOTION_TYPE:
            pSource->GetMotionMaster()->MoveTargetedHome();
            break;
        case FLEEING_MOTION_TYPE:
            if (script.movement.boolParam) // flee from victim
            {
                if (Unit* pVictim = pSource->getVictim())
                    pSource->GetMotionMaster()->MoveFleeing(pVictim, script.movement.intParam);
                break;
            }
            else if (pTarget)
                pSource->GetMotionMaster()->MoveFleeing(pTarget, script.movement.intParam);
            break;
        case DISTRACT_MOTION_TYPE:
            pSource->GetMotionMaster()->MoveDistract(script.movement.intParam);
            break;
        case FOLLOW_MOTION_TYPE:
            if (pTarget)
                pSource->GetMotionMaster()->MoveFollow(pTarget, script.x, script.o);
            break;
        case CHARGE_MOTION_TYPE:
            if (pTarget)
                pSource->GetMotionMaster()->MoveCharge(pTarget, script.movement.intParam, script.movement.boolParam);
            break;
        default:
            sLog.outError("SCRIPT_COMMAND_MOVEMENT (script id %u) call for an invalid motion type (MotionType: %u), skipping.", script.id, script.movement.movementType);
            return ShouldAbortScript(script);
    }

    return false;
}

// SCRIPT_COMMAND_SET_ACTIVEOBJECT (21)
bool Map::ScriptCommand_SetActiveObject(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Creature* pSource;

    if (!((pSource = ToCreature(source)) || (pSource = ToCreature(target))))
    {
        sLog.outError("SCRIPT_COMMAND_SET_ACTIVEOBJECT (script id %u) call for a NULL or non-creature source and target (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", script.id, source ? source->GetTypeId() : 0, target ? target->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    pSource->SetActiveObjectState(script.activeObject.activate);

    return false;
}

// SCRIPT_COMMAND_SET_FACTION (22)
bool Map::ScriptCommand_SetFaction(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Creature* pSource;

    if (!((pSource = ToCreature(source)) || (pSource = ToCreature(target))))
    {
        sLog.outError("SCRIPT_COMMAND_SET_FACTION (script id %u) call for a NULL or non-creature source and target (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", script.id, source ? source->GetTypeId() : 0, target ? target->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    if (script.faction.factionId)
        pSource->SetFactionTemporary(script.faction.factionId, script.faction.flags);
    else
        pSource->ClearTemporaryFaction();

    return false;
}

// SCRIPT_COMMAND_MORPH_TO_ENTRY_OR_MODEL (23)
bool Map::ScriptCommand_Morph(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Creature* pSource;

    if (!((pSource = ToCreature(source)) || (pSource = ToCreature(target))))
    {
        sLog.outError("SCRIPT_COMMAND_MORPH_TO_ENTRY_OR_MODEL (script id %u) call for a NULL or non-creature source and target (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", script.id, source ? source->GetTypeId() : 0, target ? target->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    if (!script.morph.creatureOrModelEntry)
        pSource->DeMorph();
    else if (script.morph.isDisplayId)
        pSource->SetDisplayId(script.morph.creatureOrModelEntry);
    else
    {
        CreatureInfo const* ci = ObjectMgr::GetCreatureTemplate(script.morph.creatureOrModelEntry);
        uint32 display_id = Creature::ChooseDisplayId(ci);

        pSource->SetDisplayId(display_id);
    }

    return false;
}

// SCRIPT_COMMAND_MOUNT_TO_ENTRY_OR_MODEL (24)
bool Map::ScriptCommand_Mount(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Creature* pSource;

    if (!((pSource = ToCreature(source)) || (pSource = ToCreature(target))))
    {
        sLog.outError("SCRIPT_COMMAND_MOUNT_TO_ENTRY_OR_MODEL (script id %u) call for a NULL or non-creature source and target (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", script.id, source ? source->GetTypeId() : 0, target ? target->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    if (!script.mount.creatureOrModelEntry)
        pSource->Unmount();
    else if (script.mount.isDisplayId)
        pSource->Mount(script.mount.creatureOrModelEntry);
    else
    {
        CreatureInfo const* ci = ObjectMgr::GetCreatureTemplate(script.mount.creatureOrModelEntry);
        uint32 display_id = Creature::ChooseDisplayId(ci);

        pSource->Mount(display_id);
    }

    return false;
}

// SCRIPT_COMMAND_SET_RUN (25)
bool Map::ScriptCommand_SetRun(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Creature* pSource;

    if (!((pSource = ToCreature(source)) || (pSource = ToCreature(target))))
    {
        sLog.outError("SCRIPT_COMMAND_SET_RUN (script id %u) call for a NULL or non-creature source and target (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", script.id, source ? source->GetTypeId() : 0, target ? target->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    pSource->SetWalk(!script.run.run);

    return false;
}

// SCRIPT_COMMAND_ATTACK_START (26)
bool Map::ScriptCommand_AttackStart(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Unit* pTarget = ToUnit(target);
    Creature* pAttacker = ToCreature(source);

    if (!pAttacker || !pTarget)
    {
        sLog.outError("SCRIPT_COMMAND_ATTACK_START (script id %u) call for a NULL source or target (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", script.id, source ? source->GetTypeId() : 0, target ? target->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    if (pAttacker->IsFriendlyTo(pTarget))
    {
        sLog.outError("SCRIPT_COMMAND_ATTACK_START (script id %u) attacker is friendly to target, can not attack.", script.id);
        return ShouldAbortScript(script);
    }

    if (pAttacker->AI())
        pAttacker->AI()->AttackStart(pTarget);

    return false;
}

// SCRIPT_COMMAND_UPDATE_ENTRY (27)
bool Map::ScriptCommand_UpdateEntry(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Creature* pSource = ToCreature(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_UPDATE_ENTRY (script id %u) call for a NULL or non-creature source (TypeId: %u), skipping.", script.id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    if (pSource->GetEntry() != script.updateEntry.creatureEntry)
        pSource->UpdateEntry(script.updateEntry.creatureEntry, script.updateEntry.team ? HORDE : ALLIANCE);

    return false;
}

// SCRIPT_COMMAND_STAND_STATE (28)
bool Map::ScriptCommand_SetStandState(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Unit* pSource = ToUnit(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_STAND_STATE (script id %u) call for a NULL or non-unit source (TypeId: %u), skipping", script.id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    pSource->SetStandState(script.standState.stand_state);

    return false;
}

// SCRIPT_COMMAND_MODIFY_THREAT (29)
bool Map::ScriptCommand_ModifyThreat(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Creature* pSource = ToCreature(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_MODIFY_THREAT (script id %u) call for a NULL or non-creature source (TypeId: %u), skipping.", script.id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    if (script.modThreat.target == SO_MODIFYTHREAT_ALL_ATTACKERS)
    {
        ThreatList const& threatList = pSource->getThreatManager().getThreatList();
        for (ThreatList::const_iterator i = threatList.begin(); i != threatList.end(); ++i)
            if (Unit* Temp = pSource->GetMap()->GetUnit((*i)->getUnitGuid()))
                pSource->getThreatManager().modifyThreatPercent(Temp, script.x);
    }
    else
    {
        if (Unit* pTarget = ToUnit(GetTargetByType(pSource, target, script.modThreat.target)))
            pSource->getThreatManager().modifyThreatPercent(pTarget, script.x);
    }

    return false;
}

// SCRIPT_COMMAND_SEND_TAXI_PATH (30)
bool Map::ScriptCommand_SendTaxiPath(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Player* pPlayer;

    if (!((pPlayer = ToPlayer(target)) || (pPlayer = ToPlayer(source))))
    {
        sLog.outError("SCRIPT_COMMAND_SEND_TAXI_PATH (script id %u) call for a non-player source and target (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", script.id, source ? source->GetTypeId() : 0, target ? target->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    pPlayer->ActivateTaxiPathTo(script.sendTaxiPath.taxiPathId, 0, true);
    return false;
}

// SCRIPT_COMMAND_TERMINATE_SCRIPT (31)
bool Map::ScriptCommand_TerminateScript(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    if (script.terminateScript.creatureEntry)
    {
        WorldObject* pSearcher;
        if (!((pSearcher = source) || (pSearcher = target)))
        {
            sLog.outError("SCRIPT_COMMAND_TERMINATE_SCRIPT (script id %u) call for a NULL object, skipping.", script.id);
            return ShouldAbortScript(script);
        }

        Creature* pCreatureBuddy = nullptr;
        MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck u_check(*pSearcher, script.terminateScript.creatureEntry, true, script.terminateScript.searchRadius);
        MaNGOS::CreatureLastSearcher<MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck> searcher(pCreatureBuddy, u_check);
        Cell::VisitGridObjects(pSearcher, searcher, script.terminateScript.searchRadius);

        if ((script.terminateScript.flags == SO_TERMINATESCRIPT_IF_NOT_FOUND) && !pCreatureBuddy)
            return true; // when npc was not found alive
        else if ((script.terminateScript.flags == SO_TERMINATESCRIPT_IF_FOUND) && pCreatureBuddy)
            return true; // when npc was found alive
    }
    else
        return true; // Terminate further steps of this script

    return false;
}

// SCRIPT_COMMAND_TERMINATE_CONDITION (32)
bool Map::ScriptCommand_TerminateCondition(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    WorldObject* pSource = source;
    WorldObject* pTarget = target;

    bool terminateResult = sObjectMgr.IsConditionSatisfied(script.terminateCond.conditionId, pTarget, this, pSource, CONDITION_FROM_DBSCRIPTS);
    
    if (script.terminateCond.flags & SF_TERMINATECONDITION_WHEN_FALSE)
        terminateResult = !terminateResult;

    if (terminateResult && script.terminateCond.failQuest)
    {
        Player* pPlayer;

        if ((pPlayer = ToPlayer(pSource)) || (pPlayer = ToPlayer(pTarget)))
            pPlayer->GroupEventFailHappens(script.terminateCond.failQuest);
    }

    return terminateResult; // Terminate further steps of this script
}

// SCRIPT_COMMAND_ENTER_EVADE_MODE (33)
bool Map::ScriptCommand_Evade(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Creature* pSource;

    if (!((pSource = ToCreature(source)) || (pSource = ToCreature(target))))
    {
        sLog.outError("SCRIPT_COMMAND_ENTER_EVADE_MODE (script id %u) call for a NULL or non-creature source and target (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", script.id, source ? source->GetTypeId() : 0, target ? target->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    if (pSource->AI())
        pSource->AI()->EnterEvadeMode();

    return false;
}

// SCRIPT_COMMAND_SET_HOME_POSITION (34)
bool Map::ScriptCommand_SetHomePosition(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Creature* pSource;

    if (!((pSource = ToCreature(source)) || (pSource = ToCreature(target))))
    {
        sLog.outError("SCRIPT_COMMAND_SET_HOME_POSITION (script id %u) call for a NULL or non-creature source and target (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", script.id, source ? source->GetTypeId() : 0, target ? target->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    if (script.setHome.useCurrent)
        pSource->SaveHomePosition();
    else
        pSource->SetHomePosition(script.x, script.y, script.z, script.o);

    return false;
}

// SCRIPT_COMMAND_TURN_TO (35)
bool Map::ScriptCommand_TurnTo(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Unit* pSource = ToUnit(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_TURN_TO (script id %u) call for a NULL or non-unit source (TypeId: %u), skipping.", script.id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    switch (script.turnTo.facingLogic)
    {
        case SO_TURNTO_FACE_TARGET:
        {
            if (WorldObject* pTarget = target)
                pSource->SetFacingToObject(pTarget);
            else
            {
                sLog.outError("SCRIPT_COMMAND_TURN_TO (script id %u) call with datalong=0 for a non-worldobject target (TypeId: %u), skipping", script.id, target ? target->GetTypeId() : 0);
                return ShouldAbortScript(script);
            }
            break;
        }
        case SO_TURNTO_PROVIDED_ORIENTATION:
        {
            pSource->SetFacingTo(script.o);
            break;
        }
    }

    return false;
}

// SCRIPT_COMMAND_MEETINGSTONE (36)
bool Map::ScriptCommand_MeetingStone(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Player* pPlayer;

    if (!((pPlayer = ToPlayer(target)) || (pPlayer = ToPlayer(source))))
    {
        sLog.outError("SCRIPT_COMMAND_MEETINGSTONE (script id %u) call for a NULL or non-player source and target (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", script.id, source ? source->GetTypeId() : 0, target ? target->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    if (!sLFGMgr.IsPlayerInQueue(pPlayer->GetObjectGuid()))
        sLFGMgr.AddToQueue(pPlayer, script.meetingstone.areaId);

    return false;
}

// SCRIPT_COMMAND_SET_INST_DATA (37)
bool Map::ScriptCommand_SetData(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    InstanceData* pInst = GetInstanceData();
    
    if (!pInst)
    {
        sLog.outError("SCRIPT_COMMAND_SET_INST_DATA (script id %u) call for map without an instance script, skipping.", script.id);
        return ShouldAbortScript(script);
    }

    uint32 uiData = script.setData.data;
    switch (script.setData.type)
    {
        case SO_INSTDATA_INCREMENT:
        {
            uiData+= pInst->GetData(script.setData.field);
            break;
        }
        case SO_INSTDATA_DECREMENT:
        {
            uint32 uiOldData = pInst->GetData(script.setData.field);
            uiData = (uiData < uiOldData) ? (uiOldData - uiData) : 0;
            break;
        }
    }

    pInst->SetData(script.setData.field, uiData);
    return false;
}

// SCRIPT_COMMAND_SET_INST_DATA64 (38)
bool Map::ScriptCommand_SetData64(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    InstanceData* pInst = GetInstanceData();
    
    if (!pInst)
    {
        sLog.outError("SCRIPT_COMMAND_SET_INST_DATA64 (script id %u) call for map without an instance script, skipping.", script.id);
        return ShouldAbortScript(script);
    }

    switch (script.setData64.type)
    {
        case SO_INSTDATA64_RAW:
        {
            pInst->SetData64(script.setData64.field, script.setData64.data);
            break;
        }
        case SO_INSTDATA64_SOURCE_GUID:
        {
            if (source)
                pInst->SetData64(script.setData64.field, source->GetGUID());
            else
            {
                sLog.outError("SCRIPT_COMMAND_SET_INST_DATA64 (script id %u) call for a NULL source, skipping.", script.id);
                return ShouldAbortScript(script);
            }
            break;
        }
    }

    return false;
}

// SCRIPT_COMMAND_START_SCRIPT (39)
bool Map::ScriptCommand_StartScript(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    const uint32 roll = urand(1, 100);
    uint32 sum = 0;
    uint32 chosenId = 0;

    for (int i = 0; i < 4; i++)
    {
        const uint32 currentId = script.startScript.scriptId[i];

        if (!currentId)
            continue;

        const uint32 currentChance = script.startScript.chance[i];

        if ((roll > sum) && (roll <= (sum + currentChance)))
        {
            chosenId = currentId;
            break;
        }

        sum += currentChance;
    }

    if (chosenId)
        ScriptsStart(sEventScripts, chosenId, source, target);
    else
        return ShouldAbortScript(script);

    return false;
}

// SCRIPT_COMMAND_REMOVE_ITEM (40)
bool Map::ScriptCommand_RemoveItem(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Player* pPlayer;

    if (!((pPlayer = ToPlayer(target)) || (pPlayer = ToPlayer(source))))
    {
        sLog.outError("SCRIPT_COMMAND_REMOVE_ITEM (script id %u) call for a NULL or non-player source and target (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", script.id, source ? source->GetTypeId() : 0, target ? target->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    pPlayer->DestroyItemCount(script.createItem.itemEntry, script.createItem.amount, true);

    return false;
}

// SCRIPT_COMMAND_REMOVE_OBJECT (41)
bool Map::ScriptCommand_RemoveGameObject(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    GameObject *pGo = nullptr;

    if (!((pGo = ToGameObject(target)) || (pGo = ToGameObject(source))))
    {
        sLog.outError("SCRIPT_COMMAND_REMOVE_OBJECT (script id %u) call for a NULL gameobject, skipping.", script.id);
        return ShouldAbortScript(script);
    }

    pGo->SetLootState(GO_JUST_DEACTIVATED);
    pGo->AddObjectToRemoveList();
    return false;
}

// SCRIPT_COMMAND_SET_MELEE_ATTACK (42)
bool Map::ScriptCommand_SetMeleeAttack(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Creature* pSource = ToCreature(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_SET_MELEE_ATTACK (script id %u) call for a NULL or non-creature source (TypeId: %u), skipping.", script.id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    if (pSource->AI())
        pSource->AI()->SetMeleeAttack(script.enableMelee.enabled);

    return false;
}

// SCRIPT_COMMAND_SET_COMBAT_MOVEMENT (43)
bool Map::ScriptCommand_SetCombatMovement(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Creature* pSource = ToCreature(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_SET_COMBAT_MOVEMENT (script id %u) call for a NULL or non-creature source (TypeId: %u), skipping.", script.id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    if (pSource->AI())
        pSource->AI()->SetCombatMovement(script.combatMovement.enabled);

    return false;
}

// SCRIPT_COMMAND_SET_PHASE (44)
bool Map::ScriptCommand_SetPhase(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Creature* pSource = ToCreature(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_SET_PHASE (script id %u) call for a NULL or non-creature source (TypeId: %u), skipping.", script.id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    auto* pAI = dynamic_cast<CreatureEventAI*>(pSource->AI());

    if (!pAI)
        return ShouldAbortScript(script);

    uint32 uiPhase = script.setPhase.phase;

    switch (script.setPhase.mode)
    {
        case SO_SETPHASE_INCREMENT:
        {
            uiPhase+= pAI->m_Phase;
            break;
        }
        case SO_SETPHASE_DECREMENT:
        {
            uint32 uiOldPhase = pAI->m_Phase;
            uiPhase = (uiPhase < uiOldPhase) ? (uiOldPhase - uiPhase) : 0;
            break;
        }
    }

    if (uiPhase >= MAX_PHASE)
    {
        sLog.outErrorDb("SCRIPT_COMMAND_SET_PHASE (script id %u) attempt to increment Phase above %u. Phase mask cannot be used with phases past %u. CreatureEntry = %d", script.id, MAX_PHASE - 1, MAX_PHASE - 1, pSource->GetEntry());
        return ShouldAbortScript(script);
    }

    pAI->m_Phase = uiPhase;

    return false;
}

// SCRIPT_COMMAND_SET_PHASE_RANDOM (45)
bool Map::ScriptCommand_SetPhaseRandom(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Creature* pSource = ToCreature(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_SET_PHASE_RANDOM (script id %u) call for a NULL or non-creature source (TypeId: %u), skipping.", script.id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    auto* pAI = dynamic_cast<CreatureEventAI*>(pSource->AI());

    if (!pAI)
        return ShouldAbortScript(script);

    uint32 phase1 = script.setPhaseRandom.phase[0];
    uint32 phase2 = script.setPhaseRandom.phase[1];
    uint32 phase3 = script.setPhaseRandom.phase[2];
    uint32 phase4 = script.setPhaseRandom.phase[3];

    if (phase4)
        pAI->m_Phase = RAND(phase1, phase2, phase3, phase4);
    else if (phase3)
        pAI->m_Phase = RAND(phase1, phase2, phase3);
    else
        pAI->m_Phase = RAND(phase1, phase2);

    return false;
}

// SCRIPT_COMMAND_SET_PHASE_RANGE (46)
bool Map::ScriptCommand_SetPhaseRange(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Creature* pSource = ToCreature(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_SET_PHASE_RANGE (script id %u) call for a NULL or non-creature source (TypeId: %u), skipping.", script.id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    auto* pAI = dynamic_cast<CreatureEventAI*>(pSource->AI());

    if (!pAI)
        return ShouldAbortScript(script);

    pAI->m_Phase = urand(script.setPhaseRange.phaseMin, script.setPhaseRange.phaseMax);

    return false;
}

// SCRIPT_COMMAND_FLEE (47)
bool Map::ScriptCommand_Flee(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Creature* pSource = ToCreature(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_FLEE (script id %u) call for a NULL or non-creature source (TypeId: %u), skipping.", script.id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    if (script.flee.seekAssistance)
        pSource->DoFleeToGetAssistance();
    else
        pSource->DoFlee();

    return false;
}

// SCRIPT_COMMAND_DEAL_DAMAGE (48)
bool Map::ScriptCommand_DealDamage(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Unit* pSource = ToUnit(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_DEAL_DAMAGE (script id %u) call for a NULL or non-unit source (TypeId: %u), skipping.", script.id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    Unit* pTarget = ToUnit(source);

    if (!pTarget)
    {
        sLog.outError("SCRIPT_COMMAND_DEAL_DAMAGE (script id %u) call for a NULL or non-unit target (TypeId: %u), skipping.", script.id, target ? target->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    uint32 damage = script.dealDamage.isPercent ? pTarget->GetMaxHealth()*(script.dealDamage.damage / 100.0f) : script.dealDamage.damage;
    pSource->DealDamage(pTarget, damage, nullptr, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, nullptr, false);

    return false;
}

// SCRIPT_COMMAND_ZONE_COMBAT_PULSE (49)
bool Map::ScriptCommand_ZoneCombatPulse(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Creature* pSource = ToCreature(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_ZONE_COMBAT_PULSE (script id %u) call for a NULL or non-creature source (TypeId: %u), skipping.", script.id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    pSource->SetInCombatWithZone(script.combatPulse.initialPulse);

    return false;
}

// SCRIPT_COMMAND_CALL_FOR_HELP (50)
bool Map::ScriptCommand_CallForHelp(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Creature* pSource = ToCreature(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_CALL_FOR_HELP (script id %u) call for a NULL or non-creature source (TypeId: %u), skipping.", script.id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    pSource->CallForHelp(script.x);

    return false;
}

// SCRIPT_COMMAND_SET_SHEATH (51)
bool Map::ScriptCommand_SetSheath(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Unit* pSource = ToUnit(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_SET_SHEATH (script id %u) call for a NULL or non-unit source (TypeId: %u), skipping.", script.id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    pSource->SetSheath(SheathState(script.setSheath.sheathState));

    return false;
}

// SCRIPT_COMMAND_INVINCIBILITY (52)
bool Map::ScriptCommand_Invincibility(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    Creature* pSource = ToCreature(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_INVINCIBILITY (script id %u) call for a NULL or non-creature source (TypeId: %u), skipping.", script.id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(script);
    }

    auto* pAI = dynamic_cast<CreatureEventAI*>(pSource->AI());

    if (!pAI)
        return ShouldAbortScript(script);

    pAI->SetInvincibilityHealthLevel(script.invincibility.health, script.invincibility.isPercent);

    return false;
}

// SCRIPT_COMMAND_GAME_EVENT (53)
bool Map::ScriptCommand_GameEvent(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    if (script.gameEvent.start)
        sGameEventMgr.StartEvent(script.gameEvent.eventId, script.gameEvent.overwrite);
    else
        sGameEventMgr.StopEvent(script.gameEvent.eventId, script.gameEvent.overwrite);

    return false;
}

// SCRIPT_COMMAND_SET_SERVER_VARIABLE (54)
bool Map::ScriptCommand_ServerVariable(const ScriptInfo& script, WorldObject* source, WorldObject* target)
{
    sObjectMgr.SetSavedVariable(script.serverVariable.index, script.serverVariable.value, true);

    return false;
}