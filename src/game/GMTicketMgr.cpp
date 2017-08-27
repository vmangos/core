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
#include "Log.h"
#include "Language.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "Chat.h"
#include "World.h"
#include "Player.h"
#include "Opcodes.h"
#include "Database/DatabaseImpl.h"

inline float GetAge(uint64 t) { return float(time(NULL) - t) / DAY; }

///////////////////////////////////////////////////////////////////////////////////////////////////
// GM ticket
GmTicket::GmTicket() : _id(0), _posX(0), _posY(0), _posZ(0), _mapId(0), _createTime(0), _lastModifiedTime(0),
                       _completed(false), _escalatedStatus(TICKET_UNASSIGNED), _viewed(false),
                       _needResponse(false), _needMoreHelp(false), _securityNeeded(SEC_MODERATOR)
{
}

GmTicket::GmTicket(Player* player) : _posX(0), _posY(0), _posZ(0), _mapId(0), _createTime(time(NULL)), _lastModifiedTime(time(NULL)),
                       _completed(false), _escalatedStatus(TICKET_UNASSIGNED), _viewed(false),
                       _needResponse(false), _needMoreHelp(false), _securityNeeded(SEC_MODERATOR)
{
    _id = sTicketMgr->GenerateTicketId();
    _playerName = player->GetName();
    _playerGuid = player->GetGUID();
}

GmTicket::~GmTicket() { }

bool GmTicket::LoadFromDB(Field* fields)
{
    //     0       1     2      3          4        5      6     7     8           9            10         11         12       13        14         15        16        17      18          19
    // ticketId, guid, name, message, createTime, mapId, posX, posY, posZ, lastModifiedTime, closedBy, assignedTo, comment, response, completed, escalated, viewed, haveTicket, ticketType, securityNeeded
    uint8 index = 0;
    _id                 = fields[  index].GetUInt32();
    _playerGuid         = ObjectGuid(HIGHGUID_PLAYER, fields[++index].GetUInt32());
    _playerName         = fields[++index].GetString();
    _message            = fields[++index].GetString();
    _createTime         = fields[++index].GetUInt32();
    _mapId              = fields[++index].GetUInt16();
    _posX               = fields[++index].GetFloat();
    _posY               = fields[++index].GetFloat();
    _posZ               = fields[++index].GetFloat();
    _lastModifiedTime   = fields[++index].GetUInt32();
    _closedBy           = ObjectGuid(uint64(fields[++index].GetInt32()));
    _assignedTo         = ObjectGuid(HIGHGUID_PLAYER, fields[++index].GetUInt32());
    _comment            = fields[++index].GetString();
    _response           = fields[++index].GetString();
    _completed          = fields[++index].GetBool();
    _escalatedStatus    = GMTicketEscalationStatus(fields[++index].GetUInt8());
    _viewed             = fields[++index].GetBool();
    _needMoreHelp       = fields[++index].GetBool();
    _ticketType         = TicketType(fields[++index].GetUInt8());
    _securityNeeded     = fields[++index].GetUInt8();
    return true;
}

void GmTicket::SaveToDB() const
{
    static SqlStatementID gmTicketSave;

    SqlStatement stmt = CharacterDatabase.CreateStatement(gmTicketSave, "REPLACE INTO gm_tickets (ticketId, guid, name, message, createTime, mapId, posX, posY, posZ, lastModifiedTime, closedBy, assignedTo, comment, response, completed, escalated, viewed, haveTicket, ticketType, securityNeeded) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    stmt.addUInt32(_id);
    stmt.addUInt32(_playerGuid.GetCounter());
    stmt.addString(_playerName);
    stmt.addString(_message);
    stmt.addUInt32(uint32(_createTime));
    stmt.addUInt16(_mapId);
    stmt.addFloat (_posX);
    stmt.addFloat (_posY);
    stmt.addFloat (_posZ);
    stmt.addUInt32(uint32(_lastModifiedTime));
    stmt.addInt32 (int32(_closedBy.GetCounter()));
    stmt.addUInt32(_assignedTo.GetCounter());
    stmt.addString(_comment);
    stmt.addString(_response);
    stmt.addUInt8 (_completed);
    stmt.addUInt8 (uint8(_escalatedStatus));
    stmt.addUInt8 (_viewed);
    stmt.addUInt8 (_needMoreHelp);
    stmt.addUInt8 (uint8(_ticketType));
    stmt.addUInt8 (_securityNeeded);
    stmt.Execute();
}

void GmTicket::DeleteFromDB()
{
    static SqlStatementID delTicket;
    SqlStatement stmt = CharacterDatabase.CreateStatement(delTicket, "DELETE FROM gm_tickets WHERE ticketId = ?");
    stmt.addUInt32(_id);
    stmt.Execute();
}

void GmTicket::WritePacket(WorldPacket& data) const
{
    data << uint32(GMTICKET_STATUS_HASTEXT);
    std::stringstream displayedMessage;
    displayedMessage << _message;
    if (IsCompleted())
    {
        displayedMessage << "\n\n-----------------------------------------------------------------------\n";
        displayedMessage << "Elysium customer ticket #" << GetId() << " completed.\n";
        if (!_response.empty())
        {
            displayedMessage << "\n    GM answer:\n";
            displayedMessage << _response;
        }
    }
    data << displayedMessage.str();
    data << uint8(_ticketType);
    data << GetAge(_lastModifiedTime);
    if (GmTicket* ticket = sTicketMgr->GetOldestOpenTicket())
        data << GetAge(ticket->GetLastModifiedTime());
    else
        data << float(0);

    // I am not sure how blizzlike this is, and we don't really have a way to find out
    data << GetAge(sTicketMgr->GetLastChange());         // Estimated wait time ?

    GMTicketEscalationStatus escStatus = std::min(_escalatedStatus, TICKET_IN_ESCALATION_QUEUE);
    GMTicketOpenedByGMStatus openedStatus = _viewed ? GMTICKET_OPENEDBYGM_STATUS_OPENED : GMTICKET_OPENEDBYGM_STATUS_NOT_OPENED;
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
    time_t curTime = time(NULL);

    std::stringstream ss;
    ss << handler.PGetParseString(LANG_COMMAND_TICKETLISTGUID, _id);
    ss << handler.PGetParseString(LANG_COMMAND_TICKETLISTNAME, handler.playerLink(_playerName).c_str());
    ss << handler.PGetParseString(LANG_COMMAND_TICKETLISTAGECREATE, (secsToTimeString(curTime - _createTime, true, false)).c_str());
    if (_lastModifiedTime != _createTime)
        ss << handler.PGetParseString(LANG_COMMAND_TICKETLISTAGE, (secsToTimeString(curTime - _lastModifiedTime, true, false)).c_str());

    std::string name;
    if (sObjectMgr.GetPlayerNameByGUID(_assignedTo, name))
        ss << handler.PGetParseString(LANG_COMMAND_TICKETLISTASSIGNEDTO, handler.playerLink(name).c_str());

    if (detailed)
    {
        ss << handler.PGetParseString(LANG_COMMAND_TICKETLISTMESSAGE, _message.c_str());
        if (!_comment.empty())
            ss << handler.PGetParseString(LANG_COMMAND_TICKETLISTCOMMENT, _comment.c_str());
        if (!_response.empty())
            ss << handler.PGetParseString(LANG_COMMAND_TICKETLISTRESPONSE, _response.c_str());
    }
    return ss.str();
}

std::string GmTicket::FormatMessageString(ChatHandler& handler, const char* szClosedName, const char* szAssignedToName, const char* szUnassignedName, const char* szDeletedName, const char* szCompletedName) const
{
    std::stringstream ss;
    ss << handler.PGetParseString(LANG_COMMAND_TICKETLISTGUID, _id);
    ss << handler.PGetParseString(LANG_COMMAND_TICKETLISTNAME, _playerName.c_str());
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

const char* GmTicket::GetTicketCategoryName(TicketType category) const
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

void GmTicket::SetUnassigned()
{
    _assignedTo.Clear();
    switch (_escalatedStatus)
    {
        case TICKET_ASSIGNED: _escalatedStatus = TICKET_UNASSIGNED; break;
        case TICKET_ESCALATED_ASSIGNED: _escalatedStatus = TICKET_IN_ESCALATION_QUEUE; break;
        case TICKET_UNASSIGNED:
        case TICKET_IN_ESCALATION_QUEUE:
        default:
            break;
    }
}

void GmTicket::SetPosition(uint32 mapId, float x, float y, float z)
{
    _mapId = mapId;
    _posX = x;
    _posY = y;
    _posZ = z;
}

void GmTicket::SetGmAction(uint32 needResponse, bool needMoreHelp)
{
    _needResponse = (needResponse == 17);   // Requires GM response. 17 = true, 1 = false (17 is default)
    _needMoreHelp = needMoreHelp;           // Requests further GM interaction on a ticket to which a GM has already responded. Basically means "has a new ticket"
}

void GmTicket::TeleportTo(Player* player) const
{
    player->TeleportTo(_mapId, _posX, _posY, _posZ, 0.0f, 0);
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

    _chatLog = newss.str();
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// Ticket manager
TicketMgr::TicketMgr() : _status(true), _lastTicketId(0), _lastSurveyId(0), _openTicketCount(0),
    _lastChange(time(NULL)) { }

TicketMgr::~TicketMgr()
{
    for (GmTicketList::const_iterator itr = _ticketList.begin(); itr != _ticketList.end(); ++itr)
        delete itr->second;
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

    CharacterDatabase.Execute("TRUNCATE TABLE gm_tickets");
}

#define TICKET_TABLE_FIELDS "ticketId, guid, name, message, createTime, mapId, posX, posY, posZ, lastModifiedTime, closedBy, assignedTo, comment, response, completed, escalated, viewed, haveTicket, ticketType, securityNeeded"

void TicketMgr::LoadTickets()
{
    uint32 oldMSTime = WorldTimer::getMSTime();

    for (GmTicketList::const_iterator itr = _ticketList.begin(); itr != _ticketList.end(); ++itr)
        delete itr->second;
    _ticketList.clear();

    _lastTicketId = 0;
    _openTicketCount = 0;

    QueryResult* result = CharacterDatabase.Query("SELECT " TICKET_TABLE_FIELDS " FROM gm_tickets");
    if (!result)
    {
        sLog.outString(">> Loaded 0 GM tickets. DB table `gm_ticket` is empty!");
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
    delete result;

    sLog.outString(">> Loaded %u GM tickets in %u ms", count, WorldTimer::getMSTimeDiffToNow(oldMSTime));
}

void TicketMgr::LoadSurveys()
{
    // we don't actually load anything into memory here as there's no reason to
    _lastSurveyId = 0;

    uint32 oldMSTime = WorldTimer::getMSTime();
    if (QueryResult* result = CharacterDatabase.Query("SELECT MAX(surveyId) FROM gm_surveys"))
    {
        _lastSurveyId = (*result)[0].GetUInt32();
        delete result;
    }

    sLog.outString(">> Loaded GM Survey count from database in %u ms", WorldTimer::getMSTimeDiffToNow(oldMSTime));
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
    for (GmTicketList::const_iterator itr = _ticketList.begin(); itr != _ticketList.end(); ++itr)
        if (!itr->second->IsClosed() && !itr->second->IsCompleted())
            if ((!onlineOnly || itr->second->GetPlayer()) && (!category || (itr->second->GetTicketType() == TicketType(category))))
                handler.SendSysMessage(itr->second->FormatMessageString(handler).c_str());
}

void TicketMgr::ShowClosedList(ChatHandler& handler) const
{
    handler.SendSysMessage(LANG_COMMAND_TICKETSHOWCLOSEDLIST);
    for (GmTicketList::const_iterator itr = _ticketList.begin(); itr != _ticketList.end(); ++itr)
        if (itr->second->IsClosed())
            handler.SendSysMessage(itr->second->FormatMessageString(handler).c_str());
}

void TicketMgr::ShowEscalatedList(ChatHandler& handler) const
{
    handler.SendSysMessage(LANG_COMMAND_TICKETSHOWESCALATEDLIST);
    for (GmTicketList::const_iterator itr = _ticketList.begin(); itr != _ticketList.end(); ++itr)
        if (!itr->second->IsClosed() && itr->second->GetEscalatedStatus() == TICKET_IN_ESCALATION_QUEUE)
            handler.PSendSysMessage(LANG_COMMAND_TICKETESCALATED_TICKET, itr->second->FormatMessageString(handler).c_str(), itr->second->GetNeededSecurityLevel());
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

void TicketMgr::ReloadTicketCallback(QueryResult* holder)
{
    if (!holder)
        return;
    GmTicket* newTicket = new GmTicket();
    newTicket->LoadFromDB(holder->Fetch());
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
            std::string msg = newTicket->FormatMessageString(handler, closedBy.empty() ? NULL : closedBy.c_str(), assignedTo.empty() ? NULL : assignedTo.c_str(), NULL, NULL, completedBy.empty() ? NULL : completedBy.c_str());
            sWorld.SendGMTicketText(msg.c_str());
        }
    }
    delete holder;
}

void TicketMgr::ReloadTicket(uint32 ticketId)
{
    if (_reloadTicketsSet.find(ticketId) != _reloadTicketsSet.end())
        return;
    _reloadTicketsSet.insert(ticketId);
    CharacterDatabase.AsyncPQueryUnsafe(this, &TicketMgr::ReloadTicketCallback, "SELECT " TICKET_TABLE_FIELDS " FROM gm_tickets WHERE ticketId = '%u'", ticketId);
}
