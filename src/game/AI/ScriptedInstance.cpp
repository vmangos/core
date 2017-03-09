/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 * This program is free software licensed under GPL version 2
 * Please see the included DOCS/LICENSE.TXT for more information */

#include "Player.h"
#include "ScriptedInstance.h"

#define SAVE_LOAD_LOG sLog.outDebug

//Optional uiWithRestoreTime. If not defined, autoCloseTime will be used (if not 0 by default in *_template)
void ScriptedInstance::DoUseDoorOrButton(uint64 uiGuid, uint32 uiWithRestoreTime, bool bUseAlternativeState)
{
    if (!uiGuid)
        return;

    GameObject* pGo = instance->GetGameObject(uiGuid);

    if (pGo)
    {
        if (pGo->GetGoType() == GAMEOBJECT_TYPE_DOOR || pGo->GetGoType() == GAMEOBJECT_TYPE_BUTTON)
        {
            if (pGo->getLootState() == GO_READY)
                pGo->UseDoorOrButton(uiWithRestoreTime,bUseAlternativeState);
            else if (pGo->getLootState() == GO_ACTIVATED)
                pGo->ResetDoorOrButton();
        }
        else
            sLog.outError("Script call DoUseDoorOrButton, but gameobject entry %u is type %u.",pGo->GetEntry(),pGo->GetGoType());
    }
}

void ScriptedInstance::DoRespawnGameObject(uint64 uiGuid, uint32 uiTimeToDespawn)
{
    if (GameObject* pGo = instance->GetGameObject(uiGuid))
    {
        //not expect any of these should ever be handled
        if (pGo->GetGoType()==GAMEOBJECT_TYPE_FISHINGNODE || pGo->GetGoType()==GAMEOBJECT_TYPE_DOOR ||
            pGo->GetGoType()==GAMEOBJECT_TYPE_BUTTON || pGo->GetGoType()==GAMEOBJECT_TYPE_TRAP)
            return;

        if (pGo->isSpawned())
            return;

        pGo->SetRespawnTime(uiTimeToDespawn);
        pGo->Refresh();
    }
}

void ScriptedInstance::DoOpenDoor(uint64 uiGuid)
{
    if (!uiGuid)
        return;

    GameObject* pGo = instance->GetGameObject(uiGuid);

    if (pGo)
    {
        if (pGo->GetGoType() == GAMEOBJECT_TYPE_DOOR || pGo->GetGoType() == GAMEOBJECT_TYPE_BUTTON)
        {
            if (pGo->getLootState() == GO_READY)
                pGo->UseDoorOrButton(0, false);
        }
        else
            sLog.outError("Script call DoOpenDoor, but gameobject entry %u is type %u.",pGo->GetEntry(),pGo->GetGoType());
    }
}

void ScriptedInstance::DoResetDoor(uint64 uiGuid)
{
    if (!uiGuid)
        return;

    GameObject* pGo = instance->GetGameObject(uiGuid);

    if (pGo)
    {
        if (pGo->GetGoType() == GAMEOBJECT_TYPE_DOOR || pGo->GetGoType() == GAMEOBJECT_TYPE_BUTTON)
            pGo->ResetDoorOrButton();
        else
            sLog.outError("Script call DoResetDoor, but gameobject entry %u is type %u.",pGo->GetEntry(),pGo->GetGoType());
    }
}

void ScriptedInstance::DoUpdateWorldState(uint32 uiStateId, uint32 uiStateData)
{
    Map::PlayerList const& lPlayers = instance->GetPlayers();

    if (!lPlayers.isEmpty())
    {
        for(Map::PlayerList::const_iterator itr = lPlayers.begin(); itr != lPlayers.end(); ++itr)
        {
            if (Player* pPlayer = itr->getSource())
                pPlayer->SendUpdateWorldState(uiStateId, uiStateData);
        }
    }
    else
        sLog.outDebug("DoUpdateWorldState attempt send data but no players in map.");
}

std::string ScriptedInstance::GenSaveData(uint32* encounters, uint32 maxIndex)
{
    bool first = true;
    std::ostringstream saveStream;
    for (uint32 i = 0; i <= maxIndex; ++i)
    {
        if (!first)
            saveStream << " ";
        first = false;
        saveStream << encounters[i];
    }
    SAVE_LOAD_LOG("Sauvegarde : `%s`", saveStream.str().c_str());
    return saveStream.str();
}

void ScriptedInstance::LoadSaveData(const char* pStr, uint32* encounters, uint32 maxIndex)
{
    SAVE_LOAD_LOG("Chargement : `%s`", pStr);
    std::istringstream loadStream(pStr);
    for (uint32 i = 0; i <= maxIndex; ++i)
    {
        loadStream >> encounters[i];
        SAVE_LOAD_LOG("* %u = %u", i, encounters[i]);
    }
}

/// Returns a pointer to a loaded GameObject that was stored in m_mGoEntryGuidStore. Can return NULL
GameObject* ScriptedInstance::GetSingleGameObjectFromStorage(uint32 uiEntry)
{
    EntryGuidMap::iterator find = m_mGoEntryGuidStore.find(uiEntry);
    if (find != m_mGoEntryGuidStore.end())
        return instance->GetGameObject(find->second);

    // Output log, possible reason is not added GO to map, or not yet loaded;
    sLog.outError("Script requested gameobject with entry %u, but no gameobject of this entry was created yet, or it was not stored by script for map %u.", uiEntry, instance->GetId());

    return nullptr;
}

/// Returns a pointer to a loaded Creature that was stored in m_mGoEntryGuidStore. Can return NULL
Creature* ScriptedInstance::GetSingleCreatureFromStorage(uint32 uiEntry, bool bSkipDebugLog /*=false*/)
{
    EntryGuidMap::iterator find = m_mNpcEntryGuidStore.find(uiEntry);
    if (find != m_mNpcEntryGuidStore.end())
        return instance->GetCreature(find->second);

    // Output log, possible reason is not added GO to map, or not yet loaded;
    if (!bSkipDebugLog)
        sLog.outError("Script requested creature with entry %u, but no npc of this entry was created yet, or it was not stored by script for map %u.", uiEntry, instance->GetId());

    return nullptr;
}

void ScriptedInstance_PTR::OnCreatureEnterCombat(Creature* creature)
{
    if (creature->IsWorldBoss())
    {
        std::map<ObjectGuid, time_t>::iterator it = boss_expirations.find(creature->GetObjectGuid());
        if (it == boss_expirations.end())
        {
            boss_expirations[creature->GetObjectGuid()] = time(nullptr);
            creature->MonsterSay("Remaining time before despawn: 20 minutes.");
        }
    }
    ScriptedInstance::OnCreatureEnterCombat(creature);
}

void ScriptedInstance_PTR::Update(uint32 diff)
{
    time_t expiration = time(nullptr) - 30*60;
    std::map<ObjectGuid, time_t>::iterator it = boss_expirations.begin();
    for (; it != boss_expirations.end(); ++it)
    {
        if (it->second < expiration)
            if (GetMap())
                if (Creature* c = GetMap()->GetCreature(it->first))
                {
                    if (!c->isAlive())
                        c->DoKillUnit();
                    c->SaveRespawnTime();
                    c->AddObjectToRemoveList();
                }
    }
    ScriptedInstance::Update(diff);
}
