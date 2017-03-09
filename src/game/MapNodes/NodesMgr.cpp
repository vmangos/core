#include "Config/Config.h"
#include "Log.h"

#include "NodesMgr.h"
#include "NodeSession.h"
#include "NodesOpcodes.h"
#include "MapSocket.h"
#include "MapSocketMgr.h"

bool NodesMgr::OnServerStartup()
{
    sNodesOpcodes->BuildOpcodeList();
    m_serverName = sConfig.GetStringDefault("ServerName", "<Unnamed>");
    int nodesListenPort = sConfig.GetIntDefault("NodesListenPort", 0);
    m_masterListenPort = sConfig.GetIntDefault("MasterListenPort", 0);
    m_nodeIdx = 0;

    // Node system disabled.
    if (!nodesListenPort && !m_masterListenPort)
        return true;

    std::string nodesListenAddress = sConfig.GetStringDefault("NodesListenAddress", "127.0.0.1");
    m_masterListenAddress = sConfig.GetStringDefault("MasterListenAddress", "127.0.0.1");

    // Start Maps sockets - if needed
    sMapSocketMgr->SetOutKBuff(sConfig.GetIntDefault("NodesNetwork.OutKBuff", -1));
    sMapSocketMgr->SetOutUBuff(sConfig.GetIntDefault("NodesNetwork.OutUBuff", 65536));
    sMapSocketMgr->SetThreads(sConfig.GetIntDefault("NodesNetwork.Threads", 1) + 1);
    sMapSocketMgr->SetTcpNodelay(sConfig.GetBoolDefault("NodesNetwork.TcpNodelay", true));

    const char* listenStatus = "";
    const char* masterStatus = "";
    bool retValue = true;

    if (nodesListenPort)
    {
        if (sMapSocketMgr->StartNetwork(nodesListenPort, nodesListenAddress) == -1)
        {
            retValue = false;
            listenStatus = "[FAIL]";
        }
        else
            listenStatus = "[OK]";
    }

    if (m_masterListenPort)
    {
        if (TryConnectToMaster())
            masterStatus = "[OK]";
        else
            masterStatus = "[FAIL]"; // Will try again in chain to connect to Master
    }
    sLog.outString("##########################################################");
    sLog.outString("# Maps clustering enabled.                               #");
    sLog.outString("#   Listen on: %20s:%5u        %6s  #", nodesListenAddress.c_str(), nodesListenPort, listenStatus);
    sLog.outString("#   Master   : %20s:%5u        %6s  #", m_masterListenAddress.c_str(), m_masterListenPort, masterStatus);
    sLog.outString("#                                  Nostalrius Begins     #");
    sLog.outString("##########################################################");

    return retValue;
}

bool NodesMgr::TryConnectToMaster()
{
    MapSocket* s = NULL;
    if (sMapSocketMgr->Connect(m_masterListenPort, m_masterListenAddress, s) == -1)
        return false;

    // Register Node -> Master session here
    NodeSession* sess = new NodeSession(s);
    s->SetSession(sess);
    return true;
}

void NodesMgr::OnServerShutdown()
{
    sMapSocketMgr->StopNetwork();
}

void NodesMgr::OnWorldUpdate(uint32 diff)
{
    bool hasMaster = false;
    for (NodesMap::iterator it = m_nodes.begin(); it != m_nodes.end();)
    {
        NodesMap::iterator itNext = it;
        ++itNext;
        it->second->UnsafeUpdate(diff); // TODO: We can do it asynchronously
        if (it->second->IsConnectedToMaster())
            hasMaster = true;
        if (!it->second->SafeUpdate(diff))
        {
            it->second->Close();
            m_nodes.erase(it);
        }
        it = itNext;
    }
    if (m_masterListenPort && !hasMaster)
    {
        sLog.outString("[Clustering:%s] Lost Master! Trying to reconnect to Master ...", m_serverName.c_str());
        TryConnectToMaster();
    }
}

NodeSession* NodesMgr::GetNodeById(uint32 id)
{
    NodesMap::iterator it = m_nodes.find(id);
    if (it == m_nodes.end())
        return NULL;
    return it->second;
}
