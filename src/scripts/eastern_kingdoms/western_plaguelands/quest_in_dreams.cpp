/*
 * Copyright (C) 2010-2014 Anathema Script Engine project <http://valkyrie-wow.com/>
 * Copyright (C) 2006-2014 ScriptDev2 <http://www.scriptdev2.com/>
 */

/* ScriptData
SDName: npc_taelan
SD%Complete: 100
SDComment: Quest support: 5944. NPC support 1842, 1836.
SDCategory: Western Plaguelands
EndScriptData */

/* ContentData
npc_taelan
npc_scarlet_cavalier
EndContentData */

#include "scriptPCH.h"
#include "quest_in_dreams.h"

npc_tirion_fordring_in_dreamsAI::npc_tirion_fordring_in_dreamsAI(Creature* pCreature) : npc_escortAI(pCreature)
{
    m_creature->setFaction(FACTION_ESCORT_N_FRIEND_PASSIVE);

    npc_tirion_fordring_in_dreamsAI::Reset();
}

void npc_tirion_fordring_in_dreamsAI::Reset()
{
    m_uiHolyCleaveTimer = urand(5000, 7000);
    m_uiHolyStrikeTimer = urand(6000, 8000);
    m_uiCrusaderStrikeTimer = urand(7000, 9000);
    m_uiDevotionAuraTimer = 0;

    if (!HasEscortState(STATE_ESCORT_ESCORTING))
    {
        m_isIsillienDead = false;
        m_uiEventCount = 1;       
    }
}

void npc_tirion_fordring_in_dreamsAI::WaypointReached(uint32 uiPointId)
{
    switch (uiPointId)
    {
        case 1:
            SetEscortPaused(true);
            m_uiEventCount = 2;
            break;
    }
}

void npc_tirion_fordring_in_dreamsAI::MovementInform(uint32 uiMotionType, uint32 uiPointId)
{
    if (m_uiEventCount == 2)
    {
        if (uiMotionType == POINT_MOTION_TYPE && uiPointId == 99)
        {
            if (auto pTaelan = m_pInterface->GetCreature(m_creature, INDEX_TAELAN))
            {
                m_creature->SetFacingToObject(pTaelan);
                m_creature->SetStandState(UNIT_STAND_STATE_KNEEL);
                ++m_uiEventCount;                
            }

            if (auto pIsillien = m_pInterface->GetCreature(m_creature, INDEX_ISILLIEN))
            {
                if (auto pIsillienAI = static_cast<npc_isillienAI*>(pIsillien->AI()))
                    pIsillienAI->m_isTirionHere = true;
            }
        }        
    }

    npc_escortAI::MovementInform(uiMotionType, uiPointId);
}

void npc_tirion_fordring_in_dreamsAI::TimerSayAndGo(const uint32 uiDiff, uint32 uiUpd, int32 textId, Emote emote, bool incEvent)
{
    if (m_uiEventTimer < uiDiff)
    {
        DoScriptText(textId, m_creature);
        m_uiEventTimer = uiUpd;
        if (incEvent) ++m_uiEventCount;
    }
    else
        m_uiEventTimer -= uiDiff;        
}

void npc_tirion_fordring_in_dreamsAI::DoAttack(const uint32 uiDiff)
{
    if (m_uiDevotionAuraTimer < uiDiff)
    {
        DoCastSpellIfCan(m_creature, SPELL_DEVOTION_AURA, CF_AURA_NOT_PRESENT);
        m_uiDevotionAuraTimer = 5000;
    }
    else
        m_uiDevotionAuraTimer -= uiDiff;

    if (m_uiHolyCleaveTimer < uiDiff)
    {
        DoCastSpellIfCan(m_creature->getVictim(), SPELL_HOLY_CLEAVE);
        m_uiHolyCleaveTimer = urand(5000, 7000);
    }
    else
        m_uiHolyCleaveTimer -= uiDiff;

    if (m_uiHolyStrikeTimer < uiDiff)
    {
        DoCastSpellIfCan(m_creature, SPELL_HOLY_STRIKE);
        m_uiHolyStrikeTimer = urand(6000, 8000);
    }
    else
        m_uiHolyStrikeTimer -= uiDiff;

    if (m_uiCrusaderStrikeTimer < uiDiff)
    {
        DoCastSpellIfCan(m_creature->getVictim(), SPELL_CRUSADER_STRIKE);
        m_uiCrusaderStrikeTimer = urand(7000, 9000);
    }
    else
        m_uiCrusaderStrikeTimer -= uiDiff;

    DoMeleeAttackIfReady();
}

void npc_tirion_fordring_in_dreamsAI::UpdateEscortAI(const uint32 uiDiff)
{
    switch (m_uiEventCount)
    {
        case 1:
            m_creature->Mount(TIRION_MOUNT);
            Start(true);
            m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_PASSIVE);
            m_uiEventCount = 0;
            break;
        case 2:
            if (Creature* pTaelan = m_pInterface->GetCreature(m_creature, INDEX_TAELAN))
            {
                m_creature->Unmount();
                m_creature->GetMotionMaster()->Clear();
                m_creature->GetMotionMaster()->MovePoint(99, pTaelan->GetPositionX()-2.0f, pTaelan->GetPositionY()-2.0f, pTaelan->GetPositionZ(), MOVE_PATHFINDING);
                m_uiEventTimer = 3000;
            }            
            break;
        case 3:
            if (m_uiEventTimer < uiDiff)
            {
                m_uiEventTimer = 7000;
                ++m_uiEventCount;
            }
            else
                m_uiEventTimer -= uiDiff;
            break;
        case 4:
            if (m_uiEventTimer < uiDiff)
            { 
                if (Creature* pIsillien = m_pInterface->GetCreature(m_creature, INDEX_ISILLIEN))
                {
                    DoScriptText(SAY_TIRION_1, m_creature);
                    m_creature->SetStandState(UNIT_STAND_STATE_STAND);
                    m_creature->SetFacingToObject(pIsillien);
                    m_creature->HandleEmote(EMOTE_ONESHOT_TALK);
                    if (auto pIsillienAI = dynamic_cast<npc_isillienAI*>(pIsillien->AI()))
                    {
                        pIsillienAI->SetEvent(7);
                    }
                }

                m_uiEventTimer = 10000;
                ++m_uiEventCount;
            }
            else
                m_uiEventTimer -= uiDiff;
            break;
        case 5:
            TimerSayAndGo(uiDiff, 5000, SAY_TIRION_2, EMOTE_ONESHOT_POINT);
            break;
        case 6:
            TimerSayAndGo(uiDiff, 7000, SAY_TIRION_3, EMOTE_ONESHOT_EXCLAMATION);
            break;
        case 7:
            if (m_uiEventTimer < uiDiff)
            {
                if (Creature* pIsillien = m_pInterface->GetCreature(m_creature, INDEX_ISILLIEN))
                {
                    m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_PASSIVE);

                    m_creature->AddThreat(pIsillien, 200.0f);
                    pIsillien->getThreatManager().clearReferences();
                    pIsillien->AddThreat(m_creature, 200.0f);

                    AttackStart(pIsillien);
                    pIsillien->AI()->AttackStart(m_creature);
                    
                    m_uiEventCount = 8;
                }

                m_uiEventTimer = 2000;
            }
            else
                m_uiEventTimer -= uiDiff;
            break;
        case 8:
            if (m_uiEventTimer < uiDiff)
            {
                if (Creature* pIsillien = m_pInterface->GetCreature(m_creature, INDEX_ISILLIEN))
                    if (pIsillien->isDead() && !m_isIsillienDead)
                    {
                        ++m_uiEventCount;
                        m_isIsillienDead = true;
                        m_uiEventTimer = 2000;
                    }
                    else
                        m_uiEventTimer = 1000;
            }
            else
                m_uiEventTimer -= uiDiff;
            break;
        case 9:
            if (m_uiEventTimer < uiDiff)
            {
                if (auto pTaelan = m_pInterface->GetCreature(m_creature, INDEX_TAELAN))
                    m_creature->SetFacingToObject(pTaelan);

                DoScriptText(SAY_TIRION_4, m_creature);
                m_uiEventTimer = 10000;
                ++m_uiEventCount;
            }
            else
                m_uiEventTimer -= uiDiff;
            break;
        case 10:
            TimerSayAndGo(uiDiff, 10000, SAY_TIRION_5, EMOTE_ONESHOT_EXCLAMATION);
            break;
        case 11:
            m_creature->SetStandState(UNIT_STAND_STATE_KNEEL);
            TimerSayAndGo(uiDiff, 7000, SAY_TIRION_6);
            break;
        case 12:
            m_creature->SetStandState(UNIT_STAND_STATE_STAND);
            TimerSayAndGo(uiDiff, 6000, SAY_TIRION_7, EMOTE_ONESHOT_TALK_NOSHEATHE);
            break;
        case 13:
        {
            if (m_uiEventTimer < uiDiff)
            {
                DoScriptText(SAY_TIRION_8, m_creature);
                m_creature->HandleEmote(EMOTE_ONESHOT_EXCLAMATION);
                m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);

                if (auto pTaelanAI = m_pInterface->GetAI<npc_taelanAI>(m_creature, INDEX_TAELAN))
                    pTaelanAI->Event7CompleteQuest();
                else
                {
                    m_uiEventCount = 14;
                    m_uiEventTimer = 3000;
                    return;
                }

                m_uiEventCount = 0;
            }
            else
                m_uiEventTimer -= uiDiff;
            break;
        }
        case 14:
        {
            if (m_uiEventTimer < uiDiff)
            {
                sLog.outError("[WesternPlaguelands.InDreams] TaelanAI cast failed, retrying.");

                if (auto pTaelanAI = m_pInterface->GetAI<npc_taelanAI>(m_creature, INDEX_TAELAN))
                {
                    pTaelanAI->Event7CompleteQuest();
                    m_uiEventCount = 0;
                }
                else
                {
                    sLog.outError("[WesternPlaguelands.InDreams] TaelanAI cast failed completely, aborting.");
                    FailEscort();
                }
            }
            else
                m_uiEventTimer -= uiDiff;
        }
        break;
    }

    if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
        return;

    DoAttack(uiDiff);
}

void npc_tirion_fordring_in_dreamsAI::JustDied(Unit* /*pKiller*/)
{
    FailEscort();
}

void npc_tirion_fordring_in_dreamsAI::FailEscort() const
{
    // unsummon Isillien and his elite guards
    if (auto pIsillien = m_pInterface->GetCreature(m_creature, INDEX_ISILLIEN))
    {     
        if (auto pIsillienAI = static_cast<npc_isillienAI*>(pIsillien->AI()))
            pIsillienAI->GuardsDoDespawn();

        pIsillien->DisappearAndDie();
    }

    // reset Taelan
    if (Creature* pTaelan = m_pInterface->GetCreature(m_creature, INDEX_TAELAN))
        pTaelan->DisappearAndDie();
        
    // unsummon Tirion
    m_creature->DisappearAndDie();
}

npc_isillienAI::npc_isillienAI(Creature* pCreature) : npc_escortAI(pCreature)
{
    m_uiEventCount = 0;
    m_uiSubEventCount = 1;
    m_uiEventTimer = 10000;

    m_isTirionHere = false;
    m_isTaelanDead = false;
    m_bControllingPlayer = false;

    m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PASSIVE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_PACIFIED);

    npc_isillienAI::Reset();
}

void npc_isillienAI::Reset()
{
    m_uiManaBurnTimer = 10000;
    m_uiPowerShieldTimer = 15000;
    m_uiMindBlastTimer = urand(5000, 10000);
    m_uiMindFlayTimer = urand(7500, 15000); 
    m_uiDominateMindTimer = 60000;
    m_uiHealTimer = urand(5000, 15000);
    m_uiGlobalCooldownTimer = 0;
}

void npc_isillienAI::SetEvent(int32 m_uiEvent)
{
    m_uiEventCount = m_uiEvent;
}

void npc_isillienAI::EnterEvadeMode()
{
    // prevent entering casual evade mode to not to stuck event
    // if players flee from Isillien fight, fail the event for them
    if (m_uiEventCount == 6 && !m_uiSubEventCount && !m_bControllingPlayer)
    {
        FailEscort();
    }
}

void npc_isillienAI::GroupRemoveDisguise(Player* player)
{
    if (player)
    {
        if (Group *pGroup = player->GetGroup())
        {
            for (GroupReference *itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
            {
                if (Player *pGroupGuy = itr->getSource())
                    pGroupGuy->RemoveAurasDueToSpell(SPELL_DISGUISE);
            }
        }
        else 
            player->RemoveAurasDueToSpell(SPELL_DISGUISE);
    }
}

void npc_isillienAI::FailEscort() const
{
    if (auto pTirion = m_pInterface->GetCreature(m_creature, INDEX_TIRION))
    {
        if (auto pTirionAI = static_cast<npc_tirion_fordring_in_dreamsAI*>(pTirion->AI()))
            pTirionAI->FailEscort();
    }
    else
    {
        // reset Taelan
        if (auto pTaelan = m_pInterface->GetCreature(m_creature, INDEX_TAELAN))
            pTaelan->DisappearAndDie();

        // unsummon Isillien elite guards
        GuardsDoDespawn();

        m_creature->DisappearAndDie();
    }  
}

void npc_isillienAI::WaypointReached(uint32 uiPointId)
{
    switch (uiPointId)
    {
        case 0: // initial point: guards summoned
            SetEscortPaused(true);
            break;
        case 1:
            SetEscortPaused(true);
            break;
        case 2:
            SetEscortPaused(true);
            break;
        default:
            break;
    }
}

void npc_isillienAI::DamageTaken(Unit* pDoneBy, uint32& uiDamage)
{
    if (m_uiEventCount == 6 && m_uiSubEventCount == 0)
    {
        if (m_creature->GetHealthPercent() < 40.0f && m_uiEventTimer > 1000)
        {
            m_uiEventTimer = 1;
        }        
    }

    if (m_uiEventCount <= 5 && m_uiSubEventCount < 3 && pDoneBy && pDoneBy->IsCharmerOrOwnerPlayerOrPlayerItself())
    {
        uiDamage = 0;
    }
}

void npc_isillienAI::GuardsDoDespawn() const
{
    // despawn inner guards
    for (auto itr = pCrimsonInner.begin(); itr != pCrimsonInner.end(); ++itr)
    {
        if (auto pCrimson = m_creature->GetMap()->GetCreature(*itr))
            if (pCrimson->isAlive())
                pCrimson->DisappearAndDie();
    }

    // despawn outer guards
    for (auto itr = pCrimsonOuter.begin(); itr != pCrimsonOuter.end(); ++itr)
    {
        if (auto pCrimson = m_creature->GetMap()->GetCreature(*itr))
            if (pCrimson->isAlive())
                pCrimson->DisappearAndDie();
    }
}

void npc_isillienAI::GuardsDoAttack(Unit* pTarget, bool inner, bool start)
{
    for (auto itr = inner ? pCrimsonInner.begin() : pCrimsonOuter.begin(); itr != (inner ? pCrimsonInner.end() : pCrimsonOuter.end()); ++itr)
    {
        if (auto pCrimson = m_creature->GetMap()->GetCreature(*itr))
        {
            if (!pCrimson->isAlive())
                continue;

            pCrimson->getThreatManager().clearReferences();

            if (start)
            {
                pCrimson->AI()->AttackStart(pTarget);
                pCrimson->AddThreat(pTarget, 15.0f);
            }
            else
            {
                auto pVictim = pCrimson->getVictim();
                if (!pVictim || !pVictim->IsCharmerOrOwnerPlayerOrPlayerItself())
                    pCrimson->AttackStop();
            }
        }
    }
}

void npc_isillienAI::GuardsDoSummon(bool inner)
{
    if (inner)
    {
        for (uint8 i = 0; i < 2; ++i)
        {
            auto pCrimson = m_creature->SummonCreature(NPC_CRIMSON,
                SpawnCoordsCrimsonInner[i].x,
                SpawnCoordsCrimsonInner[i].y,
                SpawnCoordsCrimsonInner[i].z,
                SpawnCoordsCrimsonInner[i].o, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 15 * MINUTE*IN_MILLISECONDS, true);

            if (pCrimson)
            {
                pCrimsonInner.push_back(pCrimson->GetObjectGuid());
                pCrimson->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PASSIVE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_PACIFIED);
                pCrimson->GetMotionMaster()->Clear();
                pCrimson->GetMotionMaster()->MovePoint(0, MoveCoordsCrimsonInner[i].x, MoveCoordsCrimsonInner[i].y, MoveCoordsCrimsonInner[i].z, MOVE_PATHFINDING);
            }
        }
    }
    else
    {
        for (uint8 i = 0; i < 3; ++i)
        {
            auto pCrimson = m_creature->SummonCreature(NPC_CRIMSON,
                SpawnCoordsCrimsonOuter[i].x,
                SpawnCoordsCrimsonOuter[i].y,
                SpawnCoordsCrimsonOuter[i].z,
                SpawnCoordsCrimsonOuter[i].o, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 15 * MINUTE*IN_MILLISECONDS, true);

            if (pCrimson)
            {
                pCrimsonOuter.push_back(pCrimson->GetObjectGuid());
            }
        }
    }
}

void npc_isillienAI::TimerSayAndGo(const uint32 uiDiff, uint32 uiUpd, int32 textId, Emote emote, bool incSub)
{
    if (m_uiEventTimer < uiDiff)
    {
        DoScriptText(textId, m_creature);

        if (emote)
            m_creature->HandleEmote(emote);

        m_uiEventTimer = uiUpd;
        if (incSub) ++m_uiSubEventCount;
    }
    else
        m_uiEventTimer -= uiDiff;        
}

void npc_isillienAI::Event1SummonCrimson()
{
    GuardsDoSummon(true);
    DoScriptText(SAY_ISILLIEN_1, m_creature);
    Start();
    m_uiEventCount = 2;
}

void npc_isillienAI::Event2TalkBeforeFight(const uint32 uiDiff)
{
    switch (m_uiSubEventCount)
    {
        case 1:
            TimerSayAndGo(uiDiff, 6000, SAY_ISILLIEN_2);
            break;
        case 2:
            TimerSayAndGo(uiDiff, 6000, SAY_ISILLIEN_3);
            break;
        case 3:
            TimerSayAndGo(uiDiff, 6000, SAY_ISILLIEN_4);
            break;
        case 4:
            TimerSayAndGo(uiDiff, 3000, EMOTE_ISILLIEN_1);
            break;
        case 5:
            TimerSayAndGo(uiDiff, 3000, SAY_ISILLIEN_5);
            break;
        case 6:
        {
            if (m_uiEventTimer < uiDiff)
            {
                m_uiEventCount = 3;
                m_uiSubEventCount = 0;
            }
            else
                m_uiEventTimer -= uiDiff;
        }
    }
}

void npc_isillienAI::Event3FightTaelan(const uint32 uiDiff)
{
    if (m_uiEventTimer < uiDiff)
    {
        if (auto pTaelan = m_pInterface->GetCreature(m_creature, INDEX_TAELAN))
        {
            // force players to lose their disguise
            Player* player = nullptr;
            if (auto pTaelanAI = static_cast<npc_taelanAI*>(pTaelan->AI()))
            {
                if ((player = pTaelanAI->GetPlayer()))
                {
                    pPlayerGuid = player->GetObjectGuid();
                    GroupRemoveDisguise(player);
                } 
            }

            // crimson guards are attackable now
            for (auto itr = pCrimsonInner.begin(); itr != pCrimsonInner.end(); ++itr)
            {
                if (auto pCrimson = m_creature->GetMap()->GetCreature(*itr))
                    pCrimson->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PASSIVE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_PACIFIED);
            }

            GuardsDoSummon(false);

            // inner Crimson Guards attack Taelan, outer - players
            GuardsDoAttack(pTaelan, true, true);
            GuardsDoAttack(player, false, true);

            // force Isillien and Taelan fight each other
            pTaelan->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PASSIVE);
            m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED | UNIT_FLAG_PASSIVE | UNIT_FLAG_NON_ATTACKABLE);

            pTaelan->AddThreat(m_creature, 100.0f);
            m_creature->AddThreat(pTaelan, 100.0f);

            m_creature->AI()->AttackStart(pTaelan);
            pTaelan->AI()->AttackStart(m_creature);
        }

        m_uiEventTimer = 3000;
        m_uiEventCount = 4;
    }
    else
        m_uiEventTimer -= uiDiff;
}

void npc_isillienAI::Event4KillTaelan(const uint32 uiDiff)
{
    switch (m_uiSubEventCount)
    {
        case 0:
            if (m_uiEventTimer < uiDiff)
            {
                if (m_creature->GetHealthPercent() < 50.0f)
                    ++m_uiSubEventCount;
                else 
                    if (auto pTaelan = m_pInterface->GetCreature(m_creature, INDEX_TAELAN))
                        if (pTaelan->GetHealthPercent() < 50.0f && !m_isTaelanDead)
                            ++m_uiSubEventCount;
                
                //waiting for Taelan or Isillien hp limit
                if (m_uiSubEventCount == 0)
                    m_uiEventTimer = 300;
            }
            else
                m_uiEventTimer -= uiDiff;
            break;
        case 1:
            DoScriptText(SAY_ISILLIEN_6, m_creature);
            m_uiEventTimer = 2000;
            m_isTaelanDead = true;
            ++m_uiSubEventCount;
            break;
        case 2:
            if (m_uiEventTimer < uiDiff)
            {
                if (auto pTaelan = m_pInterface->GetCreature(m_creature, INDEX_TAELAN))
                {
                    m_creature->getThreatManager().clearReferences();
                    m_creature->AttackStop();

                    if (DoCastSpellIfCan(pTaelan, SPELL_TAELAN_DEATH, CF_TRIGGERED | CF_INTERRUPT_PREVIOUS | CF_FORCE_CAST) == CAST_OK)
                    {
                        GuardsDoAttack(nullptr, true, false);
                        GuardsDoAttack(nullptr, false, false);

                        m_uiEventTimer = 3000;
                        m_uiEventCount = 5;
                        m_uiSubEventCount = 1;
                        SetEscortPaused(false);
                    }
                }                 
            }
            else
                m_uiEventTimer -= uiDiff;
            break;
    }
}

void npc_isillienAI::Event5TalkBeforeTirionArrival(const uint32 uiDiff)
{
    switch (m_uiSubEventCount)
    {
        case 1:
            if (m_uiEventTimer < uiDiff)
            {
                m_creature->HandleEmote(EMOTE_ONESHOT_LAUGH);
                m_uiEventTimer = 2000;
                ++m_uiSubEventCount;
            }
            else
                m_uiEventTimer -= uiDiff;
            break;
        case 2:
            TimerSayAndGo(uiDiff, 6000, SAY_ISILLIEN_7, EMOTE_ONESHOT_TALK_NOSHEATHE);
            break;
        case 3:
            if (m_uiEventTimer < uiDiff)
            {
                if (auto pPlayer = m_creature->GetMap()->GetPlayer(pPlayerGuid))
                {
                    m_creature->AddThreat(pPlayer, 20.0f);
                    GuardsDoAttack(pPlayer, true, true);
                    GuardsDoAttack(pPlayer, false, true);

                    AttackStart(pPlayer);
                }

                m_uiEventCount = 6;
                m_uiSubEventCount = 0;
                m_uiEventTimer = 90 * IN_MILLISECONDS;
            }
            else
                m_uiEventTimer -= uiDiff;
            break;
    }
}

void npc_isillienAI::Event6TirionArrival(const uint32 uiDiff)
{
    switch (m_uiSubEventCount)
    {
        case 0:
            if (m_uiEventTimer < uiDiff)
            {
                if (Creature* pTirion = m_creature->SummonCreature(NPC_TIRION, 
                    SpawnCoordsTirion.x,
                    SpawnCoordsTirion.y,
                    SpawnCoordsTirion.z,
                    SpawnCoordsTirion.o, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 15*MINUTE*IN_MILLISECONDS, true))
                {
                    m_pInterface->AddGuid(pTirion->GetObjectGuid(), INDEX_TIRION);

                    if (auto pTirionAI = static_cast<npc_tirion_fordring_in_dreamsAI*>(pTirion->AI()))
                        pTirionAI->m_pInterface = m_pInterface;

                    m_uiEventTimer = 4000;
                    ++m_uiSubEventCount;
                }                      
            }
            else
                m_uiEventTimer -= uiDiff;
            break;
        case 1:
            if (m_uiEventTimer < uiDiff)
            {
                if (m_isTirionHere)
                {
                    m_uiEventCount = 0;
                    m_uiSubEventCount = 0;
                }
                else
                    m_uiEventTimer = 1000;
            }
            else
                m_uiEventTimer -= uiDiff;
            break;
    }
}

void npc_isillienAI::Event7FightTirion(const uint32 uiDiff)
{
    switch (m_uiSubEventCount)
    {
            case 0:
            if (m_uiEventTimer < uiDiff)
            {
                if (Creature* pTirion = m_pInterface->GetCreature(m_creature, INDEX_TIRION))
                {
                    DoScriptText(SAY_ISILLIEN_8, m_creature);
                    m_uiEventTimer = 16000;
                    ++m_uiSubEventCount;  
                }                       
            }
            else
                m_uiEventTimer -= uiDiff;
            break;
        case 1:
            if (m_uiEventTimer < uiDiff)
            {
                DoScriptText(SAY_ISILLIEN_9, m_creature);
                m_uiEventCount = 0;
                m_uiSubEventCount = -1;
            }
            else
                m_uiEventTimer -= uiDiff;
            break;
    }
}

void npc_isillienAI::DoAttack(const uint32 uiDiff)
{
    if (m_uiGlobalCooldownTimer < uiDiff)
    {
        // Dominate Mind fading
        if (m_bControllingPlayer)
        {
            if (m_uiDominateMindFadingTimer < uiDiff)
            {
                m_bControllingPlayer = false;
            }
            else
                m_uiDominateMindFadingTimer -= uiDiff;
        }

        // Dominate Mind
        if (m_uiDominateMindTimer < uiDiff)
        {
            auto pVictim = m_creature->getVictim();

            if (pVictim->GetTypeId() == TYPEID_PLAYER && DoCastSpellIfCan(pVictim, SPELL_DOMINATE_MIND) == CAST_OK)
            {
                m_uiDominateMindFadingTimer = 16000;
                m_bControllingPlayer = true;

                m_uiGlobalCooldownTimer = 1500;
                m_uiDominateMindTimer = 60000;
                return;
            }
        }
        else
            m_uiDominateMindTimer -= uiDiff;

        // Mana Burn
        if (m_creature->getVictim()->getPowerType() == POWER_MANA)
        {
            if (m_uiManaBurnTimer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_MANA_BURN) == CAST_OK)
                {
                    m_uiGlobalCooldownTimer = 1500;
                    m_uiManaBurnTimer = 10000;
                    return;
                }
            }
            else
                m_uiManaBurnTimer -= uiDiff;
        }

        // Mind Blast
        if (m_uiMindBlastTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_MIND_BLAST) == CAST_OK)
            {
                m_uiGlobalCooldownTimer = 1500;
                m_uiMindBlastTimer = urand(5000, 10000);
                return;
            }
        }
        else
            m_uiMindBlastTimer -= uiDiff;

        // Mind Flay
        if (m_uiMindFlayTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_MIND_FLAY) == CAST_OK)
            {
                m_uiGlobalCooldownTimer = 1500;
                m_uiMindFlayTimer = urand(7500, 15000);
                return;
            }
        }
        else
            m_uiMindFlayTimer -= uiDiff;

        // Heals
        if (m_creature->GetHealthPercent() < 90)
        {
            if (m_uiHealTimer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature, urand(0, 1) ? SPELL_GREATER_HEAL : SPELL_FLASH_HEAL) == CAST_OK)
                {
                    m_uiGlobalCooldownTimer = 1500;
                    m_uiHealTimer = urand(5000, 15000);
                    return;
                }
            }
            else
                m_uiHealTimer -= uiDiff;
        }

        // Power Word: Shield
        if (m_uiPowerShieldTimer < uiDiff)
        {
            DoCastSpellIfCan(m_creature, SPELL_POWER_SHIELD);
            m_uiPowerShieldTimer = 15000;
        }
        else
            m_uiPowerShieldTimer -= uiDiff;
    }
    else
        m_uiGlobalCooldownTimer -= uiDiff;

    DoMeleeAttackIfReady();
}

void npc_isillienAI::UpdateEscortAI(const uint32 uiDiff)
{
    switch (m_uiEventCount)
    {
        case 2:
            Event2TalkBeforeFight(uiDiff);
            break;
        case 3:
            Event3FightTaelan(uiDiff);
            break;
        case 4:
            Event4KillTaelan(uiDiff);
            break;
        case 5:
            Event5TalkBeforeTirionArrival(uiDiff);
            break;
        case 6:
            Event6TirionArrival(uiDiff);
            break;
        case 7:
            Event7FightTirion(uiDiff);
            break;
    }

    if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
        return;

    DoAttack(uiDiff);
}

npc_scarlet_cavalierAI::npc_scarlet_cavalierAI(Creature* pCreature) : ScriptedAI(pCreature)
{
    m_uiEventCount = 0;
    m_uiEventTimer = 5000;

    npc_scarlet_cavalierAI::Reset();
}

void npc_scarlet_cavalierAI::Reset()
{
    m_uiMortalStrikeTimer = urand(10000, 15000);
    m_uiCleaveTimer = urand(15000, 20000);
    m_uiBackhandTimer = urand(10000, 15000);
}

void npc_scarlet_cavalierAI::Event1WhatsUp(Creature* pTaelan)
{
    if (!pTaelan) return;

    m_pTaelanGuid = pTaelan->GetObjectGuid();
    m_creature->SetFacingToObject(pTaelan);

    switch (m_creature->GetObjectGuid().GetCounter())
    {
    case FIRST_CAVALIER_GUID:
        DoScriptText(SAY_CAVALIER_1, m_creature);
        break;
    case SECOND_CAVALIER_GUID:
        DoScriptText(SAY_CAVALIER_2, m_creature);
        break;
    case THIRD_CAVALIER_GUID:
        DoScriptText(SAY_CAVALIER_3, m_creature);
        break;
    case FOURTH_CAVALIER_GUID:
        DoScriptText(SAY_CAVALIER_4, m_creature);
        break;
    }

    ++m_uiEventCount;
}

void npc_scarlet_cavalierAI::Event2SurroundTaelan() const
{                
    switch (m_creature->GetObjectGuid().GetCounter())
    {
        case FIRST_CAVALIER_GUID:
            m_creature->GetMotionMaster()->Clear();
            m_creature->GetMotionMaster()->MovePoint(0, MoveCoordsCavaliers[0].x, MoveCoordsCavaliers[0].y, MoveCoordsCavaliers[0].z, MOVE_PATHFINDING);
            break;
        case SECOND_CAVALIER_GUID:
            m_creature->GetMotionMaster()->Clear();
            m_creature->GetMotionMaster()->MovePoint(0, MoveCoordsCavaliers[1].x, MoveCoordsCavaliers[1].y, MoveCoordsCavaliers[1].z, MOVE_PATHFINDING);
            DoScriptText(SAY_CAVALIER_5, m_creature);
            break;
        case THIRD_CAVALIER_GUID:
            m_creature->GetMotionMaster()->Clear();
            m_creature->GetMotionMaster()->MovePoint(0, MoveCoordsCavaliers[2].x, MoveCoordsCavaliers[2].y, MoveCoordsCavaliers[2].z, MOVE_PATHFINDING);
            break;
        case FOURTH_CAVALIER_GUID:
            m_creature->GetMotionMaster()->Clear();
            m_creature->GetMotionMaster()->MovePoint(0, MoveCoordsCavaliers[3].x, MoveCoordsCavaliers[3].y, MoveCoordsCavaliers[3].z, MOVE_PATHFINDING);
            break;
    }
}

void npc_scarlet_cavalierAI::Event3AttackTaelan(Creature* pTaelan)
{
    switch (m_creature->GetObjectGuid().GetCounter())
    {
        case FIRST_CAVALIER_GUID:
            DoScriptText(SAY_CAVALIER_7, m_creature);
            break;
        case SECOND_CAVALIER_GUID:
            DoScriptText(SAY_CAVALIER_6, m_creature);
            break;
        case THIRD_CAVALIER_GUID:
            DoScriptText(SAY_CAVALIER_6, m_creature);
            break;
        case FOURTH_CAVALIER_GUID:
            DoScriptText(SAY_CAVALIER_8, m_creature);
            break;
    }

    if (pTaelan)
    {        
        if (auto pTaelanAI = static_cast<npc_taelanAI*>(pTaelan->AI()))
            pTaelanAI->AttackStart(m_creature);
        m_creature->AddThreat(pTaelan, 100.0f);
        AttackStart(pTaelan);
    }
}

void npc_scarlet_cavalierAI::DoAttack(const uint32 uiDiff)
{
    if (m_uiCleaveTimer < uiDiff)
    {
        DoCastSpellIfCan(m_creature, SPELL_CLEAVE);
        m_uiCleaveTimer = urand(12000, 15000);
    }
    else
        m_uiCleaveTimer -= uiDiff;

    if (m_uiMortalStrikeTimer < uiDiff)
    {
        DoCastSpellIfCan(m_creature->getVictim(), SPELL_MORTAL_STRIKE);
        m_uiMortalStrikeTimer = urand(7000, 15000);
    }
    else
        m_uiMortalStrikeTimer -= uiDiff;

    if (m_creature->getVictim()->GetHealthPercent() < 25.0f)
    {
        if (m_uiBackhandTimer < uiDiff)
        {
            DoCastSpellIfCan(m_creature->getVictim(), SPELL_BACKHAND);
            m_uiBackhandTimer = urand(7000, 15000);
        }
        else
            m_uiBackhandTimer -= uiDiff;
    }

    DoMeleeAttackIfReady();        
}

void npc_scarlet_cavalierAI::UpdateAI(const uint32 uiDiff)
{
    if (m_uiEventCount == 1)
    {
        if (m_uiEventTimer < uiDiff)
        {
            Event2SurroundTaelan();
            ++m_uiEventCount;
        }
        else
            m_uiEventTimer -= uiDiff;
    }

    if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
        return;

    DoAttack(uiDiff);
}

void npc_scarlet_cavalierAI::MovementInform(uint32 uiMotionType, uint32 uiPointId)
{
    if (uiMotionType == POINT_MOTION_TYPE && uiPointId == 0)
    {
        switch (m_creature->GetObjectGuid().GetCounter())
        {
        case FIRST_CAVALIER_GUID:
            m_creature->SetStandState(UNIT_STAND_STATE_KNEEL);
            break;
        case SECOND_CAVALIER_GUID:
            m_creature->HandleEmote(EMOTE_ONESHOT_TALK);
            break;
        }
    }
}

void npc_scarlet_cavalierAI::JustDied(Unit* pKiller)
{
    m_creature->SetHomePosition(0, 0, 0, 0);

    ScriptedAI::JustDied(pKiller);
}

npc_taelanAI::npc_taelanAI(Creature* pCreature) : npc_escortAI(pCreature)
{
    npc_taelanAI::Reset();
    npc_taelanAI::ResetCreature();
    
    m_pInterface = std::make_shared<InDreamsInterface>();
    m_pInterface->AddGuid(m_creature->GetObjectGuid(), INDEX_TAELAN);
    m_uiLayOnHandsTimer = 0;
}

void npc_taelanAI::Reset()
{
    m_uiHolyLightTimer  = urand(6000, 8000);
    m_uiHolyCleaveTimer = urand(5000, 10000);
    m_uiCrusaderStrikeTimer = urand(7000, 9000);   

    DoCastSpellIfCan(m_creature, SPELL_MURDER, CF_AURA_NOT_PRESENT);
}

void npc_taelanAI::ResetCreature()
{
    m_isDead = false;
    m_killedCavaliers = false;
    m_mountPhase = false;

    m_lCavaliersGUID.clear();

    m_uiEventCount = 0;
    m_uiSubEventCount = 1;
    m_uiEventTimer = 7000;

    m_creature->Unmount();
    m_creature->SetStandState(UNIT_STAND_STATE_STAND);
    m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_PASSIVE | UNIT_FLAG_PACIFIED);
    m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
}

void npc_taelanAI::EnterEvadeMode()
{
    // the cavaliers fight (-2) is in process
    if (m_uiEventCount == -2)
    {
        // hope he will never fail killing them; otherwise some reset here needed
        if (!m_killedCavaliers)
            m_killedCavaliers = CavaliersAreDead();

        // cavaliers are killed: 
        if (m_killedCavaliers)
        {
            m_creature->ClearTemporaryFaction();
            m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
            m_uiEventCount = -3;
        }

        // prevent evade before fight really started
        if (m_uiEventCount == -2 || m_uiEventCount == -3)
            return;
    }

    if (m_mountPhase)
        m_creature->Mount(TAELAN_MOUNT);

    npc_escortAI::EnterEvadeMode();
}

void npc_taelanAI::JustDied(Unit* pKiller)
{
    m_creature->SetHomePosition(0, 0, 0, 0);

    npc_escortAI::JustDied(pKiller);
}

void npc_taelanAI::WaypointReached(uint32 uiPointId)
{
    switch (uiPointId)
    {
        case 0: // spawn point: after the quest is taken
            DoScriptText(SAY_TAELAN_1, m_creature);
            SetEscortPaused(true);
            m_uiEventTimer = 3000;
            m_uiEventCount = 4;
            break;
        case 12: // mount point: castle exit
            SetEscortPaused(true);
            m_uiEventTimer = 3000;
            m_uiEventCount = 5;
            break;
        case 30: // final point: tower reached
            SetEscortPaused(true);
            m_uiEventTimer = 2000;
            m_uiEventCount = 6;
            break;
        default:
            break;
    }
}

bool npc_taelanAI::CavaliersAreDead()
{
    for (auto itr = m_lCavaliersGUID.begin(); itr != m_lCavaliersGUID.end(); ++itr)
        if (*itr)
            if (Creature* cavalier = m_creature->GetMap()->GetCreature(*itr))
                if (cavalier->isAlive())
                    return false;                 

    return true;
}

bool npc_taelanAI::IsCavalierNear(uint32 counter)
{
    switch (counter)
    {
        case FIRST_CAVALIER_GUID:
        case SECOND_CAVALIER_GUID:
        case THIRD_CAVALIER_GUID:
        case FOURTH_CAVALIER_GUID:
            return true;
    }

    return false;
}

Player* npc_taelanAI::GetPlayer() const
{
    return GetPlayerForEscort();
}

void npc_taelanAI::SpellHit(Unit*, const SpellEntry* pSpell)
{
    if (pSpell->Id == SPELL_TAELAN_DEATH)
    {
        m_creature->AttackStop();
        m_creature->CastStop();
        m_creature->getThreatManager().clearReferences();
        m_creature->SetHealth(2);
        m_creature->SetStandState(UNIT_STAND_STATE_DEAD);
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_PASSIVE | UNIT_FLAG_PACIFIED);
        m_isDead = true;
    }
}

void npc_taelanAI::DamageTaken(Unit* pDoneBy, uint32& uiDamage)
{
    if (m_isDead && pDoneBy != m_creature->ToUnit())
    {
        uiDamage = 0;
    }
}

void npc_taelanAI::MoveInLineOfSight(Unit* pWho)
{
    if (m_isDead) return;

    npc_escortAI::MoveInLineOfSight(pWho);
}

void npc_taelanAI::Event1ReceivedPresent()
{
    m_creature->SetStandState(UNIT_STAND_STATE_KNEEL);

    m_uiEventTimer = 10000;
    m_creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);

    std::list<Creature*> cavaliers;
    m_lCavaliersGUID.clear();

    GetCreatureListWithEntryInGrid(cavaliers, m_creature, NPC_CAVALIER, 20.0f);
                
    for (auto itr = cavaliers.begin(); itr != cavaliers.end();)
    {
        if (!IsCavalierNear((*itr)->GetObjectGuid().GetCounter()))
            itr = cavaliers.erase(itr);
        else
            ++itr;
    }

    for (auto itr = cavaliers.begin(); itr != cavaliers.end(); ++itr)
        if (*itr && (*itr)->isAlive())
        {
            m_lCavaliersGUID.push_back((*itr)->GetObjectGuid());
            if (auto pCavalier = dynamic_cast<npc_scarlet_cavalierAI*>((*itr)->AI()))
                pCavalier->Event1WhatsUp(m_creature);
        }

    cavaliers.clear();
    m_uiEventCount = 2;    
}

void npc_taelanAI::Event2FightCavaliers(const uint32 uiDiff)
{
    if (m_uiEventTimer < uiDiff)
    {
        m_uiEventCount = -2;

        DoScriptText(SAY_TAELAN_NOO, m_creature);
        m_creature->SetStandState(UNIT_STAND_STATE_STAND);
        DoCastSpellIfCan(m_creature, SPELL_TAELAN_SUFFERING, CF_TRIGGERED);
        m_creature->SetFactionTemporary(FACTION_ESCORT_N_FRIEND_PASSIVE, TEMPFACTION_RESTORE_RESPAWN);

        bool fight = false;
        for (auto itr = m_lCavaliersGUID.begin(); itr != m_lCavaliersGUID.end(); ++itr)
            if (*itr)
                if (Creature* cavalier = m_creature->GetMap()->GetCreature(*itr))
                    if (cavalier->isAlive())
                        if (auto pCavalierAI = dynamic_cast<npc_scarlet_cavalierAI*>(cavalier->AI()))
                        {
                            fight = true;
                            pCavalierAI->Event3AttackTaelan(m_creature);
                        }
        if (!fight)
        {
            // in case no cavaliers were alive somehow
            m_creature->ClearTemporaryFaction();
            m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
            m_uiEventCount = 0;
        }
    }
    else
        m_uiEventTimer -= uiDiff;        
}

void npc_taelanAI::Event4EscortStart(const uint32 uiDiff)
{
    switch (m_uiSubEventCount)
    {
        case 1:
            TimerSayAndGo(uiDiff, 3000, SAY_TAELAN_2);
            break;
        case 2:
            if (m_uiEventTimer < uiDiff)
            {
                m_uiEventCount = 0;
                m_uiSubEventCount = 1;
                SetEscortPaused(false);
            }
            else
                m_uiEventTimer -= uiDiff;
            break;
    }        
}

void npc_taelanAI::Event5MountAndGo(const uint32 uiDiff)
{
    switch (m_uiSubEventCount)
    {
        case 1:
            TimerSayAndGo(uiDiff, 3000, SAY_TAELAN_3);
            break;
        case 2:
            if (m_uiEventTimer < uiDiff)
            {
                DoScriptText(EMOTE_TAELAN_1, m_creature);
                m_creature->HandleEmote(EMOTE_ONESHOT_SHOUT);
                m_uiEventTimer = 3000;
                ++m_uiSubEventCount;
            }
            else
                m_uiEventTimer -= uiDiff;
            break;
        case 3:
            if (m_uiEventTimer < uiDiff)
            {
                m_mountPhase = true;
                m_creature->Mount(TAELAN_MOUNT);
                m_uiEventTimer = 5000;
                ++m_uiSubEventCount;
            }
            else
                m_uiEventTimer -= uiDiff;
            break;
        case 4:
            if (m_uiEventTimer < uiDiff)
            {
                m_uiEventCount = 0;
                m_uiSubEventCount = 1;
                SetEscortPaused(false);
            }
            else
                m_uiEventTimer -= uiDiff;
            break;
    }        
}

void npc_taelanAI::Event6FaceIsillien(const uint32 uiDiff)
{
    switch (m_uiSubEventCount)
    {
        case 1:
            if (m_uiEventTimer < uiDiff)
            {
                DoScriptText(SAY_TAELAN_4, m_creature);
                if (Creature * pIsillien = m_creature->SummonCreature(NPC_ISILLIEN, 
                    SpawnCoordsIsillien.x, 
                    SpawnCoordsIsillien.y,
                    SpawnCoordsIsillien.z,
                    SpawnCoordsIsillien.o, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 20*MINUTE*IN_MILLISECONDS, true))
                {
                    m_pInterface->AddGuid(pIsillien->GetObjectGuid(), INDEX_ISILLIEN);
                    if (auto pIsillienAI = dynamic_cast<npc_isillienAI*>(pIsillien->AI()))
                    {
                        pIsillienAI->m_pInterface = m_pInterface;
                        pIsillienAI->Event1SummonCrimson();                        
                    }
                }
                            
                m_uiEventTimer = 3000;
                ++m_uiSubEventCount;
            }
            else
                m_uiEventTimer -= uiDiff;
            break;
        case 2:
            if (m_uiEventTimer < uiDiff)
            {                       
                DoScriptText(SAY_TAELAN_5, m_creature);
                m_uiEventTimer = 2000;
                ++m_uiSubEventCount;
            }
            else
                m_uiEventTimer -= uiDiff;
            break;
        case 3:
            if (m_uiEventTimer < uiDiff)
            {
                DoScriptText(SAY_TAELAN_6, m_creature);
                m_creature->Unmount();

                if (auto pIsillien = m_pInterface->GetCreature(m_creature, INDEX_ISILLIEN))
                {
                    m_creature->SetFacingToObject(pIsillien);
                }

                m_mountPhase = false;
                m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PASSIVE);
                m_uiEventTimer = 10000;
                m_uiEventCount = 0;
                m_uiSubEventCount = 0;
            }
            else
                m_uiEventTimer -= uiDiff;
            break;
    }        
}

void npc_taelanAI::Event7CompleteQuest()
{
    if (Player* pPlayer = GetPlayerForEscort())
        pPlayer->GroupEventHappens(QUEST_IN_DREAMS, m_creature);          
    m_uiEventTimer = 90000;
    m_uiEventCount = 8;
}

void npc_taelanAI::Event8GraceShutdown(const uint32 uiDiff)
{
    if (m_uiEventTimer < uiDiff)
    {
        if (auto pTirion = m_pInterface->GetCreature(m_creature, INDEX_TIRION))
        {
            pTirion->DisappearAndDie();
        }

        if (auto pIsillien = m_pInterface->GetCreature(m_creature, INDEX_ISILLIEN))
        {
            pIsillien->DisappearAndDie();
        }

        m_creature->SetHomePosition(0, 0, 0, 0);
        m_creature->DisappearAndDie();
        m_uiEventCount = 0;
    }
    else
        m_uiEventTimer -= uiDiff;        
}

void npc_taelanAI::TimerSayAndGo(const uint32 uiDiff, uint32 uiUpd, int32 textId, bool incSub)
{
    if (m_uiEventTimer < uiDiff)
    {
        DoScriptText(textId, m_creature);
        m_uiEventTimer = uiUpd;
        if (incSub) ++m_uiSubEventCount;
    }
    else
        m_uiEventTimer -= uiDiff;        
}

void npc_taelanAI::DoAttack(const uint32 uiDiff)
{
    DoCastSpellIfCan(m_creature, SPELL_DEVOTION_AURA, CF_AURA_NOT_PRESENT);

    DoHeal(uiDiff);

    // Crusader Strike
    if (m_uiCrusaderStrikeTimer < uiDiff)
    {
        DoCastSpellIfCan(m_creature->getVictim(), SPELL_CRUSADER_STRIKE);
        m_uiCrusaderStrikeTimer = urand(7000, 9000);
    }
    else
        m_uiCrusaderStrikeTimer -= uiDiff;

    // Holy Cleave
    if (m_uiHolyCleaveTimer < uiDiff)
    {
        DoCastSpellIfCan(m_creature->getVictim(), SPELL_HOLY_CLEAVE);
        m_uiHolyCleaveTimer = urand(5000, 10000);
    }
    else
        m_uiHolyCleaveTimer -= uiDiff;

    DoMeleeAttackIfReady();        
}

void npc_taelanAI::DoHeal(const uint32 uiDiff)
{
    // heals himself or friendly creatures around
    if (auto pHealMe = m_creature->DoSelectLowestHpFriendly(40.0f, 40, true))
    {
        if (pHealMe->GetHealthPercent() < 20.0f)
        {
            if (m_uiLayOnHandsTimer < uiDiff)
            {
                if (DoCastSpellIfCan(pHealMe, SPELL_LAY_ON_HANDS) == CAST_OK)
                {
                    m_uiLayOnHandsTimer = HOUR * IN_MILLISECONDS;
                    return;
                }
            }
            else
                m_uiLayOnHandsTimer -= uiDiff;
        }

        if (m_uiHolyLightTimer < uiDiff)
        {
            if (DoCastSpellIfCan(pHealMe, SPELL_HOLY_LIGHT) == CAST_OK)
                m_uiHolyLightTimer = urand(5000, 10000);
        }
        else
            m_uiHolyLightTimer -= uiDiff;
    }
}

void npc_taelanAI::UpdateEscortAI(const uint32 uiDiff)
{
    switch (m_uiEventCount)
    {
        case 2:
            Event2FightCavaliers(uiDiff);
            break;
        case 4:
            Event4EscortStart(uiDiff);
            break;
        case 5:
            Event5MountAndGo(uiDiff);
            break;
        case 6:
            Event6FaceIsillien(uiDiff);
            break;
        case 8:
            Event8GraceShutdown(uiDiff);
            break;
    }

    if (m_isDead)
        return;

    if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
        return;

    if (m_creature->IsMounted())
        m_creature->Unmount();

    DoAttack(uiDiff);
}

/*
 * Crimson Elite
 */

npc_crimson_eliteAI::npc_crimson_eliteAI(Creature* pCreature) : ScriptedAI(pCreature)
{
    npc_crimson_eliteAI::Reset();
}

void npc_crimson_eliteAI::Reset()
{
    m_uiRetributionAuraCheckTimer = 0;
    m_uiHolyStrikeTimer = urand(3000, 6000);
    m_uiCrusaderStrikeTimer = urand(1000, 5000);
}

void npc_crimson_eliteAI::EnterEvadeMode()
{
    // should never enter evade mode in escort event, despawn only (handled in event code)
    if (auto pTaelan = m_creature->FindNearestCreature(NPC_TAELAN, 150.0f))
    {
        if (auto pTaelanAI = static_cast<npc_taelanAI*>(pTaelan->AI()))
        {
            if (!pTaelanAI->m_isDead)
                m_creature->AI()->AttackStart(pTaelan);
            else if (auto pPlayer = pTaelanAI->GetPlayer())
            {
                if (pPlayer->isAlive())
                    m_creature->AI()->AttackStart(pPlayer);
            }
        }
    }
}

void npc_crimson_eliteAI::DoAttack(const uint32 uiDiff)
{
    if (m_uiRetributionAuraCheckTimer < uiDiff)
    {
        DoCastSpellIfCan(m_creature, SPELL_RETRIBUTION_AURA, CF_TRIGGERED | CF_AURA_NOT_PRESENT);
        m_uiRetributionAuraCheckTimer = 5000;
    }
    else
        m_uiRetributionAuraCheckTimer -= uiDiff;    

    if (m_uiHolyStrikeTimer < uiDiff)
    {
        DoCastSpellIfCan(m_creature->getVictim(), SPELL_HOLY_STRIKE);
        m_uiHolyStrikeTimer = urand(6000, 8000);
    }
    else
        m_uiHolyStrikeTimer -= uiDiff;

    if (m_uiCrusaderStrikeTimer < uiDiff)
    {
        DoCastSpellIfCan(m_creature->getVictim(), SPELL_CRUSADER_STRIKE);
        m_uiCrusaderStrikeTimer = urand(7000, 9000);
    }
    else
        m_uiCrusaderStrikeTimer -= uiDiff;

    DoMeleeAttackIfReady();
}

void npc_crimson_eliteAI::UpdateAI(const uint32 uiDiff)
{
    if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
        return;

    DoAttack(uiDiff);
}

/*
 *
 */

bool QuestRewarded_npc_taelan(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_SCARLET_SUBTERFUGE)
    {
        if (auto pTaelanAI = dynamic_cast<npc_taelanAI*>(pCreature->AI()))
        {
            pTaelanAI->Event1ReceivedPresent();

            return true;            
        }
    }

    return false;
}

bool QuestAccept_npc_taelan(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_IN_DREAMS)
    {
        if (auto pTaelan = dynamic_cast<npc_taelanAI*>(pCreature->AI()))
        {
            if (pPlayer->GetTeam() == ALLIANCE)
                pCreature->setFaction(FACTION_ESCORT_A_PASSIVE);
            else if (pPlayer->GetTeam() == HORDE)
                pCreature->setFaction(FACTION_ESCORT_H_PASSIVE);

            pTaelan->Start(false, pPlayer->GetObjectGuid(), pQuest);

            return true;
        }
    }

    return false;
}

CreatureAI* GetAI_npc_isillien(Creature* pCreature)
{
    return new npc_isillienAI(pCreature);
}

CreatureAI* GetAI_npc_taelan(Creature* pCreature)
{
    return new npc_taelanAI(pCreature);
}

CreatureAI* GetAI_npc_tirion_fordring_in_dreams(Creature* pCreature)
{
    return new npc_tirion_fordring_in_dreamsAI(pCreature);
}

CreatureAI* GetAI_npc_scarlet_cavalier(Creature* pCreature)
{
    return new npc_scarlet_cavalierAI(pCreature);
}

CreatureAI* GetAI_npc_crimson_elite(Creature* pCreature)
{
    return new npc_crimson_eliteAI(pCreature);
}

void AddSC_quest_in_dreams()
{
    Script *pNewScript;

    pNewScript = new Script;
    pNewScript->Name = "npc_taelan";
    pNewScript->GetAI = &GetAI_npc_taelan;
    pNewScript->pQuestRewardedNPC = &QuestRewarded_npc_taelan;
    pNewScript->pQuestAcceptNPC = &QuestAccept_npc_taelan;
    pNewScript->RegisterSelf();
    
    pNewScript = new Script;
    pNewScript->Name = "npc_scarlet_cavalier";
    pNewScript->GetAI = &GetAI_npc_scarlet_cavalier;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "npc_isillien";
    pNewScript->GetAI = &GetAI_npc_isillien;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "npc_tirion_fordring_in_dreams";
    pNewScript->GetAI = &GetAI_npc_tirion_fordring_in_dreams;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "npc_crimson_elite";
    pNewScript->GetAI = &GetAI_npc_crimson_elite;
    pNewScript->RegisterSelf();
}