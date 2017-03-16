#include "scriptPCH.h"
#include "molten_core.h"

enum
{
    SAY_AGGRO                   = -1409003,
    SAY_SPAWN                   = -1409004,
    SAY_SLAY                    = -1409005,
    SAY_SPECIAL                 = -1409006,
    SAY_DEFEAT                  = -1409007,

    SAY_LAST_ADD                = -1409020,                     // When only one add remaining - From SD2
    SAY_MAJ                     = -1409019,
    SAY_SUMMON_MAJ              = -1409008,
    SAY_ARRIVAL1_RAG            = -1409009,
    SAY_ARRIVAL2_MAJ            = -1409010,
    SAY_ARRIVAL3_RAG            = -1409011,

    SPELL_MAGIC_REFLECTION      = 20619,
    SPELL_DAMAGE_REFLECTION     = 21075,
    SPELL_BLASTWAVE             = 20229,
    SPELL_AEGIS                 = 20620,                   //This is self casted whenever we are below 50%
    SPELL_TELEPORT              = 20618,
    SPELL_SUMMON_RAGNAROS       = 19774,
    SPELL_RAGNAROS_EMERGE       = 20568,
    SPELL_ELEMENTAL_FIRE        = 19773,

    SPELL_VISUAL_TELEPORT       = 19484, 

    NPC_FLAMEWAKER_HEALER       = 11663,
    NPC_FLAMEWAKER_ELITE        = 11664,
    // NPC_RAGNAROS                = 11502, // Already defined in instance script

    GOSSIP_TEXTID_DOMO_1        = 4995,
    GOSSIP_TEXTID_DOMO_2        = 5011,
    GOSSIP_TEXTID_DOMO_3        = 5012,
};

#define GOSSIP_ITEM_1                "Tell me more."
#define GOSSIP_ITEM_2                "What else do you have to say?"
#define GOSSIP_ITEM_3                "You challenged us and and we have come. Where is this master that you speak of?"

#define POINT_RESPAWN               1
#define POINT_SUMMON1               2
#define POINT_SUMMON2               3
#define POINT_SUMMON3               4

#define POINT_RESPAWN_X             748.208f
#define POINT_RESPAWN_Y             -1179.98f
#define POINT_RESPAWN_Z             -119.861f
#define POINT_RESPAWN_O             2.91086f

#define POINT_SUMMON1_X             839.1729f
#define POINT_SUMMON1_Y             -811.2748f
#define POINT_SUMMON1_Z             -229.5895f

#define POINT_SUMMON2_X             830.4840f
#define POINT_SUMMON2_Y             -814.4016f
#define POINT_SUMMON2_Z             -228.9452f
#define POINT_SUMMON2_O             5.1210f

struct sSpawnLocation
{
    uint32 m_uiEntry;
    float m_fX, m_fY, m_fZ, m_fO;
};

static sSpawnLocation m_aBosspawnLocs[8] =
{
    {NPC_FLAMEWAKER_ELITE,  737.945f, -1156.48f, -118.945f, 4.46804f},
    {NPC_FLAMEWAKER_ELITE,  752.520f, -1191.02f, -118.218f, 2.49582f},
    {NPC_FLAMEWAKER_ELITE,  752.953f, -1163.94f, -118.869f, 3.70010f},
    {NPC_FLAMEWAKER_ELITE,  738.814f, -1197.40f, -118.018f, 1.83260f},
    {NPC_FLAMEWAKER_HEALER, 746.939f, -1194.87f, -118.016f, 2.21657f},
    {NPC_FLAMEWAKER_HEALER, 747.132f, -1158.87f, -118.897f, 4.03171f},
    {NPC_FLAMEWAKER_HEALER, 757.116f, -1170.12f, -118.793f, 3.40339f},
    {NPC_FLAMEWAKER_HEALER, 755.910f, -1184.46f, -118.449f, 2.80998f}
};

struct boss_majordomoAI : public ScriptedAI
{
    boss_majordomoAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    uint32 Reflection_Timer;
    uint32 Blastwave_Timer;
    uint32 TPDomo_Timer[2];
    uint32 Immune;
    uint32 AddVivant;
    bool AddSpawn;

    ScriptedInstance* m_pInstance;

    // Event de Ragna

    uint32 DialogRagnaros_M;
    uint32 DialogRagnarosTimer;
    bool RagnarosEventStart;

    void Reset()
    {
        m_creature->SetDefaultMovementType(IDLE_MOTION_TYPE);
        Reflection_Timer =  30000;
        Blastwave_Timer = 10000;
        for (int i = 0; i < 2; i++)
            TPDomo_Timer[i] = 10000 + rand() % 20000;
        AddSpawn = false;
        AddVivant = 8;
        Immune = 0;

        while (Creature* Add = m_creature->FindNearestCreature(11663, 100.0f, true))
            Add->ForcedDespawn();

        while (Creature* Add = m_creature->FindNearestCreature(11664, 100.0f, true))
            Add->ForcedDespawn();

        if (m_pInstance && m_creature->getFaction() != 35)
        {
            if (m_pInstance->GetData(TYPE_MAJORDOMO) != DONE)
                m_pInstance->SetData(TYPE_MAJORDOMO, NOT_STARTED);
        }

        // Event de Ragna

        DialogRagnaros_M = 0;
        DialogRagnarosTimer = 0;
        RagnarosEventStart = false;
    }

    void SummonedCreatureJustDied(Creature* pSummoned)
    {
        if (AddVivant > 0)
            AddVivant--;

        std::list<Creature*> AddListe;
        GetCreatureListWithEntryInGrid(AddListe, m_creature, 11663, 150.0f);
        GetCreatureListWithEntryInGrid(AddListe, m_creature, 11664, 150.0f);
        if (!AddListe.empty())
        {
            for (std::list<Creature*>::iterator itr = AddListe.begin(); itr != AddListe.end(); ++itr)
            {
                if ((*itr)->isAlive() && AddVivant > 0)
                {
                    const CreatureInfo *cinfo = (*itr)->GetCreatureInfo();
                    (*itr)->SetBaseWeaponDamage(BASE_ATTACK, MINDAMAGE, cinfo->mindmg + cinfo->mindmg / AddVivant);
                    (*itr)->SetBaseWeaponDamage(BASE_ATTACK, MAXDAMAGE, cinfo->maxdmg + cinfo->maxdmg / AddVivant);
                }
            }
        }

        if (AddVivant == 4 && Immune == 0)
        {
            if (!AddListe.empty())
            {
                for (std::list<Creature*>::iterator itr = AddListe.begin(); itr != AddListe.end(); ++itr)
                {
                    if ((*itr)->isAlive())
                    {
                        (*itr)->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_POLYMORPH, true);
                        (*itr)->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_STUN, true);
                        (*itr)->RemoveSpellsCausingAura(SPELL_AURA_MOD_CONFUSE);
                    }
                }
            }
            Immune++;
        }
        else if (AddVivant == 1 && Immune == 1)
        {
            if (!AddListe.empty())
            {
                for (std::list<Creature*>::iterator itr = AddListe.begin(); itr != AddListe.end(); ++itr)
                {
                    if ((*itr)->isAlive())
                    {
                        m_creature->MonsterYell(SAY_LAST_ADD);
                        (*itr)->SetPower(POWER_MANA, (*itr)->GetMaxPower(POWER_MANA));
                        (*itr)->SetHealthPercent(100.0f);
                    }
                }
            }
            Immune++;
        }
        else if (AddVivant == 0)
        {
            DialogRagnarosTimer = 0;
            m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            m_creature->setFaction(35);
            EnterEvadeMode();
            DoScriptText(SAY_DEFEAT, m_creature);
            if (m_pInstance)
            {
                if (m_pInstance->GetData(TYPE_MAJORDOMO) != DONE)
                    m_pInstance->SetData(TYPE_MAJORDOMO, DONE);
            }
        }
    }

    void KilledUnit(Unit* victim)
    {
        if (m_creature->getFaction() != 35)
            DoScriptText(SAY_SLAY, m_creature);
    }

    void Aggro(Unit *who)
    {
        if (m_creature->getFaction() != 35)
            DoScriptText(SAY_AGGRO, m_creature);

        if (m_pInstance)
        {
            if (m_pInstance->GetData(TYPE_MAJORDOMO) != DONE)
                m_pInstance->SetData(TYPE_MAJORDOMO, IN_PROGRESS);
        }
    }

    void MovementInform(uint32 uiType, uint32 uiPointId)
    {
        if (uiType != POINT_MOTION_TYPE)
            return;

        if (uiPointId == POINT_RESPAWN)
        {
            m_creature->SetOrientation((float)POINT_RESPAWN_O);
            return;
        }

        else if (uiPointId == POINT_SUMMON1)
        {
            m_creature->GetMotionMaster()->Clear();
            m_creature->GetMotionMaster()->MovePoint(POINT_SUMMON2, (float)POINT_SUMMON2_X, (float)POINT_SUMMON2_Y, (float)POINT_SUMMON2_Z);
            return;
        }

        // SetOrientation etc. move m_creature back to the previous point, so we're turning him this way:
        else if (uiPointId == POINT_SUMMON2)
        {
            m_creature->GetMotionMaster()->Clear();
            m_creature->GetMotionMaster()->MovePoint(POINT_SUMMON3, (float)POINT_SUMMON2_X + 1, (float)POINT_SUMMON2_Y - 1, (float)POINT_SUMMON2_Z);
            return;
        }

        else if (uiPointId == POINT_SUMMON3)
        {
            m_creature->GetMotionMaster()->Clear();
            m_creature->GetMotionMaster()->MoveIdle();
            return;
        }
    }

    void DomoTP()
    {
        if (Creature* Domo = m_creature->SummonCreature(m_creature->GetEntry(), 847.103f, -816.153f, -229.775f, 4.344f, TEMPSUMMON_TIMED_DESPAWN, (2 * 60 * 60 * 1000)))
        {
            Domo->SetUInt32Value(UNIT_NPC_FLAGS, 1);
            Domo->setFaction(35);
            Domo->SetHealth(35);
            Domo->SetMaxHealth(35);
        }
        DialogRagnarosTimer = 0;
        m_creature->CastSpell(m_creature, SPELL_VISUAL_TELEPORT, false);
        m_creature->ForcedDespawn(1000);
    }

    void DomoEvent()
    {
        switch (DialogRagnaros_M)
        {
            case 6:
                m_creature->GetMotionMaster()->MovePoint(POINT_SUMMON1, (float)POINT_SUMMON1_X, (float)POINT_SUMMON1_Y, (float)POINT_SUMMON1_Z);
                m_creature->SummonGameObject(178108, 842.237488f, -833.683105f, -231.916498f, 3.000000f, 0, 0, 0, 0, 0);
                m_creature->CastSpell(m_creature, 19774, false);
                DoScriptText(SAY_MAJ, m_creature);
                break;
            case 15:
                m_creature->SetOrientation(5.231960f);
                break;
            case 21:
                DoScriptText(SAY_SUMMON_MAJ, m_creature);
                break;
            case 28:
                if (Creature* Ragnaros = m_creature->SummonCreature(NPC_RAGNAROS, 842.237488f, -833.683105f, -231.916498f, M_PI + m_creature->GetAngle(842.237488f, -833.683105f), TEMPSUMMON_MANUAL_DESPAWN, 2 * HOUR * IN_MILLISECONDS))   // Ragnaros reste spawn 2heures
                {
                    Ragnaros->SetUInt64Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                    m_creature->SetFacingToObject(Ragnaros);
                    Ragnaros->CastSpell(Ragnaros, SPELL_RAGNAROS_EMERGE, false);
                }
                break;
            case 34:
                if (Creature* Ragnaros = m_creature->FindNearestCreature(NPC_RAGNAROS, 100.0f, true))
                {
                    DoScriptText(SAY_ARRIVAL1_RAG, Ragnaros);
                    Ragnaros->HandleEmote(EMOTE_ONESHOT_ROAR);
                }
                break;
            case 47:
                DoScriptText(SAY_ARRIVAL2_MAJ, m_creature);
                break;
            case 55:
                if (Creature* Ragnaros = m_creature->FindNearestCreature(NPC_RAGNAROS, 100.0f, true))
                {
                    Ragnaros->SetTargetGuid(m_creature->GetGUID());
                    DoScriptText(SAY_ARRIVAL3_RAG, Ragnaros);
                    Ragnaros->HandleEmote(EMOTE_ONESHOT_ROAR);
                }
                break;
            case 70:
                if (Creature* Ragnaros = m_creature->FindNearestCreature(NPC_RAGNAROS, 100.0f, true))
                    Ragnaros->CastSpell(m_creature, SPELL_ELEMENTAL_FIRE, false);  // 20565
                // Handle rest in Ragnaros script
                break;
            }
    }

    void UpdateAI(const uint32 diff)
    {
        if (m_creature->getFaction() != 35 && AddSpawn == false)
        {
            Creature* DomoAdd[8];
            for (int i = 0; i < 8; i++)
                DomoAdd[i] = NULL;

            for (int i = 0; i < 8; i++)
                DomoAdd[i] = m_creature->SummonCreature(m_aBosspawnLocs[i].m_uiEntry, m_aBosspawnLocs[i].m_fX, m_aBosspawnLocs[i].m_fY, m_aBosspawnLocs[i].m_fZ, m_aBosspawnLocs[i].m_fO, TEMPSUMMON_DEAD_DESPAWN, 0);

            for (int i = 0; i < 4; i++)
            {
                if (DomoAdd[i])
                    DomoAdd[i]->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_POLYMORPH, true);
            }
            for (int i = 4; i < 8; i++)
            {
                if (DomoAdd[i])
                    DomoAdd[i]->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_STUN, true);
            }

            AddSpawn = true;
        }

        if (RagnarosEventStart == true && m_creature->getFaction() == 35)
        {
            bool Up = false;
            DialogRagnarosTimer += diff;
            if (DialogRagnarosTimer > 1000)
            {
                DialogRagnaros_M++;
                DialogRagnarosTimer = 0;
                Up = true;
            }
            if (Up)
                DomoEvent();
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim() || m_creature->getFaction() == 35)
        {
            if (m_creature->GetDistance2d(758.089f, -1176.71f) < 2.0f && m_creature->getFaction() == 35)
            {
                DialogRagnarosTimer += diff;
                if (DialogRagnarosTimer > 28000)
                    DomoTP();
            }
            return;
        }

        //Cast Ageis if less than 50% hp
        if (m_creature->GetHealthPercent() < 50.0f)
            DoCastSpellIfCan(m_creature, SPELL_AEGIS);

        //MagicReflection_Timer
        if (Reflection_Timer < diff)
        {
            uint32 Reflect = rand() % 2 ? SPELL_MAGIC_REFLECTION : SPELL_DAMAGE_REFLECTION;

            if (m_creature->getVictim())
                m_creature->CastSpell(m_creature, Reflect, true);
            Reflection_Timer = 30000;
        }
        else Reflection_Timer -= diff;

        //Blastwave_Timer
        if (Blastwave_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_BLASTWAVE) == CAST_OK)
                Blastwave_Timer = 10000;
        }
        else
            Blastwave_Timer -= diff;

        for (int i = 0; i < 2; i++)
        {
            if (TPDomo_Timer[i] < diff)
            {
                Unit* uTarget = m_creature->getVictim();
                if (i == 1)
                    uTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 1);
                if (uTarget && uTarget->IsPlayer() && DoCastSpellIfCan(uTarget, SPELL_TELEPORT) == CAST_OK)
                {
                    DoResetThreat();
                    TPDomo_Timer[i] = 20000 + rand() % 10000;
                }
            }
            else
                TPDomo_Timer[i] -= diff;
        }

        DoMeleeAttackIfReady();
    }
};

bool GossipSelect_event_domo(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
        pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_DOMO_2, pCreature->GetGUID());
    }
    else if (uiAction == GOSSIP_ACTION_INFO_DEF + 2)
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
        pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_DOMO_3, pCreature->GetGUID());
    }
    else if (uiAction == GOSSIP_ACTION_INFO_DEF + 3)
    {
        pPlayer->CLOSE_GOSSIP_MENU();

        if (boss_majordomoAI* pDomoEventAI = dynamic_cast<boss_majordomoAI*>(pCreature->AI()))
        {
            pDomoEventAI->RagnarosEventStart = true;
            pCreature->SetUInt32Value(UNIT_NPC_FLAGS, 0);            // disable gossip
            char sMessage[200];
            sprintf(sMessage, "Very well, %s.", pPlayer->GetName());
            pCreature->MonsterSay(sMessage, 0, 0);

            if (boss_majordomoAI* pDomoEventAI = dynamic_cast<boss_majordomoAI*>(pCreature->AI()))
                pDomoEventAI->RagnarosEventStart = true;
        }
    }

    return true;
}

bool GossipHello_event_domo(Player* pPlayer, Creature* pCreature)
{
    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_DOMO_1, pCreature->GetGUID());

    return true;
}

CreatureAI* GetAI_boss_majordomo(Creature* pCreature)
{
    return new boss_majordomoAI(pCreature);
}

void AddSC_boss_majordomo()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_majordomo";
    newscript->GetAI = &GetAI_boss_majordomo;
    newscript->pGossipHello = &GossipHello_event_domo;
    newscript->pGossipSelect = &GossipSelect_event_domo;
    newscript->RegisterSelf();
}
