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
#include "Opcodes.h"
#include "WorldPacket.h"
#include "Log.h"
#include "Corpse.h"
#include "GameObject.h"
#include "GameObjectAI.h"
#include "Player.h"
#include "ObjectAccessor.h"
#include "ObjectGuid.h"
#include "WorldSession.h"
#include "LootMgr.h"
#include "Object.h"
#include "Group.h"
#include "World.h"
#include "ScriptMgr.h"
#include "Util.h"
#include "Anticheat.h"

void WorldSession::HandleAutostoreLootItemOpcode(WorldPacket& recv_data)
{
    Player  *player =   GetPlayer();
    ObjectGuid lguid = player->GetLootGuid();
    Loot    *loot;
    uint8    lootSlot;
    Item* pItem = nullptr;

    recv_data >> lootSlot;

    if (lguid.IsEmpty())
        return;

    switch (lguid.GetHigh())
    {
        case HIGHGUID_GAMEOBJECT:
        {
            GameObject* go = player->GetMap()->GetGameObject(lguid);

            // not check distance for GO in case owned GO (fishing bobber case, for example) or Fishing hole GO
            if (!go || ((go->GetOwnerGuid() != _player->GetObjectGuid() && go->GetGoType() != GAMEOBJECT_TYPE_FISHINGHOLE) && !go->IsWithinDistInMap(_player, INTERACTION_DISTANCE)))
            {
                player->SendLootRelease(lguid);
                return;
            }

            loot = &go->loot;
            break;
        }
        case HIGHGUID_ITEM:
        {
            pItem = player->GetItemByGuid(lguid);

            if (!pItem || !pItem->HasGeneratedLoot())
            {
                player->SendLootRelease(lguid);
                return;
            }

            loot = &pItem->loot;
            break;
        }
        case HIGHGUID_CORPSE:
        {
            Corpse* bones = player->GetMap()->GetCorpse(lguid);
            if (!bones)
            {
                player->SendLootRelease(lguid);
                return;
            }
            loot = &bones->loot;
            break;
        }
        case HIGHGUID_UNIT:
        {
            Creature* pCreature = GetPlayer()->GetMap()->GetCreature(lguid);

            bool ok_loot = pCreature && pCreature->IsAlive() == (player->GetClass() == CLASS_ROGUE && pCreature->lootForPickPocketed);

            if (!ok_loot)
            {
                player->SendLootError(lguid, LOOT_ERROR_DIDNT_KILL);
                return;
            }

            // skinning uses the spell range which is 5 yards
            if (pCreature->lootForSkin)
            {
                if (!pCreature->IsWithinCombatDistInMap(player, INTERACTION_DISTANCE + 1.25f))
                {
                    player->SendLootError(lguid, LOOT_ERROR_TOO_FAR);
                    return;
                }
            }
            else
            {
                if (!pCreature->IsWithinDistInMap(_player, _player->GetMaxLootDistance(pCreature), true, SizeFactor::None))
                {
                    player->SendLootError(lguid, LOOT_ERROR_TOO_FAR);
                    return;
                }
            }

            loot = &pCreature->loot;
            break;
        }
        default:
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "%s is unsupported for looting. (%s)", lguid.GetString().c_str(), player->GetObjectGuid().GetString().c_str());
            return;
        }
    }

    QuestItem* qitem = nullptr;
    QuestItem* ffaitem = nullptr;
    QuestItem* conditem = nullptr;

    LootItem* item = loot->LootItemInSlot(lootSlot, player->GetGUIDLow(), &qitem, &ffaitem, &conditem);

    if (!item)
    {
        player->SendEquipError(EQUIP_ERR_ALREADY_LOOTED, nullptr, nullptr);
        return;
    }

    if (!item->AllowedForPlayer(player, loot->GetLootTarget()))
    {
        player->SendLootError(lguid, LOOT_ERROR_DIDNT_KILL);
        return;
    }

    // questitems use the blocked field for other purposes
    if (!qitem && item->is_blocked)
    {
        player->SendLootError(lguid, LOOT_ERROR_DIDNT_KILL);
        return;
    }

    // prevent stealing items if using master loot
    if (lguid.IsCreature() && !item->is_underthreshold)
    {
        if (Group* pGroup = player->GetGroup())
        {
            if (pGroup->GetLootMethod() == MASTER_LOOT)
            {
                player->SendLootError(lguid, LOOT_ERROR_DIDNT_KILL);
                return;
            }
        }
    }

    if (pItem)
        pItem->SetLootState(ITEM_LOOT_CHANGED);

    ItemPosCountVec dest;
    InventoryResult msg = player->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, item->itemid, item->count);
    if (msg == EQUIP_ERR_OK)
    {
        Item * newitem = player->StoreNewItem(dest, item->itemid, true, item->randomPropertyId);
        if (!newitem)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Unable to store loot item #%u from %s !", item->itemid, lguid.GetString().c_str());
            return;
        }

        if (qitem)
        {
            qitem->is_looted = true;
            //freeforall is 1 if everyone's supposed to get the quest item.
            if (item->freeforall || loot->GetPlayerQuestItems().size() == 1)
                player->SendNotifyLootItemRemoved(lootSlot);
            else
                loot->NotifyQuestItemRemoved(qitem->index);
        }
        else if (ffaitem)
        {
            //freeforall case, notify only one player of the removal
            ffaitem->is_looted = true;
            player->SendNotifyLootItemRemoved(lootSlot);
        }
        else if (conditem)
        {
            //not freeforall, notify everyone
            conditem->is_looted = true;
            loot->NotifyItemRemoved(lootSlot);
        }
        else
            loot->NotifyItemRemoved(lootSlot);

        //if only one person is supposed to loot the item, then set it to looted
        if (!item->freeforall)
            item->is_looted = true;

        --loot->unlootedCount;


        sLog.Player(this, LOG_LOOTS, LOG_LVL_MINIMAL, "%s loots %ux%u [loot from %s]", _player->GetShortDescription().c_str(), item->count, item->itemid, lguid.GetString().c_str());
        player->SendNewItem(newitem, uint32(item->count), false, false, true);
        player->OnReceivedItem(newitem);
    }
    else
        player->SendEquipError(msg, nullptr, nullptr, item->itemid);
}

void WorldSession::HandleLootMoneyOpcode(WorldPacket& /*recv_data*/)
{
    Player* player = GetPlayer();
    if (!player || !player->IsInWorld())
        return;
    ObjectGuid guid = player->GetLootGuid();
    if (!guid)
        return;

    Loot* pLoot = nullptr;
    Item* pItem = nullptr;
    bool shareMoneyWithGroup = true;

    switch (guid.GetHigh())
    {
        case HIGHGUID_GAMEOBJECT:
        {
            GameObject* pGameObject = GetPlayer()->GetMap()->GetGameObject(guid);

            // not check distance for GO in case owned GO (fishing bobber case, for example)
            if (pGameObject && (pGameObject->GetOwnerGuid() == _player->GetObjectGuid() || pGameObject->IsWithinDistInMap(_player, INTERACTION_DISTANCE)))
                pLoot = &pGameObject->loot;

            break;
        }
        case HIGHGUID_CORPSE:                               // remove insignia ONLY in BG
        {
            Corpse* bones = _player->GetMap()->GetCorpse(guid);

            if (bones && bones->IsWithinDistInMap(_player, INTERACTION_DISTANCE))
                pLoot = &bones->loot;

            break;
        }
        case HIGHGUID_ITEM:
        {
            pItem = GetPlayer()->GetItemByGuid(guid);
            if (!pItem || !pItem->HasGeneratedLoot())
                return;

            pLoot = &pItem->loot;
            shareMoneyWithGroup = false;
            break;
        }
        case HIGHGUID_UNIT:
        {
            Creature* pCreature = GetPlayer()->GetMap()->GetCreature(guid);

            if (player->GetClass() == CLASS_ROGUE && pCreature && pCreature->lootForPickPocketed)
                shareMoneyWithGroup = false;
            bool ok_loot = pCreature && pCreature->IsAlive() == (player->GetClass() == CLASS_ROGUE && pCreature->lootForPickPocketed);

            if (ok_loot && pCreature->IsWithinDistInMap(_player, _player->GetMaxLootDistance(pCreature), true, SizeFactor::None))
                pLoot = &pCreature->loot ;

            break;
        }
        default:
            return;                                         // unlootable type
    }

    if (pLoot)
    {
        pLoot->NotifyMoneyRemoved();

        if (shareMoneyWithGroup && player->GetGroup())           //item can be looted only single player
        {
            Group* group = player->GetGroup();

            std::vector<Player*> playersNear;
            playersNear.reserve(group->GetMembersCount());
            for (GroupReference* itr = group->GetFirstMember(); itr != nullptr; itr = itr->next())
            {
                Player* playerGroup = itr->getSource();
                if (!playerGroup)
                    continue;
                
                if (player->IsWithinLootXPDist(playerGroup))
                    playersNear.push_back(playerGroup);
            }

            uint32 moneyPerPlayer = uint32((pLoot->gold) / (playersNear.size()));

            for (const auto i : playersNear)
            {
                i->LootMoney(moneyPerPlayer, pLoot);
                i->SendLootMoneyNotify(moneyPerPlayer);
            }
        }
        else
        {
            player->LootMoney(pLoot->gold, pLoot);

            // in wotlk and after this should be sent for solo looting too
            //player->SendLootMoneyNotify(pLoot->gold);
        }

        pLoot->gold = 0;

        if (pItem)
            pItem->SetLootState(ITEM_LOOT_CHANGED);
    }
}

void WorldSession::HandleLootOpcode(WorldPacket& recv_data)
{
    ObjectGuid guid;
    recv_data >> guid;

    if (!guid.IsAnyTypeCreature() && !guid.IsPlayer() && !guid.IsCorpse())
    {
        _player->SendLootError(guid, LOOT_ERROR_DIDNT_KILL);
        ProcessAnticheatAction("ItemsCheck", "CMSG_LOOT on non-unit guid", CHEAT_ACTION_LOG);
        return;
    }

    // Check possible cheat
    if (!_player->IsAlive() || !_player->IsInWorld())
    {
        _player->SendLootError(guid, LOOT_ERROR_PLAYER_NOT_FOUND);
        return;
    }

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
    if (_player->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_NO_PLAY_TIME))
    {
        _player->SendLootError(guid, LOOT_ERROR_PLAY_TIME_EXCEEDED);
        return;
    }
#endif

    if (_player->GetStandState() != UNIT_STAND_STATE_STAND)
    {
        _player->SendLootError(guid, LOOT_ERROR_NOTSTANDING);
        return;
    }

    if (_player->HasUnitState(UNIT_STAT_STUNNED))
    {
        _player->SendLootError(guid, LOOT_ERROR_STUNNED);
        return;
    }

    if (_player->IsNonMeleeSpellCasted())
        _player->InterruptNonMeleeSpells(false);

    GetPlayer()->SendLoot(guid, LOOT_CORPSE);
}

void WorldSession::HandleLootReleaseOpcode(WorldPacket& recv_data)
{
    // cheaters can modify lguid to prevent correct apply loot release code and re-loot
    // use internal stored guid
    recv_data.read_skip<uint64>();                          // guid;

    if (ObjectGuid lootGuid = GetPlayer()->GetLootGuid())
        DoLootRelease(lootGuid);
}

void WorldSession::DoLootRelease(ObjectGuid lguid)
{
    Player*  player = GetPlayer();
    Loot*    loot;

    player->SetLootGuid(ObjectGuid());

    // for disenchanted items first show loot as removed before release
    if (lguid.GetHigh() != HIGHGUID_ITEM)
        player->SendLootRelease(lguid);

    player->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_LOOTING);

    if (!player->IsInWorld())
        return;

    switch (lguid.GetHigh())
    {
        case HIGHGUID_GAMEOBJECT:
        {
            GameObject* go = player->GetMap()->GetGameObject(lguid);
            if (!go)
                return;

            // Chest closed animation
            if (go->GetGoType() == GAMEOBJECT_TYPE_CHEST)
                go->SetGoState(GO_STATE_READY);

            loot = &go->loot;

            // Don't despawn temporarily spawned chests that contain group wide quest items.
            if (loot->HasFFAQuestItems() && !go->isSpawnedByDefault() && go->GetGoType() == GAMEOBJECT_TYPE_CHEST)
            {
                go->SetLootState(GO_READY);
                break;
            }

            if (go->GetGoType() == GAMEOBJECT_TYPE_DOOR)
            {
                // locked doors are opened with spelleffect openlock, prevent remove its as looted
                go->UseDoorOrButton();
                if (go->AI())
                    go->AI()->OnUse(player);
            }
            else if (loot->isLooted() || go->GetGoType() == GAMEOBJECT_TYPE_FISHINGNODE)
            {
                // GO is mineral vein? so it is not removed after its looted
                if (go->GetGoType() == GAMEOBJECT_TYPE_CHEST)
                {
                    uint32 go_min = go->GetGOInfo()->chest.minSuccessOpens;
                    uint32 go_max = go->GetGOInfo()->chest.maxSuccessOpens;

                    // trigger loot events
                    if (go->GetGOInfo()->chest.eventId)
                    {
                        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Chest ScriptStart id %u for GO %u", go->GetGOInfo()->chest.eventId, go->GetGUIDLow());

                        if (!sScriptMgr.OnProcessEvent(go->GetGOInfo()->chest.eventId, _player, go, true))
                            go->GetMap()->ScriptsStart(sEventScripts, go->GetGOInfo()->chest.eventId, _player->GetObjectGuid(), go->GetObjectGuid());
                    }

                    // only vein pass this check
                    if (go_min != 0 && go_max > go_min)
                    {
                        float amount_rate = sWorld.getConfig(CONFIG_FLOAT_RATE_MINING_AMOUNT);
                        float min_amount = go_min * amount_rate;
                        float max_amount = go_max * amount_rate;

                        go->AddUse();
                        float uses = float(go->GetUseCount());

                        if (uses < max_amount)
                        {
                            if (uses >= min_amount)
                            {
                                float chance_rate = sWorld.getConfig(CONFIG_FLOAT_RATE_MINING_NEXT);

                                int32 ReqValue = 175;
                                LockEntry const* lockInfo = sLockStore.LookupEntry(go->GetGOInfo()->chest.lockId);
                                if (lockInfo)
                                    ReqValue = lockInfo->Skill[0];
                                float skill = float(player->GetSkillValue(SKILL_MINING)) / (ReqValue + 25);
                                double chance = pow(0.8 * chance_rate, 4 * (1 / double(max_amount)) * double(uses));
                                if (roll_chance_f(float(100.0f * chance + skill)))
                                    go->SetLootState(GO_READY);
                                else                            // not have more uses
                                    go->SetLootState(GO_JUST_DEACTIVATED);
                            }
                            else                                // 100% chance until min uses
                                go->SetLootState(GO_READY);
                        }
                        else                                    // max uses already
                            go->SetLootState(GO_JUST_DEACTIVATED);
                    }
                    else                                        // not vein
                        go->SetLootState(GO_JUST_DEACTIVATED);
                }
                else if (go->GetGoType() == GAMEOBJECT_TYPE_FISHINGHOLE)
                {
                    // The fishing hole used once more
                    go->AddUse();                               // if the max usage is reached, will be despawned at next tick
                    if (go->GetUseCount() >= urand(go->GetGOInfo()->fishinghole.minSuccessOpens, go->GetGOInfo()->fishinghole.maxSuccessOpens))
                        go->SetLootState(GO_JUST_DEACTIVATED);
                    else
                        go->SetLootState(GO_READY);
                }
                else // not chest (or vein/herb/etc)
                    go->SetLootState(GO_JUST_DEACTIVATED);

                loot->clear();
            }
            else
                // not fully looted object
                go->SetLootState(GO_ACTIVATED);
            break;
        }
        case HIGHGUID_CORPSE:                               // ONLY remove insignia at BG
        {
            Corpse* corpse = _player->GetMap()->GetCorpse(lguid);
            if (!corpse)
                return;

            loot = &corpse->loot;

            if (loot->isLooted())
            {
                loot->clear();
                corpse->RemoveFlag(CORPSE_FIELD_DYNAMIC_FLAGS, CORPSE_DYNFLAG_LOOTABLE);
            }
            corpse->ForceValuesUpdateAtIndex(CORPSE_FIELD_DYNAMIC_FLAGS);
            corpse->ExecuteDelayedActions();
            break;
        }
        case HIGHGUID_ITEM:
        {
            Item *pItem = player->GetItemByGuid(lguid);
            if (!pItem)
                return;

            switch (pItem->loot.loot_type)
            {
                // temporary loot, auto loot move
                case LOOT_DISENCHANTING:
                {
                    if (!pItem->loot.isLooted())
                        player->AutoStoreLoot(pItem->loot); // can be lost if no space
                    pItem->loot.clear();
                    pItem->SetLootState(ITEM_LOOT_REMOVED);
                    player->DestroyItem(pItem->GetBagSlot(), pItem->GetSlot(), true);
                    break;
                }
                // normal persistence loot
                default:
                {
                    // must be destroyed only if no loot
                    if (pItem->loot.isLooted() && !pItem->IsBag())
                    {
                        pItem->SetLootState(ITEM_LOOT_REMOVED);
                        player->DestroyItem(pItem->GetBagSlot(), pItem->GetSlot(), true);
                    }
                    break;
                }
            }
            player->SendLootRelease(lguid);
            return;                                         // item can be looted only single player
        }
        case HIGHGUID_UNIT:
        {
            Creature* creature = player->GetMap()->GetCreature(lguid);
            if (!creature)
                return;

            loot = &creature->loot;

            if (loot->isLooted())
            {
                // skip pickpocketing loot for speed, skinning timer reduction is no-op in fact
                if (!creature->IsAlive())
                    creature->AllLootRemovedFromCorpse();

                creature->RemoveFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_LOOTABLE);
                loot->clear();
            }
            else
            {
                // if the round robin player release, reset it.
                if (player->GetGUID() == loot->roundRobinPlayer)
                {
                    if (Group* group = player->GetGroup())
                    {
                        if (group->GetLootMethod() != MASTER_LOOT)
                        {
                            loot->roundRobinPlayer = 0;
                            group->SendLooter(creature, nullptr);

                            // force update of dynamic flags, otherwise other group's players still not able to loot.
                            creature->ForceValuesUpdateAtIndex(UNIT_DYNAMIC_FLAGS);
                        }
                    }
                    else
                        loot->roundRobinPlayer = 0;
                }
            }
            break;
        }
        default:
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "%s is unsupported for looting.", lguid.GetString().c_str());
            return;
        }
    }

    // Player is not looking at loot list, he doesn't need to see updates on the loot list
    loot->RemoveLooter(player->GetObjectGuid());
}

void WorldSession::HandleLootMasterGiveOpcode(WorldPacket& recv_data)
{
    uint8 slotid;
    ObjectGuid lootGuid;
    ObjectGuid playerGuid;

    recv_data >> lootGuid >> slotid >> playerGuid;

    if (!_player->GetGroup() || _player->GetGroup()->GetLootMethod() != MASTER_LOOT || _player->GetGroup()->GetLooterGuid() != _player->GetObjectGuid())
    {
        _player->SendLootError(lootGuid, LOOT_ERROR_DIDNT_KILL);
        return;
    }

    Player* target = ObjectAccessor::FindPlayer(playerGuid);
    if (!target || !target->IsInWorld())
    {
        _player->SendLootError(lootGuid, LOOT_ERROR_PLAYER_NOT_FOUND);
        return;
    }

    // No loot for a player on another map, or not in the raid.
    if (!_player->IsInRaidWith(target) || !_player->IsInMap(target))
    {
        _player->SendLootError(lootGuid, LOOT_ERROR_MASTER_OTHER);
        return;
    }

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
    if (target->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_NO_PLAY_TIME))
    {
        _player->SendLootError(lootGuid, LOOT_ERROR_MASTER_OTHER);
        return;
    }
#endif

    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "WorldSession::HandleLootMasterGiveOpcode (CMSG_LOOT_MASTER_GIVE, 0x02A3) Target = %s [%s].", playerGuid.GetString().c_str(), target->GetName());

    if (_player->GetLootGuid() != lootGuid)
    {
        _player->SendLootError(lootGuid, LOOT_ERROR_DIDNT_KILL);
        return;
    }

    Loot *pLoot = nullptr;

    if (lootGuid.IsCreature())
    {
        Creature* creature = GetPlayer()->GetMap()->GetCreature(lootGuid);
        if (!creature)
        {
            _player->SendLootError(lootGuid, LOOT_ERROR_DIDNT_KILL);
            return;
        }
            
        if (!_player->IsAtGroupRewardDistance(creature))
        {
            _player->SendLootError(lootGuid, LOOT_ERROR_TOO_FAR);
            return;
        }

        pLoot = &creature->loot;
    }
    else if (lootGuid.IsGameObject())
    {
        GameObject* go = GetPlayer()->GetMap()->GetGameObject(lootGuid);
        if (!go)
        {
            _player->SendLootError(lootGuid, LOOT_ERROR_DIDNT_KILL);
            return;
        }

        if (!_player->IsAtGroupRewardDistance(go))
        {
            _player->SendLootError(lootGuid, LOOT_ERROR_TOO_FAR);
            return;
        }

        pLoot = &go->loot;
    }
    else
    {
        _player->SendLootError(lootGuid, LOOT_ERROR_DIDNT_KILL);
        return;
    }

    if (slotid >= pLoot->items.size())
    {
        _player->SendLootRelease(lootGuid);
        _player->SendEquipError(EQUIP_ERR_ITEM_NOT_FOUND, nullptr, nullptr);
        sLog.Player(this, LOG_BASIC, LOG_LVL_BASIC,
            "AutoLootItem: Player %s might be using a hack! (slot %d, size %lu)",
            GetPlayer()->GetName(), slotid, (unsigned long)pLoot->items.size());
        return;
    }

    if (!pLoot->IsAllowedLooter(playerGuid, false))
    {
        _player->SendLootError(lootGuid, LOOT_ERROR_MASTER_OTHER);
        return;
    }

    LootItem& item = pLoot->items[slotid];

    ItemPosCountVec dest;
    InventoryResult msg = target->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, item.itemid, item.count);
    if (msg != EQUIP_ERR_OK)
    {
        target->SendEquipError(msg, nullptr, nullptr, item.itemid);

        // send duplicate of error massage to master looter
        if (msg == EQUIP_ERR_BAG_FULL || msg == EQUIP_ERR_INVENTORY_FULL)
            _player->SendLootError(lootGuid, LOOT_ERROR_MASTER_INV_FULL);
        else if (msg == EQUIP_ERR_CANT_CARRY_MORE_OF_THIS)
            _player->SendLootError(lootGuid, LOOT_ERROR_MASTER_UNIQUE_ITEM);
        else
            _player->SendLootError(lootGuid, LOOT_ERROR_MASTER_OTHER);
        return;
    }

    // now move item from loot to target inventory
    if (Item* newitem = target->StoreNewItem(dest, item.itemid, true, item.randomPropertyId))
    {
        sLog.Player(this, LOG_LOOTS, LOG_LVL_BASIC,
            "Master loot %s gives %ux%u to %s [loot from %s]",
            _player->GetShortDescription().c_str(), item.count, item.itemid,
            target->GetShortDescription().c_str(), lootGuid.GetString().c_str());
        target->SendNewItem(newitem, uint32(item.count), false, false, true);
        target->OnReceivedItem(newitem);
    }

    // mark as looted
    item.count = 0;
    item.is_looted = true;

    pLoot->NotifyItemRemoved(slotid);
    --pLoot->unlootedCount;
}
