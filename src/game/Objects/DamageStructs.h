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

// Server side enum.
// Returned by SpellCaster::RollMeleeOutcomeAgainst to determine outcome of melee attacks.
enum MeleeHitOutcome
{
    MELEE_HIT_EVADE = 0,
    MELEE_HIT_MISS = 1,
    MELEE_HIT_DODGE = 2,
    MELEE_HIT_BLOCK = 3,
    MELEE_HIT_PARRY = 4,
    MELEE_HIT_GLANCING = 5,
    MELEE_HIT_CRIT = 6,
    MELEE_HIT_CRUSHING = 7,
    MELEE_HIT_NORMAL = 8,
    MELEE_HIT_RESIST = 9
};

inline SpellMissInfo MeleeHitOutcomeToSpellMissInfo(MeleeHitOutcome hitOutcome)
{
    switch (hitOutcome)
    {
        case MELEE_HIT_EVADE:
            return SPELL_MISS_EVADE;
        case MELEE_HIT_MISS:
            return SPELL_MISS_MISS;
        case MELEE_HIT_DODGE:
            return SPELL_MISS_DODGE;
        case MELEE_HIT_BLOCK:
            return SPELL_MISS_BLOCK;
        case MELEE_HIT_PARRY:
            return SPELL_MISS_PARRY;
        case MELEE_HIT_RESIST:
            return SPELL_MISS_RESIST;
        case MELEE_HIT_GLANCING:
        case MELEE_HIT_CRIT:
        case MELEE_HIT_CRUSHING:
        case MELEE_HIT_NORMAL:
            return SPELL_MISS_NONE;
    }
    return SPELL_MISS_NONE;
};

// Client side enum.
// Sent in SMSG_ATTACKERSTATEUPDATE.
enum VictimState
{
    VICTIMSTATE_UNAFFECTED     = 0,
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

// Client side enum.
// Sent in SMSG_ATTACKERSTATEUPDATE.
enum HitInfo
{
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    HITINFO_DEBUG               = 0x00000001,               // 0
    HITINFO_AFFECTS_VICTIM      = 0x00000002,               // 1 no being hit animation on victim without it
    HITINFO_LEFTSWING           = 0x00000004,               // 2
    HITINFO_UNK3                = 0x00000008,               // 3 seemingly an unused flag after 1.9, still unused even in wotlk
    HITINFO_MISS                = 0x00000010,               // 4
    HITINFO_ABSORB              = 0x00000020,               // 5 plays absorb sound
    HITINFO_RESIST              = 0x00000040,               // 6 resisted atleast some damage
    HITINFO_CRITICALHIT         = 0x00000080,               // 7
    HITINFO_ROLLED_DODGE        = 0x00000100,               // 8 guessed, dodge check was made, set on every dodge and on any parry or block in sniffs
    HITINFO_ROLLED_PARRY        = 0x00000200,               // 9 guessed, parry check was made, never set when attacking from behind, implies HITINFO_ROLLED_DODGE
    HITINFO_ROLLED_BLOCK        = 0x00000400,               // 10 guessed, block check was made, never set on glancing blows, implies HITINFO_ROLLED_PARRY
    HITINFO_BLOCK               = 0x00000800,               // 11 used instead of VICTIMSTATE_BLOCKS in sniffs, implies HITINFO_ROLLED_BLOCK
    HITINFO_SUPPRESS_MISS_TEXT  = 0x00001000,               // 12 used with melee spells, but only if damage is 0 and not miss
    HITINFO_BLOOD_SPURT         = 0x00002000,               // 13 sprays extra blood, only when damage is between 20% and 100% of victim max health, victim is always a player
    HITINFO_GLANCING            = 0x00004000,               // 14
    HITINFO_CRUSHING            = 0x00008000,               // 15
    HITINFO_NOACTION            = 0x00010000,               // 16
    HITINFO_UNK17               = 0x00020000,               // 17 seen in sniffs, only sent by players, always set on melee spell casts
    HITINFO_PVP                 = 0x00040000,               // 18 guessed, set when both attacker and victim are player controlled
    HITINFO_SWINGNOHITSOUND     = 0x00080000                // 19
#else
    HITINFO_MISS                = 0x00000001,               // 0
    HITINFO_AFFECTS_VICTIM      = 0x00000002,               // 1 no being hit animation on victim without it
    HITINFO_KILLING_BLOW        = 0x00000004,               // 2 victim died, confirmed by 0.5.3 client and sniffs
    HITINFO_CRITICALHIT         = 0x00000008,               // 3
    HITINFO_ROLLED_DAZE         = 0x00000010,               // 4 guessed, only sent by creatures on landed hits, victim almost always had no defense rolls so likely only sent when attacking from behind
    HITINFO_ROLLED_DODGE        = 0x00000020,               // 5 guessed, dodge check was made, set on every dodge and on any parry or block in sniffs
    HITINFO_ROLLED_PARRY        = 0x00000040,               // 6 guessed, parry check was made, set on every parry, implies HITINFO_ROLLED_DODGE
    HITINFO_ROLLED_BLOCK        = 0x00000080,               // 7 guessed, block check was made, set on every block, implies HITINFO_ROLLED_DODGE
    HITINFO_UNK8                = 0x00000100,               // 8
    HITINFO_LEFTSWING           = 0x00000200,               // 9
    HITINFO_BLOOD_SPURT         = 0x00000400,               // 10 sprays extra blood, only when damage is between 20% and 100% of victim max health, victim is always a player
    HITINFO_DAZE                = 0x00000800,               // 11 guessed, daze spell cast preceeds it, only seen together with 0x00000010
    HITINFO_NOACTION            = 0x00001000,               // 12
    HITINFO_DEBUG               = 0x00002000,               // 13
    HITINFO_UNK14               = 0x00004000,               // 14
    HITINFO_UNK15               = 0x00008000,               // 15
    HITINFO_ABSORB              = 0x00010000,               // 16 plays absorb sound
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_5_1
    HITINFO_RESIST              = 0x00020000,               // 17 resisted atleast some damage
    HITINFO_SUPPRESS_MISS_TEXT  = 0x00040000,               // 18 used with melee spells, but only if damage is 0 and not miss
    HITINFO_BLOCK               = 0x00080000,               // 19 used instead of VICTIMSTATE_BLOCKS in sniffs, implies HITINFO_ROLLED_BLOCK
    HITINFO_GLANCING            = 0x00100000,               // 20
    HITINFO_CRUSHING            = 0x00200000,               // 21
    HITINFO_PVP                 = 0x00400000,               // 22 guessed, all the cases are player vs player or pet/totem
    HITINFO_SWINGNOHITSOUND     = 0x00800000,               // 23
#else
    HITINFO_RESIST              = 0x00000000,               // does not exists before 1.6
    HITINFO_SUPPRESS_MISS_TEXT  = 0x00020000,               // 17 used with melee spells, but only if damage is 0 and not miss
    HITINFO_BLOCK               = 0x00040000,               // 18 used instead of VICTIMSTATE_BLOCKS in sniffs, implies HITINFO_ROLLED_BLOCK
    HITINFO_GLANCING            = 0x00080000,               // 19
    HITINFO_CRUSHING            = 0x00100000,               // 20
    HITINFO_PVP                 = 0x00200000,               // 21 guessed, all the cases are player vs player or pet/totem
    HITINFO_SWINGNOHITSOUND     = 0x00400000,               // 22
#endif
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
    uint32 HitInfo = 0;
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
        absorb(0), resist(0), periodicLog(false), reflected(false), blocked(0), hitTypeFlags(0), spell(nullptr)
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
    uint32 hitTypeFlags; // enum SpellHitType
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
