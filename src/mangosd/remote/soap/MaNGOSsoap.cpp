#include "MaNGOSsoap.h"
#include "stdsoap2.h"

#include "World.h"
#include "Log.h"
#include "AccountMgr.h"

#include "IO/Networking/IpAddress.h"
#include "IO/Multithreading/CreateThread.h"

class SOAPCommand
{
 public:
    /// Blocks until OnCommandFinished is called
    bool WaitAndGetSuccessStatus()
    {
        return m_successStatusPromise.get_future().get();
    }

    static void OnPrint(void* opaquePointer, char const* msg)
    {
        SOAPCommand* self = static_cast<SOAPCommand*>(opaquePointer);
        self->m_printBuffer += msg;
    }

    static void OnCommandFinished(void* opaquePointer, bool success)
    {
        SOAPCommand* self = static_cast<SOAPCommand*>(opaquePointer);
        self->m_successStatusPromise.set_value(success);
    }

    std::string m_printBuffer;
    std::promise<bool> m_successStatusPromise;
};

void SoapThreadBody(struct soap* soap)
{
    while (!World::IsStopped())
    {
        if (!soap_valid_socket(soap_accept(soap)))
            continue; // most likely, we ran into an accept timeout

        auto ip = IO::Networking::IpAddress::FromIpv4Uint32(soap->ip);
        sLog.Out(LOG_RA, LOG_LVL_BASIC, "MaNGOSsoap: Accepted connection from %s", ip.ToString().c_str());

        soap_serve(soap); // handle soap request
    }

    sLog.Out(LOG_RA, LOG_LVL_MINIMAL, "MaNGOSsoap: Stopping...");
    soap_end(soap);
    soap_done(soap);
    soap_destroy(soap);
}

std::unique_ptr<std::thread> StartSoapThread(std::string const& bindHost, uint16 bindPort)
{
    struct soap* soap = soap_new();
    soap_init(soap);
    soap_set_imode(soap, SOAP_C_UTFSTRING);
    soap_set_omode(soap, SOAP_C_UTFSTRING);

    soap->accept_timeout = 3; // sec | Check every 3 seconds if World::IsStopped()
    soap->recv_timeout = 5; // sec
    soap->send_timeout = 5; // sec

    int const acceptBacklogCount = 50;

    if (!soap_valid_socket(soap_bind(soap, bindHost.c_str(), bindPort, acceptBacklogCount)))
    {
        sLog.Out(LOG_RA, LOG_LVL_ERROR, "MaNGOSsoap: Couldn't bind to %s:%d", bindHost.c_str(), bindPort);
        soap_done(soap);
        soap_destroy(soap);
        return nullptr;
    }

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "MaNGOSsoap: Bound to http://%s:%d/", bindHost.c_str(), bindPort);

    return IO::Multithreading::CreateThreadPtr("SOAP", [soap]()
    { SoapThreadBody(soap); });
}

/// Defined by soap.stub
int ns1__executeCommand(soap* soap, char* command, char** result)
{
    // security check
    if (!soap->userid || !soap->passwd)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "MaNGOSsoap: Client didn't provide login information");
        return 401;
    }

    uint32 accountId = sAccountMgr.GetId(soap->userid);
    if (!accountId)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "MaNGOSsoap: Client used invalid username '%s'", soap->userid);
        return 401;
    }

    if (!sAccountMgr.CheckPassword(accountId, soap->passwd))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "MaNGOSsoap: invalid password for account '%s'", soap->userid);
        return 401;
    }

    if (sAccountMgr.GetSecurity(accountId) < SEC_ADMINISTRATOR)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "MaNGOSsoap: %s's gmlevel is too low", soap->userid);
        return 403;
    }

    if (!command || !*command)
        return soap_sender_fault(soap, "Parameter 'command' can not be empty", "The supplied command was an empty string");

    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "MaNGOSsoap: Received command '%s'", command);

    // Commands are executed in the world thread. We have to wait for them to be completed
    SOAPCommand commandHolder;
    {
        // CliCommandHolder will be deleted from world, accessing after queueing is NOT safe
        CliCommandHolder* cmd = new CliCommandHolder(accountId, SEC_CONSOLE, &commandHolder, command, &SOAPCommand::OnPrint, &SOAPCommand::OnCommandFinished);
        sWorld.QueueCliCommand(cmd);
    }

    // Wait for callback to complete command
    bool wasSuccessful = commandHolder.WaitAndGetSuccessStatus();

    char* printBuffer = soap_strdup(soap, commandHolder.m_printBuffer.c_str());
    if (!wasSuccessful)
        return soap_sender_fault(soap, printBuffer, printBuffer);

    *result = printBuffer;
    return SOAP_OK;
}

/// Namespace definition for gSOAP.
/// We must define this, because gSOAP is using it as an external symbol
struct Namespace namespaces[] =
    {{ "SOAP-ENV", "http://schemas.xmlsoap.org/soap/envelope/" }, // must be first
     { "SOAP-ENC", "http://schemas.xmlsoap.org/soap/encoding/" }, // must be second
     { "xsi", "http://www.w3.org/1999/XMLSchema-instance", "http://www.w3.org/*/XMLSchema-instance" },
     { "xsd", "http://www.w3.org/1999/XMLSchema", "http://www.w3.org/*/XMLSchema" },
     { "ns1", "urn:MaNGOS" },     // "ns1" namespace prefix
     { nullptr, nullptr }
    };
