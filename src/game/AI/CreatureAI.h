/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
 *
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

#ifndef MANGOS_CREATUREAI_H
#define MANGOS_CREATUREAI_H

#include "Common.h"
#include "Dynamic/ObjectRegistry.h"
#include "Dynamic/FactoryHolder.h"
#include "ObjectGuid.h"
#include "CreatureDefines.h"

class WorldObject;
class GameObject;
class Unit;
class Creature;
class Player;
class SpellCaster;
class SpellEntry;
class ChatHandler;
struct Loot;

#define TIME_INTERVAL_LOOK   5000
#define VISIBILITY_RANGE    10000

enum CanCastResult
{
    CAST_OK                     = 0,
    CAST_FAIL_IS_CASTING        = 1,
    CAST_FAIL_OTHER             = 2,
    CAST_FAIL_TOO_FAR           = 3,
    CAST_FAIL_TOO_CLOSE         = 4,
    CAST_FAIL_POWER             = 5,
    CAST_FAIL_STATE             = 6,
    CAST_FAIL_TARGET_AURA       = 7,
    CAST_FAIL_NOT_IN_LOS        = 8
};

struct CreatureAISpellsEntry : CreatureSpellsEntry
{
    uint32 cooldown;
    CreatureAISpellsEntry(CreatureSpellsEntry const& EntryStruct) : CreatureSpellsEntry(EntryStruct), cooldown(urand(EntryStruct.delayInitialMin, EntryStruct.delayInitialMax)) {}
};

class CreatureAI
{
    public:
        explicit CreatureAI(Creature* creature);

        virtual ~CreatureAI();
        virtual void OnRemoveFromWorld() {}

        virtual uint32 GetData(uint32 /*type*/) { return 0; }

        virtual void InformGuid(ObjectGuid const /*guid*/, uint32 /*type*/=0) {}
        virtual void DoAction(uint32 const /*type*/=0) {}
        virtual void DoAction(Unit* /*pUnit*/, uint32 /*type*/) {}

        ///== Information about AI ========================
        virtual void GetAIInformation(ChatHandler& /*reader*/) {}

        ///== Reactions At =================================

        // Called when an unit moves within visibility distance
        virtual void MoveInLineOfSight(Unit*) {}

        // Called for reaction at enter to combat if not in combat yet (enemy can be nullptr)
        virtual void EnterCombat(Unit* /*enemy*/) {}

        // Called for reaction at stopping attack at no attackers or targets
        virtual void EnterEvadeMode();

        // Called when leaving combat
        virtual void OnCombatStop();

        // Called at reaching home after evade
        virtual void JustReachedHome() {}

        // Called at any heal cast/item used (call non implemented)
        virtual void HealedBy(Unit* /*healer*/, uint32& /*amount_healed*/) {}

        // Called at any Damage to any victim (before damage apply)
        virtual void DamageDeal(Unit* /*done_to*/, uint32& /*damage*/) {}

        // Called at any Damage from any attacker (before damage apply)
        // Note: it for recalculation damage or special reaction at damage
        // for attack reaction use AttackedBy called for not DOT damage in Unit::DealDamage also
        virtual void DamageTaken(Unit* /*done_by*/, uint32& /*damage*/) {}

        // Called when the creature is killed
        virtual void JustDied(Unit*) {}

        // Called when the creature summon is killed
        virtual void SummonedCreatureJustDied(Creature* /*unit*/) {}

        // Called when a member of the creature's group is killed
        virtual void GroupMemberJustDied(Creature* /*unit*/, bool /*isLeader*/) {}

        // Called when the creature kills a unit
        virtual void KilledUnit(Unit*) {}

        // Called when owner of m_creature (if m_creature is PROTECTOR_PET) kills a unit
        virtual void OwnerKilledUnit(Unit*) {}

        // Called when the creature summon successfully other creature
        virtual void JustSummoned(Creature*) {}

        // Called when the creature summon successfully a gameobject
        virtual void JustSummoned(GameObject*) {}

        // Called when the creature summon despawn
        virtual void SummonedCreatureDespawn(Creature* /*unit*/) {}

        // Called when hit by a spell
        virtual void SpellHit(SpellCaster*, SpellEntry const*) {}

        // Called when spell hits creature's target
        virtual void SpellHitTarget(Unit*, SpellEntry const*) {}

        // Called when the creature is target of hostile action: swing, hostile spell landed, fear/etc)
        virtual void AttackedBy(Unit* attacker);

        // Called when creature is spawned or respawned (for reseting variables)
        virtual void JustRespawned();

        // Called at waypoint reached or point movement finished
        virtual void MovementInform(uint32 /*MovementType*/, uint32 /*Data*/) {}

        // Called if a temporary summoned of m_creature reach a move point
        virtual void SummonedMovementInform(Creature* /*summoned*/, uint32 /*motion_type*/, uint32 /*point_id*/) {}

        // Called at text emote receive from player
        virtual void ReceiveEmote(Player* /*pPlayer*/, uint32 /*text_emote*/) {}

        // Called only for pets
        virtual void OwnerAttackedBy(Unit* /*attacker*/) {}
        virtual void OwnerAttacked(Unit* /*target*/) {}

        ///== Triggered Actions Requested ==================

        // Called when creature attack expected (if creature can and no have current victim)
        // Note: for reaction at hostile action must be called AttackedBy function.
        virtual void AttackStart(Unit*) {}

        // Called at World update tick
        virtual void UpdateAI(uint32 const /*diff*/) {}

        // Like UpdateAI, but only when the creature is a dead corpse
        virtual void UpdateAI_corpse(uint32 const /*uiDiff*/) {}

        // Called by another script
        virtual void OnScriptEventHappened(uint32 /*uiEvent*/, uint32 /*uiData*/, WorldObject* /*pInvoker*/) {};

        ///== State checks =================================

        // called when the corpse of this creature gets removed
        virtual void CorpseRemoved(uint32& /*respawnDelay*/) {}

        // Is corpse looting allowed ?
        virtual bool CanBeLooted() const { return true; }

        // Called when filling loot table
        virtual bool FillLoot(Loot* loot, Player* looter) const { return false; }

        // Does creature chase its target.
        bool IsCombatMovementEnabled() const { return m_bCombatMovement; }

        // Does the creature melee attack.
        bool IsMeleeAttackEnabled() const { return m_bMeleeAttack; }

        // Triggers an alert when a Unit moves near stealth detection range.
        virtual void TriggerAlert(Unit const* who);

        // TrinityCore
        void DoCast(Unit* victim, uint32 spellId, bool triggered = false);
        void DoCastAOE(uint32 spellId, bool triggered = false);
        bool UpdateVictim();
        bool UpdateVictimWithGaze();
        void SetGazeOn(Unit* target);

        ///== Helper functions =============================

        // Will auto attack if the swing timer is ready.
        bool DoMeleeAttackIfReady();

        // Attempts to cast a spell and returns the result.
        CanCastResult DoCastSpellIfCan(Unit* pTarget, uint32 uiSpell, uint32 uiCastFlags = 0, ObjectGuid uiOriginalCasterGUID = ObjectGuid());

        // Helper functions for cast spell
        virtual CanCastResult CanCastSpell(Unit* pTarget, SpellEntry const* pSpell, bool isTriggered);

        // Clears any group/raid icons this creature may have
        void ClearTargetIcon();

        // Assigns a creature_spells list to the AI.
        void SetSpellsList(uint32 entry);
        void SetSpellsList(CreatureSpellsList const* pSpellsList);

        // Goes through the creature's spells list to update timers and cast spells.
        void UpdateSpellsList(uint32 const uiDiff);
        void DoSpellsListCasts(uint32 const uiDiff);

        // Enables or disables melee attacks.
        void SetMeleeAttack(bool enabled);

        // Enables or disabled combat movement.
        void SetCombatMovement(bool enabled);
        
        // Pointer to controlled by AI creature
        Creature* const m_creature;
        bool SwitchAiAtControl() const { return !m_bUseAiAtControl; }
        void SetUseAiAtControl(bool v) { m_bUseAiAtControl = v; }
    protected:
        ///== Fields =======================================
        bool   m_bUseAiAtControl;
        bool   m_bMeleeAttack;                                  // If we allow melee auto attack
        bool   m_bCombatMovement;                               // If we allow targeted movement gen (chasing target)
        uint32 m_uiCastingDelay;                                // Cooldown before updating spell list again
        uint32 m_uLastAlertTime;
        std::vector<CreatureAISpellsEntry> m_CreatureSpells;    // Contains the currently used creature_spells template
};

struct SelectableAI : FactoryHolder<CreatureAI>, Permissible<Creature>
{
    explicit SelectableAI(char const* id) : FactoryHolder<CreatureAI>(id) {}
};

template<class REAL_AI>
struct CreatureAIFactory : SelectableAI
{
    explicit CreatureAIFactory(char const* name) : SelectableAI(name) {}

    CreatureAI* Create(void*) const override;

    int Permit(Creature const* c) const override { return REAL_AI::Permissible(c); }
};

enum Permitions
{
    PERMIT_BASE_NO                 = -1,
    PERMIT_BASE_IDLE               = 1,
    PERMIT_BASE_REACTIVE           = 100,
    PERMIT_BASE_PROACTIVE          = 200,
    PERMIT_BASE_FACTION_SPECIFIC   = 400,
    PERMIT_BASE_SPECIAL            = 800
};

typedef FactoryHolder<CreatureAI> CreatureAICreator;
typedef FactoryHolder<CreatureAI>::FactoryHolderRegistry CreatureAIRegistry;
typedef FactoryHolder<CreatureAI>::FactoryHolderRepository CreatureAIRepository;
#endif
