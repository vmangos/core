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

#include "MaNGOSsoap.h"

#define POOL_SIZE   5

void MaNGOSsoapRunnable::run()
{
    // create pool
    SOAPWorkingThread pool;
    pool.activate (THR_NEW_LWP | THR_JOINABLE, POOL_SIZE);

    struct soap soap;
    int m, s;
    soap_init(&soap);
    soap_set_imode(&soap, SOAP_C_UTFSTRING);
    soap_set_omode(&soap, SOAP_C_UTFSTRING);
    m = soap_bind(&soap, m_host.c_str(), m_port, 100);

    // check every 3 seconds if world ended
    soap.accept_timeout = 3;

    soap.recv_timeout = 5;
    soap.send_timeout = 5;
    if (m < 0)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "MaNGOSsoap: couldn't bind to %s:%d", m_host.c_str(), m_port);
        exit(-1);
    }

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "MaNGOSsoap: bound to http://%s:%d", m_host.c_str(), m_port);

    while(!World::IsStopped())
    {
        s = soap_accept(&soap);

        if (s < 0)
        {
            // ran into an accept timeout
            continue;
        }

        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "MaNGOSsoap: accepted connection from IP=%d.%d.%d.%d", (int)(soap.ip>>24)&0xFF, (int)(soap.ip>>16)&0xFF, (int)(soap.ip>>8)&0xFF, (int)soap.ip&0xFF);
        struct soap* thread_soap = soap_copy(&soap);// make a safe copy

        ACE_Message_Block *mb = new ACE_Message_Block(sizeof(struct soap*));
        ACE_OS::memcpy(mb->wr_ptr (), &thread_soap, sizeof(struct soap*));
        pool.putq(mb);
    }
    pool.msg_queue ()->deactivate ();
    pool.wait ();

    soap_done(&soap);
}

void SOAPWorkingThread::process_message (ACE_Message_Block *mb)
{
    ACE_TRACE (ACE_TEXT ("SOAPWorkingThread::process_message"));

    soap* thread_soap; // local copy of the soap instance for handling this message
    ACE_OS::memcpy(&thread_soap, mb->rd_ptr(), sizeof(soap*));
    mb->release();

    soap_serve(thread_soap); // handle request

    soap_free(thread_soap); // calls done() and clear/frees everything else
}

/*
Code used for generating stubs:

int ns1__executeCommand(char* command, char** result);
*/
int ns1__executeCommand(soap* soap, char* command, char** result)
{
    // security check
    if (!soap->userid || !soap->passwd)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "MaNGOSsoap: Client didn't provide login information");
        return 401;
    }

    uint32 accountId = sAccountMgr.GetId(soap->userid);
    if(!accountId)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "MaNGOSsoap: Client used invalid username '%s'", soap->userid);
        return 401;
    }

    if(!sAccountMgr.CheckPassword(accountId, soap->passwd))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "MaNGOSsoap: invalid password for account '%s'", soap->userid);
        return 401;
    }

    if(sAccountMgr.GetSecurity(accountId) < SEC_ADMINISTRATOR)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "MaNGOSsoap: %s's gmlevel is too low", soap->userid);
        return 403;
    }

    if(!command || !*command)
        return soap_sender_fault(soap, "Command mustn't be empty", "The supplied command was an empty string");

    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "MaNGOSsoap: got command '%s'", command);
    SOAPCommand connection;

    // commands are executed in the world thread. We have to wait for them to be completed
    {
        // CliCommandHolder will be deleted from world, accessing after queueing is NOT save
        CliCommandHolder* cmd = new CliCommandHolder(accountId, SEC_CONSOLE, &connection, command, &SOAPCommand::print, &SOAPCommand::commandFinished);
        sWorld.QueueCliCommand(cmd);
    }

    // wait for callback to complete command

    int acc = connection.pendingCommands.acquire();
    if(acc)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "MaNGOSsoap: Error while acquiring lock, acc = %i, errno = %u", acc, errno);
    }

    // alright, command finished

    char* printBuffer = soap_strdup(soap, connection.m_printBuffer.c_str());
    if(connection.hasCommandSucceeded())
    {
        *result = printBuffer;
        return SOAP_OK;
    }
    else
        return soap_sender_fault(soap, printBuffer, printBuffer);
}


void SOAPCommand::commandFinished(void* soapconnection, bool success)
{
    SOAPCommand* con = (SOAPCommand*)soapconnection;
    con->setCommandSuccess(success);
    con->pendingCommands.release();
}

////////////////////////////////////////////////////////////////////////////////
//
//  Namespace Definition Table
//
////////////////////////////////////////////////////////////////////////////////

struct Namespace namespaces[] =
{ { "SOAP-ENV", "http://schemas.xmlsoap.org/soap/envelope/" }, // must be first
  { "SOAP-ENC", "http://schemas.xmlsoap.org/soap/encoding/" }, // must be second
  { "xsi", "http://www.w3.org/1999/XMLSchema-instance", "http://www.w3.org/*/XMLSchema-instance" },
  { "xsd", "http://www.w3.org/1999/XMLSchema",          "http://www.w3.org/*/XMLSchema" },
  { "ns1", "urn:MaNGOS" },     // "ns1" namespace prefix
  { nullptr, nullptr }
};
