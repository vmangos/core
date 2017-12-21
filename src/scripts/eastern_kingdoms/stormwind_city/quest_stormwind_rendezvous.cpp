/*
 *
 */

#include "scriptPCH.h"
#include "quest_stormwind_rendezvous.h"

/*
 *
 */

npc_reginald_windsorAI::npc_reginald_windsorAI(Creature* pCreature) : ScriptedAI(pCreature)
{
    npc_reginald_windsorAI::Reset();
    npc_reginald_windsorAI::ResetCreature();
}

Player* npc_reginald_windsorAI::GetPlayer() const
{
    return me->GetMap()->GetPlayer(playerGUID);
}

Creature* npc_reginald_windsorAI::GetGuard(uint8 num) const
{
    return me->GetMap()->GetCreature(GardesGUIDs[num]);
}

void npc_reginald_windsorAI::ResetCreature()
{
    m_bRoweKnows = false;
    m_squireRoweGuid.Clear();

    m_uiDespawnTimer = 5 * MINUTE*IN_MILLISECONDS;
    Timer = 3000;
    Tick = 0;
    IDSpeech = 0;
    playerGUID = 0;
    GreetPlayer = false;
    QuestAccepted = false;
    BeginQuest = false;
    Begin = true;
    NeedCheck = false;
    PhaseFinale = false;
    TheEnd = false;
    CombatJustEnded = false;

    for (uint8 i = 0; i < 6; i++)
    {
        GardeTimer[i] = 0;
        GardeNeed[i] = false;
    }
    for (uint8 i = 0; i < 30; i++)
        GardesGUIDs[i] = 0;

    for (uint8 i = 0; i < 10; i++)
        DragsGUIDs[i] = 0;
}

void npc_reginald_windsorAI::JustDied(Unit* /*pKiller*/)
{
    PokeRowe();
    m_creature->DespawnOrUnsummon(1500);
}

void npc_reginald_windsorAI::PokeRowe()
{
    if (!m_bRoweKnows)
    {
        // let Squire Rowe know he can allow players to proceed with quest now
        if (auto pRowe = m_creature->GetMap()->GetCreature(m_squireRoweGuid))
        {
            if (auto pRoweAI = static_cast<npc_squire_roweAI*>(pRowe->AI()))
            {
                pRoweAI->ResetCreature();
                m_bRoweKnows = true;
            }
        }
    }
}

void npc_reginald_windsorAI::DoTalk(Unit* pWho, bool yell, Unit* pTarget)
{
    yell ? pWho->MonsterYell(WindsorTalk[IDSpeech], 0, pTarget) : pWho->MonsterSay(WindsorTalk[IDSpeech], 0, pTarget);
    IDSpeech++;
}

void npc_reginald_windsorAI::SituationFinale()
{
    Player* pPlayer = GetPlayer();
    std::list<Creature*> MobListe;

    GetCreatureListWithEntryInGrid(MobListe, m_creature, NPC_ONYXIA_ELITE_GUARD, 150.0f);
    for (auto itr = MobListe.begin(); itr != MobListe.end(); ++itr)
    {
        (*itr)->Respawn();
        (*itr)->UpdateEntry(NPC_STORMWIND_ROYAL_GUARD);
        (*itr)->AIM_Initialize();
    }

    if (Creature* Bolvar = m_creature->FindNearestCreature(NPC_BOLVAR_FORDRAGON, 150.0f))
    {
        Bolvar->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER | UNIT_NPC_FLAG_GOSSIP);
        Bolvar->GetMotionMaster()->MoveTargetedHome();
    }

    if (Creature* Anduin = m_creature->FindNearestCreature(NPC_ANDUIN_WRYNN, 150.0f))
    {
        float X = 0.0f;
        float Y = 0.0f;
        float Z = 0.0f;
        Anduin->GetRespawnCoord(X, Y, Z);
        Anduin->GetMotionMaster()->MovePoint(0, X, Y, Z);
        float x = Anduin->GetPositionX() - X;
        float y = Anduin->GetPositionY() - Y;
        FinalTimer = 1000 + sqrt((x * x) + (y * y)) / (Anduin->GetSpeed(MOVE_WALK) * 0.001f);
        PhaseFinale = true;
    }

    if (Creature* Onyxia = m_creature->FindNearestCreature(NPC_KATRANA_PRESTOR, 150.0f))
    {
        Onyxia->RemoveAurasDueToSpell(SPELL_GREATER_INVISIBILITY);
        Onyxia->CastSpell(Onyxia, SPELL_INVISIBILITY, true);
    }

    m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);

    if (pPlayer)
    {
        if (Group* jGroup = pPlayer->GetGroup())
        {
            for (GroupReference* pRef = jGroup->GetFirstMember(); pRef != nullptr; pRef = pRef->next())
            {
                if (pRef)
                    if (pRef->getSource()->GetQuestStatus(QUEST_THE_GREAT_MASQUERADE) == QUEST_STATUS_INCOMPLETE)
                        pRef->getSource()->CompleteQuest(QUEST_THE_GREAT_MASQUERADE);
            }
        }
        else
        {
            if (pPlayer->GetQuestStatus(QUEST_THE_GREAT_MASQUERADE) == QUEST_STATUS_INCOMPLETE)
                pPlayer->CompleteQuest(QUEST_THE_GREAT_MASQUERADE);
        }
    }
}

void npc_reginald_windsorAI::UpdateAI_corpse(const uint32 uiDiff)
{
    if (PhaseFinale == false)
        return;

    if (FinalTimer < uiDiff)
    {
        float X = 0.0f;
        float Y = 0.0f;
        float Z = 0.0f;
        float O = 0.0f;
        if (Creature* Bolvar = m_creature->FindNearestCreature(NPC_BOLVAR_FORDRAGON, 150.0f))
        {
            Bolvar->GetRespawnCoord(X, Y, Z, &O);
            Bolvar->SetFacingTo(O);
        }
        if (Creature* Anduin = m_creature->FindNearestCreature(NPC_ANDUIN_WRYNN, 150.0f))
        {
            Anduin->GetRespawnCoord(X, Y, Z, &O);
            Anduin->SetFacingTo(O);
        }
        if (Creature* Onyxia = m_creature->FindNearestCreature(NPC_KATRANA_PRESTOR, 150.0f))
        {
            Onyxia->GetRespawnCoord(X, Y, Z, &O);
            Onyxia->SetFacingTo(O);
            Onyxia->SetEntry(NPC_KATRANA_PRESTOR);
            Onyxia->UpdateEntry(NPC_KATRANA_PRESTOR);
        }
        TheEnd = true;
        FinalTimer = 5000;
    }
    else
        FinalTimer -= uiDiff;

    if (TheEnd == true)
    {
        if (FinalTimer < uiDiff)
        {
            PokeRowe();
            m_creature->DisappearAndDie();
            TheEnd = false;
        }
    }
}

uint32 GetRandomGuardText()
{
    switch (urand(0, 7))
    {
        case 0:
            return 8167; // Light be with you, sir.
        case 1:
            return 8170; // You are an inspiration to us all, sir.
        case 2:
            return 8172; // There walks a hero.
        case 3:
            return 8175; // Make way!
        case 4:
            return 8177; // We are but dirt beneath your feet, sir.
        case 5:
            return 8180; // A moment I shall remember for always.
        case 6:
            return 8183; // ...nerves of thorium.
    }
    return 8184; // A living legend... 
}

void npc_reginald_windsorAI::MoveInLineOfSight(Unit* Victim)
{
    if (Victim && Victim->isAlive())
    {
        if (Victim->GetEntry() == NPC_STORMWIND_CITY_GUARD ||
            Victim->GetEntry() == NPC_STORMWIND_ROYAL_GUARD ||
            Victim->GetEntry() == NPC_STORMWIND_CITY_PATROL)
        {
            if (Victim->GetDistance2d(m_creature) < 8.0f && NeedCheck == true)
            {
                bool Continuer = true;
                for (int i = 0; i < 30; i++)
                {
                    if (Victim->GetGUID() == GardesGUIDs[i] || m_creature->GetPositionY() < 360)
                        Continuer = false;
                }
                if (Continuer == true)
                {
                    Victim->SetFacingToObject(m_creature);
                    Victim->HandleEmote(EMOTE_ONESHOT_SALUTE);
                    Victim->MonsterSay(GetRandomGuardText());
                    int Var = 0;
                    while (GardesGUIDs[Var] && Var < 29)
                        Var++;

                    GardesGUIDs[Var] = Victim->GetGUID();
                }
            }
        }
    }
}

void npc_reginald_windsorAI::SpellHit(Unit* /*pCaster*/, const SpellEntry* pSpellEntry)
{
    if (pSpellEntry->Id == SPELL_WINDSOR_DEATH)
        m_creature->SetFeignDeath(true);
}

void npc_reginald_windsorAI::UpdateAI(const uint32 uiDiff)
{
    // in case of idle / afk players
    if (m_uiDespawnTimer < uiDiff)
    {
        PokeRowe();
        m_creature->DespawnOrUnsummon();
    }
    else
        m_uiDespawnTimer -= uiDiff;

    for (int i = 0; i < 6; i++)
    {
        if (GardeNeed[i] == true)
        {
            if (GardeTimer[i] < uiDiff)
            {
                if (Creature* pGarde = GetGuard(i))
                {
                    int Var = i + 7;
                    pGarde->SetFacingTo(WindsorEventMove[Var].o);
                    pGarde->SetStandState(UNIT_STAND_STATE_KNEEL);
                    GardeNeed[i] = false;
                }
            }
            else
                GardeTimer[i] -= uiDiff;
        }
    }
    if (Begin)
    {
        if (m_creature->GetDistance2d(WindsorDeplacement[0].x, WindsorDeplacement[0].y) < 2.0f)
        {
            Begin = false;
            m_creature->Unmount();
            m_creature->CastSpell(m_creature, SPELL_WINDSOR_DISMISS_HORSE, true);
            m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);

            if (Creature* pMercutio = m_creature->FindNearestCreature(NPC_MERCUTIO, 10.0f))
            {
                pMercutio->SetSpeedRate(MOVE_WALK, 2.5f, true);
                pMercutio->setFaction(m_creature->getFaction());
                pMercutio->GetMotionMaster()->MovePoint(0, -9148.395508f, 371.322174f, 90.543655f);
                pMercutio->ForcedDespawn(12000);
                m_creature->SetFacingToObject(pMercutio);
                m_creature->MonsterSay("Yawww!");
                m_creature->HandleEmote(EMOTE_ONESHOT_ATTACKUNARMED);
            }

            m_creature->SetWalk(true);
            m_creature->SetSpeedRate(MOVE_WALK, 1.0f, true);
            GreetPlayer = true;
        }
    }

    if (!BeginQuest)
    {
        if (GreetPlayer)
        {
            if (Timer <= uiDiff)
            {
                Player* pPlayer = GetPlayer();
                if (pPlayer)
                {
                    m_creature->SetFacingToObject(pPlayer);
                    char sMessage[200];
                    sprintf(sMessage, "I knew you would come, %s. It is good to see you again, friend.", pPlayer->GetName());
                    m_creature->MonsterSay(sMessage);
                    m_creature->HandleEmote(EMOTE_ONESHOT_TALK);
                }
                Timer = 5000;
                GreetPlayer = false;
            }
            else
                Timer -= uiDiff;
        }
        return;
    }

    if (Timer < uiDiff)
    {
        std::list<Creature*> DragListe;
        float X = 0.0f;
        float Y = 0.0f;
        uint32 eventGardId = 6;
        switch (Tick)
        {
        case 0:
            m_uiDespawnTimer = 20 * MINUTE*IN_MILLISECONDS;
            m_creature->SetFacingTo(0.659f);
            m_creature->MonsterYellToZone(8109);
            m_creature->HandleEmote(EMOTE_ONESHOT_SHOUT);
            Timer = 5000;
            break;
        case 1:
            for (int i = 0; i < 6; i++)
            {
                int Var = i + 1;
                Creature* pSummon = m_creature->SummonCreature(NPC_STORMWIND_CITY_GUARD,
                    WindsorEventMove[Var].x,
                    WindsorEventMove[Var].y,
                    WindsorEventMove[Var].z,
                    WindsorEventMove[Var].o, TEMPSUMMON_TIMED_DESPAWN, 240 * IN_MILLISECONDS);
                if (pSummon)
                {
                    GardesGUIDs[i] = pSummon->GetGUID();
                    pSummon->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
                }
            }
            if (Creature* Onyxia = m_creature->SummonCreature(NPC_KATRANA_PRESTOR, -9075.6f, 466.11f, 120.383f, 6.27f, TEMPSUMMON_TIMED_DESPAWN, 10 * IN_MILLISECONDS))
            {
                Onyxia->SetDisplayId(11686);
                Onyxia->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                Onyxia->MonsterYellToZone(WindsorTalk[IDSpeech]);
                IDSpeech++;
            }
            if (Creature* General = m_creature->FindNearestCreature(NPC_MARCUS_JONATHAN, 150.0f))
            {
                General->GetMotionMaster()->MovePoint(0, WindsorEventMove[0].x, WindsorEventMove[0].y, WindsorEventMove[0].z);
                General->Unmount();
            }
            m_creature->GetMotionMaster()->MovePoint(0, WindsorDeplacement[1].x, WindsorDeplacement[1].y, WindsorDeplacement[1].z);
            X = m_creature->GetPositionX() - WindsorDeplacement[1].x;
            Y = m_creature->GetPositionY() - WindsorDeplacement[1].y;
            Timer = 1000 + sqrt(X * X + Y * Y) / (m_creature->GetSpeed(MOVE_WALK) * 0.001f);
            break;
        case 2:
            if (Creature* General = m_creature->FindNearestCreature(NPC_MARCUS_JONATHAN, 150.0f))
            {
                DoTalk(General, false);
                General->HandleEmote(EMOTE_ONESHOT_TALK);
            }
            Timer = 10000;
            break;
        case 3:
            DoTalk(m_creature, false);
            m_creature->HandleEmote(EMOTE_ONESHOT_TALK);
            Timer = 10000;
            break;
        case 4:
            DoTalk(m_creature, false);
            m_creature->HandleEmote(EMOTE_ONESHOT_TALK);
            Timer = 10000;
            break;
        case 5:
            if (Creature* General = m_creature->FindNearestCreature(NPC_MARCUS_JONATHAN, 150.0f))
            {
                DoTalk(General, false);
                General->HandleEmote(EMOTE_ONESHOT_TALK);
                General->MonsterTextEmote("General Marcus Jonathan appears lost in contemplation.", nullptr);
            }
            Timer = 10000;
            break;
        case 6:
            if (Creature* General = m_creature->FindNearestCreature(NPC_MARCUS_JONATHAN, 150.0f))
            {
                DoTalk(General, false);
                General->HandleEmote(EMOTE_ONESHOT_TALK);
            }
            Timer = 10000;
            break;
        case 7:
            DoTalk(m_creature, false);
            m_creature->HandleEmote(EMOTE_ONESHOT_TALK);
            Timer = 10000;
            break;
        case 8:
            DoTalk(m_creature, false);
            m_creature->HandleEmote(EMOTE_ONESHOT_TALK);
            Timer = 10000;
            break;
        case 9:
            if (Creature* General = m_creature->FindNearestCreature(NPC_MARCUS_JONATHAN, 150.0f))
            {
                if (Creature* pGarde = GetGuard(0))
                    General->SetFacingToObject(pGarde);
                General->HandleEmote(EMOTE_ONESHOT_EXCLAMATION);
                DoTalk(General, false);
            }
            Timer = 4000;
            break;
        case 10:
            eventGardId = 0;
            break;
        case 11:
            eventGardId = 1;
            break;
        case 12:
            eventGardId = 2;
            break;
        case 13:
            if (Creature* General = m_creature->FindNearestCreature(NPC_MARCUS_JONATHAN, 150.0f))
            {
                if (Creature* pGarde = GetGuard(3))
                    General->SetFacingToObject(pGarde);
                General->HandleEmote(EMOTE_ONESHOT_EXCLAMATION);
                DoTalk(General, false);
            }
            Timer = 4000;
            break;
        case 14:
            eventGardId = 3;
            break;
        case 15:
            eventGardId = 4;
            break;
        case 16:
            eventGardId = 5;
            break;
        case 17:
            if (Creature* General = m_creature->FindNearestCreature(NPC_MARCUS_JONATHAN, 150.0f))
            {
                General->SetFacingToObject(m_creature);
                DoTalk(General, true);
                General->HandleEmote(EMOTE_ONESHOT_SHOUT);
            }
            Timer = 5000;
            break;
        case 18:
            if (Creature* General = m_creature->FindNearestCreature(NPC_MARCUS_JONATHAN, 150.0f))
                General->HandleEmote(EMOTE_ONESHOT_SALUTE);
            Timer = 5000;
            break;
        case 19:
            if (Creature* General = m_creature->FindNearestCreature(NPC_MARCUS_JONATHAN, 150.0f))
                DoTalk(General, false);
            Timer = 10000;
            break;
        case 20:
            if (Creature* General = m_creature->FindNearestCreature(NPC_MARCUS_JONATHAN, 150.0f))
            {
                General->GetMotionMaster()->MovePoint(0, WindsorEventMove[13].x, WindsorEventMove[13].y, WindsorEventMove[13].z);
                X = General->GetPositionX() - WindsorEventMove[13].x;
                Y = General->GetPositionY() - WindsorEventMove[13].y;
                Timer = 1000 + sqrt(X * X + Y * Y) / (m_creature->GetSpeed(MOVE_WALK) * 0.001f);
            }
            else Timer = 1000;
            break;
        case 21:
            if (Creature* General = m_creature->FindNearestCreature(NPC_MARCUS_JONATHAN, 150.0f))
            {
                General->HandleEmote(EMOTE_STATE_KNEEL);
                General->SetFacingTo(WindsorEventMove[13].o);
                m_creature->SetFacingToObject(General);
                DoTalk(m_creature, false);
            }
            Timer = 10000;
            break;
        case 22:
            if (Creature* pGarde = GetGuard(0))
                m_creature->SetFacingToObject(pGarde);
            DoTalk(m_creature, false);
            m_creature->HandleEmote(EMOTE_ONESHOT_POINT);
            Timer = 5000;
            break;
        case 25:
            NeedCheck = true;
            break;
        case 26:
            if (Creature* General = m_creature->FindNearestCreature(NPC_MARCUS_JONATHAN, 150.0f))
            {
                General->ForcedDespawn();
                General->Respawn();
            }
            break;
        case 40:
            m_uiDespawnTimer = 10 * MINUTE*IN_MILLISECONDS;
            BeginQuest = false;
            m_creature->SetUInt32Value(UNIT_NPC_FLAGS, 1);
            DoTalk(m_creature, false);
            break;
        case 47:
            DoTalk(m_creature, false);
            if (Creature* Bolvar = m_creature->FindNearestCreature(NPC_BOLVAR_FORDRAGON, 150.0f))
                Bolvar->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER | UNIT_NPC_FLAG_GOSSIP);
            if (Creature* Onyxia = m_creature->FindNearestCreature(NPC_KATRANA_PRESTOR, 150.0f))
                Onyxia->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER | UNIT_NPC_FLAG_GOSSIP);
            Timer = 10000;
            break;
        case 48:
            if (Creature* Bolvar = m_creature->FindNearestCreature(NPC_BOLVAR_FORDRAGON, 150.0f))
                DoTalk(Bolvar, false);
            Timer = 500;
            break;
        case 49:
            if (Creature* Anduin = m_creature->FindNearestCreature(NPC_ANDUIN_WRYNN, 150.0f))
                Anduin->GetMotionMaster()->MovePoint(0, WindsorEventMove[14].x, WindsorEventMove[14].y, WindsorEventMove[14].z);
            Timer = 5000;
            break;
        case 50:
            if (Creature* Onyxia = m_creature->FindNearestCreature(NPC_KATRANA_PRESTOR, 150.0f))
            {
                m_creature->SetFacingToObject(Onyxia);
                DoTalk(m_creature, false);
                m_creature->HandleEmote(EMOTE_ONESHOT_POINT);
            }
            Timer = 10000;
            break;
        case 51:
        case 52:
            if (Creature* Onyxia = m_creature->FindNearestCreature(NPC_KATRANA_PRESTOR, 150.0f))
            {
                DoTalk(Onyxia, false);
                Onyxia->HandleEmote(EMOTE_ONESHOT_TALK);
            }
            Timer = 10000;
            break;
        case 53:
            DoTalk(m_creature, false);
            m_creature->HandleEmote(EMOTE_ONESHOT_TALK);
            Timer = 7000;
            break;
        case 54:
            m_creature->MonsterTextEmote("Reginald Windsor reaches into his pack and pulls out the encoded tablets.");
            Timer = 4000;
            break;
        case 55:
            DoTalk(m_creature, false);
            m_creature->HandleEmote(EMOTE_ONESHOT_TALK);
            Timer = 6000;
            break;
        case 56:
            DoTalk(m_creature, false);
            m_creature->HandleEmote(EMOTE_ONESHOT_TALK);
            Timer = 4000;
            break;
        case 57:
            m_creature->MonsterTextEmote("Reginald Windsor reads from the tablets. Unknown, unheard sounds flow through your consciousness.");
            Timer = 2000;
            break;
        case 58:
            if (Creature* Onyxia = m_creature->FindNearestCreature(NPC_KATRANA_PRESTOR, 150.0f))
                m_creature->CastSpell(Onyxia, SPELL_WINSOR_READ_TABLETS, false);
            Timer = 10000;
            break;
        case 59:
            if (Creature* Onyxia = m_creature->FindNearestCreature(NPC_KATRANA_PRESTOR, 150.0f))
            {
                Onyxia->CastSpell(Onyxia, SPELL_ONYXIA_TRANS, true);
                Onyxia->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.5f);
            }
            if (Creature* Bolvar = m_creature->FindNearestCreature(NPC_BOLVAR_FORDRAGON, 150.0f))
                Bolvar->MonsterTextEmote("Highlord Bolvar Fordragon gasps.");
            Timer = 2000;
            break;
        case 60:
            if (Creature* Bolvar = m_creature->FindNearestCreature(NPC_BOLVAR_FORDRAGON, 150.0f))
            {
                Bolvar->GetMotionMaster()->MovePoint(0, WindsorEventMove[15].x, WindsorEventMove[15].y, WindsorEventMove[15].z);
                X = Bolvar->GetPositionX() - WindsorEventMove[15].x;
                Y = Bolvar->GetPositionY() - WindsorEventMove[15].y;
                Timer = 1000 + sqrt((X * X) + (Y * Y)) / (m_creature->GetSpeed(MOVE_WALK) * 0.001f);
            }
            if (Creature* Onyxia = m_creature->FindNearestCreature(NPC_KATRANA_PRESTOR, 150.0f))
            {
                DoTalk(Onyxia, false);
                Onyxia->HandleEmote(EMOTE_ONESHOT_TALK);
            }
            else Timer = 5000;
            break;
        case 61:
            if (Creature* Bolvar = m_creature->FindNearestCreature(NPC_BOLVAR_FORDRAGON, 150.0f))
            {
                if (Creature* Onyxia = m_creature->FindNearestCreature(NPC_KATRANA_PRESTOR, 150.0f))
                    Bolvar->SetFacingToObject(Onyxia);
                DoTalk(Bolvar, true);
            }
            Timer = 1000;
            break;
        case 62:
            if (Creature* Onyxia = m_creature->FindNearestCreature(NPC_KATRANA_PRESTOR, 150.0f))
                Onyxia->MonsterTextEmote("Lady Onyxia laughs.");
            Timer = 2000;
            break;
        case 63:
            if (Creature* Onyxia = m_creature->FindNearestCreature(NPC_KATRANA_PRESTOR, 150.0f))
            {
                Onyxia->MonsterSay("Yesss... Guards, come to your lord's aid!");
                int Var = 0;
                GetCreatureListWithEntryInGrid(DragListe, Onyxia, NPC_STORMWIND_ROYAL_GUARD, 25.0f);
                for (auto itr = DragListe.begin(); itr != DragListe.end(); ++itr)
                {
                    DragsGUIDs[Var] = (*itr)->GetGUID();
                    (*itr)->UpdateEntry(NPC_ONYXIA_ELITE_GUARD);
                    (*itr)->AIM_Initialize();
                    (*itr)->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                    if (!urand(0, 2))
                        (*itr)->MonsterTextEmote("Onyxia's Elite Guard hisses.");
                    Var++;
                }
            }
            Timer = 4000;
            break;
        case 64:
            if (Creature* Onyxia = m_creature->FindNearestCreature(NPC_KATRANA_PRESTOR, 150.0f))
                Onyxia->CastSpell(m_creature, SPELL_WINDSOR_DEATH, false);
            Timer = 1500;
            break;
        case 65:
            DoTalk(m_creature, false);
            if (Creature* Onyxia = m_creature->FindNearestCreature(NPC_KATRANA_PRESTOR, 150.0f))
            {
                Onyxia->MonsterSay("Was this fated, Windsor? If it was death that you came for then the prophecy has been fulfilled. May your consciousness rot in the Twisting Nether. Finish the rest of these meddlesome insects, children. Bolvar, you have been a pleasurable puppet.");
                Onyxia->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_PASSIVE);
                if (Creature* Bolvar = m_creature->FindNearestCreature(NPC_BOLVAR_FORDRAGON, 150.0f))
                {
                    int Var = 0;
                    while (DragsGUIDs[Var] && Var < 9)
                    {
                        Creature* crea = me->GetMap()->GetCreature(DragsGUIDs[Var]);
                        crea->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                        crea->getThreatManager().addThreatDirectly(Bolvar, 5000.0f);
                        crea->SetTargetGuid(Bolvar->GetGUID());
                        Bolvar->AddThreat(crea);
                        Bolvar->SetInCombatWith(crea);
                        crea->SetInCombatWith(Bolvar);
                        Var++;
                    }
                }
            }
            Timer = 5000;
            break;
        case 66:
            if (Creature* Onyxia = m_creature->FindNearestCreature(NPC_KATRANA_PRESTOR, 150.0f))
            {
                Onyxia->MonsterYell("You have failed him, mortalsss... Farewell!");
                Onyxia->CastSpell(Onyxia, SPELL_PRESTOR_DESPAWNS, true);
            }
            if (Creature* Bolvar = m_creature->FindNearestCreature(NPC_BOLVAR_FORDRAGON, 150.0f))
                Bolvar->MonsterTextEmote("Highlord Bolvar Fordragon's medallion shatters.");
            Timer = 1000;
            PhaseFinale = true;
            break;
        case 67:
            if (Creature* Onyxia = m_creature->FindNearestCreature(NPC_KATRANA_PRESTOR, 150.0f))
            {
                Onyxia->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER | UNIT_NPC_FLAG_GOSSIP);
                Onyxia->SetFloatValue(OBJECT_FIELD_SCALE_X, 1.0f);
                Onyxia->ForcedDespawn();
                Onyxia->SetRespawnDelay(7 * MINUTE);
                Onyxia->SetRespawnTime(7 * MINUTE);
            }
            Tick = 100; // come back when combat is done
            break;
        case 68:
            if (Creature* Bolvar = m_creature->FindNearestCreature(NPC_BOLVAR_FORDRAGON, 150.0f))
            {
                DoTalk(Bolvar, false);
                DoTalk(m_creature, false);
                Bolvar->HandleEmote(EMOTE_ONESHOT_KNEEL);
            }
            Timer = 4500;
            break;
        case 69:
            SituationFinale();
            BeginQuest = false;
            m_creature->MonsterTextEmote("Reginald Windsor dies.");
            m_creature->CastSpell(m_creature, 5, true);
            break;
        }
        if (eventGardId < 6)
        {
            if (Creature* pGarde = GetGuard(eventGardId))
            {
                int Var = eventGardId + 7;
                pGarde->GetMotionMaster()->MovePoint(0, WindsorEventMove[Var].x, WindsorEventMove[Var].y, WindsorEventMove[Var].z);
                X = pGarde->GetPositionX() - WindsorEventMove[Var].x;
                Y = pGarde->GetPositionY() - WindsorEventMove[Var].y;
            }
            GardeTimer[eventGardId] = 1000 + sqrt(X * X + Y * Y) / (m_creature->GetSpeed(MOVE_WALK) * 0.001f);
            GardeNeed[eventGardId] = true;
            Timer = 1000;
        }
        if (Tick > 23 && Tick < 40)
        {
            int Var = Tick - 21;
            m_creature->GetMotionMaster()->MovePoint(0, WindsorDeplacement[Var].x, WindsorDeplacement[Var].y, WindsorDeplacement[Var].z);
            X = m_creature->GetPositionX() - WindsorDeplacement[Var].x;
            Y = m_creature->GetPositionY() - WindsorDeplacement[Var].y;
            Timer = 1000 + sqrt(X * X + Y * Y) / (m_creature->GetSpeed(MOVE_WALK) * 0.001f);
        }
        else if (Tick > 41 && Tick < 46)
        {
            int Var = Tick - 22;
            m_creature->GetMotionMaster()->MovePoint(0, WindsorDeplacement[Var].x, WindsorDeplacement[Var].y, WindsorDeplacement[Var].z);
            X = m_creature->GetPositionX() - WindsorDeplacement[Var].x;
            Y = m_creature->GetPositionY() - WindsorDeplacement[Var].y;
            Timer = 1000 + sqrt(X * X + Y * Y) / (m_creature->GetSpeed(MOVE_WALK) * 0.001f);
        }
        else if (PhaseFinale == true)
        {
            if (Creature* Bolvar = m_creature->FindNearestCreature(NPC_BOLVAR_FORDRAGON, 150.0f))
            {
                if (!Bolvar->isInCombat())
                {
                    if (!CombatJustEnded)
                    {
                        Bolvar->SetWalk(true);
                        Bolvar->GetMotionMaster()->MovePoint(0, -8447.39f, 335.35f, 121.747f, 1.29f);
                        CombatJustEnded = true;
                        Timer = 5000;
                        Tick = 68;
                        return;
                    }
                }
            }
        }
        Tick++;
    }
    else
        Timer -= uiDiff;
}

bool QuestAccept_npc_reginald_windsor(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_THE_GREAT_MASQUERADE)
    {
        if (auto pWindsorEventAI = dynamic_cast<npc_reginald_windsorAI*>(pCreature->AI()))
        {
            pCreature->MonsterSay("On guard, friend. The lady dragon will not give in without a fight.");
            pCreature->HandleEmote(EMOTE_ONESHOT_TALK);
            pWindsorEventAI->BeginQuest = true;
            pWindsorEventAI->QuestAccepted = true;
            pWindsorEventAI->GreetPlayer = false;
            pWindsorEventAI->playerGUID = pPlayer->GetGUID();
            pWindsorEventAI->m_uiDespawnTimer = 30 * MINUTE*IN_MILLISECONDS;
            pCreature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
        }
    }
    return true;
}

bool GossipHello_npc_reginald_windsor(Player* pPlayer, Creature* pCreature)
{
    if (auto pWindsorEventAI = static_cast<npc_reginald_windsorAI*>(pCreature->AI()))
    {
        if (pPlayer == pWindsorEventAI->GetPlayer() && pWindsorEventAI->QuestAccepted)
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, 8256, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
        else if (pCreature->isQuestGiver())
            pPlayer->PrepareQuestMenu(pCreature->GetGUID());

        pPlayer->SEND_GOSSIP_MENU(5633, pCreature->GetGUID());
    }
    return true;
}

bool GossipSelect_npc_reginald_windsor(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    switch (uiAction)
    {
    case GOSSIP_ACTION_INFO_DEF:
        if (auto pWindsorEventAI = static_cast<npc_reginald_windsorAI*>(pCreature->AI()))
        {
            pWindsorEventAI->BeginQuest = true;
            pWindsorEventAI->DoTalk(pCreature, false);
            pCreature->SetUInt32Value(UNIT_NPC_FLAGS, 0);
        }
        pPlayer->CLOSE_GOSSIP_MENU();
        break;
    }
    return true;
}

CreatureAI* GetAI_npc_reginald_windsor(Creature* pCreature)
{
    return new npc_reginald_windsorAI(pCreature);
}

/*
* Squire Rowe
*/

npc_squire_roweAI::npc_squire_roweAI(Creature* pCreature) : ScriptedAI(pCreature)
{
    npc_squire_roweAI::Reset();
    npc_squire_roweAI::ResetCreature();
}

void npc_squire_roweAI::ResetCreature()
{
    m_playerGuid.Clear();
    m_uiTimer = 2000;
    m_uiStep = 0;
    m_bEventProcessed = false;
    m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
    m_bWindsorUp = false;
}

void npc_squire_roweAI::MovementInform(uint32 uiType, uint32 uiPointId)
{
    if (!m_bEventProcessed || uiType != POINT_MOTION_TYPE)
        return;

    switch (uiPointId)
    {
    case 1:
        m_creature->GetMotionMaster()->MovePoint(2, RoweDeplacement[1].x, RoweDeplacement[1].y, RoweDeplacement[1].z);
        break;
    case 2:
        m_creature->HandleEmote(EMOTE_ONESHOT_KNEEL);
        m_uiTimer = 5000;
        ++m_uiStep;
        break;
    case 4:
        m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
        m_bEventProcessed = false;
        break;
    }
}

void npc_squire_roweAI::UpdateAI(const uint32 uiDiff)
{
    if (m_bEventProcessed)
    {
        if (m_uiTimer < uiDiff)
        {
            switch (m_uiStep)
            {
            case 0:
                m_creature->SetSpeedRate(MOVE_RUN, 1.1f, true);
                m_creature->GetMotionMaster()->MovePoint(1, RoweDeplacement[0].x, RoweDeplacement[0].y, RoweDeplacement[0].z);
                m_uiTimer = 1000;
                ++m_uiStep;
                break;
            case 2:
                m_creature->GetMotionMaster()->MovePoint(3, RoweDeplacement[0].x, RoweDeplacement[0].y, RoweDeplacement[0].z);
                m_uiTimer = 1500;
                ++m_uiStep;
                break;
            case 3:
                if (Creature* pWindsor = m_creature->SummonCreature(NPC_REGINALD_WINDSOR,
                    WindsorSummon.x,
                    WindsorSummon.y,
                    WindsorSummon.z,
                    WindsorSummon.o, TEMPSUMMON_MANUAL_DESPAWN, 1.5 * HOUR * IN_MILLISECONDS, true))
                {
                    auto pWindsorAI = static_cast<npc_reginald_windsorAI*>(pWindsor->AI());

                    if (pWindsorAI)
                    {
                        if (m_playerGuid)
                            pWindsorAI->playerGUID = m_playerGuid;

                        pWindsorAI->m_squireRoweGuid = m_creature->GetObjectGuid();
                    }

                    m_bWindsorUp = true;
                    pWindsor->Mount(MOUNT_WINDSOR);
                    pWindsor->SetWalk(false);
                    pWindsor->SetSpeedRate(MOVE_RUN, 1.0f, true);
                    pWindsor->GetMotionMaster()->MovePoint(0, WindsorDeplacement[0].x, WindsorDeplacement[0].y, WindsorDeplacement[0].z, MOVE_PATHFINDING);
                    pWindsor->SetRespawnDelay(100000000);
                    pWindsor->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                }
                ++m_uiStep;
                break;
            case 4:
                float x, y, z, o;
                m_creature->GetRespawnCoord(x, y, z, &o);
                m_creature->GetMotionMaster()->MovePoint(4, x, y, z, MOVE_NONE, 0, o);
                ++m_uiStep;
                break;
            }
        }
        else
            m_uiTimer -= uiDiff;
    }
    else
        ScriptedAI::UpdateAI(uiDiff);
}

bool GossipHello_npc_squire_rowe(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(QUEST_STORMWIND_RENDEZVOUS) == QUEST_STATUS_COMPLETE &&
        pPlayer->GetQuestStatus(QUEST_THE_GREAT_MASQUERADE) != QUEST_STATUS_COMPLETE)
    {
        auto pSquireRoweAI = static_cast<npc_squire_roweAI*>(pCreature->AI());

        if (!pSquireRoweAI)
            return true;

        if (!pSquireRoweAI->m_bWindsorUp)
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Let Marshal Windsor know that I am ready.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
            pPlayer->SEND_GOSSIP_MENU(GOSSIP_ROWE_READY, pCreature->GetGUID());
        }
        else
            pPlayer->SEND_GOSSIP_MENU(GOSSIP_ROWE_BUSY, pCreature->GetGUID());
    }
    else
        pPlayer->SEND_GOSSIP_MENU(GOSSIP_ROWE_NOTHING, pCreature->GetGUID());

    return true;
}

bool GossipSelect_npc_squire_rowe(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    switch (uiAction)
    {
    case GOSSIP_ACTION_INFO_DEF:
        if (pPlayer->GetQuestStatus(QUEST_STORMWIND_RENDEZVOUS) == QUEST_STATUS_COMPLETE)
        {
            if (auto pSquireRoweAI = static_cast<npc_squire_roweAI*>(pCreature->AI()))
            {
                pSquireRoweAI->m_bEventProcessed = true;
                pSquireRoweAI->m_playerGuid = pPlayer->GetObjectGuid();
                pCreature->SetWalk(false);
                pCreature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
            }
        }

        pPlayer->CLOSE_GOSSIP_MENU();
        break;
    }

    return true;
}

CreatureAI* GetAI_npc_squire_rowe(Creature* pCreature)
{
    return new npc_squire_roweAI(pCreature);
}

void AddSC_quest_stormwind_rendezvous()
{
    Script *pNewScript;

    pNewScript = new Script;
    pNewScript->Name = "npc_squire_rowe";
    pNewScript->GetAI = &GetAI_npc_squire_rowe;
    pNewScript->pGossipHello = &GossipHello_npc_squire_rowe;
    pNewScript->pGossipSelect = &GossipSelect_npc_squire_rowe;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "npc_reginald_windsor";
    pNewScript->GetAI = &GetAI_npc_reginald_windsor;
    pNewScript->pQuestAcceptNPC = &QuestAccept_npc_reginald_windsor;
    pNewScript->pGossipHello = &GossipHello_npc_reginald_windsor;
    pNewScript->pGossipSelect = &GossipSelect_npc_reginald_windsor;
    pNewScript->RegisterSelf();
}
