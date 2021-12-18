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

using namespace Spells;

void WorldSession::HandleUseItemOpcode(WorldPacket& recvPacket)
{
    uint8 bagIndex, slot;
    uint8 spell_count;                                      // number of spells at item, not used

    recvPacket >> bagIndex >> slot >> spell_count;

    // TODO: add targets.read() check
    Player* pUser = _player;

    // ignore for remote control state
    if (!pUser->IsSelfMover())
    {
        recvPacket.rpos(recvPacket.wpos());                 // prevent spam at not read packet tail
        return;
    }

    Item *pItem = pUser->GetItemByPos(bagIndex, slot);
    if (!pItem)
    {
        recvPacket.rpos(recvPacket.wpos());                 // prevent spam at not read packet tail
        pUser->SendEquipError(EQUIP_ERR_ITEM_NOT_FOUND, nullptr, nullptr);
        return;
    }

    DETAIL_LOG("WORLD: CMSG_USE_ITEM packet, bagIndex: %u, slot: %u, spell_count: %u , Item: %u, data length = %i", bagIndex, slot, spell_count, pItem->GetEntry(), (uint32)recvPacket.size());

    ItemPrototype const* proto = pItem->GetProto();
    if (!proto)
    {
        recvPacket.rpos(recvPacket.wpos());                 // prevent spam at not read packet tail
        pUser->SendEquipError(EQUIP_ERR_ITEM_NOT_FOUND, pItem, nullptr);
        return;
    }

    // some item classes can be used only in equipped state
    if (proto->InventoryType != INVTYPE_NON_EQUIP && !pItem->IsEquipped())
    {
        recvPacket.rpos(recvPacket.wpos());                 // prevent spam at not read packet tail
        pUser->SendEquipError(EQUIP_ERR_ITEM_NOT_FOUND, pItem, nullptr);
        return;
    }

    InventoryResult msg = pUser->CanUseItem(pItem);
    if (msg != EQUIP_ERR_OK)
    {
        recvPacket.rpos(recvPacket.wpos());                 // prevent spam at not read packet tail
        pUser->SendEquipError(msg, pItem, nullptr);
        return;
    }

    // not allow use item from trade (cheat way only)
    if (pItem->IsInTrade())
    {
        recvPacket.rpos(recvPacket.wpos());                 // prevent spam at not read packet tail
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
                    recvPacket.rpos(recvPacket.wpos());     // prevent spam at not read packet tail
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

    SpellCastTargets targets;

    recvPacket >> targets.ReadForCaster(pUser);

    targets.Update(pUser);

    SpellCastResult itemCastCheckResult = SPELL_CAST_OK;
    if (!pItem->IsTargetValidForItemUse(targets.getUnitTarget()))
        itemCastCheckResult = SPELL_FAILED_BAD_TARGETS;
    else if (pUser->IsShapeShifted())
    {
        // World of Warcraft Client Patch 1.10.0 (2006-03-28)
        // - All shapeshift forms can now use equipped items.
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
        if (!(bagIndex == INVENTORY_SLOT_BAG_0 && slot < EQUIPMENT_SLOT_END))
#endif
        itemCastCheckResult = SPELL_FAILED_NO_ITEMS_WHILE_SHAPESHIFTED;
    }

    if (itemCastCheckResult != SPELL_CAST_OK)
    {
        // free gray item after use fail
        pUser->SendEquipError(EQUIP_ERR_NONE, pItem, nullptr);

        // search spell for spell error
        uint32 spellid = 0;
        for (const auto& itr : proto->Spells)
        {
            if (itr.SpellTrigger == ITEM_SPELLTRIGGER_ON_USE || itr.SpellTrigger == ITEM_SPELLTRIGGER_ON_NO_DELAY_USE)
            {
                spellid = itr.SpellId;
                break;
            }
        }

        // send spell error
        if (SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(spellid))
            Spell::SendCastResult(_player, spellInfo, itemCastCheckResult);
        return;
    }

    pUser->CastItemUseSpell(pItem, targets);
}

void WorldSession::HandleOpenItemOpcode(WorldPacket& recvPacket)
{
    DETAIL_LOG("WORLD: CMSG_OPEN_ITEM packet, data length = %i", (uint32)recvPacket.size());

    uint8 bagIndex, slot;

    recvPacket >> bagIndex >> slot;

    DETAIL_LOG("bagIndex: %u, slot: %u", bagIndex, slot);

    Player* pUser = _player;

    // ignore for remote control state
    if (!pUser->IsSelfMover())
        return;

    Item *pItem = pUser->GetItemByPos(bagIndex, slot);
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
            sLog.outError("WORLD::OpenItem: item [guid = %u] has an unknown lockId: %u!", pItem->GetGUIDLow() , lockId);
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
        QueryResult* result = CharacterDatabase.PQuery("SELECT `item_id`, `flags` FROM `character_gifts` WHERE `item_guid` = '%u'", pItem->GetGUIDLow());
        if (result)
        {
            Field* fields = result->Fetch();
            uint32 entry = fields[0].GetUInt32();
            uint32 flags = fields[1].GetUInt32();

            pItem->SetGuidValue(ITEM_FIELD_GIFTCREATOR, ObjectGuid());
            pItem->SetEntry(entry);
            pItem->SetUInt32Value(ITEM_FIELD_FLAGS, flags);
            pItem->SetState(ITEM_CHANGED, pUser);
            delete result;
        }
        else
        {
            sLog.outError("Wrapped item %u don't have record in character_gifts table and will deleted", pItem->GetGUIDLow());
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

void WorldSession::HandleGameObjectUseOpcode(WorldPacket& recv_data)
{
    ObjectGuid guid;

    recv_data >> guid;

    DEBUG_LOG("WORLD: Recvd CMSG_GAMEOBJ_USE Message guid: %s", guid.GetString().c_str());

    // ignore for remote control state
    if (!_player->IsSelfMover())
        return;

    GameObject* obj = GetPlayer()->GetMap()->GetGameObject(guid);
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

void WorldSession::HandleCastSpellOpcode(WorldPacket& recvPacket)
{
    uint32 spellId;
    recvPacket >> spellId;

    DEBUG_LOG("WORLD: got cast spell packet, spellId - %u, data length = %i",
              spellId, (uint32)recvPacket.size());

    SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(spellId);

    if (!spellInfo)
    {
        recvPacket.rpos(recvPacket.wpos());                 // prevent spam at ignore packet
        return;
    }

    if (_player->GetTypeId() == TYPEID_PLAYER)
    {
        // not have spell in spellbook or spell passive and not casted by client
        if (!_player->HasActiveSpell(spellId) || spellInfo->IsPassiveSpell())
        {
            sLog.outError("World: Player %u casts spell %u which he shouldn't have", _player->GetGUIDLow(), spellId);
            //cheater? kick? ban?
            recvPacket.rpos(recvPacket.wpos());                 // prevent spam at ignore packet
            return;
        }
    }
    else if (_player->GetTypeId() == TYPEID_UNIT)
    {
        // not have spell in spellbook or spell passive and not casted by client
        if (!_player->HasSpell(spellId) || spellInfo->IsPassiveSpell())
        {
            //cheater? kick? ban?
            recvPacket.rpos(recvPacket.wpos());                 // prevent spam at ignore packet
            return;
        }
    }

    // client provided targets
    SpellCastTargets targets;

    recvPacket >> targets.ReadForCaster(_player);

    SpellEntry const* originalSpellInfo = spellInfo;

    // auto-selection buff level base at target level (in spellInfo)
    if (Unit* target = targets.getUnitTarget())
    {
        // Cannot cast negative spells on yourself. Handle it here since casting negative
        // spells on yourself is frequently used within the core itself for certain mechanics.
        if (target == _player && IsExplicitlySelectedUnitTarget(spellInfo->EffectImplicitTargetA[0]) && !spellInfo->IsPositiveSpell(_player, target))
        {
            WorldPacket data(SMSG_CAST_RESULT, (4 + 1 + 1));
            data << uint32(spellId);
            data << uint8(2); // status = fail
            data << uint8(SPELL_FAILED_BAD_TARGETS);
            SendPacket(&data);
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

    _player->m_castingSpell = spellId;
    if (spellInfo->SpellFamilyName == SPELLFAMILY_ROGUE)
        _player->m_castingSpell = _player->GetComboPoints();

    Spell* spell = new Spell(_player, spellInfo, false, ObjectGuid(), nullptr, targets.getUnitTarget());

    // Spell has been down-ranked, remember what client wanted to cast.
    if (spellInfo != originalSpellInfo)
        spell->m_originalSpellInfo = originalSpellInfo;

    // Nostalrius : Ivina
    spell->SetClientStarted(true);
    spell->prepare(std::move(targets));
}

void WorldSession::HandleCancelCastOpcode(WorldPacket& recvPacket)
{
    uint32 spellId;
    recvPacket >> spellId;

    // ignore for remote control state (for player case)
    Unit* mover = _player->GetMover();
    if (mover != _player && mover->GetTypeId() == TYPEID_PLAYER)
        return;

    if (_player->IsNonMeleeSpellCasted(false))
        _player->InterruptNonMeleeSpells(false, spellId);

    if (_player->IsNextSwingSpellCasted())
        _player->InterruptSpell(CURRENT_MELEE_SPELL);
}

void WorldSession::HandleCancelAuraOpcode(WorldPacket& recvPacket)
{
    uint32 spellId;
    recvPacket >> spellId;

    // Buff MJ '.gm visible off'.
    if (spellId == 16380 && !_player->IsGMVisible())
        return;

    SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(spellId);
    if (!spellInfo)
        return;

    if (spellInfo->Attributes & SPELL_ATTR_CANT_CANCEL)
        return;

    if (spellInfo->IsPassiveSpell())
        return;

    if (!IsPositiveSpell(spellId))
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

    // prevent last relocation opcode handling: CancelAura is handled before Mover is changed
    // thus the last movement data is written into pMover, that should not happen
    for (uint32 i : spellInfo->Effect)
    {
        // Eye of Kilrogg case
        if (i == SPELL_EFFECT_SUMMON_POSSESSED)
        {
            _player->SetNextRelocationsIgnoredCount(1);
            break;
        }
    }

    // channeled spell case (it currently casted then)
    if (spellInfo->IsChanneledSpell())
    {
        if (Spell* curSpell = _player->GetCurrentSpell(CURRENT_CHANNELED_SPELL))
            if (curSpell->m_spellInfo->Id == spellId)
                _player->InterruptSpell(CURRENT_CHANNELED_SPELL);
        return;
    }

    SpellAuraHolder* holder = _player->GetSpellAuraHolder(spellId);

    // not own area auras can't be cancelled (note: maybe need to check for aura on holder and not general on spell)
    if (holder && holder->GetCasterGuid() != _player->GetObjectGuid() && holder->GetSpellProto()->HasAreaAuraEffect())
        return;

    // non channeled case
    _player->RemoveAurasDueToSpellByCancel(spellId);
}

void WorldSession::HandlePetCancelAuraOpcode(WorldPacket& recvPacket)
{
    ObjectGuid guid;
    uint32 spellId;

    recvPacket >> guid;
    recvPacket >> spellId;

    // ignore for remote control state
    if (!_player->IsSelfMover())
        return;

    SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(spellId);
    if (!spellInfo)
        return;

    Creature* pet = GetPlayer()->GetMap()->GetAnyTypeCreature(guid);

    if (!pet)
        return;

    if (guid != GetPlayer()->GetPetGuid() && guid != GetPlayer()->GetCharmGuid())
        return;

    if (!pet->IsAlive())
    {
        pet->SendPetActionFeedback(FEEDBACK_PET_DEAD);
        return;
    }

    pet->RemoveAurasDueToSpell(spellId);
}

void WorldSession::HandleCancelGrowthAuraOpcode(WorldPacket& /*recvPacket*/)
{
    // nothing do
}

void WorldSession::HandleCancelAutoRepeatSpellOpcode(WorldPacket& /*recvPacket*/)
{
    // may be better send SMSG_CANCEL_AUTO_REPEAT?
    // cancel and prepare for deleting
    _player->GetMover()->InterruptSpell(CURRENT_AUTOREPEAT_SPELL);
}

void WorldSession::HandleCancelChanneling(WorldPacket& recv_data)
{
    recv_data.read_skip<uint32>();                          // spellid, not used

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

void WorldSession::HandleSelfResOpcode(WorldPacket& /*recv_data*/)
{
    DEBUG_FILTER_LOG(LOG_FILTER_SPELL_CAST, "WORLD: CMSG_SELF_RES");                  // empty opcode

    if (_player->GetUInt32Value(PLAYER_SELF_RES_SPELL))
    {
        SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(_player->GetUInt32Value(PLAYER_SELF_RES_SPELL));
        if (spellInfo)
            _player->CastSpell(_player, spellInfo, false);

        _player->SetUInt32Value(PLAYER_SELF_RES_SPELL, 0);
    }
}
