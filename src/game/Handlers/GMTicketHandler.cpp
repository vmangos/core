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
#include "Language.h"
#include "WorldPacket.h"
#include "Log.h"
#include "GMTicketMgr.h"
#include "Player.h"
#include "Chat.h"
#include "World.h"
#include "Opcodes.h"

void WorldSession::HandleGMTicketGetTicketOpcode(NullClientPacket const& /*packet*/)
{
    SendQueryTimeResponse();

    if (GmTicket* ticket = sTicketMgr->GetTicketByPlayer(GetPlayer()->GetGUID()))
    {
        if (ticket->IsCompleted())
            ticket->SendResponse(this);
        else
            sTicketMgr->SendTicket(this, ticket);
    }
    else
        sTicketMgr->SendTicket(this, nullptr);
}

void WorldSession::HandleGMTicketUpdateTextOpcode(WorldPackets::GmTicket::GmTicketUpdateText const& packet)
{
    GMTicketResponse response = GMTICKET_RESPONSE_UPDATE_ERROR;
    if (GmTicket* ticket = sTicketMgr->GetTicketByPlayer(GetPlayer()->GetGUID()))
    {
        if (ticket->IsCompleted())
        {
            ChatHandler(this).SendSysMessage(LANG_GMTICKET_READONLY);
            sTicketMgr->SendTicket(this, ticket);
        }
        else
        {
            ticket->SetMessage(packet.ticketText);
            ticket->SetTicketType(TicketType(packet.type));
            ticket->SaveToDB();
            response = GMTICKET_RESPONSE_UPDATE_SUCCESS;

            sWorld.SendGMTicketText(LANG_COMMAND_TICKETUPDATED, GetPlayer()->GetName(), ticket->GetId());
        }
    }

    WorldPacket data(SMSG_GMTICKET_UPDATETEXT, 4);
    data << uint32(response);
    SendPacket(&data);
}

void WorldSession::HandleGMTicketDeleteTicketOpcode(NullClientPacket const& /*packet*/)
{
    if (GmTicket* ticket = sTicketMgr->GetTicketByPlayer(GetPlayer()->GetGUID()))
    {
        WorldPacket data(SMSG_GMTICKET_DELETETICKET, 4);
        data << uint32(GMTICKET_RESPONSE_TICKET_DELETED);
        SendPacket(&data);

        sWorld.SendGMTicketText(LANG_COMMAND_TICKETPLAYERABANDON, GetPlayer()->GetName(), ticket->GetId());

        sTicketMgr->CloseTicket(ticket->GetId(), GetPlayer()->GetGUID());
        sTicketMgr->SendTicket(this, nullptr);
    }
}

void WorldSession::HandleGMTicketCreateOpcode(WorldPackets::GmTicket::GmTicketCreate const& packet)
{
    // Don't accept tickets if the ticket queue is disabled. (Ticket UI is greyed out but not fully dependable)
    if (sTicketMgr->GetStatus() == GMTICKET_QUEUE_STATUS_DISABLED)
        return;

    GMTicketResponse response = GMTICKET_RESPONSE_CREATE_ERROR;
    GmTicket* ticket = sTicketMgr->GetTicketByPlayer(GetPlayer()->GetGUID());

    if (ticket && ticket->IsCompleted())
        sTicketMgr->CloseTicket(ticket->GetId(), GetPlayer()->GetGUID());

    // Player must not have ticket
    if (!ticket || ticket->IsClosed())
    {
        std::string message;
        std::string chatLog;

        if (GetPlayer()->GetLevel() < sWorld.getConfig(CONFIG_UINT32_GMTICKETS_MINLEVEL))
        {
            ChatHandler(this).PSendSysMessage("You can't use the ticket system before level %u", sWorld.getConfig(CONFIG_UINT32_GMTICKETS_MINLEVEL));
            return;
        }

        if (packet.ticketType >= GMTICKET_MAX)
            return;

        ticket = new GmTicket(GetPlayer());
        ticket->SetPosition(packet.mapId, packet.x, packet.y, packet.z);
        ticket->SetMessage(packet.ticketText);
        ticket->SetTicketType(packet.ticketType);

        sTicketMgr->AddTicket(ticket);
        sTicketMgr->UpdateLastChange();

        sWorld.SendGMTicketText(LANG_COMMAND_TICKETNEW, GetPlayer()->GetName(), ticket->GetTicketCategoryName(packet.ticketType), ticket->GetId());

        response = GMTICKET_RESPONSE_CREATE_SUCCESS;
    }

    WorldPacket data(SMSG_GMTICKET_CREATE, 4);
    data << uint32(response);
    SendPacket(&data);
}

void WorldSession::HandleGMTicketSystemStatusOpcode(NullClientPacket const& /*packet*/)
{
    // Note: This only disables the ticket UI at client side and is not fully reliable
    // are we sure this is a uint32? Should ask Zor
    WorldPacket data(SMSG_GMTICKET_SYSTEMSTATUS, 4);
    data << uint32(sTicketMgr->GetStatus() ? GMTICKET_QUEUE_STATUS_ENABLED : GMTICKET_QUEUE_STATUS_DISABLED);
    SendPacket(&data);
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
void WorldSession::HandleGMSurveySubmitOpcode(WorldPackets::GmTicket::GMSurveySubmit const& packet)
{
    uint32 nextSurveyID = sTicketMgr->GetNextSurveyID();

    std::set<uint32> surveyIds;
    for (auto const& sub : packet.subSurveys)
    {
        // make sure the same sub survey is not added to DB twice
        if (!surveyIds.insert(sub.subSurveyId).second)
            continue;

        static SqlStatementID insSubSurvey;
        SqlStatement stmt = CharacterDatabase.CreateStatement(insSubSurvey, "INSERT INTO `gm_subsurveys` (`survey_id`, `subsurvey_id`, `rank`, `comment`) VALUES (?, ?, ?, ?)");
        stmt.addUInt32(nextSurveyID);
        stmt.addUInt32(sub.subSurveyId);
        stmt.addUInt32(sub.rank);
        stmt.addString(sub.comment);
        stmt.Execute();
    }

    static SqlStatementID insSurvey;
    SqlStatement stmt = CharacterDatabase.CreateStatement(insSurvey, "INSERT INTO `gm_surveys` (`guid`, `survey_id`, `main_survey`, `overall_comment`, `create_time`) VALUES (?, ?, ?, ?, UNIX_TIMESTAMP(NOW()))");
    stmt.addUInt32(GetPlayer()->GetGUIDLow());
    stmt.addUInt32(nextSurveyID);
    stmt.addUInt32(packet.mainSurvey);
    stmt.addString(packet.comment);
    stmt.Execute();
}
#endif
