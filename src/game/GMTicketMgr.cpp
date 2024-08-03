/*
 * Copyright (C) 2008-2015 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "Common.h"
#include "GMTicketMgr.h"
#include "Database/DatabaseEnv.h"
#include "Database/DatabaseImpl.h"
#include "Log.h"
#include "Language.h"
#include "Opcodes.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "Chat.h"
#include "World.h"
#include "Player.h"
#include "ObjectMgr.h"

inline float GetAge(uint64 t) { return float(time(nullptr) - t) / DAY; }

///////////////////////////////////////////////////////////////////////////////////////////////////
// GM ticket
GmTicket::GmTicket() : m_id(0), m_posX(0), m_posY(0), m_posZ(0), m_mapId(0), m_createTime(0), m_lastModifiedTime(0),
                       m_completed(false), m_escalatedStatus(TICKET_UNASSIGNED), m_viewed(false),
                       m_needResponse(false), m_needMoreHelp(false), m_securityNeeded(SEC_MODERATOR)
{
}

GmTicket::GmTicket(Player* player) : m_posX(0), m_posY(0), m_posZ(0), m_mapId(0), m_createTime(time(nullptr)), m_lastModifiedTime(time(nullptr)),
                       m_completed(false), m_escalatedStatus(TICKET_UNASSIGNED), m_viewed(false),
                       m_needResponse(false), m_needMoreHelp(false), m_securityNeeded(SEC_MODERATOR)
{
    m_id = sTicketMgr->GenerateTicketId();
    m_playerName = player->GetName();
    m_playerGuid = player->GetGUID();
}

GmTicket::~GmTicket() { }

bool GmTicket::LoadFromDB(Field* fields)
{
    // 0          1     2     3        4            5    6           7           8           9                   10         11           12       13        14         15         16      17           18           19
    // ticket_id, guid, name, message, create_time, map, position_x, position_y, position_z, last_modified_time, closed_by, assigned_to, comment, response, completed, escalated, viewed, have_ticket, ticket_type, security_needed
    uint8 index = 0;
    m_id                = fields[  index].GetUInt32();
    m_playerGuid        = ObjectGuid(HIGHGUID_PLAYER, fields[++index].GetUInt32());
    m_playerName        = fields[++index].GetString();
    m_message           = fields[++index].GetString();
    m_createTime        = fields[++index].GetUInt32();
    m_mapId             = fields[++index].GetUInt16();
    m_posX              = fields[++index].GetFloat();
    m_posY              = fields[++index].GetFloat();
    m_posZ              = fields[++index].GetFloat();
    m_lastModifiedTime  = fields[++index].GetUInt32();
    m_closedBy          = ObjectGuid(uint64(fields[++index].GetInt32()));
    m_assignedTo        = ObjectGuid(HIGHGUID_PLAYER, fields[++index].GetUInt32());
    m_comment           = fields[++index].GetString();
    m_response          = fields[++index].GetString();
    m_completed         = fields[++index].GetBool();
    m_escalatedStatus   = GMTicketEscalationStatus(fields[++index].GetUInt8());
    m_viewed            = fields[++index].GetBool();
    m_needMoreHelp      = fields[++index].GetBool();
    m_ticketType        = TicketType(fields[++index].GetUInt8());
    m_securityNeeded    = fields[++index].GetUInt8();
    return true;
}

#define TICKET_TABLE_FIELDS "`ticket_id`, `guid`, `name`, `message`, `create_time`, `map`, `position_x`, `position_y`, `position_z`, `last_modified_time`, `closed_by`, `assigned_to`, `comment`, `response`, `completed`, `escalated`, `viewed`, `have_ticket`, `ticket_type`, `security_needed`"

void GmTicket::SaveToDB() const
{
    static SqlStatementID gmTicketSave;

    SqlStatement stmt = CharacterDatabase.CreateStatement(gmTicketSave, "REPLACE INTO `gm_tickets` (" TICKET_TABLE_FIELDS ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    stmt.addUInt32(m_id);
    stmt.addUInt32(m_playerGuid.GetCounter());
    stmt.addString(m_playerName);
    stmt.addString(m_message);
    stmt.addUInt64(m_createTime);
    stmt.addUInt16(m_mapId);
    stmt.addFloat (m_posX);
    stmt.addFloat (m_posY);
    stmt.addFloat (m_posZ);
    stmt.addUInt64(m_lastModifiedTime);
    stmt.addInt32 (int32(m_closedBy.GetCounter()));
    stmt.addUInt32(m_assignedTo.GetCounter());
    stmt.addString(m_comment);
    stmt.addString(m_response);
    stmt.addUInt8 (m_completed);
    stmt.addUInt8 (uint8(m_escalatedStatus));
    stmt.addUInt8 (m_viewed);
    stmt.addUInt8 (m_needMoreHelp);
    stmt.addUInt8 (uint8(m_ticketType));
    stmt.addUInt8 (m_securityNeeded);
    stmt.Execute();
}

void GmTicket::DeleteFromDB()
{
    static SqlStatementID delTicket;
    SqlStatement stmt = CharacterDatabase.CreateStatement(delTicket, "DELETE FROM `gm_tickets` WHERE `ticket_id` = ?");
    stmt.addUInt32(m_id);
    stmt.Execute();
}

void GmTicket::WritePacket(WorldPacket& data) const
{
    data << uint32(GMTICKET_STATUS_HASTEXT);
    std::stringstream displayedMessage;
    displayedMessage << m_message;
    if (IsCompleted())
    {
        displayedMessage << "\n\n-----------------------------------------------------------------------\n";
        displayedMessage << "Customer ticket #" << GetId() << " completed.\n";
        if (!m_response.empty())
        {
            displayedMessage << "\n    GM answer:\n";
            displayedMessage << m_response;
        }
    }
    data << displayedMessage.str();
    data << uint8(m_ticketType);
    data << GetAge(m_lastModifiedTime);
    if (GmTicket* ticket = sTicketMgr->GetOldestOpenTicket())
        data << GetAge(ticket->GetLastModifiedTime());
    else
        data << float(0);

    // I am not sure how blizzlike this is, and we don't really have a way to find out
    data << GetAge(sTicketMgr->GetLastChange());         // Estimated wait time ?

    GMTicketEscalationStatus escStatus = std::min(m_escalatedStatus, TICKET_IN_ESCALATION_QUEUE);
    GMTicketOpenedByGMStatus openedStatus = m_viewed ? GMTICKET_OPENEDBYGM_STATUS_OPENED : GMTICKET_OPENEDBYGM_STATUS_NOT_OPENED;
    data << uint8(escStatus);                              // escalated data
    data << uint8(openedStatus); // whether or not it has been viewed
}

void GmTicket::SendResponse(WorldSession* session) const
{
    WorldPacket data(SMSG_GMTICKET_GETTICKET, (4 + 4 + 1 + 4 + 4 + 4 + 1 + 1));
    WritePacket(data);
    session->SendPacket(&data);
    ChatHandler(session).SendSysMessage(LANG_YOUR_TICKET_RESPONDED);
}

std::string GmTicket::FormatMessageString(ChatHandler& handler, bool detailed) const
{
    time_t curTime = time(nullptr);

    std::stringstream ss;
    ss << handler.PGetParseString(LANG_COMMAND_TICKETLISTGUID, m_id);
    ss << handler.PGetParseString(LANG_COMMAND_TICKETLISTNAME, handler.playerLink(m_playerName).c_str());
    ss << handler.PGetParseString(LANG_COMMAND_TICKETLISTAGECREATE, (secsToTimeString(curTime - m_createTime, true, false)).c_str());
    if (m_lastModifiedTime != m_createTime)
        ss << handler.PGetParseString(LANG_COMMAND_TICKETLISTAGE, (secsToTimeString(curTime - m_lastModifiedTime, true, false)).c_str());

    std::string name;
    if (sObjectMgr.GetPlayerNameByGUID(m_assignedTo, name))
        ss << handler.PGetParseString(LANG_COMMAND_TICKETLISTASSIGNEDTO, handler.playerLink(name).c_str());

    if (detailed)
    {
        ss << handler.PGetParseString(LANG_COMMAND_TICKETLISTMESSAGE, m_message.c_str());
        if (!m_comment.empty())
            ss << handler.PGetParseString(LANG_COMMAND_TICKETLISTCOMMENT, m_comment.c_str());
        if (!m_response.empty())
            ss << handler.PGetParseString(LANG_COMMAND_TICKETLISTRESPONSE, m_response.c_str());
    }
    return ss.str();
}

std::string GmTicket::FormatMessageString(ChatHandler& handler, char const* szClosedName, char const* szAssignedToName, char const* szUnassignedName, char const* szDeletedName, char const* szCompletedName) const
{
    std::stringstream ss;
    ss << handler.PGetParseString(LANG_COMMAND_TICKETLISTGUID, m_id);
    ss << handler.PGetParseString(LANG_COMMAND_TICKETLISTNAME, m_playerName.c_str());
    if (szClosedName)
        ss << handler.PGetParseString(LANG_COMMAND_TICKETCLOSED, szClosedName);
    if (szAssignedToName)
        ss << handler.PGetParseString(LANG_COMMAND_TICKETLISTASSIGNEDTO, szAssignedToName);
    if (szUnassignedName)
        ss << handler.PGetParseString(LANG_COMMAND_TICKETLISTUNASSIGNED, szUnassignedName);
    if (szDeletedName)
        ss << handler.PGetParseString(LANG_COMMAND_TICKETDELETED, szDeletedName);
    if (szCompletedName)
        ss << handler.PGetParseString(LANG_COMMAND_TICKETCOMPLETED, szCompletedName);
    return ss.str();
}

char const* GmTicket::GetTicketCategoryName(TicketType category) const
{
    switch (category)
    {
        case GMTICKET_STUCK:
            return "Stuck";
        case GMTICKET_BEHAVIOR_HARASSMENT:
            return "Behavior";
        case GMTICKET_GUILD:
            return "Guild";
        case GMTICKET_ITEM:
            return "Item";
        case GMTICKET_ENVIRONMENTAL:
            return "Environment";
        case GMTICKET_NONQUEST_CREEP:
            return "Creature";
        case GMTICKET_QUEST_QUESTNPC:
            return "Quest";
        case GMTICKET_TECHNICAL:
            return "Technical";
        case GMTICKET_ACCOUNT_BILLING:
            return "Billing";
        case GMTICKET_CHARACTER:
            return "Character";
    }

    return "Unknown";
}

Player* GmTicket::GetPlayer() const
{
    return ObjectAccessor::FindPlayer(m_playerGuid);
}

Player* GmTicket::GetAssignedPlayer() const
{
    return ObjectAccessor::FindPlayer(m_assignedTo);
}

std::string GmTicket::GetAssignedToName() const
{
    std::string name;
    // save queries if ticket is not assigned
    if (m_assignedTo)
        sObjectMgr.GetPlayerNameByGUID(m_assignedTo, name);

    return name;
}

void GmTicket::SetUnassigned()
{
    m_assignedTo.Clear();
    switch (m_escalatedStatus)
    {
        case TICKET_ASSIGNED: m_escalatedStatus = TICKET_UNASSIGNED; break;
        case TICKET_ESCALATED_ASSIGNED: m_escalatedStatus = TICKET_IN_ESCALATION_QUEUE; break;
        case TICKET_UNASSIGNED:
        case TICKET_IN_ESCALATION_QUEUE:
        default:
            break;
    }
}

void GmTicket::SetPosition(uint32 mapId, float x, float y, float z)
{
    m_mapId = mapId;
    m_posX = x;
    m_posY = y;
    m_posZ = z;
}

void GmTicket::SetGmAction(uint32 needResponse, bool needMoreHelp)
{
    m_needResponse = (needResponse == 17);   // Requires GM response. 17 = true, 1 = false (17 is default)
    m_needMoreHelp = needMoreHelp;           // Requests further GM interaction on a ticket to which a GM has already responded. Basically means "has a new ticket"
}

void GmTicket::TeleportTo(Player* player) const
{
    player->TeleportTo(m_mapId, m_posX, m_posY, m_posZ, 0.0f, 0);
}

void GmTicket::SetChatLog(std::list<uint32> time, std::string const& log)
{
    std::stringstream ss(log);
    std::stringstream newss;
    std::string line;
    while (std::getline(ss, line) && !time.empty())
    {
        newss << secsToTimeString(time.front()) << ": " << line << "\n";
        time.pop_front();
    }

    m_chatLog = newss.str();
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// Ticket manager
TicketMgr::TicketMgr() : _status(true), _lastTicketId(0), _lastSurveyId(0), _openTicketCount(0),
    _lastChange(time(nullptr)) { }

TicketMgr::~TicketMgr()
{
    for (const auto& itr : _ticketList)
        delete itr.second;
}

void TicketMgr::Initialize()
{
    SetStatus(sWorld.getConfig(CONFIG_BOOL_GMTICKETS_ENABLE));
}

void TicketMgr::ResetTickets()
{
    for (GmTicketList::const_iterator itr = _ticketList.begin(); itr != _ticketList.end();)
    {
        if (itr->second->IsClosed())
        {
            uint32 ticketId = itr->second->GetId();
            ++itr;
            sTicketMgr->RemoveTicket(ticketId);
        }
        else
            ++itr;
    }

    _lastTicketId = 0;

    CharacterDatabase.Execute("TRUNCATE TABLE `gm_tickets`");
}

void TicketMgr::LoadTickets()
{
    uint32 oldMSTime = WorldTimer::getMSTime();

    for (const auto& itr : _ticketList)
        delete itr.second;
    _ticketList.clear();

    _lastTicketId = 0;
    _openTicketCount = 0;

    std::unique_ptr<QueryResult> result = CharacterDatabase.Query("SELECT " TICKET_TABLE_FIELDS " FROM `gm_tickets`");
    if (!result)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ">> Loaded 0 GM tickets. DB table `gm_ticket` is empty!");
        return;
    }

    uint32 count = 0;
    do
    {
        Field* fields = result->Fetch();
        GmTicket* ticket = new GmTicket();
        if (!ticket->LoadFromDB(fields))
        {
            delete ticket;
            continue;
        }
        if (!ticket->IsClosed())
            ++_openTicketCount;

        // Update max ticket id if necessary
        uint32 id = ticket->GetId();
        if (_lastTicketId < id)
            _lastTicketId = id;

        _ticketList[id] = ticket;
        ++count;
    } while (result->NextRow());

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ">> Loaded %u GM tickets in %u ms", count, WorldTimer::getMSTimeDiffToNow(oldMSTime));
}

void TicketMgr::LoadSurveys()
{
    // we don't actually load anything into memory here as there's no reason to
    _lastSurveyId = 0;

    uint32 oldMSTime = WorldTimer::getMSTime();
    if (std::unique_ptr<QueryResult> result = CharacterDatabase.Query("SELECT MAX(`survey_id`) FROM `gm_surveys`"))
    {
        _lastSurveyId = (*result)[0].GetUInt32();
    }

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ">> Loaded GM Survey count from database in %u ms", WorldTimer::getMSTimeDiffToNow(oldMSTime));
}

void TicketMgr::AddTicket(GmTicket* ticket)
{
    _ticketList[ticket->GetId()] = ticket;
    if (!ticket->IsClosed())
        ++_openTicketCount;
    ticket->SaveToDB();
}

void TicketMgr::CloseTicket(uint32 ticketId, ObjectGuid source)
{
    if (GmTicket* ticket = GetTicket(ticketId))
    {
        ticket->SetClosedBy(source);
        if (source)
            --_openTicketCount;
        ticket->SaveToDB();
    }
}

void TicketMgr::RemoveTicket(uint32 ticketId)
{
    if (GmTicket* ticket = GetTicket(ticketId))
    {
        ticket->DeleteFromDB();
        _ticketList.erase(ticketId);
        delete ticket;
    }
}

void TicketMgr::ShowList(ChatHandler& handler, bool onlineOnly, uint8 category) const
{
    handler.SendSysMessage(onlineOnly ? LANG_COMMAND_TICKETSHOWONLINELIST : LANG_COMMAND_TICKETSHOWLIST);
    for (const auto& itr : _ticketList)
        if (!itr.second->IsClosed() && !itr.second->IsCompleted())
            if ((!onlineOnly || itr.second->GetPlayer()) && (!category || (itr.second->GetTicketType() == TicketType(category))))
                handler.SendSysMessage(itr.second->FormatMessageString(handler).c_str());
}

void TicketMgr::ShowClosedList(ChatHandler& handler) const
{
    handler.SendSysMessage(LANG_COMMAND_TICKETSHOWCLOSEDLIST);
    for (const auto& itr : _ticketList)
        if (itr.second->IsClosed())
            handler.SendSysMessage(itr.second->FormatMessageString(handler).c_str());
}

void TicketMgr::ShowEscalatedList(ChatHandler& handler) const
{
    handler.SendSysMessage(LANG_COMMAND_TICKETSHOWESCALATEDLIST);
    for (const auto& itr : _ticketList)
        if (!itr.second->IsClosed() && itr.second->GetEscalatedStatus() == TICKET_IN_ESCALATION_QUEUE)
            handler.PSendSysMessage(LANG_COMMAND_TICKETESCALATED_TICKET, itr.second->FormatMessageString(handler).c_str(), itr.second->GetNeededSecurityLevel());
}

void TicketMgr::SendTicket(WorldSession* session, GmTicket* ticket) const
{
    WorldPacket data(SMSG_GMTICKET_GETTICKET, (ticket ? (4 + 4 + 1 + 4 + 4 + 4 + 1 + 1) : 4));

    if (ticket)
        ticket->WritePacket(data);
    else
        data << uint32(GMTICKET_STATUS_DEFAULT);

    session->SendPacket(&data);
}

void TicketMgr::ReloadTicketCallback(std::unique_ptr<QueryResult> result)
{
    if (!result)
        return;
    GmTicket* newTicket = new GmTicket();
    newTicket->LoadFromDB(result->Fetch());
    GmTicket* currentTicket = GetTicket(newTicket->GetId());
    if (!currentTicket)
    {
        sWorld.SendGMTicketText(LANG_COMMAND_TICKETNEW, newTicket->GetPlayerName().c_str(), newTicket->GetId());
        AddTicket(newTicket);
    }
    else // Existing ticket updated.
    {
        // Send update status to GMs
        std::string assignedTo;
        std::string closedBy;
        std::string completedBy;
        if (newTicket->IsClosed() != currentTicket->IsClosed())
            closedBy = newTicket->GetAssignedToName();
        else if (newTicket->IsCompleted() != currentTicket->IsCompleted())
            completedBy = newTicket->GetAssignedToName();
        else if (newTicket->GetAssignedToGUID() != currentTicket->GetAssignedToGUID())
            assignedTo = newTicket->GetAssignedToName();

        if (!assignedTo.empty() || !closedBy.empty() || !completedBy.empty())
        {
            NullChatHandler handler;
            std::string msg = newTicket->FormatMessageString(handler, closedBy.empty() ? nullptr : closedBy.c_str(), assignedTo.empty() ? nullptr : assignedTo.c_str(), nullptr, nullptr, completedBy.empty() ? nullptr : completedBy.c_str());
            sWorld.SendGMTicketText(msg.c_str());
        }
    }
}

void TicketMgr::ReloadTicket(uint32 ticketId)
{
    if (_reloadTicketsSet.find(ticketId) != _reloadTicketsSet.end())
        return;
    _reloadTicketsSet.insert(ticketId);
    CharacterDatabase.AsyncPQueryUnsafe(this, &TicketMgr::ReloadTicketCallback, "SELECT " TICKET_TABLE_FIELDS " FROM `gm_tickets` WHERE `ticket_id` = '%u'", ticketId);
}
