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
SDName: Boss_Jin'do the Hexxer
SD%Complete: 85
SDComment: Mind Control not working because of core bug. Shades visible for all.
SDCategory: Zul'Gurub
EndScriptData */

#include "scriptPCH.h"
#include "zulgurub.h"

#define SAY_AGGRO                       -1309014

#define SPELL_BRAINWASHTOTEM            24262
#define SPELL_POWERFULLHEALINGWARD      24309               //We will not use this spell. We will summon a totem by script cause the spell totems will not cast.
#define SPELL_HEX                       24053
#define SPELL_DELUSIONSOFJINDO          24306
#define SPELL_SHADEOFJINDO              24308               //We will not use this spell. We will summon a shade by script.

//Healing Ward Spell
#define SPELL_HEAL                      24311               //Totems are not working right. Right heal spell ID is 24311 but this spell is not casting...

//Shade of Jindo Spell
//#define SPELL_SHADOWSHOCK               19460 // Nostalrius :
/*
et qui envoient de temps à autre
un choc d’ombre de 800-1000 dégâts (ce qui est
bien plus dangereux).
19460 fait plus de 2k de dégats, et utilise de la mana, trop de mana -> L'ombre est OOM rapidement.
D'apres WoWHead, ce serait plutot 24458.
*/
#define SPELL_INVISIBLE                 24699

enum
{
    NPC_SHADE                = 14986,
    SPELL_SHADOWSHOCK        = 24458,
    NPC_BRAINWASHTOTEM       = 15112,
    NPC_POWERFULLHEALINGWARD = 14987
};

struct boss_jindoAI : public ScriptedAI
{
    boss_jindoAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;

    uint32 BrainWashTotem_Timer;
    uint32 HealingWard_Timer;
    uint32 Hex_Timer;
    uint32 Delusions_Timer;
    uint32 Teleport_Timer;

    uint32 CheckBrainWash_Timer;

    uint64 HexGuid;
    float HexAggro;

    std::list<uint64> BrainWashedPlayerGuid;
    std::list<float> BrainWashedPlayerAggro;
    std::list<ObjectGuid> summonedCreatures;

    void DespawnAllSummons()
    {
        while (!summonedCreatures.empty())
        {
            ObjectGuid const& g = *(summonedCreatures.begin());
            summonedCreatures.pop_front();
            switch (g.GetEntry())
            {
                case NPC_BRAINWASHTOTEM:
                case NPC_SHADE:
                case NPC_POWERFULLHEALINGWARD:
                    if (Creature* c = m_creature->GetMap()->GetCreature(g))
                        c->AddObjectToRemoveList();
                    break;
            }
        }
        while (Creature* Crea = m_creature->FindNearestCreature(NPC_BRAINWASHTOTEM, 150.0f))
            Crea->DisappearAndDie();
    }
    void JustSummoned(Creature* c)
    {
        summonedCreatures.push_back(c->GetObjectGuid());
        ScriptedAI::JustSummoned(c);
    }
    void Reset()
    {
        BrainWashTotem_Timer    = 22000;
        HealingWard_Timer       = 12000;
        Hex_Timer               = 8000;
        Delusions_Timer         = 10000;
        Teleport_Timer          = 5000;
        CheckBrainWash_Timer    = 1000;

        HexGuid                 = 0;
        HexAggro                = 0;

        BrainWashedPlayerGuid.clear();
        BrainWashedPlayerAggro.clear();

        DespawnAllSummons();
    }

    void SpellHitTarget(Unit* pCaster, const SpellEntry* pSpell)
    {
        if (pSpell->Id == SPELL_HEX)
        {
            if (pCaster->GetTypeId() != TYPEID_PLAYER)
                return;

            HexGuid = pCaster->GetGUID();
            HexAggro = m_creature->getThreatManager().getThreat(pCaster);

            m_creature->getThreatManager().modifyThreatPercent(pCaster, -100);
        }
    }

    void JustDied(Unit* pKiller)
    {
        DespawnAllSummons();
    }

    void Aggro(Unit *who)
    {
        DoScriptText(SAY_AGGRO, m_creature);
    }

    void DoSummonSkeleton(float addx, float addy, Unit* initialTarget)
    {
        Creature* Skeleton = m_creature->SummonCreature(14826, -11583.7783f + addx, -1249.4278f + addy, 77.5471f, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15000);
        if (Skeleton && Skeleton->AI())
            Skeleton->AI()->AttackStart(initialTarget);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (HexGuid)
        {
            Player* hexPlayer = m_creature->GetMap()->GetPlayer(HexGuid);
            if (hexPlayer && !hexPlayer->HasAura(SPELL_HEX))
            {
                m_creature->getThreatManager().addThreatDirectly(hexPlayer, HexAggro);
                HexGuid = 0;
                HexAggro = 0;
            }
            else if (!hexPlayer)
                HexGuid = HexAggro = 0;
        }

        //BrainWashTotem_Timer
        if (BrainWashTotem_Timer < diff)
        {
            // Il faut au moins 2 personnes dans le threatlist de Jin'do, sinon il va reset !
            if (m_creature->SelectAttackingTarget(ATTACKING_TARGET_TOPAGGRO, 1))
                if (DoCastSpellIfCan(m_creature, SPELL_BRAINWASHTOTEM) == CAST_OK)
                    BrainWashTotem_Timer = urand(18000, 22000);
        }
        else
            BrainWashTotem_Timer -= diff;

        // Ustaag : gestion de l'aggro des joueurs MC
        if (!BrainWashedPlayerGuid.empty() && !BrainWashedPlayerAggro.empty())
        {
            if (CheckBrainWash_Timer < diff)
            {
                uint64 PlayerBrainWashedGuid = 0;
                bool PlayerDead = false;
                bool AuraRemoved = false;

                uint32 var = 0;
                for (std::list<uint64>::const_iterator itr = BrainWashedPlayerGuid.begin(); itr != BrainWashedPlayerGuid.end(); itr++)
                {
                    if (Player* pTarget = m_creature->GetMap()->GetPlayer((*itr)))
                    {
                        if ((pTarget->isAlive() && !pTarget->HasAura(24261, EFFECT_INDEX_0)) || pTarget->isDead()) // SPELL_BRAINWASH 24261
                        {
                            PlayerBrainWashedGuid = *itr;
                            if (pTarget->isDead())
                                PlayerDead = true;
                            else
                                AuraRemoved = true;
                            break;
                        }
                        ++var;
                    }
                }

                if (PlayerDead || AuraRemoved)
                {
                    std::list<float>::const_iterator Iter = BrainWashedPlayerAggro.begin();
                    for (uint32 i = 0; i < var; ++i)
                        ++Iter;
                    Player* playerBrainWashed = m_creature->GetMap()->GetPlayer(PlayerBrainWashedGuid);
                    if (AuraRemoved)
                    {
                        m_creature->getThreatManager().modifyThreatPercent(playerBrainWashed, -100);
                        m_creature->getThreatManager().addThreatDirectly(playerBrainWashed, (*Iter));
                    }

                    BrainWashedPlayerGuid.remove(PlayerBrainWashedGuid);
                    BrainWashedPlayerAggro.remove(*Iter);
                }
            }
            else
                CheckBrainWash_Timer -= diff;
        }

        //HealingWard_Timer
        if (HealingWard_Timer < diff)
        {
            if (!m_creature->FindNearestCreature(NPC_POWERFULLHEALINGWARD, 200.0f))
            {
                //DoCastSpellIfCan(m_creature, SPELL_POWERFULLHEALINGWARD);
                m_creature->SummonCreature(NPC_POWERFULLHEALINGWARD, m_creature->GetPositionX() + 3, m_creature->GetPositionY() - 2, m_creature->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15000);
                HealingWard_Timer = urand(18000, 22000);
            }
        }
        else
            HealingWard_Timer -= diff;

        //Hex_Timer
        if (Hex_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_HEX) == CAST_OK)
                Hex_Timer = urand(12000, 20000);
        }
        else
            Hex_Timer -= diff;

        //Casting the delusion curse with a shade. So shade will attack the same target with the curse.
        if (Delusions_Timer < diff)
        {
            if (Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0, nullptr, SELECT_FLAG_PLAYER))
            {
                if (DoCastSpellIfCan(target, SPELL_DELUSIONSOFJINDO) == CAST_OK)
                {
                    Creature *Shade = m_creature->SummonCreature(NPC_SHADE, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15000);
                    if (Shade)
                    {
                        // Ajoute les ennemis du boss dans sa liste de menace.
                        Shade->AddThreatsOf(m_creature);
                        Shade->AI()->AttackStart(target);
                    }
                    Delusions_Timer = urand(4000, 12000);
                }
            }

        }
        else Delusions_Timer -= diff;

        //Teleporting a random gamer and spawning 9 skeletons that will attack this gamer
        if (Teleport_Timer < diff)
        {
            Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0);
            if (target && target->GetTypeId() == TYPEID_PLAYER)
                DoTeleportPlayer(target, -11583.7783f, -1249.4278f, 77.5471f, 4.745f);

            Teleport_Timer = urand(15000, 23000);
        }
        else
            Teleport_Timer -= diff;

        DoMeleeAttackIfReady();
    }
};

//Shade of Jindo
struct mob_shade_of_jindoAI : public ScriptedAI
{
    mob_shade_of_jindoAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;

    uint32 ShadowShock_Timer;

    void Reset()
    {
        ShadowShock_Timer = 1000;
        m_creature->AddAura(SPELL_INVISIBLE, ADD_AURA_PERMANENT);
    }

    void DamageTaken(Unit *done_by, uint32 &damage)
    {
        if (done_by && !done_by->HasAura(SPELL_DELUSIONSOFJINDO))
            damage = 0;
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (m_creature->getVictim()->HasAura(SPELL_HEX))
            m_creature->getThreatManager().modifyThreatPercent(m_creature->getVictim(), -100);

        //ShadowShock_Timer
        if (ShadowShock_Timer < diff)
        {
            DoCastSpellIfCan(m_creature->getVictim(), SPELL_SHADOWSHOCK);
            ShadowShock_Timer = 2000;
        }
        else
            ShadowShock_Timer -= diff;

        DoMeleeAttackIfReady();
    }

    bool IsVisibleFor(Unit const* pOther, bool &isVisible) const
    {
        if (pOther->IsPlayer() && pOther->ToPlayer()->isGameMaster())
        {
            isVisible = true;
            return true;
        }
        if (!pOther->HasAura(SPELL_DELUSIONSOFJINDO))
        {
            isVisible = false;
            return true;
        }
        else
        {
            isVisible = true;
            return true;
        }
    }
};

// Brain Wash Totem
#define SPELL_BRAINWASH 24261

struct mob_brain_wash_totemAI : public ScriptedAI
{
    mob_brain_wash_totemAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;

    uint64 PlayerMCGuid;
    uint32 CheckTimer;

    void Reset()
    {
        PlayerMCGuid = 0;
        CheckTimer = 0;

        m_creature->AddAura(23198, ADD_AURA_PERMANENT); // Avoidance : pas touché par les AOE
        m_creature->addUnitState(UNIT_STAT_ROOT);
        SetCombatMovement(false);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim() || !m_pInstance)
        {
            m_creature->DisappearAndDie();
            return;
        }

        m_creature->addUnitState(UNIT_STAT_ROOT);

        if (!m_creature->isInCombat())
            m_creature->SetInCombatWithZone();

        // Deja en train de CM le joueur
        if (PlayerMCGuid)
            if (Player* pPlayer = m_creature->GetMap()->GetPlayer(PlayerMCGuid))
                if (pPlayer->isAlive() && pPlayer->HasAura(24261, EFFECT_INDEX_0))
                    return;


        if (Creature* pJindo = m_creature->GetMap()->GetCreature(m_pInstance->GetData64(DATA_JINDO)))
        {
            // Il faut au moins 2 personnes dans le threatlist de Jin'do, sinon il va reset !
            if (pJindo->SelectAttackingTarget(ATTACKING_TARGET_TOPAGGRO, 1))
            {
                Unit* pTarget = pJindo ? pJindo->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0) : NULL;
                if (pTarget && pTarget->isAlive() && pTarget->IsPlayer() && !pTarget->HasAura(SPELL_HEX) && !pTarget->HasAura(SPELL_BRAINWASH))
                {
                    if (boss_jindoAI* pJindoAI = dynamic_cast<boss_jindoAI*>(pJindo->AI()))
                    {
                        pJindoAI->BrainWashedPlayerGuid.push_back(pTarget->GetGUID());
                        pJindoAI->BrainWashedPlayerAggro.push_back(pJindo->getThreatManager().getThreat(pTarget));
                        if (DoCastSpellIfCan(pTarget, SPELL_BRAINWASH) == CAST_OK)
                        {
                            PlayerMCGuid = pTarget->GetGUID();
                            pJindoAI->CheckBrainWash_Timer = 1000;
                        }
                    }
                }
            }
        }
    }
};

CreatureAI* GetAI_boss_jindo(Creature* pCreature)
{
    return new boss_jindoAI(pCreature);
}

CreatureAI* GetAI_mob_shade_of_jindo(Creature* pCreature)
{
    return new mob_shade_of_jindoAI(pCreature);
}

CreatureAI* GetAI_mob_brain_wash(Creature* pCreature)
{
    return new mob_brain_wash_totemAI(pCreature);
}

// UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'mob_brain_wash' WHERE `entry` = 15112;
void AddSC_boss_jindo()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_jindo";
    newscript->GetAI = &GetAI_boss_jindo;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_shade_of_jindo";
    newscript->GetAI = &GetAI_mob_shade_of_jindo;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_brain_wash";
    newscript->GetAI = &GetAI_mob_brain_wash;
    newscript->RegisterSelf();
}
