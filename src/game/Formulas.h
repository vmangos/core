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

#ifndef MANGOS_FORMULAS_H
#define MANGOS_FORMULAS_H

#include "World.h"
#include "Creature.h"
#include "Player.h"
#include "Map.h"

namespace MaNGOS
{
    namespace XP
    {
        enum XPColorChar { RED, ORANGE, YELLOW, GREEN, GRAY };

        inline uint32 GetGrayLevel(uint32 pl_level)
        {
            if (pl_level <= 5)
                return 0;
            else if (pl_level <= 39)
                return pl_level - 5 - pl_level / 10;
            else
                return pl_level - 1 - pl_level / 5;
        }

        inline XPColorChar GetColorCode(uint32 pl_level, uint32 mob_level)
        {
            if (mob_level >= pl_level + 5)
                return RED;
            else if (mob_level >= pl_level + 3)
                return ORANGE;
            else if (mob_level >= pl_level - 2)
                return YELLOW;
            else if (mob_level > GetGrayLevel(pl_level))
                return GREEN;
            else
                return GRAY;
        }

        inline uint32 GetZeroDifference(uint32 pl_level)
        {
            if (pl_level < 8)  return 5;
            if (pl_level < 10) return 6;
            if (pl_level < 12) return 7;
            if (pl_level < 16) return 8;
            if (pl_level < 20) return 9;
            if (pl_level < 30) return 11;
            if (pl_level < 40) return 12;
            if (pl_level < 45) return 13;
            if (pl_level < 50) return 14;
            if (pl_level < 55) return 15;
            if (pl_level < 60) return 16;
            return 17;
        }

        inline float BaseGainLevelFactor(uint32 pl_level, uint32 victim_level)
        {
            if (victim_level >= pl_level)
            {
                uint32 nLevelDiff = victim_level - pl_level;
                if (nLevelDiff > 4)
                    nLevelDiff = 4;
                return 1.0f + 0.05f * nLevelDiff;
            }
            else
            {
                uint32 gray_level = GetGrayLevel(pl_level);
                if (victim_level > gray_level)
                {
                    uint32 ZD = GetZeroDifference(pl_level);
                    return (ZD + victim_level - pl_level) / float(ZD);
                }
            }
            return 0;
        }

        inline uint32 BaseGain(uint32 ownerLevel, uint32 unitLevel, uint32 mob_level)
        {
            uint32 const nBaseExp = 45;
            return (ownerLevel * 5 + nBaseExp) * BaseGainLevelFactor(unitLevel, mob_level);
        }

        inline uint32 Gain(Unit const* pUnit, Creature const* pCreature)
        {
            if (pCreature->GetUInt32Value(UNIT_CREATED_BY_SPELL) &&
               ((pCreature->GetCreatureInfo()->type == CREATURE_TYPE_CRITTER) ||
                (pCreature->GetCreatureInfo()->type == CREATURE_TYPE_NOT_SPECIFIED) ||
                (pCreature->GetCreatureInfo()->type == CREATURE_TYPE_TOTEM) ||
                (pCreature->GetCreatureInfo()->health_multiplier <= 0.1f)))
                return 0;

            if (pCreature->HasUnitState(UNIT_STAT_NO_KILL_REWARD))
                return 0;

            if (pCreature->HasStaticFlag(CREATURE_STATIC_FLAG_NO_XP))
                return 0;
            
            uint32 ownerLevel = pUnit->GetLevel();
            uint32 unitLevel = pUnit->GetLevel();
            if (pUnit->IsPet())
            {
                if (Unit* pOwner = pUnit->GetOwner())
                {
                    ownerLevel = pOwner->GetLevel();

                    // World of Warcraft Client Patch 1.7.0 (2005-09-13)
                    // - Hunter pets now gain experience based on the level difference between
                    //   them and their target rather than the difference between the Hunters
                    //   and their target.This will make it much easier to level up a low
                    //   level pet.Keep in mind that the Hunter must still kill creatures
                    //   from which he / she will gain experience.
                    if (sWorld.GetWowPatch() < WOW_PATCH_107)
                        unitLevel = pOwner->GetLevel();
                }
            }

            float xp_gain = BaseGain(ownerLevel, unitLevel, pCreature->GetLevel());
            if (!xp_gain)
                return 0;

            if (pCreature->IsElite())
            {
                if (pCreature->GetMap()->IsNonRaidDungeon())
                    xp_gain *= 2.5;
                else
                    xp_gain *= 2;

                xp_gain *= sWorld.getConfig(CONFIG_FLOAT_RATE_XP_KILL_ELITE);
            }

            if (pCreature->IsPet())
                xp_gain *= 0.75f;

            xp_gain *= pCreature->GetCreatureInfo()->xp_multiplier;
            xp_gain *= pCreature->GetXPModifierDueToDamageOrigin();
            xp_gain *= sWorld.getConfig(CONFIG_FLOAT_RATE_XP_KILL);

            return std::nearbyint(xp_gain);
        }

        inline float xp_in_group_rate(uint32 count, bool /*isRaid*/)
        {
            // TODO: this formula is completely guesswork only based on a logical assumption
            switch (count)
            {
                case 0:
                case 1:
                case 2:
                    return 1.0f;
                case 3:
                    return 1.166f;
                case 4:
                    return 1.3f;
                case 5:
                    return 1.4f;
                default:
                    return std::max(1.f - count * 0.05f, 0.01f);
            }
        }
    }

    namespace Honor
    {
        inline float GetHonorGain(uint8 killerLevel, uint8 victimLevel, uint32 victimRank, uint32 totalKills = 0, uint32 groupSize = 1)
        {
            // Penalty due to level diff
            float diffLevelPenalty = XP::BaseGainLevelFactor(killerLevel, victimLevel);

            // Same unit killing penalty
            // [-PROGRESSIVE] Total kills per day cahnged in 1.12 (http://wow.gamepedia.com/Patch_1.12.0#General)
            // Honorable Kills now diminish at a rate 10% per kill rather than 25% per kill.
            float penalty = 4.0f;
            if (sWorld.GetWowPatch() >= WOW_PATCH_112 || !sWorld.getConfig(CONFIG_BOOL_ACCURATE_PVP_REWARDS))
                penalty = 10.0f;

            double sameVictimPenalty = totalKills >= static_cast<uint32>(penalty) ? 0 : 1 - totalKills / penalty;

            // Level related coefficient
            double levelCoeff;

            if (killerLevel >= 60)
                levelCoeff = 1;
            else if ((killerLevel <= 59) && (killerLevel >= 50))
                levelCoeff = 0.9545;
            else if ((killerLevel <= 49) && (killerLevel >= 40))
                levelCoeff = 0.5707;
            else if ((killerLevel <= 39) && (killerLevel >= 30))
                levelCoeff = 0.3434;
            else if ((killerLevel <= 29) && (killerLevel >= 20))
                levelCoeff = 0.2070;
            else if (killerLevel <= 19)
                levelCoeff = 0.1212;
            else
                levelCoeff = 0.1212; // Not sure

            float expFactor = 188.3f;

            // [-PROGRESSIVE] Honor gain per victim rank changed in 1.8
            // Values from http://www.wowwiki.com/Honor_system_(pre-2.0_formulas)
            if (sWorld.GetWowPatch() < WOW_PATCH_108 && sWorld.getConfig(CONFIG_BOOL_ACCURATE_PVP_REWARDS))
                expFactor = 157.4f;

            return levelCoeff * sameVictimPenalty * (expFactor * exp(0.05331 * victimRank)) * diffLevelPenalty / groupSize;
        }
    }
}
#endif
