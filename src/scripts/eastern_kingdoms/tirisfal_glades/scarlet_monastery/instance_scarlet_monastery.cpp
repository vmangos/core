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
#include "Utilities/EventMap.h"
#include "scarlet_monastery.h"

enum AshbringerEventMisc
{
    NPC_SCARLET_SORCERER = 4294,
    NPC_SCARLET_MYRIDON = 4295,
    NPC_SCARLET_DEFENDER = 4298,
    NPC_SCARLET_CHAPLAIN = 4299,
    NPC_SCARLET_WIZARD = 4300,
    NPC_SCARLET_CENTURION = 4301,    
    NPC_SCARLET_CHAMPION = 4302,
    NPC_SCARLET_ABBOT = 4303,
    NPC_SCARLET_MONK = 4540,

    NPC_FAIRBANKS = 4542,
    NPC_COMMANDER_MOGRAINE = 3976,
    NPC_INQUISITOR_WHITEMANE = 3977,
    NPC_HIGHLORD_MOGRAINE = 16062,
    NPC_VORREL_SENGUTZ = 3981,

    GO_CHAPEL_DOOR   = 104591,
    GO_HIGH_INQUISITOR_DOOR = 104600,

    SAY_COMMANDER1  = 12390,
    SAY_COMMANDER2  = 12470,
    SAY_COMMANDER3  = 12472,
    SAY_ASHBRINGER1 = 12469,
    SAY_ASHBRINGER2 = 12471,
    SAY_ASHBRINGER3 = 12473,
    YELL_COMMANDER  = 12389,
    YELL_WHITEMANE  = 2973,

    SPELL_AB_EFFECT_000 = 28441,
    SPELL_FORGIVENESS = 28697,
    SPELL_MOGRAINE_COMETH_DND = 28688,
    SPELL_ASHBRINGER = 28282,

    MODEL_HIGHLORD_MOGRAINE = 16180,

    STAGE_MOGRAINE_NOT_STARTED = 0,
    STAGE_MOGRAINE_IN_PROGRESS = 1,
    STAGE_MOGRAINE_DIED_ONCE   = 2,
    STAGE_MOGRAINE_REVIVED     = 3,
    STAGE_MOGRAINE_DONE        = 4,

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
    EVENT_SECOND_DOUBT,
    EVENT_POINT,
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
    uint64 m_uiChapelDoorGUID;
    uint64 m_uiAshbringerWielderGUID;
    bool m_ashbringerActive;
    std::set<ObjectGuid> m_ashbringerReactedNpcs;
    EventMap m_events;

    void Initialize() override
    {
        memset(&m_auiEncounter, 0, sizeof(m_auiEncounter));

        m_uiMograineGUID = 0;
        m_uiWhitemaneGUID = 0;
        m_uiVorrelGUID = 0;
        m_uiDoorHighInquisitorGUID = 0;
        m_uiChapelDoorGUID = 0;
        m_uiAshbringerWielderGUID = 0;
        m_ashbringerReactedNpcs.clear();
        m_events.Reset();
    }

    void OnCreatureCreate(Creature* pCreature) override
    {
        switch (pCreature->GetEntry())
        {
            case NPC_SCARLET_SORCERER:
            case NPC_SCARLET_MYRIDON:
            case NPC_SCARLET_DEFENDER:
            case NPC_SCARLET_CHAPLAIN:
            case NPC_SCARLET_WIZARD:
            case NPC_SCARLET_CENTURION:
            case NPC_SCARLET_CHAMPION:
            case NPC_SCARLET_ABBOT:
            case NPC_SCARLET_MONK:
            case NPC_FAIRBANKS:
                m_ashbringerReactedNpcs.emplace(pCreature->GetGUID());
                break;
            case NPC_COMMANDER_MOGRAINE:
                m_uiMograineGUID = pCreature->GetGUID();
                m_ashbringerReactedNpcs.emplace(pCreature->GetGUID());
                break;
            case NPC_INQUISITOR_WHITEMANE:
                m_uiWhitemaneGUID = pCreature->GetGUID();
                break;
            case NPC_VORREL_SENGUTZ:
                m_uiVorrelGUID = pCreature->GetGUID();
                break;
        }
    }

    void OnObjectCreate(GameObject* pGo) override
    {
        switch (pGo->GetEntry())
        {
            case GO_HIGH_INQUISITOR_DOOR:
                m_uiDoorHighInquisitorGUID = pGo->GetGUID();
                break;
            case GO_CHAPEL_DOOR:
                m_uiChapelDoorGUID = pGo->GetGUID();                
                break;
        }
    }

    void OnCreatureDeath(Creature* pCreature) override
    {
        switch (pCreature->GetEntry())
        {
            case NPC_COMMANDER_MOGRAINE:
                if (Creature* pWhitemane = GetCreature(m_uiWhitemaneGUID))
                    if (pWhitemane->IsDead())
                        SetData(TYPE_MOGRAINE_AND_WHITE_EVENT, STAGE_MOGRAINE_DONE);
                break;
            case NPC_INQUISITOR_WHITEMANE:
                if (Creature* pMograine = GetCreature(m_uiMograineGUID))
                    if (pMograine->IsDead())
                        SetData(TYPE_MOGRAINE_AND_WHITE_EVENT, STAGE_MOGRAINE_DONE);
                break;
        }
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
            case DATA_DOOR_CHAPEL:
                return m_uiChapelDoorGUID;
        }

        return 0;
    }

    void SetData(uint32 uiType, uint32 uiData) override
    {
        if (uiType == TYPE_MOGRAINE_AND_WHITE_EVENT)
        {
            if (uiData == STAGE_MOGRAINE_NOT_STARTED || uiData == STAGE_MOGRAINE_IN_PROGRESS)
            {
                if (GameObject* pDoor = GetGameObject(m_uiDoorHighInquisitorGUID))
                    pDoor->SetGoState(GO_STATE_READY);

                if (Creature* pWhitemane = GetCreature(m_uiWhitemaneGUID))
                    if (pWhitemane->IsDead())
                        pWhitemane->Respawn();

                if (Creature* pMograine = GetCreature(m_uiMograineGUID))
                {
                    if (pMograine->IsDead())
                        pMograine->Respawn();

                    if (uiData == STAGE_MOGRAINE_IN_PROGRESS && pMograine->GetVictim())
                    {
                        std::list<Creature*> mograinesAssist;
                        GetCreatureListWithEntryInGrid(mograinesAssist, pMograine, NPC_SCARLET_CHAPLAIN, 82.0f);
                        GetCreatureListWithEntryInGrid(mograinesAssist, pMograine, NPC_SCARLET_WIZARD, 82.0f);
                        GetCreatureListWithEntryInGrid(mograinesAssist, pMograine, NPC_SCARLET_CENTURION, 82.0f);
                        GetCreatureListWithEntryInGrid(mograinesAssist, pMograine, NPC_SCARLET_CHAMPION, 82.0f);
                        GetCreatureListWithEntryInGrid(mograinesAssist, pMograine, NPC_SCARLET_ABBOT, 82.0f);
                        GetCreatureListWithEntryInGrid(mograinesAssist, pMograine, NPC_SCARLET_MONK, 82.0f);

                        if (!mograinesAssist.empty())
                        {
                            for (const auto& itr : mograinesAssist)
                            {
                                if (itr->IsAlive() && itr->AI())
                                    itr->AI()->AttackStart(pMograine->GetVictim());
                            }
                        }
                    }
                }
            }
            else if (uiData == STAGE_MOGRAINE_DIED_ONCE)
            {
                if (GameObject* pDoor = GetGameObject(m_uiDoorHighInquisitorGUID))
                    pDoor->SetGoState(GO_STATE_ACTIVE);

                if (Creature* pWhitemane = GetCreature(m_uiWhitemaneGUID))
                {
                    DoScriptText(YELL_WHITEMANE, pWhitemane);

                    if (Creature* pMograine = GetCreature(m_uiMograineGUID))
                        pWhitemane->GetMotionMaster()->MovePoint(100, pMograine->GetPositionX(), pMograine->GetPositionY(), pMograine->GetPositionZ(), MOVE_PATHFINDING | MOVE_RUN_MODE);
                }
            }
            else if (uiData == STAGE_MOGRAINE_REVIVED)
            {
                if (Creature* pMograine = GetCreature(m_uiMograineGUID))
                    if (pMograine->IsAlive() &&!pMograine->IsInCombat())
                        pMograine->SetInCombatWithZone();

                if (Creature* pWhitemane = GetCreature(m_uiWhitemaneGUID))
                    if (pWhitemane->IsAlive() && !pWhitemane->IsInCombat())
                        pWhitemane->SetInCombatWithZone();
            }

            m_auiEncounter[0] = uiData;
        }
        if (uiType == TYPE_ASHBRINGER_EVENT)
        {
            if (uiData == IN_PROGRESS)
            {
                Cell c(MaNGOS::ComputeCellPair(1069.949951f, 1399.140015f));
                instance->LoadGrid(c, true);
                if (GameObject* go = instance->GetGameObject(m_uiChapelDoorGUID))
                {
                    go->SetGoState(GO_STATE_ACTIVE);
                    go->SetLootState(GO_ACTIVATED);
                    go->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_IN_USE);
                }

                if (Creature* whitemane = instance->GetCreature(m_uiWhitemaneGUID))
                            if (whitemane->IsAlive() && !whitemane->IsInCombat())
                                whitemane->DespawnOrUnsummon();

                for (const auto& scarletCathedralNpcGuid : m_ashbringerReactedNpcs)
                    if (Creature* scarletNpc = instance->GetCreature(scarletCathedralNpcGuid))
                        if (scarletNpc->IsAlive() && !scarletNpc->IsInCombat())
                            scarletNpc->SetFactionTemplateId(35);
            }
            m_auiEncounter[1] = uiData;
        }
    }

    uint32 GetData(uint32 uiData) override
    {
        if (uiData == TYPE_MOGRAINE_AND_WHITE_EVENT)
            return m_auiEncounter[0];
        if (uiData == TYPE_ASHBRINGER_EVENT)
            return m_auiEncounter[1];
        return 0;
    }

    void OnCreatureSpellHit(SpellCaster* pCaster, Creature* receiver, SpellEntry const* spell) override
    {
        if (m_ashbringerActive || !pCaster || !receiver || !spell)
            return;
        if (!pCaster->IsPlayer() || spell->Id != SPELL_AB_EFFECT_000)
            return;
        if (receiver->IsDead())
            return;

        m_uiAshbringerWielderGUID = pCaster->GetGUID();
        switch (receiver->GetEntry())
        {
            case NPC_COMMANDER_MOGRAINE:
            {
                receiver->SetFacingToObject(pCaster);
                m_events.ScheduleEvent(EVENT_KNEEL, Seconds(1), Seconds(2));
                m_events.ScheduleEvent(EVENT_SUMMON, Milliseconds(20));
                m_ashbringerActive = true;
                break;
            }
            default:
                return;
        }
    }

    void Update(uint32 diff) override
    {
        if (m_ashbringerActive)
        {
            m_events.Update(diff);
            while (uint32 eventId = m_events.ExecuteEvent())
            {
                Creature* pMograine = GetCreature(m_uiMograineGUID);
                if (!pMograine)
                    continue;

                Creature* pHighlord = GetClosestCreatureWithEntry(pMograine, NPC_HIGHLORD_MOGRAINE, 100.0f);
                switch (eventId)
                {
                    case EVENT_KNEEL:
                        pMograine->SetSheath(SHEATH_STATE_UNARMED);
                        pMograine->SetStandState(UNIT_STAND_STATE_KNEEL);
                        m_events.ScheduleEvent(EVENT_TALK1, Seconds(2));
                        break;
                    case EVENT_TALK1:
                        if (m_uiAshbringerWielderGUID)
                            if (Player* pPlayer = instance->GetPlayer(m_uiAshbringerWielderGUID))
                                DoScriptText(SAY_COMMANDER1, pMograine, pPlayer);
                        break;
                    case EVENT_SUMMON:
                        if (Creature* pC = pMograine->SummonCreature(NPC_HIGHLORD_MOGRAINE, 1034.9252f, 1399.0653f, 27.393204f, 6.257956981658935546f, TEMPSUMMON_TIMED_DESPAWN, 400000))
                        {
                            pC->SetFactionTemporary(35, TEMPFACTION_RESTORE_RESPAWN);
                            pC->SetDisplayId(MODEL_HIGHLORD_MOGRAINE);
                            pC->SetVirtualItem(BASE_ATTACK, EQUIP_UNEQUIP);
                            pC->SetObjectScale(2.0);
                            pC->CastSpell(pC, SPELL_MOGRAINE_COMETH_DND, false);
                            pC->GetMotionMaster()->MovePoint(0, 1150.3911f, 1398.723f, 32.54613f);
                        }
                        m_events.ScheduleEvent(EVENT_TALK2, Milliseconds(48500));
                        break;
                    case EVENT_TALK2:
                        pHighlord->StopMoving();
                        if (pHighlord)
                        {
                            pHighlord->SetFacingToObject(pMograine);
                                DoScriptText(SAY_ASHBRINGER1, pHighlord);
                        }
                        m_events.ScheduleEvent(EVENT_STAND, Seconds(4));
                        break;
                    case EVENT_STAND:
                        pMograine->SetSheath(SHEATH_STATE_MELEE);
                        pMograine->HandleEmoteCommand(EMOTE_STATE_STAND);
                        pMograine->SetStandState(UNIT_STAND_STATE_STAND);
                        pMograine->SetFacingToObject(pHighlord);
                        m_events.ScheduleEvent(EVENT_TALK3, Seconds(2));
                        break;
                    case EVENT_TALK3:
                        DoScriptText(SAY_COMMANDER2, pMograine);
                        m_events.ScheduleEvent(EVENT_TALK4, Seconds(4));
                        break;
                    case EVENT_TALK4:
                        if (pHighlord)
                            DoScriptText(SAY_ASHBRINGER2, pHighlord);
                        m_events.ScheduleEvent(EVENT_SECOND_DOUBT, Seconds(4));
                        break;
                    case EVENT_SECOND_DOUBT:
                        if (pHighlord)
                            pHighlord->HandleEmote(EMOTE_ONESHOT_QUESTION);
                        m_events.ScheduleEvent(EVENT_POINT, Seconds(4));
                        break;
                    case EVENT_POINT:
                        if (pHighlord)
                            pHighlord->HandleEmote(EMOTE_ONESHOT_POINT);
                        m_events.ScheduleEvent(EVENT_ROAR, Seconds(3));
                        break;
                    case EVENT_ROAR:
                        if (pHighlord)
                            pHighlord->HandleEmote(EMOTE_ONESHOT_BATTLEROAR);
                        m_events.ScheduleEvent(EVENT_TALK5, Seconds(4));
                        break;
                    case EVENT_TALK5:
                        DoScriptText(SAY_COMMANDER3, pMograine);
                        m_events.ScheduleEvent(EVENT_SPELL, Seconds(4));
                        break;
                    case EVENT_SPELL:
                        if (pHighlord)
                            //TODO:This spell hits the target and the target has no lightning effect
                            pHighlord->CastSpell(pMograine, SPELL_FORGIVENESS, false);
                        m_events.ScheduleEvent(EVENT_FORGIVEN, Seconds(4));
                        break;
                    case EVENT_FORGIVEN:
                        if (pHighlord)
                            DoScriptText(SAY_ASHBRINGER3, pHighlord);
                        m_events.ScheduleEvent(EVENT_DESPAWN, Seconds(4));
                        break;
                    case EVENT_DESPAWN:
                        if (pHighlord)
                            ((TemporarySummon*)pHighlord)->UnSummon();
                        m_uiAshbringerWielderGUID = 0;
                        break;
                }
            }
            return;
        }       
    }
};

InstanceData* GetInstanceData_instance_scarlet_monastery(Map* pMap)
{
    return new instance_scarlet_monastery(pMap);
}

bool AreaTrigger_at_cathedral_entrance(Player* player, AreaTriggerEntry const* areaTrigger)
{
    if (areaTrigger->id == 4089)
    {
        if (!player->HasAura(SPELL_ASHBRINGER))
            return false;

        ScriptedInstance* pInstance = (ScriptedInstance*)player->GetInstanceData();
        if (!pInstance || pInstance->GetData(TYPE_ASHBRINGER_EVENT) != NOT_STARTED)
            return false;

        pInstance->SetData(TYPE_ASHBRINGER_EVENT, IN_PROGRESS);
        if (Creature* pMograine = pInstance->GetCreature(pInstance->GetData64(DATA_MOGRAINE)))
            if (pMograine->IsAlive())
                DoScriptText(YELL_COMMANDER, pMograine, player);

        return true;
    }
    return false;
}

void AddSC_instance_scarlet_monastery()
{
    Script* newscript;
    newscript = new Script;
    newscript->Name = "instance_scarlet_monastery";
    newscript->GetInstanceData = &GetInstanceData_instance_scarlet_monastery;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "at_cathedral_entrance";
    newscript->pAreaTrigger = &AreaTrigger_at_cathedral_entrance;
    newscript->RegisterSelf();
}
