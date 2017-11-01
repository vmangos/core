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

#include "SpellMgr.h"
#include "SpellModMgr.h"
#include "Database/DatabaseEnv.h"
#include "Policies/SingletonImp.h"

#include "DBCStores.h"
#include "Log.h"

#include <limits>

INSTANTIATE_SINGLETON_1(SpellModMgr);

#define ENABLE_INSERT_NEW_SPELLS
#define OUT_LOG sLog.outString
#define OUT_ERR sLog.outError

SpellModMgr::SpellModMgr()
{
}

SpellModMgr::~SpellModMgr()
{
}

/*
SQL : cf sql/nostalrius/spell_mod.sql et sql/nostalrius/spell_effect_mod.sql
*/

inline void ModUInt32ValueIfExplicit(Field &f, uint32 &value)
{
    if (f.GetInt32() >= 0)
        value = f.GetUInt32();
}

inline void ModInt32ValueIfExplicit(Field &f, int32 &value)
{
    if (f.GetInt32() != -1)
        value = f.GetInt32();
}

inline void ModFloatValueIfExplicit(Field &f, float &value)
{
    if (f.GetFloat() != -1.0f)
        value = f.GetFloat();
}

void SpellModMgr::LoadSpellMods()
{
    OUT_LOG();
    OUT_LOG("Loading spell mods ...");
    // 1 : Reset des champs "Custom" pour tous les sorts charges des DBC
    for (uint32 id = 0; id < sSpellMgr.GetMaxSpellId(); id++)
    {
        SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(id);
        if (spellInfo)
        {
            SpellEntry* modif = ((SpellEntry*)spellInfo);
            modif->Custom = 0;
        }
    }
    OUT_LOG();
    OUT_LOG(">> Reseted %u spell", sSpellStore.GetNumRows());

    // 2 : Table spell_mod
    QueryResult* result = WorldDatabase.Query(
                              "SELECT Id, procChance, procFlags, Custom, DurationIndex, "
                              "Category, CastingTimeIndex, StackAmount, SpellIconID, activeIconID, manaCost, "
                              "Attributes, AttributesEx, AttributesEx2, AttributesEx3, AttributesEx4, "
                              "InterruptFlags, AuraInterruptFlags, ChannelInterruptFlags, Dispel, "
                              "Stances, StancesNot, SpellVisual, ManaCostPercentage, StartRecoveryCategory, StartRecoveryTime, MaxTargetLevel, MaxAffectedTargets, DmgClass, "
                              "rangeIndex, RecoveryTime, CategoryRecoveryTime, procCharges, SpellFamilyName, SpellFamilyFlags, Mechanic, EquippedItemClass "
                              "FROM spell_mod");
    uint32 total_count = 0;
    if (!result)
    {
        OUT_LOG();
        OUT_LOG(">> Loaded %u spell modifications. Table spell_mod vide ou inexistante ?", total_count);
    }
    else
    {
        Field* fields;
        do
        {
            fields = result->Fetch();
            uint32 spellid = fields[0].GetUInt32();
#ifdef ENABLE_INSERT_NEW_SPELLS
            if (!sSpellMgr.GetSpellEntry(spellid))
            {
                SpellEntry* newSpell = new SpellEntry;
                if (!sSpellMgr.SetSpellEntry(spellid, newSpell))
                {
                    OUT_ERR("Impossible de creer le sort %u. Passe.", spellid);
                    delete newSpell;
                    continue;
                }
                else
                {
                    DBCSpellEntry* loader = new DBCSpellEntry;
                    memset(loader, 0, sizeof(DBCSpellEntry));
                    // Certaines valeurs sont a -1 par defaut.
                    loader->EquippedItemClass = -1;
                    for (uint32 i = 0; i < 8; ++i)
                    {
                        std::stringstream name;
                        name << "CustomSpell";
                        loader->SpellName[i] = new char[name.str().size() + 1];
                        strcpy(loader->SpellName[i], name.str().c_str());
                        //sprintf (loader->SpellName[i], "CustomSpell%u", spellid);
                        //sprintf (loader->Rank[i], "Custom");
                    }
                    if (!newSpell->Load(loader))
                    {
                        OUT_ERR("Impossible de charger le sort %u. Passe.", spellid);
                        delete newSpell;
                        delete loader;
                        continue;
                    }
                    delete loader;
                }
            }
#endif
            SpellEntry* spell = ((SpellEntry*)sSpellMgr.GetSpellEntry(spellid));
            if (!spell)
            {
                OUT_ERR("Spell entry %u from `spell_mod` doesn't exist in dbc, ignoring.", spellid);
                continue;
            }
            //    0        1         2            3                4
            // Id,        procChance,procFlags,custom, DurationIndex

            spell->Id                  = fields[0].GetUInt32();
            ModUInt32ValueIfExplicit(fields[1], spell->procChance);
            ModUInt32ValueIfExplicit(fields[2], spell->procFlags);
            ModUInt32ValueIfExplicit(fields[4], spell->DurationIndex);
            spell->Custom              = fields[3].GetUInt32();

            // 5         6               7          8          9           10
            // Category,CastingTimeIndex,StackAmount,SpellIconID,activeIconID,manaCost
            ModUInt32ValueIfExplicit(fields[5],  spell->Category);
            ModUInt32ValueIfExplicit(fields[6], spell->CastingTimeIndex);
            ModUInt32ValueIfExplicit(fields[7], spell->StackAmount);
            ModUInt32ValueIfExplicit(fields[8], spell->SpellIconID);
            ModUInt32ValueIfExplicit(fields[9], spell->activeIconID);
            ModUInt32ValueIfExplicit(fields[10], spell->manaCost);

            // 11          12            13              14            15
            // Attributes, AttributesEx, AttributesEx2, AttributesEx3, AttributesEx4
            ModUInt32ValueIfExplicit(fields[11], spell->Attributes);
            ModUInt32ValueIfExplicit(fields[12], spell->AttributesEx);
            ModUInt32ValueIfExplicit(fields[13], spell->AttributesEx2);
            ModUInt32ValueIfExplicit(fields[14], spell->AttributesEx3);
            ModUInt32ValueIfExplicit(fields[15], spell->AttributesEx4);

            // 16              17                  18                     19
            // InterruptFlags, AuraInterruptFlags, ChannelInterruptFlags, Dispel
            ModUInt32ValueIfExplicit(fields[16], spell->InterruptFlags);
            ModUInt32ValueIfExplicit(fields[17], spell->AuraInterruptFlags);
            ModUInt32ValueIfExplicit(fields[18], spell->ChannelInterruptFlags);
            ModUInt32ValueIfExplicit(fields[19], spell->Dispel);

            // 20       21          22          23                  24                     25                26               27                  28
            // Stances, StancesNot, SpellVisual, ManaCostPercentage, StartRecoveryCategory, StartRecoveryTime, MaxTargetLevel, MaxAffectedTargets, DmgClass
            ModUInt32ValueIfExplicit(fields[20], spell->Stances);
            ModUInt32ValueIfExplicit(fields[21], spell->StancesNot);
            ModUInt32ValueIfExplicit(fields[22], spell->SpellVisual);
            ModUInt32ValueIfExplicit(fields[23], spell->ManaCostPercentage);
            ModUInt32ValueIfExplicit(fields[24], spell->StartRecoveryCategory);
            ModUInt32ValueIfExplicit(fields[25], spell->StartRecoveryTime);
            ModUInt32ValueIfExplicit(fields[26], spell->MaxTargetLevel);
            ModUInt32ValueIfExplicit(fields[27], spell->MaxAffectedTargets);
            ModUInt32ValueIfExplicit(fields[28], spell->DmgClass);

            // 29          30            31                    32
            // rangeIndex, RecoveryTime, CategoryRecoveryTime, procCharges
            ModUInt32ValueIfExplicit(fields[29], spell->rangeIndex);
            ModUInt32ValueIfExplicit(fields[30], spell->RecoveryTime);
            ModUInt32ValueIfExplicit(fields[31], spell->CategoryRecoveryTime);
            ModUInt32ValueIfExplicit(fields[32], spell->procCharges);

            // 33               34                35        36
            // SpellFamilyName, SpellFamilyFlags, Mechanic, EquippedItemClass
            ModUInt32ValueIfExplicit(fields[33], spell->SpellFamilyName);
            uint64 flags = fields[34].GetUInt64();
            if (flags)
                spell->SpellFamilyFlags.Flags = flags;
            ModUInt32ValueIfExplicit(fields[35], spell->Mechanic);
            ModInt32ValueIfExplicit(fields[36], spell->EquippedItemClass);

            spell->InitCachedValues();
            ++total_count;
        }
        while (result->NextRow());
        delete result;
        OUT_LOG();
        OUT_LOG(">> Loaded %u spell modifications", total_count);
    }

    // 3 : Table spell_effect_mod
    OUT_LOG();
    OUT_LOG("Loading spell effect mods ...");
    result = WorldDatabase.Query(
                 "SELECT Id, EffectIndex, Effect, EffectApplyAuraName, EffectMechanic, EffectImplicitTargetA, EffectImplicitTargetB, "
                 "EffectRadiusIndex, EffectItemType, EffectMiscValue, EffectTriggerSpell, "
                 "EffectDieSides, EffectBaseDice, EffectBasePoints, EffectAmplitude, EffectChainTarget, " // Int
                 "EffectDicePerLevel, EffectRealPointsPerLevel, EffectPointsPerComboPoint, EffectMultipleValue " // Float
                 "FROM spell_effect_mod"
             );
    total_count = 0;

    if (!result)
    {
        OUT_LOG();
        OUT_LOG(">> Loaded %u spell effect modifications. Table spell_effect_mod vide ou inexistante ?", total_count);
    }
    else
    {
        Field* fields;
        do
        {
            fields = result->Fetch();
            uint32 spellid = fields[0].GetUInt32();
            uint32 effect_idx = fields[1].GetUInt32();
            SpellEntry* spell = ((SpellEntry*)sSpellMgr.GetSpellEntry(spellid));
            if (!spell)
            {
                OUT_ERR("Spell entry %u from `spell_effect_mod` doesn't exist in dbc, ignoring.", spellid);
                continue;
            }
            if (effect_idx >= MAX_EFFECT_INDEX)
            {
                OUT_ERR("Erreur : Le sort %u a une definition pour l'effet %u, alors que le max est %u.", spellid, effect_idx, (MAX_EFFECT_INDEX - 1));
                continue;
            }
            //0   1            2       3                    4               5                      6
            //Id, EffectIndex, Effect, EffectApplyAuraName, EffectMechanic, EffectImplicitTargetA, EffectImplicitTargetB,
            ModUInt32ValueIfExplicit(fields[2], spell->Effect[effect_idx]);
            ModUInt32ValueIfExplicit(fields[3], spell->EffectApplyAuraName[effect_idx]);
            ModUInt32ValueIfExplicit(fields[4], spell->EffectMechanic[effect_idx]);
            ModUInt32ValueIfExplicit(fields[5], spell->EffectImplicitTargetA[effect_idx]);
            ModUInt32ValueIfExplicit(fields[6], spell->EffectImplicitTargetB[effect_idx]);

            //7                  8               9                10
            //EffectRadiusIndex, EffectItemType, EffectMiscValue, EffectTriggerSpell
            ModUInt32ValueIfExplicit(fields[7], spell->EffectRadiusIndex[effect_idx]);
            ModUInt32ValueIfExplicit(fields[8], spell->EffectItemType[effect_idx]);
            ModInt32ValueIfExplicit(fields[9], spell->EffectMiscValue[effect_idx]);
            ModUInt32ValueIfExplicit(fields[10], spell->EffectTriggerSpell[effect_idx]);

            //   11           12              13                14               15
            //EffectDieSides, EffectBaseDice, EffectBasePoints, EffectAmplitude, EffectChainTarget
            ModInt32ValueIfExplicit(fields[11], spell->EffectDieSides[effect_idx]);
            ModUInt32ValueIfExplicit(fields[12], spell->EffectBaseDice[effect_idx]);
            ModInt32ValueIfExplicit(fields[13], spell->EffectBasePoints[effect_idx]);
            ModUInt32ValueIfExplicit(fields[14], spell->EffectAmplitude[effect_idx]);
            ModUInt32ValueIfExplicit(fields[15], spell->EffectChainTarget[effect_idx]);

            //  16                17                       18                          19
            //EffectDicePerLevel, EffectRealPointsPerLevel, EffectPointsPerComboPoint, EffectMultipleValue
            ModFloatValueIfExplicit(fields[16], spell->EffectDicePerLevel[effect_idx]);
            ModFloatValueIfExplicit(fields[17], spell->EffectRealPointsPerLevel[effect_idx]);
            ModFloatValueIfExplicit(fields[18], spell->EffectPointsPerComboPoint[effect_idx]);
            ModFloatValueIfExplicit(fields[19], spell->EffectMultipleValue[effect_idx]);

            ++total_count;
        }
        while (result->NextRow());
        delete result;
        OUT_LOG();
        OUT_LOG(">> Loaded %u spell effect modifications", total_count);
    }

    // Other modifications (no 'speed' field in spell_mod)

    // Flare
    if (SpellEntry* fuseeEcl = (SpellEntry*)sSpellMgr.GetSpellEntry(1543))
        fuseeEcl->speed = 0.0f;

    // Seal of Command Trigger minor delay (melee radius 5.0 / 10.0 * 1000 = 0.5sec delay)
    if (SpellEntry* spellInfo = (SpellEntry*)sSpellMgr.GetSpellEntry(20424))
        spellInfo->speed = 10.0f;

    // Divine Favor EffectItemMask for Holy Light base spell
    // (HACK) need to modify EffectItemType column in spell_effect_mod to support bigint flags
    if (SpellEntry* pDivine = (SpellEntry*)sSpellMgr.GetSpellEntry(20216))
        pDivine->EffectItemType[0] = 0x80202000;
}
