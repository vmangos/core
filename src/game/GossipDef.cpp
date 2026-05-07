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

#include "GossipDef.h"
#include "QuestDef.h"
#include "ObjectMgr.h"
#include "Opcodes.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "Formulas.h"

GossipMenu::GossipMenu(WorldSession* session) : m_session(session)
{
    m_gItems.reserve(16);                                   // can be set for max from most often sizes to speedup push_back and less memory use
    m_gMenuId = 0;
    m_discoveredNode = false;
}

GossipMenu::~GossipMenu()
{
    ClearMenu();
}

void GossipMenu::AddMenuItem(uint8 Icon, std::string const& Message, uint32 dtSender, uint32 dtAction, std::string const& BoxMessage, bool Coded)
{
    MANGOS_ASSERT(m_gItems.size() <= GOSSIP_MAX_MENU_ITEMS);

    GossipMenuItem gItem;

    gItem.m_gIcon       = Icon;
    gItem.m_gMessage    = Message;
    gItem.m_gCoded      = Coded;
    gItem.m_gSender     = dtSender;
    gItem.m_gOptionId   = dtAction;
    gItem.m_gBoxMessage = BoxMessage;

    m_gItems.push_back(gItem);
}

void GossipMenu::AddGossipMenuItemData(int32 action_menu, uint32 action_poi, uint32 action_script)
{
    GossipMenuItemData pItemData;

    pItemData.m_gAction_menu    = action_menu;
    pItemData.m_gAction_poi     = action_poi;
    pItemData.m_gAction_script  = action_script;

    m_gItemsData.push_back(pItemData);
}

void GossipMenu::AddMenuItem(uint8 Icon, std::string const& Message, bool Coded)
{
    AddMenuItem(Icon, Message, 0, 0, "", Coded);
}

void GossipMenu::AddMenuItem(uint8 Icon, char const* Message, bool Coded)
{
    AddMenuItem(Icon, std::string(Message ? Message : ""), Coded);
}

void GossipMenu::AddMenuItem(uint8 Icon, char const* Message, uint32 dtSender, uint32 dtAction, char const* BoxMessage, bool Coded)
{
    AddMenuItem(Icon, std::string(Message ? Message : ""), dtSender, dtAction, std::string(BoxMessage ? BoxMessage : ""), Coded);
}

void GossipMenu::AddMenuItem(uint8 Icon, int32 itemText, uint32 dtSender, uint32 dtAction, int32 boxText, bool Coded)
{
    uint32 loc_idx = m_session->GetSessionDbLocaleIndex();

    char const* item_text = itemText ? (itemText > 0 ? sObjectMgr.GetBroadcastText(itemText, loc_idx, GetMenuSession()->GetPlayer()->GetGender()) : sObjectMgr.GetMangosString(itemText, loc_idx)) : "";
    char const* box_text = boxText ? (boxText > 0 ? sObjectMgr.GetBroadcastText(boxText, loc_idx, GetMenuSession()->GetPlayer()->GetGender()) : sObjectMgr.GetMangosString(boxText, loc_idx)) : "";

    AddMenuItem(Icon, std::string(item_text), dtSender, dtAction, std::string(box_text), Coded);
}

uint32 GossipMenu::MenuItemSender(unsigned int ItemId)
{
    if (ItemId >= m_gItems.size())
        return 0;

    return m_gItems[ ItemId ].m_gSender;
}

uint32 GossipMenu::MenuItemAction(unsigned int ItemId)
{
    if (ItemId >= m_gItems.size())
        return 0;

    return m_gItems[ ItemId ].m_gOptionId;
}

bool GossipMenu::MenuItemCoded(unsigned int ItemId) const
{
    if (ItemId >= m_gItems.size())
        return false;

    return m_gItems[ ItemId ].m_gCoded;
}

void GossipMenu::ClearMenu()
{
    m_gItems.clear();
    m_gItemsData.clear();
    m_gMenuId = 0;
    m_discoveredNode = false;
}

PlayerMenu::PlayerMenu(WorldSession* session) : mGossipMenu(session)
{
}

PlayerMenu::~PlayerMenu()
{
    ClearMenus();
}

void PlayerMenu::ClearMenus()
{
    mGossipMenu.ClearMenu();
    mQuestMenu.ClearMenu();
}

uint32 PlayerMenu::GossipOptionSender(unsigned int Selection)
{
    return mGossipMenu.MenuItemSender(Selection);
}

uint32 PlayerMenu::GossipOptionAction(unsigned int Selection)
{
    return mGossipMenu.MenuItemAction(Selection);
}

bool PlayerMenu::GossipOptionCoded(unsigned int Selection) const
{
    return mGossipMenu.MenuItemCoded(Selection);
}

void PlayerMenu::SendGossipMenu(uint32 textId, ObjectGuid objectGuid)
{
    constexpr size_t mainPartSize =
        sizeof(ObjectGuid) + // objectGuid
        sizeof(uint32) + // textId
        sizeof(uint32) + // gossipOptionsCount
        sizeof(uint32); // questOptionsCount

    constexpr size_t gossipPartSize =
        sizeof(uint32) + // index
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_5_1
        sizeof(uint8) + // icon
        sizeof(uint8) + // coded
#else
        sizeof(uint32) + // icon
#endif
        128; // message (average)

    constexpr size_t questPartSize =
        sizeof(uint32) + // questId
        sizeof(uint32) + // icon
        sizeof(uint32) + // level
        64; // title (average)

    WorldPacket data(SMSG_GOSSIP_MESSAGE, (mainPartSize + gossipPartSize * mGossipMenu.MenuItemCount() + questPartSize * mQuestMenu.MenuItemCount()));
    data << ObjectGuid(objectGuid);
    data << uint32(textId);
    data << uint32(mGossipMenu.MenuItemCount());            // [ZERO] max count 15

    for (uint32 iI = 0; iI < mGossipMenu.MenuItemCount(); ++iI)
    {
        GossipMenuItem const& gItem = mGossipMenu.GetItem(iI);
        data << uint32(iI);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_5_1
        data << uint8(gItem.m_gIcon);
        data << uint8(gItem.m_gCoded);                      // makes pop up box password
#else
        data << uint32(gItem.m_gIcon);
#endif
        data << gItem.m_gMessage;                           // text for gossip item, max 0x800
    }

    data << uint32(mQuestMenu.MenuItemCount());             // max count 0x20

    for (uint32 iI = 0; iI < mQuestMenu.MenuItemCount(); ++iI)
    {
        QuestMenuItem const& qItem = mQuestMenu.GetItem(iI);
        uint32 questID = qItem.m_qId;
        Quest const* pQuest = sObjectMgr.GetQuestTemplate(questID);

        data << uint32(questID);
        data << uint32(qItem.m_qIcon);
        data << uint32(pQuest->GetQuestLevel());
        char const* title = pQuest->GetTitle().c_str();
        size_t titleLen = pQuest->GetTitle().length();

        int loc_idx = GetMenuSession()->GetSessionDbLocaleIndex();
        if (loc_idx >= 0)
        {
            if (QuestLocale const* ql = sObjectMgr.GetQuestLocale(questID))
            {
                if (ql->Title.size() > (size_t)loc_idx && !ql->Title[loc_idx].empty())
                {
                    title = ql->Title[loc_idx].c_str();
                    titleLen = ql->Title[loc_idx].length();
                }
            }
        }
        data.append(title, titleLen + 1); // max 0x200
    }

    GetMenuSession()->SendPacket(&data);
    //sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "WORLD: Sent SMSG_GOSSIP_MESSAGE NPCGuid=%u",GUID_LOPART(npcGUID));
}

void PlayerMenu::CloseGossip()
{
    GetMenuSession()->SendPacket(std::make_unique<WorldPackets::Npc::GossipComplete>());

    //sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "WORLD: Sent SMSG_GOSSIP_COMPLETE");
}

// Outdated
void PlayerMenu::SendPointOfInterest(float X, float Y, uint32 Icon, uint32 Flags, uint32 Data, char const* locName)
{
    WorldPacket data(SMSG_GOSSIP_POI, (4 + 4 + 4 + 4 + 4 + 40)); // guess size
    data << uint32(Flags);
    data << float(X);
    data << float(Y);
    data << uint32(Icon);
    data << uint32(Data);
    data << locName;

    GetMenuSession()->SendPacket(&data);
    //sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "WORLD: Sent SMSG_GOSSIP_POI");
}

void PlayerMenu::SendPointOfInterest(uint32 poi_id)
{
    PointOfInterest const* poi = sObjectMgr.GetPointOfInterest(poi_id);
    if (!poi)
    {
        sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Requested send nonexistent POI (Id: %u), ignore.", poi_id);
        return;
    }

    char const* iconName = poi->icon_name.c_str();
    size_t iconNameLen = poi->icon_name.length();

    int loc_idx = GetMenuSession()->GetSessionDbLocaleIndex();
    if (loc_idx >= 0)
    {
        if (PointOfInterestLocale const* pl = sObjectMgr.GetPointOfInterestLocale(poi_id))
        {
            if (pl->IconName.size() > size_t(loc_idx) && !pl->IconName[loc_idx].empty())
            {
                iconName = pl->IconName[loc_idx].c_str();
                iconNameLen = pl->IconName[loc_idx].length();
            }
        }
    }

    constexpr size_t fixedSize =
        sizeof(uint32) + // flags
        sizeof(float) + // x
        sizeof(float) + // y
        sizeof(uint32) + // icon
        sizeof(uint32) + // data
        sizeof(char); // icon name

    WorldPacket data(SMSG_GOSSIP_POI, fixedSize + iconNameLen);
    data << uint32(poi->flags);
    data << float(poi->x);
    data << float(poi->y);
    data << uint32(poi->icon);
    data << uint32(poi->data);
    data.append(iconName, iconNameLen + 1);

    GetMenuSession()->SendPacket(&data);
    //sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "WORLD: Sent SMSG_GOSSIP_POI");
}

void PlayerMenu::SendTalking(uint32 textID)
{
    NpcText const* pGossip = sObjectMgr.GetNpcText(textID);

    WorldPacket data(SMSG_NPC_TEXT_UPDATE, 512);            // guess size
    data << textID;                                         // can be < 0

    if (!pGossip)
    {
        for (uint32 i = 0; i < 8; ++i)
        {
            data << float(0);
            data << "Greetings $N";
            data << "Greetings $N";
            data << uint32(0);
            data << uint32(0);
            data << uint32(0);
            data << uint32(0);
            data << uint32(0);
            data << uint32(0);
            data << uint32(0);
        }
    }
    else
    {
        int loc_idx = GetMenuSession()->GetSessionDbLocaleIndex();
        for (int i = 0; i < 8; ++i)
        {
            BroadcastText const* bct = sObjectMgr.GetBroadcastTextLocale(pGossip->Options[i].BroadcastTextID);
            if (bct)
            {
                std::string const& maleText = bct->GetText(loc_idx, GENDER_MALE, true);
                std::string const& femaleText = bct->GetText(loc_idx, GENDER_FEMALE, true);

                data << pGossip->Options[i].Probability;

                if (maleText.empty())
                    data << femaleText;
                else
                    data << maleText;

                if (femaleText.empty())
                    data << maleText;
                else
                    data << femaleText;

                data << bct->languageId;

                data << bct->emoteDelay1;
                data << bct->emoteId1;
                data << bct->emoteDelay2;
                data << bct->emoteId2;
                data << bct->emoteDelay3;
                data << bct->emoteId3;
            }
            else
            {
                data << float(0);
                data << "Greetings $N";
                data << "Greetings $N";
                data << uint32(0);
                data << uint32(0);
                data << uint32(0);
                data << uint32(0);
                data << uint32(0);
                data << uint32(0);
                data << uint32(0);
            }
        }
    }
    GetMenuSession()->SendPacket(&data);
}

void PlayerMenu::SendTalking(char const* title, char const* text)
{
    size_t const titleLen = strlen(title) + 1;
    size_t const textLen = strlen(text) + 1;

    WorldPacket data(SMSG_NPC_TEXT_UPDATE, sizeof(uint32) + 8 * (8 * sizeof(uint32) + titleLen + textLen));
    data << uint32(0);
    for (uint32 i = 0; i < 8; ++i)
    {
        data << float(0);
        data.append(title, titleLen);
        data.append(text, textLen);
        data << uint32(0);
        data << uint32(0);
        data << uint32(0);
        data << uint32(0);
        data << uint32(0);
        data << uint32(0);
        data << uint32(0);
    }

    GetMenuSession()->SendPacket(&data);
}

/*********************************************************/
/***                    QUEST SYSTEM                   ***/
/*********************************************************/

QuestMenu::QuestMenu()
{
    m_qItems.reserve(16);                                   // can be set for max from most often sizes to speedup push_back and less memory use
}

QuestMenu::~QuestMenu()
{
    ClearMenu();
}

void QuestMenu::AddMenuItem(uint32 QuestId, uint8 Icon)
{
    Quest const* qinfo = sObjectMgr.GetQuestTemplate(QuestId);
    if (!qinfo)
        return;

    MANGOS_ASSERT(m_qItems.size() <= GOSSIP_MAX_MENU_ITEMS);

    QuestMenuItem qItem;

    qItem.m_qId        = QuestId;
    qItem.m_qIcon      = Icon;

    m_qItems.push_back(qItem);
}

bool QuestMenu::HasItem(uint32 questid) const
{
    for (const auto& qItem : m_qItems)
        if (qItem.m_qId == questid)
            return true;
    return false;
}

void QuestMenu::ClearMenu()
{
    m_qItems.clear();
}

void PlayerMenu::SendQuestGiverQuestList(QuestNpcEmoteInfo fallbackEmote, std::string const& Title, ObjectGuid guid) const
{
    auto packet = std::make_unique<WorldPackets::Quest::QuestGiverQuestList>();
    packet->sessionDbLocaleIndex = GetMenuSession()->GetSessionDbLocaleIndex();
    packet->npcGuid = guid;
    packet->fallbackTitle = Title;
    packet->fallbackEmoteDelay = fallbackEmote.delay;
    packet->fallbackEmote = fallbackEmote.emote;

    for (uint32 count = 0; count < mQuestMenu.MenuItemCount(); ++count)
    {
        QuestMenuItem const& qmi = mQuestMenu.GetItem(count);
        if (Quest const* pQuest = sObjectMgr.GetQuestTemplate(qmi.m_qId))
            packet->quests.push_back(WorldPackets::Quest::QuestListEntry(pQuest, qmi.m_qIcon));
    }
    GetMenuSession()->SendPacket(std::move(packet));
}

void PlayerMenu::SendQuestGiverStatus(uint8 questStatus, ObjectGuid npcGUID) const
{
    auto packet = std::make_unique<WorldPackets::Quest::QuestGiverStatus>();
    packet->npcGuid = npcGUID;
    packet->status = questStatus;
    GetMenuSession()->SendPacket(std::move(packet));
}

void PlayerMenu::SendQuestGiverQuestDetails(Quest const* pQuest, ObjectGuid npcGUID, bool ActivateAccept) const
{
    auto packet = std::make_unique<WorldPackets::Quest::QuestGiverQuestDetails>();
    packet->sessionDbLocaleIndex = GetMenuSession()->GetSessionDbLocaleIndex();
    packet->npcGuid = npcGUID;
    packet->quest = pQuest;
    packet->autoFinish = ActivateAccept; // I have no idea here this is used
    GetMenuSession()->SendPacket(std::move(packet));
}

void PlayerMenu::SendQuestGiverOfferReward(Quest const* pQuest, ObjectGuid npcGuid, bool EnableNext) const
{
    auto packet = std::make_unique<WorldPackets::Quest::QuestGiverOfferReward>();
    packet->sessionDbLocaleIndex = GetMenuSession()->GetSessionDbLocaleIndex();
    packet->npcGuid = npcGuid;
    packet->quest = pQuest;
    packet->autoFinish = EnableNext; // I have no idea here this is used
    GetMenuSession()->SendPacket(std::move(packet));
}

void PlayerMenu::SendQuestGiverRequestItems(Quest const* pQuest, ObjectGuid npcGuid, bool isComplete, bool closeOnCancel) const
{
    // We can always call to RequestItems, but this packet only goes out if there are actually
    // items. Otherwise, we'll skip straight to the OfferReward
    if (pQuest->GetRequestItemsText().empty() || ((pQuest->GetReqItemsCount() == 0) && isComplete))
    {
        // Quests that don't require items use the RequestItemsText field to store the text
        // that is shown when you talk to the quest giver while the quest is incomplete.
        // Therefore the text should not be shown for them when the quest is complete.
        // For quests that do require items, it is self explanatory.
        SendQuestGiverOfferReward(pQuest, npcGuid, true);
        return;
    }

    auto packet = std::make_unique<WorldPackets::Quest::QuestGiverRequestItems>();
    packet->sessionDbLocaleIndex = GetMenuSession()->GetSessionDbLocaleIndex();
    packet->npcGuid = npcGuid;
    packet->quest = pQuest;
    packet->isComplete = isComplete;
    packet->closeOnCancel = closeOnCancel;
    GetMenuSession()->SendPacket(std::move(packet));
}
