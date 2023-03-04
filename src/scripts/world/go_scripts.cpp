/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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

/* ScriptData
SDName: GO_Scripts
SD%Complete: 100
SDComment: Quest support: 4296, 5088, 6481, 10990, 10991, 10992. Field_Repair_Bot->Teaches spell 22704. Barov_journal->Teaches spell 26089
SDCategory: Game Objects
EndScriptData */

/* ContentData
go_cat_figurine (the "trap" version of GO, two different exist)
go_field_repair_bot_74A
go_resonite_cask
go_silithyste
go_bells
go_darkmoon_faire_music
EndContentData */

#include "scriptPCH.h"
#include "Utilities/EventMap.h"

/*######
## go_cat_figurine
######*/

enum
{
    SPELL_SUMMON_GHOST_SABER    = 5968,
};

bool GOHello_go_cat_figurine(Player* pPlayer, GameObject* pGo)
{
    pPlayer->CastSpell(pPlayer, SPELL_SUMMON_GHOST_SABER, true);
    return false;
}


/*######
## go_field_repair_bot_74A
######*/

bool GOHello_go_field_repair_bot_74A(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->HasSkill(SKILL_ENGINEERING) && pPlayer->GetSkillValueBase(SKILL_ENGINEERING) >= 300 && !pPlayer->HasSpell(22704))
        pPlayer->CastSpell(pPlayer, 22864, false);
    return true;
}

/*######
## go_resonite_cask
######*/

enum
{
    NPC_GOGGEROC    = 11920
};

bool GOHello_go_resonite_cask(Player* pPlayer, GameObject* pGO)
{
    if (pGO->GetGoType() == GAMEOBJECT_TYPE_GOOBER)
        pGO->SummonCreature(NPC_GOGGEROC, 0.0f, 0.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 300000);

    return false;
}

// go_silithyste
bool GOHello_go_silithyste(Player* pPlayer, GameObject* pGo)
{
    // Histoire de pas recaster, car dans ce cas ca annule l'ancien buff, et ca spawn un autre monticule ...
    if (pPlayer->HasAura(29519, EFFECT_INDEX_0))
        return true;

    pPlayer->CastSpell(pPlayer, 29519, true);

    sLog.Out(LOG_BG, LOG_LVL_DETAIL, "%s [%u:%u:'%s'] reprend une Silithyst d'un monticule",
             pPlayer->GetName(),
             pPlayer->GetGUIDLow(), pPlayer->GetSession()->GetAccountId(), pPlayer->GetSession()->GetRemoteAddress().c_str());


    // On despawn seulement ceux qui sont la temporairement (Blizzlike ?)
    if (pGo->GetEntry() == 181597)
    {
        pGo->SetLootState(GO_JUST_DEACTIVATED);
        pGo->AddObjectToRemoveList();
    }
    else
        pGo->SetLootState(GO_JUST_DEACTIVATED);
    return true;
}

/*####
## go_bells
####*/

enum BellHourlySoundFX
{
    BELLTOLLHORDE      = 6595, // Undercity
    BELLTOLLTRIBAL     = 6675, // Orgrimma/Thunderbluff
    BELLTOLLALLIANCE   = 6594, // Stormwind
    BELLTOLLNIGHTELF   = 6674, // Darnassus
    BELLTOLLDWARFGNOME = 7234, // Ironforge
    LIGHTHOUSEFOGHORN  = 7197  // Lighthouses (TODO: not implememted yet)
};

enum BellHourlySoundZones
{
    TIRISFAL_ZONE            = 85,
    UNDERCITY_ZONE           = 1497,
    HILLSBRAD_FOOTHILLS_ZONE = 267,
    DUSKWOOD_ZONE            = 10,
    DUN_MOROGH_ZONE          = 1,
    IRONFORGE_ZONE           = 1537,
    TELDRASSIL_ZONE          = 141,
    DARNASSUS_ZONE           = 1657,
    ASHENVALE_ZONE           = 331,
};

enum BellHourlyObjects
{
    // bell gameobjects
    GO_HORDE_BELL = 175885,
    GO_ALLIANCE_BELL = 176573,
};

enum BellHourlyMisc
{
    GAME_EVENT_HOURLY_BELLS = 78,
    EVENT_RING_BELL = 1,
    EVENT_TIME = 2
};

struct go_bells : public GameObjectAI
{
    go_bells(GameObject* go) : GameObjectAI(go), _soundId(0), once(true)
    {
        uint32 zoneId = me->GetZoneId();

        switch (me->GetEntry())
        {
            case GO_HORDE_BELL:
            {
                switch (zoneId)
                {
                    case TIRISFAL_ZONE:
                    case UNDERCITY_ZONE:
                    case HILLSBRAD_FOOTHILLS_ZONE:
                    case DUSKWOOD_ZONE:
                         _soundId = BELLTOLLHORDE;  // undead bell sound 
                         break;
                    default:
                        _soundId = BELLTOLLTRIBAL; // drum sound
                        break;
                }
            break;
            }
            case GO_ALLIANCE_BELL:
            {
                switch (zoneId)
                {
                    case IRONFORGE_ZONE:
                    case DUN_MOROGH_ZONE:
                        _soundId = BELLTOLLDWARFGNOME; // horn sound
                        break;
                    case TELDRASSIL_ZONE:
                    case DARNASSUS_ZONE:
                    case ASHENVALE_ZONE:
                        _soundId = BELLTOLLNIGHTELF;   // nightelf bell sound 
                        break;
                    default:
                        _soundId = BELLTOLLALLIANCE;   // human bell sound
                        break;
                }
            break;
            }
        default:
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "go_bells() called with invalid object, ID: %u", me->GetEntry());
        }
    }

    void UpdateAI(uint32 const diff) override
    {
        m_events.Update(diff);

        if (sGameEventMgr.IsActiveEvent(GAME_EVENT_HOURLY_BELLS) && once)
        {
            // Reset
            once = false;
            m_events.ScheduleEvent(EVENT_TIME, Seconds(1));
        }

        while (uint32 eventId = m_events.ExecuteEvent())
        {
            switch (eventId)
            {
                case EVENT_TIME:
                {
                    // Get how many times it should ring
                    time_t rawtime;
                    time(&rawtime);
                    struct tm * timeinfo = localtime(&rawtime);
                    uint8 _rings = (timeinfo->tm_hour) % 12;
                    _rings = (_rings == 0) ? 12 : _rings; // 00:00 and 12:00

                    // Dwarf hourly horn should only play a single time, each time the next hour begins.
                    if (_soundId == BELLTOLLDWARFGNOME)
                    {
                        _rings = 1;
                    }

                    // Schedule ring event
                    for (auto i = 0; i < _rings; ++i)
                        m_events.ScheduleEvent(EVENT_RING_BELL, Seconds(i * 4 + 1));

                    break;
                }
                case EVENT_RING_BELL:
                    me->PlayDirectSound(_soundId);
                    break;
                default:
                    break;
            }
        }
    }
private:
    EventMap m_events;
    uint32 _soundId;
    bool once;
};

GameObjectAI* GetAI_go_bells(GameObject* gameobject)
{
    return new go_bells(gameobject);
}

/*####
## go_darkmoon_faire_music
####*/

enum DarkmoonFaireMusic
{
    MUSIC_DARKMOON_FAIRE_MUSIC = 8440
};

enum DarkmoonFaireMusicEvents
{
    EVENT_DFM_START_MUSIC = 1,
    GAME_EVENT_DARKMOON_FAIRE_ELWYNN = 4,
    GAME_EVENT_DARKMOON_FAIRE_THUNDER = 5
};

struct go_darkmoon_faire_music : public GameObjectAI
{
    go_darkmoon_faire_music(GameObject* gobj) : GameObjectAI(gobj)
    {
        m_events.ScheduleEvent(EVENT_DFM_START_MUSIC, Seconds(1));
    }

    void UpdateAI(uint32 const diff) override
    {
        m_events.Update(diff);
        while (uint32 eventId = m_events.ExecuteEvent())
        {
            switch (eventId)
            {
                case EVENT_DFM_START_MUSIC:
                    if (sGameEventMgr.IsActiveEvent(GAME_EVENT_DARKMOON_FAIRE_ELWYNN) || sGameEventMgr.IsActiveEvent(GAME_EVENT_DARKMOON_FAIRE_THUNDER))
                        me->PlayDirectMusic(MUSIC_DARKMOON_FAIRE_MUSIC);

                    m_events.ScheduleEvent(EVENT_DFM_START_MUSIC, Seconds(5));  // Every 5 second's SMSG_PLAY_MUSIC packet (PlayDirectMusic) is pushed to the client (sniffed value)
                    break;
                default:
                    break;
            }
        }
    }
private:
    EventMap m_events;
};

GameObjectAI* GetAI_go_darkmoon_faire_music(GameObject* gameobject)
{
    return new go_darkmoon_faire_music(gameobject);
}

/*####
## go_firework_rocket
####*/

enum
{
    EVENT_ROCKET_DESPAWN = 1,
};

struct go_firework_rocket : public GameObjectAI
{
    // In videos and sniffs, rockets are triggered immediately .
    // Without this code it takes forever (like 5 seconds) in vmangos for some reason.
    go_firework_rocket(GameObject* gobj) : GameObjectAI(gobj)
    {
        m_events.ScheduleEvent(EVENT_ROCKET_DESPAWN, Seconds(0));
    }

    void UpdateAI(uint32 const diff) override
    {
        if (!me->isSpawned())
            return;

        m_events.Update(diff);
        while (uint32 eventId = m_events.ExecuteEvent())
        {
            switch (eventId)
            {
                case EVENT_ROCKET_DESPAWN:
                {
                    me->Despawn();
                    break;
                }
                default:
                    break;
            }
        }
    }
private:
    EventMap m_events;
};

GameObjectAI* GetAI_go_firework_rocket(GameObject* gameobject)
{
    return new go_firework_rocket(gameobject);
}

/*####
## go_lunar_festival_firecracker
####*/

enum
{
    EVENT_FIRECRACKER_DESPAWN = 1,
};

struct go_lunar_festival_firecracker : public GameObjectAI
{
    go_lunar_festival_firecracker(GameObject* gobj) : GameObjectAI(gobj)
    {
        if (me->GetEntry() == 180763 || me->GetEntry() == 180764)
            m_events.ScheduleEvent(EVENT_FIRECRACKER_DESPAWN, Seconds(urand(30,60)));
    }

    bool OnUse(Unit* /*user*/) override
    {
        m_events.ScheduleEvent(EVENT_FIRECRACKER_DESPAWN, Seconds(urand(0, 2)));
        return true;
    }

    void UpdateAI(uint32 const diff) override
    {
        if (!me->isSpawned())
            return;

        m_events.Update(diff);
        while (uint32 eventId = m_events.ExecuteEvent())
        {
            switch (eventId)
            {
                case EVENT_FIRECRACKER_DESPAWN:    
                {
                    me->Despawn();
                    uint32 respawnTime = me->GetRespawnDelay();
                    if (!respawnTime)
                        respawnTime = me->GetGOData()->GetRandomRespawnTime();

                    me->UseDoorOrButton(respawnTime);
                    me->UpdateObjectVisibility();
                    break;
                }
                default:
                    break;
            }
        }
    }
private:
    EventMap m_events;
};

GameObjectAI* GetAI_go_lunar_festival_firecracker(GameObject* gameobject)
{
    return new go_lunar_festival_firecracker(gameobject);
}

void AddSC_go_scripts()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "go_cat_figurine";
    newscript->pGOHello = &GOHello_go_cat_figurine;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_field_repair_bot_74A";
    newscript->pGOHello = &GOHello_go_field_repair_bot_74A;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_resonite_cask";
    newscript->pGOHello = &GOHello_go_resonite_cask;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_silithyste";
    newscript->pGOHello = &GOHello_go_silithyste;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_bells";
    newscript->GOGetAI = &GetAI_go_bells;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_darkmoon_faire_music";
    newscript->GOGetAI = &GetAI_go_darkmoon_faire_music;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_lunar_festival_firecracker";
    newscript->GOGetAI = &GetAI_go_lunar_festival_firecracker;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_firework_rocket";
    newscript->GOGetAI = &GetAI_go_firework_rocket;
    newscript->RegisterSelf();
}
