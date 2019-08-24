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

#include "Common.h"
#include "Database/DatabaseEnv.h"
#include "World.h"
#include "Player.h"
#include "Chat.h"
#include "Language.h"
#include "ObjectMgr.h"
#include "SystemConfig.h"
#include "revision.h"
#include "Util.h"
#include "SpellAuras.h"
#include "TargetedMovementGenerator.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "CellImpl.h"

bool ChatHandler::HandleGUIDCommand(char* /*args*/)
{
    ObjectGuid guid = m_session->GetPlayer()->GetSelectionGuid();

    if (!guid)
    {
        SendSysMessage(LANG_NO_SELECTION);
        SetSentErrorMessage(true);
        return false;
    }

    PSendSysMessage(LANG_OBJECT_GUID, guid.GetString().c_str());
    return true;
}

bool ChatHandler::HandleGPSCommand(char* args)
{
    WorldObject *obj = NULL;
    if (*args)
    {
        if (ObjectGuid guid = ExtractGuidFromLink(&args))
            obj = (WorldObject*)m_session->GetPlayer()->GetObjectByTypeMask(guid, TYPEMASK_CREATURE_OR_GAMEOBJECT);

        if (!obj)
        {
            SendSysMessage(LANG_PLAYER_NOT_FOUND);
            SetSentErrorMessage(true);
            return false;
        }
    }
    else
    {
        obj = GetSelectedUnit();

        if (!obj)
        {
            SendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
            SetSentErrorMessage(true);
            return false;
        }
    }
    CellPair cell_val = MaNGOS::ComputeCellPair(obj->GetPositionX(), obj->GetPositionY());
    Cell cell(cell_val);

    uint32 zone_id, area_id;
    obj->GetZoneAndAreaId(zone_id, area_id);

    MapEntry const* mapEntry = sMapStorage.LookupEntry<MapEntry>(obj->GetMapId());
    const auto *zoneEntry = AreaEntry::GetById(zone_id);
    const auto *areaEntry = AreaEntry::GetById(area_id);

    float zone_x = obj->GetPositionX();
    float zone_y = obj->GetPositionY();

    if (!Map2ZoneCoordinates(zone_x, zone_y, zone_id))
    {
        zone_x = 0;
        zone_y = 0;
    }

    Map const *map = obj->GetMap();
    float ground_z = map->GetHeight(obj->GetPositionX(), obj->GetPositionY(), MAX_HEIGHT);
    float floor_z = map->GetHeight(obj->GetPositionX(), obj->GetPositionY(), obj->GetPositionZ());

    GridPair p = MaNGOS::ComputeGridPair(obj->GetPositionX(), obj->GetPositionY());

    int gx = 63 - p.x_coord;
    int gy = 63 - p.y_coord;

    uint32 have_map = GridMap::ExistMap(obj->GetMapId(), gx, gy) ? 1 : 0;
    uint32 have_vmap = GridMap::ExistVMap(obj->GetMapId(), gx, gy) ? 1 : 0;

    TerrainInfo const* terrain = obj->GetTerrain();
    if (have_vmap)
    {
        if (terrain->IsOutdoors(obj->GetPositionX(), obj->GetPositionY(), obj->GetPositionZ()))
            PSendSysMessage("You are OUTdoor");
        else
            PSendSysMessage("You are INdoor");
    }
    else PSendSysMessage("no VMAP available for area info");

    std::string zoneName = "<unknown>";
    std::string areaName = "<unknown>";

    if (zoneEntry)
    {
        zoneName = zoneEntry->Name;
        sObjectMgr.GetAreaLocaleString(zoneEntry->Id, GetSessionDbLocaleIndex(), &zoneName);
    }

    if (areaEntry)
    {
        areaName = areaEntry->Name;
        sObjectMgr.GetAreaLocaleString(areaEntry->Id, GetSessionDbLocaleIndex(), &areaName);
    }

    PSendSysMessage(LANG_MAP_POSITION,
                    obj->GetMapId(), (mapEntry ? mapEntry->name : "<unknown>"),
                    zone_id, zoneName.c_str(), area_id, areaName.c_str(),
                    obj->GetPositionX(), obj->GetPositionY(), obj->GetPositionZ(), obj->GetOrientation(),
                    cell.GridX(), cell.GridY(), cell.CellX(), cell.CellY(), obj->GetInstanceId(),
                    zone_x, zone_y, ground_z, floor_z, have_map, have_vmap);

    DEBUG_LOG("Player %s GPS call for %s '%s' (%s: %u):",
              m_session ? GetNameLink().c_str() : GetMangosString(LANG_CONSOLE_COMMAND),
              (obj->GetTypeId() == TYPEID_PLAYER ? "player" : "creature"), obj->GetName(),
              (obj->GetTypeId() == TYPEID_PLAYER ? "GUID" : "Entry"), (obj->GetTypeId() == TYPEID_PLAYER ? obj->GetGUIDLow() : obj->GetEntry()));

    if (zoneEntry)
        sObjectMgr.GetAreaLocaleString(zoneEntry->Id, sWorld.GetDefaultDbcLocale(), &zoneName);

    if (areaEntry)
        sObjectMgr.GetAreaLocaleString(areaEntry->Id, sWorld.GetDefaultDbcLocale(), &areaName);

    DEBUG_LOG(GetMangosString(LANG_MAP_POSITION),
              obj->GetMapId(), (mapEntry ? mapEntry->name : "<unknown>"),
              zone_id, zoneName.c_str(), area_id, areaName.c_str(),
              obj->GetPositionX(), obj->GetPositionY(), obj->GetPositionZ(), obj->GetOrientation(),
              cell.GridX(), cell.GridY(), cell.CellX(), cell.CellY(), obj->GetInstanceId(),
              zone_x, zone_y, ground_z, floor_z, have_map, have_vmap);

    GridMapLiquidData liquid_status;
    GridMapLiquidStatus res = terrain->getLiquidStatus(obj->GetPositionX(), obj->GetPositionY(), obj->GetPositionZ(), MAP_ALL_LIQUIDS, &liquid_status);
    if (res)
        PSendSysMessage(LANG_LIQUID_STATUS, liquid_status.level, liquid_status.depth_level, liquid_status.type_flags, res);
    return true;
}

bool ChatHandler::HandleGetDistanceCommand(char* args)
{
    WorldObject* obj = nullptr;

    if (*args)
    {
        if (ObjectGuid guid = ExtractGuidFromLink(&args))
            obj = (WorldObject*)m_session->GetPlayer()->GetObjectByTypeMask(guid, TYPEMASK_CREATURE_OR_GAMEOBJECT);

        if (!obj)
        {
            SendSysMessage(LANG_PLAYER_NOT_FOUND);
            SetSentErrorMessage(true);
            return false;
        }
    }
    else
    {
        obj = GetSelectedUnit();

        if (!obj)
        {
            SendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
            SetSentErrorMessage(true);
            return false;
        }
    }

    Player* player = m_session->GetPlayer();
    // Calculate point-to-point distance
    float dx, dy, dz;
    dx = player->GetPositionX() - obj->GetPositionX();
    dy = player->GetPositionY() - obj->GetPositionY();
    dz = player->GetPositionZ() - obj->GetPositionZ();

    PSendSysMessage(LANG_DISTANCE, player->GetDistance(obj), player->GetDistance2d(obj), sqrt(dx * dx + dy * dy + dz * dz));

    return true;
}

bool ChatHandler::HandleGetAngleCommand(char* args)
{
    WorldObject* obj = nullptr;

    if (*args)
    {
        if (ObjectGuid guid = ExtractGuidFromLink(&args))
            obj = (WorldObject*)m_session->GetPlayer()->GetObjectByTypeMask(guid, TYPEMASK_CREATURE_OR_GAMEOBJECT);

        if (!obj)
        {
            SendSysMessage(LANG_PLAYER_NOT_FOUND);
            SetSentErrorMessage(true);
            return false;
        }
    }
    else
    {
        obj = GetSelectedUnit();

        if (!obj)
        {
            SendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
            SetSentErrorMessage(true);
            return false;
        }
    }

    Player* player = m_session->GetPlayer();
    float angle = player->GetAngle(obj);
    PSendSysMessage("You are at a %f angle to %s.", angle, obj->GetName());

    return true;
}

bool ChatHandler::HandleFreezeCommand(char* args)
{
    Unit* pTarget = GetSelectedUnit();
    if (!pTarget)
        return false;
    pTarget->CastSpell(pTarget, 9454, true);
    return true;
}

bool ChatHandler::HandleUnfreezeCommand(char* args)
{
    Unit* pTarget = GetSelectedUnit();
    if (!pTarget)
        return false;
    pTarget->RemoveAurasDueToSpell(9454);
    return true;
}

bool ChatHandler::HandlePossessCommand(char *args)
{
    Unit *tar = GetSelectedUnit();
    if (!tar)
    {
        SendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        return false;
    }
    m_session->GetPlayer()->CastSpell(tar, 530, true);
    return true;
}

//.auraname spell player duration
bool ChatHandler::HandleNameAuraCommand(char* args)
{
    // number or [name] Shift-click form |color|Hspell:spell_id|h[name]|h|r or Htalent form
    uint32 spellID = ExtractSpellIdFromLink(&args);
    if (!spellID)
        return false;

    char* nameStr = ExtractArg(&args);
    Player* target;
    ObjectGuid target_guid;
    std::string target_name;
    if (!ExtractPlayerTarget(&nameStr, &target, &target_guid, &target_name))
        return false;

    // Aura duration in seconds
    int32 duration = 0;
    ExtractInt32(&args, duration);
    return HandleAuraHelper(spellID, duration, target);
}

bool ChatHandler::HandleAuraHelper(uint32 spellID, int32 duration, Unit* unit)
{
    SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(spellID);
    if (!spellInfo)
        return false;

    if (!spellInfo->IsSpellAppliesAura((1 << EFFECT_INDEX_0) | (1 << EFFECT_INDEX_1) | (1 << EFFECT_INDEX_2)) &&
        !spellInfo->HasEffect(SPELL_EFFECT_PERSISTENT_AREA_AURA))
    {
        PSendSysMessage(LANG_SPELL_NO_HAVE_AURAS, spellID);
        SetSentErrorMessage(true);
        return false;
    }


    SpellAuraHolder* holder = CreateSpellAuraHolder(spellInfo, unit, m_session->GetPlayer());


    if (duration > 0)
        holder->SetAuraDuration(duration * IN_MILLISECONDS);

    for (uint32 i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        uint8 eff = spellInfo->Effect[i];
        if (eff >= TOTAL_SPELL_EFFECTS)
            continue;
        if (Spells::IsAreaAuraEffect(eff) ||
            eff == SPELL_EFFECT_APPLY_AURA ||
            eff == SPELL_EFFECT_PERSISTENT_AREA_AURA)
        {
            Aura* aur = CreateAura(spellInfo, SpellEffectIndex(i), NULL, holder, unit);
            holder->AddAura(aur, SpellEffectIndex(i));
        }
    }
    if (!unit->AddSpellAuraHolder(holder))
        holder = nullptr;
    return true;
}

bool ChatHandler::HandleAuraCommand(char* args)
{
    Unit* target = GetSelectedUnit();
    if (!target)
    {
        SendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    // number or [name] Shift-click form |color|Hspell:spell_id|h[name]|h|r or Htalent form
    uint32 spellID = ExtractSpellIdFromLink(&args);
    // Aura duration in seconds
    int32 duration = 0;
    ExtractInt32(&args, duration);

    return HandleAuraHelper(spellID, duration, target);
}

bool ChatHandler::HandleUnAuraCommand(char* args)
{
    Unit *target = GetSelectedUnit();
    if (!target)
    {
        SendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    std::string argstr = args;
    if (argstr == "all")
    {
        target->RemoveAllAuras();
        return true;
    }

    // number or [name] Shift-click form |color|Hspell:spell_id|h[name]|h|r or Htalent form
    uint32 spellID = ExtractSpellIdFromLink(&args);
    if (!spellID)
        return false;

    target->RemoveAurasDueToSpell(spellID);

    return true;
}

bool ChatHandler::HandleListAurasCommand(char* /*args*/)
{
    Unit *unit = GetSelectedUnit();
    if (!unit)
    {
        SendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    char const* talentStr = GetMangosString(LANG_TALENT);
    char const* passiveStr = GetMangosString(LANG_PASSIVE);

    Unit::SpellAuraHolderMap const& uAuras = unit->GetSpellAuraHolderMap();
    PSendSysMessage(LANG_COMMAND_TARGET_LISTAURAS, uAuras.size());
    for (Unit::SpellAuraHolderMap::const_iterator itr = uAuras.begin(); itr != uAuras.end(); ++itr)
    {
        bool talent = GetTalentSpellCost(itr->second->GetId()) > 0;

        SpellAuraHolder *holder = itr->second;
        char const* name = holder->GetSpellProto()->SpellName[GetSessionDbcLocale()].c_str();

        for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
        {
            Aura *aur = holder->GetAuraByEffectIndex(SpellEffectIndex(i));
            if (!aur)
                continue;

            if (m_session)
            {
                std::ostringstream ss_name;
                ss_name << "|cffffffff|Hspell:" << itr->second->GetId() << "|h[" << name << "]|h|r";

                PSendSysMessage(LANG_COMMAND_TARGET_AURADETAIL, holder->GetId(), aur->GetEffIndex(),
                    aur->GetModifier()->m_auraname, aur->GetAuraDuration(), aur->GetAuraMaxDuration(),
                    ss_name.str().c_str(),
                    (holder->IsPassive() ? passiveStr : ""), (talent ? talentStr : ""),
                    holder->GetCasterGuid().GetString().c_str());
            }
            else
            {
                PSendSysMessage(LANG_COMMAND_TARGET_AURADETAIL, holder->GetId(), aur->GetEffIndex(),
                    aur->GetModifier()->m_auraname, aur->GetAuraDuration(), aur->GetAuraMaxDuration(),
                    name,
                    (holder->IsPassive() ? passiveStr : ""), (talent ? talentStr : ""),
                    holder->GetCasterGuid().GetString().c_str());
            }
        }
    }

    return true;
}

bool ChatHandler::HandleCastCommand(char* args)
{
    if (!*args)
        return false;

    Unit* target = GetSelectedUnit();

    if (!target)
    {
        SendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    // number or [name] Shift-click form |color|Hspell:spell_id|h[name]|h|r or Htalent form
    uint32 spell = ExtractSpellIdFromLink(&args);
    if (!spell)
        return false;

    SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(spell);
    if (!spellInfo)
        return false;

    if (!SpellMgr::IsSpellValid(spellInfo, m_session->GetPlayer()))
    {
        PSendSysMessage(LANG_COMMAND_SPELL_BROKEN, spell);
        SetSentErrorMessage(true);
        return false;
    }

    bool triggered = ExtractLiteralArg(&args, "triggered") != NULL;
    if (!triggered && *args)                                // can be fail also at syntax error
        return false;

    m_session->GetPlayer()->CastSpell(target, spell, triggered);

    return true;
}

bool ChatHandler::HandleCastBackCommand(char* args)
{
    Unit* caster = GetSelectedUnit();

    if (!caster)
    {
        SendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    // number or [name] Shift-click form |color|Hspell:spell_id|h[name]|h|r
    // number or [name] Shift-click form |color|Hspell:spell_id|h[name]|h|r or Htalent form
    uint32 spell = ExtractSpellIdFromLink(&args);
    if (!spell || !sSpellMgr.GetSpellEntry(spell))
        return false;

    bool triggered = ExtractLiteralArg(&args, "triggered") != NULL;
    if (!triggered && *args)                                // can be fail also at syntax error
        return false;

    caster->SetFacingToObject(m_session->GetPlayer());

    caster->CastSpell(m_session->GetPlayer(), spell, triggered);

    return true;
}

bool ChatHandler::HandleCastDistCommand(char* args)
{
    if (!*args)
        return false;

    // number or [name] Shift-click form |color|Hspell:spell_id|h[name]|h|r or Htalent form
    uint32 spell = ExtractSpellIdFromLink(&args);
    if (!spell)
        return false;

    SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(spell);
    if (!spellInfo)
        return false;

    if (!SpellMgr::IsSpellValid(spellInfo, m_session->GetPlayer()))
    {
        PSendSysMessage(LANG_COMMAND_SPELL_BROKEN, spell);
        SetSentErrorMessage(true);
        return false;
    }

    float dist;
    if (!ExtractFloat(&args, dist))
        return false;

    bool triggered = ExtractLiteralArg(&args, "triggered") != NULL;
    if (!triggered && *args)                                // can be fail also at syntax error
        return false;

    float x, y, z;
    m_session->GetPlayer()->GetClosePoint(x, y, z, dist);

    m_session->GetPlayer()->CastSpell(x, y, z, spell, triggered);
    return true;
}

bool ChatHandler::HandleCastTargetCommand(char* args)
{
    Unit* caster = GetSelectedUnit();

    if (!caster)
    {
        SendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    if (!caster->getVictim())
    {
        SendSysMessage(LANG_SELECTED_TARGET_NOT_HAVE_VICTIM);
        SetSentErrorMessage(true);
        return false;
    }

    // number or [name] Shift-click form |color|Hspell:spell_id|h[name]|h|r or Htalent form
    uint32 spell = ExtractSpellIdFromLink(&args);
    if (!spell || !sSpellMgr.GetSpellEntry(spell))
        return false;

    bool triggered = ExtractLiteralArg(&args, "triggered") != NULL;
    if (!triggered && *args)                                // can be fail also at syntax error
        return false;

    caster->SetFacingToObject(m_session->GetPlayer());

    caster->CastSpell(caster->getVictim(), spell, triggered);

    return true;
}

bool ChatHandler::HandleCastSelfCommand(char* args)
{
    if (!*args)
        return false;

    Unit* target = GetSelectedUnit();

    if (!target)
    {
        SendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    // number or [name] Shift-click form |color|Hspell:spell_id|h[name]|h|r or Htalent form
    uint32 spell = ExtractSpellIdFromLink(&args);
    if (!spell)
        return false;

    SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(spell);
    if (!spellInfo)
        return false;

    if (!SpellMgr::IsSpellValid(spellInfo, m_session->GetPlayer()))
    {
        PSendSysMessage(LANG_COMMAND_SPELL_BROKEN, spell);
        SetSentErrorMessage(true);
        return false;
    }

    bool triggered = ExtractLiteralArg(&args, "triggered") != NULL;
    if (!triggered && *args)                                // can be fail also at syntax error
        return false;

    target->CastSpell(target, spell, triggered);

    return true;
}

bool ChatHandler::HandleModifyStrengthCommand(char *args)
{
    if (!*args)
        return false;

    Unit* pTarget = GetSelectedUnit();

    if (!pTarget)
    {
        PSendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    int32 amount;
    if (!ExtractInt32(&args, amount))
        return false;

    if (amount < 0)
    {
        SendSysMessage(LANG_BAD_VALUE);
        SetSentErrorMessage(true);
        return false;
    }

    pTarget->SetModifierValue(UNIT_MOD_STAT_STRENGTH, BASE_VALUE, (float) amount);
    pTarget->UpdateAllStats();

    PSendSysMessage(LANG_YOU_CHANGE_STR, pTarget->GetName(), amount);

    if (needReportToTarget(pTarget->ToPlayer()))
        ChatHandler(pTarget->ToPlayer()).PSendSysMessage(LANG_YOURS_STR_CHANGED, GetNameLink().c_str(), amount);

    return true;
}

bool ChatHandler::HandleModifyAgilityCommand(char *args)
{
    if (!*args)
        return false;

    Unit* pTarget = GetSelectedUnit();

    if (!pTarget)
    {
        PSendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    int32 amount;
    if (!ExtractInt32(&args, amount))
        return false;

    if (amount < 0)
    {
        SendSysMessage(LANG_BAD_VALUE);
        SetSentErrorMessage(true);
        return false;
    }

    pTarget->SetModifierValue(UNIT_MOD_STAT_AGILITY, BASE_VALUE, (float) amount);
    pTarget->UpdateAllStats();

    PSendSysMessage(LANG_YOU_CHANGE_AGI, pTarget->GetName(), amount);

    if (needReportToTarget(pTarget->ToPlayer()))
        ChatHandler(pTarget->ToPlayer()).PSendSysMessage(LANG_YOURS_AGI_CHANGED, GetNameLink().c_str(), amount);

    return true;
}

bool ChatHandler::HandleModifyStaminaCommand(char *args)
{
    if (!*args)
        return false;

    Unit* pTarget = GetSelectedUnit();

    if (!pTarget)
    {
        PSendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    int32 amount;
    if (!ExtractInt32(&args, amount))
        return false;

    if (amount < 0)
    {
        SendSysMessage(LANG_BAD_VALUE);
        SetSentErrorMessage(true);
        return false;
    }

    pTarget->SetModifierValue(UNIT_MOD_STAT_STAMINA, BASE_VALUE, (float)amount);
    pTarget->UpdateAllStats();

    if (pTarget->isAlive())
        pTarget->SetHealth(pTarget->GetMaxHealth());

    PSendSysMessage(LANG_YOU_CHANGE_STA, pTarget->GetName(), amount);

    if (needReportToTarget(pTarget->ToPlayer()))
        ChatHandler(pTarget->ToPlayer()).PSendSysMessage(LANG_YOURS_STA_CHANGED, GetNameLink().c_str(), amount);

    return true;
}

bool ChatHandler::HandleModifyIntellectCommand(char *args)
{
    if (!*args)
        return false;

    Unit* pTarget = GetSelectedUnit();

    if (!pTarget)
    {
        PSendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    int32 amount;
    if (!ExtractInt32(&args, amount))
        return false;

    if (amount < 0)
    {
        SendSysMessage(LANG_BAD_VALUE);
        SetSentErrorMessage(true);
        return false;
    }

    pTarget->SetModifierValue(UNIT_MOD_STAT_INTELLECT, BASE_VALUE, (float) amount);
    pTarget->UpdateAllStats();

    PSendSysMessage(LANG_YOU_CHANGE_INT, pTarget->GetName(), amount);

    if (needReportToTarget(pTarget->ToPlayer()))
        ChatHandler(pTarget->ToPlayer()).PSendSysMessage(LANG_YOURS_INT_CHANGED, GetNameLink().c_str(), amount);

    return true;
}

bool ChatHandler::HandleModifySpiritCommand(char *args)
{
    if (!*args)
        return false;

    Unit* pTarget = GetSelectedUnit();

    if (!pTarget)
    {
        PSendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    int32 amount;
    if (!ExtractInt32(&args, amount))
        return false;

    if (amount < 0)
    {
        SendSysMessage(LANG_BAD_VALUE);
        SetSentErrorMessage(true);
        return false;
    }

    pTarget->SetModifierValue(UNIT_MOD_STAT_SPIRIT, BASE_VALUE, (float) amount);
    pTarget->UpdateAllStats();

    PSendSysMessage(LANG_YOU_CHANGE_SPI, pTarget->GetName(), amount);

    if (needReportToTarget(pTarget->ToPlayer()))
        ChatHandler(pTarget->ToPlayer()).PSendSysMessage(LANG_YOURS_SPI_CHANGED, GetNameLink().c_str(), amount);

    return true;
}

bool ChatHandler::HandleModifyArmorCommand(char *args)
{
    if (!*args)
        return false;

    Unit* pTarget = GetSelectedUnit();

    if (!pTarget)
    {
        PSendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    int32 amount;
    if (!ExtractInt32(&args, amount))
        return false;

    if (amount < 0)
    {
        SendSysMessage(LANG_BAD_VALUE);
        SetSentErrorMessage(true);
        return false;
    }

    pTarget->SetInt32Value(UNIT_FIELD_RESISTANCES, amount);

    PSendSysMessage(LANG_YOU_CHANGE_ARMOR, pTarget->GetName(), amount);

    if (needReportToTarget(pTarget->ToPlayer()))
        ChatHandler(pTarget->ToPlayer()).PSendSysMessage(LANG_YOURS_ARMOR_CHANGED, GetNameLink().c_str(), amount);

    return true;
}

bool ChatHandler::HandleModifyHolyCommand(char *args)
{
    if (!*args)
        return false;

    Unit* pTarget = GetSelectedUnit();

    if (!pTarget)
    {
        PSendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    int32 amount;
    if (!ExtractInt32(&args, amount))
        return false;

    pTarget->SetInt32Value(UNIT_FIELD_RESISTANCES_01, amount);

    PSendSysMessage(LANG_YOU_CHANGE_HOLY, pTarget->GetName(), amount);

    if (needReportToTarget(pTarget->ToPlayer()))
        ChatHandler(pTarget->ToPlayer()).PSendSysMessage(LANG_YOURS_HOLY_CHANGED, GetNameLink().c_str(), amount);

    return true;
}

bool ChatHandler::HandleModifyFireCommand(char *args)
{
    if (!*args)
        return false;

    Unit* pTarget = GetSelectedUnit();

    if (!pTarget)
    {
        PSendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    int32 amount;
    if (!ExtractInt32(&args, amount))
        return false;

    pTarget->SetInt32Value(UNIT_FIELD_RESISTANCES_02, amount);

    PSendSysMessage(LANG_YOU_CHANGE_FIRE, pTarget->GetName(), amount);

    if (needReportToTarget(pTarget->ToPlayer()))
        ChatHandler(pTarget->ToPlayer()).PSendSysMessage(LANG_YOURS_FIRE_CHANGED, GetNameLink().c_str(), amount);

    return true;
}

bool ChatHandler::HandleModifyNatureCommand(char *args)
{
    if (!*args)
        return false;

    Unit* pTarget = GetSelectedUnit();

    if (!pTarget)
    {
        PSendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    int32 amount;
    if (!ExtractInt32(&args, amount))
        return false;

    pTarget->SetInt32Value(UNIT_FIELD_RESISTANCES_03, amount);

    PSendSysMessage(LANG_YOU_CHANGE_NATURE, pTarget->GetName(), amount);

    if (needReportToTarget(pTarget->ToPlayer()))
        ChatHandler(pTarget->ToPlayer()).PSendSysMessage(LANG_YOURS_NATURE_CHANGED, GetNameLink().c_str(), amount);

    return true;
}

bool ChatHandler::HandleModifyFrostCommand(char *args)
{
    if (!*args)
        return false;

    Unit* pTarget = GetSelectedUnit();

    if (!pTarget)
    {
        PSendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    int32 amount;
    if (!ExtractInt32(&args, amount))
        return false;

    pTarget->SetInt32Value(UNIT_FIELD_RESISTANCES_04, amount);

    PSendSysMessage(LANG_YOU_CHANGE_FROST, pTarget->GetName(), amount);

    if (needReportToTarget(pTarget->ToPlayer()))
        ChatHandler(pTarget->ToPlayer()).PSendSysMessage(LANG_YOURS_FROST_CHANGED, GetNameLink().c_str(), amount);

    return true;
}

bool ChatHandler::HandleModifyShadowCommand(char *args)
{
    if (!*args)
        return false;

    Unit* pTarget = GetSelectedUnit();

    if (!pTarget)
    {
        PSendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    int32 amount;
    if (!ExtractInt32(&args, amount))
        return false;

    pTarget->SetInt32Value(UNIT_FIELD_RESISTANCES_05, amount);

    PSendSysMessage(LANG_YOU_CHANGE_SHADOW, pTarget->GetName(), amount);

    if (needReportToTarget(pTarget->ToPlayer()))
        ChatHandler(pTarget->ToPlayer()).PSendSysMessage(LANG_YOURS_SHADOW_CHANGED, GetNameLink().c_str(), amount);

    return true;
}

bool ChatHandler::HandleModifyArcaneCommand(char *args)
{
    if (!*args)
        return false;

    Unit* pTarget = GetSelectedUnit();

    if (!pTarget)
    {
        PSendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    int32 amount;
    if (!ExtractInt32(&args, amount))
        return false;

    pTarget->SetInt32Value(UNIT_FIELD_RESISTANCES_06, amount);

    PSendSysMessage(LANG_YOU_CHANGE_ARCANE, pTarget->GetName(), amount);

    if (needReportToTarget(pTarget->ToPlayer()))
        ChatHandler(pTarget->ToPlayer()).PSendSysMessage(LANG_YOURS_ARCANE_CHANGED, GetNameLink().c_str(), amount);

    return true;
}

bool ChatHandler::HandleModifyMeleeApCommand(char *args)
{
    if (!*args)
        return false;

    Unit* pTarget = GetSelectedUnit();

    if (!pTarget)
    {
        PSendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    int32 amount;
    if (!ExtractInt32(&args, amount))
        return false;

    if (amount <= 0)
    {
        SendSysMessage(LANG_BAD_VALUE);
        SetSentErrorMessage(true);
        return false;
    }

    pTarget->SetInt32Value(UNIT_FIELD_ATTACK_POWER, amount);
    pTarget->UpdateDamagePhysical(BASE_ATTACK);
    pTarget->UpdateDamagePhysical(OFF_ATTACK);

    PSendSysMessage(LANG_YOU_CHANGE_MELEEAP, pTarget->GetName(), amount);

    if (needReportToTarget(pTarget->ToPlayer()))
        ChatHandler(pTarget->ToPlayer()).PSendSysMessage(LANG_YOURS_MELEEAP_CHANGED, GetNameLink().c_str(), amount);

    return true;
}

bool ChatHandler::HandleModifyRangedApCommand(char *args)
{
    if (!*args)
        return false;

    Unit* pTarget = GetSelectedUnit();

    if (!pTarget)
    {
        PSendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    int32 amount;
    if (!ExtractInt32(&args, amount))
        return false;

    if (amount <= 0)
    {
        SendSysMessage(LANG_BAD_VALUE);
        SetSentErrorMessage(true);
        return false;
    }

    pTarget->SetInt32Value(UNIT_FIELD_RANGED_ATTACK_POWER, amount);
    pTarget->UpdateDamagePhysical(RANGED_ATTACK);

    PSendSysMessage(LANG_YOU_CHANGE_RANGEDAP, pTarget->GetName(), amount);

    if (needReportToTarget(pTarget->ToPlayer()))
        ChatHandler(pTarget->ToPlayer()).PSendSysMessage(LANG_YOURS_RANGEDAP_CHANGED, GetNameLink().c_str(), amount);

    return true;
}

bool ChatHandler::HandleModifySpellPowerCommand(char *args)
{
    if (!*args)
        return false;

    Unit* pTarget = GetSelectedUnit();

    if (!pTarget)
    {
        PSendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    int32 amount;
    if (!ExtractInt32(&args, amount))
        return false;

    if (amount < 0)
    {
        SendSysMessage(LANG_BAD_VALUE);
        SetSentErrorMessage(true);
        return false;
    }

    // dunno where spell power is stored so using a custom spell
    pTarget->RemoveAurasDueToSpell(18058);
    pTarget->CastCustomSpell(pTarget, 18058, &amount, &amount, NULL, true);

    PSendSysMessage(LANG_YOU_CHANGE_SP, pTarget->GetName(), amount);

    if (needReportToTarget(pTarget->ToPlayer()))
        ChatHandler(pTarget->ToPlayer()).PSendSysMessage(LANG_YOURS_SP_CHANGED, GetNameLink().c_str(), amount);

    return true;
}

bool ChatHandler::HandleModifyMainSpeedCommand(char *args)
{
    if (!*args)
        return false;

    Unit* pTarget = GetSelectedUnit();

    if (!pTarget)
    {
        PSendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    int32 amount;
    if (!ExtractInt32(&args, amount))
        return false;

    if (amount <= 0)
    {
        SendSysMessage(LANG_BAD_VALUE);
        SetSentErrorMessage(true);
        return false;
    }

    pTarget->SetFloatValue(UNIT_FIELD_BASEATTACKTIME, (float) amount);

    PSendSysMessage(LANG_YOU_CHANGE_MHSPD, pTarget->GetName(), amount);

    if (needReportToTarget(pTarget->ToPlayer()))
        ChatHandler(pTarget->ToPlayer()).PSendSysMessage(LANG_YOURS_MHSPD_CHANGED, GetNameLink().c_str(), amount);

    return true;
}

bool ChatHandler::HandleModifyOffSpeedCommand(char *args)
{
    if (!*args)
        return false;

    Unit* pTarget = GetSelectedUnit();

    if (!pTarget)
    {
        PSendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    int32 amount;
    if (!ExtractInt32(&args, amount))
        return false;

    if (amount <= 0)
    {
        SendSysMessage(LANG_BAD_VALUE);
        SetSentErrorMessage(true);
        return false;
    }

    pTarget->SetFloatValue(UNIT_FIELD_OFFHANDATTACKTIME, (float) amount);

    PSendSysMessage(LANG_YOU_CHANGE_OHSPD, pTarget->GetName(), amount);

    if (needReportToTarget(pTarget->ToPlayer()))
        ChatHandler(pTarget->ToPlayer()).PSendSysMessage(LANG_YOURS_OHSPD_CHANGED, GetNameLink().c_str(), amount);

    return true;
}

bool ChatHandler::HandleModifyRangedSpeedCommand(char *args)
{
    if (!*args)
        return false;

    Unit* pTarget = GetSelectedUnit();

    if (!pTarget)
    {
        PSendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    int32 amount;
    if (!ExtractInt32(&args, amount))
        return false;

    if (amount <= 0)
    {
        SendSysMessage(LANG_BAD_VALUE);
        SetSentErrorMessage(true);
        return false;
    }

    pTarget->SetFloatValue(UNIT_FIELD_RANGEDATTACKTIME, (float) amount);

    PSendSysMessage(LANG_YOU_CHANGE_RSPD, pTarget->GetName(), amount);

    if (needReportToTarget(pTarget->ToPlayer()))
        ChatHandler(pTarget->ToPlayer()).PSendSysMessage(LANG_YOURS_RSPD_CHANGED, GetNameLink().c_str(), amount);

    return true;
}

bool ChatHandler::HandleModifyCastSpeedCommand(char *args)
{
    if (!*args)
        return false;

    Unit* pTarget = GetSelectedUnit();

    if (!pTarget)
    {
        PSendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    float amount;
    if (!ExtractFloat(&args, amount))
        return false;

    // This field is an Int32 before 1.12.
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_12_1
    if (amount < 0)
    {
        SendSysMessage(LANG_BAD_VALUE);
        SetSentErrorMessage(true);
        return false;
    }

    pTarget->SetFloatValue(UNIT_MOD_CAST_SPEED, amount);
#else
    pTarget->SetInt32Value(UNIT_MOD_CAST_SPEED, amount);
#endif

    PSendSysMessage(LANG_YOU_CHANGE_CSPD, pTarget->GetName(), amount);

    if (needReportToTarget(pTarget->ToPlayer()))
        ChatHandler(pTarget->ToPlayer()).PSendSysMessage(LANG_YOURS_CSPD_CHANGED, GetNameLink().c_str(), amount);

    return true;
}

bool ChatHandler::HandleModifyCrCommand(char *args)
{
    if (!*args)
        return false;

    Unit* target = GetSelectedUnit();
    if (!target) return false;
    float f;
    if (!ExtractFloat(&args, f))
        return false;

    target->SetFloatValue(UNIT_FIELD_COMBATREACH, f);
    return true;
}

bool ChatHandler::HandleModifyBrCommand(char *args)
{
    if (!*args)
        return false;

    Unit* target = GetSelectedUnit();
    if (!target) return false;
    float f;
    if (!ExtractFloat(&args, f))
        return false;

    target->SetFloatValue(UNIT_FIELD_BOUNDINGRADIUS, f);
    return true;
}

bool ChatHandler::HandleDeMorphCommand(char* /*args*/)
{
    Unit *target = GetSelectedUnit();
    if (!target)
        target = m_session->GetPlayer();
    // check online security
    else if (target->GetTypeId() == TYPEID_PLAYER && HasLowerSecurity((Player*)target))
        return false;

    target->DeMorph();

    return true;
}

bool ChatHandler::HandleModifyMorphCommand(char* args)
{
    if (!*args)
        return false;

    uint16 display_id = (uint16)atoi(args);

    Unit *target = GetSelectedUnit();
    if (!target)
        target = m_session->GetPlayer();

    // check online security
    else if (target->GetTypeId() == TYPEID_PLAYER && HasLowerSecurity((Player*)target))
        return false;

    target->SetDisplayId(display_id);

    return true;
}

bool ChatHandler::HandleModifyEmoteStateCommand(char* args)
{
    Unit* pTarget = GetSelectedUnit();

    if (!pTarget)
    {
        PSendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    uint32 anim_id;
    if (!ExtractUInt32(&args, anim_id))
        return false;

    if (!sEmotesStore.LookupEntry(anim_id))
        return false;

    pTarget->HandleEmoteState(anim_id);

    return true;
}

bool ChatHandler::HandleModifyFactionCommand(char* args)
{
    Unit* chr = GetSelectedUnit();
    if (!chr)
    {
        SendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    if (!*args)
    {
        if (chr)
        {
            uint32 factionid = chr->getFaction();
            uint32 flag      = chr->GetUInt32Value(UNIT_FIELD_FLAGS);
            uint32 npcflag   = chr->GetUInt32Value(UNIT_NPC_FLAGS);
            uint32 dyflag    = chr->GetUInt32Value(UNIT_DYNAMIC_FLAGS);
            PSendSysMessage(LANG_CURRENT_FACTION, chr->GetGUIDLow(), factionid, flag, npcflag, dyflag);
        }
        return true;
    }

    if (!chr)
    {
        SendSysMessage(LANG_NO_CHAR_SELECTED);
        SetSentErrorMessage(true);
        return false;
    }

    uint32 factionid;
    if (!ExtractUint32KeyFromLink(&args, "Hfaction", factionid))
        return false;

    if (!sObjectMgr.GetFactionTemplateEntry(factionid))
    {
        PSendSysMessage(LANG_WRONG_FACTION, factionid);
        SetSentErrorMessage(true);
        return false;
    }

    uint32 flag;
    if (!ExtractOptUInt32(&args, flag, chr->GetUInt32Value(UNIT_FIELD_FLAGS)))
        return false;

    uint32 npcflag;
    if (!ExtractOptUInt32(&args, npcflag, chr->GetUInt32Value(UNIT_NPC_FLAGS)))
        return false;

    uint32  dyflag;
    if (!ExtractOptUInt32(&args, dyflag, chr->GetUInt32Value(UNIT_DYNAMIC_FLAGS)))
        return false;

    PSendSysMessage(LANG_YOU_CHANGE_FACTION, chr->GetGUIDLow(), factionid, flag, npcflag, dyflag);

    chr->setFaction(factionid);
    chr->SetUInt32Value(UNIT_FIELD_FLAGS, flag);
    chr->SetUInt32Value(UNIT_NPC_FLAGS, npcflag);
    chr->SetUInt32Value(UNIT_DYNAMIC_FLAGS, dyflag);

    return true;
}

bool ChatHandler::HandleModifyASpeedCommand(char* args)
{
    if (!*args)
        return false;

    float modSpeed = (float)atof(args);

    if (modSpeed > 4.0f && GetAccessLevel() < SEC_BASIC_ADMIN)
        modSpeed = 4.0f;

    if (modSpeed > 100 || modSpeed < 0)
    {
        SendSysMessage(LANG_BAD_VALUE);
        SetSentErrorMessage(true);
        return false;
    }

    Unit *chr = GetSelectedUnit();
    if (chr == NULL)
    {
        SendSysMessage(LANG_NO_CHAR_SELECTED);
        SetSentErrorMessage(true);
        return false;
    }

    std::string chrNameLink = (chr->GetTypeId() == TYPEID_PLAYER) ? ((Player*)chr)->GetName() : "<creature>";

    if (chr->IsTaxiFlying())
    {
        PSendSysMessage(LANG_CHAR_IN_FLIGHT, chrNameLink.c_str());
        SetSentErrorMessage(true);
        return false;
    }
    PSendSysMessage(LANG_YOU_CHANGE_ASPEED, modSpeed, chrNameLink.c_str());

    chr->UpdateSpeed(MOVE_WALK, false, modSpeed);
    chr->UpdateSpeed(MOVE_RUN, false, modSpeed);
    chr->UpdateSpeed(MOVE_SWIM, false, modSpeed);

    return true;
}

bool ChatHandler::HandleModifyScaleCommand(char* args)
{
    if (!*args)
        return false;

    float Scale = (float)atof(args);
    if (Scale > 100.0f || Scale <= 0.0f)
    {
        SendSysMessage(LANG_BAD_VALUE);
        SetSentErrorMessage(true);
        return false;
    }

    Unit *target = GetSelectedUnit();
    if (target == NULL)
    {
        SendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    if (target->GetTypeId() == TYPEID_PLAYER)
    {
        // check online security
        if (HasLowerSecurity((Player*)target))
            return false;

        PSendSysMessage(LANG_YOU_CHANGE_SIZE, Scale, GetNameLink((Player*)target).c_str());
        if (needReportToTarget((Player*)target))
            ChatHandler((Player*)target).PSendSysMessage(LANG_YOURS_SIZE_CHANGED, GetNameLink().c_str(), Scale);
    }

    target->SetObjectScale(Scale);
    target->UpdateModelData();

    return true;
}

bool ChatHandler::HandleModifyHPCommand(char* args)
{
    if (!*args)
        return false;

    int32 hp = 0;
    int32 hpm = 0;
    ExtractInt32(&args, hp);
    ExtractInt32(&args, hpm);

    if (hpm < hp)
        hpm = hp;

    if (hp <= 0)
    {
        SendSysMessage(LANG_BAD_VALUE);
        SetSentErrorMessage(true);
        return false;
    }

    Unit *chr = GetSelectedUnit();
    if (chr == NULL)
    {
        SendSysMessage(LANG_NO_CHAR_SELECTED);
        SetSentErrorMessage(true);
        return false;
    }

    // check online security
    if (chr->GetTypeId() == TYPEID_PLAYER && HasLowerSecurity(chr->ToPlayer()))
        return false;

    PSendSysMessage(LANG_YOU_CHANGE_HP, chr->ToPlayer() ? GetNameLink(chr->ToPlayer()).c_str() : "<creature>", hp, hpm);
    if (chr->GetTypeId() == TYPEID_PLAYER && needReportToTarget(chr->ToPlayer()))
        ChatHandler(chr->ToPlayer()).PSendSysMessage(LANG_YOURS_HP_CHANGED, GetNameLink().c_str(), hp, hpm);

    chr->SetMaxHealth(hpm);
    chr->SetHealth(hp);

    return true;
}

bool ChatHandler::HandleModifyManaCommand(char* args)
{
    if (!*args)
        return false;

    int32 mana = 0;
    int32 manam = 0;
    ExtractInt32(&args, mana);
    ExtractInt32(&args, manam);

    if (manam < mana)
        manam = mana;

    if (mana <= 0)
    {
        SendSysMessage(LANG_BAD_VALUE);
        SetSentErrorMessage(true);
        return false;
    }

    Unit *chr = GetSelectedUnit();
    if (chr == NULL)
    {
        SendSysMessage(LANG_NO_CHAR_SELECTED);
        SetSentErrorMessage(true);
        return false;
    }

    // check online security
    if (chr->GetTypeId() == TYPEID_PLAYER && HasLowerSecurity(chr->ToPlayer()))
        return false;

    PSendSysMessage(LANG_YOU_CHANGE_MANA, chr->ToPlayer() ? GetNameLink(chr->ToPlayer()).c_str() : "<creature>", mana, manam);
    if (chr->GetTypeId() == TYPEID_PLAYER && needReportToTarget(chr->ToPlayer()))
        ChatHandler(chr->ToPlayer()).PSendSysMessage(LANG_YOURS_MANA_CHANGED, GetNameLink().c_str(), mana, manam);

    chr->SetMaxPower(POWER_MANA, manam);
    chr->SetPower(POWER_MANA, mana);

    return true;
}

bool ChatHandler::HandleReplenishCommand(char* args)
{
    Unit *pUnit = GetSelectedUnit();
    if (!pUnit || !pUnit->isAlive())
    {
        SendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    pUnit->SetHealth(pUnit->GetMaxHealth());

    if (pUnit->getPowerType() == POWER_MANA)
        pUnit->SetPower(POWER_MANA, pUnit->GetMaxPower(POWER_MANA));

    return true;
}

bool ChatHandler::HandleDamageCommand(char* args)
{
    if (!*args)
        return false;

    Unit* target = GetSelectedUnit();

    if (!target || !m_session->GetPlayer()->GetSelectionGuid())
    {
        SendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    if (!target->isAlive())
        return true;

    int32 damage_int;
    if (!ExtractInt32(&args, damage_int))
        return false;

    if (damage_int <= 0)
        return true;

    uint32 damage = uint32(damage_int);

    // flat melee damage without resistence/etc reduction
    if (!*args)
    {
        m_session->GetPlayer()->DealDamage(target, damage, NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
        if (target != m_session->GetPlayer())
            m_session->GetPlayer()->SendAttackStateUpdate(HITINFO_NORMALSWING2, target, 1, SPELL_SCHOOL_MASK_NORMAL, damage, 0, 0, VICTIMSTATE_NORMAL, 0);
        return true;
    }

    uint32 school;
    if (!ExtractUInt32(&args, school))
        return false;

    if (school >= MAX_SPELL_SCHOOL)
        return false;

    SpellSchoolMask schoolmask = GetSchoolMask(school);

    if (schoolmask & SPELL_SCHOOL_MASK_NORMAL)
        damage = m_session->GetPlayer()->CalcArmorReducedDamage(target, damage);

    // melee damage by specific school
    if (!*args)
    {
        uint32 absorb = 0;
        int32 resist = 0;

        target->CalculateDamageAbsorbAndResist(m_session->GetPlayer(), schoolmask, SPELL_DIRECT_DAMAGE, damage, &absorb, &resist, NULL);

        const uint32 bonus = (resist < 0 ? uint32(std::abs(resist)) : 0);
        damage += bonus;
        const uint32 malus = (resist > 0 ? (absorb + uint32(resist)) : absorb);

        if (damage <= malus)
            return true;

        damage -= malus;

        m_session->GetPlayer()->DealDamageMods(target, damage, &absorb);
        m_session->GetPlayer()->DealDamage(target, damage, NULL, DIRECT_DAMAGE, schoolmask, NULL, false);
        m_session->GetPlayer()->SendAttackStateUpdate(HITINFO_NORMALSWING2, target, 1, schoolmask, damage, absorb, resist, VICTIMSTATE_NORMAL, 0);
        return true;
    }

    // non-melee damage

    // number or [name] Shift-click form |color|Hspell:spell_id|h[name]|h|r or Htalent form
    uint32 spellid = ExtractSpellIdFromLink(&args);
    if (!spellid || !sSpellMgr.GetSpellEntry(spellid))
        return false;

    m_session->GetPlayer()->SpellNonMeleeDamageLog(target, spellid, damage);
    return true;
}

bool ChatHandler::HandleAoEDamageCommand(char* args)
{
    int32 damage_int = 1000;
    ExtractInt32(&args, damage_int);

    if (damage_int <= 0)
        return false;

    uint32 damage = uint32(damage_int);

    int32 max_range = 10;
    ExtractInt32(&args, max_range);

    if (max_range <= 0)
        return false;

    Player* pPlayer = m_session->GetPlayer();

    std::list<Unit*> targetsList;
    MaNGOS::AnyAoETargetUnitInObjectRangeCheck u_check(pPlayer, pPlayer, max_range);
    MaNGOS::UnitListSearcher<MaNGOS::AnyAoETargetUnitInObjectRangeCheck> searcher(targetsList, u_check);
    Cell::VisitAllObjects(pPlayer, searcher, max_range);

    for (Unit* pTarget : targetsList)
    {
        pPlayer->DealDamage(pTarget, damage, nullptr, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, nullptr, false);
        pPlayer->SendAttackStateUpdate(HITINFO_NORMALSWING2, pTarget, 1, SPELL_SCHOOL_MASK_NORMAL, damage, 0, 0, VICTIMSTATE_NORMAL, 0);
    }

    return true;
}

bool ChatHandler::HandleMovegensCommand(char* /*args*/)
{
    Unit* unit = GetSelectedUnit();
    if (!unit)
    {
        SendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    PSendSysMessage(LANG_MOVEGENS_LIST, (unit->GetTypeId() == TYPEID_PLAYER ? "Player" : "Creature"), unit->GetGUIDLow());

    MotionMaster* mm = unit->GetMotionMaster();
    float x, y, z;
    mm->GetDestination(x, y, z);
    for (MotionMaster::const_iterator itr = mm->begin(); itr != mm->end(); ++itr)
    {
        switch ((*itr)->GetMovementGeneratorType())
        {
            case IDLE_MOTION_TYPE:
                SendSysMessage(LANG_MOVEGENS_IDLE);
                break;
            case RANDOM_MOTION_TYPE:
                SendSysMessage(LANG_MOVEGENS_RANDOM);
                break;
            case WAYPOINT_MOTION_TYPE:
                SendSysMessage(LANG_MOVEGENS_WAYPOINT);
                break;
            case CONFUSED_MOTION_TYPE:
                SendSysMessage(LANG_MOVEGENS_CONFUSED);
                break;

            case CHASE_MOTION_TYPE:
            {
                Unit* target = NULL;
                if (unit->GetTypeId() == TYPEID_PLAYER)
                    target = static_cast<ChaseMovementGenerator<Player> const*>(*itr)->GetTarget();
                else
                    target = static_cast<ChaseMovementGenerator<Creature> const*>(*itr)->GetTarget();

                if (!target)
                    SendSysMessage(LANG_MOVEGENS_CHASE_NULL);
                else if (target->GetTypeId() == TYPEID_PLAYER)
                    PSendSysMessage(LANG_MOVEGENS_CHASE_PLAYER, target->GetName(), target->GetGUIDLow());
                else
                    PSendSysMessage(LANG_MOVEGENS_CHASE_CREATURE, target->GetName(), target->GetGUIDLow());
                break;
            }
            case FOLLOW_MOTION_TYPE:
            {
                Unit* target = NULL;
                if (unit->GetTypeId() == TYPEID_PLAYER)
                    target = static_cast<FollowMovementGenerator<Player> const*>(*itr)->GetTarget();
                else
                    target = static_cast<FollowMovementGenerator<Creature> const*>(*itr)->GetTarget();

                if (!target)
                    SendSysMessage(LANG_MOVEGENS_FOLLOW_NULL);
                else if (target->GetTypeId() == TYPEID_PLAYER)
                    PSendSysMessage(LANG_MOVEGENS_FOLLOW_PLAYER, target->GetName(), target->GetGUIDLow());
                else
                    PSendSysMessage(LANG_MOVEGENS_FOLLOW_CREATURE, target->GetName(), target->GetGUIDLow());
                break;
            }
            case HOME_MOTION_TYPE:
                if (unit->GetTypeId() == TYPEID_UNIT)
                    PSendSysMessage(LANG_MOVEGENS_HOME_CREATURE, x, y, z);
                else
                    SendSysMessage(LANG_MOVEGENS_HOME_PLAYER);
                break;
            case FLIGHT_MOTION_TYPE:
                SendSysMessage(LANG_MOVEGENS_FLIGHT);
                break;
            case POINT_MOTION_TYPE:
            {
                PSendSysMessage(LANG_MOVEGENS_POINT, x, y, z);
                break;
            }
            case FLEEING_MOTION_TYPE:
                SendSysMessage(LANG_MOVEGENS_FEAR);
                break;
            case DISTRACT_MOTION_TYPE:
                SendSysMessage(LANG_MOVEGENS_DISTRACT);
                break;
            default:
                PSendSysMessage(LANG_MOVEGENS_UNKNOWN, (*itr)->GetMovementGeneratorType());
                break;
        }
    }
    return true;
}

// .cooldown <spell_id_or_0> <name>
bool ChatHandler::HandleCooldownCommand(char* args)
{
    uint32 spell_id = ExtractSpellIdFromLink(&args);   
    std::string name = ExtractPlayerNameFromLink(&args);
    Unit* target = GetSelectedUnit();

    if (!name.empty())
        target = sObjectMgr.GetPlayer(name.c_str());

    if (!target)
    {
        SendSysMessage(LANG_PLAYER_NOT_FOUND);
        SetSentErrorMessage(true);
        return false;
    }

    std::string tNameLink = target->ToPlayer() ? GetNameLink(target->ToPlayer()) : target->GetName();

    if (!spell_id) {
        target->RemoveAllSpellCooldown();
        PSendSysMessage(LANG_REMOVEALL_COOLDOWN, tNameLink.c_str());
        return true;
    }

    if (!sSpellMgr.GetSpellEntry(spell_id))
    {
        PSendSysMessage(LANG_UNKNOWN_SPELL, target == m_session->GetPlayer() ? GetMangosString(LANG_YOU) : tNameLink.c_str());
        SetSentErrorMessage(true);
        return false;
    }

    target->RemoveSpellCooldown(spell_id, true);
    PSendSysMessage(LANG_REMOVE_COOLDOWN, spell_id, target == m_session->GetPlayer() ? GetMangosString(LANG_YOU) : tNameLink.c_str());
    return true;
}


bool ChatHandler::HandleNameDieCommand(char* args)
{
    char* nameStr = ExtractArg(&args);
    Player* target;
    ObjectGuid target_guid;
    std::string target_name;
    if (!ExtractPlayerTarget(&nameStr, &target, &target_guid, &target_name))
        return false;

    return HandleDieHelper(target);
}

bool ChatHandler::HandleDieCommand(char* /*args*/)
{
    Unit* target = GetSelectedUnit();
    return HandleDieHelper(target);
}

bool ChatHandler::HandleDieHelper(Unit* target)
{
    if (!target)
    {
        SendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    if (target->GetTypeId() == TYPEID_PLAYER)
    {
        if (HasLowerSecurity((Player*)target, ObjectGuid(), false))
            return false;
    }

    if (target->isAlive())
    {
        if (sWorld.getConfig(CONFIG_BOOL_DIE_COMMAND_CREDIT))
            m_session->GetPlayer()->DealDamage(target, target->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
        else
        {
            Creature* targetCreature = target->ToCreature();
            if (targetCreature)
                targetCreature->SetLootRecipient(NULL);
            target->DealDamage(target, target->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
        }
    }

    return true;
}

bool ChatHandler::HandleFearCommand(char* /*args*/)
{
    Unit* target = GetSelectedUnit();

    if (!target || !m_session->GetPlayer()->GetSelectionGuid())
    {
        SendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    const uint32 fearID = 26641;

    SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(fearID);
    if (!spellInfo)
        return false;

    if (!spellInfo->IsSpellAppliesAura((1 << EFFECT_INDEX_0) | (1 << EFFECT_INDEX_1) | (1 << EFFECT_INDEX_2)) &&
        !spellInfo->HasEffect(SPELL_EFFECT_PERSISTENT_AREA_AURA))
    {
        PSendSysMessage(LANG_SPELL_NO_HAVE_AURAS, fearID);
        SetSentErrorMessage(true);
        return false;
    }

    SpellAuraHolder *holder = CreateSpellAuraHolder(spellInfo, target, m_session->GetPlayer());

    for (uint32 i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        uint8 eff = spellInfo->Effect[i];
        if (eff >= TOTAL_SPELL_EFFECTS)
            continue;
        if (Spells::IsAreaAuraEffect(eff) ||
            eff == SPELL_EFFECT_APPLY_AURA ||
            eff == SPELL_EFFECT_PERSISTENT_AREA_AURA)
        {
            Aura *aur = CreateAura(spellInfo, SpellEffectIndex(i), NULL, holder, target);
            holder->AddAura(aur, SpellEffectIndex(i));
        }
    }

    if (!target->AddSpellAuraHolder(holder))
        holder = nullptr;

    return true;
}
