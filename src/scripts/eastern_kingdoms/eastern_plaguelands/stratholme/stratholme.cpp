/* ContentData
go_gauntlet_gate
mob_freed_soul
mob_restless_soul
mobs_spectral_ghostly_citizen
EndContentData */

#include "scriptPCH.h"
#include "stratholme.h"

#define TEXTE_CRISTAL_MORT         -20003
#define TEXTE_CRISTAL_TOUS_MORT    -20004
/*######
## go_gauntlet_gate (this is the _first_ of the gauntlet gates, two exist)
######*/

bool GOHello_go_gauntlet_gate(Player* pPlayer, GameObject* pGo)
{
    ScriptedInstance* pInstance = (ScriptedInstance*)pGo->GetInstanceData();

    if (!pInstance)
        return false;

    if (pInstance->GetData(TYPE_BARON_RUN) != NOT_STARTED)
        return false;

    pInstance->SetData(TYPE_BARON_RUN, IN_PROGRESS);
    return false;
}

/*######
## GOHello_go_entree_de_service
######*/

bool GOHello_go_entree_de_service(Player* pPlayer, GameObject* pGo)
{
    ScriptedInstance* pInstance = (ScriptedInstance*)pGo->GetInstanceData();

    if (!pInstance)
        return false;

    if (pInstance->GetData(TYPE_BARON_RUN) != NOT_STARTED)
        return false;

    std::list<Creature*> listBarthilas;
    GetCreatureListWithEntryInGrid(listBarthilas, pGo, 10435, 1000);
    for (std::list<Creature*>::const_iterator itr = listBarthilas.begin(); itr != listBarthilas.end(); ++itr)
    {
        if (!(*itr)->isAlive())
            continue;

        (*itr)->AI()->ReceiveEmote(pPlayer, 1000);
    }
    pGo->UseDoorOrButton(5);

    return true;
}

/*######
## go_stratholme_postbox
######*/

bool GOOpen_go_stratholme_postbox(Player* pPlayer, GameObject* pGo)
{
    ScriptedInstance* pInstance = (ScriptedInstance*)pGo->GetInstanceData();

    if (!pInstance)
        return false;

    if (pInstance->GetData(TYPE_POSTMASTER) == DONE)
        return false;

    // When the data is Special, spawn the postmaster
    if (pInstance->GetData(TYPE_POSTMASTER) == SPECIAL)
    {
        pPlayer->CastSpell(pPlayer, SPELL_SUMMON_POSTMASTER, true);
        pInstance->SetData(TYPE_POSTMASTER, DONE);
    }
    else
        pInstance->SetData(TYPE_POSTMASTER, IN_PROGRESS);

    // Summon 3 postmen for each postbox
    float fX, fY, fZ;
    for (uint8 i = 0; i < 3; ++i)
    {
        pPlayer->GetRandomPoint(pPlayer->GetPositionX(), pPlayer->GetPositionY(), pPlayer->GetPositionZ(), 6.0f, fX, fY, fZ);
        pPlayer->SummonCreature(NPC_UNDEAD_POSTMAN, fX, fY, fZ, 0.0f, TEMPSUMMON_DEAD_DESPAWN, 0);
    }

    return false;
}

/*######
## mob_freed_soul
######*/

//Possibly more of these quotes around.
#define SAY_ZAPPED0 -1329000
#define SAY_ZAPPED1 -1329001
#define SAY_ZAPPED2 -1329002
#define SAY_ZAPPED3 -1329003

struct mob_freed_soulAI : public ScriptedAI
{
    mob_freed_soulAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    void Reset()
    {
        switch (urand(0, 3))
        {
            case 0:
                DoScriptText(SAY_ZAPPED0, m_creature);
                break;
            case 1:
                DoScriptText(SAY_ZAPPED1, m_creature);
                break;
            case 2:
                DoScriptText(SAY_ZAPPED2, m_creature);
                break;
            case 3:
                DoScriptText(SAY_ZAPPED3, m_creature);
                break;
        }
    }
};

CreatureAI* GetAI_mob_freed_soul(Creature* pCreature)
{
    return new mob_freed_soulAI(pCreature);
}

/*######
## mob_restless_soul
######*/

#define SPELL_EGAN_BLASTER  17368
#define SPELL_SOUL_FREED    17370
#define QUEST_RESTLESS_SOUL 5282
#define ENTRY_RESTLESS      11122
#define ENTRY_FREED         11136

struct mob_restless_soulAI : public ScriptedAI
{
    mob_restless_soulAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint64 Tagger;
    uint32 Die_Timer;
    bool Tagged;

    void Reset()
    {
        Tagger = 0;
        Die_Timer = 5000;
        Tagged = false;
    }

    void SpellHit(Unit *caster, const SpellEntry *spell)
    {
        if (caster->GetTypeId() == TYPEID_PLAYER)
        {
            if (!Tagged && spell->Id == SPELL_EGAN_BLASTER && ((Player*)caster)->GetQuestStatus(QUEST_RESTLESS_SOUL) == QUEST_STATUS_INCOMPLETE)
            {
                Tagged = true;
                Tagger = caster->GetGUID();
            }
        }
    }

    void JustSummoned(Creature *summoned)
    {
        summoned->CastSpell(summoned, SPELL_SOUL_FREED, false);
        if (Unit* temp = m_creature->GetMap()->GetUnit(Tagger))
            summoned->GetMotionMaster()->MoveFollow(temp, PET_FOLLOW_DIST, PET_FOLLOW_ANGLE);
    }

    void JustDied(Unit* Killer)
    {
        if (Tagged)
            m_creature->SummonCreature(ENTRY_FREED, 0.0f, 0.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN, 300000);
    }

    void UpdateAI(const uint32 diff)
    {
        if (Tagged)
        {
            if (Die_Timer < diff)
            {
                if (Player* temp = m_creature->GetMap()->GetPlayer(Tagger))
                    temp->KilledMonsterCredit(m_creature->GetEntry(), m_creature->GetGUID());
                m_creature->DealDamage(m_creature, m_creature->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
            }
            else Die_Timer -= diff;
        }
    }
};

CreatureAI* GetAI_mob_restless_soul(Creature* pCreature)
{
    return new mob_restless_soulAI(pCreature);
}

/*######
## mobs_spectral_ghostly_citizen
######*/

enum
{
    SPELL_HAUNTING_PHANTOM  = 16336,
    SPELL_SLAP              = 6754
};

struct mobs_spectral_ghostly_citizenAI : public ScriptedAI
{
    mobs_spectral_ghostly_citizenAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        hasEvadedOnce = false;
    }

    uint32 Die_Timer;
    uint32 cast_Haunting;
    bool Tagged;
    bool hasEvadedOnce;

    void Reset()
    {
        Die_Timer = 5000;
        cast_Haunting = 20000;
        Tagged = false;
    }

    void SpellHit(Unit *caster, const SpellEntry *spell)
    {
        if (!Tagged && spell->Id == SPELL_EGAN_BLASTER)
            Tagged = true;
    }

    void JustDied(Unit* Killer)
    {
        if (Tagged)
        {
            for (uint32 i = 1; i <= 4; ++i)
            {
                float x, y, z;
                m_creature->GetRandomPoint(m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ(), 20.0f, x, y, z);

                //100%, 50%, 33%, 25% chance to spawn
                uint32 j = urand(1, i);
                if (j == 1)
                    m_creature->SummonCreature(ENTRY_RESTLESS, x, y, z, 0, TEMPSUMMON_CORPSE_DESPAWN, 600000);
            }
        }
    }

    void UpdateAI(const uint32 diff)
    {
        if (Tagged)
        {
            if (Die_Timer < diff)
                m_creature->DealDamage(m_creature, m_creature->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
            else Die_Timer -= diff;
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (cast_Haunting < diff)
        {
            m_creature->CastSpell(m_creature->getVictim(), SPELL_HAUNTING_PHANTOM, false);
            cast_Haunting = 20000;
        }
        else cast_Haunting -= diff;

        DoMeleeAttackIfReady();
    }

    void ReceiveEmote(Player* pPlayer, uint32 emote)
    {
        switch (emote)
        {
            case TEXTEMOTE_DANCE:
                if (m_creature->isInCombat() && !hasEvadedOnce)
                {
                    EnterEvadeMode();
                    hasEvadedOnce = true;
                }
                else
                    m_creature->HandleEmoteCommand(EMOTE_STATE_DANCE);
                break;
            case TEXTEMOTE_RUDE:
                if (m_creature->IsWithinMeleeRange(pPlayer))
                    m_creature->CastSpell(pPlayer, SPELL_SLAP, false);
                else
                    m_creature->HandleEmoteCommand(EMOTE_ONESHOT_RUDE);
                break;
            case TEXTEMOTE_WAVE:
                m_creature->HandleEmoteCommand(EMOTE_ONESHOT_WAVE);
                break;
            case TEXTEMOTE_BOW:
                m_creature->HandleEmoteCommand(EMOTE_ONESHOT_BOW);
                break;
            case TEXTEMOTE_KISS:
                m_creature->HandleEmoteCommand(EMOTE_ONESHOT_FLEX);
                break;
        }
    }
};

CreatureAI* GetAI_mobs_spectral_ghostly_citizen(Creature* pCreature)
{
    return new mobs_spectral_ghostly_citizenAI(pCreature);
}

/*######
## mobs_cristal_zuggurat
######*/

struct mobs_cristal_zugguratAI : public ScriptedAI
{
    mobs_cristal_zugguratAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        uiUpdateTimer = 2000;
        Reset();
    }

    ScriptedInstance* m_pInstance;
    uint32 uiUpdateTimer;
    std::list<uint64> acolyte;

    void Reset() {}

    void JustDied(Unit* Killer)
    {
        if (Creature* pop = m_creature->SummonCreature(10399, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ() - 100, 0, TEMPSUMMON_TIMED_DESPAWN, 1))
        {
            pop->MonsterYellToZone(TEXTE_CRISTAL_MORT, LANG_UNIVERSAL, 0);
            if (m_pInstance)
            {
                m_pInstance->SetData(TYPE_CRISTAL_DIE, IN_PROGRESS);
                if (m_pInstance->GetData(TYPE_CRISTAL_ALL_DIE) == DONE)
                    pop->MonsterYellToZone(TEXTE_CRISTAL_TOUS_MORT, LANG_UNIVERSAL, 0);
            }
        }
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->isAlive() || !m_pInstance)
            return;

        if (uiUpdateTimer > diff)
        {
            uiUpdateTimer -= diff;
            return;
        }

        uiUpdateTimer = 2000;

        if (acolyte.empty())
        {
            std::list<Creature*> creatures;
            std::list<Creature*>::iterator itr;
            GetCreatureListWithEntryInGrid(creatures, m_creature, 10399, 50.0f);
            for (itr = creatures.begin(); itr != creatures.end(); ++itr)
                acolyte.push_back((*itr)->GetGUID());
            return;
        }

        for (std::list<uint64>::const_iterator itr = acolyte.begin(); itr != acolyte.end(); ++itr)
            if (Creature *pCreature = m_pInstance->instance->GetCreature((*itr)))
                if (pCreature && pCreature->isAlive())
                    return;

        m_creature->DealDamage(m_creature, m_creature->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
    }
};

CreatureAI* GetAI_mobs_cristal_zuggurat(Creature* pCreature)
{
    return new mobs_cristal_zugguratAI(pCreature);
}

/*######
## mobs_rat_pestifere
######*/

struct AI_mobs_rat_pestifere : public ScriptedAI
{
    AI_mobs_rat_pestifere(Creature* pCreature) : ScriptedAI(pCreature)
    {
        switch (urand(1, 3))
        {
            case 2:
                m_creature->SetDisplayId(1418);
                break;
                //        case 3:    m_creature->SetDisplayId(00000000000);    break;
        }
        Reset();
    }

    char m_idRat;
    char m_mvt_id;
    uint32 m_mvt_timer;
    float m_xDest;
    float m_yDest;
    float m_zDest;
    float m_xOrigine;
    float m_yOrigine;
    float m_zOrigine;

    void Reset()
    {
        m_idRat = 0;
        m_mvt_id = 0;
        m_mvt_timer = 0;
    }

    void ReceiveEmote(Player* pPlayer, uint32 emote)
    {
        if (emote < 1000)
            return;

        m_idRat = emote - 999;

        if (m_idRat > 0 && m_idRat <= 3)
            m_creature->GetMap()->CreatureRelocation(m_creature, 3632.05f, -3327.71f, 123.7f, 0);
        else if (m_idRat > 3 && m_idRat <= 6)
            m_creature->GetMap()->CreatureRelocation(m_creature, 3633.7f, -3345.3f, 126, 0);
        else if (m_idRat > 6 && m_idRat <= 8)
            m_creature->GetMap()->CreatureRelocation(m_creature, 3616.1f, -3339.1f, 124.2f, 0);
        else if (m_idRat > 8 && m_idRat <= 10)
            m_creature->GetMap()->CreatureRelocation(m_creature, 3617.6f, -3332.4f, 123.6f, 0);
    }

    void Deplacement(float x, float y, float z)
    {
        m_xOrigine = m_xDest;
        m_yOrigine = m_yDest;
        m_zOrigine = m_zDest;
        m_xDest = x;
        m_yDest = y;
        m_zDest = z;

        x = m_xDest - m_xOrigine;
        y = m_yDest - m_yOrigine;
        float speed = m_creature->GetSpeed(MOVE_RUN) * 0.001f;

        m_creature->GetMap()->CreatureRelocation(m_creature, m_xOrigine, m_yOrigine, m_zOrigine, 0);

        if (m_creature->IsWalking())
            m_creature->SetWalk(false);

        m_creature->MonsterMove(m_xDest, m_yDest, m_zDest);
        m_mvt_timer = static_cast<uint32>(sqrt((x * x) + (y * y)) / speed);
        m_mvt_id++;
    }

    void UpdateAI(const uint32 diff)
    {
        if (m_mvt_timer < diff && m_idRat > 0)
        {
            switch (m_idRat)
            {
                case 1:
                {
                    switch (m_mvt_id)
                    {
                        case 1:
                            Deplacement(3631.9f, -3330, 123.7f);
                            break;
                        case 2:
                            Deplacement(3629.8f, -3331.2f, 123.2f);
                            break;
                        case 3:
                            Deplacement(3619.5f, -3332.9f, 123.5f);
                            break;
                        case 4:
                            Deplacement(3617.3f, -3331.8f, 123.7f);
                            break;
                        case 5:
                            Deplacement(3615.7f, -3329.3f, 123.8f);
                            break;
                        default:
                            m_idRat = 0;
                    }
                    break;
                }
                case 2:
                {
                    switch (m_mvt_id)
                    {
                        case 1:
                            Deplacement(3631.3f, -3330, 123.7f);
                            break;
                        case 2:
                            Deplacement(3629.1f, -3331.8f, 123.1f);
                            break;
                        case 3:
                            Deplacement(3619.5f, -3333.5f, 123.5f);
                            break;
                        case 4:
                            Deplacement(2615.5f, -3331.5f, 123.8f);
                            break;
                        default:
                            m_idRat = 0;
                    }
                    break;
                }
                case 3:
                {
                    switch (m_mvt_id)
                    {
                        case 1:
                            Deplacement(3632.7f, -3330, 123.7f);
                            break;
                        case 2:
                            Deplacement(3627.2f, -3333.5f, 123);
                            break;
                        case 3:
                            Deplacement(3615.2f, -3333.5f, 123.8f);
                            break;
                        default:
                            m_idRat = 0;
                    }
                    break;
                }
                case 4:
                {
                    switch (m_mvt_id)
                    {
                        case 1:
                            Deplacement(3631.9f, -3341.5f, 123.8f);
                            break;
                        case 2:
                            Deplacement(3623.2f, -3335.2f, 123.1f);
                            break;
                        case 3:
                            Deplacement(3615.2f, -3335.2f, 123.8f);
                            break;
                        default:
                            m_idRat = 0;
                    }
                    break;
                }
                case 5:
                {
                    switch (m_mvt_id)
                    {
                        case 1:
                            Deplacement(3632.3f, -3341.5f, 123.8f);
                            break;
                        case 2:
                            Deplacement(3625.1f, -3336.6f, 123.4f);
                            break;
                        case 3:
                            Deplacement(3625.1f, -3336.6f, 124);
                            break;
                        default:
                            m_idRat = 0;
                    }
                    break;
                }
                case 6:
                {
                    switch (m_mvt_id)
                    {
                        case 1:
                            Deplacement(3632.7f, -3341.5f, 123.8f);
                            break;
                        case 2:
                            Deplacement(3630.1f, -3340.1f, 124.3f);
                            break;
                        case 3:
                            Deplacement(3619, -337.6f, 123.7f);
                            break;
                        case 4:
                            Deplacement(3616.8f, -3337.2f, 123.9f);
                            break;
                        case 5:
                            Deplacement(3615.1f, -3338.1f, 124.2f);
                            break;
                        default:
                            m_idRat = 0;
                    }
                    break;
                }
                case 7:
                {
                    switch (m_mvt_id)
                    {
                        case 1:
                            Deplacement(3613, -3337.3f, 124.3f);
                            break;
                        default:
                            m_idRat = 0;
                    }
                    break;
                }
                case 8:
                {
                    switch (m_mvt_id)
                    {
                        case 1:
                            Deplacement(3613, -3335.2f, 124);
                            break;
                        default:
                            m_idRat = 0;
                    }
                    break;
                }
                case 9:
                {
                    switch (m_mvt_id)
                    {
                        case 1:
                            Deplacement(3613, -3333.7f, 123.9f);
                            break;
                        default:
                            m_idRat = 0;
                    }
                    break;
                }
                case 10:
                {
                    switch (m_mvt_id)
                    {
                        case 1:
                            Deplacement(3613, -3331.4f, 123.92f);
                            break;
                        default:
                            m_idRat = 0;
                    }
                    break;
                }
            }
        }
        else m_mvt_timer -= diff;
    }
};

CreatureAI* GetAI_mobs_rat_pestifere(Creature* pCreature)
{
    return new AI_mobs_rat_pestifere(pCreature);
}

/*######
## npc_Aurius
######*/

#define QUEST_AURIUSRECKONING 5125
#define QUEST_THEMEDALLIONOFFAITH 5122
#define NPC_AURIUS_1 10917
#define NPC_AURIUS_2 10931

struct npc_auriusAI : public ScriptedAI
{
    npc_auriusAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;
    uint32 ui_entry;
    bool bIsFakeDead;

    void Reset()
    {
        if (!m_pInstance)
            return;
        ui_entry = (m_creature->GetCreatureInfo()->Entry);
        if (ui_entry == NPC_AURIUS_1)
            m_pInstance->SetData(TYPE_EVENT_AURIUS, NOT_STARTED);
        bIsFakeDead = false;
    }

    void FakeDeath()
    {
        if (!bIsFakeDead)
        {
            bIsFakeDead = true;
            m_creature->StopMoving();
            m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_29);
            m_creature->SetUInt32Value(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_DEAD);
            m_creature->SetStandState(UNIT_STAND_STATE_DEAD);
            m_creature->addUnitState(UNIT_STAT_DIED);
            m_creature->CombatStop();
            //m_creature->RemoveAllAuras();
            //m_creature->DeleteThreatList();
            //m_creature->LoadCreatureAddon();
            //m_creature->GetMotionMaster()->MovementExpired();
            //m_creature->GetMotionMaster()->MoveIdle();
            m_creature->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_IMMUNE_OR_LOST_SELECTION);
            m_creature->InterruptNonMeleeSpells(true);
            m_creature->getHostileRefManager().deleteReferences();
        }
    }

    void DamageTaken(Unit* pDoneBy, uint32& uiDamage)
    {
        if (uiDamage >= m_creature->GetHealth())
        {
            if (m_creature->GetHealth() > 1)
                uiDamage = m_creature->GetHealth() - 1;
            else
                uiDamage = 0;
            FakeDeath();
        }
    }

    void QuestCompleted(Player* pPlayer, Quest const* pQuest)
    {
        if ((ui_entry == NPC_AURIUS_1) && (pQuest->GetQuestId() == QUEST_THEMEDALLIONOFFAITH))
        {
            m_creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
            m_pInstance->SetData64(DATA_QUESTPLAYER, pPlayer->GetGUID());
            m_pInstance->SetData(TYPE_EVENT_AURIUS, SPECIAL);
        }
    }

    void UpdateAI(const uint32 diff)
    {
        switch (ui_entry)
        {
            case NPC_AURIUS_1:
            {
                switch (m_pInstance->GetData(TYPE_BARON))
                {
                    case IN_PROGRESS :
                    case FAIL :
                    case DONE :
                    {
                        if ((m_pInstance->GetData(TYPE_EVENT_AURIUS)) != NOT_STARTED)
                            m_creature->SetVisibility(VISIBILITY_OFF);
                        break;
                    }
                }
                break;
            }
            case NPC_AURIUS_2:
            {
                switch (m_pInstance->GetData(TYPE_BARON))
                {
                    case IN_PROGRESS :
                    {
                        if (((m_pInstance->GetData(TYPE_EVENT_AURIUS)) == IN_PROGRESS) && (m_creature->getStandState() != UNIT_STAND_STATE_DEAD))
                        {
                            if (Creature* pTarget = m_creature->GetMap()->GetCreature(m_pInstance->GetData64(DATA_BARON)))
                            {
                                if (pTarget->GetHealthPercent() <= 20.0f)
                                    FakeDeath();
                                else
                                    m_creature->AI()->AttackStart(pTarget);
                            }

                        }
                        break;
                    }
                    case FAIL :
                    {
                        if ((m_pInstance->GetData(TYPE_EVENT_AURIUS)) == IN_PROGRESS)
                        {
                            FakeDeath();
                            m_creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                            m_pInstance->SetData(TYPE_EVENT_AURIUS, FAIL);
                        }
                        break;
                    }
                    case DONE :
                    {
                        if ((m_pInstance->GetData(TYPE_EVENT_AURIUS)) == IN_PROGRESS)
                        {
                            FakeDeath();
                            m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                            m_pInstance->SetData(TYPE_EVENT_AURIUS, DONE);
                        }
                        break;
                    }
                }
                break;
            }
        }
        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_aurius(Creature* pCreature)
{
    return new npc_auriusAI(pCreature);
}

bool QuestComplete_npc_aurius(Player* pPlayer, Creature* pCreature, Quest const* pQuest)
{
    if (npc_auriusAI* pScriptedAI = dynamic_cast<npc_auriusAI*>(pCreature->AI()))
    {
        pScriptedAI->QuestCompleted(pPlayer, pQuest);
        return true;
    }
    return false;
}


/*######
## EVENT POP MOBS FIN DE COULOIRS
######*/

#define NPC_DATHROHAN 10812
#define NPC_CRIMSON_GALLANT 10424
#define NPC_BERSERK  10391
#define NPC_GUARDIAN 10390

struct npc_couloir_trigger1AI : public ScriptedAI
{
    npc_couloir_trigger1AI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;
    uint32 m_uiScourgeTimer;
    bool CorridorEnded;
    bool ScourgeStarted;

    void Reset()
    {
        CorridorEnded = false;
        ScourgeStarted = false;
        m_uiScourgeTimer = urand(10*MINUTE*IN_MILLISECONDS, 20*MINUTE*IN_MILLISECONDS);
    }

    void MoveInLineOfSight(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER && m_creature->IsWithinDistInMap(who, 5.0f) && !CorridorEnded)
        {
            if (Creature* Crea = m_creature->FindNearestCreature(10812, 200.0f))
                Crea->MonsterYell("Don't let them break our lines!", 0);

            m_creature->SummonCreature(NPC_CRIMSON_GALLANT, 3516.3f, -3067.8f, 135.08f, 0.837758f, TEMPSUMMON_DEAD_DESPAWN, HOUR * IN_MILLISECONDS);
            m_creature->SummonCreature(NPC_CRIMSON_GALLANT, 3512.3f, -3065.8f, 135.08f, 0.837758f, TEMPSUMMON_DEAD_DESPAWN, HOUR * IN_MILLISECONDS);
            m_creature->SummonCreature(NPC_CRIMSON_GALLANT, 3506.84f, -3093.61f, 135.751f, 2.46091f, TEMPSUMMON_DEAD_DESPAWN, HOUR * IN_MILLISECONDS);

            CorridorEnded = true;
            ScourgeStarted = true;
        }
    }

    void JustSummoned(Creature* pSummoned)
    {
        if (pSummoned->GetEntry() == NPC_BERSERK || pSummoned->GetEntry() == NPC_GUARDIAN)
            pSummoned->SetInCombatWithZone();
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (ScourgeStarted)
        {
            if (m_uiScourgeTimer < uiDiff)
            {
                m_uiScourgeTimer = urand(10*MINUTE*IN_MILLISECONDS, 20*MINUTE*IN_MILLISECONDS);

                if (Creature* Crea = m_creature->GetMap()->GetCreature(m_pInstance->GetData64(NPC_DATHROHAN)))
                {
                    if (Crea->isAlive() && !Crea->isInCombat())
                    {
                        //"The scourge has broken into our bastion!"
                        Crea->MonsterYellToZone(-20005);
                    }
                    else
                        return;
                }             

                for (uint8 i = 0; i < 4; ++i)
                {
                    switch (urand(0, 1))
                    {
                        case 0:
                            m_creature->SummonCreature(NPC_BERSERK,
                                                       m_creature->GetPositionX() + float(urand(0, 5)), m_creature->GetPositionY() - float(urand(0, 5)), m_creature->GetPositionZ(), 0,
                                                       TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, m_uiScourgeTimer);
                            break;
                        case 1:
                            m_creature->SummonCreature(NPC_GUARDIAN,
                                                       m_creature->GetPositionX() + float(urand(0, 5)), m_creature->GetPositionY() - float(urand(0, 5)), m_creature->GetPositionZ(), 0,
                                                       TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, m_uiScourgeTimer);
                            break;
                    }
                }
            }
            else
                m_uiScourgeTimer -= uiDiff;
        }
    }
};

CreatureAI* GetAI_npc_couloir_trigger1(Creature* pCreature)
{
    return new npc_couloir_trigger1AI(pCreature);
}

struct npc_couloir_trigger2AI : public ScriptedAI
{
    npc_couloir_trigger2AI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    bool CorridorEnded;

    void Reset()
    {
        CorridorEnded = false;
    }

    void MoveInLineOfSight(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER && m_creature->IsWithinDistInMap(who, 5.0f) && !CorridorEnded)
        {
            if (Creature* Crea = m_creature->FindNearestCreature(10812, 200.0f))
                Crea->MonsterYell("Don't let them break our lines!", 0);

            m_creature->SummonCreature(NPC_CRIMSON_GALLANT, 3470.86f, -3073.86f, 135.088f, 0.907571f, TEMPSUMMON_DEAD_DESPAWN, HOUR * IN_MILLISECONDS);
            m_creature->SummonCreature(NPC_CRIMSON_GALLANT, 3465.61f, -3065.72f, 135.084f, 0.20944f, TEMPSUMMON_DEAD_DESPAWN, HOUR * IN_MILLISECONDS);
            m_creature->SummonCreature(NPC_CRIMSON_GALLANT, 3467.3f, -3068.8f, 135.004f, 0.837758f, TEMPSUMMON_DEAD_DESPAWN, HOUR * IN_MILLISECONDS);

            CorridorEnded = true;
        }
    }
};

CreatureAI* GetAI_npc_couloir_trigger2(Creature* pCreature)
{
    return new npc_couloir_trigger2AI(pCreature);
}

struct npc_couloir_trigger3AI : public ScriptedAI
{
    npc_couloir_trigger3AI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    bool CorridorEnded;

    void Reset()
    {
        CorridorEnded = false;
    }

    void MoveInLineOfSight(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER && m_creature->IsWithinDistInMap(who, 5.0f) && !CorridorEnded)
        {
            if (Creature* Crea = m_creature->FindNearestCreature(10997, 200.0f))
                Crea->MonsterYell("Don't let them break our lines!", 0);

            m_creature->SummonCreature(NPC_CRIMSON_GALLANT, 3569.11f, -2970.55f, 124.999f, 5.36522f, TEMPSUMMON_DEAD_DESPAWN, HOUR * IN_MILLISECONDS);
            m_creature->SummonCreature(NPC_CRIMSON_GALLANT, 3577.11f, -2998.55f, 125.0011f, 5.36522f, TEMPSUMMON_DEAD_DESPAWN, HOUR * IN_MILLISECONDS);
            m_creature->SummonCreature(NPC_CRIMSON_GALLANT, 3545.11f, -3018.55f, 124.999f, 5.36522f, TEMPSUMMON_DEAD_DESPAWN, HOUR * IN_MILLISECONDS);

            CorridorEnded = true;
        }
    }
};

CreatureAI* GetAI_npc_couloir_trigger3(Creature* pCreature)
{
    return new npc_couloir_trigger3AI(pCreature);
}

struct npc_Scourge_TriggerAI : public ScriptedAI
{
    npc_Scourge_TriggerAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;;
    uint32 m_uiScourgeTimer;
    bool ScourgeStarted;

    void Reset()
    {
        m_uiScourgeTimer = urand(10*MINUTE*IN_MILLISECONDS, 20*MINUTE*IN_MILLISECONDS); // 15 - 30 mn urand(1000000, 1800000);
        ScourgeStarted = false;
    }

    void MoveInLineOfSight(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER && m_creature->IsWithinDistInMap(who, 5.0f) && !ScourgeStarted)
            ScourgeStarted = true;
    }

    void JustSummoned(Creature* pSummoned)
    {
        pSummoned->SetInCombatWithZone();
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (ScourgeStarted)
        {
            if (m_uiScourgeTimer < uiDiff)
            {
                m_uiScourgeTimer = urand(10*MINUTE*IN_MILLISECONDS, 20*MINUTE*IN_MILLISECONDS);

                if (Creature* Crea = m_creature->GetMap()->GetCreature(m_pInstance->GetData64(NPC_DATHROHAN)))
                {
                    if (Crea->isAlive() && !Crea->isInCombat())
                    {
                        //"The scourge has broken into our bastion!"
                        Crea->MonsterYellToZone(-20005);
                    }
                    else
                        return;
                }                

                for (uint8 i = 0; i < 4; ++i)
                {
                    switch (urand(0, 1))
                    {
                        case 0:
                            m_creature->SummonCreature(NPC_BERSERK,
                                                       m_creature->GetPositionX() + float(urand(0, 5)), m_creature->GetPositionY() - float(urand(0, 5)), m_creature->GetPositionZ(), 0,
                                                       TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, m_uiScourgeTimer);
                            break;
                        case 1:
                            m_creature->SummonCreature(NPC_GUARDIAN,
                                                       m_creature->GetPositionX() + float(urand(0, 5)), m_creature->GetPositionY() - float(urand(0, 5)), m_creature->GetPositionZ(), 0,
                                                       TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, m_uiScourgeTimer);
                            break;
                    }
                }

            }
            else
                m_uiScourgeTimer -= uiDiff;
        }
    }
};

CreatureAI* GetAI_npc_Scourge_Trigger(Creature* pCreature)
{
    return new npc_Scourge_TriggerAI(pCreature);
}

/*######
## SUPPLY CRATE
######*/

struct go_supply_crateAI: public GameObjectAI
{
    go_supply_crateAI(GameObject* pGo) : GameObjectAI(pGo) {}

    bool OnUse(Unit* pUser)
    {
        uint32 maxplagued = urand(1, 4);

        switch (urand(0, 2))
        {
            case 0: // Plagued Rat
            {
                for (uint8 i = 0; i < maxplagued; ++i)
                    pUser->SummonCreature(10441, pUser->GetPositionX() + float(urand(0, 2)), pUser->GetPositionY() + float(urand(0, 2)), pUser->GetPositionZ(), 1, TEMPSUMMON_DEAD_DESPAWN, HOUR * IN_MILLISECONDS);
                break;
            }
            case 1: // Plagued Insect
            {
                for (uint8 i = 0; i < maxplagued; ++i)
                    pUser->SummonCreature(10461, pUser->GetPositionX() + float(urand(0, 2)), pUser->GetPositionY() + float(urand(0, 2)), pUser->GetPositionZ(), 1, TEMPSUMMON_DEAD_DESPAWN, HOUR * IN_MILLISECONDS);
                break;
            }
            case 2: // Plagued Maggot
            {
                for (uint8 i = 0; i < maxplagued; ++i)
                    pUser->SummonCreature(10536, pUser->GetPositionX() + float(urand(0, 2)), pUser->GetPositionY() + float(urand(0, 2)), pUser->GetPositionZ(), 1, TEMPSUMMON_DEAD_DESPAWN, HOUR * IN_MILLISECONDS);
                break;
            }
        }

        me->SetLootState(GO_JUST_DEACTIVATED);
        return false;
    }
};

GameObjectAI* GetAIgo_supply_crate(GameObject *pGo)
{
    return new go_supply_crateAI(pGo);
}

/*######
## PIEGES GRILLES
######*/

struct npc_piege_grille1AI : public ScriptedAI
{
    npc_piege_grille1AI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    void Reset()
    {
    }

    void MoveInLineOfSight(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER && m_creature->IsWithinDistInMap(who, 4.0f))
        {
            if (GameObject* pGrille = m_creature->FindNearestGameObject(175355, 20.0f)) // GO_PORT_PIEGE_RAT1 c�t� baron
                pGrille->UseDoorOrButton();
            if (GameObject* pGrille = m_creature->FindNearestGameObject(175354, 20.0f)) // GO_PORT_PIEGE_RAT2 c�t� baron
                pGrille->UseDoorOrButton();

            uint32 maxplagued = urand(8, 10);

            switch (urand(0, 2))
            {
                case 0: // Plagued Rat
                {
                    for (uint8 i = 0; i < maxplagued; ++i)
                        m_creature->SummonCreature(10441, m_creature->GetPositionX() - 3.0f + float(urand(0, 6)),
                                                   m_creature->GetPositionY() - 3.0f + float(urand(0, 6)), m_creature->GetPositionZ() + 0.7f, 1, TEMPSUMMON_DEAD_DESPAWN, HOUR * IN_MILLISECONDS);
                    break;
                }
                case 1: // Plagued Insect
                {
                    for (uint8 i = 0; i < maxplagued; ++i)
                        m_creature->SummonCreature(10461, m_creature->GetPositionX() - 3.0f + float(urand(0, 6)),
                                                   m_creature->GetPositionY() - 3.0f + float(urand(0, 6)), m_creature->GetPositionZ() + 0.7f, 1, TEMPSUMMON_DEAD_DESPAWN, HOUR * IN_MILLISECONDS);
                    break;
                }
                case 2: // Plagued Maggot
                {
                    for (uint8 i = 0; i < maxplagued; ++i)
                        m_creature->SummonCreature(10536, m_creature->GetPositionX() - 3.0f + float(urand(0, 6)),
                                                   m_creature->GetPositionY() - 3.0f + float(urand(0, 6)), m_creature->GetPositionZ() + 0.7f, 1, TEMPSUMMON_DEAD_DESPAWN, HOUR * IN_MILLISECONDS);
                    break;
                }
            }

            m_creature->ForcedDespawn();
        }
    }
};

CreatureAI* GetAI_npc_piege_grille1(Creature* pCreature)
{
    return new npc_piege_grille1AI(pCreature);
}

struct npc_piege_grille2AI : public ScriptedAI
{
    npc_piege_grille2AI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    void Reset()
    {
    }

    void MoveInLineOfSight(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER && m_creature->IsWithinDistInMap(who, 3.0f))
        {
            if (GameObject* pGrille = m_creature->FindNearestGameObject(175351, 20.0f)) // GO_PORT_PIEGE_RAT3 c�t� �carlate
                pGrille->UseDoorOrButton();
            if (GameObject* pGrille = m_creature->FindNearestGameObject(175350, 20.0f)) // GO_PORT_PIEGE_RAT4 c�t� �carlate
                pGrille->UseDoorOrButton();

            uint32 maxplagued = urand(8, 10);

            switch (urand(0, 2))
            {
                case 0: // Plagued Rat
                {
                    for (uint8 i = 0; i < maxplagued; ++i)
                        m_creature->SummonCreature(10441, m_creature->GetPositionX() - 3.0f + float(urand(0, 6)),
                                                   m_creature->GetPositionY() - 3.0f + float(urand(0, 6)), m_creature->GetPositionZ() + 0.7f, 1, TEMPSUMMON_DEAD_DESPAWN, HOUR * IN_MILLISECONDS);
                    break;
                }
                case 1: // Plagued Insect
                {
                    for (uint8 i = 0; i < maxplagued; ++i)
                        m_creature->SummonCreature(10461, m_creature->GetPositionX() - 3.0f + float(urand(0, 6)),
                                                   m_creature->GetPositionY() - 3.0f + float(urand(0, 6)), m_creature->GetPositionZ() + 0.7f, 1, TEMPSUMMON_DEAD_DESPAWN, HOUR * IN_MILLISECONDS);
                    break;
                }
                case 2: // Plagued Maggot
                {
                    for (uint8 i = 0; i < maxplagued; ++i)
                        m_creature->SummonCreature(10536, m_creature->GetPositionX() - 3.0f + float(urand(0, 6)),
                                                   m_creature->GetPositionY() - 3.0f + float(urand(0, 6)), m_creature->GetPositionZ() + 0.7f, 1, TEMPSUMMON_DEAD_DESPAWN, HOUR * IN_MILLISECONDS);
                    break;
                }
            }

            m_creature->ForcedDespawn();
        }
    }
};

CreatureAI* GetAI_npc_piege_grille2(Creature* pCreature)
{
    return new npc_piege_grille2AI(pCreature);
}


void AddSC_stratholme()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "go_gauntlet_gate";
    newscript->pGOHello = &GOHello_go_gauntlet_gate;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_entree_de_service";
    newscript->pGOHello = &GOHello_go_entree_de_service;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_stratholme_postbox";
    newscript->GOOpen = &GOOpen_go_stratholme_postbox;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_freed_soul";
    newscript->GetAI = &GetAI_mob_freed_soul;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_restless_soul";
    newscript->GetAI = &GetAI_mob_restless_soul;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mobs_spectral_ghostly_citizen";
    newscript->GetAI = &GetAI_mobs_spectral_ghostly_citizen;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mobs_cristal_zuggurat";
    newscript->GetAI = &GetAI_mobs_cristal_zuggurat;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mobs_rat_pestifere";
    newscript->GetAI = &GetAI_mobs_rat_pestifere;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_Aurius";
    newscript->GetAI = &GetAI_npc_aurius;
    newscript->pQuestRewardedNPC = &QuestComplete_npc_aurius;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_couloir_trigger1";
    newscript->GetAI = &GetAI_npc_couloir_trigger1;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_couloir_trigger2";
    newscript->GetAI = &GetAI_npc_couloir_trigger2;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_couloir_trigger3";
    newscript->GetAI = &GetAI_npc_couloir_trigger3;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_supply_crate";
    newscript->GOGetAI = &GetAIgo_supply_crate;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_piege_grille1";
    newscript->GetAI = &GetAI_npc_piege_grille1;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_piege_grille2";
    newscript->GetAI = &GetAI_npc_piege_grille2;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_scourge_trigger";
    newscript->GetAI = &GetAI_npc_Scourge_Trigger;
    newscript->RegisterSelf();
}
