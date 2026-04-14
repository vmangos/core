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

#include "Common.h"
#include "DBCStores.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "SpellMgr.h"
#include "Log.h"
#include "Opcodes.h"
#include "Spell.h"
#include "SpellAuras.h"
#include "GameObject.h"
#include "Map.h"

using namespace Spells;

void WorldSession::HandleUseItemOpcode(WorldPackets::Spell::UseItem const& packet)
{
    Player* pUser = _player;

    // ignore for remote control state
    if (!pUser->IsSelfMover())
        return;

    Item *pItem = pUser->GetItemByPos(packet.bagIndex, packet.slot);
    if (!pItem)
    {
        pUser->SendEquipError(EQUIP_ERR_ITEM_NOT_FOUND, nullptr, nullptr);
        return;
    }

    ItemPrototype const* proto = pItem->GetProto();
    if (!proto)
    {
        pUser->SendEquipError(EQUIP_ERR_ITEM_NOT_FOUND, pItem, nullptr);
        return;
    }

    if (packet.spellSlot >= MAX_ITEM_PROTO_SPELLS ||
        proto->Spells[packet.spellSlot].SpellId == 0 ||
        proto->Spells[packet.spellSlot].SpellTrigger != ITEM_SPELLTRIGGER_ON_USE)
    {
        pUser->SendEquipError(EQUIP_ERR_ITEM_NOT_FOUND, pItem, nullptr);
        return;
    }

    // some item classes can be used only in equipped state
    if (proto->InventoryType != INVTYPE_NON_EQUIP && !pItem->IsEquipped())
    {
        pUser->SendEquipError(EQUIP_ERR_ITEM_NOT_FOUND, pItem, nullptr);
        return;
    }

    InventoryResult msg = pUser->CanUseItem(pItem);
    if (msg != EQUIP_ERR_OK)
    {
        pUser->SendEquipError(msg, pItem, nullptr);
        return;
    }

    // not allow use item from trade (cheat way only)
    if (pItem->IsInTrade())
    {
        pUser->SendEquipError(EQUIP_ERR_ITEM_NOT_FOUND, pItem, nullptr);
        return;
    }

    if (pUser->IsInCombat())
    {
        for (const auto& itr : proto->Spells)
        {
            if (SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(itr.SpellId))
            {
                if (spellInfo->IsNonCombatSpell())
                {
                    pUser->SendEquipError(EQUIP_ERR_NOT_IN_COMBAT, pItem, nullptr);
                    return;
                }
            }
        }
    }

    // check also  BIND_WHEN_PICKED_UP and BIND_QUEST_ITEM for .additem or .additemset case by GM (not binded at adding to inventory)
    if (pItem->GetProto()->Bonding == BIND_WHEN_USE || pItem->GetProto()->Bonding == BIND_WHEN_PICKED_UP || pItem->GetProto()->Bonding == BIND_QUEST_ITEM)
    {
        if (!pItem->IsSoulBound())
        {
            pItem->SetState(ITEM_CHANGED, pUser);
            pItem->SetBinding(true);
        }
    }

    const_cast<SpellCastTargets&>(packet.targets).PrepareForSpellSystem(_player);
    SpellCastResult itemCastCheckResult = SPELL_CAST_OK;

    if (!pItem->IsTargetValidForItemUse(packet.targets.getUnitTarget()))
        itemCastCheckResult = SPELL_FAILED_BAD_TARGETS;
    else if (pUser->IsShapeShifted())
    {
        // World of Warcraft Client Patch 1.10.0 (2006-03-28)
        // - All shapeshift forms can now use equipped items.
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
        if (!(packet.bagIndex == INVENTORY_SLOT_BAG_0 && packet.slot < EQUIPMENT_SLOT_END))
#endif
        itemCastCheckResult = SPELL_FAILED_NO_ITEMS_WHILE_SHAPESHIFTED;
    }

    if (itemCastCheckResult != SPELL_CAST_OK)
    {
        // free gray item after use fail
        pUser->SendEquipError(EQUIP_ERR_NONE, pItem, nullptr);

        // send spell error
        uint32 spellid = proto->Spells[packet.spellSlot].SpellId;
        if (SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(spellid))
            Spell::SendCastResult(_player, spellInfo, itemCastCheckResult);
        return;
    }

    pUser->CastItemUseSpell(pItem, const_cast<SpellCastTargets&>(packet.targets));
}

void WorldSession::HandleOpenItemOpcode(WorldPackets::Spell::OpenItem const& packet)
{
    Player* pUser = _player;

    // ignore for remote control state
    if (!pUser->IsSelfMover())
        return;

    Item *pItem = pUser->GetItemByPos(packet.bagIndex, packet.slot);
    if (!pItem)
    {
        pUser->SendEquipError(EQUIP_ERR_ITEM_NOT_FOUND, nullptr, nullptr);
        return;
    }

    ItemPrototype const* proto = pItem->GetProto();
    if (!proto)
    {
        pUser->SendEquipError(EQUIP_ERR_ITEM_NOT_FOUND, pItem, nullptr);
        return;
    }

    if (pUser->IsTaxiFlying())
    {
        pUser->SendEquipError(EQUIP_ERR_CANT_DO_RIGHT_NOW, pItem, nullptr);
        return;
    }

    if (!pUser->IsAlive())
    {
        pUser->SendEquipError(EQUIP_ERR_YOU_ARE_DEAD, pItem, nullptr);
        return;
    }

    // locked item
    uint32 lockId = proto->LockID;
    if (lockId && !pItem->HasFlag(ITEM_FIELD_FLAGS, ITEM_DYNFLAG_UNLOCKED))
    {
        LockEntry const* lockInfo = sLockStore.LookupEntry(lockId);

        if (!lockInfo)
        {
            pUser->SendEquipError(EQUIP_ERR_ITEM_LOCKED, pItem, nullptr);
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WORLD::OpenItem: item [guid = %u] has an unknown lockId: %u!", pItem->GetGUIDLow() , lockId);
            return;
        }

        // required picklocking
        if (lockInfo->Skill[1] || lockInfo->Skill[0])
        {
            pUser->SendEquipError(EQUIP_ERR_ITEM_LOCKED, pItem, nullptr);
            return;
        }
    }

    if (_player->IsNonMeleeSpellCasted())
        _player->InterruptNonMeleeSpells(false);

    if (pItem->HasFlag(ITEM_FIELD_FLAGS, ITEM_DYNFLAG_WRAPPED))// wrapped?
    {
        std::unique_ptr<QueryResult> result = CharacterDatabase.PQuery("SELECT `item_id`, `flags` FROM `character_gifts` WHERE `item_guid` = '%u'", pItem->GetGUIDLow());
        if (result)
        {
            Field* fields = result->Fetch();
            uint32 entry = fields[0].GetUInt32();
            uint32 flags = fields[1].GetUInt32();

            pItem->SetGuidValue(ITEM_FIELD_GIFTCREATOR, ObjectGuid());
            pItem->SetEntry(entry);
            pItem->SetUInt32Value(ITEM_FIELD_FLAGS, flags);
            pItem->SetState(ITEM_CHANGED, pUser);
        }
        else
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Wrapped item %u don't have record in character_gifts table and will deleted", pItem->GetGUIDLow());
            pUser->DestroyItem(pItem->GetBagSlot(), pItem->GetSlot(), true);
            return;
        }

        static SqlStatementID delGifts ;

        SqlStatement stmt = CharacterDatabase.CreateStatement(delGifts, "DELETE FROM `character_gifts` WHERE `item_guid` = ?");
        stmt.PExecute(pItem->GetGUIDLow());
    }
    else
        pUser->SendLoot(pItem->GetObjectGuid(), LOOT_CORPSE);
}

void WorldSession::HandleGameObjectUseOpcode(WorldPackets::Misc::GameObjectUse const& packet)
{
    // ignore for remote control state
    if (!_player->IsSelfMover())
        return;

    GameObject* obj = GetPlayer()->GetMap()->GetGameObject(packet.guid);
    if (!obj || obj->IsDeleted())
        return;

    // Additional check preventing exploits (ie loot despawned chests)
    if (!obj->isSpawned())
        return;

    // Never expect this opcode for some type GO's
    if (obj->GetGoType() == GAMEOBJECT_TYPE_GENERIC)
        return;

    // Never expect this opcode for non intractable GO's
    if (obj->HasFlag(GAMEOBJECT_FLAGS, GO_FLAG_NO_INTERACT))
        return;

    if (!obj->IsAtInteractDistance(_player))
        return;

    if (obj->PlayerCanUse(_player))
    {
        _player->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_LOOTING_CANCELS);
        obj->Use(_player);
    }
}

void WorldSession::HandleCastSpellOpcode(WorldPackets::Spell::CastSpell const& packet)
{
    SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(packet.spellId);

    if (!spellInfo)
        return;

    // not have spell in spellbook or spell passive and not casted by client
    if (!_player->HasActiveSpell(packet.spellId) || spellInfo->IsPassiveSpell())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "World: Player %u casts spell %u which he shouldn't have", _player->GetGUIDLow(), packet.spellId);
        //cheater? kick? ban?
        return;
    }

    // client provided targets
    const_cast<SpellCastTargets&>(packet.targets).PrepareForSpellSystem(_player);
    SpellEntry const* originalSpellInfo = spellInfo;

    // auto-selection buff level base at target level (in spellInfo)
    if (Unit* target = packet.targets.getUnitTarget())
    {
        // Cannot cast negative spells on yourself. Handle it here since casting negative
        // spells on yourself is frequently used within the core itself for certain mechanics.
        if (target == _player && IsExplicitlySelectedUnitTarget(spellInfo->EffectImplicitTargetA[0]) && !spellInfo->IsPositiveSpell(_player, target))
        {
            auto castPacket = std::make_unique<WorldPackets::Spell::CastResultSimpleFailure>(spellInfo, SPELL_FAILED_BAD_TARGETS);
            SendPacket(std::move(castPacket));
            return;
        }

        // if rank not found then function return nullptr but in explicit cast case original spell can be casted and later failed with appropriate error message
        if (SpellEntry const* actualSpellInfo = sSpellMgr.SelectAuraRankForLevel(spellInfo, target->GetLevel()))
            spellInfo = actualSpellInfo;
    }

    // Casting spells interrupts looting
    if (_player->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_LOOTING))
    {
        if (ObjectGuid lootGuid = GetPlayer()->GetLootGuid())
            DoLootRelease(lootGuid);
    }

    Spell* spell = new Spell(_player, spellInfo, false, ObjectGuid(), nullptr, packet.targets.getUnitTarget());

    // Spell has been down-ranked, remember what client wanted to cast.
    if (spellInfo != originalSpellInfo)
        spell->m_originalSpellInfo = originalSpellInfo;

    // Nostalrius : Ivina
    spell->SetClientStarted(true);
    spell->prepare(std::move(const_cast<SpellCastTargets&>(packet.targets)));
}

void WorldSession::HandleCancelCastOpcode(WorldPackets::Spell::CancelCast const& packet)
{
    // ignore for remote control state (for player case)
    Unit* mover = _player->GetMover();
    if (mover != _player && mover->GetTypeId() == TYPEID_PLAYER)
        return;

    if (_player->IsNonMeleeSpellCasted(false))
        _player->InterruptNonMeleeSpells(false, packet.spellId);

    if (_player->IsNextSwingSpellCasted())
        _player->InterruptSpell(CURRENT_MELEE_SPELL);
}

void WorldSession::HandleCancelAuraOpcode(WorldPackets::Spell::CancelAura const& packet)
{
    SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(packet.spellId);
    if (!spellInfo)
        return;

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
    if (spellInfo->HasAttribute(SPELL_ATTR_NO_AURA_CANCEL))
        return;
#endif

    if (spellInfo->HasAttribute(SPELL_ATTR_DO_NOT_DISPLAY))
        return;

    if (spellInfo->HasAttribute(SPELL_ATTR_EX_NO_AURA_ICON) && !spellInfo->activeIconID)
        return;

    if (spellInfo->IsPassiveSpell())
        return;

    if (!IsPositiveSpell(packet.spellId))
    {
        // ignore for remote control state
        if (!_player->IsSelfMover())
        {
            // except own aura spells
            bool allow = false;
            for (uint32 k : spellInfo->EffectApplyAuraName)
            {
                if (k == SPELL_AURA_MOD_POSSESS ||
                    k == SPELL_AURA_MOD_POSSESS_PET)
                {
                    allow = true;
                    break;
                }
            }

            // this also include case when aura not found
            if (!allow)
                return;
        }
        else
            return;
    }

    // World of Warcraft Client Patch 1.7.0 (2005-09-13)
    // - Druids should now be able to shapeshift back into caster form while Feared.
#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_6_1
    if (_player->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_FLEEING | UNIT_FLAG_POSSESSED))
#else
    // confirmed you cant remove buffs while mind controlled on wotlk ptr
    if (_player->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_POSSESSED))
#endif
        return;

    // channeled spell case (it currently casted then)
    if (spellInfo->IsChanneledSpell())
    {
        if (Spell* curSpell = _player->GetCurrentSpell(CURRENT_CHANNELED_SPELL))
            if (curSpell->m_spellInfo->Id == packet.spellId)
                _player->InterruptSpell(CURRENT_CHANNELED_SPELL);
        return;
    }

    SpellAuraHolder* holder = _player->GetSpellAuraHolder(packet.spellId);

    // not own area auras can't be cancelled (note: maybe need to check for aura on holder and not general on spell)
    if (holder && holder->GetCasterGuid() != _player->GetObjectGuid() && holder->GetSpellProto()->HasAreaAuraEffect())
        return;

    // non channeled case
    _player->RemoveAurasDueToSpellByCancel(packet.spellId);
}

void WorldSession::HandlePetCancelAuraOpcode(WorldPackets::Pet::PetCancelAura const& packet)
{
    // ignore for remote control state
    if (!_player->IsSelfMover())
        return;

    SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(packet.spellId);
    if (!spellInfo)
        return;

    Creature* pet = GetPlayer()->GetMap()->GetAnyTypeCreature(packet.guid);

    if (!pet)
        return;

    if (packet.guid != GetPlayer()->GetPetGuid() && packet.guid != GetPlayer()->GetCharmGuid())
        return;

    if (!pet->IsAlive())
    {
        pet->SendPetActionFeedback(FEEDBACK_PET_DEAD);
        return;
    }

    pet->RemoveAurasDueToSpell(packet.spellId);
}

void WorldSession::HandleCancelGrowthAuraOpcode(NullClientPacket const& /*packet*/)
{
    // nothing do
}

void WorldSession::HandleCancelAutoRepeatSpellOpcode(NullClientPacket const& /*packet*/)
{
    // may be better send SMSG_CANCEL_AUTO_REPEAT?
    // cancel and prepare for deleting
    _player->GetMover()->InterruptSpell(CURRENT_AUTOREPEAT_SPELL);
}

void WorldSession::HandleCancelChanneling(WorldPackets::Spell::CancelChanneling const& /*packet*/)
{
    // ignore for remote control state (for player case)
    Unit* mover = _player->GetMover();
    if (mover != _player && mover->GetTypeId() == TYPEID_PLAYER)
        return;

    if (Spell* spell = _player->GetCurrentSpell(CURRENT_CHANNELED_SPELL))
    {
        if (spell->IsTriggered())
            return;
        _player->InterruptSpell(CURRENT_CHANNELED_SPELL);
    }
}

void WorldSession::HandleSelfResOpcode(NullClientPacket const& /*packet*/)
{
// World of Warcraft Client Patch 1.6.0 (2005-07-12)
// - Self-resurrection spells show their name on the button in the release spirit dialog.
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_6_1
    if (_player->GetUInt32Value(PLAYER_SELF_RES_SPELL))
    {
        SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(_player->GetUInt32Value(PLAYER_SELF_RES_SPELL));
        if (spellInfo)
            _player->CastSpell(_player, spellInfo, false);

        _player->SetUInt32Value(PLAYER_SELF_RES_SPELL, 0);
    }
#else
    if (_player->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_CAN_SELF_RESURRECT))
    {
        SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(_player->GetResurrectionSpellId());
        if (spellInfo)
            _player->CastSpell(_player, spellInfo, false);

        _player->SetResurrectionSpellId(0);
        _player->RemoveFlag(PLAYER_FLAGS, PLAYER_FLAGS_CAN_SELF_RESURRECT);
    }
#endif
}
