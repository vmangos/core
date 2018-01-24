#include "MasterPlayer.h"
#include "Database/DatabaseEnv.h"
#include "ObjectMgr.h"
#include "SocialMgr.h"
#include "Item.h"
#include "Mail.h"
#include "ObjectAccessor.h"

MasterPlayer::MasterPlayer(WorldSession* s):
    m_session(s), m_social(NULL), m_mailsUpdated(false),
    m_speakTime(0), m_speakCount(0)
{
}

MasterPlayer::~MasterPlayer()
{
    CleanupChannels();
    sObjectAccessor.RemoveObject(this);

    //all mailed items should be deleted, also all mail should be deallocated
    for (PlayerMails::const_iterator itr =  m_mail.begin(); itr != m_mail.end(); ++itr)
        delete *itr;

    for (ItemMap::const_iterator iter = mMitems.begin(); iter != mMitems.end(); ++iter)
        delete iter->second;                                //if item is duplicated... then server may crash ... but that item should be deallocated
}

void MasterPlayer::Create(Player* player)
{
    guid = player->GetObjectGuid();
    PlayerInfo const* info = sObjectMgr.GetPlayerInfo(player->getRace(), player->getClass());
    ASSERT(info);

    // original action bar
    for (PlayerCreateInfoActions::const_iterator action_itr = info->action.begin(); action_itr != info->action.end(); ++action_itr)
        addActionButton(action_itr->button, action_itr->action, action_itr->type);
}

void MasterPlayer::LoadPlayer(Player* player)
{
    guid = player->GetObjectGuid();
    name = player->GetName();
    zoneId = player->GetCachedZoneId();
    areaId = player->GetCachedAreaId();
    raceId = player->getRace();
    classId = player->getClass();
    level = player->getLevel();
    guildId = player->GetGuildId();
    m_team = player->GetTeam();
    m_chatTag = player->chatTag();
    afkMsg = player->afkMsg;
    dndMsg = player->dndMsg;
    m_gmInvisibilityLevel = player->GetGMInvisibilityLevel();
    guildRank = player->GetRank();
    m_ExtraFlags = player->GetExtraFlags();
}

void MasterPlayer::SaveToDB()
{
    CharacterDatabase.BeginTransaction(GetGUIDLow());
    SaveActions();
    SaveMails();
    CharacterDatabase.CommitTransaction();
}

void MasterPlayer::Update()
{
    // undelivered mail
    if (m_nextMailDelivereTime && m_nextMailDelivereTime <= time(NULL))
    {
        SendNewMail();
        ++unReadMails;

        // It will be recalculate at mailbox open (for unReadMails important non-0 until mailbox open, it also will be recalculated)
        m_nextMailDelivereTime = 0;
    }
}

// ######################## MAIL SYSTEM    ###########################
void MasterPlayer::AddMItem(Item* it)
{
    mMitems[it->GetGUIDLow()] = it;
}

void MasterPlayer::SaveMails()
{
    if (!m_mailsUpdated)
        return;

    static SqlStatementID updateMail ;
    static SqlStatementID deleteMailItems ;

    static SqlStatementID deleteItem ;
    static SqlStatementID deleteItemText;
    static SqlStatementID deleteMain ;
    static SqlStatementID deleteItems ;

    for (PlayerMails::iterator itr = m_mail.begin(); itr != m_mail.end(); ++itr)
    {
        Mail *m = (*itr);
        if (m->state == MAIL_STATE_CHANGED)
        {
            SqlStatement stmt = CharacterDatabase.CreateStatement(updateMail, "UPDATE mail SET itemTextId = ?,has_items = ?, expire_time = ?, deliver_time = ?, money = ?, cod = ?, checked = ? WHERE id = ?");
            stmt.addUInt32(m->itemTextId);
            stmt.addUInt32(m->HasItems() ? 1 : 0);
            stmt.addUInt64(uint64(m->expire_time));
            stmt.addUInt64(uint64(m->deliver_time));
            stmt.addUInt32(m->money);
            stmt.addUInt32(m->COD);
            stmt.addUInt32(m->checked);
            stmt.addUInt32(m->messageID);
            stmt.Execute();

            if (m->removedItems.size())
            {
                stmt = CharacterDatabase.CreateStatement(deleteMailItems, "DELETE FROM mail_items WHERE item_guid = ?");

                for (std::vector<uint32>::const_iterator itr2 = m->removedItems.begin(); itr2 != m->removedItems.end(); ++itr2)
                    stmt.PExecute(*itr2);

                m->removedItems.clear();
            }
            m->state = MAIL_STATE_UNCHANGED;
        }
        else if (m->state == MAIL_STATE_DELETED)
        {
            if (m->HasItems())
            {
                SqlStatement stmt = CharacterDatabase.CreateStatement(deleteItem, "DELETE FROM item_instance WHERE guid = ?");
                for (MailItemInfoVec::const_iterator itr2 = m->items.begin(); itr2 != m->items.end(); ++itr2)
                    stmt.PExecute(itr2->item_guid);
            }

            if (m->itemTextId && m->stationery != MAIL_STATIONERY_DEFAULT)
            {
                SqlStatement stmt = CharacterDatabase.CreateStatement(deleteItemText, "DELETE FROM item_text WHERE id = ?");
                stmt.PExecute(m->itemTextId);
            }

            SqlStatement stmt = CharacterDatabase.CreateStatement(deleteMain, "DELETE FROM mail WHERE id = ?");
            stmt.PExecute(m->messageID);

            stmt = CharacterDatabase.CreateStatement(deleteItems, "DELETE FROM mail_items WHERE mail_id = ?");
            stmt.PExecute(m->messageID);
        }
    }

    //deallocate deleted mails...
    for (PlayerMails::iterator itr = m_mail.begin(); itr != m_mail.end();)
    {
        if ((*itr)->state == MAIL_STATE_DELETED)
        {
            Mail* m = *itr;
            m_mail.erase(itr);
            delete m;
            itr = m_mail.begin();
        }
        else
            ++itr;
    }

    m_mailsUpdated = false;
}

void MasterPlayer::RemoveMail(uint32 id)
{
    for (PlayerMails::iterator itr = m_mail.begin(); itr != m_mail.end(); ++itr)
    {
        if ((*itr)->messageID == id)
        {
            //do not delete item, because Player::removeMail() is called when returning mail to sender.
            m_mail.erase(itr);
            return;
        }
    }
}

void MasterPlayer::SendMailResult(uint32 mailId, MailResponseType mailAction, MailResponseResult mailError, uint32 equipError, uint32 item_guid, uint32 item_count)
{
    WorldPacket data(SMSG_SEND_MAIL_RESULT, (4 + 4 + 4 + (mailError == MAIL_ERR_EQUIP_ERROR ? 4 : (mailAction == MAIL_ITEM_TAKEN ? 4 + 4 : 0))));
    data << (uint32) mailId;
    data << (uint32) mailAction;
    data << (uint32) mailError;
    if (mailError == MAIL_ERR_EQUIP_ERROR)
        data << (uint32) equipError;
    else if (mailAction == MAIL_ITEM_TAKEN)
    {
        data << (uint32) item_guid;                         // item guid low?
        data << (uint32) item_count;                        // item count?
    }
    GetSession()->SendPacket(&data);
}

void MasterPlayer::SendNewMail()
{
    // deliver undelivered mail
    WorldPacket data(SMSG_RECEIVED_MAIL, 4);
    data << (uint32) 0;
    GetSession()->SendPacket(&data);
}

void MasterPlayer::UpdateNextMailTimeAndUnreads()
{
    // calculate next delivery time (min. from non-delivered mails
    // and recalculate unReadMail
    time_t cTime = time(NULL);
    m_nextMailDelivereTime = 0;
    unReadMails = 0;
    for (PlayerMails::iterator itr = m_mail.begin(); itr != m_mail.end(); ++itr)
    {
        if ((*itr)->deliver_time > cTime)
        {
            if (!m_nextMailDelivereTime || m_nextMailDelivereTime > (*itr)->deliver_time)
                m_nextMailDelivereTime = (*itr)->deliver_time;
        }
        else if (((*itr)->checked & MAIL_CHECK_MASK_READ) == 0 && cTime < (*itr)->expire_time)
            ++unReadMails;
    }
}

void MasterPlayer::AddNewMailDeliverTime(time_t deliver_time)
{
    if (deliver_time <= time(NULL))                         // ready now
    {
        ++unReadMails;
        SendNewMail();
    }
    else                                                    // not ready and no have ready mails
    {
        if (!m_nextMailDelivereTime || m_nextMailDelivereTime > deliver_time)
            m_nextMailDelivereTime =  deliver_time;
    }
}


// load mailed item which should receive current player
void MasterPlayer::LoadMailedItems(QueryResult *result)
{
    // data needs to be at first place for Item::LoadFromDB
    //         0                1        2         3       4       5       6           7               8           9       10     11        12            13
    // creatorGuid, giftCreatorGuid, count, duration, charges, flags, enchantments, randomPropertyId, durability, text, mail_id, item_guid, itemEntry, generated_loot
    if (!result)
        return;

    do
    {
        Field *fields = result->Fetch();
        uint32 mail_id       = fields[10].GetUInt32();
        uint32 item_guid_low = fields[11].GetUInt32();
        uint32 item_template = fields[12].GetUInt32();

        Mail* mail = GetMail(mail_id);
        if (!mail)
            continue;
        mail->AddItem(item_guid_low, item_template);

        ItemPrototype const *proto = ObjectMgr::GetItemPrototype(item_template);

        if (!proto)
        {
            sLog.outError("Player %u has unknown item_template (ProtoType) in mailed items(GUID: %u template: %u) in mail (%u), deleted.", GetGUIDLow(), item_guid_low, item_template, mail->messageID);
            CharacterDatabase.PExecute("DELETE FROM mail_items WHERE item_guid = '%u'", item_guid_low);
            CharacterDatabase.PExecute("DELETE FROM item_instance WHERE guid = '%u'", item_guid_low);
            continue;
        }

        Item *item = NewItemOrBag(proto);

        /* 
         * LoadFromDB is called from multiple places but with a different set of fields - this is workaround
         * so I don't need to fix the mess of queries and probably break something until a later date
         */
        item->SetGeneratedLoot(fields[13].GetBool());

        if (!item->LoadFromDB(item_guid_low, GetObjectGuid(), fields, item_template))
        {
            sLog.outError("Player::_LoadMailedItems - Item in mail (%u) doesn't exist !!!! - item guid: %u, deleted from mail", mail->messageID, item_guid_low);
            CharacterDatabase.PExecute("DELETE FROM mail_items WHERE item_guid = '%u'", item_guid_low);
            item->FSetState(ITEM_REMOVED);
            item->SaveToDB();                               // it also deletes item object !
            continue;
        }

        AddMItem(item);
    }
    while (result->NextRow());
}

void MasterPlayer::LoadMails(QueryResult *result)
{
    m_mail.clear();
    Player* player = GetSession()->GetPlayer();
    ASSERT(player);
    //        0  1           2      3        4       5          6           7            8     9   10      11         12             13
    //"SELECT id,messageType,sender,receiver,subject,itemTextId,expire_time,deliver_time,money,cod,checked,stationery,mailTemplateId,has_items FROM mail WHERE receiver = '%u' ORDER BY id DESC",GetGUIDLow()
    if (!result)
        return;

    do
    {
        Field *fields = result->Fetch();
        Mail *m = new Mail;
        m->messageID = fields[0].GetUInt32();
        m->messageType = fields[1].GetUInt8();
        m->sender = fields[2].GetUInt32();
        m->receiverGuid = ObjectGuid(HIGHGUID_PLAYER, fields[3].GetUInt32());
        m->subject = fields[4].GetCppString();
        m->itemTextId = fields[5].GetUInt32();
        m->expire_time = (time_t)fields[6].GetUInt64();
        m->deliver_time = (time_t)fields[7].GetUInt64();
        m->money = fields[8].GetUInt32();
        m->COD = fields[9].GetUInt32();
        m->checked = fields[10].GetUInt32();
        m->stationery = fields[11].GetUInt8();
        m->mailTemplateId = fields[12].GetInt16();
        m->has_items = fields[13].GetBool();                // true, if mail have items or mail have template and items generated (maybe none)

        if (m->mailTemplateId && !sMailTemplateStore.LookupEntry(m->mailTemplateId))
        {
            sLog.outError("Player::_LoadMail - Mail (%u) have nonexistent MailTemplateId (%u), remove at load", m->messageID, m->mailTemplateId);
            m->mailTemplateId = 0;
        }

        m->state = MAIL_STATE_UNCHANGED;

        m_mail.push_back(m);

        if (m->mailTemplateId && !m->has_items)
            m->prepareTemplateItems(player);

    }
    while (result->NextRow());
}

Mail* MasterPlayer::GetMail(uint32 id)
{
    for (PlayerMails::iterator itr = m_mail.begin(); itr != m_mail.end(); ++itr)
    {
        if ((*itr)->messageID == id)
            return (*itr);
    }
    return NULL;
}


// ######################## ACTION BUTTONS ###########################
void MasterPlayer::SendInitialActionButtons() const
{
    WorldPacket data(SMSG_ACTION_BUTTONS, (MAX_ACTION_BUTTONS * 4));
    for (int button = 0; button < MAX_ACTION_BUTTONS; ++button)
    {
        ActionButtonList::const_iterator itr = m_actionButtons.find(button);
        if (itr != m_actionButtons.end() && itr->second.uState != ACTIONBUTTON_DELETED)
            data << uint32(itr->second.packedData);
        else
            data << uint32(0);
    }

    GetSession()->SendPacket(&data);
}

ActionButton* MasterPlayer::addActionButton(uint8 button, uint32 action, uint8 type)
{
    if (!Player::IsActionButtonDataValid(button, action, type, NULL))
        return NULL;

    // it create new button (NEW state) if need or return existing
    ActionButton& ab = m_actionButtons[button];

    // set data and update to CHANGED if not NEW
    ab.SetActionAndType(action, ActionButtonType(type));
    return &ab;
}

void MasterPlayer::removeActionButton(uint8 button)
{
    ActionButtonList::iterator buttonItr = m_actionButtons.find(button);
    if (buttonItr == m_actionButtons.end())
        return;

    if (buttonItr->second.uState == ACTIONBUTTON_NEW)
        m_actionButtons.erase(buttonItr);                   // new and not saved
    else
        buttonItr->second.uState = ACTIONBUTTON_DELETED;    // saved, will deleted at next save
}

void MasterPlayer::LoadActions(QueryResult *result)
{
    m_actionButtons.clear();

    //QueryResult *result = CharacterDatabase.PQuery("SELECT button,action,type FROM character_action WHERE guid = '%u' ORDER BY button",GetGUIDLow());

    if (result)
    {
        do
        {
            Field *fields = result->Fetch();

            uint8 button = fields[0].GetUInt8();
            uint32 action = fields[1].GetUInt32();
            uint8 type = fields[2].GetUInt8();

            if (ActionButton* ab = addActionButton(button, action, type))
                ab->uState = ACTIONBUTTON_UNCHANGED;
            else
                m_actionButtons[button].uState = ACTIONBUTTON_DELETED;
        }
        while (result->NextRow());
    }
}

void MasterPlayer::SaveActions()
{
    static SqlStatementID insertAction;
    static SqlStatementID updateAction;
    static SqlStatementID deleteAction;

    for (ActionButtonList::iterator itr = m_actionButtons.begin(); itr != m_actionButtons.end();)
    {
        switch (itr->second.uState)
        {
            case ACTIONBUTTON_NEW:
            {
                SqlStatement stmt = CharacterDatabase.CreateStatement(insertAction, "INSERT INTO character_action (guid,button,action,type) VALUES (?, ?, ?, ?)");
                stmt.addUInt32(GetGUIDLow());
                stmt.addUInt32(uint32(itr->first));
                stmt.addUInt32(itr->second.GetAction());
                stmt.addUInt32(uint32(itr->second.GetType()));
                stmt.Execute();
                itr->second.uState = ACTIONBUTTON_UNCHANGED;
                ++itr;
            }
            break;
            case ACTIONBUTTON_CHANGED:
            {
                SqlStatement stmt = CharacterDatabase.CreateStatement(updateAction, "UPDATE character_action  SET action = ?, type = ? WHERE guid = ? AND button = ?");
                stmt.addUInt32(itr->second.GetAction());
                stmt.addUInt32(uint32(itr->second.GetType()));
                stmt.addUInt32(GetGUIDLow());
                stmt.addUInt32(uint32(itr->first));
                stmt.Execute();
                itr->second.uState = ACTIONBUTTON_UNCHANGED;
                ++itr;
            }
            break;
            case ACTIONBUTTON_DELETED:
            {
                SqlStatement stmt = CharacterDatabase.CreateStatement(deleteAction, "DELETE FROM character_action WHERE guid = ? AND button = ?");
                stmt.addUInt32(GetGUIDLow());
                stmt.addUInt32(uint32(itr->first));
                stmt.Execute();
                m_actionButtons.erase(itr++);
            }
            break;
            default:
                ++itr;
                break;
        }
    }
}


void MasterPlayer::LoadSocial(QueryResult* result)
{
    m_social = sSocialMgr.LoadFromDB(result, GetObjectGuid());
    m_social->SetMasterPlayer(this);
}

bool MasterPlayer::IsVisibleGloballyFor(MasterPlayer* viewer) const
{
    if (!viewer)
        return false;

    // Always can see self
    if (viewer == this)
        return true;

    // GMs are visible for higher gms (or players are visible for gms)
    uint8 security = viewer->GetSession()->GetSecurity();
    if (security > SEC_PLAYER)
        return GetGMInvisibilityRank() <= security;

    return true;
}
