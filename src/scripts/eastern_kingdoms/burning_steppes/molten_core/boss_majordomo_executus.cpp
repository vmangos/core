#include "scriptPCH.h"
#include "molten_core.h"

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

enum
{
    SAY_AGGRO                   = 7612,
    SAY_SPAWN                   = 7566,
    SAY_SLAY                    = 9425,
    SAY_DEFEAT1                 = 7561,
    SAY_DEFEAT2                 = 7567,
    SAY_DEFEAT3                 = 7568,

    SAY_LAST_ADD                = 8545,
    SAY_MAJ                     = 7655,
    SAY_SUMMON_MAJ              = 7657,
    SAY_ARRIVAL1_RAG            = 7636,
    SAY_ARRIVAL2_MAJ            = 7661,
    SAY_ARRIVAL3_RAG            = 7662,

    NPC_FLAMEWAKER_HEALER       = 11663,
    NPC_FLAMEWAKER_ELITE        = 11664,

    SPELL_AEGIS_OF_RAGNAROS     = 20620,  // Cast at start and at 50% health to fully heal Majordomo Executus

    SPELL_MAGIC_REFLECTION      = 20619,  // Cast one of these every 30 seconds
    SPELL_DAMAGE_SHIELD         = 21075,  // Cast one of these every 30 seconds

    SPELL_TELEPORT_TARGET       = 20534,  // Teleport current target
    SPELL_TELEPORT_RANDOM       = 20618,  // Teleport random target

    SPELL_ENCOURAGEMENT         = 21086,  // Cast onto all remaining adds every time one is killed
    SPELL_IMMUNITY              = 21087,  // Cast onto Flamewaker Healers when half the adds are dead
    SPELL_CHAMPION              = 21090,  // Cast onto the last remaining add
    SPELL_SEPARATION_ANXIETY    = 21094,  // Cast onto all adds at start by Majordomo Executus, if adds move out of range, they will cast spell 21095 on themselves

    SPELL_VISUAL_TELEPORT       = 19484,  // Visual used after fight ending dialogue to teleport to Ragnaros
    SPELL_MAJORDOMO_TELEPORT    = 19527,  // Spell cast to facilitate teleporting of Majordomo to Ragnaros
    SPELL_ELEMENTAL_FIRE        = 19773,  // Spell used by Ragnaros to kill Majordomo Executus
    SPELL_SUMMON_RAGNAROS       = 19774,  // Spell used by Majordomo Executus to summon Ragnaros

    FACTION_FRIENDLY            = 1080,   // Faction used after Majordomo Executus is defeated to mark him as friendly

    OBJECT_LAVA_STEAM           = 178107, // Lava steam spawned before Ragnaros
    OBJECT_LAVA_SPLASH          = 178108, // Lava splashes spawned before Ragnaros
};

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

    ObjectGuid m_addSpawns[8];
    uint32 Reflection_Timer;
    uint32 TPDomo_Timer;
    uint32 AddCount;
    bool AddSpawn;

    ScriptedInstance* m_pInstance;

    // Post-defeat dialogue sequence timer
    uint32 DialogueDefeatTimer = 0;
    bool DialogueDefeatStart0 = false;
    bool DialogueDefeatStart1 = false;
    bool DialogueDefeatStart2 = false;
    bool DialogueDefeatStart3 = false;
    bool DialogueTeleportStart = false;
    bool DialogueTeleportFinished = false;

    // Ragnaros Event
    uint32 DialogueRagnaros_M;
    uint32 DialogueRagnarosTimer;
    bool RagnarosEventStart;

    // Majordomo can respawn after 2 hours; the event progress *must* stay DONE
    void Reset() override
    {
        m_creature->SetDefaultMovementType(IDLE_MOTION_TYPE);
        Reflection_Timer =  30000;
        TPDomo_Timer = 10000 + rand() % 20000;
        AddSpawn = false;
        AddCount = 8;

        for (auto& guid : m_addSpawns)
        {
            if (!guid.IsEmpty())
            {
                if (Creature* pOldAdd = m_creature->GetMap()->GetCreature(guid))
                {
                    pOldAdd->DespawnOrUnsummon();
                    guid = ObjectGuid();
                }
            }
        }

        if (m_pInstance && m_pInstance->GetData(TYPE_MAJORDOMO) != DONE)
            m_pInstance->SetData(TYPE_MAJORDOMO, NOT_STARTED);

        // Post-defeat dialogue event
        DialogueDefeatTimer = 0;
        DialogueDefeatStart0 = false;
        DialogueDefeatStart1 = false;
        DialogueDefeatStart2 = false;
        DialogueDefeatStart3 = false;

        // Ragnaros Event
        DialogueRagnaros_M = 0;
        DialogueRagnarosTimer = 0;
        RagnarosEventStart = false;
    }

    // Handler for spells cast on adds death
    void SummonedCreatureJustDied(Creature* pSummoned) override
    {
        if (AddCount > 0)
            AddCount--;

        if (AddCount > 0)
        {
            for (auto const& guid : m_addSpawns)
            {
                if (!guid.IsEmpty())
                {
                    if (Creature* pAdd = m_creature->GetMap()->GetCreature(guid))
                    {
                        if (pAdd->IsAlive())
                        {
                            DoCastSpellIfCan(pAdd, SPELL_ENCOURAGEMENT);
                        }
                    }
                }
            }
        }
        if (AddCount <= 4)
        {
            for (auto const& guid : m_addSpawns)
            {
                if (!guid.IsEmpty())
                {
                    if (Creature* pAdd = m_creature->GetMap()->GetCreature(guid))
                    {
                        if (pAdd->IsAlive())
                        {
                            DoCastSpellIfCan(pAdd, SPELL_IMMUNITY, CF_TRIGGERED | CF_AURA_NOT_PRESENT);
                        }
                    }
                }
            }
        }
        if (AddCount == 1)
        {
            for (auto const& guid : m_addSpawns)
            {
                if (!guid.IsEmpty())
                {
                    if (Creature* pAdd = m_creature->GetMap()->GetCreature(guid))
                    {
                        if (pAdd->IsAlive())
                        {
                            m_creature->MonsterYell(SAY_LAST_ADD);
                            DoCastSpellIfCan(pAdd, SPELL_CHAMPION, CF_TRIGGERED);
                        }
                    }
                }
            }
        }
        else if (AddCount == 0)
        {
            if (m_pInstance)
                if (m_pInstance->GetData(TYPE_MAJORDOMO) != DONE)
                    m_pInstance->SetData(TYPE_MAJORDOMO, DONE);

            EnterEvadeMode();
            m_creature->SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_PET_RENAME | UNIT_FLAG_IMMUNE_TO_PLAYER | UNIT_FLAG_IN_COMBAT);
        }
    }

    // Handler for beginning dialogue sequence
    void JustReachedHome() override
    {
        if (m_creature->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PET_RENAME) && DialogueDefeatStart0 == false)
            DialogueDefeatStart0 = true;
    }

    // Dialogue: "Ashes to ashes!"
    void KilledUnit(Unit* victim) override
    {
        if (m_creature->GetFactionTemplateId() != FACTION_FRIENDLY)
            DoScriptText(SAY_SLAY, m_creature);
    }

    // Aggro handler
    void Aggro(Unit *who) override
    {
        if (m_creature->GetFactionTemplateId() != FACTION_FRIENDLY)
        {
            for (auto const& guid : m_addSpawns)
            {
                if (!guid.IsEmpty())
                {
                    if (Creature* pAdd = m_creature->GetMap()->GetCreature(guid))
                    {
                        if (pAdd->IsAlive())
                        {
                            DoCastSpellIfCan(pAdd, SPELL_SEPARATION_ANXIETY, CF_TRIGGERED | CF_AURA_NOT_PRESENT);
                        }
                    }
                }
            }

            DoCastSpellIfCan(m_creature, SPELL_AEGIS_OF_RAGNAROS, CF_TRIGGERED);
            DoScriptText(SAY_AGGRO, m_creature);
        }

        if (m_pInstance && m_pInstance->GetData(TYPE_MAJORDOMO) != DONE)
            m_pInstance->SetData(TYPE_MAJORDOMO, IN_PROGRESS);
    }

    // Movement handler for Ragnaros summoning sequence
    void MovementInform(uint32 uiType, uint32 uiPointId) override
    {
        if (uiType != POINT_MOTION_TYPE)
            return;

        // Face forward when resetting or before defeat dialogue
        if (uiPointId == POINT_RESPAWN)
        {
            m_creature->SetOrientation((float)POINT_RESPAWN_O);
            return;
        }
        // Begin Ragnaros Event movement sequence
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
        // Ragnaros Event final position
        else if (uiPointId == POINT_SUMMON3)
        {
            m_creature->GetMotionMaster()->Clear();
            m_creature->GetMotionMaster()->MoveIdle();
            return;
        }
    }

    // Ragnaros Event sequence
    void DomoEvent()
    {
        switch (DialogueRagnaros_M)
        {
            case 6:
                m_creature->GetMotionMaster()->MovePoint(POINT_SUMMON1, (float)POINT_SUMMON1_X, (float)POINT_SUMMON1_Y, (float)POINT_SUMMON1_Z);
                m_creature->SummonGameObject(OBJECT_LAVA_STEAM, 838.951f, -830.383f, -230.206f, 0.837757f, 0, 0, 0.406736f, 0.913546f, 0);
                m_creature->SummonGameObject(OBJECT_LAVA_SPLASH, 839.279f, -831.058f, -230.202f, 4.90438f, 0, 0, -0.636078f, 0.771625f, 0);
                m_creature->CastSpell(m_creature, SPELL_SUMMON_RAGNAROS, false);
                DoScriptText(SAY_MAJ, m_creature);
                break;
            case 15:
                m_creature->SetOrientation(5.231960f);
                break;
            case 21:
                DoScriptText(SAY_SUMMON_MAJ, m_creature);
                break;
            case 28:
            {
                // World of Warcraft Client Patch 1.4.0 (2005-04-19)
                // - Ragnaros now stays up 2 hours rather than 1 after being summoned. 
                uint32 const despawnTime = (sWorld.GetWowPatch() >= WOW_PATCH_104) ? (2 * HOUR * IN_MILLISECONDS) : (1 * HOUR * IN_MILLISECONDS);
                if (Creature* Ragnaros = m_creature->SummonCreature(NPC_RAGNAROS, 838.308f, -831.466f, -232.185f, 2.19911f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, despawnTime))
                    m_creature->SetFacingToObject(Ragnaros);
                break;
            }
            case 36:
                if (Creature* Ragnaros = m_creature->FindNearestCreature(NPC_RAGNAROS, 100.0f, true))
                {
                    DoScriptText(SAY_ARRIVAL1_RAG, Ragnaros);
                    Ragnaros->HandleEmote(EMOTE_ONESHOT_ROAR);
                }
                break;
            case 50:
                DoScriptText(SAY_ARRIVAL2_MAJ, m_creature);
                break;
            case 60:
                if (Creature* Ragnaros = m_creature->FindNearestCreature(NPC_RAGNAROS, 100.0f, true))
                {
                    Ragnaros->SetTargetGuid(m_creature->GetGUID());
                    DoScriptText(SAY_ARRIVAL3_RAG, Ragnaros);
                    Ragnaros->HandleEmote(EMOTE_ONESHOT_ROAR);
                }
                break;
            case 76:
                m_creature->SetInvincibilityHpThreshold(0);
                if (Creature* Ragnaros = m_creature->FindNearestCreature(NPC_RAGNAROS, 100.0f, true))
                    Ragnaros->CastSpell(m_creature, SPELL_ELEMENTAL_FIRE, false);
                // Handle rest in Ragnaros script
                break;
            }
    }

    // Update handler
    void UpdateAI(uint32 const diff) override
    {
        // If respawning, resummon adds
        if (!m_creature->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PLAYER) && m_creature->GetFactionTemplateId() != FACTION_FRIENDLY && !AddSpawn)
        {
            for (int i = 0; i < 8; i++)
            {
                if (!m_addSpawns[i].IsEmpty())
                {
                    if (Creature* pOldAdd = m_creature->GetMap()->GetCreature(m_addSpawns[i]))
                    {
                        pOldAdd->DespawnOrUnsummon();
                        m_addSpawns[i] = ObjectGuid();
                    }
                }

                if (Creature* pNewAdd = m_creature->SummonCreature(m_aBosspawnLocs[i].m_uiEntry, m_aBosspawnLocs[i].m_fX, m_aBosspawnLocs[i].m_fY, m_aBosspawnLocs[i].m_fZ, m_aBosspawnLocs[i].m_fO, TEMPSUMMON_DEAD_DESPAWN, 0))
                {
                    m_addSpawns[i] = pNewAdd->GetObjectGuid();
                }
            }

            AddSpawn = true;
        }

        // Dialogue: "Impossible! Stay your attack, mortals..."
        if (DialogueDefeatStart0 == true)
        {
            DialogueDefeatTimer += diff;
            if (DialogueDefeatTimer > 2400)
            {
                DialogueDefeatStart0 = false;
                DialogueDefeatStart1 = true;
                DialogueDefeatTimer = 0;

                m_creature->SetFactionTemplateId(FACTION_FRIENDLY);
                m_creature->SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PLAYER | UNIT_FLAG_IN_COMBAT);
                DoScriptText(SAY_DEFEAT1, m_creature);
            }
        }

        // Dialogue: "Brashly, you have come..."
        if (DialogueDefeatStart1 == true)
        {
            DialogueDefeatTimer += diff;
            if (m_creature->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IN_COMBAT) && DialogueDefeatTimer > 3600)
            {
                m_creature->SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PLAYER);
            }
            if (DialogueDefeatTimer > 7700)
            {
                DialogueDefeatStart1 = false;
                DialogueDefeatStart2 = true;
                DialogueDefeatTimer = 0;

                DoScriptText(SAY_DEFEAT2, m_creature);
            }
        }

        // Dialogue: "I go now to summon..."
        if (DialogueDefeatStart2 == true)
        {
            DialogueDefeatTimer += diff;
            if (DialogueDefeatTimer > 8600)
            {
                DialogueDefeatStart2 = false;
                DialogueDefeatStart3 = true;
                DialogueDefeatTimer = 0;

                DoScriptText(SAY_DEFEAT3, m_creature);
            }
        }

        // Teleport to Ragnaros after dialogue
        if (DialogueDefeatStart3 == true)
        {
            if (m_creature->GetDistance2d(758.089f, -1176.71f) < 2.0f && m_creature->GetFactionTemplateId() == FACTION_FRIENDLY)
            {
                DialogueDefeatTimer += diff;
                if (DialogueDefeatTimer > 17600)
                {
                    DialogueDefeatStart3 = false;
                    DialogueTeleportStart = true;
                    DialogueDefeatTimer = 0;

                    DoCastSpellIfCan(m_creature, SPELL_VISUAL_TELEPORT, CF_FORCE_CAST);
                }
            }
        }

        // Majordomo Teleport sequence start
        if (DialogueTeleportStart)
        {
            DialogueDefeatTimer += diff;
            if (DialogueDefeatTimer > 1510)
            {
                DialogueTeleportStart = false;
                DialogueTeleportFinished = true;
                DialogueDefeatTimer = 0;

                DoCastSpellIfCan(m_creature, SPELL_MAJORDOMO_TELEPORT, CF_FORCE_CAST);
            }
        }

        // Majordomo Teleport sequence end
        if (DialogueTeleportFinished)
        {
            DialogueDefeatTimer += diff;
            if (DialogueDefeatTimer > 100)
            {
                DialogueTeleportFinished = false;
                DialogueDefeatTimer = 0;

                m_creature->SetUInt32Value(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
            }
        }

        // Start the Ragnaros summoning event
        if (RagnarosEventStart && m_creature->GetFactionTemplateId() == FACTION_FRIENDLY)
        {
            bool Up = false;
            DialogueRagnarosTimer += diff;
            if (DialogueRagnarosTimer > 1000)
            {
                DialogueRagnaros_M++;
                DialogueRagnarosTimer = 0;
                Up = true;
            }
            if (Up)
                DomoEvent();
        }

        // Raid wipe handler
        if (m_creature->GetFactionTemplateId() != FACTION_FRIENDLY && (!m_creature->SelectHostileTarget() || !m_creature->GetVictim()))
            return;

        // Cast Aegis Of Ragnaros if less than 50% hp
        if (m_creature->GetHealthPercent() < 50.0f)
            DoCastSpellIfCan(m_creature, SPELL_AEGIS_OF_RAGNAROS);

        // Reflect spell timer
        if (Reflection_Timer < diff)
        {
            uint32 Reflect = rand() % 2 ? SPELL_MAGIC_REFLECTION : SPELL_DAMAGE_SHIELD;
            for (auto const& guid : m_addSpawns)
            {
                if (!guid.IsEmpty())
                {
                    if (Creature* pAdd = m_creature->GetMap()->GetCreature(guid))
                    {
                        if (pAdd->IsAlive())
                        {
                            DoCastSpellIfCan(pAdd, Reflect);
                        }
                    }
                }
            }
            Reflection_Timer = 30000;
        }
        else Reflection_Timer -= diff;

        // Teleport spell timer
        if (TPDomo_Timer < diff)
        {
            Unit* uTarget = m_creature->GetVictim();
            if (urand(0, 1) == 0)
            {
                uTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 1);
                if (uTarget && uTarget->IsPlayer() && DoCastSpellIfCan(uTarget, SPELL_TELEPORT_RANDOM) == CAST_OK)
                {
                    DoResetThreat();
                    TPDomo_Timer = 20000 + rand() % 10000;
                }
            }
            else
            {
                if (uTarget && uTarget->IsPlayer() && DoCastSpellIfCan(uTarget, SPELL_TELEPORT_TARGET) == CAST_OK)
                {
                    DoResetThreat();
                    TPDomo_Timer = 20000 + rand() % 10000;
                }
            }
        }
        else TPDomo_Timer -= diff;

        DoMeleeAttackIfReady();
    }

    // Begin Ragnaros sequence
    void OnScriptEventHappened(uint32 uiEvent, uint32 uiData, WorldObject* pInvoker) override
    {
        if (pInvoker && pInvoker->IsPlayer())
        {
            RagnarosEventStart = true;
            m_creature->SetUInt32Value(UNIT_NPC_FLAGS, 0);
        }
    }
};

CreatureAI* GetAI_boss_majordomo(Creature* pCreature)
{
    return new boss_majordomoAI(pCreature);
}

void AddSC_boss_majordomo()
{
    Script* newscript;
    newscript = new Script;
    newscript->Name = "boss_majordomo";
    newscript->GetAI = &GetAI_boss_majordomo;
    newscript->RegisterSelf();
}
