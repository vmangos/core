/*
  ROCKETTE FOR NOSTALRIUS
 */

#include "scriptPCH.h"
#include "maraudon.h"

#define QUEST_CELEBRAS_CEPTER 7046
#define CREATURE_CELEBRAS 13716
#define GO_PEDESTAL 178560
#define GO_BLUE_AURA 178964
#define GO_BOOK 178965

#define SPELL_FRENEZIED_REGEN 22896
#define SPELL_HEARTSTONE 8690
#define SPELL_END_EVENT 21914

instance_maraudon::instance_maraudon(Map *pMap) : ScriptedInstance(pMap), cGuid(static_cast<uint64>(0)), pGuid(static_cast<uint64>(0)), bGuid(static_cast<uint64>(0)), aGuid(static_cast<uint64>(0))
{
}

void instance_maraudon::OnCreatureCreate(Creature *pCreature)
{
    if (pCreature->GetEntry() == CREATURE_CELEBRAS)
        cGuid = pCreature->GetObjectGuid();
}

void instance_maraudon::OnGameObjectCreate(GameObject *pGo)
{
    if (pGo->GetEntry() == GO_PEDESTAL)
        pGuid = pGo->GetObjectGuid();
    if (pGo->GetEntry() == GO_BOOK)
        bGuid = pGo->GetObjectGuid();
    if (pGo->GetEntry() == GO_BLUE_AURA)
        aGuid = pGo->GetObjectGuid();
}

InstanceData* GetInstanceData_instance_maraudon(Map* pMap)
{
    return new instance_maraudon(pMap);
}

struct npc_celebrasAI : public ScriptedAI
{
    enum Phase
    {
        EVENT_PHASE_INIT,
        EVENT_PHASE_SAY_1,
        EVENT_PHASE_GO_1,
        EVENT_PHASE_AT_1,
        EVENT_PHASE_SAY_2,
        EVENT_PHASE_GO_2,
        EVENT_PHASE_GO_3,
        EVENT_PHASE_AT_2,
        EVENT_PHASE_CAST_1,
        EVENT_PHASE_BOOK_1,
        EVENT_PHASE_BOOK_2,
        EVENT_PHASE_SAY_3,
        EVENT_PHASE_GO_4,
        EVENT_PHASE_AT_3,
        EVENT_PHASE_GO_5,
        EVENT_PHASE_GO_6,
        EVENT_PHASE_GO_7,
        EVENT_PHASE_GO_8,
        EVENT_PHASE_GO_9,
        EVENT_PHASE_AT_4,
        EVENT_PHASE_GO_10,
        EVENT_PHASE_END
    };

    npc_celebrasAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    void Reset() override
    {
        InEvent = false;
        EventTimer = 0;
        EventPhase = EVENT_PHASE_INIT;
    }

    void StartEvent(Player *plr)
    {
        if (InEvent)
            return;
        sayFlag = true;
        IsCasting = false;
        InEvent = true;
        CastingTime = 0;
        EventTimer = 0;
        pGuid = plr->GetObjectGuid();
        m_creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
        m_creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
    }

    void MovementInform(uint32 /*uiMotionType*/, uint32 uiPointId) override
    {
        switch (uiPointId)
        {
            case EVENT_PHASE_GO_1:
                EventTimer = 0;
                EventPhase = EVENT_PHASE_AT_1;
                break;
            case EVENT_PHASE_GO_2:
                m_creature->GetMotionMaster()->MovePoint(EVENT_PHASE_GO_3, 656.4841f, 73.4726f, -86.8292f, MOVE_PATHFINDING, 0, 3.0223f);
                break;
            case EVENT_PHASE_GO_3:
                EventTimer = 0;
                EventPhase = EVENT_PHASE_AT_2;
                break;
            case EVENT_PHASE_GO_4:
                EventTimer = 0;
                EventPhase = EVENT_PHASE_AT_3;
                break;
            case EVENT_PHASE_GO_5:
                m_creature->MonsterSay("My scepter will once again become whole!", LANG_UNIVERSAL);
                m_creature->GetMotionMaster()->MovePoint(EVENT_PHASE_GO_6, 656.4841f, 73.4726f, -86.8292f, MOVE_PATHFINDING, 0, 3.0223f);
                break;
            case EVENT_PHASE_GO_6:
                if (instance_maraudon* pInstance = dynamic_cast<instance_maraudon*>((ScriptedInstance*)m_creature->GetInstanceData()))
                    if (GameObject *pGo = m_creature->GetMap()->GetGameObject(pInstance->GetPedestalGuid()))
                        pInstance->DoUseDoorOrButton(pGo->GetObjectGuid());
                m_creature->GetMotionMaster()->MovePoint(EVENT_PHASE_GO_7, 655.7295f, 67.0476f, -86.8281f);
                break;
            case EVENT_PHASE_GO_7:
                EventTimer = 0;
                EventPhase = EVENT_PHASE_AT_4;
                m_creature->GetMotionMaster()->MovePoint(EVENT_PHASE_GO_8, 647.8120f, 63.5547f, -86.7693f, MOVE_PATHFINDING, 0, 1.0015f);
                break;
            case EVENT_PHASE_GO_9:
                m_creature->GetMotionMaster()->MovePoint(EVENT_PHASE_GO_10, 657.1558f, 79.18f, -86.8292f, MOVE_PATHFINDING, 0, 4.5891f);
                break;
            case EVENT_PHASE_GO_10:
                m_creature->GetMotionMaster()->MovePoint(EVENT_PHASE_END, 654.3468f, 84.9036f, -86.8436f, MOVE_PATHFINDING, 0, 4.4439f);
                break;
            case EVENT_PHASE_END:
            {
                if (Player *pPlayer = m_creature->GetMap()->GetPlayer(pGuid))
                    pPlayer->GroupEventHappens(QUEST_CELEBRAS_CEPTER, m_creature);
                InEvent = false;
                m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
            }
            break;
        }
    }

    void ReadBook()
    {
        if (EventPhase == EVENT_PHASE_BOOK_1)
        {
            EventPhase = EVENT_PHASE_BOOK_2;
            if (instance_maraudon* pInstance = dynamic_cast<instance_maraudon*>((ScriptedInstance*)m_creature->GetInstanceData()))
                if (GameObject *pGo = m_creature->GetMap()->GetGameObject(pInstance->GetAuraGuid()))
                {
                    pGo->SetRespawnTime(HOUR);
                    pGo->Refresh();
                }
        }
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!InEvent || EventPhase == EVENT_PHASE_END)
            return;
        if (EventPhase == EVENT_PHASE_INIT)
        {
            m_creature->MonsterSay("You wish to learn of the stone? Follow me.", LANG_UNIVERSAL);
            m_creature->GetMotionMaster()->MovePoint(EVENT_PHASE_GO_1, 654.3468f, 84.9036f, -86.8436f, MOVE_PATHFINDING, 0, 4.4439f);
            EventPhase = EVENT_PHASE_GO_1;
        }
        if (EventPhase == EVENT_PHASE_AT_1 && EventTimer > 2000)
        {
            m_creature->MonsterSay("For so long I have drifted in my cursed form. You have freed me... Your hard work shall be repaid.", LANG_UNIVERSAL);
            m_creature->UpdateSpeed(MOVE_WALK, true, m_creature->GetSpeed(MOVE_WALK) / 10);
            EventPhase = EVENT_PHASE_SAY_2;
        }
        if (EventPhase == EVENT_PHASE_SAY_2 && EventTimer > 6000)
        {
            m_creature->GetMotionMaster()->MovePoint(EVENT_PHASE_GO_2, 657.1558f, 79.18f, -86.8292f, MOVE_PATHFINDING, 0, 4.5891f);
            EventPhase = EVENT_PHASE_GO_2;
        }
        if (EventPhase == EVENT_PHASE_AT_2 && EventTimer > 2000)
        {
            if (Player *pPlayer = m_creature->GetMap()->GetPlayer(pGuid))
                m_creature->MonsterSay("Please do as I instruct you, $N.", LANG_UNIVERSAL, pPlayer);
            EventPhase = EVENT_PHASE_CAST_1;
        }
        if (EventPhase == EVENT_PHASE_CAST_1 && EventTimer > 4000)
        {
            if (instance_maraudon* pInstance = dynamic_cast<instance_maraudon*>((ScriptedInstance*)m_creature->GetInstanceData()))
                if (GameObject *pGo = m_creature->GetMap()->GetGameObject(pInstance->GetBookGuid()))
                {
                    pGo->SetRespawnTime(HOUR);
                    pGo->Refresh();
                }
            EventPhase = EVENT_PHASE_BOOK_1;
        }
        if ((EventPhase == EVENT_PHASE_BOOK_1 || EventPhase == EVENT_PHASE_BOOK_2) && EventTimer > 6000 && sayFlag)
        {
            sayFlag = false;
            m_creature->MonsterSay("Read this tome I have placed before you, and speak the words aloud.", LANG_UNIVERSAL);
            IsCasting = true;
            CastingTime = 0;
        }
        if (EventPhase == EVENT_PHASE_BOOK_2 && EventTimer > 6000)
        {
            IsCasting = false;
            m_creature->RemoveAurasDueToSpell(SPELL_FRENEZIED_REGEN);
            DoCastSpellIfCan(m_creature, SPELL_END_EVENT, CAST_INTERRUPT_PREVIOUS);
            EventTimer = 0;
        }
        if (EventPhase == EVENT_PHASE_BOOK_2 && EventTimer > 2000)
        {
            m_creature->MonsterSay("Together, the two parts shall become one, once again.", LANG_UNIVERSAL);
            EventPhase = EVENT_PHASE_SAY_3;
        }
        if (EventPhase == EVENT_PHASE_SAY_3 && EventTimer > 6000)
        {
            m_creature->MonsterSay("Shal myrinan ishnu daldorah...", LANG_UNIVERSAL);
            m_creature->GetMotionMaster()->MovePoint(EVENT_PHASE_GO_4, 654.0375f, 73.8043f, -86.0753f, MOVE_PATHFINDING, 0, 3.0537f);
            EventPhase = EVENT_PHASE_GO_4;
        }
        if (EventPhase == EVENT_PHASE_AT_3 && EventTimer > 2000)
        {
            m_creature->GetMotionMaster()->MovePoint(EVENT_PHASE_GO_5, 656.4841f, 73.4726f, -86.8292f, MOVE_PATHFINDING, 0, 3.0223f);
            EventPhase = EVENT_PHASE_GO_5;
        }
        if (EventPhase == EVENT_PHASE_AT_4 && EventTimer > 8000)
        {
            m_creature->GetMotionMaster()->MovePoint(EVENT_PHASE_GO_9, 655.7294f, 67.0476f, -86.8281f, MOVE_PATHFINDING, 0, 4.4439f);
            if (instance_maraudon* pInstance = dynamic_cast<instance_maraudon*>((ScriptedInstance*)m_creature->GetInstanceData()))
                if (GameObject *pGo = m_creature->GetMap()->GetGameObject(pInstance->GetAuraGuid()))
                    pGo->SetLootState(GO_JUST_DEACTIVATED);
            EventPhase = EVENT_PHASE_END;
        }
        if (IsCasting)
        {
            if (CastingTime < uiDiff)
            {
                DoCastSpellIfCan(m_creature, SPELL_FRENEZIED_REGEN, CAST_TRIGGERED); // Apply aura
                DoCastSpellIfCan(m_creature, SPELL_HEARTSTONE, CAST_INTERRUPT_PREVIOUS);
                CastingTime = 9000;
            }
            else
                CastingTime -= uiDiff;
        }
        EventTimer += uiDiff;
    }

private:
    bool InEvent;
    bool IsCasting;
    uint32 EventTimer;
    uint32 CastingTime;
    Phase EventPhase;
    ObjectGuid pGuid;
    bool sayFlag;
};

CreatureAI* GetAI_npc_celebras(Creature* pCreature)
{
    return new npc_celebrasAI(pCreature);
}

bool QuestAccept_npc_celebras(Player *pPlayer, Creature *pCreature, const Quest *pQuest)
{
    if (pQuest->GetQuestId() == QUEST_CELEBRAS_CEPTER)
    {
        if (npc_celebrasAI *pCelebras = dynamic_cast<npc_celebrasAI*>(pCreature->AI()))
            pCelebras->StartEvent(pPlayer);
    }
    return true;
}

bool GOUse_go_celebras_book(Player* /*pPlayer*/, GameObject* pGo)
{
    if (instance_maraudon* pInstance = dynamic_cast<instance_maraudon*>((ScriptedInstance*)pGo->GetInstanceData()))
        if (Creature *pCreature = pGo->GetMap()->GetCreature(pInstance->GetCelebrasGuid()))
            if (npc_celebrasAI* pCelebrasAI = dynamic_cast<npc_celebrasAI*>(pCreature->AI()))
                pCelebrasAI->ReadBook();
    return false;
}

void AddSC_instance_maraudon()
{
    Script* pNewScript;

    pNewScript = new Script;
    pNewScript->Name = "instance_maraudon";
    pNewScript->GetInstanceData = &GetInstanceData_instance_maraudon;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "npc_celebras";
    pNewScript->GetAI = &GetAI_npc_celebras;
    pNewScript->pQuestAcceptNPC = &QuestAccept_npc_celebras;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "go_celebras_book";
    pNewScript->pGOHello = &GOUse_go_celebras_book;
    pNewScript->RegisterSelf();
}
