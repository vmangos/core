/*
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

#include "scriptPCH.h"
#include "scourge_invasion.h"
#include "CreatureGroups.h"
#include "Utilities/EventMap.h"

/*
Mouth of Kel'Thuzad
*/
struct MouthAI : public ScriptedAI
{
    MouthAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_events.Reset();
        m_creature->SetActiveObjectState(true); // Important to keep the event running in zones without players.
        Initialise();
    }

    EventMap m_events;
    int m_eventID       = GetZoneEventID();
    int m_worldstateID  = GetWorldStateID();
    int m_remainingID   = GetRemainingVariableID();
    int m_timer_min     = 45;   // How many minutes it takes at least until another zone gets attacked (Invasion starts).
    int m_timer_max     = 60;   // How many minutes it takes at most until another zone gets attacked (Invasion starts).
    int m_limit         = 2;    // How many zones can be attacked at the same time (On event start all zones getting attacked)

    void Reset() override {}

    void UpdateWorldState()
    {
        // Updating map icon worlstate
        int victories = sObjectMgr.GetSavedVariable(VARIABLE_SI_VICTORIES);
        int remaining = sObjectMgr.GetSavedVariable(m_remainingID, true);

        HashMapHolder<Player>::MapType& m = sObjectAccessor.GetPlayers();
        for (const auto& itr : m)
        {
            Player* pPlayer = itr.second;

            if (!pPlayer->IsInWorld())
                continue;

            pPlayer->SendUpdateWorldState(m_worldstateID, sGameEventMgr.IsActiveEvent(m_eventID) ? 1 : 0);
            pPlayer->SendUpdateWorldState(WORLDSTATE_SI_VICTORIES, victories);
            //pPlayer->SendUpdateWorldState(m_worldstateID, REMAINING);
        }
    }

    void Initialise()
    {
        if (!sGameEventMgr.IsActiveEvent(GAME_EVENT_SCOURGE_INVASION) || !m_remainingID)
            return;

        if (!sGameEventMgr.IsValidEvent(m_eventID))
            return;

        m_timer_min = sWorld.getConfig(CONFIG_UINT32_SCOURGE_INVASION_ZONE_ATTACK_TIMER_MIN) * MINUTE;
        m_timer_max = sWorld.getConfig(CONFIG_UINT32_SCOURGE_INVASION_ZONE_ATTACK_TIMER_MAX) * MINUTE;
        m_limit     = sWorld.getConfig(CONFIG_UINT32_SCOURGE_INVASION_ZONE_LIMIT);

        m_events.ScheduleEvent(EVENT_MOUTH_OF_KELTHUZAD_UPDATE, Seconds(urand(5, 15)));
    }

    void inline EnableInvasionWeather(bool invasion)
    {
        if (invasion)
            m_creature->GetMap()->SetWeather(m_creature->GetZoneId(), WEATHER_TYPE_STORM, 0.25f, true);
        else
            m_creature->GetMap()->SetWeather(m_creature->GetZoneId(), WEATHER_TYPE_FINE, 0.0f, false);
    }

    int inline GetWorldStateID()
    {
        switch (m_creature->GetZoneId())
        {
            case ZONEID_WINTERSPRING:
                return WORLDSTATE_WINTERSPRING;
            case ZONEID_AZSHARA:
                return WORLDSTATE_AZSHARA;
            case ZONEID_EASTERN_PLAGUELANDS:
                return WORLDSTATE_EASTERN_PLAGUELANDS;
            case ZONEID_BLASTED_LANDS:
                return WORLDSTATE_BLASTED_LANDS;
            case ZONEID_BURNING_STEPPES:
                return WORLDSTATE_BURNING_STEPPES;
            case ZONEID_TANARIS:
                return WORLDSTATE_TANARIS;
        }
        return NULL;
    }

    int inline GetRemainingVariableID()
    {
        switch (m_creature->GetZoneId())
        {
            case ZONEID_WINTERSPRING:
                return VARIABLE_SI_WINTERSPRING_REMAINING;
            case ZONEID_AZSHARA:
                return VARIABLE_SI_AZSHARA_REMAINING;
            case ZONEID_EASTERN_PLAGUELANDS:
                return VARIABLE_SI_EASTERN_PLAGUELANDS_REMAINING;
            case ZONEID_BLASTED_LANDS:
                return VARIABLE_SI_BLASTED_LANDS_REMAINING;
            case ZONEID_BURNING_STEPPES:
                return VARIABLE_SI_BURNING_STEPPES_REMAINING;
            case ZONEID_TANARIS:
                return VARIABLE_SI_TANARIS_REMAINING;
        }
        return NULL;
    }

    int inline GetZoneEventID()
    {
        switch (m_creature->GetZoneId())
        {
            case ZONEID_WINTERSPRING:
                return GAME_EVENT_SCOURGE_INVASION_WINTERSPRING;
            case ZONEID_AZSHARA:
                return GAME_EVENT_SCOURGE_INVASION_AZSHARA;
            case ZONEID_EASTERN_PLAGUELANDS:
                return GAME_EVENT_SCOURGE_INVASION_EASTERN_PLAGUELANDS;
            case ZONEID_BLASTED_LANDS:
                return GAME_EVENT_SCOURGE_INVASION_BLASTED_LANDS;
            case ZONEID_BURNING_STEPPES:
                return GAME_EVENT_SCOURGE_INVASION_BURNING_STEPPES;
            case ZONEID_TANARIS:
                return GAME_EVENT_SCOURGE_INVASION_TANARIS;
        }
        return NULL;
    }

    bool inline IsInCity()
    {
        switch (m_creature->GetZoneId())
        {
            case ZONEID_UNDERCITY:
            case ZONEID_STORMWIND_CITY:
            case ZONEID_IRONFORGE:
            case ZONEID_ORGRIMMAR:
            case ZONEID_THUNDER_BLUFF:
            case ZONEID_DARNASSUS:
            {
                return true;
                break;
            }
        }
        return false;
    }

    int inline GetActiveZones()
    {
        int count = NULL;

        for (uint32 i = VARIABLE_SI_WINTERSPRING_REMAINING; i < VARIABLE_SI_BURNING_STEPPES_REMAINING; i++)
        {
            if (sObjectMgr.GetSavedVariable(i, true) > NULL)
                count++;
        }

        return count;
    }

    void GroupMemberJustDied(Creature* pUnit, bool isLeader) override
    {
        if (isLeader)
            return;

        sObjectMgr.SetSavedVariable(m_remainingID, sObjectMgr.GetSavedVariable(m_remainingID) - 1, true);

        // No group member left, stop invasion in this Zone.
        if (!sObjectMgr.GetSavedVariable(m_remainingID, true))
        {
            m_events.ScheduleEvent(EVENT_MOUTH_OF_KELTHUZAD_UPDATE, Seconds(urand(m_timer_min, m_timer_max))); // Restart update timer to prevent invading the zone again shortly after stopping it.
            m_events.ScheduleEvent(EVENT_MOUTH_OF_KELTHUZAD_ZONE_STOP, Seconds(5));
        }
    }

    void UpdateAI(uint32 const diff) override
    {
        m_events.Update(diff);

        while (uint32 Events = m_events.ExecuteEvent())
        {
            switch (Events)
            {
                case EVENT_MOUTH_OF_KELTHUZAD_UPDATE:
                {
                    int victories   = 0;    // Victories against the Scourge (defeated zones).
                    int remaining   = 0;    // Remaining Necropolises in a Zone.
                    int active      = 0;    // Amount of active zones (Invasions).

                    victories   = sObjectMgr.GetSavedVariable(VARIABLE_SI_VICTORIES);
                    remaining   = sObjectMgr.GetSavedVariable(m_remainingID);
                    active      = GetActiveZones();

                    if (sGameEventMgr.IsActiveEvent(m_eventID)) // Zone is already being Attacked.
                    {
                        // Do random Zone Yell (Only in invasion zones).
                        m_events.ScheduleEvent(EVENT_MOUTH_OF_KELTHUZAD_YELL, 0);
                    }
                    else // Zone is not Active.
                    {
                        if (m_timer_min > 24 * HOUR || m_timer_max > 24 * HOUR)
                            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[Scourge Invasion] Zone respawn timer is set over 24 hours. Is this on purpose?");

                        // Is it Possible to attack another Zone?
                        if (victories == 0 || remaining > 0 || victories > 0 && remaining == 0 && active < m_limit)
                        {
                            m_events.ScheduleEvent(EVENT_MOUTH_OF_KELTHUZAD_ZONE_START, 0);
                            m_events.ScheduleEvent(EVENT_MOUTH_OF_KELTHUZAD_YELL, 0);
                        }
                    }
                    m_events.ScheduleEvent(EVENT_MOUTH_OF_KELTHUZAD_UPDATE, (IN_MILLISECONDS * urand(m_timer_min, m_timer_max)));
                    break;
                }
                case EVENT_MOUTH_OF_KELTHUZAD_YELL:
                {
                    if (sGameEventMgr.IsActiveEvent(m_eventID) && !IsInCity()) // In a invasion Zone?
                        DoScriptText(PickRandomValue(BCT_MOUTH_OF_KELTHUZAD_TEXT_0, BCT_MOUTH_OF_KELTHUZAD_TEXT_1, BCT_MOUTH_OF_KELTHUZAD_TEXT_2, BCT_MOUTH_OF_KELTHUZAD_TEXT_3, BCT_MOUTH_OF_KELTHUZAD_TEXT_4, BCT_MOUTH_OF_KELTHUZAD_TEXT_5), m_creature, nullptr, CHAT_TYPE_ZONE_YELL);
                    else // In a City?
                        DoScriptText(PickRandomValue(BCT_MOUTH_OF_KELTHUZAD_CITY_TEXT_0, BCT_MOUTH_OF_KELTHUZAD_CITY_TEXT_1, BCT_MOUTH_OF_KELTHUZAD_CITY_TEXT_2, BCT_MOUTH_OF_KELTHUZAD_CITY_TEXT_3, BCT_MOUTH_OF_KELTHUZAD_CITY_TEXT_4, BCT_MOUTH_OF_KELTHUZAD_CITY_TEXT_5, BCT_MOUTH_OF_KELTHUZAD_CITY_TEXT_6, BCT_MOUTH_OF_KELTHUZAD_CITY_TEXT_7, BCT_MOUTH_OF_KELTHUZAD_CITY_TEXT_8), m_creature, nullptr, CHAT_TYPE_ZONE_YELL);
                    
                    break;
                }
                case EVENT_MOUTH_OF_KELTHUZAD_ZONE_START:
                {
                    int REMAINING = 0;

                    EnableInvasionWeather(true);
                    sGameEventMgr.StartEvent(m_eventID);

                    // Mouth of Kel'Thuzad is the group leader of all Necropolis Healths in a zone. It's the best way to check if a Necropolis dies.
                    if (CreatureGroup* group = m_creature->GetCreatureGroup())
                    {
                        for (const auto& itr : group->GetMembers())
                        {
                            CreatureGroupMember* pCreatureGroupMember = itr.second;

                            if (!pCreatureGroupMember)
                                continue;

                            Creature* pCreature = m_creature->GetMap()->GetCreature(itr.first);

                            if (!pCreature)
                                continue;

                            if (!pCreature->IsDespawned() && pCreature->IsAlive())
                                REMAINING++;
                        }
                    }

                    if (!REMAINING)
                    {
                        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[Scourge Invasion] Trying to start invasion in Zone: %u but Creature GUID %u has no group members.", m_creature->GetZoneId(), m_creature->GetGUID());
                        return;
                    }

                    sObjectMgr.SetSavedVariable(m_remainingID, REMAINING, true);
                    UpdateWorldState();

                    sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[Scourge Invasion] Start Invasion in Zone: %u, set remaining Necropolises to: %u", m_creature->GetZoneId(), REMAINING);

                    break;
                }
                case EVENT_MOUTH_OF_KELTHUZAD_ZONE_STOP:
                {
                    if (!sObjectMgr.GetSavedVariable(m_remainingID, true))
                    {
                        DoScriptText(PickRandomValue(BCT_MOUTH_OF_KELTHUZAD_DEFEATED_TEXT_0, BCT_MOUTH_OF_KELTHUZAD_DEFEATED_TEXT_1, BCT_MOUTH_OF_KELTHUZAD_DEFEATED_TEXT_2), m_creature, nullptr, CHAT_TYPE_ZONE_YELL);
                        EnableInvasionWeather(false);
                        sGameEventMgr.StopEvent(m_eventID);
                        sObjectMgr.SetSavedVariable(VARIABLE_SI_VICTORIES, sObjectMgr.GetSavedVariable(VARIABLE_SI_VICTORIES) + 1, true);
                        UpdateWorldState();
                        sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[Scourge Invasion] Ending Invasion in Zone: %u with m_remainingID: %u", m_creature->GetZoneId(), m_remainingID);
                    }
                    break;
                }
            }
        }
    }
};

CreatureAI* GetAI_Mouth(Creature* pCreature)
{
    return new MouthAI(pCreature);
}

enum
{
    EVENT_CRYSTAL_SPAWN = 1,
};

struct go_scourge_invasion_circle : public GameObjectAI
{
    go_scourge_invasion_circle(GameObject* gobj) : GameObjectAI(gobj)
    {
        m_events.ScheduleEvent(EVENT_CRYSTAL_SPAWN, Seconds(3));
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
            case EVENT_CRYSTAL_SPAWN:
            {
                me->CastSpell(nullptr, SPELL_CREATE_CRYSTAL, false);
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

GameObjectAI* GetAI_go_scourge_invasion_circle(GameObject* gameobject)
{
    return new go_scourge_invasion_circle(gameobject);
}

struct go_scourge_invasion_spawner : public GameObjectAI
{
    go_scourge_invasion_spawner(GameObject* gobj) : GameObjectAI(gobj)
    {
    }

    bool OnUse(Unit* pUnit) override
    {
        if (!me->isSpawned())
            return false;

        me->CastSpell(nullptr, SPELL_DND_SUMMON_CRYSTAL_MINION_FINDER, false);
        me->Despawn();
        // uint32 respawnTime = urand(uint32(30), uint32(180)); // seconds
        uint32 respawnTime = me->GetRespawnDelay();
        if (!respawnTime)
            respawnTime = me->GetGOData()->GetRandomRespawnTime();

        me->SetRespawnTime(respawnTime);
        me->UpdateObjectVisibility();

        return true;
    }
};

GameObjectAI* GetAI_go_scourge_invasion_spawner(GameObject* gameobject)
{
    return new go_scourge_invasion_spawner(gameobject);
}

/*
Argent Emissary
Notes: NPC thats tells what is going on and shows what locations are under attack.
*/
bool GossipSelect_npc_argent_emissary(Player* pPlayer, Creature* pCreature, uint32 sender, uint32 action)
{
    switch (action)
    {
        case GOSSIP_ACTION_INFO_DEF + 1:
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BCT_ARGENT_EMISSARY_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);
            pPlayer->SEND_GOSSIP_MENU(BCT_ARGENT_EMISSARY_AWNSER_0, pCreature->GetGUID());
            break;
        }
        case GOSSIP_ACTION_INFO_DEF + 2:
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BCT_ARGENT_EMISSARY_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);
            pPlayer->SEND_GOSSIP_MENU(BCT_ARGENT_EMISSARY_AWNSER_1, pCreature->GetGUID());
            break;
        }
        case GOSSIP_ACTION_INFO_DEF + 3:
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BCT_ARGENT_EMISSARY_OPTION_2_SUB_OPTION_4, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 10);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BCT_ARGENT_EMISSARY_OPTION_2_SUB_OPTION_2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 8);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BCT_ARGENT_EMISSARY_OPTION_2_SUB_OPTION_3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 9);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BCT_ARGENT_EMISSARY_OPTION_2_SUB_OPTION_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 7);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BCT_ARGENT_EMISSARY_OPTION_2_SUB_OPTION_5, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 11);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BCT_ARGENT_EMISSARY_OPTION_2_SUB_OPTION_0, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 6);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BCT_ARGENT_EMISSARY_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);

            pPlayer->SEND_GOSSIP_MENU(BCT_ARGENT_EMISSARY_AWNSER_2, pCreature->GetGUID());
            break;
        }
        case GOSSIP_ACTION_INFO_DEF + 4:
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BCT_ARGENT_EMISSARY_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);

            uint32 random_text = urand(0, 2); // Random text selection
            if (random_text == 1)
                pPlayer->SEND_GOSSIP_MENU(BCT_ARGENT_EMISSARY_AWBSER_3_0, pCreature->GetGUID());
            else if (random_text == 2)
                pPlayer->SEND_GOSSIP_MENU(BCT_ARGENT_EMISSARY_AWBSER_3_1, pCreature->GetGUID());
            else
                pPlayer->SEND_GOSSIP_MENU(BCT_ARGENT_EMISSARY_AWBSER_3_2, pCreature->GetGUID());
            break;
        }
        case GOSSIP_ACTION_INFO_DEF + 5:
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BCT_ARGENT_EMISSARY_OPTION_0, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BCT_ARGENT_EMISSARY_OPTION_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BCT_ARGENT_EMISSARY_OPTION_2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BCT_ARGENT_EMISSARY_OPTION_3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);

            // Send General Gossip
            pPlayer->SEND_GOSSIP_MENU(BCT_ARGENT_EMISSARY_GOSSIP, pCreature->GetGUID());
            break;
        }
        case GOSSIP_ACTION_INFO_DEF + 6:
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BCT_ARGENT_EMISSARY_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
            if (sObjectMgr.GetSavedVariable(VARIABLE_SI_WINTERSPRING_REMAINING) > 0)
                pPlayer->SEND_GOSSIP_MENU(BCT_ARGENT_EMISSARY_AWNSER_2_SUB_OPTION_0, pCreature->GetGUID());
            else
                pPlayer->SEND_GOSSIP_MENU(BCT_ARGENT_EMISSARY_FREE_OF_SCOURGE, pCreature->GetGUID());
            break;
        }
        case GOSSIP_ACTION_INFO_DEF + 7:
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BCT_ARGENT_EMISSARY_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
            if (sObjectMgr.GetSavedVariable(VARIABLE_SI_TANARIS_REMAINING) > 0)
                pPlayer->SEND_GOSSIP_MENU(BCT_ARGENT_EMISSARY_AWNSER_2_SUB_OPTION_1, pCreature->GetGUID());
            else
                pPlayer->SEND_GOSSIP_MENU(BCT_ARGENT_EMISSARY_FREE_OF_SCOURGE, pCreature->GetGUID());
            break;
        }
        case GOSSIP_ACTION_INFO_DEF + 8:
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BCT_ARGENT_EMISSARY_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
            if (sObjectMgr.GetSavedVariable(VARIABLE_SI_BLASTED_LANDS_REMAINING) > 0)
                pPlayer->SEND_GOSSIP_MENU(BCT_ARGENT_EMISSARY_AWNSER_2_SUB_OPTION_2, pCreature->GetGUID());
            else
                pPlayer->SEND_GOSSIP_MENU(BCT_ARGENT_EMISSARY_FREE_OF_SCOURGE, pCreature->GetGUID());
            break;
        }
        case GOSSIP_ACTION_INFO_DEF + 9:
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BCT_ARGENT_EMISSARY_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
            if (sObjectMgr.GetSavedVariable(VARIABLE_SI_BURNING_STEPPES_REMAINING) > 0)
                pPlayer->SEND_GOSSIP_MENU(BCT_ARGENT_EMISSARY_AWNSER_2_SUB_OPTION_3, pCreature->GetGUID());
            else
                pPlayer->SEND_GOSSIP_MENU(BCT_ARGENT_EMISSARY_FREE_OF_SCOURGE, pCreature->GetGUID());
            break;
        }
        case GOSSIP_ACTION_INFO_DEF + 10:
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BCT_ARGENT_EMISSARY_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
            if (sObjectMgr.GetSavedVariable(VARIABLE_SI_AZSHARA_REMAINING) > 0)
                pPlayer->SEND_GOSSIP_MENU(BCT_ARGENT_EMISSARY_AWNSER_2_SUB_OPTION_4, pCreature->GetGUID());
            else
                pPlayer->SEND_GOSSIP_MENU(BCT_ARGENT_EMISSARY_FREE_OF_SCOURGE, pCreature->GetGUID());
            break;
        }
        case GOSSIP_ACTION_INFO_DEF + 11:
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BCT_ARGENT_EMISSARY_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
            if (sObjectMgr.GetSavedVariable(VARIABLE_SI_EASTERN_PLAGUELANDS_REMAINING) > 0)
                pPlayer->SEND_GOSSIP_MENU(BCT_ARGENT_EMISSARY_AWNSER_2_SUB_OPTION_5, pCreature->GetGUID());
            else
                pPlayer->SEND_GOSSIP_MENU(BCT_ARGENT_EMISSARY_FREE_OF_SCOURGE, pCreature->GetGUID());
            break;
        }
    }
    //pPlayer->CLOSE_GOSSIP_MENU();
    return true;
}

bool GossipHello_npc_argent_emissary(Player* pPlayer, Creature* pCreature)
{
    // Get current values
    uint32 VICTORIES = sObjectMgr.GetSavedVariable(VARIABLE_SI_VICTORIES);
    uint32 REMAINING_AZSHARA = sObjectMgr.GetSavedVariable(VARIABLE_SI_AZSHARA_REMAINING);
    uint32 REMAINING_BLASTED_LANDS = sObjectMgr.GetSavedVariable(VARIABLE_SI_BLASTED_LANDS_REMAINING);
    uint32 REMAINING_BURNING_STEPPES = sObjectMgr.GetSavedVariable(VARIABLE_SI_BURNING_STEPPES_REMAINING);
    uint32 REMAINING_EASTERN_PLAGUELANDS = sObjectMgr.GetSavedVariable(VARIABLE_SI_EASTERN_PLAGUELANDS_REMAINING);
    uint32 REMAINING_TANARIS = sObjectMgr.GetSavedVariable(VARIABLE_SI_TANARIS_REMAINING);
    uint32 REMAINING_WINTERSPRING = sObjectMgr.GetSavedVariable(VARIABLE_SI_WINTERSPRING_REMAINING);

    // Send to client
    pPlayer->SendUpdateWorldState(WORLDSTATE_SI_VICTORIES, VICTORIES);
    pPlayer->SendUpdateWorldState(WORLDSTATE_SI_AZSHARA_REMAINING, REMAINING_AZSHARA);
    pPlayer->SendUpdateWorldState(WORLDSTATE_SI_BLASTED_LANDS_REMAINING, REMAINING_BLASTED_LANDS);
    pPlayer->SendUpdateWorldState(WORLDSTATE_SI_BURNING_STEPPES_REMAINING, REMAINING_BURNING_STEPPES);
    pPlayer->SendUpdateWorldState(WORLDSTATE_SI_EASTERN_PLAGUELANDS, REMAINING_EASTERN_PLAGUELANDS);
    pPlayer->SendUpdateWorldState(WORLDSTATE_SI_TANARIS, REMAINING_TANARIS);
    pPlayer->SendUpdateWorldState(WORLDSTATE_SI_WINTERSPRING, REMAINING_WINTERSPRING);

    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BCT_ARGENT_EMISSARY_OPTION_0, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BCT_ARGENT_EMISSARY_OPTION_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BCT_ARGENT_EMISSARY_OPTION_2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BCT_ARGENT_EMISSARY_OPTION_3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);

    // Send General Gossip
    pPlayer->SEND_GOSSIP_MENU(BCT_ARGENT_EMISSARY_GOSSIP, pCreature->GetGUID());

    return true;
}

void AddSC_scourge_invasion()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "npc_scourge_invasion_mouth";
    newscript->GetAI = &GetAI_Mouth;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_argent_emissary";
    newscript->pGossipHello = &GossipHello_npc_argent_emissary;
    newscript->pGossipSelect = &GossipSelect_npc_argent_emissary;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_scourge_invasion_circle";
    newscript->GOGetAI = &GetAI_go_scourge_invasion_circle;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_scourge_invasion_spawner";
    newscript->GOGetAI = &GetAI_go_scourge_invasion_spawner;
    newscript->RegisterSelf();
}
