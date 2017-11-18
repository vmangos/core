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
SDName: Instance_Scarlet_Monastery
SD%Complete: 50
SDComment:
SDCategory: Scarlet Monastery
EndScriptData */

#include "scriptPCH.h"
#include "scarlet_monastery.h"

enum AshbringerEventMisc
{
    NPC_SCARLET_MYRIDON = 4295,
    NPC_SCARLET_DEFENDER = 4298,
    NPC_SCARLET_CENTURION = 4301,
    NPC_SCARLET_SORCERER = 4294,
    NPC_SCARLET_WIZARD = 4300,
    NPC_SCARLET_ABBOT = 4303,
    NPC_SCARLET_MONK = 4540,
    NPC_SCARLET_CHAMPION = 4302,
    NPC_SCARLET_CHAPLAIN = 4299,
    NPC_FAIRBANKS = 4542,
    NPC_COMMANDER_MOGRAINE = 3976,
    NPC_HIGHLORD_MOGRAINE = 16062,

    SAY_AND_SO_IT_BEG = -1999928,
    SAY_ASHBRINGER    = -1999916,
    SAY_KNEEL_BEFORE  = -1999917,
    SAY_MY_LORD       = -1999918,
    GO_CHAPPEL_DOOR   = 104591,

    SAY_COMMANDER1  = -1999920,
    SAY_COMMANDER2  = -1999921,
    SAY_COMMANDER3  = -1999922,
    SAY_ASHBRINGER1 = -1999923,
    SAY_ASHBRINGER2 = -1999924,
    SAY_ASHBRINGER3 = -1999925,

    YELL_COMMANDER  = -1999926,
    SPELL_FORGIVENESS     = 28697,
    SPELL_MOGRAINE_COMETH = 28688,
};

enum eEvents
{
    EVENT_KNEEL = 1,
    EVENT_TALK1,
    EVENT_SUMMON,
    EVENT_TALK2,
    EVENT_STAND,
    EVENT_TALK3,
    EVENT_TALK4,
    EVENT_ROAR,
    EVENT_TALK5,
    EVENT_SPELL,
    EVENT_FORGIVEN,
    EVENT_DESPAWN
};

struct instance_scarlet_monastery : ScriptedInstance
{
    explicit instance_scarlet_monastery(Map* pMap) : 
        ScriptedInstance(pMap),
        m_ashbringerActive(false)
    {
        instance_scarlet_monastery::Initialize();
    }

    uint32 m_auiEncounter[INSTANCE_SM_MAX_ENCOUNTER];

    uint64 m_uiMograineGUID;
    uint64 m_uiWhitemaneGUID;
    uint64 m_uiVorrelGUID;
    uint64 m_uiDoorHighInquisitorGUID;
    
    bool m_ashbringerActive;
    uint32 m_ashbringerCheckTimer;
    std::set<ObjectGuid> m_ashbringerReactedNpcs;
    uint32 m_ashbringerSayTimer;
    EventMap m_events;

    void Initialize() override
    {
        memset(&m_auiEncounter, 0, sizeof(m_auiEncounter));

        m_uiMograineGUID = 0;
        m_uiWhitemaneGUID = 0;
        m_uiVorrelGUID = 0;
        m_uiDoorHighInquisitorGUID = 0;
        m_ashbringerCheckTimer = 5000;
        m_ashbringerReactedNpcs.clear();
        m_ashbringerSayTimer = 0;
        m_events.Reset();
    }

    void OnCreatureCreate(Creature* pCreature) override
    {
        switch (pCreature->GetEntry())
        {
            case 3976:
                m_uiMograineGUID = pCreature->GetGUID();
                break;
            case 3977:
                m_uiWhitemaneGUID = pCreature->GetGUID();
                break;
            case 3981:
                m_uiVorrelGUID = pCreature->GetGUID();
                break;
        }
    }

    void OnObjectCreate(GameObject* pGo) override
    {
        if (pGo->GetEntry() == 104600)
            m_uiDoorHighInquisitorGUID = pGo->GetGUID();
    }

    uint64 GetData64(uint32 data) override
    {
        switch (data)
        {
            case DATA_MOGRAINE:
                return m_uiMograineGUID;
            case DATA_WHITEMANE:
                return m_uiWhitemaneGUID;
            case DATA_VORREL:
                return m_uiVorrelGUID;
            case DATA_DOOR_WHITEMANE:
                return m_uiDoorHighInquisitorGUID;
        }

        return 0;
    }

    void SetData(uint32 uiType, uint32 uiData) override
    {
        if (uiType == TYPE_MOGRAINE_AND_WHITE_EVENT)
        {
            if (uiData == IN_PROGRESS)
                DoUseDoorOrButton(m_uiDoorHighInquisitorGUID);
            if (uiData == FAIL)
                DoUseDoorOrButton(m_uiDoorHighInquisitorGUID);

            m_auiEncounter[0] = uiData;
        }
    }

    uint32 GetData(uint32 uiData) override
    {
        if (uiData == TYPE_MOGRAINE_AND_WHITE_EVENT)
            return m_auiEncounter[0];

        return 0;
    }

    uint32 GetRandomScarletText()
    {
        switch (urand(0, 6))
        {
            case 0:
                return 12378;
            case 1:
                return 12379;
            case 2:
                return 12380;
            case 3:
                return 12381;
            case 4:
                return 12382;
            case 5:
                return 12383;
        }
        return 12384;
    }

    void OnCreatureSpellHit(Unit* pCaster, Creature* receiver, const SpellEntry* spell) override
    {
        if (!m_ashbringerActive || !pCaster || !receiver || !spell)
            return;
        if (!pCaster->IsPlayer() || spell->Id != 28441) // AB Effect 000
            return;
        if (receiver->isDead())
            return;

        switch (receiver->GetEntry())
        {
        case NPC_SCARLET_MYRIDON:
        case NPC_SCARLET_DEFENDER:
        case NPC_SCARLET_CENTURION:
        case NPC_SCARLET_SORCERER:
        case NPC_SCARLET_WIZARD:
        case NPC_SCARLET_ABBOT:
        case NPC_SCARLET_MONK:
        case NPC_SCARLET_CHAMPION:
        case NPC_SCARLET_CHAPLAIN:
        {
            auto it = m_ashbringerReactedNpcs.find(receiver->GetObjectGuid());
            if (it == m_ashbringerReactedNpcs.end())
                m_ashbringerReactedNpcs.insert(receiver->GetObjectGuid());
            else
                return;
            receiver->StopMoving(true);
            receiver->SetFacingToObject(pCaster);
            receiver->SetStandState(UNIT_STAND_STATE_KNEEL);
            receiver->addUnitState(UNIT_STAT_ROOT);
            if (!m_ashbringerSayTimer && urand(0,1))
            {
                m_ashbringerSayTimer = 2000;
                DoScriptText(GetRandomScarletText(), receiver);
            }
            break;
        }
        case NPC_COMMANDER_MOGRAINE:
        {
            auto it = m_ashbringerReactedNpcs.find(receiver->GetObjectGuid());
            if (it == m_ashbringerReactedNpcs.end())
                m_ashbringerReactedNpcs.insert(receiver->GetObjectGuid());
            else
                return;
            receiver->SetFacingToObject(pCaster);
            m_events.ScheduleEvent(EVENT_KNEEL, Seconds(1));
            break;
        }
        default:
            return;
        }
    }

    void Update(uint32 diff) override
    {
        // not bothering to check if player has unequipped weapon, dont know if its a thing
        if (m_ashbringerActive)
        {
            // https://www.youtube.com/watch?v=nT6yE7vuCJc
            // todo: emotes are a bit off, should be more of them too
            m_events.Update(diff);
            while (uint32 eventId = m_events.ExecuteEvent())
            {
                Creature* pMograine = GetCreature(m_uiMograineGUID);
                if (!pMograine)
                    continue;
                Creature* pHighlord = GetClosestCreatureWithEntry(pMograine, NPC_HIGHLORD_MOGRAINE, 1000.0f);
                switch (eventId)
                {
                    case EVENT_KNEEL:
                        pMograine->SetSheath(SHEATH_STATE_UNARMED);
                        pMograine->SetStandState(UNIT_STAND_STATE_KNEEL);
                        m_events.ScheduleEvent(EVENT_TALK1, Seconds(2));
                        break;
                    case EVENT_TALK1:
                        DoScriptText(SAY_COMMANDER1, pMograine);
                        m_events.ScheduleEvent(EVENT_SUMMON, Seconds(10));
                        break;
                    case EVENT_SUMMON:
                        if (Creature* pC = pMograine->SummonCreature(NPC_HIGHLORD_MOGRAINE, 1065.130737f, 1399.350586f, 30.763723f, 6.282961f, TEMPSUMMON_TIMED_DESPAWN, 400000))
                        {
                            pC->SetFactionTemporary(35, TEMPFACTION_RESTORE_RESPAWN);
                            pC->SetObjectScale(2.0f);
                            pC->CastSpell(pC, SPELL_MOGRAINE_COMETH, true);
                            pC->GetMotionMaster()->MovePoint(0, 1148.0f, 1398.71f, 32.0f, 0, 2.7f);
                        }
                        m_events.ScheduleEvent(EVENT_TALK2, Seconds(30));
                        break;
                    case EVENT_TALK2:
                        if (pHighlord)
                        {
                            pHighlord->HandleEmote(EMOTE_ONESHOT_POINT);
                            DoScriptText(SAY_ASHBRINGER1, pHighlord);
                            pMograine->SetFacingToObject(pHighlord);
                        }
                        m_events.ScheduleEvent(EVENT_STAND, Seconds(4));
                        break;
                    case EVENT_STAND:
                        pMograine->SetStandState(UNIT_STAND_STATE_STAND);
                        m_events.ScheduleEvent(EVENT_TALK3, Seconds(2));
                        break;
                    case EVENT_TALK3:
                        DoScriptText(SAY_COMMANDER2, pMograine);
                        m_events.ScheduleEvent(EVENT_TALK4, Seconds(4));
                        break;
                    case EVENT_TALK4:
                        if(pHighlord)
                            DoScriptText(SAY_ASHBRINGER2, pHighlord);
                        m_events.ScheduleEvent(EVENT_ROAR, Seconds(11));
                        break;
                    case EVENT_ROAR:
                        if (pHighlord)
                            pHighlord->HandleEmote(EMOTE_ONESHOT_BATTLEROAR);
                        m_events.ScheduleEvent(EVENT_TALK5, Seconds(4));
                        break;
                    case EVENT_TALK5:
                        pMograine->SetSheath(SHEATH_STATE_UNARMED);
                        pMograine->HandleEmote(EMOTE_ONESHOT_BEG);
                        DoScriptText(SAY_COMMANDER3, pMograine);
                        m_events.ScheduleEvent(EVENT_SPELL, Seconds(3));
                        break;
                    case EVENT_SPELL:
                        if (pHighlord)
                            pHighlord->CastSpell(pMograine, SPELL_FORGIVENESS, false);
                        m_events.ScheduleEvent(EVENT_FORGIVEN, Seconds(4));
                        break;
                    case EVENT_FORGIVEN:
                        if (pHighlord)
                            DoScriptText(SAY_ASHBRINGER3, pHighlord);
                        m_events.ScheduleEvent(EVENT_DESPAWN, Seconds(5));
                        break;
                    case EVENT_DESPAWN:
                        if (pHighlord)
                        {
                            ((TemporarySummon*)pHighlord)->UnSummon();
                        }
                        break;
                }
            }
            m_ashbringerSayTimer -= std::min(m_ashbringerSayTimer, diff);
            return;
        }


        if (m_ashbringerCheckTimer < diff)
        {
            m_ashbringerCheckTimer = 5000;
        }
        else
        {
            m_ashbringerCheckTimer -= diff;
            return;
        }

        Map::PlayerList const& lPlayers = instance->GetPlayers();
        if (lPlayers.isEmpty())
            return;
        bool anyAshbringerEquipped = false;
        for (Map::PlayerList::const_iterator itr = lPlayers.begin(); itr != lPlayers.end(); ++itr)
        {
            if (Player* pPlayer = itr->getSource())
            {
                Item* item = pPlayer->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_MAINHAND);
                if (!item)
                    continue;
                if (item->GetEntry() == 22691 && !m_ashbringerActive) // corrupted ashbringer
                {
                    anyAshbringerEquipped = true;
                    m_ashbringerActive = true;
                    std::list<Creature*> ScarletList;
                    GetCreatureListWithEntryInGrid(ScarletList, pPlayer,
                    { 
                        NPC_SCARLET_MYRIDON,
                        NPC_SCARLET_DEFENDER,
                        NPC_SCARLET_CENTURION,
                        NPC_SCARLET_SORCERER,
                        NPC_SCARLET_WIZARD,
                        NPC_SCARLET_ABBOT,
                        NPC_SCARLET_MONK, 
                        NPC_SCARLET_CHAMPION,
                        NPC_SCARLET_CHAPLAIN,
                        NPC_FAIRBANKS,
                        NPC_COMMANDER_MOGRAINE
                    }, 2000.0f);

                    for (Creature* pCreature : ScarletList)
                    {
                        pCreature->setFaction(35);
                        if (pCreature->GetEntry() == NPC_COMMANDER_MOGRAINE)
                            pCreature->SetCharmerGuid(pPlayer->GetObjectGuid());
                    }

                    // Door should be open when event is activated
                    if (GameObject* pDoor = GetClosestGameObjectWithEntry(pPlayer, GO_CHAPPEL_DOOR, 2000.0f))
                        DoOpenDoor(pDoor->GetGUID());


                    // bow down, kneel before the ashbringer... scripttext yell
                    DoOrSimulateScriptTextForThisInstance(YELL_COMMANDER, NPC_COMMANDER_MOGRAINE);
                }
            }
        }
    }
};

InstanceData* GetInstanceData_instance_scarlet_monastery(Map* pMap)
{
    return new instance_scarlet_monastery(pMap);
}

void AddSC_instance_scarlet_monastery()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "instance_scarlet_monastery";
    newscript->GetInstanceData = &GetInstanceData_instance_scarlet_monastery;
    newscript->RegisterSelf();
}
