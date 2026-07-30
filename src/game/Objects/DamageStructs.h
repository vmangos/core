/*
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

#ifndef _DAMAGE_STRUCTS_H
#define _DAMAGE_STRUCTS_H

#include "Common.h"
#include "SharedDefines.h"
#include "SpellDefines.h"
#include "ItemPrototype.h"

class Spell;
class SpellCaster;
class Unit;

// At least some values expected fixed and used in auras field, other custom
enum MeleeHitOutcome
{
    MELEE_HIT_EVADE = 0,
    MELEE_HIT_MISS = 1,
    MELEE_HIT_DODGE = 2,                                // used as misc in SPELL_AURA_IGNORE_COMBAT_RESULT
    MELEE_HIT_BLOCK = 3,                                // used as misc in SPELL_AURA_IGNORE_COMBAT_RESULT
    MELEE_HIT_PARRY = 4,                                // used as misc in SPELL_AURA_IGNORE_COMBAT_RESULT
    MELEE_HIT_GLANCING = 5,
    MELEE_HIT_CRIT = 6,
    MELEE_HIT_CRUSHING = 7,
    MELEE_HIT_NORMAL = 8,
    MELEE_HIT_BLOCK_CRIT = 9,
};

enum VictimState
{
    VICTIMSTATE_UNAFFECTED     = 0,                         // seen in relation with HITINFO_MISS
    VICTIMSTATE_NORMAL         = 1,
    VICTIMSTATE_DODGE          = 2,
    VICTIMSTATE_PARRY          = 3,
    VICTIMSTATE_INTERRUPT      = 4,
    VICTIMSTATE_BLOCKS         = 5,
    VICTIMSTATE_EVADES         = 6,
    VICTIMSTATE_IS_IMMUNE      = 7,
    VICTIMSTATE_DEFLECTS       = 8
};

inline VictimState SpellMissInfoToVictimState(SpellMissInfo missInfo)
{
    switch (missInfo)
    {
        case SPELL_MISS_NONE:
            return VICTIMSTATE_NORMAL;
        case SPELL_MISS_MISS:
            return VICTIMSTATE_UNAFFECTED;
        case SPELL_MISS_DODGE:
            return VICTIMSTATE_DODGE;
        case SPELL_MISS_PARRY:
            return VICTIMSTATE_PARRY;
        case SPELL_MISS_BLOCK:
            return VICTIMSTATE_BLOCKS;
        case SPELL_MISS_EVADE:
            return VICTIMSTATE_EVADES;
        case SPELL_MISS_IMMUNE:
        case SPELL_MISS_IMMUNE2:
            return VICTIMSTATE_IS_IMMUNE;
        case SPELL_MISS_DEFLECT:
            return VICTIMSTATE_DEFLECTS;
    }
    return VICTIMSTATE_UNAFFECTED;
}

enum HitInfo
{
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    HITINFO_NORMALSWING         = 0x00000000,
    HITINFO_DEBUG               = 0x00000001,               // 0
    HITINFO_AFFECTS_VICTIM      = 0x00000002,               // 1 no being hit animation on victim without it
    HITINFO_LEFTSWING           = 0x00000004,               // 2
    HITINFO_UNK3                = 0x00000008,               // 3
    HITINFO_MISS                = 0x00000010,               // 4
    HITINFO_ABSORB              = 0x00000020,               // 5 plays absorb sound
    HITINFO_RESIST              = 0x00000040,               // 6 resisted atleast some damage
    HITINFO_CRITICALHIT         = 0x00000080,               // 7
    HITINFO_UNK8                = 0x00000100,               // 8 seen in sniffs
    HITINFO_UNK9                = 0x00000200,               // 9 seen in sniffs
    HITINFO_UNK10               = 0x00000400,               // 10 seen in sniffs
    HITINFO_UNK11               = 0x00000800,               // 11 seen in sniffs
    HITINFO_NO_FLOATING_TEXT    = 0x00001000,               // 12 used with melee spells
    HITINFO_UNK13               = 0x00002000,               // 13 seen in sniffs
    HITINFO_GLANCING            = 0x00004000,               // 14
    HITINFO_CRUSHING            = 0x00008000,               // 15
    HITINFO_NOACTION            = 0x00010000,               // 16
    HITINFO_UNK17               = 0x00020000,               // 17 seen in sniffs
    HITINFO_UNK18               = 0x00040000,               // 18 seen in sniffs
    HITINFO_SWINGNOHITSOUND     = 0x00080000                // 19
#else
    HITINFO_NORMALSWING         = 0x00000000,
    HITINFO_MISS                = 0x00000001,               // 0
    HITINFO_AFFECTS_VICTIM      = 0x00000002,               // 1 no being hit animation on victim without it
    HITINFO_UNK2                = 0x00000004,               // 2 seen in sniffs
    HITINFO_CRITICALHIT         = 0x00000008,               // 3
    HITINFO_UNK4                = 0x00000010,               // 4 seen in sniffs
    HITINFO_UNK5                = 0x00000020,               // 5 seen in sniffs
    HITINFO_UNK6                = 0x00000040,               // 6 seen in sniffs
    HITINFO_UNK7                = 0x00000080,               // 7 seen in sniffs
    HITINFO_UNK8                = 0x00000100,               // 8
    HITINFO_LEFTSWING           = 0x00000200,               // 9
    HITINFO_UNK10               = 0x00000400,               // 10 seen in sniffs
    HITINFO_UNK11               = 0x00000800,               // 11 seen in sniffs
    HITINFO_NOACTION            = 0x00001000,               // 12
    HITINFO_DEBUG               = 0x00002000,               // 13
    HITINFO_UNK14               = 0x00004000,               // 14
    HITINFO_UNK15               = 0x00008000,               // 15
    HITINFO_ABSORB              = 0x00010000,               // 16 plays absorb sound
    HITINFO_RESIST              = 0x00020000,               // 17 resisted atleast some damage
    HITINFO_NO_FLOATING_TEXT    = 0x00040000,               // 18 used with melee spells
    HITINFO_UNK19               = 0x00080000,               // 19 seen in sniffs
    HITINFO_GLANCING            = 0x00100000,               // 20
    HITINFO_CRUSHING            = 0x00200000,               // 21
    HITINFO_UNK22               = 0x00400000,               // 22 seen in sniffs
    HITINFO_SWINGNOHITSOUND     = 0x00800000                // 23
#endif
};

struct SubDamageInfo
{
    SpellSchoolMask damageSchoolMask = SPELL_SCHOOL_MASK_NORMAL;
    uint32 damage = 0;
    uint32 absorb = 0;
    int32 resist = 0;
};

// Struct for use in Unit::CalculateMeleeDamage
// Need create structure like in SMSG_ATTACKERSTATEUPDATE opcode
struct CalcDamageInfo
{
    Unit* attacker = nullptr;             // Attacker
    Unit* target = nullptr;               // Target for damage
    uint32 totalDamage = 0;
    uint32 totalAbsorb = 0;
    int32 totalResist = 0;
    SubDamageInfo subDamage[MAX_ITEM_PROTO_DAMAGES] = {};
    uint32 blocked_amount = 0;
    uint32 HitInfo = HITINFO_NORMALSWING;
    uint32 TargetState = VICTIMSTATE_UNAFFECTED;

    // Helper
    WeaponAttackType attackType = BASE_ATTACK;
    uint32 procAttacker = 0;
    uint32 procVictim = 0;
    uint32 procEx = 0;
    uint32 cleanDamage = 0;                        // Used only for rage calculation
    MeleeHitOutcome hitOutCome = MELEE_HIT_EVADE;  // TODO: remove this field (need use TargetState)
};

// Spell damage info structure based on structure sending in SMSG_SPELLNONMELEEDAMAGELOG opcode
struct SpellNonMeleeDamage {
    SpellNonMeleeDamage(SpellCaster* _attacker, Unit* _target, uint32 spellId_, SpellSchools _school)
        : target(_target), attacker(_attacker), spellId(spellId_), damage(0), school(_school),
        absorb(0), resist(0), periodicLog(false), reflected(false), blocked(0), HitInfo(0), spell(nullptr)
    {}

    Unit* target;
    SpellCaster* attacker;
    uint32 spellId;
    uint32 damage;
    SpellSchools school;
    uint32 absorb;
    int32 resist;
    bool   periodicLog;
    bool   reflected;
    uint32 blocked;
    uint32 HitInfo;
    Spell* spell;
};

struct CleanDamage
{
    CleanDamage(uint32 _damage, WeaponAttackType _attackType, MeleeHitOutcome _hitOutCome, uint32 _Absorb, int32 _Resist) :
    damage(_damage), attackType(_attackType), hitOutCome(_hitOutCome), absorb(_Absorb), resist(_Resist) {}

    uint32 damage;
    WeaponAttackType attackType;
    MeleeHitOutcome hitOutCome;
    uint32 absorb;
    int32 resist;
};

#endif
