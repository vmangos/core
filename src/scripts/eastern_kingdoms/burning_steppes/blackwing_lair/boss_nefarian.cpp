/* Copyright (C) 2006 - 2011 ScriptDev2 <http://www.scriptdev2.com/>
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
#include "blackwing_lair.h"

enum Nefarian : uint32
{
    SAY_AGGRO                   = 9973,
    SAY_SHADOWFLAME             = 9974,
    SAY_RAISE_SKELETONS         = 9883,
    SAY_SLAY                    = 9972,
    SAY_DEATH                   = 9971,

    SAY_MAGE                    = 9850,
    SAY_WARRIOR                 = 9855,
    SAY_DRUID                   = 9851,
    SAY_PRIEST                  = 9848,
    SAY_PALADIN                 = 9853,
    SAY_SHAMAN                  = 9854,
    SAY_WARLOCK                 = 9852,
    SAY_HUNTER                  = 9849,
    SAY_ROGUE                   = 9856,

    SPELL_SHADOWFLAME_PASSIV    = 22992,
    SPELL_SHADOWFLAME           = 22539,
    SPELL_BELLOWING_ROAR        = 22686,
    SPELL_VEIL_OF_SHADOW        = 22687, // old spell id 7068 -> wrong
    SPELL_CLEAVE                = 20691,
    SPELL_TAIL_LASH             = 23364,
    SPELL_BONE_CONTRUST         = 23363,
    SPELL_RAISE_DRAKONID        = 23362,

    SPELL_MAGE                  = 23410, // wild magic
    SPELL_WARRIOR               = 23397, // beserk
    SPELL_DRUID                 = 23398, // cat form
    SPELL_PRIEST                = 23401, // corrupted healing
    SPELL_PALADIN               = 23418, // syphon blessing
    SPELL_SHAMAN                = 23425, // totems
    SPELL_CORRUPTED_TOTEM       = 23424,
    SPELL_WARLOCK               = 23427, // infernals -> should trigger 23426
    SPELL_HUNTER                = 23436, // bow broke
    SPELL_ROGUE                 = 23414, // Paralise

    SPELL_POLYMORPH             = 23603,
    SPELL_HOVER                 = 17131,

    SPELL_WINDFURY_TOTEM_PASSIVE         = 10612,
    SPELL_WINDFURY_TOTEM                 = 10610,
    NPC_CORRUPTED_INFERNAL               = 14668,
    NPC_CORRUPTED_STONESKIN_TOTEM_VI     = 14663,
    NPC_CORRUPTED_HEALING_STREAM_TOTEM_V = 14664,
    NPC_CORRUPTED_WINDFURY_TOTEM_III     = 14666,
    NPC_CORRUPTED_FIRE_NOVA_TOTEM_V      = 14662,
};

struct ClassCallInfo
{
    ClassCallInfo(uint8 uiClass, int32 uiYell) : m_uiClass(uiClass), m_uiYell(uiYell) {}
    uint8 m_uiClass;
    int32 m_uiYell;
};

struct boss_nefarianAI : ScriptedAI
{
    explicit boss_nefarianAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = static_cast<ScriptedInstance*>(pCreature->GetInstanceData());

        boss_nefarianAI::Reset();
    }

    ScriptedInstance* m_pInstance;

    uint32 m_uiShadowFlameTimer;
    uint32 m_uiBellowingRoarTimer;
    uint32 m_uiVeilOfShadowTimer;
    uint32 m_uiCleaveTimer;
    uint32 m_uiTailLashTimer;
    uint32 m_uiClassCallTimer;
    bool m_bPhase3;
    uint8 m_uiTransitionStage;
    uint32 m_uiTransitionTimer;
    bool m_bTransitionDone;
    bool m_bWarriorStance;

    std::vector<ClassCallInfo> m_vPossibleCalls;

    void Reset() override
    {
        m_uiShadowFlameTimer    = urand(18000, 25000);
        m_uiBellowingRoarTimer  = urand(25000, 30000);
        m_uiVeilOfShadowTimer   = 15000;
        m_uiCleaveTimer         = urand(7000, 10000);
        m_uiTailLashTimer       = 10000;
        m_uiClassCallTimer      = urand(25000, 35000);
        m_bPhase3               = false;
        m_bTransitionDone       = m_creature->GetMapId() != MAP_BLACKWING_LAIR;
        m_bWarriorStance        = false;
        m_uiTransitionStage     = 0;
        m_uiTransitionTimer     = 100;

        m_vPossibleCalls.clear();

        m_vPossibleCalls.emplace_back(CLASS_WARRIOR,  SAY_WARRIOR);
        m_vPossibleCalls.emplace_back(CLASS_PALADIN,  SAY_PALADIN);
        m_vPossibleCalls.emplace_back(CLASS_HUNTER,   SAY_HUNTER);
        m_vPossibleCalls.emplace_back(CLASS_ROGUE,    SAY_ROGUE);
        m_vPossibleCalls.emplace_back(CLASS_PRIEST,   SAY_PRIEST);
        m_vPossibleCalls.emplace_back(CLASS_SHAMAN,   SAY_SHAMAN);
        m_vPossibleCalls.emplace_back(CLASS_MAGE,     SAY_MAGE);
        m_vPossibleCalls.emplace_back(CLASS_WARLOCK,  SAY_WARLOCK);
        m_vPossibleCalls.emplace_back(CLASS_DRUID,    SAY_DRUID);
    }

    void KilledUnit(Unit* pVictim) override
    {
        if (urand(0, 4))
            return;

        DoScriptText(SAY_SLAY, m_creature, pVictim);
    }

    void JustDied(Unit* /*pKiller*/) override
    {
        DoScriptText(SAY_DEATH, m_creature);

        if (m_pInstance)
            m_pInstance->SetData(TYPE_NEFARIAN, DONE);
    }

    void EnterEvadeMode() override
    {
        if (m_pInstance)
        {
            m_pInstance->SetData(TYPE_NEFARIAN, FAIL);
            if (Creature* pNefarius = m_creature->GetMap()->GetCreature(m_pInstance->GetData64(DATA_NEFARIUS_GUID)))
                pNefarius->AI()->EnterEvadeMode();
        }
        m_creature->DeleteLater();
    }

    void JustSummoned(Creature* pSummoned) override
    {
        pSummoned->SetInCombatWithZone();
    }

    void MovementInform(uint32 uiType, uint32 uiPointId) override
    {
        if (uiType != POINT_MOTION_TYPE)
            return;

        switch (uiPointId)
        {
            case 1:
                m_creature->GetMotionMaster()->MovePoint(2, -7495.964f, -1252.402f, 476.795f, MOVE_FORCE_DESTINATION, 17.0f);
                m_uiTransitionTimer = 0;
                break;
            case 2:
                m_creature->GetMotionMaster()->MoveIdle();
                m_uiTransitionTimer = 100;
                break;
            default:
                break;
        }
    }

    bool HandleClassCall(uint8 ClassCalled)
    {
        if (!ClassCalled)
            return false;

        Map::PlayerList const& players = m_creature->GetMap()->GetPlayers();
        if (players.isEmpty())
            return false;

        bool bClassFound = false;
        for (const auto& itr : players)
        {
            Player* pPlayer = itr.getSource();
            if (pPlayer &&
                pPlayer->IsAlive() &&
                !pPlayer->IsGameMaster())
            {
                if (pPlayer->GetClass() == ClassCalled)
                {
                    bClassFound = true;
                    switch (ClassCalled)
                    {
                        case CLASS_WARRIOR:
                        {
                            pPlayer->AddAura(SPELL_WARRIOR);
                            break;
                        }
                        case CLASS_PALADIN:
                        {
                            pPlayer->CastSpell(pPlayer, SPELL_PALADIN, true);
                            break;
                        }
                        case CLASS_HUNTER:
                        {
                            pPlayer->CastSpell(pPlayer, SPELL_HUNTER, true);
                            break;
                        }
                        case CLASS_ROGUE:
                        {
                            pPlayer->CastSpell(pPlayer, SPELL_ROGUE, true);
                            break;
                        }
                        case CLASS_PRIEST:
                        {
                            pPlayer->AddAura(SPELL_PRIEST);
                            break;
                        }
                        case CLASS_SHAMAN:
                        {
                            pPlayer->AddAura(SPELL_SHAMAN);
                            break;
                        }
                        case CLASS_MAGE:
                        {
                            pPlayer->CastSpell(pPlayer, SPELL_MAGE, true);
                            break;
                        }
                        case CLASS_WARLOCK:
                        {
                            pPlayer->CastSpell(pPlayer, SPELL_WARLOCK, true);
                            break;
                        }
                        case CLASS_DRUID:
                        {
                            pPlayer->AddAura(SPELL_DRUID);
                            break;
                        }
                    }
                }
            }
        }
        m_bWarriorStance = bClassFound && ClassCalled == CLASS_WARRIOR;

        return bClassFound;
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (m_uiTransitionTimer && !m_bTransitionDone)
        {
            if (m_uiTransitionTimer <= uiDiff)
            {
                switch (m_uiTransitionStage)
                {
                    case 0:
                        SetCombatMovement(false);
                        m_creature->SetInCombatWithZone();
                        m_creature->SetFly(true);

                        DoScriptText(SAY_AGGRO, m_creature);

                        m_creature->GetMotionMaster()->MovePoint(1, -7449.145f, -1320.647f, 476.795f);
                        m_creature->MonsterMoveWithSpeed(-7449.145f, -1320.647f, 476.795f, -10.0f, 17, uint32(MOVE_FORCE_DESTINATION));
                        m_uiTransitionTimer = 0;
                        break;
                    case 1:
                        m_creature->SetFly(false);
                        DoScriptText(SAY_SHADOWFLAME, m_creature);
                        m_creature->HandleEmote(EMOTE_ONESHOT_LAND);
                        m_uiTransitionTimer = 1000;
                        break;
                    case 2:
                        m_creature->SetWalk(true);
                        m_creature->RemoveAurasDueToSpell(SPELL_HOVER);
                        if (Unit* pTarget = m_creature->GetVictim())
                        {
                            m_creature->GetMotionMaster()->MoveChase(pTarget);
                            SetCombatMovement(true);
                            m_creature->CastSpell(pTarget, SPELL_SHADOWFLAME_PASSIV, true);
                        }
                        m_bTransitionDone = true;
                        break;
                }
                ++m_uiTransitionStage;
            }
            else
                m_uiTransitionTimer -= uiDiff;
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim() || !m_bTransitionDone)
            return;

        // ShadowFlame_Timer
        if (m_uiShadowFlameTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_SHADOWFLAME) == CAST_OK)
                m_uiShadowFlameTimer = urand(18000, 25000);
        }
        else
            m_uiShadowFlameTimer -= uiDiff;

        // BellowingRoar_Timer
        if (m_uiBellowingRoarTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_BELLOWING_ROAR) == CAST_OK)
                m_uiBellowingRoarTimer = urand(25000, 30000);
        }
        else
            m_uiBellowingRoarTimer -= uiDiff;

        // VeilOfShadow_Timer
        if (m_uiVeilOfShadowTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_VEIL_OF_SHADOW) == CAST_OK)
                m_uiVeilOfShadowTimer = urand(10000, 15000);
        }
        else
            m_uiVeilOfShadowTimer -= uiDiff;

        // Cleave_Timer
        if (m_uiCleaveTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_CLEAVE) == CAST_OK)
                m_uiCleaveTimer = urand(7000, 10000);
        }
        else
            m_uiCleaveTimer -= uiDiff;

        // TailLash_Timerm_uiWindfuryTimer
        if (m_uiTailLashTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_TAIL_LASH) == CAST_OK)
                m_uiTailLashTimer = urand(4000, 8000);
        }
        else
            m_uiTailLashTimer -= uiDiff;

        // ClassCall_Timer
        if (m_uiClassCallTimer < uiDiff)
        {
            //Cast a random class call
            //On official it is based on what classes are currently on the hostil list
            //but we can't do that yet so just randomly call one
            // We do it now
            if (!m_vPossibleCalls.empty())
            {
                uint8 uiRandClass = urand(0, m_vPossibleCalls.size() - 1);
                if (HandleClassCall(m_vPossibleCalls[uiRandClass].m_uiClass))
                {
                    DoScriptText(m_vPossibleCalls[uiRandClass].m_uiYell, m_creature);
                    m_uiClassCallTimer = urand(25000, 35000);
                }
                else
                    m_vPossibleCalls.erase(m_vPossibleCalls.begin() + uiRandClass);
            }
        }
        else
            m_uiClassCallTimer -= uiDiff;

        // Phase3 begins when we are below X health
        if (!m_bPhase3 && m_creature->GetHealthPercent() < 20.0f)
        {
            m_bPhase3 = true;
            DoScriptText(SAY_RAISE_SKELETONS, m_creature);
            m_creature->CastSpell(m_creature, SPELL_RAISE_DRAKONID, true);
        }

        if (DoMeleeAttackIfReady())
            if (m_creature->HasAura(SPELL_WINDFURY_TOTEM_PASSIVE) && !m_creature->HasAura(SPELL_WINDFURY_TOTEM))
                if (!urand(0, 4))
                    m_creature->CastSpell(m_creature, SPELL_WINDFURY_TOTEM, true);
    }
};

CreatureAI* GetAI_boss_nefarian(Creature* pCreature)
{
    return new boss_nefarianAI(pCreature);
}

enum
{
    SPELL_ROOT_SELF      = 17507,
    SPELL_AVOIDANCE      = 23198,
    SPELL_STONESKIN      = 10405,
    SPELL_HEALING_STREAM = 10461,
};

struct npc_corrupted_totemAI : ScriptedAI
{
    explicit npc_corrupted_totemAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_uiCreatureEntry = pCreature->GetEntry();

        uint32 HP = urand(200, 2000);
        pCreature->SetMaxHealth(HP);
        pCreature->SetHealth(HP);

        m_bAuraAdded = false;

        npc_corrupted_totemAI::Reset();
    }

    uint32 m_uiCreatureEntry;
    uint32 m_uiCheckTimer;
    bool m_bAuraAdded;

    void Reset() override
    {
        m_creature->AddUnitState(UNIT_STATE_ROOT);

        if (!m_creature->HasAura(SPELL_ROOT_SELF))
            m_creature->AddAura(SPELL_ROOT_SELF);

        m_creature->AddAura(SPELL_AVOIDANCE, ADD_AURA_PERMANENT); // Avoidance: not affected by AoE
        m_uiCheckTimer = 1000;
    }

    void Aggro(Unit* /*pWho*/) override
    {
        m_creature->SetInCombatWithZone();
    }

    void JustDied(Unit* /*pKiller*/) override
    {
        switch (m_uiCreatureEntry)
        {
            case NPC_CORRUPTED_STONESKIN_TOTEM_VI:
                SetAura(false, SPELL_STONESKIN);
                break;
            case NPC_CORRUPTED_HEALING_STREAM_TOTEM_V:
                SetAura(false, SPELL_HEALING_STREAM);
                break;
            case NPC_CORRUPTED_WINDFURY_TOTEM_III:
                SetAura(false, SPELL_WINDFURY_TOTEM_PASSIVE);
                break;
        }
    }

    void SetAura(bool on, uint32 uiSpellId) const
    {
        std::vector<uint32> mobsEntries;
        std::vector<uint32>::iterator entriesIt;
        mobsEntries.push_back(NPC_NEFARIAN);
        mobsEntries.push_back(NPC_BONE_CONSTRUCT);
        mobsEntries.push_back(NPC_BRONZE_DRAKANOID);
        mobsEntries.push_back(NPC_BLUE_DRAKANOID);
        mobsEntries.push_back(NPC_RED_DRAKANOID);
        mobsEntries.push_back(NPC_GREEN_DRAKANOID);
        mobsEntries.push_back(NPC_BLACK_DRAKANOID);
        mobsEntries.push_back(NPC_CHROMATIC_DRAKANOID);

        for (entriesIt = mobsEntries.begin(); entriesIt != mobsEntries.end(); ++entriesIt)
        {
            std::list<Creature*> tmpMobsList;
            GetCreatureListWithEntryInGrid(tmpMobsList, m_creature, *entriesIt, 55.0f);
            while (!tmpMobsList.empty())
            {
                Creature* curr = tmpMobsList.front();
                if (!curr)
                    return;

                tmpMobsList.pop_front();

                if (!curr->IsAlive())
                    continue;

                if (on && m_creature->IsAlive())
                {
                    if (m_creature->IsWithinDistInMap(curr, 40.0f))
                    {
                        if (!curr->HasAura(uiSpellId))
                        {
                            int damage = 0;
                            switch (uiSpellId)
                            {
                                case SPELL_STONESKIN:
                                {
                                    damage = -310;
                                    break; // Stoneskin : base -31
                                }
                                case SPELL_HEALING_STREAM:
                                {
                                    damage = 14000;
                                    break; // Healing Stream : base 14
                                }
                            }

                            if (damage)
                                curr->CastCustomSpell(curr, uiSpellId, damage, {}, {}, true);
                            else
                                curr->AddAura(uiSpellId);
                        }
                    }
                    else
                    {
                        if (curr->HasAura(uiSpellId))
                            curr->RemoveAurasDueToSpell(uiSpellId);
                    }
                }
                else
                    curr->RemoveAurasDueToSpell(uiSpellId);
            }
        }
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (!m_creature->HasAura(SPELL_ROOT_SELF))
            m_creature->AddAura(SPELL_ROOT_SELF);

        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        uint32 addAuraEntry = 0;
        switch (m_uiCreatureEntry)
        {
            case NPC_CORRUPTED_FIRE_NOVA_TOTEM_V:
                if (!m_bAuraAdded)
                {
                    m_creature->AddAura(11311);  // Fire Nova
                    m_bAuraAdded = true;
                    m_creature->DeleteLater();
                    return;
                }
                break;
            case NPC_CORRUPTED_STONESKIN_TOTEM_VI:
                addAuraEntry = SPELL_STONESKIN; // Stoneskin -30 dmg really ???
                break;
            case NPC_CORRUPTED_HEALING_STREAM_TOTEM_V:
                addAuraEntry = SPELL_HEALING_STREAM; // Healing Stream +14 hp really ???
                break;
            case NPC_CORRUPTED_WINDFURY_TOTEM_III:
                addAuraEntry = SPELL_WINDFURY_TOTEM_PASSIVE;
                break;
        }
        if (!addAuraEntry)
            return;

        if (m_uiCheckTimer < uiDiff)
        {
            m_uiCheckTimer = 1000; // Add immune to AoE + fear
            SetAura(true, addAuraEntry); // Stoneskin -30 dmg really ???
        }
        else
            m_uiCheckTimer -= uiDiff;
    }
};

CreatureAI* GetAI_npc_corrupted_totem(Creature* pCreature)
{
    return new npc_corrupted_totemAI(pCreature);
}

// 23424 - Nefarian Class Call Shaman Corrupted Totems
struct NefarianCorruptedTotemsScript : SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0 && spell->m_casterUnit)
        {
            uint32 spellId = PickRandomValue(23419, 23420, 23422, 23423);
            spell->m_casterUnit->CastSpell(spell->m_casterUnit, spellId, true);
        }
        return true;
    }
};

SpellScript* GetScript_NefarianCorruptedTotems(SpellEntry const*)
{
    return new NefarianCorruptedTotemsScript();
}

// 22992 - Shadow Flame
// When Nefarian lands at the start of Phase 2 of his encounter he will use an AoE Shadowflame.
// This spell does about 1000 initial shadow damage, but applies a deadly DoT if an Onyxia Scale Cloak is not equipped.
// Players can avoid getting hit by hiding behind Nefarians throne.
struct NefarianShadowFlamePassiveScript : SpellScript
{
    static constexpr uint32 SPELL_SHADOWFLAME_TRIGGER = 22986;

    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0 && spell->m_casterUnit && spell->GetUnitTarget())
            spell->m_casterUnit->CastSpell(spell->GetUnitTarget(), SPELL_SHADOWFLAME_TRIGGER, true);
        return true;
    }
};

SpellScript* GetScript_NefarianShadowFlamePassive(SpellEntry const*)
{
    return new NefarianShadowFlamePassiveScript();
}

// 23427 - Nefarian Class Call Warlock
// Each Warlock will summon 2 hostile Corrupted Infernals.
// They will stun and do damage to the Warlocks and anyone near them.
struct NefarianClassCallWarlockScript : SpellScript
{
    static constexpr uint32 SPELL_SUMMON_INFERNALS = 23426;

    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx != EFFECT_INDEX_0)
            return true;

        Unit* target = spell->GetUnitTarget();
        if (!target)
            return true;

        // Each Warlock summons 2 Corrupted Infernals
        target->CastSpell(target, SPELL_SUMMON_INFERNALS, true);
        target->CastSpell(target, SPELL_SUMMON_INFERNALS, true);
        return true;
    }
};

SpellScript* GetScript_NefarianClassCallWarlock(SpellEntry const*)
{
    return new NefarianClassCallWarlockScript();
}

// 23414 - Nefarian Class Call Rogue
// Paralyze and teleport player to random position near Nefarian
struct NefarianClassCallRogueScript : SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx != EFFECT_INDEX_0)
            return true;

        Unit* caster = spell->m_casterUnit;
        Unit* target = spell->GetUnitTarget();
        if (!caster || !target)
            return true;

        // Teleport player to a random position near caster (Nefarian)
        // Use GetFirstCollisionPosition to avoid teleporting into walls/obstacles
        if (Player* player = target->ToPlayer())
        {
            // Get a random angle around Nefarian
            float angle = frand(0, M_PI_F * 2);
            Position pos;
            caster->GetFirstCollisionPosition(pos, 5.0f, angle);
            WorldLocation loc;
            loc.x = pos.x;
            loc.y = pos.y;
            loc.z = pos.z;
            loc.o = angle - M_PI_F;
            loc.mapId = caster->GetMapId();
            player->TeleportTo(loc);
        }
        return true;
    }
};

SpellScript* GetScript_NefarianClassCallRogue(SpellEntry const*)
{
    return new NefarianClassCallRogueScript();
}

// 23410 - Nefarian Class Call Mage - Wild Magic
// Randomly cast Wild Polymorph on raid members, polymorphing them
struct NefarianClassCallMageAuraScript : public AuraScript
{
    void OnBeforeApply(Aura* aura, bool apply) final
    {
        if (apply && aura->GetEffIndex() == EFFECT_INDEX_0)
        {
            aura->SetPeriodicTimer(5 * IN_MILLISECONDS);
        }
    }

    void OnPeriodicTickEnd(Aura* aura) final
    {
        Unit* mage = aura->GetTarget();
        if (!mage || !mage->IsPlayer())
            return;

        Player* pMage = mage->ToPlayer();
        if (!pMage->IsAlive() ||
            pMage->HasAura(SPELL_POLYMORPH))
            return;

        Map* pMap = pMage->GetMap();
        if (!pMap)
            return;

        // Use GetMap()->GetPlayers() instead of group to prevent exploit where mage
        // could leave group to avoid casting polymorph on members
        Map::PlayerList const& players = pMap->GetPlayers();
        if (players.isEmpty())
            return;

        std::vector<Player*> possibleTargets;
        for (const auto& itr : players)
        {
            Player* pPlayer = itr.getSource();
            if (!pPlayer ||
                !pPlayer->IsAlive() ||
                !pPlayer->IsInWorld() ||
                // pPlayer == pMage || // Skip self
                pPlayer->HasAura(SPELL_POLYMORPH) ||
                !pMage->IsWithinDist(pPlayer, 60.0f))
                continue;

            possibleTargets.push_back(pPlayer);
        }

        if (possibleTargets.empty())
            return;

        Player* polymorphTarget = possibleTargets[urand(0, possibleTargets.size() - 1)];
        if (polymorphTarget)
        {
            pMage->InterruptNonMeleeSpells(false);
            pMage->CastSpell(polymorphTarget, SPELL_POLYMORPH, false);
        }
    }
};

AuraScript* GetScript_NefarianClassCallMage(SpellEntry const*)
{
    return new NefarianClassCallMageAuraScript();
}

// 23603 - Nefarian Class Call Mage - Polymorph (Transform Display-ID)
struct NefarianPolymorphAuraScript : public AuraScript
{
    void OnAfterApply(Aura* aura, bool apply) final
    {
        if (!apply)
            return;

        if (aura->GetEffIndex() != EFFECT_INDEX_1)
            return;

        Unit* target = aura->GetTarget();

        // Randomly select one of three display IDs for the polymorph transform
        uint32 display_id = 0;
        int rand = urand(0, 2);
        switch (rand)
        {
            case 0:
                display_id = 1060;
                break;
            case 1:
                display_id = 4473;
                break;
            case 2:
                display_id = 7898;
                break;
        }

        if (display_id)
        {
            target->SetDisplayId(display_id);
            target->SetTransformScale(1.0f);
        }
    }
};

AuraScript* GetScript_NefarianPolymorph(SpellEntry const*)
{
    return new NefarianPolymorphAuraScript();
}

void AddSC_boss_nefarian()
{
    Script* pNewScript;

    pNewScript = new Script;
    pNewScript->Name = "boss_nefarian";
    pNewScript->GetAI = &GetAI_boss_nefarian;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "npc_corrupted_totem";
    pNewScript->GetAI = &GetAI_npc_corrupted_totem;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "spell_nefarian_corrupted_totems";
    pNewScript->GetSpellScript = &GetScript_NefarianCorruptedTotems;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "spell_nefarian_shadow_flame_passive";
    pNewScript->GetSpellScript = &GetScript_NefarianShadowFlamePassive;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "spell_nefarian_class_call_warlock";
    pNewScript->GetSpellScript = &GetScript_NefarianClassCallWarlock;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "spell_nefarian_class_call_rogue";
    pNewScript->GetSpellScript = &GetScript_NefarianClassCallRogue;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "spell_nefarian_class_call_mage";
    pNewScript->GetAuraScript = &GetScript_NefarianClassCallMage;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "spell_nefarian_polymorph";
    pNewScript->GetAuraScript = &GetScript_NefarianPolymorph;
    pNewScript->RegisterSelf();
}
