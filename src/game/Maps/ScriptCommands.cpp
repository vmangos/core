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

// Script commands should return false by default.
// If they return true the rest of the script is aborted.

inline bool ShouldAbortScript(ScriptAction& step)
{
    return (step.script->raw.data[4] & SF_GENERAL_ABORT_ON_FAILURE);
}

// SCRIPT_COMMAND_TALK (0)
bool Map::ScriptCommand_Talk(ScriptAction& step, Object* source, Object* target)
{
    WorldObject* pSource = ToWorldObject(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_TALK (script id %u) call for a NULL or non-worldobject source (TypeId: %u), skipping.", step.script->id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(step);
    }

    Unit* unitTarget = ToUnit(target);
    int32 textId = step.script->talk.textId[0];

    // May have text for random
    if (step.script->talk.textId[1])
    {
        int i = 2;
        for (; i < MAX_TEXT_ID; ++i)
        {
            if (!step.script->talk.textId[i])
                break;
        }

        // Use one random
        textId = step.script->talk.textId[rand() % i];
    }

    DoScriptText(textId, pSource, unitTarget, step.script->talk.chatType);

    return false;
}

// SCRIPT_COMMAND_EMOTE (1)
bool Map::ScriptCommand_Emote(ScriptAction& step, Object* source, Object* target)
{
    Unit* pSource = ToUnit(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_EMOTE (script id %u) call for a NULL or non-worldobject source (TypeId: %u), skipping.", step.script->id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(step);
    }

    // find the emote
    std::vector<uint32> emotes;
    emotes.push_back(step.script->emote.emoteId);
    for (int i = 0; i < MAX_EMOTE_ID; ++i)
    {
        if (!step.script->emote.randomEmotes[i])
            continue;
        emotes.push_back(uint32(step.script->emote.randomEmotes[i]));
    }

    pSource->HandleEmote(emotes[urand(0, emotes.size() - 1)]);

    return false;
}

// SCRIPT_COMMAND_FIELD_SET(2)
bool Map::ScriptCommand_FieldSet(ScriptAction& step, Object* source, Object* target)
{
    if (!source)
    {
        sLog.outError("SCRIPT_COMMAND_FIELD_SET (script id %u) call for a NULL object, skipping.", step.script->id);
        return ShouldAbortScript(step);
    }

    if (step.script->setField.fieldId <= OBJECT_FIELD_ENTRY || step.script->setField.fieldId >= source->GetValuesCount())
    {
        sLog.outError("SCRIPT_COMMAND_FIELD_SET (script id %u) call for wrong field %u (max count: %u) in object (TypeId: %u).",
            step.script->id, step.script->setField.fieldId, source->GetValuesCount(), source->GetTypeId());
        return ShouldAbortScript(step);
    }

    source->SetUInt32Value(step.script->setField.fieldId, step.script->setField.fieldValue);

    return false;
}

// SCRIPT_COMMAND_MOVE_TO (3)
bool Map::ScriptCommand_MoveTo(ScriptAction& step, Object* source, Object* target)
{
    Creature* pSource = ToCreature(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_MOVE_TO (script id %u) call for a NULL or non-creature source (TypeId: %u), skipping.", step.script->id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(step);
    }

    float x = step.script->x;
    float y = step.script->y;
    float z = step.script->z;

    if (step.script->moveTo.coordinatesType)
    {
        if (WorldObject* pTarget = ToWorldObject(target))
        {
            switch (step.script->moveTo.coordinatesType)
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
            sLog.outError("SCRIPT_COMMAND_MOVE_TO (script id %u) call with datalong = %u for a NULL or non-worldobject target, skipping.", step.script->id, step.script->moveTo.coordinatesType);
            return ShouldAbortScript(step);
        }
    }

    // Only move if we can move.
    if (pSource->hasUnitState(UNIT_STAT_NOT_MOVE) && !(step.script->moveTo.flags & SF_MOVETO_FORCED))
        return ShouldAbortScript(step);

    float speed = step.script->moveTo.travelTime != 0 ? pSource->GetDistance(x, y, z) / ((float)step.script->moveTo.travelTime * 0.001f) : 0.0f;
    float orientation = step.script->o ? step.script->o : -10.0f;

    if (step.script->moveTo.flags & SF_MOVETO_POINT_MOVEGEN)
        pSource->GetMotionMaster()->MovePoint(0, x, y, z, step.script->moveTo.movementOptions, speed, orientation);
    else
        pSource->MonsterMoveWithSpeed(x, y, z, orientation, speed, step.script->moveTo.movementOptions);

    return false;
}

// SCRIPT_COMMAND_MODIFY_FLAGS (4)
bool Map::ScriptCommand_ModifyFlags(ScriptAction& step, Object* source, Object* target)
{
    if (!source)
    {
        sLog.outError("SCRIPT_COMMAND_MODIFY_FLAGS (script id %u) call for a NULL object, skipping.", step.script->id);
        return ShouldAbortScript(step);
    }

    if (step.script->modFlags.fieldId <= OBJECT_FIELD_ENTRY || step.script->modFlags.fieldId >= source->GetValuesCount())
    {
        sLog.outError("SCRIPT_COMMAND_MODIFY_FLAGS (script id %u) call for wrong field %u (max count: %u) in object (TypeId: %u).",
            step.script->id, step.script->modFlags.fieldId, source->GetValuesCount(), source->GetTypeId());
        return ShouldAbortScript(step);
    }

    // Add Flags
    if (step.script->modFlags.mode == SO_MODIFYFLAGS_SET)
        source->SetFlag(step.script->modFlags.fieldId, step.script->modFlags.fieldValue);
    // Remove Flags
    else if (step.script->modFlags.mode == SO_MODIFYFLAGS_REMOVE)
        source->RemoveFlag(step.script->modFlags.fieldId, step.script->modFlags.fieldValue);
    // Toggle Flags
    else
    {
        if (source->HasFlag(step.script->modFlags.fieldId, step.script->modFlags.fieldValue))
            source->RemoveFlag(step.script->modFlags.fieldId, step.script->modFlags.fieldValue);
        else
            source->SetFlag(step.script->modFlags.fieldId, step.script->modFlags.fieldValue);
    }

    return false;
}

// SCRIPT_COMMAND_INTERRUPT_CASTS (5)
bool Map::ScriptCommand_InterruptCasts(ScriptAction& step, Object* source, Object* target)
{
    Unit* pSource = ToUnit(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_INTERRUPT_CAST (script id %u) call for a NULL or non-unit source (TypeId: %u), skipping.", step.script->id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(step);
    }

    pSource->InterruptNonMeleeSpells(step.script->interruptCasts.withDelayed, step.script->interruptCasts.spellId);

    return false;
}

// SCRIPT_COMMAND_TELEPORT_TO (6)
bool Map::ScriptCommand_TeleportTo(ScriptAction& step, Object* source, Object* target)
{
    Unit* pSource = ToUnit(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_TELEPORT_TO (script id %u) call for a NULL or non-unit source (TypeId: %u), skipping.", step.script->id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(step);
    }

    if (pSource->GetTypeId() == TYPEID_PLAYER)
        (static_cast<Player*>(pSource))->TeleportTo(step.script->teleportTo.mapId, step.script->x, step.script->y, step.script->z, step.script->o, step.script->teleportTo.teleportOptions);
    else
        pSource->NearTeleportTo(step.script->x, step.script->y, step.script->z, step.script->o, step.script->teleportTo.teleportOptions);

    return false;
}

// SCRIPT_COMMAND_QUEST_EXPLORED (7)
bool Map::ScriptCommand_QuestExplored(ScriptAction& step, Object* source, Object* target)
{
    // when script called for item spell casting then target == (unit or GO) and source is player
    Player* pPlayer;
    WorldObject* pWorldObject;

    if (!(((pPlayer = ToPlayer(target)) && (pWorldObject = ToWorldObject(source))) || ((pPlayer = ToPlayer(source)) && (pWorldObject = ToWorldObject(target)))))
    {
        sLog.outError("SCRIPT_COMMAND_QUEST_EXPLORED (script id %u) call for a NULL player, skipping.", step.script->id);
        return ShouldAbortScript(step);
    }

    if (pWorldObject->GetTypeId() != TYPEID_UNIT && pWorldObject->GetTypeId() != TYPEID_GAMEOBJECT && pWorldObject->GetTypeId() != TYPEID_PLAYER)
    {
        sLog.outError("SCRIPT_COMMAND_QUEST_EXPLORED (script id %u) call for a non-creature, non-gameobject or non-player (TypeId: %u), skipping.", step.script->id, pWorldObject->GetTypeId());
        return ShouldAbortScript(step);
    }

    // quest id and flags checked at script loading
    if ((pWorldObject->GetTypeId() != TYPEID_UNIT || (static_cast<Unit*>(pWorldObject))->isAlive()) &&
        (step.script->questExplored.distance == 0 || pWorldObject->IsWithinDistInMap(pPlayer, float(step.script->questExplored.distance))))
        pPlayer->AreaExploredOrEventHappens(step.script->questExplored.questId);
    else
        pPlayer->FailQuest(step.script->questExplored.questId);

    return false;
}

// SCRIPT_COMMAND_KILL_CREDIT (8)
bool Map::ScriptCommand_KillCredit(ScriptAction& step, Object* source, Object* target)
{
    Player* pSource;

    // accept player in any one from target/source arg
    if ((pSource = ToPlayer(target)) || (pSource = ToPlayer(source)))
    {
        if (step.script->killCredit.isGroupCredit)
            pSource->RewardPlayerAndGroupAtEvent(step.script->killCredit.creatureEntry, pSource);
        else
            pSource->KilledMonsterCredit(step.script->killCredit.creatureEntry);
    }
    else
    {
        sLog.outError("SCRIPT_COMMAND_KILL_CREDIT (script id %u) call for a NULL object, skipping.", step.script->id);
        return ShouldAbortScript(step);
    }
    

    return false;
}

// SCRIPT_COMMAND_RESPAWN_GAMEOBJECT (9)
bool Map::ScriptCommand_RespawnGameObject(ScriptAction& step, Object* source, Object* target)
{
    GameObject *pGo = nullptr;
    uint32 guidlow = step.script->respawnGo.goGuid;

    if (guidlow)
    {
        GameObjectData const* goData = sObjectMgr.GetGOData(guidlow);
        if (!goData)
            return ShouldAbortScript(step); // checked at load

        pGo = GetGameObject(ObjectGuid(HIGHGUID_GAMEOBJECT, goData->id, guidlow));
    }
    else if (target && target->GetTypeId() == TYPEID_GAMEOBJECT)
        pGo = static_cast<GameObject*>(target);
    else if (source && source->GetTypeId() == TYPEID_GAMEOBJECT)
        pGo = static_cast<GameObject*>(source);

    if (!pGo)
    {
        sLog.outError("SCRIPT_COMMAND_RESPAWN_GAMEOBJECT (script id %u) failed for gameobject(guid: %u).", step.script->id, guidlow);
        return ShouldAbortScript(step);
    }

    int32 time_to_despawn = step.script->respawnGo.despawnDelay < 5 ? 5 : step.script->respawnGo.despawnDelay;

    if (pGo->GetGoType() == GAMEOBJECT_TYPE_FISHINGNODE ||
        pGo->GetGoType() == GAMEOBJECT_TYPE_DOOR ||
        pGo->GetGoType() == GAMEOBJECT_TYPE_BUTTON ||
        pGo->GetGoType() == GAMEOBJECT_TYPE_TRAP)
    {
        sLog.outError("SCRIPT_COMMAND_RESPAWN_GAMEOBJECT (script id %u) can not be used with gameobject of type %u (guid: %u).", step.script->id, uint32(pGo->GetGoType()), step.script->respawnGo.goGuid);
        return ShouldAbortScript(step);
    }

    if (pGo->isSpawned())
        return ShouldAbortScript(step);          //gameobject already spawned

    pGo->SetLootState(GO_READY);
    pGo->SetRespawnTime(time_to_despawn);        //despawn object in ? seconds

    Add(pGo);

    return false;
}

// SCRIPT_COMMAND_TEMP_SUMMON_CREATURE (10)
bool Map::ScriptCommand_SummonCreature(ScriptAction& step, Object* source, Object* target)
{
    if (!step.script->summonCreature.creatureEntry)
    {
        sLog.outError("SCRIPT_COMMAND_TEMP_SUMMON_CREATURE (script id %u) call for a NULL creature, skipping.", step.script->id);
        return ShouldAbortScript(step);
    }

    WorldObject* pSummoner = ToWorldObject(source);

    if (!pSummoner)
    {
        sLog.outError("SCRIPT_COMMAND_TEMP_SUMMON_CREATURE (script id %u) call for a NULL or non-worldobject source (TypeId: %u, skipping.", step.script->id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(step);
    }

    float x = step.script->x;
    float y = step.script->y;
    float z = step.script->z;
    float o = step.script->o;

    if (step.script->summonCreature.flags & SF_SUMMONCREATURE_UNIQUE || step.script->summonCreature.flags & SF_SUMMONCREATURE_UNIQUE_TEMP)
    {
        float dist = step.script->summonCreature.uniqueDistance ? step.script->summonCreature.uniqueDistance : (pSummoner->GetDistance(x, y, z) + 50.0f) * 2;
        std::list<Creature*> foundCreatures;

        GetCreatureListWithEntryInGrid(foundCreatures, pSummoner, step.script->summonCreature.creatureEntry, dist);

        if (!foundCreatures.empty())
        {
            uint32 exAmount = 0;
            uint32 reqAmount = step.script->summonCreature.uniqueLimit ? step.script->summonCreature.uniqueLimit : 1;

            if (step.script->summonCreature.flags & SF_SUMMONCREATURE_UNIQUE)
                exAmount = foundCreatures.size();
            else
                exAmount = count_if(foundCreatures.begin(), foundCreatures.end(), [&](Creature* c) { return c->IsTemporarySummon(); });

            if (exAmount >= reqAmount)
                return ShouldAbortScript(step);
        }
    }

    float orientation = o;

    if ((step.script->summonCreature.facingLogic == SO_SUMMONCREATURE_FACE_SUMMONER) || (step.script->summonCreature.facingLogic == SO_SUMMONCREATURE_FACE_TARGET))
    {
        WorldObject* facingTarget = ((step.script->summonCreature.facingLogic == SO_SUMMONCREATURE_FACE_TARGET) && target && target->isType(TYPEMASK_WORLDOBJECT)) ? static_cast<WorldObject*>(target) : pSummoner;

        float dx = facingTarget->GetPositionX() - x;
        float dy = facingTarget->GetPositionY() - y;

        orientation = atan2(dy, dx);
        orientation = (orientation >= 0) ? orientation : 2 * M_PI_F + orientation;
    }

    Creature* pCreature = pSummoner->SummonCreature(step.script->summonCreature.creatureEntry, x, y, z, orientation,
        TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, step.script->summonCreature.despawnDelay, step.script->summonCreature.flags & SF_SUMMONCREATURE_ACTIVE);

    if (!pCreature)
    {
        sLog.outError("SCRIPT_COMMAND_TEMP_SUMMON (script id %u) failed for creature (entry: %u).", step.script->id, step.script->summonCreature.creatureEntry);
        return ShouldAbortScript(step);
    }

    if (step.script->summonCreature.setRun == 1)
        pCreature->SetWalk(false);

    return false;
}

// SCRIPT_COMMAND_OPEN_DOOR (11)
bool Map::ScriptCommand_OpenDoor(ScriptAction& step, Object* source, Object* target)
{
    GameObject *pDoor = nullptr;
    uint32 guidlow = step.script->openDoor.goGuid;

    if (guidlow)
    {
        GameObjectData const* goData = sObjectMgr.GetGOData(guidlow);
        if (!goData)                                // checked at load
            return ShouldAbortScript(step);

        pDoor = GetGameObject(ObjectGuid(HIGHGUID_GAMEOBJECT, goData->id, guidlow));
    }
    else if (target && target->GetTypeId() == TYPEID_GAMEOBJECT)
        pDoor = static_cast<GameObject*>(target);
    else if (source && source->GetTypeId() == TYPEID_GAMEOBJECT)
        pDoor = static_cast<GameObject*>(source);

    if (!pDoor)
    {
        sLog.outError("SCRIPT_COMMAND_OPEN_DOOR (script id %u) failed for gameobject(guid: %u).", step.script->id, guidlow);
        return ShouldAbortScript(step);
    }

    if (pDoor->GetGoType() != GAMEOBJECT_TYPE_DOOR)
    {
        sLog.outError("SCRIPT_COMMAND_OPEN_DOOR (script id %u) failed for non-door(GoType: %u).", step.script->id, pDoor->GetGoType());
        return ShouldAbortScript(step);
    }

    if (pDoor->GetGoState() != GO_STATE_READY)
        return ShouldAbortScript(step);         //door already  open

    int32 time_to_close = step.script->openDoor.resetDelay < 3 ? 3 : step.script->openDoor.resetDelay; // Ustaag <Nostalrius> : duree minimale de reset fixee a 3 sec au lieu de 15

    pDoor->UseDoorOrButton(time_to_close);

    if (target && target->isType(TYPEMASK_GAMEOBJECT) && (static_cast<GameObject*>(target))->GetGoType() == GAMEOBJECT_TYPE_BUTTON)
        (static_cast<GameObject*>(target))->UseDoorOrButton(time_to_close);

    return false;
}

// SCRIPT_COMMAND_CLOSE_DOOR (12)
bool Map::ScriptCommand_CloseDoor(ScriptAction& step, Object* source, Object* target)
{
    GameObject *pDoor = nullptr;
    uint32 guidlow = step.script->closeDoor.goGuid;

    if (guidlow)
    {
        GameObjectData const* goData = sObjectMgr.GetGOData(guidlow);
        if (!goData)                                // checked at load
            return ShouldAbortScript(step);

        pDoor = GetGameObject(ObjectGuid(HIGHGUID_GAMEOBJECT, goData->id, guidlow));
    }
    else if (target && target->GetTypeId() == TYPEID_GAMEOBJECT)
        pDoor = static_cast<GameObject*>(target);
    else if (source && source->GetTypeId() == TYPEID_GAMEOBJECT)
        pDoor = static_cast<GameObject*>(source);

    if (!pDoor)
    {
        sLog.outError("SCRIPT_COMMAND_CLOSE_DOOR (script id %u) failed for gameobject(guid: %u).", step.script->id, guidlow);
        return ShouldAbortScript(step);
    }
    if (pDoor->GetGoType() != GAMEOBJECT_TYPE_DOOR)
    {
        sLog.outError("SCRIPT_COMMAND_CLOSE_DOOR (script id %u) failed for non-door(GoType: %u).", step.script->id, pDoor->GetGoType());
        return ShouldAbortScript(step);
    }

    if (pDoor->GetGoState() == GO_STATE_READY)
        return ShouldAbortScript(step);         //door already closed

    int32 time_to_open = step.script->closeDoor.resetDelay < 3 ? 3 : step.script->closeDoor.resetDelay; // Ustaag <Nostalrius> : duree minimale de reset fixee a 3 sec au lieu de 15

    pDoor->UseDoorOrButton(time_to_open);

    if (target && target->isType(TYPEMASK_GAMEOBJECT) && (static_cast<GameObject*>(target))->GetGoType() == GAMEOBJECT_TYPE_BUTTON)
        (static_cast<GameObject*>(target))->UseDoorOrButton(time_to_open);

    return false;
}

// SCRIPT_COMMAND_ACTIVATE_OBJECT (13)
bool Map::ScriptCommand_ActivateGameObject(ScriptAction& step, Object* source, Object* target)
{
    Unit* pUser = nullptr;
    GameObject *pGo = nullptr;

    if (!((pUser = ToUnit(source)) || (pUser = ToUnit(target))))
    {
        sLog.outError("SCRIPT_COMMAND_ACTIVATE_OBJECT (script id %u) call for a NULL user, skipping.", step.script->id);
        return ShouldAbortScript(step);
    }

    if (!((pGo = ToGameObject(target)) || (pGo = ToGameObject(source))))
    {
        sLog.outError("SCRIPT_COMMAND_ACTIVATE_OBJECT (script id %u) call for a NULL gameobject, skipping.", step.script->id);
        return ShouldAbortScript(step);
    }

    pGo->Use(pUser);
    return false;
}

// SCRIPT_COMMAND_REMOVE_AURA (14)
bool Map::ScriptCommand_RemoveAura(ScriptAction& step, Object* source, Object* target)
{
    Unit* pUnitTarget = ToUnit(source);

    if (!pUnitTarget)
    {
        sLog.outError("SCRIPT_COMMAND_REMOVE_AURA (script id %u) call for a NULL or non-unit source (TypeId: %u), skipping.", step.script->id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(step);
    }

    pUnitTarget->RemoveAurasDueToSpell(step.script->removeAura.spellId);
    return false;
}

// SCRIPT_COMMAND_CAST_SPELL (15)
bool Map::ScriptCommand_CastSpell(ScriptAction& step, Object* source, Object* target)
{
    Unit* pUnitSource = ToUnit(source);
    Unit* pUnitTarget = ToUnit(target);

    if (!pUnitSource || !pUnitTarget)
    {
        sLog.outError("SCRIPT_COMMAND_CAST_SPELL (script id %u) call for a NULL source or target, skipping.", step.script->id);
        return ShouldAbortScript(step);
    }

    if ((step.script->castSpell.flags & SF_CASTSPELL_INTERRUPT_PREVIOUS) && pUnitSource->IsNonMeleeSpellCasted(false))
        pUnitSource->InterruptNonMeleeSpells(false);

    //TODO: when GO cast implemented, code below must be updated accordingly to also allow GO spell cast
    pUnitSource->CastSpell(pUnitTarget, step.script->castSpell.spellId, (step.script->castSpell.flags & SF_CASTSPELL_TRIGGERED) != 0);

    return false;
}

// SCRIPT_COMMAND_PLAY_SOUND (16)
bool Map::ScriptCommand_PlaySound(ScriptAction& step, Object* source, Object* target)
{
    WorldObject* pSource = ToWorldObject(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_PLAY_SOUND (script id %u) call for a NULL or non-worldobject source (TypeId: %u), skipping.", step.script->id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(step);
    }

    Player* pTarget = nullptr;

    if ((step.script->playSound.flags & SF_PLAYSOUND_ONLY_TO_TARGET) && !(pTarget = ToPlayer(target)))
    {
        sLog.outError("SCRIPT_COMMAND_PLAY_SOUND (script id %u) in targeted mode call for a NULL or non-player target (TypeId: %u), skipping.", step.script->id, target ? target->GetTypeId() : 0);
        return ShouldAbortScript(step);
    }

    if (step.script->playSound.flags & SF_PLAYSOUND_DISTANCE_DEPENDENT)
        pSource->PlayDistanceSound(step.script->playSound.soundId, pTarget);
    else
        pSource->PlayDirectSound(step.script->playSound.soundId, pTarget);

    return false;
}

// SCRIPT_COMMAND_CREATE_ITEM (17)
bool Map::ScriptCommand_CreateItem(ScriptAction& step, Object* source, Object* target)
{
    Player* pReceiver;

    if (!((pReceiver = ToPlayer(target)) || (pReceiver = ToPlayer(source))))
    {
        sLog.outError("SCRIPT_COMMAND_CREATE_ITEM (script id %u) call for a NULL or non-player object (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", step.script->id, source ? source->GetTypeId() : 0, target ? target->GetTypeId() : 0);
        return ShouldAbortScript(step);
    }

    if (Item* pItem = pReceiver->StoreNewItemInInventorySlot(step.script->createItem.itemEntry, step.script->createItem.amount))
        pReceiver->SendNewItem(pItem, step.script->createItem.amount, true, false);

    return false;
}

// SCRIPT_COMMAND_DESPAWN_CREATURE (18)
bool Map::ScriptCommand_DespawnCreature(ScriptAction& step, Object* source, Object* target)
{
    Creature* pSource = ToCreature(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_DESPAWN_CREATURE (script id %u) call for a NULL or non-creature source (TypeId: %u), skipping.", step.script->id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(step);
    }

    pSource->DespawnOrUnsummon(step.script->despawn.despawnDelay);

    return false;
}

// SCRIPT_COMMAND_SET_EQUIPMENT (19)
bool Map::ScriptCommand_SetEquipment(ScriptAction& step, Object* source, Object* target)
{
    Creature* pSource = ToCreature(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_DESPAWN_CREATURE (script id %u) call for a NULL or non-creature source (TypeId: %u), skipping.", step.script->id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(step);
    }

    if (step.script->setEquipment.resetDefault)
    {
        pSource->LoadEquipment(pSource->GetCreatureInfo()->equipmentId, true);
        return false;
    }

    // main hand
    if (step.script->setEquipment.slot[0] >= 0)
        pSource->SetVirtualItem(VIRTUAL_ITEM_SLOT_0, step.script->setEquipment.slot[0]);

    // off hand
    if (step.script->setEquipment.slot[1] >= 0)
        pSource->SetVirtualItem(VIRTUAL_ITEM_SLOT_1, step.script->setEquipment.slot[1]);

    // ranged
    if (step.script->setEquipment.slot[2] >= 0)
        pSource->SetVirtualItem(VIRTUAL_ITEM_SLOT_2, step.script->setEquipment.slot[2]);

    return false;
}

// SCRIPT_COMMAND_MOVEMENT (20)
bool Map::ScriptCommand_SetMovementType(ScriptAction& step, Object* source, Object* target)
{
    Creature* pSource;
    Unit* pTarget;

    if (pSource = ToCreature(source))
        pTarget = ToUnit(target);
    else if (pSource = ToCreature(target))
        pTarget = ToUnit(source);
    else
    {
        sLog.outError("SCRIPT_COMMAND_MOVEMENT (script id %u) call for a NULL or non-creature source and target (TypeIdSource: %u)(TypeIdTarget: %u), skipping", step.script->id, source ? source->GetTypeId() : 0, target ? target->GetTypeId() : 0);
        return ShouldAbortScript(step);
    }

    // Consider add additional checks for cases where creature should not change movementType
    // (pet? in combat? already using same MMgen as script try to apply?)

    switch (step.script->movement.movementType)
    {
        case IDLE_MOTION_TYPE:
            pSource->GetMotionMaster()->MoveIdle();
            break;
        case RANDOM_MOTION_TYPE:
            pSource->GetMotionMaster()->MoveRandom();
            break;
        case WAYPOINT_MOTION_TYPE:
            pSource->GetMotionMaster()->MoveWaypoint(step.script->movement.boolParam);
            break;
        case CONFUSED_MOTION_TYPE:
            pSource->GetMotionMaster()->MoveConfused();
            break;
        case CHASE_MOTION_TYPE:
            if (step.script->movement.boolParam) // chase victim
            {
                if (Unit* pVictim = pSource->getVictim())
                    pSource->GetMotionMaster()->MoveChase(pVictim, step.script->x, step.script->o);
                break;
            }
            else if (pTarget)
                pSource->GetMotionMaster()->MoveChase(pTarget, step.script->x, step.script->o);
            break;
        case HOME_MOTION_TYPE:
            pSource->GetMotionMaster()->MoveTargetedHome();
            break;
        case FLEEING_MOTION_TYPE:
            if (step.script->movement.boolParam) // flee from victim
            {
                if (Unit* pVictim = pSource->getVictim())
                    pSource->GetMotionMaster()->MoveFleeing(pVictim, step.script->movement.intParam);
                break;
            }
            else if (pTarget)
                pSource->GetMotionMaster()->MoveFleeing(pTarget, step.script->movement.intParam);
            break;
        case DISTRACT_MOTION_TYPE:
            pSource->GetMotionMaster()->MoveDistract(step.script->movement.intParam);
            break;
        case FOLLOW_MOTION_TYPE:
            if (pTarget)
                pSource->GetMotionMaster()->MoveFollow(pTarget, step.script->x, step.script->o);
            break;
        case CHARGE_MOTION_TYPE:
            if (pTarget)
                pSource->GetMotionMaster()->MoveCharge(pTarget, step.script->movement.intParam, step.script->movement.boolParam);
            break;
        default:
            sLog.outError("SCRIPT_COMMAND_MOVEMENT (script id %u) call for an invalid motion type (MotionType: %u), skipping.", step.script->id, step.script->movement.movementType);
            return ShouldAbortScript(step);
    }

    return false;
}

// SCRIPT_COMMAND_SET_ACTIVEOBJECT (21)
bool Map::ScriptCommand_SetActiveObject(ScriptAction& step, Object* source, Object* target)
{
    Creature* pSource;

    if (!((pSource = ToCreature(source)) || (pSource = ToCreature(target))))
    {
        sLog.outError("SCRIPT_COMMAND_SET_ACTIVEOBJECT (script id %u) call for a NULL or non-creature source and target (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", step.script->id, source ? source->GetTypeId() : 0, target ? target->GetTypeId() : 0);
        return ShouldAbortScript(step);
    }

    pSource->SetActiveObjectState(step.script->activeObject.activate);

    return false;
}

// SCRIPT_COMMAND_SET_FACTION (22)
bool Map::ScriptCommand_SetFaction(ScriptAction& step, Object* source, Object* target)
{
    Creature* pSource;

    if (!((pSource = ToCreature(source)) || (pSource = ToCreature(target))))
    {
        sLog.outError("SCRIPT_COMMAND_SET_FACTION (script id %u) call for a NULL or non-creature source and target (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", step.script->id, source ? source->GetTypeId() : 0, target ? target->GetTypeId() : 0);
        return ShouldAbortScript(step);
    }

    if (step.script->faction.factionId)
        pSource->SetFactionTemporary(step.script->faction.factionId, step.script->faction.flags);
    else
        pSource->ClearTemporaryFaction();

    return false;
}

// SCRIPT_COMMAND_MORPH_TO_ENTRY_OR_MODEL (23)
bool Map::ScriptCommand_Morph(ScriptAction& step, Object* source, Object* target)
{
    Creature* pSource;

    if (!((pSource = ToCreature(source)) || (pSource = ToCreature(target))))
    {
        sLog.outError("SCRIPT_COMMAND_MORPH_TO_ENTRY_OR_MODEL (script id %u) call for a NULL or non-creature source and target (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", step.script->id, source ? source->GetTypeId() : 0, target ? target->GetTypeId() : 0);
        return ShouldAbortScript(step);
    }

    if (!step.script->morph.creatureOrModelEntry)
        pSource->DeMorph();
    else if (step.script->morph.isDisplayId)
        pSource->SetDisplayId(step.script->morph.creatureOrModelEntry);
    else
    {
        CreatureInfo const* ci = ObjectMgr::GetCreatureTemplate(step.script->morph.creatureOrModelEntry);
        uint32 display_id = Creature::ChooseDisplayId(ci);

        pSource->SetDisplayId(display_id);
    }

    return false;
}

// SCRIPT_COMMAND_MOUNT_TO_ENTRY_OR_MODEL (24)
bool Map::ScriptCommand_Mount(ScriptAction& step, Object* source, Object* target)
{
    Creature* pSource;

    if (!((pSource = ToCreature(source)) || (pSource = ToCreature(target))))
    {
        sLog.outError("SCRIPT_COMMAND_MOUNT_TO_ENTRY_OR_MODEL (script id %u) call for a NULL or non-creature source and target (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", step.script->id, source ? source->GetTypeId() : 0, target ? target->GetTypeId() : 0);
        return ShouldAbortScript(step);
    }

    if (!step.script->mount.creatureOrModelEntry)
        pSource->Unmount();
    else if (step.script->mount.isDisplayId)
        pSource->Mount(step.script->mount.creatureOrModelEntry);
    else
    {
        CreatureInfo const* ci = ObjectMgr::GetCreatureTemplate(step.script->mount.creatureOrModelEntry);
        uint32 display_id = Creature::ChooseDisplayId(ci);

        pSource->Mount(display_id);
    }

    return false;
}

// SCRIPT_COMMAND_SET_RUN (25)
bool Map::ScriptCommand_SetRun(ScriptAction& step, Object* source, Object* target)
{
    Creature* pSource;

    if (!((pSource = ToCreature(source)) || (pSource = ToCreature(target))))
    {
        sLog.outError("SCRIPT_COMMAND_SET_RUN (script id %u) call for a NULL or non-creature source and target (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", step.script->id, source ? source->GetTypeId() : 0, target ? target->GetTypeId() : 0);
        return ShouldAbortScript(step);
    }

    pSource->SetWalk(!step.script->run.run);

    return false;
}

// SCRIPT_COMMAND_ATTACK_START (26)
bool Map::ScriptCommand_AttackStart(ScriptAction& step, Object* source, Object* target)
{
    Unit* pTarget = ToUnit(target);
    Creature* pAttacker = ToCreature(source);

    if (!pAttacker || !pTarget)
    {
        sLog.outError("SCRIPT_COMMAND_ATTACK_START (script id %u) call for a NULL source or target (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", step.script->id, source ? source->GetTypeId() : 0, target ? target->GetTypeId() : 0);
        return ShouldAbortScript(step);
    }

    if (pAttacker->IsFriendlyTo(pTarget))
    {
        sLog.outError("SCRIPT_COMMAND_ATTACK_START (script id %u) attacker is friendly to target, can not attack.", step.script->id);
        return ShouldAbortScript(step);
    }

    pAttacker->AI()->AttackStart(pTarget);

    return false;
}

// SCRIPT_COMMAND_UPDATE_ENTRY (27)
bool Map::ScriptCommand_UpdateEntry(ScriptAction& step, Object* source, Object* target)
{
    Creature* pSource = ToCreature(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_UPDATE_ENTRY (script id %u) call for a NULL or non-creature source (TypeId: %u), skipping.", step.script->id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(step);
    }

    if (pSource->GetEntry() != step.script->updateEntry.creatureEntry)
        pSource->UpdateEntry(step.script->updateEntry.creatureEntry, step.script->updateEntry.team ? HORDE : ALLIANCE);

    return false;
}

// SCRIPT_COMMAND_STAND_STATE (28)
bool Map::ScriptCommand_SetStandState(ScriptAction& step, Object* source, Object* target)
{
    Unit* pSource = ToUnit(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_STAND_STATE (script id %u) call for a NULL or non-unit source (TypeId: %u), skipping", step.script->id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(step);
    }

    pSource->SetStandState(step.script->standState.stand_state);

    return false;
}

// SCRIPT_COMMAND_MODIFY_THREAT (29)
bool Map::ScriptCommand_ModifyThreat(ScriptAction& step, Object* source, Object* target)
{
    Creature* pSource = ToCreature(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_MODIFY_THREAT (script id %u) call for a NULL or non-creature source (TypeId: %u), skipping.", step.script->id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(step);
    }

    switch (step.script->modThreat.target)
    {
        case SO_MODIFYTHREAT_PROVIDED_TARGET:
        {
            if (target && target->isType(TYPEMASK_UNIT))
                pSource->getThreatManager().modifyThreatPercent(static_cast<Unit*>(target), step.script->x);
            break;
        }
        case SO_MODIFYTHREAT_CURRENT_VICTIM:
        {
            if (Unit* pVictim = pSource->getVictim())
                pSource->getThreatManager().modifyThreatPercent(pVictim, step.script->x);
            break;
        }
        case SO_MODIFYTHREAT_ALL_ATTACKERS:
        {
            ThreatList const& threatList = pSource->getThreatManager().getThreatList();
            for (ThreatList::const_iterator i = threatList.begin(); i != threatList.end(); ++i)
                if (Unit* Temp = pSource->GetMap()->GetUnit((*i)->getUnitGuid()))
                    pSource->getThreatManager().modifyThreatPercent(Temp, step.script->x);
            break;
        }
    }

    return false;
}

// SCRIPT_COMMAND_SEND_TAXI_PATH (30)
bool Map::ScriptCommand_SendTaxiPath(ScriptAction& step, Object* source, Object* target)
{
    Player* pPlayer;

    if (!((pPlayer = ToPlayer(target)) || (pPlayer = ToPlayer(source))))
    {
        sLog.outError("SCRIPT_COMMAND_SEND_TAXI_PATH (script id %u) call for a non-player source and target (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", step.script->id, source ? source->GetTypeId() : 0, target ? target->GetTypeId() : 0);
        return ShouldAbortScript(step);
    }

    pPlayer->ActivateTaxiPathTo(step.script->sendTaxiPath.taxiPathId, 0, true);
    return false;
}

// SCRIPT_COMMAND_TERMINATE_SCRIPT (31)
bool Map::ScriptCommand_TerminateScript(ScriptAction& step, Object* source, Object* target)
{
    if (step.script->terminateScript.creatureEntry)
    {
        WorldObject* pSearcher;
        if (!((pSearcher = ToWorldObject(source)) || (pSearcher = ToWorldObject(target))))
        {
            sLog.outError("SCRIPT_COMMAND_TERMINATE_SCRIPT (script id %u) call for a NULL object, skipping.", step.script->id);
            return ShouldAbortScript(step);
        }

        Creature* pCreatureBuddy = nullptr;
        MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck u_check(*pSearcher, step.script->terminateScript.creatureEntry, true, step.script->terminateScript.searchRadius);
        MaNGOS::CreatureLastSearcher<MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck> searcher(pCreatureBuddy, u_check);
        Cell::VisitGridObjects(pSearcher, searcher, step.script->terminateScript.searchRadius);

        if ((step.script->terminateScript.flags == SO_TERMINATESCRIPT_IF_NOT_FOUND) && !pCreatureBuddy)
            return true; // when npc was not found alive
        else if ((step.script->terminateScript.flags == SO_TERMINATESCRIPT_IF_FOUND) && pCreatureBuddy)
            return true; // when npc was found alive
    }
    else
        return true; // Terminate further steps of this script

    return false;
}

// SCRIPT_COMMAND_TERMINATE_CONDITION (32)
bool Map::ScriptCommand_TerminateCondition(ScriptAction& step, Object* source, Object* target)
{
    WorldObject* pSource = ToWorldObject(source);
    WorldObject* pTarget = ToWorldObject(target);

    bool terminateResult = sObjectMgr.IsConditionSatisfied(step.script->terminateCond.conditionId, pTarget, this, pSource, CONDITION_FROM_DBSCRIPTS);
    
    if (step.script->terminateCond.flags & SF_TERMINATECONDITION_WHEN_FALSE)
        terminateResult = !terminateResult;

    if (terminateResult && step.script->terminateCond.failQuest)
    {
        Player* pPlayer;

        if ((pPlayer = ToPlayer(pSource)) || (pPlayer = ToPlayer(pTarget)))
            pPlayer->GroupEventFailHappens(step.script->terminateCond.failQuest);
    }

    return terminateResult; // Terminate further steps of this script
}

// SCRIPT_COMMAND_ENTER_EVADE_MODE (33)
bool Map::ScriptCommand_Evade(ScriptAction& step, Object* source, Object* target)
{
    Creature* pSource;

    if (!((pSource = ToCreature(source)) || (pSource = ToCreature(target))))
    {
        sLog.outError("SCRIPT_COMMAND_ENTER_EVADE_MODE (script id %u) call for a NULL or non-creature source and target (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", step.script->id, source ? source->GetTypeId() : 0, target ? target->GetTypeId() : 0);
        return ShouldAbortScript(step);
    }

    if (pSource->AI())
        pSource->AI()->EnterEvadeMode();

    return false;
}

// SCRIPT_COMMAND_SET_HOME_POSITION (34)
bool Map::ScriptCommand_SetHomePosition(ScriptAction& step, Object* source, Object* target)
{
    Creature* pSource;

    if (!((pSource = ToCreature(source)) || (pSource = ToCreature(target))))
    {
        sLog.outError("SCRIPT_COMMAND_SET_HOME_POSITION (script id %u) call for a NULL or non-creature source and target (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", step.script->id, source ? source->GetTypeId() : 0, target ? target->GetTypeId() : 0);
        return ShouldAbortScript(step);
    }

    if (step.script->setHome.useCurrent)
        pSource->SaveHomePosition();
    else
        pSource->SetHomePosition(step.script->x, step.script->y, step.script->z, step.script->o);

    return false;
}

// SCRIPT_COMMAND_TURN_TO (35)
bool Map::ScriptCommand_TurnTo(ScriptAction& step, Object* source, Object* target)
{
    Unit* pSource = ToUnit(source);

    if (!pSource)
    {
        sLog.outError("SCRIPT_COMMAND_TURN_TO (script id %u) call for a NULL or non-unit source (TypeId: %u), skipping.", step.script->id, source ? source->GetTypeId() : 0);
        return ShouldAbortScript(step);
    }

    switch (step.script->turnTo.facingLogic)
    {
        case SO_TURNTO_FACE_TARGET:
        {
            if (WorldObject* pTarget = ToWorldObject(target))
                pSource->SetFacingToObject(pTarget);
            else
            {
                sLog.outError("SCRIPT_COMMAND_TURN_TO (script id %u) call with datalong=0 for a non-worldobject target (TypeId: %u), skipping", step.script->id, target ? target->GetTypeId() : 0);
                return ShouldAbortScript(step);
            }
            break;
        }
        case SO_TURNTO_PROVIDED_ORIENTATION:
        {
            pSource->SetFacingTo(step.script->o);
            break;
        }
    }

    return false;
}

// SCRIPT_COMMAND_MEETINGSTONE (36)
bool Map::ScriptCommand_MeetingStone(ScriptAction& step, Object* source, Object* target)
{
    Player* pPlayer;

    if (!((pPlayer = ToPlayer(target)) || (pPlayer = ToPlayer(source))))
    {
        sLog.outError("SCRIPT_COMMAND_MEETINGSTONE (script id %u) call for a NULL or non-player source and target (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", step.script->id, source ? source->GetTypeId() : 0, target ? target->GetTypeId() : 0);
        return ShouldAbortScript(step);
    }

    if (!sLFGMgr.IsPlayerInQueue(pPlayer->GetObjectGuid()))
        sLFGMgr.AddToQueue(pPlayer, step.script->meetingstone.areaId);

    return false;
}

// SCRIPT_COMMAND_SET_INST_DATA (37)
bool Map::ScriptCommand_SetData(ScriptAction& step, Object* source, Object* target)
{
    InstanceData* pInst = GetInstanceData();
    
    if (!pInst)
    {
        sLog.outError("SCRIPT_COMMAND_SET_INST_DATA (script id %u) call for map without an instance script, skipping.", step.script->id);
        return ShouldAbortScript(step);
    }

    uint32 uiData = step.script->setData.data;
    switch (step.script->setData.type)
    {
        case SO_INSTDATA_RAW:
        {
            break;
        }
        case SO_INSTDATA_INCREMENT:
        {
            uiData+= pInst->GetData(step.script->setData.field);
            break;
        }
        case SO_INSTDATA_DECREMENT:
        {
            uint32 uiOldData = pInst->GetData(step.script->setData.field);
            uiData = (uiData < uiOldData) ? (uiOldData - uiData) : 0;
            break;
        }
        default:
        {
            sLog.outError("SCRIPT_COMMAND_SET_INST_DATA (script id %u) call for an invalid type (datalong3=%u), skipping.", step.script->id, step.script->setData.type);
            return ShouldAbortScript(step);
        }
    }

    pInst->SetData(step.script->setData.field, uiData);
    return false;
}

// SCRIPT_COMMAND_SET_INST_DATA64 (38)
bool Map::ScriptCommand_SetData64(ScriptAction& step, Object* source, Object* target)
{
    InstanceData* pInst = GetInstanceData();
    
    if (!pInst)
    {
        sLog.outError("SCRIPT_COMMAND_SET_INST_DATA64 (script id %u) call for map without an instance script, skipping.", step.script->id);
        return ShouldAbortScript(step);
    }

    switch (step.script->setData64.type)
    {
        case SO_INSTDATA64_RAW:
        {
            pInst->SetData64(step.script->setData64.field, step.script->setData64.data);
            break;
        }
        case SO_INSTDATA64_SOURCE_GUID:
        {
            if (source)
                pInst->SetData64(step.script->setData64.field, source->GetGUID());
            else
            {
                sLog.outError("SCRIPT_COMMAND_SET_INST_DATA64 (script id %u) call for a NULL source, skipping.", step.script->id);
                return ShouldAbortScript(step);
            }
            break;
        }
        default:
        {
            sLog.outError("SCRIPT_COMMAND_SET_INST_DATA64 (script id %u) call for an invalid type (datalong3=%u), skipping.", step.script->id, step.script->setData64.type);
            return ShouldAbortScript(step);
        }
    }

    return false;
}

// SCRIPT_COMMAND_START_SCRIPT (39)
bool Map::ScriptCommand_StartScript(ScriptAction& step, Object* source, Object* target)
{
    const uint32 roll = urand(1, 100);
    uint32 sum = 0;
    uint32 chosenId = 0;

    for (int i = 0; i < 4; i++)
    {
        const uint32 currentId = step.script->startScript.scriptId[i];

        if (!currentId)
            continue;

        const uint32 currentChance = step.script->startScript.chance[i];

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
        return ShouldAbortScript(step);

    return false;
}

// SCRIPT_COMMAND_REMOVE_ITEM (40)
bool Map::ScriptCommand_RemoveItem(ScriptAction& step, Object* source, Object* target)
{
    Player* pPlayer;

    if (!((pPlayer = ToPlayer(target)) || (pPlayer = ToPlayer(source))))
    {
        sLog.outError("SCRIPT_COMMAND_REMOVE_ITEM (script id %u) call for a NULL or non-player source and target (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", step.script->id, source ? source->GetTypeId() : 0, target ? target->GetTypeId() : 0);
        return ShouldAbortScript(step);
    }

    pPlayer->DestroyItemCount(step.script->createItem.itemEntry, step.script->createItem.amount, true);

    return false;
}

// SCRIPT_COMMAND_REMOVE_OBJECT (41)
bool Map::ScriptCommand_RemoveGameObject(ScriptAction& step, Object* source, Object* target)
{
    GameObject *pGo = nullptr;

    if (!((pGo = ToGameObject(target)) || (pGo = ToGameObject(source))))
    {
        sLog.outError("SCRIPT_COMMAND_REMOVE_OBJECT (script id %u) call for a NULL gameobject, skipping.", step.script->id);
        return ShouldAbortScript(step);
    }

    pGo->SetLootState(GO_JUST_DEACTIVATED);
    pGo->AddObjectToRemoveList();
    return false;
}