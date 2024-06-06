/*
 * Copyright (C) 2008-2015 TrinityCore <http://www.trinitycore.org/>
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

#ifndef _TICKETMGR_H
#define _TICKETMGR_H

#include "SharedDefines.h"
#include "ObjectGuid.h"
#include <string>

class Player;
class ChatHandler;
class Field;
class QueryResult;
class WorldPacket;
class WorldSession;

// from blizzard lua
enum GMTicketSystemStatus
{
    GMTICKET_QUEUE_STATUS_DISABLED = 0,
    GMTICKET_QUEUE_STATUS_ENABLED  = 1
};

enum GMTicketStatus
{
    GMTICKET_STATUS_HASTEXT                      = 0x06,
    GMTICKET_STATUS_DEFAULT                      = 0x0A
};

enum GMTicketResponse
{
    GMTICKET_RESPONSE_ALREADY_EXIST               = 1,
    GMTICKET_RESPONSE_CREATE_SUCCESS              = 2,
    GMTICKET_RESPONSE_CREATE_ERROR                = 3,
    GMTICKET_RESPONSE_UPDATE_SUCCESS              = 4,
    GMTICKET_RESPONSE_UPDATE_ERROR                = 5,
    GMTICKET_RESPONSE_TICKET_DELETED              = 9
};

// from Blizzard LUA:
// GMTICKET_ASSIGNEDTOGM_STATUS_NOT_ASSIGNED = 0;    -- ticket is not currently assigned to a gm
// GMTICKET_ASSIGNEDTOGM_STATUS_ASSIGNED = 1;        -- ticket is assigned to a normal gm
// GMTICKET_ASSIGNEDTOGM_STATUS_ESCALATED = 2;        -- ticket is in the escalation queue
// 3 is a custom value and should never actually be sent
enum GMTicketEscalationStatus
{
    TICKET_UNASSIGNED                             = 0,
    TICKET_ASSIGNED                               = 1,
    TICKET_IN_ESCALATION_QUEUE                    = 2,
    TICKET_ESCALATED_ASSIGNED                     = 3
};

// from blizzard lua
enum GMTicketOpenedByGMStatus
{
    GMTICKET_OPENEDBYGM_STATUS_NOT_OPENED = 0,      // ticket has never been opened by a gm
    GMTICKET_OPENEDBYGM_STATUS_OPENED     = 1       // ticket has been opened by a gm
};

enum LagReportType
{
    LAG_REPORT_TYPE_LOOT = 1,
    LAG_REPORT_TYPE_AUCTION_HOUSE = 2,
    LAG_REPORT_TYPE_MAIL = 3,
    LAG_REPORT_TYPE_CHAT = 4,
    LAG_REPORT_TYPE_MOVEMENT = 5,
    LAG_REPORT_TYPE_SPELL = 6
};

class GmTicket
{
public:
    GmTicket();
    GmTicket(Player* player);
    ~GmTicket();

    bool IsClosed() const { return !m_closedBy.IsEmpty(); }
    bool IsCompleted() const { return m_completed; }
    bool IsFromPlayer(ObjectGuid guid) const { return guid == m_playerGuid; }
    bool IsAssigned() const { return !m_assignedTo.IsEmpty(); }
    bool IsAssignedTo(ObjectGuid guid) const { return guid == m_assignedTo; }
    bool IsAssignedNotTo(ObjectGuid guid) const { return IsAssigned() && !IsAssignedTo(guid); }

    uint32 GetId() const { return m_id; }
    Player* GetPlayer() const;
    std::string const& GetPlayerName() const { return m_playerName; }
    std::string const& GetMessage() const { return m_message; }
    Player* GetAssignedPlayer() const;
    ObjectGuid GetAssignedToGUID() const { return m_assignedTo; }
    std::string GetAssignedToName() const;
    uint64 GetLastModifiedTime() const { return m_lastModifiedTime; }
    GMTicketEscalationStatus GetEscalatedStatus() const { return m_escalatedStatus; }

    void SetEscalatedStatus(GMTicketEscalationStatus escalatedStatus) { m_escalatedStatus = escalatedStatus; }
    void SetAssignedTo(ObjectGuid guid, bool isAdmin)
    {
        m_assignedTo = guid;
        if (isAdmin && m_escalatedStatus == TICKET_IN_ESCALATION_QUEUE)
            m_escalatedStatus = TICKET_ESCALATED_ASSIGNED;
        else if (m_escalatedStatus == TICKET_UNASSIGNED)
            m_escalatedStatus = TICKET_ASSIGNED;
    }
    void SetClosedBy(ObjectGuid value) { m_closedBy = value; }
    void SetCompleted() { m_completed = true; }
    void SetMessage(std::string const& message)
    {
        m_message = message;
        m_lastModifiedTime = uint64(time(nullptr));
    }
    void SetComment(std::string const& comment) { m_comment = comment; }
    void SetViewed() { m_viewed = true; }
    void SetUnassigned();
    void SetPosition(uint32 mapId, float x, float y, float z);
    void SetGmAction(uint32 needResponse, bool needMoreHelp);

    void AppendResponse(std::string const& response) { m_response += response; }
    void ResetResponse() { m_response.clear(); }

    bool LoadFromDB(Field* fields);
    void SaveToDB() const;
    void DeleteFromDB();

    void WritePacket(WorldPacket& data) const;
    void SendResponse(WorldSession* session) const;

    void TeleportTo(Player* player) const;
    std::string FormatMessageString(ChatHandler& handler, bool detailed = false) const;
    std::string FormatMessageString(ChatHandler& handler, char const* szClosedName, char const* szAssignedToName, char const* szUnassignedName, char const* szDeletedName, char const* szCompletedName) const;
    char const* GetTicketCategoryName(TicketType category) const;

    void SetChatLog(std::list<uint32> time, std::string const& log);
    std::string const& GetChatLog() const { return m_chatLog; }

    TicketType GetTicketType() const { return m_ticketType; }
    void SetTicketType(TicketType type) { m_ticketType = type; }

    void SetNeededSecurityLevel(uint8 sec) { m_securityNeeded = sec; }
    uint8 GetNeededSecurityLevel() const { return m_securityNeeded; }
private:
    uint32 m_id = 0;
    ObjectGuid m_playerGuid;
    std::string m_playerName;
    float m_posX = 0.0f;
    float m_posY = 0.0f;
    float m_posZ = 0.0f;
    uint16 m_mapId = 0;
    std::string m_message;
    uint64 m_createTime = 0;
    uint64 m_lastModifiedTime = 0;
    ObjectGuid m_closedBy; // 0 = Open, -1 = Console, playerGuid = player abandoned ticket, other = GM who closed it.
    ObjectGuid m_assignedTo;
    std::string m_comment;
    bool m_completed = false;
    GMTicketEscalationStatus m_escalatedStatus;
    bool m_viewed = false;
    bool m_needResponse = false; // @todo find out the use of this, and then store it in DB
    bool m_needMoreHelp = false;
    uint8 m_securityNeeded = 0;
    TicketType m_ticketType;
    std::string m_response;
    std::string m_chatLog; // No need to store in db, will be refreshed every session client side
};
typedef std::map<uint32, GmTicket*> GmTicketList;

class TicketMgr
{
private:
    TicketMgr();
    ~TicketMgr();

public:
    static TicketMgr* instance()
    {
        static TicketMgr instance;
        return &instance;
    }

    void LoadTickets();
    void LoadSurveys();

    GmTicket* GetTicket(uint32 ticketId)
    {
        GmTicketList::iterator itr = _ticketList.find(ticketId);
        if (itr != _ticketList.end())
            return itr->second;

        return nullptr;
    }

    GmTicket* GetTicketByPlayer(ObjectGuid playerGuid)
    {
        for (const auto& itr : _ticketList)
            if (itr.second && itr.second->IsFromPlayer(playerGuid) && !itr.second->IsClosed())
                return itr.second;

        return nullptr;
    }

    GmTicket* GetOldestOpenTicket()
    {
        for (const auto& itr : _ticketList)
            if (itr.second && !itr.second->IsClosed() && !itr.second->IsCompleted())
                return itr.second;

        return nullptr;
    }

    GmTicket* GetNextTicket(uint32 counter)
    {
        for (const auto& itr : _ticketList)
            if (itr.first > counter && !itr.second->IsClosed() && !itr.second->IsCompleted())
                return itr.second;

        return nullptr;
    }

    GmTicket* GetPreviousTicket(uint32 counter)
    {
        for (GmTicketList::const_reverse_iterator itr = _ticketList.rbegin(); itr != _ticketList.rend(); ++itr)
            if (itr->first < counter && !itr->second->IsClosed() && !itr->second->IsCompleted())
                return itr->second;

        return nullptr;
    }

    void AddTicket(GmTicket* ticket);
    void CloseTicket(uint32 ticketId, ObjectGuid source);
    void RemoveTicket(uint32 ticketId);

    bool GetStatus() const { return _status; }
    void SetStatus(bool status) { _status = status; }

    uint64 GetLastChange() const { return _lastChange; }
    void UpdateLastChange() { _lastChange = uint64(time(nullptr)); }

    uint32 GetLastTicketId() const { return _lastTicketId; }
    uint32 GenerateTicketId() { return ++_lastTicketId; }
    uint32 GetOpenTicketCount() const { return _openTicketCount; }
    uint32 GetNextSurveyID() { return ++_lastSurveyId; }

    void Initialize();
    void ResetTickets();

    void ShowList(ChatHandler& handler, bool onlineOnly, uint8 category = 0) const;
    void ShowClosedList(ChatHandler& handler) const;
    void ShowEscalatedList(ChatHandler& handler) const;

    void SendTicket(WorldSession* session, GmTicket* ticket) const;
    void ReloadTicket(uint32 ticketId);
    void ReloadTicketCallback(std::unique_ptr<QueryResult> result);

protected:
    GmTicketList _ticketList;

    bool   _status;
    uint32 _lastTicketId;
    uint32 _lastSurveyId;
    uint32 _openTicketCount;
    uint64 _lastChange;
    std::set<uint32> _reloadTicketsSet;
};

#define sTicketMgr TicketMgr::instance()

#endif // _TICKETMGR_H
