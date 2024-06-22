/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
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

/**
 * @addtogroup mailing
 * @{
 *
 * @file MailHandler.cpp
 * This file contains handlers for mail opcodes.
 *
 */

#include "Mail.h"
#include "Language.h"
#include "Log.h"
#include "ObjectGuid.h"
#include "ObjectMgr.h"
#include "Item.h"
#include "Player.h"
#include "World.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "Opcodes.h"
#include "Chat.h"
#include "Anticheat.h"
#include "AccountMgr.h"
#include "Database/DatabaseImpl.h"

void WorldSession::SendMailResult(uint32 mailId, MailResponseType mailAction, MailResponseResult mailError, uint32 equipError, uint32 item_guid, uint32 item_count)
{
    WorldPacket data(SMSG_SEND_MAIL_RESULT, (4 + 4 + 4 + (mailError == MAIL_ERR_EQUIP_ERROR ? 4 : (mailAction == MAIL_ITEM_TAKEN ? 4 + 4 : 0))));
    data << (uint32)mailId;
    data << (uint32)mailAction;
    data << (uint32)mailError;
    if (mailError == MAIL_ERR_EQUIP_ERROR)
        data << (uint32)equipError;
    else if (mailAction == MAIL_ITEM_TAKEN)
    {
        data << (uint32)item_guid;                         // item guid low?
        data << (uint32)item_count;                        // item count?
    }
    SendPacket(&data);
}

void WorldSession::SendNewMail()
{
    // deliver undelivered mail
    WorldPacket data(SMSG_RECEIVED_MAIL, 4);
    data << (uint32)0;
    SendPacket(&data);
}

bool WorldSession::CheckMailBox(ObjectGuid guid)
{
    if (!GetPlayer()->GetGameObjectIfCanInteractWith(guid, GAMEOBJECT_TYPE_MAILBOX))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Mailbox %s not found or you can't interact with it.", guid.GetString().c_str());
        return false;
    }

    return true;
}

class WorldSession::AsyncMailSendRequest
{
public:
    AsyncMailSendRequest(): accountId(0), money(0), COD(0), receiverPtr(nullptr), rcTeam(TEAM_NONE), mailsCount(0xFF) {}
    uint32 accountId;
    ObjectGuid senderGuid;
    ObjectGuid receiver;
    ObjectGuid itemGuid;
    uint32      money;
    uint32      COD;
    std::string subject;
    std::string body;
    std::string receiverName;
    Player*     receiverPtr;
    Team        rcTeam;
    uint8       mailsCount;

    void Callback(std::unique_ptr<QueryResult> result)
    {
        WorldSession* sess = sWorld.FindSession(accountId);
        if (!sess || !sess->GetPlayer() || sess->GetPlayer()->GetObjectGuid() != senderGuid || !sess->GetPlayer()->IsInWorld())
        {
            delete this;
            return;
        }

        if (result)
        {
            Field* fields = result->Fetch();
            mailsCount = fields[0].GetUInt32();
        }
        sess->HandleSendMailCallback(this);
        delete this;
    }
};

/**
 * Handles the Packet sent by the client when sending a mail.
 *
 * This methods takes the packet sent by the client and performs the following actions:
 * - Checks whether the mail is valid: i.e. can he send the selected items,
 *   does he have enough money, etc.
 * - Creates a MailDraft and adds the needed items, money, cost data.
 * - Sends the mail.
 *
 * Depending on the outcome of the checks performed the player will recieve a different
 * MailResponseResult.
 *
 * @see MailResponseResult
 * @see SendMailResult()
 *
 * @param recv_data the WorldPacket containing the data sent by the client.
 */
void WorldSession::HandleSendMail(WorldPacket& recv_data)
{
    ObjectGuid mailboxGuid;
    uint32 unk1, unk2;
    
    recv_data >> mailboxGuid;
    if (!CheckMailBox(mailboxGuid))
        return;

    WorldSession::AsyncMailSendRequest* req = new WorldSession::AsyncMailSendRequest();
    req->accountId = GetAccountId();
    req->senderGuid = GetMasterPlayer()->GetObjectGuid();
    recv_data >> req->receiverName;

    recv_data >> req->subject;

    recv_data >> req->body;

    recv_data >> unk1;                                      // stationery?
    recv_data >> unk2;                                      // 0x00000000

    recv_data >> req->itemGuid;

    recv_data >> req->money >> req->COD;                    // money and cod

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    uint64 unk3;
    uint8 unk4;
    recv_data >> unk3;                                      // const 0
    recv_data >> unk4;                                      // const 0
#endif

    // packet read complete, now do check
    if (req->subject.size() > 64)
    {
        delete req;
        return;
    }

    if (req->body.size() > 500)
    {
        delete req;
        return;
    }

    // client interface limit
    if (req->COD > 100000000)
    {
        ProcessAnticheatAction("PassiveAnticheat", "Attempt to send more than 10000g COD mail", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS);
        delete req;
        return;
    }

    if (req->COD && sWorld.getConfig(CONFIG_UINT32_COD_FORCE_TAG_MAX_LEVEL) &&
        sWorld.getConfig(CONFIG_UINT32_COD_FORCE_TAG_MAX_LEVEL) > GetAccountMaxLevel())
        req->subject = "(COD) " + req->subject;

    // Do not allow GMs to send money / items
    if (!sWorld.getConfig(CONFIG_BOOL_GM_ALLOW_TRADES) && GetSecurity() > SEC_PLAYER)
    {
        if (!req->itemGuid.IsEmpty() || req->money)
        {
            delete req;
            return;
        }
    }

    if (req->receiverName.empty())
    {
        delete req;
        return;
    }

    MasterPlayer* pl = GetMasterPlayer();

    if (normalizePlayerName(req->receiverName))
        req->receiver = sObjectMgr.GetPlayerGuidByName(req->receiverName);

    if (!req->receiver)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "%s is sending mail to %s (GUID: nonexistent!) with subject %s and body %s includes %u items, %u copper and %u COD copper with unk1 = %u, unk2 = %u",
                   pl->GetGuidStr().c_str(), req->receiverName.c_str(), req->subject.c_str(), req->body.c_str(), req->itemGuid ? 1 : 0, req->money, req->COD, unk1, unk2);
        SendMailResult(0, MAIL_SEND, MAIL_ERR_RECIPIENT_NOT_FOUND);
        delete req;
        return;
    }

    sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "%s is sending mail to %s with subject %s and body %s includes %u items, %u copper and %u COD copper with unk1 = %u, unk2 = %u",
               pl->GetGuidStr().c_str(), req->receiverName.c_str(), req->subject.c_str(), req->body.c_str(), req->itemGuid ? 1 : 0, req->money, req->COD, unk1, unk2);

    if (pl->GetObjectGuid() == req->receiver)
    {
        SendMailResult(0, MAIL_SEND, MAIL_ERR_CANNOT_SEND_TO_SELF);
        delete req;
        return;
    }

    req->receiverPtr = sObjectMgr.GetPlayer(req->receiver);

    if (req->receiverPtr)
    {
        MasterPlayer* receiverMasterPlayer = req->receiverPtr->GetSession()->GetMasterPlayer();
        ASSERT(receiverMasterPlayer);
        req->rcTeam = receiverMasterPlayer->GetTeam();
        req->mailsCount = receiverMasterPlayer->GetMailSize();
        req->Callback(nullptr);
    }
    else
    {
        req->rcTeam = sObjectMgr.GetPlayerTeamByGUID(req->receiver);
        // Unsafe query: can modify items, accesses online players ...
        CharacterDatabase.AsyncPQueryUnsafe(req, &WorldSession::AsyncMailSendRequest::Callback, "SELECT COUNT(*) FROM `mail` WHERE `receiver_guid` = '%u'", req->receiver.GetCounter());
    }
}

// $req will be deleted by the caller.
void WorldSession::HandleSendMailCallback(WorldSession::AsyncMailSendRequest* req)
{
    MasterPlayer* pl = GetMasterPlayer();
    Player* loadedPlayer = GetPlayer();
    ASSERT(pl);

    uint32 reqmoney = req->money + 30;

    // Check for overflow
    if (reqmoney < req->money)
    {
        ProcessAnticheatAction("MailCheck", "Attempt to send free mails with money overflow", CHEAT_ACTION_LOG);
        SendMailResult(0, MAIL_SEND, MAIL_ERR_NOT_ENOUGH_MONEY);
        return;
    }
    if (reqmoney && (!loadedPlayer || loadedPlayer->GetMoney() < reqmoney))
    {
        SendMailResult(0, MAIL_SEND, MAIL_ERR_NOT_ENOUGH_MONEY);
        return;
    }

    // do not allow to have more than 100 mails in mailbox.. mails count is in opcode uint8!!! - so max can be 255..
    if (req->mailsCount > 100)
    {
        SendMailResult(0, MAIL_SEND, MAIL_ERR_RECIPIENT_CAP_REACHED);
        return;
    }

    // check the receiver's Faction...
    if (!sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_MAIL) && pl->GetTeam() != req->rcTeam && GetSecurity() == SEC_PLAYER)
    {
        SendMailResult(0, MAIL_SEND, MAIL_ERR_NOT_YOUR_TEAM);
        return;
    }

    uint32 rc_account = sObjectMgr.GetPlayerAccountIdByGUID(req->receiver);

    Item* item = nullptr;

    if (req->itemGuid)
    {
        item = loadedPlayer->GetItemByGuid(req->itemGuid);

        // prevent sending bag with items (cheat: can be placed in bag after adding equipped empty bag to mail)
        if (!item || !item->IsInWorld())
        {
            SendMailResult(0, MAIL_SEND, MAIL_ERR_INTERNAL_ERROR);
            return;
        }

        // prevent sending item from bank slot
        if (_player->IsBankPos(item->GetPos())) 
        {
            SendMailResult(0, MAIL_SEND, MAIL_ERR_INTERNAL_ERROR);
            return;
        }

        if (!item->CanBeTraded())
        {
            SendMailResult(0, MAIL_SEND, MAIL_ERR_INTERNAL_ERROR);
            return;
        }

        if ((item->GetProto()->Flags & ITEM_FLAG_CONJURED) || item->GetUInt32Value(ITEM_FIELD_DURATION))
        {
            SendMailResult(0, MAIL_SEND, MAIL_ERR_INTERNAL_ERROR);
            return;
        }
    }

    // Antispam checks
    if (loadedPlayer->GetLevel() < sWorld.getConfig(CONFIG_UINT32_MAILSPAM_LEVEL) &&
        req->money < sWorld.getConfig(CONFIG_UINT32_MAILSPAM_MONEY) &&
        (sWorld.getConfig(CONFIG_BOOL_MAILSPAM_ITEM) && !req->itemGuid))
    {
        SendMailResult(0, MAIL_SEND, MAIL_ERR_INTERNAL_ERROR);
        return;
    }

    AccountPersistentData& data = sAccountMgr.GetAccountPersistentData(GetAccountId());
    if (!data.CanMail(rc_account))
    {
        std::stringstream details;
        std::string from = ChatHandler(this).playerLink(GetMasterPlayer()->GetName());
        std::string to = ChatHandler(this).playerLink(req->receiverName);
        details << from << " -> " << to << "\n";
        details << req->subject << "\n";
        details << req->body << "\n";
        if (req->COD)
            details << "COD: " << req->COD << " coppers\n";
        uint32 logId = sWorld.InsertLog(details.str(), SEC_GAMEMASTER);

        std::stringstream oss;
        oss << "Mail limit reached (\"" << req->body.substr(0, 30) << "...\") [log #" << logId << "]";
        ProcessAnticheatAction("ChatSpam", oss.str().c_str(), CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS);
        SendMailResult(0, MAIL_SEND, MAIL_OK);
        return;
    }
    data.JustMailed(rc_account);

    SendMailResult(0, MAIL_SEND, MAIL_OK);

    loadedPlayer->ModifyMoney(-int32(reqmoney));

    MailDraft draft(req->subject, req->body);

    if (!req->COD && (req->money || item))
    {
        PlayerTransactionData data;
        data.type = "Mail";
        data.parts[0].lowGuid = pl->GetGUIDLow();
        if (item)
        {
            data.parts[0].itemsEntries[0] = item->GetEntry();
            data.parts[0].itemsCount[0] = item->GetCount();
            data.parts[0].itemsGuid[0] = item->GetGUIDLow();
        }
        data.parts[0].money = req->money;
        data.parts[1].lowGuid = req->receiver.GetCounter();
        sWorld.LogTransaction(data);
    }

    if (req->itemGuid || req->money > 0)
    {
        if (item)
        {
            if (GetSecurity() > SEC_PLAYER && sWorld.getConfig(CONFIG_BOOL_GM_LOG_TRADE))
            {
                sLog.Player(GetAccountId(), LOG_GM, LOG_LVL_BASIC,
                    "GM %s (Account: %u) mail item: %s (Entry: %u Count: %u) to player: %s (Account: %u)",
                    GetPlayerName(), GetAccountId(), item->GetProto()->Name1, item->GetEntry(), item->GetCount(),
                    req->receiver.GetString().c_str(), rc_account);
            }

            loadedPlayer->MoveItemFromInventory(item->GetBagSlot(), item->GetSlot(), true);
            CharacterDatabase.BeginTransaction(loadedPlayer->GetGUIDLow());
            item->DeleteFromInventoryDB();                  // deletes item from character's inventory
            item->SaveToDB();                               // recursive and not have transaction guard into self, item not in inventory and can be save standalone
            // owner in data will set at mail receive and item extracting
            CharacterDatabase.PExecute("UPDATE `item_instance` SET `owner_guid` = '%u' WHERE `guid`='%u'", req->receiver.GetCounter(), item->GetGUIDLow());
            CharacterDatabase.CommitTransaction();

            draft.AddItem(item);
        }

        if (req->money > 0 &&  GetSecurity() > SEC_PLAYER && sWorld.getConfig(CONFIG_BOOL_GM_LOG_TRADE))
        {
            sLog.Player(GetAccountId(), LOG_GM, LOG_LVL_BASIC,
                "GM %s (Account: %u) mail money: %u to player: %s (Account: %u)",
                GetPlayerName(), GetAccountId(), req->money, req->receiver.GetString().c_str(), rc_account);
        }
    }

    // default delay for mails is one hour in WoW Classic https://eu.battle.net/support/de/article/98485
    // mails which only contain a text message will arrive instantly
    uint32 deliver_delay = (!req->itemGuid && req->money == 0) ? 0 : sWorld.getConfig(CONFIG_UINT32_MAIL_DELIVERY_DELAY);

    if (!item && req->COD)
    {
        req->COD = 0;
        ProcessAnticheatAction("MailCheck", "Attempt to send COD mail without any item", CHEAT_ACTION_LOG);
    }
    // will delete item or place to receiver mail list
    draft
    .SetMoney(req->money)
    .SetCOD(req->COD)
    .SendMailTo(MailReceiver(req->receiverPtr, req->receiver), loadedPlayer, req->body.empty() ? MAIL_CHECK_MASK_COPIED : MAIL_CHECK_MASK_HAS_BODY, deliver_delay);

    CharacterDatabase.BeginTransaction(loadedPlayer->GetGUIDLow());
    loadedPlayer->SaveInventoryAndGoldToDB();
    CharacterDatabase.CommitTransaction();
}

/**
 * Handles the Packet sent by the client when reading a mail.
 *
 * This method is called when a client reads a mail that was previously unread.
 * It will add the MAIL_CHECK_MASK_READ flag to the mail being read.
 *
 * @see MailCheckMask
 *
 * @param recv_data the packet containing information about the mail the player read.
 *
 */
void WorldSession::HandleMailMarkAsRead(WorldPacket& recv_data)
{
    ObjectGuid mailboxGuid;
    uint32 mailId;
    recv_data >> mailboxGuid;
    recv_data >> mailId;

    if (!CheckMailBox(mailboxGuid))
        return;

    MasterPlayer* pl = GetMasterPlayer();
    ASSERT(pl);

    if (Mail *m = pl->GetMail(mailId))
    {
        if (m->state == MAIL_STATE_DELETED)
        {
            ProcessAnticheatAction("MailCheck", "Attempt to mark deleted mail as read", CHEAT_ACTION_LOG);
            return;
        }
        pl->DecreaseUnreadMailsCount();
        m->checked = m->checked | MAIL_CHECK_MASK_READ;
        pl->MarkMailsUpdated();
        m->state = MAIL_STATE_CHANGED;

        time_t time_now = time(nullptr);
        if ((m->expire_time - time_now) > (3 * DAY))
            m->expire_time = time_now + (3 * DAY);
    }
}

/**
 * Handles the Packet sent by the client when deleting a mail.
 *
 * This method is called when a client deletes a mail in his mailbox.
 *
 * @param recv_data The packet containing information about the mail being deleted.
 *
 */
void WorldSession::HandleMailDelete(WorldPacket& recv_data)
{
    ObjectGuid mailboxGuid;
    uint32 mailId;
    recv_data >> mailboxGuid;
    recv_data >> mailId;

    if (!CheckMailBox(mailboxGuid))
        return;

    MasterPlayer* pl = GetMasterPlayer();
    ASSERT(pl);
    pl->MarkMailsUpdated();

    if (Mail *m = pl->GetMail(mailId))
    {
        // delete shouldn't show up for COD mails
        if (m->COD)
        {
            SendMailResult(mailId, MAIL_DELETED, MAIL_ERR_INTERNAL_ERROR);
            return;
        }

        m->state = MAIL_STATE_DELETED;
    }
    SendMailResult(mailId, MAIL_DELETED, MAIL_OK);
}
/**
 * Handles the Packet sent by the client when returning a mail to sender.
 * This method is called when a player chooses to return a mail to its sender.
 * It will create a new MailDraft and add the items, money, etc. associated with the mail
 * and then send the mail to the original sender.
 *
 * @param recv_data The packet containing information about the mail being returned.
 *
 */
void WorldSession::HandleMailReturnToSender(WorldPacket& recv_data)
{
    ObjectGuid mailboxGuid;
    uint32 mailId;
    recv_data >> mailboxGuid;
    recv_data >> mailId;

    if (!CheckMailBox(mailboxGuid))
        return;

    MasterPlayer* pl = GetMasterPlayer();
    ASSERT(pl);
    Mail *m = pl->GetMail(mailId);
    if (!m || m->state == MAIL_STATE_DELETED || m->deliver_time > time(nullptr))
    {
        SendMailResult(mailId, MAIL_RETURNED_TO_SENDER, MAIL_ERR_INTERNAL_ERROR);
        return;
    }

    //we can return mail now
    //so firstly delete the old one
    CharacterDatabase.BeginTransaction(pl->GetGUIDLow());
    CharacterDatabase.PExecute("DELETE FROM `mail` WHERE `id` = '%u'", mailId);
    // needed?
    CharacterDatabase.PExecute("DELETE FROM `mail_items` WHERE `mail_id` = '%u'", mailId);
    CharacterDatabase.CommitTransaction();
    pl->RemoveMail(mailId);

    // send back only to existing players and simple drop for other cases
    if (m->messageType == MAIL_NORMAL && m->sender)
    {
        MailDraft draft;
        if (m->mailTemplateId)
            draft.SetMailTemplate(m->mailTemplateId, false);// items already included
        else
            draft.SetSubjectAndBodyId(m->subject, m->itemTextId);

        if (m->HasItems())
        {
            for (const auto& itr2 : m->items)
            {
                if (Item *item = pl->GetMItem(itr2.itemGuid))
                    draft.AddItem(item);

                pl->RemoveMItem(itr2.itemGuid);
            }
        }

        draft.SetMoney(m->money).SendReturnToSender(GetAccountId(), m->receiverGuid, ObjectGuid(HIGHGUID_PLAYER, m->sender));
    }

    delete m;                                               // we can deallocate old mail
    SendMailResult(mailId, MAIL_RETURNED_TO_SENDER, MAIL_OK);
}

/**
 * Handles the packet sent by the client when taking an item from the mail.
 */
void WorldSession::HandleMailTakeItem(WorldPacket& recv_data)
{
    ObjectGuid mailboxGuid;
    uint32 mailId;
    recv_data >> mailboxGuid;
    recv_data >> mailId;

    if (!CheckMailBox(mailboxGuid))
        return;

    MasterPlayer* pl = GetMasterPlayer();
    Player* loadedPlayer = GetPlayer();
    ASSERT(pl);

    Mail* m = pl->GetMail(mailId);
    if (!m || m->state == MAIL_STATE_DELETED || m->deliver_time > time(nullptr))
    {
        SendMailResult(mailId, MAIL_ITEM_TAKEN, MAIL_ERR_INTERNAL_ERROR);
        return;
    }

    // Prevent spoofed packet accessing mail that doesn't actually have items
    if (!m->HasItems() || m->items.empty())
    {
        SendMailResult(mailId, MAIL_ITEM_TAKEN, MAIL_ERR_INTERNAL_ERROR);
        return;
    }

    // prevent cheating with skip client money check
    if (loadedPlayer->GetMoney() < m->COD)
    {
        SendMailResult(mailId, MAIL_ITEM_TAKEN, MAIL_ERR_NOT_ENOUGH_MONEY);
        return;
    }

    // Do not allow GMs to send COD
    if (!sWorld.getConfig(CONFIG_BOOL_GM_ALLOW_TRADES) && GetSecurity() > SEC_PLAYER && m->COD)
    {
        SendMailResult(mailId, MAIL_ITEM_TAKEN, MAIL_ERR_NOT_ENOUGH_MONEY);
        return;
    }

    uint32 itemId = m->items[0].itemId;
    uint32 itemGuid = m->items[0].itemGuid;

    Item *it = pl->GetMItem(itemGuid);

    ItemPosCountVec dest;
    uint8 msg = _player->CanStoreItem(NULL_BAG, NULL_SLOT, dest, it, false);
    if (msg == EQUIP_ERR_OK)
    {
        m->RemoveItem(itemGuid);
        m->removedItems.push_back(itemGuid);

        if (m->COD > 0)                                     // if there is COD, take COD money from player and send them to sender by mail
        {
            ObjectGuid sender_guid = ObjectGuid(HIGHGUID_PLAYER, m->sender);
            Player* sender = sObjectMgr.GetPlayer(sender_guid);

            // Transaction log
            PlayerTransactionData data;
            data.type = "MailCOD";
            data.parts[0].lowGuid = sender_guid.GetCounter();
            if (it)
            {
                data.parts[0].itemsEntries[0] = it->GetEntry();
                data.parts[0].itemsCount[0] = it->GetCount();
                data.parts[0].itemsGuid[0] = it->GetGUIDLow();
            }
            data.parts[1].lowGuid = _player->GetGUIDLow();
            data.parts[1].money = m->COD;
            sWorld.LogTransaction(data);

            uint32 sender_accId = 0;

            if (GetSecurity() > SEC_PLAYER && sWorld.getConfig(CONFIG_BOOL_GM_LOG_TRADE))
            {
                std::string sender_name;
                if (sender)
                {
                    sender_accId = sender->GetSession()->GetAccountId();
                    sender_name = sender->GetName();
                }
                else
                {
                    // can be calculated early
                    sender_accId = sObjectMgr.GetPlayerAccountIdByGUID(sender_guid);

                    if (!sObjectMgr.GetPlayerNameByGUID(sender_guid, sender_name))
                        sender_name = sObjectMgr.GetMangosStringForDBCLocale(LANG_UNKNOWN);
                }
                sLog.Player(GetAccountId(), LOG_GM, LOG_LVL_BASIC,
                    "GM %s (Account: %u) receive mail item: %s (Entry: %u Count: %u) and send COD money: %u to player: %s (Account: %u)",
                    GetPlayerName(), GetAccountId(), it->GetProto()->Name1, it->GetEntry(), it->GetCount(), m->COD, sender_name.c_str(), sender_accId);
            }
            else if (!sender)
                sender_accId = sObjectMgr.GetPlayerAccountIdByGUID(sender_guid);

            // check player existence
            if (sender || sender_accId)
            {
                MailDraft(m->subject)
                .SetMoney(m->COD)
                .SendMailTo(MailReceiver(sender, sender_guid), _player, MAIL_CHECK_MASK_COD_PAYMENT);
            }

            loadedPlayer->ModifyMoney(-int32(m->COD));
        }
        m->COD = 0;
        m->state = MAIL_STATE_CHANGED;
        pl->MarkMailsUpdated();
        pl->RemoveMItem(it->GetGUIDLow());

        uint32 count = it->GetCount();                      // save counts before store and possible merge with deleting
        it->SetState(ITEM_UNCHANGED);                       // need to set this state, otherwise item cannot be removed later, if necessary
        loadedPlayer->MoveItemToInventory(dest, it, true);

        CharacterDatabase.BeginTransaction(loadedPlayer->GetGUIDLow());
        loadedPlayer->SaveInventoryAndGoldToDB();
        pl->SaveMails();
        CharacterDatabase.CommitTransaction();

        SendMailResult(mailId, MAIL_ITEM_TAKEN, MAIL_OK, 0, itemId, count);
    }
    else
        SendMailResult(mailId, MAIL_ITEM_TAKEN, MAIL_ERR_EQUIP_ERROR, msg);
}
/**
 * Handles the packet sent by the client when taking money from the mail.
 */
void WorldSession::HandleMailTakeMoney(WorldPacket& recv_data)
{
    ObjectGuid mailboxGuid;
    uint32 mailId;
    recv_data >> mailboxGuid;
    recv_data >> mailId;

    if (!CheckMailBox(mailboxGuid))
        return;

    MasterPlayer* pl = GetMasterPlayer();
    Player* loadedPlayer = GetPlayer();
    ASSERT(pl);

    Mail* m = pl->GetMail(mailId);
    if (!m || m->state == MAIL_STATE_DELETED || m->deliver_time > time(nullptr))
    {
        SendMailResult(mailId, MAIL_MONEY_TAKEN, MAIL_ERR_INTERNAL_ERROR);
        return;
    }

    SendMailResult(mailId, MAIL_MONEY_TAKEN, MAIL_OK);

    loadedPlayer->LogModifyMoney(m->money, "Mail", ObjectGuid(HIGHGUID_PLAYER, m->sender));
    m->money = 0;
    m->state = MAIL_STATE_CHANGED;
    pl->MarkMailsUpdated();

    // save money and mail to prevent cheating
    CharacterDatabase.BeginTransaction(loadedPlayer->GetGUIDLow());
    loadedPlayer->SaveGoldToDB();
    pl->SaveMails();
    CharacterDatabase.CommitTransaction();
}

/**
 * Handles the packet sent by the client when requesting the current mail list.
 * It will send a list of all available mails in the players mailbox to the client.
 */
void WorldSession::HandleGetMailList(WorldPacket& recv_data)
{
    ObjectGuid mailboxGuid;
    recv_data >> mailboxGuid;

    if (!CheckMailBox(mailboxGuid))
        return;

    MasterPlayer* pl = GetMasterPlayer();
    ASSERT(pl);

    constexpr uint32 averageSizePerMail =
        sizeof(uint32) /*Message Id*/ +
        sizeof(uint8) /*Message Type*/ + 
        sizeof(uint64) /*Sender Guid*/ +
        32 /*Subject (max 64)*/ +
        sizeof(uint32) /*Item Text Id*/ +
        sizeof(uint32) /*Unknown*/ +
        sizeof(uint32) /*Stationery*/ +
        sizeof(uint32) /*Item Entry*/ +
        sizeof(uint32) /*Item Enchantment Id*/ +
        sizeof(uint32) /*Item Random Property Id*/ +
        sizeof(uint32) /*Item Suffix Factor*/ +
        sizeof(uint8) /*Item Count*/ +
        sizeof(uint32) /*Item Spell Charges*/ +
        sizeof(uint32) /*Item Max Durability*/ +
        sizeof(uint32) /*Item Durability*/ +
        sizeof(uint32) /*Money*/ +
        sizeof(uint32) /*Cod*/ +
        sizeof(uint32) /*Checked*/ +
        sizeof(float) /*Expire Time*/
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
        + sizeof(uint32) /*Mail Template Id*/
#endif
        ;

    WorldPacket data(SMSG_MAIL_LIST_RESULT, 1 + std::min(pl->GetMailSize(), 253u) * averageSizePerMail);
    data << uint8(0);                                       // mail's count
    time_t cur_time = time(nullptr);

    uint32 mailsCount = 0;                                  // real send to client mails amount
    for (PlayerMails::iterator itr = pl->GetMailBegin(); itr != pl->GetMailEnd(); ++itr)
    {
        // packet send mail count as uint8, prevent overflow
        if (mailsCount >= 254)
            break;

        // skip deleted or not delivered (deliver delay not expired) mails
        if ((*itr)->state == MAIL_STATE_DELETED || cur_time < (*itr)->deliver_time || cur_time > (*itr)->expire_time)
            continue;

        data << uint32((*itr)->messageID);                  // Message ID
        data << uint8((*itr)->messageType);                 // Message Type

        switch ((*itr)->messageType)
        {
            case MAIL_NORMAL:                               // sender guid
                data << ObjectGuid(HIGHGUID_PLAYER, (*itr)->sender);
                break;
            case MAIL_CREATURE:
            case MAIL_GAMEOBJECT:
            case MAIL_AUCTION:
                data << (uint32)(*itr)->sender;             // creature/gameobject entry, auction id
                break;
            case MAIL_ITEM:                                 // item entry (?) sender = "Unknown", NYI
                break;
        }

        data << (*itr)->subject;                            // Subject string - once 00, when mail type = 3
        data << uint32((*itr)->itemTextId);                 // sure about this
        data << uint32(0);                                  // unknown
        data << uint32((*itr)->stationery);                 // stationery (Stationery.dbc)

        // 1.12.1 can have only single item
        Item *item = !(*itr)->items.empty() ? pl->GetMItem((*itr)->items[0].itemGuid) : nullptr;

        if (item)
        {
            data << uint32(item->GetEntry());
            data << uint32(item->GetEnchantmentId((EnchantmentSlot)PERM_ENCHANTMENT_SLOT)); // permanent enchantment
            data << uint32(item->GetItemRandomPropertyId());                                // can be negative
            data << uint32(item->GetItemSuffixFactor());                                    // unk
            data << uint8(item->GetCount());                                                // stack count
            data << uint32(item->GetSpellCharges());                                        // charges
            data << uint32(item->GetUInt32Value(ITEM_FIELD_MAXDURABILITY));                 // durability max
            data << uint32(item->GetUInt32Value(ITEM_FIELD_DURABILITY));                    // durability current
        }
        else
        {
            data << uint32(0) << uint32(0) << uint32(0) << uint32(0) << uint8(0) << uint32(0) << uint32(0) << uint32(0);
        }

        data << uint32((*itr)->money);                      // copper
        data << uint32((*itr)->COD);                        // Cash on delivery
        data << uint32((*itr)->checked);                    // flags
        data << float(float((*itr)->expire_time - time(nullptr)) / float(DAY));// Time

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
        data << uint32((*itr)->mailTemplateId);             // mail template (MailTemplate.dbc)
#endif

        mailsCount += 1;
    }

    data.put<uint8>(0, mailsCount);                         // set real send mails to client
    SendPacket(&data);

    // recalculate m_nextMailDelivereTime and unReadMails
    pl->UpdateNextMailTimeAndUnreads();
}

/**
 * Handles the packet sent by the client when requesting information about the body of a mail.
 *
 * This function is called when client needs mail message body,
 * or when player clicks on item which has some flag set
 */
void WorldSession::HandleItemTextQuery(WorldPacket& recv_data)
{
    uint32 itemTextId;
    uint32 mailId;                                          // this value can be item id in bag, but it is also mail id
    uint32 unk;                                             // maybe something like state - 0x70000000

    recv_data >> itemTextId >> mailId >> unk;

    // TODO: some check needed, if player has item with guid mailId, or has mail with id mailId

    WorldPacket data(SMSG_ITEM_TEXT_QUERY_RESPONSE, (4 + 10)); // guess size
    data << itemTextId;
    data << sObjectMgr.GetItemText(itemTextId);
    SendPacket(&data);
}

/**
 * Handles the packet sent by the client when he copies the body a mail to his inventory.
 *
 * When a player copies the body of a mail to his inventory this method is called. It will create
 * a new item with the text of the mail and store it in the players inventory (if possible).
 *
 */
void WorldSession::HandleMailCreateTextItem(WorldPacket& recv_data)
{
    ObjectGuid mailboxGuid;
    uint32 mailId;

    recv_data >> mailboxGuid;
    recv_data >> mailId;

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    recv_data.read_skip<uint32>();                          // mailTemplateId, non need, Mail store own 100% correct value anyway
#endif

    if (!CheckMailBox(mailboxGuid))
        return;

    MasterPlayer* pl = GetMasterPlayer();
    ASSERT(pl);
    Player* loadedPlayer = _player;

    Mail* m = pl->GetMail(mailId);
    if (!m || (!m->itemTextId && !m->mailTemplateId) || m->state == MAIL_STATE_DELETED || m->deliver_time > time(nullptr) || m->checked & MAIL_CHECK_MASK_COPIED)
    {
        SendMailResult(mailId, MAIL_MADE_PERMANENT, MAIL_ERR_INTERNAL_ERROR);
        return;
    }

    uint32 itemTextId = m->itemTextId;

    Item *bodyItem = new Item;                              // This is not bag and then can be used new Item.
    if (!bodyItem->Create(sObjectMgr.GenerateItemLowGuid(), MAIL_BODY_ITEM_TEMPLATE, pl->GetObjectGuid()))
    {
        delete bodyItem;
        return;
    }

    bodyItem->SetUInt32Value(ITEM_FIELD_ITEM_TEXT_ID, itemTextId);
    bodyItem->SetGuidValue(ITEM_FIELD_CREATOR, ObjectGuid(HIGHGUID_PLAYER, m->sender));

    ItemPosCountVec dest;
    uint8 msg = _player->CanStoreItem(NULL_BAG, NULL_SLOT, dest, bodyItem, false);
    if (msg == EQUIP_ERR_OK)
    {
        m->checked = m->checked | MAIL_CHECK_MASK_COPIED;
        m->state = MAIL_STATE_CHANGED;
        pl->MarkMailsUpdated();

        loadedPlayer->StoreItem(dest, bodyItem, true);
        SendMailResult(mailId, MAIL_MADE_PERMANENT, MAIL_OK);
    }
    else
    {
        SendMailResult(mailId, MAIL_MADE_PERMANENT, MAIL_ERR_EQUIP_ERROR, msg);
        delete bodyItem;
    }
}

/**
 * No idea when this is called.
 */
void WorldSession::HandleQueryNextMailTime(WorldPacket& /**recv_data*/)
{
    MasterPlayer* player = GetMasterPlayer();
    ASSERT(player);
    WorldPacket data(MSG_QUERY_NEXT_MAIL_TIME, 8);
    if (player->HasUnreadMail())
        data << float(0);
    else
        data << float(-86400.0f);
    SendPacket(&data);
}

/*! @} */
