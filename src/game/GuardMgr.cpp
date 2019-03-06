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

#include "GuardMgr.h"
#include "Creature.h"
#include "CreatureAI.h"
#include "Log.h"
#include "Policies/SingletonImp.h"

INSTANTIATE_SINGLETON_1(GuardMgr);

#define GUARD_POST_USE_COOLDOWN  10000
#define GUARD_POST_RECHARGE_TIME 60000

enum GuardAreas
{
    AREA_NORTHSHIRE          = 9,
    AREA_WETLANDS            = 11,
    AREA_DUSTWALLOW_MARSH    = 15,
    AREA_DARKSHIRE           = 42,
    AREA_ARATHI_HIGHLANDS    = 45,
    AREA_LAKESHIRE           = 69,
    AREA_STONARD             = 75,
    AREA_TIRISFAL_GLADES     = 85,
    AREA_GOLDSHIRE           = 87,
    AREA_SENTINEL_HILL       = 108,
    AREA_GROMGOL             = 117,
    AREA_SILVERPINE          = 130,
    AREA_KHARANOS            = 131,
    AREA_COLDRIDGE_VALLEY    = 132,
    AREA_TELDRASSIL          = 141,
    AREA_THELSAMAR           = 144,
    AREA_MENETHIL            = 150,
    AREA_DEATHKNELL          = 154,
    AREA_BRILL               = 159,
    AREA_DOLANAAR            = 186,
    AREA_SHADOWGLEN          = 188,
    AREA_MULGORE             = 215,
    AREA_CAMP_NARACHE        = 221,
    AREA_BLOODHOOF_VILLAGE   = 222,
    AREA_SEPULCHER           = 228,
    AREA_HILLSBRAD_FOOTHILLS = 267,
    AREA_SOUTHSHORE          = 271,
    AREA_TARREN_MILL         = 272,
    AREA_REFUGE_POINTE       = 320,
    AREA_HAMERFALL           = 321,
    AREA_KARGATH             = 340,
    AREA_RAZOR_HILL          = 362,
    AREA_VALLEY_OF_TRIALS    = 363,
    AREA_SENJIN_VILLAGE      = 367,
    AREA_CROSSROADS          = 380,
    AREA_STONETALON          = 406,
    AREA_ASTRANAAR           = 415,
    AREA_AUBERDINE           = 442,
    AREA_FREEWIND_POST       = 484,
    AREA_BRACKENWALL_VILLAGE = 496,
    AREA_THERAMORE           = 513,
    AREA_RUTHERAN_VILLAGE    = 702,
    AREA_CAMP_MOJACHE        = 1099,
    AREA_FEATHERMOON         = 1116,
    AREA_UNDERCITY           = 1497,
    AREA_STORMWIND           = 1519,
    AREA_IRONFORGE           = 1537,
    AREA_ORGRIMMAR           = 1637,
    AREA_THUNDERBLUFF        = 1638,
    AREA_DARNASSUS           = 1657,
    AREA_LIGHTS_HOPE_CHAPEL  = 2268,
    AREA_NIGHTHAVEN          = 2361,
    AREA_REVANTUSK_VILLAGE   = 3317,
};

enum GuardTexts
{
    TEXT_NONE = 0,
    TEXT_GUARD_HUMAN     = 4403, // Guards! Help me!
    TEXT_GUARD_NIGHT_ELF = 4564, // Sentinels, come to my defense!
    TEXT_GUARD_ORC       = 4561, // Guards!
    TEXT_GUARD_ORC_2     = 4558, // Grunts! Attack!
    TEXT_GUARD_TAUREN    = 4560, // You will not defile our sacred land!
    TEXT_GUARD_TROLL     = 4559, // Guardians! Defend Sen'jin!
    TEXT_GUARD_DWARF     = 4583, // Guards!
    TEXT_GUARD_UNDEAD    = 4484, // Intruders! Attack the intruders!
};

enum GuardIds
{
    NPC_NONE                    = 0,
    NPC_STORMWIND_CITY_GUARD    = 68,
    NPC_IRONFORGE_MOUNTAINEER   = 727,
    NPC_COLDRIDGE_MOUNTAINEER   = 853,
    NPC_STONARD_GRUNT           = 866,
    NPC_GROMGOL_GRUNT           = 1064,
    NPC_MENETHIL_GUARD          = 1475,
    NPC_NORTHSHIRE_GUARD        = 1642,
    NPC_SOUTHSHORE_GUARD        = 2386,
    NPC_TARREN_MILL_DEATHGUARD  = 2405,
    NPC_HAMERFALL_GUARDIAN      = 2621,
    NPC_BLUFFWATCHER            = 3084,
    NPC_ORGRIMMAR_GRUNT         = 3296,
    NPC_HORDE_GUARD             = 3501,
    NPC_TELDRASSIL_SENTINEL     = 3571,
    NPC_DARNASSUS_SENTINEL      = 4262,
    NPC_THERAMORE_GUARD         = 4979,
    NPC_IRONFORGE_GUARD         = 5595,
    NPC_DEN_GRUNT               = 5952,
    NPC_RAZOR_HILL_GRUNT        = 5953,
    NPC_AUBERDINE_SENTINEL      = 6086,
    NPC_ASTRANAAR_SENTINEL      = 6087,
    NPC_SILVERPINE_DEATHGUARD   = 7489,
    NPC_STONETALON_GRUNT        = 7730,
    NPC_FEATHERMOON_SENTINEL    = 7939,
    NPC_MULGORE_PROTECTOR       = 7975,
    NPC_DEATHGUARD_ELITE        = 7980,
    NPC_SENJIN_GUARDIAN         = 8017,
    NPC_THELSAMAR_MOUNTAINEER   = 8055,
    NPC_PROTECTOR_OF_THE_PEOPLE = 8096,
    NPC_CAMP_MOJACHE_BRAVE      = 8147,
    NPC_KARGATH_GRUNT           = 8155,
    NPC_FREEWIND_BRAVE          = 9525,
    NPC_BRACKENWALL_ENFORCER    = 10036,
    NPC_LAKESHIRE_GUARD         = 10037,
    NPC_NIGHT_WATCH_GUARD       = 10038,
    NPC_REFUGE_POINTE_DEFENDER  = 10696,
    NPC_MOONGLADE_WARDEN        = 11822,
    NPC_SHADOWGLEN_SENTINEL     = 12160,
    NPC_REVANTUSK_WATCHER       = 14730,
    NPC_HAMERFALL_ELITE         = 15136,
    NPC_MENETHIL_ELITE          = 15137,
    NPC_SILVERPINE_ELITE        = 15138,
    NPC_ARGENT_SENTRY           = 16378,
};

GuardMgr::GuardMgr()
{
    m_mAreaGuardInfo = {
    // Area Id                               Alliance NPC                 Horde NPC                  Alliance Text         Horde Text
    { AREA_STORMWIND,          AreaGuardInfo(NPC_STORMWIND_CITY_GUARD,    NPC_NONE,                  TEXT_GUARD_HUMAN,     TEXT_NONE) },
    { AREA_ASTRANAAR,          AreaGuardInfo(NPC_ASTRANAAR_SENTINEL,      NPC_NONE,                  TEXT_GUARD_NIGHT_ELF, TEXT_NONE) },
    { AREA_AUBERDINE,          AreaGuardInfo(NPC_AUBERDINE_SENTINEL,      NPC_NONE,                  TEXT_GUARD_NIGHT_ELF, TEXT_NONE) },
    { AREA_CROSSROADS,         AreaGuardInfo(NPC_NONE,                    NPC_HORDE_GUARD,           TEXT_NONE,            TEXT_GUARD_ORC) },
    { AREA_RAZOR_HILL,         AreaGuardInfo(NPC_NONE,                    NPC_RAZOR_HILL_GRUNT,      TEXT_NONE,            TEXT_GUARD_ORC_2) },
    { AREA_THERAMORE,          AreaGuardInfo(NPC_THERAMORE_GUARD,         NPC_NONE,                  TEXT_GUARD_HUMAN,     TEXT_NONE) },
    { AREA_FEATHERMOON,        AreaGuardInfo(NPC_FEATHERMOON_SENTINEL,    NPC_NONE,                  TEXT_GUARD_NIGHT_ELF, TEXT_NONE) },
    { AREA_THUNDERBLUFF,       AreaGuardInfo(NPC_NONE,                    NPC_BLUFFWATCHER,          TEXT_NONE,            TEXT_GUARD_TAUREN) },
    { AREA_CAMP_NARACHE,       AreaGuardInfo(NPC_NONE,                    NPC_MULGORE_PROTECTOR,     TEXT_NONE,            TEXT_GUARD_TAUREN) },
    { AREA_BLOODHOOF_VILLAGE,  AreaGuardInfo(NPC_NONE,                    NPC_MULGORE_PROTECTOR,     TEXT_NONE,            TEXT_GUARD_TAUREN) },
    { AREA_MULGORE,            AreaGuardInfo(NPC_NONE,                    NPC_MULGORE_PROTECTOR,     TEXT_NONE,            TEXT_GUARD_TAUREN) },
    { AREA_CAMP_MOJACHE,       AreaGuardInfo(NPC_NONE,                    NPC_CAMP_MOJACHE_BRAVE,    TEXT_NONE,            TEXT_GUARD_TAUREN) },
    { AREA_FREEWIND_POST,      AreaGuardInfo(NPC_NONE,                    NPC_FREEWIND_BRAVE,        TEXT_NONE,            TEXT_GUARD_TAUREN) },
    { AREA_SENJIN_VILLAGE,     AreaGuardInfo(NPC_NONE,                    NPC_SENJIN_GUARDIAN,       TEXT_NONE,            TEXT_GUARD_TROLL) },
    { AREA_SENTINEL_HILL,      AreaGuardInfo(NPC_PROTECTOR_OF_THE_PEOPLE, NPC_NONE,                  TEXT_GUARD_HUMAN,     TEXT_NONE) },
    { AREA_THELSAMAR,          AreaGuardInfo(NPC_THELSAMAR_MOUNTAINEER,   NPC_NONE,                  TEXT_GUARD_DWARF,     TEXT_NONE) },
    { AREA_SILVERPINE,         AreaGuardInfo(NPC_NONE,                    NPC_SILVERPINE_DEATHGUARD, TEXT_NONE,            TEXT_GUARD_UNDEAD) },
    { AREA_SEPULCHER,          AreaGuardInfo(NPC_NONE,                    NPC_SILVERPINE_ELITE,      TEXT_NONE,            TEXT_GUARD_UNDEAD) },
    { AREA_UNDERCITY,          AreaGuardInfo(NPC_NONE,                    NPC_DEATHGUARD_ELITE,      TEXT_NONE,            TEXT_GUARD_UNDEAD) },
    { AREA_KHARANOS,           AreaGuardInfo(NPC_IRONFORGE_MOUNTAINEER,   NPC_NONE,                  TEXT_GUARD_DWARF,     TEXT_NONE) },
    { AREA_IRONFORGE,          AreaGuardInfo(NPC_IRONFORGE_GUARD,         NPC_NONE,                  TEXT_GUARD_DWARF,     TEXT_NONE) },
    { AREA_DARNASSUS,          AreaGuardInfo(NPC_DARNASSUS_SENTINEL,      NPC_NONE,                  TEXT_GUARD_NIGHT_ELF, TEXT_NONE) },
    { AREA_ORGRIMMAR,          AreaGuardInfo(NPC_NONE,                    NPC_ORGRIMMAR_GRUNT,       TEXT_NONE,            TEXT_GUARD_ORC) },
    { AREA_WETLANDS,           AreaGuardInfo(NPC_MENETHIL_GUARD,          NPC_NONE,                  TEXT_GUARD_HUMAN,     TEXT_NONE) },
    { AREA_MENETHIL,           AreaGuardInfo(NPC_MENETHIL_ELITE,          NPC_NONE,                  TEXT_GUARD_HUMAN,     TEXT_NONE) },
    { AREA_DUSTWALLOW_MARSH,   AreaGuardInfo(NPC_THERAMORE_GUARD,         NPC_BRACKENWALL_ENFORCER,  TEXT_GUARD_HUMAN,     TEXT_NONE) },
    { AREA_BRACKENWALL_VILLAGE,AreaGuardInfo(NPC_NONE,                    NPC_BRACKENWALL_ENFORCER,  TEXT_NONE,            TEXT_NONE) },
    { AREA_ARATHI_HIGHLANDS,   AreaGuardInfo(NPC_REFUGE_POINTE_DEFENDER,  NPC_HAMERFALL_GUARDIAN,    TEXT_GUARD_HUMAN,     TEXT_GUARD_ORC) },
    { AREA_REFUGE_POINTE,      AreaGuardInfo(NPC_REFUGE_POINTE_DEFENDER,  NPC_NONE,                  TEXT_GUARD_HUMAN,     TEXT_NONE) },
    { AREA_HAMERFALL,          AreaGuardInfo(NPC_NONE,                    NPC_HAMERFALL_ELITE,       TEXT_NONE,            TEXT_GUARD_ORC) },
    { AREA_BRILL,              AreaGuardInfo(NPC_NONE,                    NPC_DEATHGUARD_ELITE,      TEXT_NONE,            TEXT_GUARD_UNDEAD) },
    { AREA_TIRISFAL_GLADES,    AreaGuardInfo(NPC_NONE,                    NPC_DEATHGUARD_ELITE,      TEXT_NONE,            TEXT_GUARD_UNDEAD) },
    { AREA_DEATHKNELL,         AreaGuardInfo(NPC_NONE,                    NPC_DEATHGUARD_ELITE,      TEXT_NONE,            TEXT_GUARD_UNDEAD) },
    { AREA_HILLSBRAD_FOOTHILLS,AreaGuardInfo(NPC_SOUTHSHORE_GUARD,        NPC_TARREN_MILL_DEATHGUARD,TEXT_GUARD_HUMAN,     TEXT_GUARD_UNDEAD) },
    { AREA_SOUTHSHORE,         AreaGuardInfo(NPC_SOUTHSHORE_GUARD,        NPC_NONE,                  TEXT_GUARD_HUMAN,     TEXT_NONE) },
    { AREA_TARREN_MILL,        AreaGuardInfo(NPC_NONE,                    NPC_TARREN_MILL_DEATHGUARD,TEXT_NONE,            TEXT_GUARD_UNDEAD) },
    { AREA_STONETALON,         AreaGuardInfo(NPC_NONE,                    NPC_STONETALON_GRUNT,      TEXT_GUARD_NIGHT_ELF, TEXT_GUARD_ORC) },
    { AREA_GROMGOL,            AreaGuardInfo(NPC_NONE,                    NPC_GROMGOL_GRUNT,         TEXT_NONE,            TEXT_GUARD_ORC) },
    { AREA_GOLDSHIRE,          AreaGuardInfo(NPC_STORMWIND_CITY_GUARD,    NPC_NONE,                  TEXT_GUARD_HUMAN,     TEXT_NONE) },
    { AREA_STONARD,            AreaGuardInfo(NPC_NONE,                    NPC_STONARD_GRUNT,         TEXT_NONE,            TEXT_GUARD_ORC) },
    { AREA_KARGATH,            AreaGuardInfo(NPC_NONE,                    NPC_KARGATH_GRUNT,         TEXT_NONE,            TEXT_GUARD_ORC) },
    { AREA_LAKESHIRE,          AreaGuardInfo(NPC_LAKESHIRE_GUARD,         NPC_NONE,                  TEXT_GUARD_HUMAN,     TEXT_NONE) },
    { AREA_DARKSHIRE,          AreaGuardInfo(NPC_NIGHT_WATCH_GUARD,       NPC_NONE,                  TEXT_GUARD_HUMAN,     TEXT_NONE) },
    { AREA_DOLANAAR,           AreaGuardInfo(NPC_TELDRASSIL_SENTINEL,     NPC_NONE,                  TEXT_GUARD_NIGHT_ELF, TEXT_NONE) },
    { AREA_TELDRASSIL,         AreaGuardInfo(NPC_TELDRASSIL_SENTINEL,     NPC_NONE,                  TEXT_GUARD_NIGHT_ELF, TEXT_NONE) },
    { AREA_RUTHERAN_VILLAGE,   AreaGuardInfo(NPC_DARNASSUS_SENTINEL,      NPC_NONE,                  TEXT_GUARD_NIGHT_ELF, TEXT_NONE) },
    { AREA_NIGHTHAVEN,         AreaGuardInfo(NPC_MOONGLADE_WARDEN,        NPC_MOONGLADE_WARDEN,      TEXT_GUARD_NIGHT_ELF, TEXT_GUARD_NIGHT_ELF) },
    { AREA_REVANTUSK_VILLAGE,  AreaGuardInfo(NPC_NONE,                    NPC_REVANTUSK_WATCHER,     TEXT_NONE,            TEXT_NONE) },
    { AREA_LIGHTS_HOPE_CHAPEL, AreaGuardInfo(NPC_ARGENT_SENTRY,           NPC_ARGENT_SENTRY,         TEXT_NONE,            TEXT_NONE) },
    { AREA_SHADOWGLEN,         AreaGuardInfo(NPC_SHADOWGLEN_SENTINEL,     NPC_NONE,                  TEXT_GUARD_NIGHT_ELF, TEXT_NONE) },
    { AREA_NORTHSHIRE,         AreaGuardInfo(NPC_NORTHSHIRE_GUARD,        NPC_NONE,                  TEXT_GUARD_HUMAN,     TEXT_NONE) },
    { AREA_COLDRIDGE_VALLEY,   AreaGuardInfo(NPC_COLDRIDGE_MOUNTAINEER,   NPC_NONE,                  TEXT_GUARD_DWARF,     TEXT_NONE) },
    { AREA_VALLEY_OF_TRIALS,   AreaGuardInfo(NPC_NONE,                    NPC_DEN_GRUNT,             TEXT_NONE,            TEXT_GUARD_ORC) },
    };
}

void GuardMgr::Update(uint32 diff)
{
    bool bIncreaseCharges = false;

    if (m_uiRechargeTimer < diff)
    {
        bIncreaseCharges = true;
        m_uiRechargeTimer = GUARD_POST_RECHARGE_TIME;
    }
    else
        m_uiRechargeTimer -= diff;

    for (auto& itr : m_mAreaGuardInfo)
    {
        if (itr.second.cooldown)
        {
            if (itr.second.cooldown >= diff)
                itr.second.cooldown -= diff;
            else
                itr.second.cooldown = 0;
        }
        if (bIncreaseCharges && (itr.second.charges < GUARD_POST_MAX_CHARGES))
            itr.second.charges++;
    }
}

bool GuardMgr::SummonGuard(Creature* pCivilian, Player* pEnemy)
{
    if (!pCivilian || !pEnemy)
        return false;

    uint32 areaId = pCivilian->GetAreaId();

    auto itr = m_mAreaGuardInfo.find(areaId);

    if (itr == m_mAreaGuardInfo.end())
    {;
        pCivilian->CallNearestGuard(pEnemy);
        return true;
    }

    AreaGuardInfo& guardInfo = itr->second;

    if (guardInfo.cooldown || !guardInfo.charges)
        return false;

    guardInfo.charges--;
    guardInfo.cooldown = GUARD_POST_USE_COOLDOWN;

    if (uint32 textId = pEnemy->GetTeamId() == TEAM_ALLIANCE ?  guardInfo.textIdHorde : guardInfo.textIdAlliance)
        DoScriptText(textId, pCivilian, pEnemy, CHAT_TYPE_SAY);

    if (uint32 creatureId = pEnemy->GetTeamId() == TEAM_ALLIANCE ? guardInfo.creatureIdHorde : guardInfo.creatureIdAlliance)
    {
        float x, y, z;
        pCivilian->GetNearPoint(pCivilian, x, y, z, 0, 5, 0);
        Creature* pGuard = pCivilian->SummonCreature(creatureId, x, y, z, 0, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 2 * MINUTE * IN_MILLISECONDS);
        if (pGuard && pGuard->AI())
            pGuard->AI()->AttackStart(pEnemy);
    }
    return true;
}